unit ExecOnTime;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls;

type
  TExecOnTime = class(TComponent)
  private
    CheckTimer : TTimer;
    FDayTimeHour : word;
    FDayTimeMinute : word;
    FOnDayTimeExecute : TNotifyEvent;
    FActive : boolean;

    NextTrigger : TDateTime;

    procedure TimeCheck(Sender : TObject);
    procedure SetActive(value : boolean);

    procedure NewTrigger;
    { Private-Deklarationen }
  protected
    { Protected-Deklarationen }
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    procedure ForceTimeCheck;
    { Public-Deklarationen }
  published
    property DayTimeHour : word read FDayTimeHour write FDayTimeHour;
    property DayTimeMinute : word read FDayTimeMinute write FDayTimeMinute;
    property Active : boolean read FActive write SetActive;

    property OnDayTimeExecute : TNotifyEvent read FOnDayTimeExecute write FOnDayTimeExecute;
    { Published-Deklarationen }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('ASS', [TExecOnTime]);
end;


constructor TExecOnTime.Create(AOwner : TComponent);
begin
  inherited;

  CheckTimer := TTimer.Create(self);

  with CheckTimer do
    begin
      Interval := 500;
      Enabled := FActive;
      OnTimer := TimeCheck;
    end;

end;

destructor TExecOnTime.Destroy;
begin

  FreeandNil(CheckTimer);

  inherited;
  
end;


procedure TExecOnTime.ForceTimeCheck;
begin

  TimeCheck(self);

end;

procedure TExecOnTime.NewTrigger;
begin

  NextTrigger := Date + EncodeTime(DayTimeHour, DayTimeMinute, 0, 0);

  if NextTrigger < now then
    NextTrigger := NextTrigger + 1;

end;

procedure TExecOnTime.SetActive(value : boolean);
begin

  CheckTimer.Enabled := value;
  FActive := value;

  if Value then NewTrigger;

end;

procedure TExecOnTime.TimeCheck(Sender : TObject);
begin
    if (not (Self.ComponentState = [csDesigning])) and Assigned(FOnDayTimeExecute) then
      begin

        if (NextTrigger < now) and FActive then
          begin
            FOnDayTimeExecute(self);
            NewTrigger;
          end;

      end;
end;


end.
