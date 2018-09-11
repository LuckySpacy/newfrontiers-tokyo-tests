unit NFSDatePicker;

interface

{$R 'NFSDatePicker.dcr'}


uses
  SysUtils, Classes, vcl.Controls, vcl.StdCtrls, vcl.Mask, nfsMaskButtonedEdit, vcl.Graphics,
  nfsdpCalendar, Windows, DateUtils, Messages, System.UITypes;

type
  TNFSDatePicker = class(TNFSCustomMaskButtonedEdit)
  private
    FImageList: TImageList;
    FCalendar: TNFSdpCalendar;
    FCanExitOnError: Boolean;
    FOnError: TNotifyEvent;
    FDefaultErrorMsg: string;
    FDateLessNotAllowed: TDate;
    FDateLessCheck: Boolean;
    FOnDateLessError: TNotifyEvent;
    FDefaultLessDateErrorMsg: string;
    procedure LoadIconFromRes(aResType, aResName: string; aIcon: vcl.Graphics.TIcon);
    procedure RightButtonClick(Sender: TObject);
    procedure ShowCalendar;
    procedure DoInActive(Sender: TObject);
    procedure DayClick(Sender: TObject; aDate: TDate);
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
    function GetDate: TDate;
    procedure SetDate(const Value: TDate);
    function GetDateFormatTextStr: string;
   protected
    procedure KeyPress(var Key: Char); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property DefaultErrorMsg: string read FDefaultErrorMsg write FDefaultErrorMsg;
    property DefaultLessDateErrorMsg: string read FDefaultLessDateErrorMsg write FDefaultLessDateErrorMsg;
    property Date: TDate read GetDate write SetDate;
    function CheckValidDate: Boolean;
  published
    property CanExitOnError: Boolean read FCanExitOnError write FCanExitOnError default false;
    property OnError: TNotifyEvent read FOnError write FOnError;
    property OnDateLessError: TNotifyEvent read FOnDateLessError write FOnDateLessError;
    property Align;
    property Anchors;
    property AutoSelect;
    property AutoSize;
    property BevelEdges;
    property BevelInner;
    property BevelOuter;
    property BevelKind;
    property BevelWidth;
    property BiDiMode;
    property BorderStyle;
    property Color;
    property Constraints;
    property Ctl3D;
    property DoubleBuffered;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font;
    property ImeMode;
    property ImeName;
    property ParentBiDiMode;
    property ParentColor;
    property ParentCtl3D;
    property ParentDoubleBuffered;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property TextHint;
    property Visible;
    property OnChange;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnGesture;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseActivate;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDock;
    property OnStartDrag;
    property DateLessNotAllowed: TDate read FDateLessNotAllowed write FDateLessNotAllowed;
    property DateLessCheck: Boolean read FDateLessCheck write FDateLessCheck default false;
  end;

procedure Register;

implementation

uses
  vcl.Dialogs;

{$R nfsDatePickerres.res}



procedure Register;
begin
  RegisterComponents('new frontiers', [TNFSDatePicker]);
end;

{ TNFSDatePicker }



constructor TNFSDatePicker.Create(AOwner: TComponent);
  procedure AddImageList(aIconName: string);
  var
    Icon: TIcon;
  begin
    Icon := TIcon.Create;
    try
      LoadIconFromRes('RT_RCDATA', aIconName, Icon);
      FImageList.AddIcon(Icon);
      FreeAndNil(Icon);
    finally
      FreeAndNil(Icon);
    end;
  end;
begin
  inherited;
  FImageList := TImageList.Create(Self);
  FImageList.Width  := 32;
  FImageList.Height := 19;
  AddImageList('OpenCal');
  AddImageList('OpenCalSel');
  Images := FImageList;
  RightButton.DisabledImageIndex := 0;
  RightButton.HotImageIndex := 1;
  RightButton.ImageIndex := 0;
  RightButton.PressedImageIndex := 0;
  RightButton.Visible := true;
  OnRightButtonClick := RightButtonClick;
  FCalendar := TNFSdpCalendar.CreateNew(Self);
  FCalendar.onInActive := DoInActive;
  FCalendar.OnDayClick := DayClick;
  FCalendar.OnTodayClick := DayClick;
  Text := ' ';
  FDefaultErrorMsg := 'Ungültiges Datum';
  CanCheckMaskValidateError := false;
  FDateLessCheck := true;
  FDateLessNotAllowed := StrToDate('01.01.1900');
  FDefaultLessDateErrorMsg := 'Datum kleiner als <LESSDATE> ist nicht erlaubt';
end;


destructor TNFSDatePicker.Destroy;
begin
  FreeAndNil(FImageList);
  FreeAndNil(FCalendar);
  inherited;
end;


procedure TNFSDatePicker.DayClick(Sender: TObject; aDate: TDate);
begin
  setDate(aDate);
  FCalendar.Visible := false;
end;


procedure TNFSDatePicker.DoInActive(Sender: TObject);
begin
  FCalendar.onInActive := nil;
  try
    if FCalendar.Visible then
      SetFocus;
    FCalendar.Visible := false;
  finally
    FCalendar.onInActive := DoInActive;
  end;
end;

function TNFSDatePicker.GetDate: TDate;
var
  d: TDateTime;
begin
  if TryStrToDate(Text, d) then
    Result := trunc(d)
  else
  begin
    Result := 0;
  end;
end;

procedure TNFSDatePicker.LoadIconFromRes(aResType, aResName: string;
  aIcon: vcl.Graphics.TIcon);
var
  Res: TResourceStream;
begin
  Res := TResourceStream.Create(Hinstance, aResname, PChar(aResType));
  try
    aIcon.LoadFromStream(Res);
  finally
    FreeAndNil(Res);
  end;
end;


procedure TNFSDatePicker.RightButtonClick(Sender: TObject);
begin
  if ReadOnly then
    exit;
  ShowCalendar;
end;

procedure TNFSDatePicker.SetDate(const Value: TDate);
begin
  FCalendar.Date := Value;
  if Value = 0 then
  begin
    Text := '';
    exit;
  end;

  if EditMask > '' then
  begin
    EditMask := '';
    Text := FormatDateTime('ddmmyyyy', Value);
    EditMask := '!99/99/0000;1; ';
  end
  else
    Text := FormatDateTime('dd.mm.yyyy', Value);

end;

procedure TNFSDatePicker.ShowCalendar;
var
  pt: TPoint;
  Datum: TDateTime;
begin
  SetFocus;
  pt.X := Left;
  pt.Y := Top + Height;
  pt   := Parent.ClientToScreen(pt);
  FCalendar.setPos(pt);
  if TryStrToDate(Text, Datum) then
    FCalendar.Date := Datum;
  if not FCalendar.Visible then
    FCalendar.Show;
  FCalendar.SetFocus;
end;


procedure TNFSDatePicker.WMSetFocus(var Message: TWMSetFocus);
begin
  if not ReadOnly then
  begin
    if EditMask = '' then
    begin
      Text := StringReplace(Text, '.', '', [rfReplaceAll]);
      EditMask := '!99/99/0000;1; ';
    end;
  end;
  inherited;
end;

procedure TNFSDatePicker.CMExit(var Message: TCMExit);
var
  s: string;
  d: TDateTime;
  UsedErrorEvent: Boolean;
  Errormsg: string;
begin
  if not CheckValidDate then
  begin
    if Assigned(FOnError) then
      FOnError(Self);
    if (not Assigned(FOnError)) and (FDefaultErrorMsg > '') then
      MessageDlg(FDefaultErrorMsg, mtError, [mbOk], 0);
    if not CanExitOnError then
    begin
      setFocus;
      exit;
    end;
    inherited;
    exit;
  end;

  s := GetDateFormatTextStr;
  d := StrToDate(s);

  if (FDateLessCheck) and (d <> 0) and (d < FDateLessNotAllowed) then
  begin
    UsedErrorEvent := false;
    if Assigned(FOnError) and (not Assigned (FOnDateLessError)) then
    begin
      UsedErrorEvent := true;
      FOnError(Self);
    end;
    if Assigned (FOnDateLessError) then
    begin
      UsedErrorEvent := true;
      FOnDateLessError(Self);
    end;
    if (not UsedErrorEvent) and (FDefaultLessDateErrorMsg > '') then
    begin
      ErrorMsg := StringReplace(FDefaultLessDateErrorMsg, '<LESSDATE>', DateToStr(FDateLessNotAllowed), [rfReplaceAll]);
      MessageDlg(ErrorMsg, mtError, [mbOk], 0);
    end;

    if not CanExitOnError then
      setFocus;
    exit;
  end;


  EditMask := '';
  s := GetDateFormatTextStr;

  setDate(StrToDate(s));
  inherited;
end;


procedure TNFSDatePicker.CMTextChanged(var Message: TMessage);
begin
  inherited;
end;

function TNFSDatePicker.GetDateFormatTextStr: string;
var
  d: TDateTime;
  s: string;
begin
  d := 0;
  s := Trim(Text);
  s := Trim(StringReplace(s, '.', '', [rfReplaceAll]));
  if s = '' then
  begin
    Result := FormatDateTime('dd.mm.yyyy', d);
    exit;
  end;

  if (Length(s) >= 6) then
    s := copy(s, 1, 2) + '.' + copy(s, 3, 2) + '.' + copy(s, 5, Length(s));

  Result := s;

end;

procedure TNFSDatePicker.KeyPress(var Key: Char);
var
  CaretPos: Integer;
  s: string;
begin
  if Key = ',' then
    Key := '.';
  if Key = '.' then
  begin
    s := Text;
    CaretPos := SelStart;
    if CaretPos < 3 then
    begin
      if (s[1] > ' ') and (Trim(s[2]) = '') then
      begin
        s[2] := s[1];
        s[1] := '0';
        Text := s;
      end;
      if (s[1] > ' ') and (s[2] > ' ') then
        SelStart := 3;
    end;
    if (CaretPos >= 3) and (CaretPos < 5)  then
    begin
      if (s[4] > ' ') and (Trim(s[5]) = '') then
      begin
        s[5] := s[4];
        s[4] := '0';
        Text := s;
      end;
      if (s[4] > ' ') and (s[5] > ' ') then
        SelStart := 6;
    end;
    Key := #0;
    exit;
  end;
  inherited;

end;

function TNFSDatePicker.CheckValidDate: Boolean;
var
  s: String;
  d: TDateTime;
begin
  s := GetDateFormatTextStr;
  if not TryStrToDate(s, d) then
    Result := false
  else
    Result := true;
end;




end.

