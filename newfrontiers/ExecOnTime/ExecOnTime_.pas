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
    _Interval: Cardinal;

    _NextTrigger : TDateTime;

    procedure TimeCheck(Sender : TObject);
    procedure SetActive(value : boolean);

    procedure NewTrigger;
    procedure setInterval(const Value: Cardinal);
    function MillisecondToTimeStr(aValue: Cardinal): string;
    function MillisecondToDateTime(aValue: Cardinal): TDateTime;
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
    property Interval: Cardinal read _Interval write setInterval;
    property NextTrigger: TDateTime read _NextTrigger;

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
      Interval := 1000;
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

function TExecOnTime.MillisecondToDateTime(aValue: Cardinal): TDateTime;
var
  Timestr: String;
begin
  TimeStr := MillisecondToTimeStr(aValue);
  Result := StrToTime(TimeStr);
end;

function TExecOnTime.MillisecondToTimeStr(aValue: Cardinal): string;
var
  Milli: Integer;
  sMilli: string;
begin
  Milli := aValue mod 1000;

  if Milli > 99 then
    sMilli := ':' + IntToSTr(Milli)
  else
    if (Milli > 9) and (Milli < 100) then
      sMilli := ':0' + IntToSTr(Milli)
    else
        sMilli := ':00' + IntToSTr(Milli);

  aValue := aValue div 1000; // -> seconds
  result := IntToStr(aValue mod 60);
  case aValue mod 60 < 10 of
    true: result := '0' + result;
  end;
  Result := Result + sMilli;
  aValue := aValue div 60; //minutes
  result := IntToStr(aValue mod 60) + ':' + result;
  case aValue mod 60 < 10 of
    true: result := '0' + result;
  end;
  aValue := aValue div 60; //hours
  result := IntToStr(aValue mod 24) + ':' + result;
  case aValue mod 60 < 10 of
    true: result := '0' + result;
  end;
end;

procedure TExecOnTime.NewTrigger;
begin

  _NextTrigger := Date + EncodeTime(DayTimeHour, DayTimeMinute, 0, 0);

  if _NextTrigger < now then
    _NextTrigger := _NextTrigger + 1;

end;

procedure TExecOnTime.SetActive(value : boolean);
begin

  CheckTimer.Enabled := value;
  FActive := value;

  if Value then NewTrigger;

end;

procedure TExecOnTime.setInterval(const Value: Cardinal);
var
  Time: TDateTime;
  Sec: Word;
  Milli: Word;
begin
  _Interval := Value;
  Time := MillisecondToDateTime(Value);
  DecodeTime(Time, FDayTimeHour, FDayTimeMinute, Sec, Milli);
end;

procedure TExecOnTime.TimeCheck(Sender : TObject);
begin
    if (not (Self.ComponentState = [csDesigning])) and Assigned(FOnDayTimeExecute) then
      begin

        if (_NextTrigger < now) and FActive then
          begin
            FOnDayTimeExecute(self);
            NewTrigger;
          end;

      end;
end;



end.
