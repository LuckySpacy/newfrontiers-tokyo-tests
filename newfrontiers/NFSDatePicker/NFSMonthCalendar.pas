unit NFSMonthCalendar;

interface

{$WARN SYMBOL_PLATFORM OFF}


uses
  SysUtils, Classes, vcl.Controls, Vcl.ComCtrls, Windows, CommCtrl, Messages, vcl.Dialogs,
  vcl.Graphics, system.Types;

type
  TCalClickEvent = procedure(Sender: TObject; aDate: TDate) of object;

type
  TNFSMonthCalendar = class(TMonthCalendar)
  private
    _TitleBk: Integer;
    _OnDayClick: TCalClickEvent;
    _OnTodayClick: TCalClickEvent;
    _OnNextClick: TCalClickEvent;
    _OnPrevClick: TCalClickEvent;
    _Date: TDateTime;
    _OnDateChanged: TNotifyEvent;
    procedure DoClick;
  protected
    procedure WndProc(var Message: TMessage); override;
    procedure CMFocusChanged(var Message: TCMFocusChanged); message CM_FOCUSCHANGED;
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property OnDayClick: TCalClickEvent   read _OnDayClick   write _OnDayClick;
    property OnTodayClick: TCalClickEvent read _OnTodayClick write _OnTodayClick;
    property OnNextClick: TCalClickEvent  read _OnNextClick  write _OnNextClick;
    property OnPrevClick: TCalClickEvent  read _OnPrevClick  write _OnPrevClick;
    property OnDateChanged: TNotifyEvent read _OnDateChanged write _OnDateChanged;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('new frontiers', [TNFSMonthCalendar]);
end;

{ TNFSMonthCalendar }

constructor TNFSMonthCalendar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  WeekNumbers := true;
  _TitleBk := 0;
  _Date := now;
end;

destructor TNFSMonthCalendar.Destroy;
begin

  inherited;
end;

procedure TNFSMonthCalendar.DoClick;
var
  dt: TDate;
  mcht: TMCHitTestInfo;
  pt: TPoint;
begin
  pt := ScreenToClient(Mouse.CursorPos);
  mcht.cbSize := sizeof(mcht);
  mcht.Pt := Point(pt.x, pt.y);
  MonthCal_HitTest(Handle, mcht);
  case mcht.uHit of
    MCHT_TITLEBK:
    begin
      inc(_TitleBk);
    end;
    MCHT_TITLEMONTH:
    begin
      dt := EncodeDate(mcht.st.wYear, mcht.st.wMonth, mcht.st.wDay);
      if Assigned(_OnDayClick) then
        _OnDayClick(Self, dt);
    end;
    mcht_CalendarDate,
    mcht_CalendarDateNext,
    mcht_CalendarDatePrev:
    begin
      if _TitleBk < 0 then
        _TitleBk := 0;
      if _TitleBk = 0 then
      begin
        dt := EncodeDate(mcht.st.wYear, mcht.st.wMonth, mcht.st.wDay);
        if Assigned(_OnDayClick) then
          _OnDayClick(Self, dt);
      end;
      Dec(_TitleBk);
      if _TitleBk < 0 then
        _TitleBk := 0;
    end;
    mcht_TodayLink:
    begin
      dt := Date;
      if Assigned(_OnTodayClick) then
        _OnTodayClick(Self, dt);
    end;
    mcht_TitleBtnNext:
    begin
      dt := Date;
      if Assigned(_OnNextClick) then
        _OnNextClick(Self, dt);
    end;
    mcht_TitleBtnPrev:
    begin
      dt := Date;
      if Assigned(_OnPrevClick) then
        _OnPrevClick(Self, dt);
    end;
  else
    //Result := False;
  end;
end;




procedure TNFSMonthCalendar.WndProc(var Message: TMessage);
begin
  inherited;
  if Message.Msg = WM_LBUTTONDOWN then
    DoClick;
  if _Date <> Date then
  begin
    _Date := Date;
    if Assigned(_OnDateChanged) then
      _OnDateChanged(Self);
  end;
end;

procedure TNFSMonthCalendar.CMExit(var Message: TCMExit);
begin //
end;

procedure TNFSMonthCalendar.CMFocusChanged(var Message: TCMFocusChanged);
begin //
end;


end.

