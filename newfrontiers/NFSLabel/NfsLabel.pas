unit NfsLabel;

interface

{$R 'nfslabel.dcr'}

uses
  SysUtils, Classes, Controls, StdCtrls, Messages, Winapi.Windows;

type
  RAktuell = record
    Text    : string;
    Width   : Integer;
    FontSize: Integer;
  end;

type
  TNfsLabel = class(TCustomLabel)
  private
    _MaxFontSize: Integer;
    _MinFontSize: Integer;
    _Aktuell: RAktuell;
    _CanChangedMaxFontSize: Boolean;
    //FDrawTextProc: TFNDrawText;
    procedure FitFontSize;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure SetMinFontSize(const Value: Integer);
    //procedure DoDrawNormalText(DC: HDC; const Text: UnicodeString; var TextRect: TRect; TextFlags: Cardinal);
    //function getDrawText(var Rect: TRect; Flags: Longint): String;
    //procedure UpdateDrawTextProc;
  protected
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Align;
    property Alignment;
    property Anchors;
    property BiDiMode;
    property Caption;
    property Color nodefault;
    property Constraints;
    property DragCursor;
    property DragKind;
    property DragMode;
    property EllipsisPosition;
    property Enabled;
    property FocusControl;
    property Font;
    property ParentBiDiMode;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowAccelChar;
    property ShowHint;
    property Transparent;
    property Layout;
    property Visible;
    property WordWrap;
    property OnClick;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnMouseActivate;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnStartDock;
    property OnStartDrag;
    property MinFontSize: Integer read _MinFontSize write SetMinFontSize default 1;
  end;

procedure Register;

implementation

uses
  Vcl.Themes;

procedure Register;
begin
  RegisterComponents('new frontiers', [TNfsLabel]);
end;

{ TNfsLabel }


constructor TNfsLabel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  _Aktuell.Text     := '';
  _Aktuell.Width    := 0;
  _Aktuell.FontSize := 0;
  AutoSize := false;
  _CanChangedMaxFontSize := true;
  if _MinFontSize <= 0 then
    _MinFontSize := 8;
  //UpdateDrawTextProc;
end;


procedure TNfsLabel.CMFontChanged(var Message: TMessage);
begin
  inherited;
  if _CanChangedMaxFontSize then
    _MaxFontSize := Font.Size;
end;


procedure TNfsLabel.FitFontSize;
//const
//  Alignments: array[TAlignment] of Word = (DT_LEFT, DT_RIGHT, DT_CENTER);
//  WordWraps: array[Boolean] of Word = (0, DT_WORDBREAK);
var
  Text: string;
  TextWidth: Integer;
  //DrawStyle: Longint;
  //Rect, CalcRect: TRect;
begin
  _CanChangedMaxFontSize := false;
  try
    {
    DrawStyle := DT_EXPANDTABS or WordWraps[WordWrap] or Alignments[Alignment];
    if Layout <> tlTop then
    begin
      CalcRect := Rect;
      Text      := getDrawText(CalcRect, DrawStyle or DT_CALCRECT);
      if Layout = tlBottom then OffsetRect(Rect, 0, Height - CalcRect.Bottom)
      else OffsetRect(Rect, 0, (Height - CalcRect.Bottom) div 2);
    end;
    Text := getDrawText(Rect, DrawStyle);
    }
    Text      := GetLabelText;
    TextWidth := Canvas.TextWidth(Text);

    if  (_Aktuell.Text = Text)
    and (_Aktuell.Width = Width)
    and (_Aktuell.FontSize = Font.Size) then
      exit;

    Canvas.Font := Font;
    Font.Size   := _MaxFontSize;

    if  (Font.Size = _MaxFontSize)
    and (Width >= TextWidth) then
      exit;

    Canvas.Font := Font;
    while Width <= TextWidth do
    begin
      Canvas.Font.Size := Canvas.Font.Size -1;
      if (Canvas.Font.Size = 1)
      or (_MinFontSize = Canvas.Font.Size) then
        break;
      TextWidth := Canvas.TextWidth(Text);
    end;
    Font.Size := Canvas.Font.Size;
    _Aktuell.Text     := Text;
    _Aktuell.Width    := Width;
    _Aktuell.FontSize := Font.Size;
  finally
    _CanChangedMaxFontSize := true;
  end;
end;


procedure TNfsLabel.Paint;
begin
  inherited;
  FitFontSize;
end;

procedure TNfsLabel.SetMinFontSize(const Value: Integer);
begin
  _MinFontSize := Value;
  if _MinFontSize <= 0 then
    _MinFontSize := 1;
end;

(*

procedure TNfsLabel.UpdateDrawTextProc;
begin
  FDrawTextProc := DoDrawNormalText;
end;

procedure TNfsLabel.DoDrawNormalText(DC: HDC; const Text: UnicodeString;
  var TextRect: TRect; TextFlags: Cardinal);
begin
  Winapi.Windows.DrawTextW(DC, Text, Length(Text), TextRect, TextFlags);
end;
*)

(*
function TNfsLabel.getDrawText(var Rect: TRect; Flags: Longint): String;
const
  EllipsisStr = '...';
  Ellipsis: array[TEllipsisPosition] of Longint = (0, DT_PATH_ELLIPSIS,
    DT_END_ELLIPSIS, DT_WORD_ELLIPSIS);
var
  Text, DText: string;
  NewRect: TRect;
  Height, Delim: Integer;
begin
  Text := GetLabelText;
  if (Flags and DT_CALCRECT <> 0) and
     ((Text = '') or ShowAccelChar and (Text[1] = '&') and (Length(Text) = 1)) then
    Text := Text + ' ';

  if Text <> '' then
  begin
    if not ShowAccelChar then Flags := Flags or DT_NOPREFIX;
    Flags := DrawTextBiDiModeFlags(Flags);
    Canvas.Font := Font;
    if (EllipsisPosition <> epNone) and not AutoSize then
    begin
      DText := Text;
      Flags := Flags and not DT_EXPANDTABS;
      Flags := Flags or Ellipsis[EllipsisPosition];
      if WordWrap and (EllipsisPosition in [epEndEllipsis, epWordEllipsis]) then
      begin
        repeat
          NewRect := Rect;
          Dec(NewRect.Right, Canvas.TextWidth(EllipsisStr));
          FDrawTextProc(Canvas.Handle, DText, NewRect, Flags or DT_CALCRECT);
          Height := NewRect.Bottom - NewRect.Top;
          if (Height > ClientHeight) and (Height > Canvas.Font.Height) then
          begin
            Delim := LastDelimiter(' '#9, Text);
            if Delim = 0 then
              Delim := Length(Text);
            Dec(Delim);
  {$IF NOT DEFINED(CLR)}
            if ByteType(Text, Delim) = mbLeadByte then
              Dec(Delim);
  {$IFEND}
            Text := Copy(Text, 1, Delim);
            DText := Text + EllipsisStr;
            if Text = '' then
              Break;
          end else
            Break;
        until False;
      end;
      if Text <> '' then
        Text := DText;
    end;

    Result := Text;
    {
    if Enabled or StyleServices.Enabled then
      FDrawTextProc(Canvas.Handle, Text, Rect, Flags)
    else
    begin
      OffsetRect(Rect, 1, 1);
      Canvas.Font.Color := clBtnHighlight;
      FDrawTextProc(Canvas.Handle, Text, Rect, Flags);
      OffsetRect(Rect, -1, -1);
      Canvas.Font.Color := clBtnShadow;
      FDrawTextProc(Canvas.Handle, Text, Rect, Flags);
    end;
    }
  end;
end;
*)


end.
