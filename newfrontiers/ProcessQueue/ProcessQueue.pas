unit ProcessQueue;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IBX.IBDatabase, ExtCtrls, IBX.IBQuery;

type
  TQueueEvent = procedure(Sender: TObject; Process: integer; Params: string) of object;

  TEventPriority = integer;
  TEventProcess = integer;
  TEventSpecific = char;

type
  TProcessQueue = class(TComponent)
    private
      FRestartDelay: integer;
      FInterbaseDB: TIBDatabase;
      FActive: boolean;
      FEventRunning: boolean;

      FOnQueueEvent: TQueueEvent;

      CheckTimer: TTimer;

      IBT_Queue: TIBTransaction;
      IBQ_Select: TIBQuery;
      IBQ_Write: TIBQuery;

      procedure SetActive(value: boolean);
      function NextEvent: boolean;
      procedure SetInterbaseDB(value: TIBDatabase);
      procedure CheckTimerTimer(Sender: TObject);
      procedure SetRestartDelay(value: integer);
      { Private-Deklarationen }
    protected
      { Protected-Deklarationen }
    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;

      procedure AddEvent(EventPriority: TEventPriority; EventProcess: TEventProcess; EventSpecific: TEventSpecific;
        EventParams: string);
      function CheckEvent(EventProcess: TEventProcess): integer;
      function GetTopEvent(var EventID: integer; var EventProcess: TEventProcess; var EventParams: string): boolean;
      function GetEventByID(EventID: integer; var EventPriority: TEventPriority; var EventProcess: TEventProcess;
        var EventParams: string): boolean;
      procedure DelEvent(EventID: integer);
      function EventsLeft: integer;
      procedure ClearQueue;
      procedure ValidateQueue;
      procedure Check;

      function PriorityNow: TEventSpecific;

      property EventRunning: boolean read FEventRunning;
      { Public-Deklarationen }
    published
      property InterbaseDB: TIBDatabase read FInterbaseDB write SetInterbaseDB;
      property Active: boolean read FActive write SetActive default false;
      property RestartDelay: integer read FRestartDelay write SetRestartDelay;

      property OnQeueEvent: TQueueEvent read FOnQueueEvent write FOnQueueEvent;
      { Published-Deklarationen }
  end;

const
  prWaitForNone = 99;
  prUltraHigh = 90;
  prVeryHigh = 60;
  prHigh = 50;
  prStandard = 40;
  prLow = 30;
  prVeryLow = 10;
  prWaitForAll = 1;

  spNight = 'N';
  spDay = 'D';
  spAnytime = 'A';

procedure Register;

implementation


procedure Register;
begin
  RegisterComponents('ASS', [TProcessQueue]);
end;

constructor TProcessQueue.Create(AOwner: TComponent);
begin
  inherited;
  IBT_Queue := TIBTransaction.Create(self);
  IBQ_Select := TIBQuery.Create(self);
  IBQ_Write := TIBQuery.Create(self);
  CheckTimer := TTimer.Create(self);

  IBT_Queue.DefaultDatabase := FInterbaseDB;

  IBQ_Write.Database := FInterbaseDB;
  IBQ_Write.Transaction := IBT_Queue;

  IBQ_Select.Database := FInterbaseDB;
  IBQ_Select.Transaction := IBT_Queue;

  CheckTimer.Interval := 1000;
  //CheckTimer.Enabled := FActive;
  CheckTimer.Enabled := true;
  CheckTimer.OnTimer := CheckTimerTimer;

end;

destructor TProcessQueue.Destroy;
begin
  IBQ_Write.Free;
  IBQ_Select.Free;
  IBT_Queue.Free;
  CheckTimer.Free;
  inherited;
end;

procedure TProcessQueue.CheckTimerTimer(Sender: TObject);
begin
  if not FActive then
    exit;
  CheckTimer.Enabled := false;
  try
    CheckTimer.Tag := CheckTimer.Tag + 1;

    // In der Funktion NextEvent wird die Anforderung auch ausgeführt

    if NextEvent then
      CheckTimer.Interval := 10
    else
      CheckTimer.Interval := FRestartDelay;

    if CheckTimer.Tag > ((6 * 3600 * 1000) div FRestartDelay) then
      ValidateQueue;

  finally
    CheckTimer.Enabled := Active;
  end;
end;

procedure TProcessQueue.SetRestartDelay(value: integer);
begin
  //CheckTimer.Enabled := false;
  CheckTimer.Interval := value;
  //CheckTimer.Enabled := FActive;
  FRestartDelay := value;
end;

procedure TProcessQueue.SetInterbaseDB(value: TIBDatabase);
begin
  IBT_Queue.DefaultDatabase := value;
  IBQ_Select.Database := value;
  IBQ_Select.Transaction := IBT_Queue;
  IBQ_Write.Database := value;
  IBQ_Write.Transaction := IBT_Queue;
  FInterbaseDB := value;
end;

procedure TProcessQueue.SetActive(value: boolean);
begin
  //CheckTimer.Enabled := value;
  FActive := value;
end;

function TProcessQueue.NextEvent: boolean;
var
  ID: integer;
  Process: integer;
  Params: string;
begin

  // Gibt zurück, ob es noch weitere Events gibt
  result := false;

  FEventRunning := true;
  try
    if Assigned(FOnQueueEvent) then
    begin
      if not(self.ComponentState = [csDesigning]) then
      begin

        // VAR-Parameter für GetTopEvent
        ID := 0;
        Process := 0;
        Params := '';

        result := GetTopEvent(ID, Process, Params);

        if Process <> 0 then
        begin
          FOnQueueEvent(self, Process, Params);
        end;

        if ID > 0 then
          DelEvent(ID);
      end;
    end;
  finally
    FEventRunning := false;
  end;
end;

procedure TProcessQueue.AddEvent(EventPriority: TEventPriority; EventProcess: TEventProcess;
  EventSpecific: TEventSpecific; EventParams: string);
begin
  if CheckEvent(EventProcess) <> 0 then
  begin
    exit;
  end;

  IBT_Queue.StartTransaction;

  IBQ_Write.SQL.Clear;
  IBQ_Write.SQL.Add('INSERT INTO PROCESSQUEUE (');
  IBQ_Write.SQL.Add('PQ_ID, PQ_PRIORITY, PQ_TIME, PQ_PROCESS, PQ_SPECIFIC, PQ_PARAMS');
  IBQ_Write.SQL.Add(') VALUES (');
  IBQ_Write.SQL.Add('GEN_ID(PQ_ID,1), :PQ_PRIORITY, "NOW", :PQ_PROCESS, :PQ_SPECIFIC, :PQ_PARAMS');
  IBQ_Write.SQL.Add(')');

  IBQ_Write.ParamByName('PQ_PRIORITY').AsInteger := EventPriority;
  IBQ_Write.ParamByName('PQ_PROCESS').AsInteger := EventProcess;
  IBQ_Write.ParamByName('PQ_SPECIFIC').AsString := EventSpecific;
  IBQ_Write.ParamByName('PQ_PARAMS').AsString := EventParams;
  IBQ_Write.ExecSQL;

  IBT_Queue.Commit;
end;

procedure TProcessQueue.Check;
begin
  CheckTimerTimer(self);
end;

function TProcessQueue.CheckEvent(EventProcess: TEventProcess): integer;
begin
  result := 0;
  IBT_Queue.StartTransaction;

  IBQ_Select.SQL.Clear;
  IBQ_Select.SQL.Add
    ('SELECT * FROM PROCESSQUEUE WHERE PQ_PROCESS = :PQ_PROCESS ORDER BY PQ_PRIORITY DESCENDING, PQ_TIME');
  IBQ_Select.ParamByName('PQ_PROCESS').AsInteger := EventProcess;
  IBQ_Select.Open;

  if not IBQ_Select.Eof then
    result := IBQ_Select.FieldByName('PQ_ID').AsInteger;

  IBQ_Select.Close;

  IBT_Queue.Commit;
end;

function TProcessQueue.GetTopEvent(var EventID: integer; var EventProcess: TEventProcess;
  var EventParams: string): boolean;
begin

  // Gibt zurück ob es noch weitere gibt

  IBT_Queue.StartTransaction;

  IBQ_Select.SQL.Clear;
  IBQ_Select.SQL.Add('SELECT FIRST 2 * FROM PROCESSQUEUE');
  IBQ_Select.SQL.Add('WHERE PQ_SPECIFIC = "' + PriorityNow + '"');
  IBQ_Select.SQL.Add('OR PQ_SPECIFIC = "A"');
  IBQ_Select.SQL.Add('ORDER BY PQ_PRIORITY DESCENDING, PQ_TIME, PQ_ID');
  IBQ_Select.Open;
  IBQ_Select.FetchAll;

  EventID := IBQ_Select.FieldByName('PQ_ID').AsInteger;
  EventProcess := IBQ_Select.FieldByName('PQ_PROCESS').AsInteger;
  EventParams := IBQ_Select.FieldByName('PQ_PARAMS').AsString;

  result := IBQ_Select.RecordCount > 1;

  IBQ_Select.Close;

  IBT_Queue.Commit;
end;

function TProcessQueue.GetEventByID(EventID: integer; var EventPriority: TEventPriority;
  var EventProcess: TEventProcess; var EventParams: string): boolean;
begin
  IBT_Queue.StartTransaction;

  IBQ_Select.SQL.Clear;
  IBQ_Select.SQL.Add('SELECT * FROM PROCESSQUEUE WHERE PQ_ID = :PQ_ID');
  IBQ_Select.ParamByName('PQ_ID').AsInteger := EventID;
  IBQ_Select.Open;

  if not IBQ_Select.Eof then
  begin
    result := true;
    EventPriority := IBQ_Select.FieldByName('PQ_PRIORITY').AsInteger;
    EventProcess := IBQ_Select.FieldByName('PQ_PROCESS').AsInteger;
    EventParams := IBQ_Select.FieldByName('PQ_PARAMS').AsString;
  end
  else
  begin
    result := false;
    EventPriority := 0;
    EventProcess := 0;
    EventParams := '';
  end;

  IBQ_Select.Close;

  IBT_Queue.Commit;
end;

procedure TProcessQueue.DelEvent(EventID: integer);
begin
  IBT_Queue.StartTransaction;

  IBQ_Write.SQL.Clear;
  IBQ_Write.SQL.Add('DELETE FROM PROCESSQUEUE WHERE PQ_ID = :PQ_ID');
  IBQ_Write.ParamByName('PQ_ID').AsInteger := EventID;
  IBQ_Write.ExecSQL;

  IBT_Queue.Commit;
end;

function TProcessQueue.EventsLeft: integer;
begin

  IBT_Queue.StartTransaction;

  IBQ_Select.SQL.Clear;
  IBQ_Select.SQL.Add('SELECT COUNT(*) EVENTSLEFT FROM PROCESSQUEUE');
  IBQ_Select.SQL.Add('WHERE PQ_SPECIFIC = "' + PriorityNow + '"');
  IBQ_Select.SQL.Add('OR PQ_SPECIFIC = "A"');

  IBQ_Select.Open;

  result := IBQ_Select.FieldByName('EVENTSLEFT').AsInteger;

  IBQ_Select.Close;

  IBT_Queue.Commit;

end;

procedure TProcessQueue.ClearQueue;
begin

  IBT_Queue.StartTransaction;

  IBQ_Write.SQL.Clear;
  IBQ_Write.SQL.Add('DELETE FROM PROCESSQUEUE');
  IBQ_Write.ExecSQL;

  IBT_Queue.Commit;

end;

function TProcessQueue.PriorityNow: TEventSpecific;
var
  TN, TS, TE: TDateTime;
begin

  TN := time;
  TS := StrToTime('06:00:00');
  TE := StrToTime('22:00:00');

  if (TS < TN) and (TN < TE) then
    result := spDay
  else
    result := spNight;

end;

procedure TProcessQueue.ValidateQueue;
begin

  // In dieser Methode werden alle Einträge gelöscht, die älter als zwei
  // Tage sind.

  // Der Sinn ist mir nicht wirklich klar. Die Methode wird aufgerufen, nachdem
  // Prozesse ausgeführt wurden. Sollte also immer leer sein. (abgesehen von Nacht-Prozessen)

  IBT_Queue.StartTransaction;

  IBQ_Write.SQL.Clear;
  IBQ_Write.SQL.Add('DELETE FROM PROCESSQUEUE WHERE PQ_TIME < ("NOW" - 2)');
  IBQ_Write.ExecSQL;

  IBT_Queue.Commit;

end;

end.
