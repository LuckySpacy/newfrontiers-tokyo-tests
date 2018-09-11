unit NFSdpCalendar;

interface

uses
  SysUtils, Classes, Windows, vcl.Forms, vcl.ComCtrls, nfsMonthCalendar, Messages, vcl.Controls,
  vcl.ExtCtrls, vcl.Dialogs;

type
  TNFSdpCalendar = class(TForm)
  private
    FLeftPos: Integer;
    FTopPos: Integer;
    FCalendar: TNfsMonthCalendar;
    FMouseIsInControl: Boolean;
    FDate: TDate;
    FOnActive: TNotifyEvent;
    FOnInActive: TNotifyEvent;
    FOnDayClick: TCalClickEvent;
    FOnTodayClick: TCalClickEvent;
    procedure FormShow(Sender: TObject);
    procedure DayClick(Sender: TObject; aDate: TDate);
    procedure TodayClick(Sender: TObject; aDate: TDate);
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure CMFocusChanged(var Message: TCMFocusChanged); message CM_FOCUSCHANGED;
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
    procedure WMNCACTIVATE(var M: TWMNCACTIVATE); message WM_NCACTIVATE;
  protected
    procedure Paint; override;
  public
    constructor CreateNew(AOwner: TComponent; Dummy: Integer  = 0); override;
    destructor Destroy; override;
    procedure SetPos(aPos: TPoint);
    property Date: TDate read FDate write FDate;
    property OnInActive: TNotifyEvent read FOnInActive write FOnInActive;
    property OnActive: TNotifyEvent read FOnActive write FOnActive;
    property OnDayClick: TCalClickEvent read FOnDayClick write FOnDayClick;
    property OnTodayClick: TCalClickEvent read FOnTodayClick write FOnTodayClick;
  end;


implementation

{ TNFSdpCalendar }

uses
  Vcl.Graphics;

constructor TNFSdpCalendar.CreateNew(AOwner: TComponent; Dummy: Integer);
begin
  inherited;
  FormStyle := fsStayOnTop;
  BorderStyle := bsNone;
  FCalendar := TNfsMonthCalendar.Create(Self);
  FCalendar.Parent := Self;
  FCalendar.WeekNumbers := true;
  FCalendar.Top := 2;
  FCalendar.Left := 2;
  FCalendar.BorderWidth := 0;
  Width  := FCalendar.Width + 4;
  Height := FCalendar.Height + 4;
  OnShow := FormShow;
  FCalendar.OnDayClick := DayClick;
  FCalendar.OnTodayClick := TodayClick;
  FMouseIsInControl := false;
  FDate := 0;
end;


destructor TNFSdpCalendar.Destroy;
begin //
  FreeAndNil(FCalendar);
  inherited;
end;


procedure TNFSdpCalendar.FormShow(Sender: TObject);
begin
  Left := FLeftPos;
  Top  := FTopPos;
  if FDate = 0 then
    FDate := now;
  FCalendar.Date := FDate;
end;

procedure TNFSdpCalendar.Paint;
var
  r: TRect;
begin
  inherited;
  r := getClientRect;
  Canvas.Pen.Color := clGray;
  Canvas.Brush.Color := clGray;
  Canvas.Pen.Width := 1;
  Canvas.FrameRect(r);
end;

procedure TNFSdpCalendar.DayClick(Sender: TObject; aDate: TDate);
begin
  FDate := FCalendar.Date;
  if Assigned(FOnDayClick) then
    FOnDayClick(Sender, FDate);
end;


procedure TNFSdpCalendar.SetPos(aPos: TPoint);
begin
  FLeftPos := aPos.X;
  FTopPos  := aPos.Y;
end;


procedure TNFSdpCalendar.TodayClick(Sender: TObject; aDate: TDate);
begin
  FDate := trunc(now);
  if Assigned(FOnDayClick) then
    FOnToDayClick(Sender, FDate);
end;

procedure TNFSdpCalendar.WMNCACTIVATE(var M: TWMNCACTIVATE);
begin
  inherited;
  if m.Active then
  begin
    if Assigned(FOnActive) then
      FOnActive(Self);
  end
  else
  begin
    if Assigned(FOnInActive) then
      FOnInActive(Self);
  end;
end;

procedure TNFSdpCalendar.CMExit(var Message: TCMExit);
begin //
  inherited;
end;

procedure TNFSdpCalendar.CMFocusChanged(var Message: TCMFocusChanged);
begin
  inherited;
end;

procedure TNFSdpCalendar.CMMouseEnter(var Message: TMessage);
begin
  inherited;
end;


procedure TNFSdpCalendar.CMMouseLeave(var Message: TMessage);
begin //
  inherited;
end;

end.

