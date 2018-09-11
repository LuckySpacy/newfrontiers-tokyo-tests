unit NFSCustomEdit;

interface
uses
{$IF DEFINED(CLR)}
  System.Collections, WinUtils,
{$IFEND}
{$IF DEFINED(LINUX)}
  WinUtils,
{$IFEND}
  Messages, Windows, SysUtils, Classes, vcl.Controls, vcl.Forms,
  vcl.Menus, vcl.Graphics, CommCtrl, vcl.ImgList, vcl.StdCtrls;


type
  TNFSCustomEdit = class(TWinControl)
  private
    FAlignment: TAlignment;
    FMaxLength: Integer;
    FBorderStyle: TBorderStyle;
    FPasswordChar: Char;
    FReadOnly: Boolean;
    FAutoSize: Boolean;
    FAutoSelect: Boolean;
    FHideSelection: Boolean;
    FOEMConvert: Boolean;
    FCharCase: TEditCharCase;
    FCreating: Boolean;
    FModified: Boolean;
    FInBufferedPrintClient: Boolean;
    FOnChange: TNotifyEvent;
    FOldSelLength: Integer;
    FOldSelStart: Integer;
    FNumbersOnly: Boolean;
    FTextHint: string;
    FReturnIsTab: Boolean;
    procedure AdjustHeight;
    function GetModified: Boolean;
    function GetCanUndo: Boolean;
    procedure SetBorderStyle(Value: TBorderStyle);
    procedure SetCharCase(Value: TEditCharCase);
    procedure SetHideSelection(Value: Boolean);
    procedure SetMaxLength(Value: Integer);
    procedure SetModified(Value: Boolean);
    procedure SetNumbersOnly(Value: Boolean);
    procedure SetOEMConvert(Value: Boolean);
    procedure SetPasswordChar(Value: Char);
    procedure SetReadOnly(Value: Boolean);
    procedure SetTextHint(const Value: string);
    procedure UpdateHeight;
    procedure CMCtl3DChanged(var Message: TMessage); message CM_CTL3DCHANGED;
    procedure CMEnter(var Message: TCMEnter); message CM_ENTER;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure CMGestureManagerChanged(var Message: TMessage); message CM_GESTUREMANAGERCHANGED;
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
    procedure CNCommand(var Message: TWMCommand); message CN_COMMAND;
    procedure WMContextMenu(var Message: TWMContextMenu); message WM_CONTEXTMENU;
    procedure WMSetFont(var Message: TWMSetFont); message WM_SETFONT;
    procedure WMKeyDown(var Msg: TWMKeydown); message WM_KEYDOWN;
  protected
    procedure Change; dynamic;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWindowHandle(const Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure DestroyWnd; override;
    procedure DoSetMaxLength(Value: Integer); virtual;
    procedure DoSetTextHint(const Value: string); virtual;
    function GetSelLength: Integer; virtual;
    function GetSelStart: Integer; virtual;
    function GetSelText: string; virtual;
    procedure SetAlignment(Value: TAlignment);
    procedure SetAutoSize(Value: Boolean); override;
    procedure SetSelLength(Value: Integer); virtual;
    procedure SetSelStart(Value: Integer); virtual;
    procedure SetSelText(const Value: string);
{$IF DEFINED(CLR)}
    procedure SendGetSel(var SelStart, SelEnd: Integer);
{$IFEND}
    property AutoSelect: Boolean read FAutoSelect write FAutoSelect default True;
    property AutoSize: Boolean read FAutoSize write SetAutoSize default True;
    property BorderStyle: TBorderStyle read FBorderStyle write SetBorderStyle default bsSingle;
    property CharCase: TEditCharCase read FCharCase write SetCharCase default ecNormal;
    property HideSelection: Boolean read FHideSelection write SetHideSelection default True;
    property MaxLength: Integer read FMaxLength write SetMaxLength default 0;
    property OEMConvert: Boolean read FOEMConvert write SetOEMConvert default False;
    property NumbersOnly: Boolean read FNumbersOnly write SetNumbersOnly default False;
    property PasswordChar: Char read FPasswordChar write SetPasswordChar default #0;
    property ParentColor default False;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property Alignment: TAlignment read FAlignment write SetAlignment default taLeftJustify;
    property CanUndo: Boolean read GetCanUndo;
    property Modified: Boolean read GetModified write SetModified;
    property ReadOnly: Boolean read FReadOnly write SetReadOnly default False;
    property SelLength: Integer read GetSelLength write SetSelLength;
    property SelStart: Integer read GetSelStart write SetSelStart;
    property SelText: string read GetSelText write SetSelText;
    property Text;
    property TextHint: string read FTextHint write SetTextHint;
    property TabStop default True;
    property ReturnIsTab: Boolean read FReturnIsTab write FReturnIsTab;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Clear; virtual;
    procedure ClearSelection;
    procedure CopyToClipboard;
    procedure CutToClipboard;
    procedure DefaultHandler(var Message); override;
    function GetControlsAlignment: TAlignment; override;
    procedure PasteFromClipboard;
    procedure Undo;
    procedure ClearUndo;
    procedure SelectAll;
{$IF NOT DEFINED(CLR)}
    //function GetSelTextBuf(Buffer: PChar; BufSize: Integer): Integer; virtual;
    //procedure SetSelTextBuf(Buffer: PChar);
{$IFEND}
  published
  end;


implementation

{ TNFSCustomEdit }

uses
  vcl.Themes, Types;

const
  BorderStyles: array[TBorderStyle] of DWORD = (0, WS_BORDER);


procedure TNFSCustomEdit.AdjustHeight;
var
  DC: HDC;
  SaveFont: HFont;
  I: Integer;
  SysMetrics, Metrics: TTextMetric;
begin
  DC := GetDC(0);
  try
    GetTextMetrics(DC, SysMetrics);
    SaveFont := SelectObject(DC, Font.Handle);
    GetTextMetrics(DC, Metrics);
    SelectObject(DC, SaveFont);
  finally
    ReleaseDC(0, DC);
  end;
  if NewStyleControls then
  begin
    if Ctl3D then I := 8 else I := 6;
    I := GetSystemMetrics(SM_CYBORDER) * I;
  end else
  begin
    I := SysMetrics.tmHeight;
    if I > Metrics.tmHeight then I := Metrics.tmHeight;
    I := I div 4 + GetSystemMetrics(SM_CYBORDER) * 4;
  end;
  Height := Metrics.tmHeight + I;
end;

procedure TNFSCustomEdit.Change;
begin
  inherited Changed;
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TNFSCustomEdit.Clear;
begin
  SetWindowText(Handle, '');
end;

procedure TNFSCustomEdit.ClearSelection;
begin
  SendMessage(Handle, WM_CLEAR, 0, 0);
end;

procedure TNFSCustomEdit.ClearUndo;
begin
  SendMessage(Handle, EM_EMPTYUNDOBUFFER, 0, 0);
end;

procedure TNFSCustomEdit.CMCtl3DChanged(var Message: TMessage);
begin
  if NewStyleControls and (FBorderStyle = bsSingle) then
  begin
    UpdateHeight;
    RecreateWnd;
  end;
  inherited;
end;

procedure TNFSCustomEdit.CMEnter(var Message: TCMEnter);
begin
  if FAutoSelect and not (csLButtonDown in ControlState) and
    (GetWindowLong(Handle, GWL_STYLE) and ES_MULTILINE = 0) then SelectAll;
  inherited;
end;

procedure TNFSCustomEdit.CMFontChanged(var Message: TMessage);
begin
  inherited;
  if (csFixedHeight in ControlStyle) and not ((csDesigning in
    ComponentState) and (csLoading in ComponentState)) then AdjustHeight;
end;

procedure TNFSCustomEdit.CMGestureManagerChanged(var Message: TMessage);
begin
  if not (csDestroying in ComponentState) then
  begin
    if (Touch.GestureManager <> nil) then
      ControlStyle := ControlStyle + [csGestures]
    else
      ControlStyle := ControlStyle - [csGestures];
    if HandleAllocated then
      RecreateWnd;
  end;
end;

procedure TNFSCustomEdit.CMTextChanged(var Message: TMessage);
begin
  inherited;
  if not HandleAllocated or (GetWindowLong(Handle, GWL_STYLE) and
    ES_MULTILINE <> 0) then Change;
end;

procedure TNFSCustomEdit.CNCommand(var Message: TWMCommand);
begin
  if (Message.NotifyCode = EN_CHANGE) and not FCreating then Change;
end;

procedure TNFSCustomEdit.CopyToClipboard;
begin
  SendMessage(Handle, WM_COPY, 0, 0);
end;

constructor TNFSCustomEdit.Create(AOwner: TComponent);
const
  EditStyle = [csClickEvents, csSetCaption, csDoubleClicks, csFixedHeight, csPannable];
begin
  inherited Create(AOwner);
  if NewStyleControls then
    ControlStyle := EditStyle else
    ControlStyle := EditStyle + [csFramed];
  Width := 121;
  Height := 25;
  TabStop := True;
  ParentColor := False;
  FBorderStyle := bsSingle;
  FAlignment := taLeftJustify;
  FAutoSize := True;
  FAutoSelect := True;
  FHideSelection := True;
  AdjustHeight;
  FOldSelLength := -1;
  FOldSelStart := -1;
  FNumbersOnly := False;
  FTextHint := '';
  FInBufferedPrintClient := False;
  FReturnIsTab := true;
end;

procedure TNFSCustomEdit.CreateParams(var Params: TCreateParams);
const
  Alignments: array[Boolean, TAlignment] of DWORD =
    ((ES_LEFT, ES_RIGHT, ES_CENTER),(ES_RIGHT, ES_LEFT, ES_CENTER));
  Passwords: array[Boolean] of DWORD = (0, ES_PASSWORD);
  ReadOnlys: array[Boolean] of DWORD = (0, ES_READONLY);
  CharCases: array[TEditCharCase] of DWORD = (0, ES_UPPERCASE, ES_LOWERCASE);
  HideSelections: array[Boolean] of DWORD = (ES_NOHIDESEL, 0);
  OEMConverts: array[Boolean] of DWORD = (0, ES_OEMCONVERT);
  NumbersOnlyStyle: array[Boolean] of DWORD = (0, ES_NUMBER);
begin
  inherited CreateParams(Params);
  CreateSubClass(Params, 'EDIT');
  with Params do
  begin
    Style := Style or (ES_AUTOHSCROLL or ES_AUTOVSCROLL) or
      Alignments[UseRightToLeftAlignment, FAlignment] or
      BorderStyles[FBorderStyle] or Passwords[FPasswordChar <> #0] or
      NumbersOnlyStyle[FNumbersOnly] or
      ReadOnlys[FReadOnly] or CharCases[FCharCase] or
      HideSelections[FHideSelection] or OEMConverts[FOEMConvert];
    if NewStyleControls and Ctl3D and (FBorderStyle = bsSingle) then
    begin
      Style := Style and not WS_BORDER;
      ExStyle := ExStyle or WS_EX_CLIENTEDGE;
    end;
  end;
end;

procedure TNFSCustomEdit.CreateWindowHandle(const Params: TCreateParams);
var
  P: TCreateParams;
begin
  if SysLocale.FarEast and (Win32Platform <> VER_PLATFORM_WIN32_NT) and
    ((Params.Style and ES_READONLY) <> 0) then
  begin
    // Work around Far East Win95 API/IME bug.
    P := Params;
    P.Style := P.Style and (not ES_READONLY);
    inherited CreateWindowHandle(P);
    if WindowHandle <> 0 then
      SendMessage(WindowHandle, EM_SETREADONLY, Ord(True), 0);
  end
  else
    inherited CreateWindowHandle(Params);
end;

procedure TNFSCustomEdit.CreateWnd;
begin
  FCreating := True;
  try
    inherited CreateWnd;
  finally
    FCreating := False;
  end;
  DoSetMaxLength(FMaxLength);
  Modified := FModified;
  if (FPasswordChar <> #0) and not (StyleServices.Enabled and ((FPasswordChar = '*'))) then
    SendMessage(Handle, EM_SETPASSWORDCHAR, Ord(FPasswordChar), 0);
  if FOldSelStart <> -1 then
  begin
    SelStart := FOldSelStart;
    FOldSelStart := -1;
  end;
  if FOldSelLength <> -1 then
    SelLength := FOldSelLength;
  UpdateHeight;
  DoSetTextHint(FTextHint);
end;

procedure TNFSCustomEdit.CutToClipboard;
begin
  SendMessage(Handle, WM_CUT, 0, 0);
end;

procedure TNFSCustomEdit.DefaultHandler(var Message);
{$IF DEFINED(CLR)}
var
  FocusMsg: TWMSetFocus;
  Msg: TMessage;
{$IFEND}
begin
{$IF DEFINED(CLR)}
  Msg := UnwrapMessage(TObject(Message));
  case Msg.Msg of
{$ELSE}
  case TMessage(Message).Msg of
{$IFEND}
    WM_SETFOCUS:
      if Win32Platform = VER_PLATFORM_WIN32_WINDOWS then
      begin
{$IF DEFINED(CLR)}
        FocusMsg := TWMSetFocus.Create(Msg);
        if not IsWindow(FocusMsg.FocusedWnd) then
          FocusMsg.FocusedWnd := 0;
{$ELSE}
        if not IsWindow(TWMSetFocus(Message).FocusedWnd) then
          TWMSetFocus(Message).FocusedWnd := 0;
{$IFEND}
      end;
    CN_CTLCOLOREDIT:
      if (csGlassPaint in ControlState) and not FInBufferedPrintClient then
      begin
        FInBufferedPrintClient := True;
        PostMessage(Handle, CM_BUFFEREDPRINTCLIENT, 0, 0);
      end;
    CM_BUFFEREDPRINTCLIENT:
      if FInBufferedPrintClient then
      begin
        PerformBufferedPrintClient(Handle, ClientRect);
        FInBufferedPrintClient := False;
      end;
  end;
  inherited;
end;

procedure TNFSCustomEdit.DestroyWnd;
begin
  FModified := Modified;
  FOldSelLength := SelLength;
  FOldSelStart := SelStart;
  inherited DestroyWnd;
end;

procedure TNFSCustomEdit.DoSetMaxLength(Value: Integer);
begin
  SendMessage(Handle, EM_LIMITTEXT, Value, 0)
end;

procedure TNFSCustomEdit.DoSetTextHint(const Value: string);
begin
  if CheckWin32Version(5, 1) and StyleServices.Enabled and HandleAllocated then
    SendTextMessage(Handle, EM_SETCUEBANNER, WPARAM(0), Value);
end;

function TNFSCustomEdit.GetCanUndo: Boolean;
begin
  Result := False;
  if HandleAllocated then Result := SendMessage(Handle, EM_CANUNDO, 0, 0) <> 0;
end;

function TNFSCustomEdit.GetControlsAlignment: TAlignment;
begin
  Result := FAlignment;
end;

function TNFSCustomEdit.GetModified: Boolean;
begin
  Result := FModified;
  if HandleAllocated then Result := SendMessage(Handle, EM_GETMODIFY, 0, 0) <> 0;
end;

function TNFSCustomEdit.GetSelLength: Integer;
var
  Selection: TSelection;
begin
{$IF DEFINED(CLR)}
  SendGetSel(Selection.StartPos, Selection.EndPos);
{$ELSE}
  SendMessage(Handle, EM_GETSEL, WPARAM(@Selection.StartPos), LPARAM(@Selection.EndPos));
{$IFEND}
  Result := Selection.EndPos - Selection.StartPos;
end;

function TNFSCustomEdit.GetSelStart: Integer;
{$IF DEFINED(CLR)}
var
  Temp: Integer;
begin
  SendGetSel(Result, Temp);
{$ELSE}
begin
  SendMessage(Handle, EM_GETSEL, Longint(@Result), 0);
{$IFEND}
end;

function TNFSCustomEdit.GetSelText: string;
{$IF DEFINED(CLR)}
var
  SelStart, SelEnd: Integer;
begin
  SendGetSel(SelStart, SelEnd);
  Result := Copy(Text, SelStart + 1, SelEnd - SelStart);
{$ELSE}
var
  P: PChar;
  SelStart, Len: Integer;
begin
  SelStart := GetSelStart;
  Len := GetSelLength;
  SetString(Result, PChar(nil), Len);
  if Len <> 0 then
  begin
    P := StrAlloc(GetTextLen + 1);
    try
      GetTextBuf(P, StrBufSize(P));
      Move(P[SelStart], Pointer(Result)^, Len * SizeOf(Char));
    finally
      StrDispose(P);
    end;
  end;
{$IFEND}
end;

procedure TNFSCustomEdit.PasteFromClipboard;
begin
  SendMessage(Handle, WM_PASTE, 0, 0);
end;

procedure TNFSCustomEdit.SelectAll;
begin
  SendMessage(Handle, EM_SETSEL, 0, -1);
end;

procedure TNFSCustomEdit.SetAlignment(Value: TAlignment);
begin
  if FAlignment <> Value then
  begin
    FAlignment := Value;
    RecreateWnd;
  end;
end;

procedure TNFSCustomEdit.SetAutoSize(Value: Boolean);
begin
  if FAutoSize <> Value then
  begin
    FAutoSize := Value;
    UpdateHeight;
  end;
end;

procedure TNFSCustomEdit.SetBorderStyle(Value: TBorderStyle);
begin
  if FBorderStyle <> Value then
  begin
    FBorderStyle := Value;
    UpdateHeight;
    RecreateWnd;
  end;
end;

procedure TNFSCustomEdit.SetCharCase(Value: TEditCharCase);
begin
  if FCharCase <> Value then
  begin
    FCharCase := Value;
    RecreateWnd;
  end;
end;

procedure TNFSCustomEdit.SetHideSelection(Value: Boolean);
begin
  if FHideSelection <> Value then
  begin
    FHideSelection := Value;
    RecreateWnd;
  end;
end;

procedure TNFSCustomEdit.SetMaxLength(Value: Integer);
begin
  if FMaxLength <> Value then
  begin
    FMaxLength := Value;
    if HandleAllocated then DoSetMaxLength(Value);
  end;
end;

procedure TNFSCustomEdit.SetModified(Value: Boolean);
begin
  if HandleAllocated then
    SendMessage(Handle, EM_SETMODIFY, Byte(Value), 0) else
    FModified := Value;
end;

procedure TNFSCustomEdit.SetNumbersOnly(Value: Boolean);
begin
  if FNumbersOnly <> Value then
  begin
    FNumbersOnly := Value;
    if HandleAllocated then
    begin
      if FNumbersOnly then
        SetWindowLong(Handle, GWL_STYLE, GetWindowLong(Handle, GWL_STYLE) or ES_NUMBER)
      else
        SetWindowLong(Handle, GWL_STYLE, GetWindowLong(Handle, GWL_STYLE) and not ES_NUMBER);
    end;
  end;
end;

procedure TNFSCustomEdit.SetOEMConvert(Value: Boolean);
begin
  if FOEMConvert <> Value then
  begin
    FOEMConvert := Value;
    RecreateWnd;
  end;
end;

procedure TNFSCustomEdit.SetPasswordChar(Value: Char);
begin
  if FPasswordChar <> Value then
  begin
    FPasswordChar := Value;
    if HandleAllocated then
      RecreateWnd;
  end;
end;

procedure TNFSCustomEdit.SetReadOnly(Value: Boolean);
begin
  if FReadOnly <> Value then
  begin
    FReadOnly := Value;
    if HandleAllocated then
      SendMessage(Handle, EM_SETREADONLY, Ord(Value), 0);
  end;
end;

procedure TNFSCustomEdit.SetSelLength(Value: Integer);
var
  Selection: TSelection;
begin
{$IF DEFINED(CLR)}
  SendGetSel(Selection.StartPos, Selection.EndPos);
{$ELSE}
  SendMessage(Handle, EM_GETSEL, WPARAM(@Selection.StartPos), LPARAM(@Selection.EndPos));
{$IFEND}
  Selection.EndPos := Selection.StartPos + Value;
  SendMessage(Handle, EM_SETSEL, Selection.StartPos, Selection.EndPos);
  SendMessage(Handle, EM_SCROLLCARET, 0, 0);
end;

procedure TNFSCustomEdit.SetSelStart(Value: Integer);
begin
  SendMessage(Handle, EM_SETSEL, Value, Value);
end;

procedure TNFSCustomEdit.SetSelText(const Value: string);
begin
{$IF DEFINED(CLR)}
  if not Assigned(Value) then
    SendTextMessage(Handle, EM_REPLACESEL, 0, '')
  else
{$IFEND}
    SendTextMessage(Handle, EM_REPLACESEL, 0, Value);
end;

procedure TNFSCustomEdit.SetTextHint(const Value: string);
begin
  if FTextHint <> Value then
  begin
    FTextHint := Value;
    if not (csLoading in ComponentState) then
      DoSetTextHint(FTextHint);
  end;
end;

procedure TNFSCustomEdit.Undo;
begin
  SendMessage(Handle, WM_UNDO, 0, 0);
end;


procedure TNFSCustomEdit.UpdateHeight;
begin
  if FAutoSize and (BorderStyle = bsSingle) then
  begin
    ControlStyle := ControlStyle + [csFixedHeight];
    AdjustHeight;
  end else
    ControlStyle := ControlStyle - [csFixedHeight];
end;

procedure TNFSCustomEdit.WMContextMenu(var Message: TWMContextMenu);
var
  LPoint: TPoint;
  LMessage: TMessage;
  Handled: Boolean;
begin
  SetFocus;
  if PopupMenu = nil then
  begin
    LPoint := SmallPointToPoint(Message.Pos);
    if not InvalidPoint(LPoint) then
      LPoint := ScreenToClient(LPoint);

    Handled := False;
    DoContextPopup(LPoint, Handled);
    Message.Result := Ord(Handled);
    if Handled then Exit;

{$IF DEFINED(CLR)}
    LMessage := UnwrapMessage(TObject(Message));
{$ELSE}
    LMessage := TMessage(Message);
{$IFEND}
    with LMessage do
      Result := CallWindowProc(DefWndProc, WindowHandle, Msg, WParam, LParam)
  end
  else
    inherited;
end;

procedure TNFSCustomEdit.WMKeyDown(var Msg: TWMKeydown);
var
  cf: TCustomForm;
begin
  if (msg.charcode = VK_RETURN) and FReturnIsTab then
  begin
    msg.charcode := VK_TAB;

    if IsWindowVisible(Handle) then
    begin
      cf := GetParentForm(self);
      if Assigned(cf) then
        cf.Perform(WM_NEXTDLGCTL, 0, 0);
    end;
  end;
  inherited;
end;

procedure TNFSCustomEdit.WMSetFont(var Message: TWMSetFont);
begin
  inherited;
  if NewStyleControls and
    (GetWindowLong(Handle, GWL_STYLE) and ES_MULTILINE = 0) then
    SendMessage(Handle, EM_SETMARGINS, EC_LEFTMARGIN or EC_RIGHTMARGIN, 0);
end;

end.

