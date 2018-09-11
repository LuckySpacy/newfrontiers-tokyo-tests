unit nfsButton;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Winapi.CommCtrl, Vcl.ImgList, vcl.Graphics,
  Vcl.StdCtrls, System.Types, Winapi.Messages, nfsPropPos, System.UITypes, Vcl.comStrs,
  Vcl.Consts, Vcl.ToolWin, Vcl.ListActns, Vcl.StdActns, Vcl.Forms, Contnrs,
  nfsPropNotification, nfsPropTextAndImageCenter, nfsButtonPosBerechnung;


type
  TTextPoint=class
    X: Integer;
    Y: Integer;
  end;


type
  TNumGlyphs = 1..4;
  TnfsButtonState = (nfBtnOver, nfBtnDown, nfBtnNone);
  TnfsButton = class(TCustomControl)
  private
    fState: TnfsButtonState;
    fImages: TCustomImageList;
    fImageIndex: Integer;
    fbmp: TBitmap;
    fDrawBmp: TBitmap;
    fCaption1: string;
    FOnClick: TNotifyEvent;
    FImageAlignment: TImageAlignment;
    fImagePos: TnfsPropPos;
    FTextAlignment: TImageAlignment;
    fTextPos: TnfsPropPos;
    fFlat: Boolean;
    FDisabledImageIndex: Integer;
    fDisabledImages: TCustomImageList;
    fCaption2: string;
    fNumGlyphs: TNumGlyphs;
    fKeyDown: Boolean;
    fRoundRect: Integer;
    fColor: TColor;
    fColorSelect: TColor;
    fColorDown: TColor;
    fShowFrameSelect: Boolean;
    fShowFrameDown: Boolean;
    fGlyphIsDrawing: Boolean;
    fShowAccelChar: Boolean;
    fHotkeyId: UIntPtr;
    fDefault: Boolean;
    fHotKeySign: String;
    fHotKeyCharCode: Integer;
    fTextList: TStringList;
    fTextPointList: TObjectList;
    fTextAbstand: Integer;
    fShowTextDown: Boolean;
    fFont: TFont;
    fEscIsBtnClick: Boolean;
    fPropNotification: TnfsPropNotification;
    fShowCaption: Boolean;
    fTextAlignIgnoreImage: Boolean;
    fPosBerechnung: TnfsButtonPosBerechnung;
    fTextAndImageCenter: TnfsPropTextAndImageCenter;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure WMLButtonUp(var Message: TWMLButtonUp); message WM_LBUTTONUP;
    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
    procedure CMDialogKey(var Message: TCMDialogKey); message CM_DIALOGKEY;
    procedure CMParentColorChanged(var Message: TMessage); message CM_PARENTCOLORCHANGED;
    procedure CMParentFontChanged(var Message: TCMParentFontChanged); message CM_PARENTFONTCHANGED;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure SetImages(const Value: TCustomImageList);
    procedure SetImageIndex(const Value: Integer);
    procedure getPicturePos(var p: TPoint);
    procedure SetTextPosByUseTextAndImageCenter;
    procedure setTextPos;
    procedure setCaption1(const Value: string);
    procedure setCaption2(const Value: string);
    procedure ButtonDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ButtonUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    function KeyDataToShiftState(KeyData: Longint): TShiftState;
    procedure SetImageAlignment(const Value: TImageAlignment);
    procedure SetTextAlignment(const Value: TImageAlignment);
    procedure setFlat(const Value: Boolean);
    procedure SetDisabledImageIndex(const Value: Integer);
    procedure SetDisabledImages(const Value: TCustomImageList);
    procedure setNumGlyps(const Value: TNumGlyphs);
    procedure DrawBitmapFromImageList(aImgList: TCustomImageList; aImageIndex: Integer);
    procedure TextFontChanged(Sender: TObject);
    procedure setRoundRect(const Value: Integer);
    procedure setColor(const Value: TColor);
    procedure setColorDown(const Value: TColor);
    procedure setColorSelect(const Value: TColor);
    procedure setShowAccelChar(const Value: Boolean);
    procedure WMHotKey(var Msg: TWMHotKey); message WM_HOTKEY;
    procedure RegistHotKey;
    procedure UnRegistHotKey;
    procedure SetDefault(Value: Boolean);
    procedure WMNCDestroy(var Message: TWMNCDestroy); message WM_NCDESTROY;
    procedure SizeMove(var msg: TWMSize); message WM_SIZE;
    procedure setFont(const Value: TFont);
    function GetParentFont: TFont;
    procedure NotificationTextChanged(Sender: TObject);
    procedure setShowCaption(const Value: Boolean);
    procedure setTextAlignIngoreImage(const Value: Boolean);
    procedure TextAndImageCenterChanged(Sender: TObject);
  protected
    procedure Notification(AComponent: TComponent; AOperation: TOperation); override;
    procedure DestroyWindowHandle; override;
    procedure Paint; override;
    procedure WMSetFocus(var Message: TMessage); message WM_SETFOCUS;
    procedure WMKillFocus(var Message: TMessage); message WM_KILLFOCUS;
    procedure WMKeyDown(var Message: TMessage); message WM_KEYDOWN;
    procedure WMKeyUp(var Message: TMessage); message WM_KEYUP;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyUp(var Key: Word; Shift: TShiftState); override;
    procedure ImagePosChanged(Sender: TObject);
    procedure TextPosChanged(Sender: TObject);
    procedure SetEnabled(Value: Boolean); override;
    procedure SetName(const NewName: TComponentName); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property DisabledImageIndex: Integer read FDisabledImageIndex write SetDisabledImageIndex default -1;
    property DisabledImages: TCustomImageList read fDisabledImages write SetDisabledImages;
    property Images: TCustomImageList read fImages write SetImages;
    property ImageAlignment: TImageAlignment read FImageAlignment write SetImageAlignment default iaLeft;
    property ImageIndex: Integer read FImageIndex write SetImageIndex default -1;
    property ImagePos: TnfsPropPos read fImagePos write fImagePos;
    property TextPos: TnfsPropPos read fTextPos write fTextPos;
    property Caption1: string read fCaption1 write setCaption1;
    property Caption2: string read fCaption2 write setCaption2;
    property ShowCaption: Boolean read fShowCaption write setShowCaption default true;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property TextAlignment: TImageAlignment read FTextAlignment write SetTextAlignment default iaCenter;
    property NumGlyphs: TNumGlyphs read fNumGlyphs write setNumGlyps;
    property Flat: Boolean read fFlat write setFlat default false;
    property Font: TFont read fFont write setFont;
    property RoundRect: Integer read fRoundRect write setRoundRect;

    property Color: TColor read fColor write setColor default $00E1E1E1;
    property ColorSelect: TColor read fColorSelect write setColorSelect default $00FBF1E5;
    property ColorDown: TColor read fColorDown write setColorDown default $00FBF1E5;

    {
    property Color: TColor read fColor write setColor;
    property ColorSelect: TColor read fColorSelect write setColorSelect;
    property ColorDown: TColor read fColorDown write setColorDown;
    }

    property ShowFrameSelect: Boolean read fShowFrameSelect write fShowFrameSelect default true;
    property ShowFrameDown: Boolean read fShowFrameDown write fShowFrameDown default true;
    property ParentColor default false;
    property TabStop;
    property Enabled;
    property Align;
    property ShowAccelChar: Boolean read fShowAccelChar write setShowAccelChar default true;
    property Anchors;
    property Visible;
    property ParentFont;
    property Default: Boolean read fDefault write setDefault default false;
    property ShowTextDown: Boolean read fShowTextDown write fShowTextDown default true;
    property EscIsBtnClick: Boolean read fEscIsBtnClick write fEscIsBtnClick default false;
    property NotificationText: TnfsPropNotification read fPropNotification write fPropNotification;
    property TextAlignIgnoreImage: Boolean read fTextAlignIgnoreImage write setTextAlignIngoreImage default false;
    property TextAndImageCenter: TnfsPropTextAndImageCenter read fTextAndImageCenter write fTextAndImageCenter;
    property Hint;
    property ShowHint;
    property OnMouseMove;
    property OnMouseDown;
    property OnMouseUp;
    property OnMouseLeave;
    property OnMouseEnter;
    property OnEnter;
    property OnExit;
  end;

procedure Register;

implementation

uses
  Vcl.Dialogs, Winapi.Windows, System.TypInfo;

procedure Register;
begin
  RegisterComponents('new frontiers', [TnfsButton]);
end;

{ TnfButton }



constructor TnfsButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  fShowCaption := true;
  fKeyDown := false;
  fState := nfBtnNone;
            {
  if (AOwner<>nil) And (csDesigning In ComponentState) And Not (csReading In AOwner.ComponentState) then
  begin
  end;
    }
  FImages := nil;
  FImageIndex := -1;
  fDisabledImages := nil;
  FDisabledImageIndex := -1;
  fRoundRect := 0;
  setColor($00E1E1E1);
  setColorSelect($00FBF1E5);
  setColorDown($00FBF1E5);
  fShowFrameSelect := true;
  fShowFrameDown := true;
  ParentColor := false;
  SetTextAlignment(iaCenter);
  Width := 75;
  Height := 25;
  fShowAccelChar := true;
  fHotkeyId := 0;
  fShowTextDown := true;
  fHotKeyCharCode := 0;
  fCaption1 := '';
  fEscIsBtnClick := false;



  fTextAbstand := 2;
  fNumGlyphs := 1;
  fFont := TFont.Create;
  fFont.OnChange := TextFontChanged;

  fbmp      := Vcl.Graphics.TBitmap.Create;
  fDrawBmp  := Vcl.Graphics.TBitmap.Create;
  fTextList := TStringList.Create;
  fTextList.Add('');
  fTextList.Add('');

  fTextPointList := TObjectList.Create;
  fTextPointList.Add(TTextPoint.Create);
  fTextPointList.Add(TTextPoint.Create);



  fImagePos := TnfsPropPos.Create;
  fImagePos.Left := 8;
  fImagePos.Right := 8;
  fImagePos.OnChanged := ImagePosChanged;

  fPropNotification := TnfsPropNotification.Create;
  fPropNotification.OnChanged := NotificationTextChanged;
  fPropNotification.Width  := Width;
  fPropNotification.Height := Height;
  fPropNotification.Canvas := Canvas;

  fTextPos := TnfsPropPos.Create;
  fTextPos.OnChanged := TextPosChanged;

  fTextAndImageCenter := TnfsPropTextAndImageCenter.Create;
  fTextAndImageCenter.OnChanged := TextAndImageCenterChanged;

  fPosBerechnung := TnfsButtonPosBerechnung.Create;



  //fmyHandle := 0;
  //if not (csDesigning In ComponentState) then
  //  fmyHandle := Handle;

end;

destructor TnfsButton.Destroy;
begin
  FreeAndNil(fImagePos);
  FreeAndNil(fPropNotification);
  FreeAndNil(fTextPos);
  FreeAndNil(fbmp);
  FreeAndNil(fDrawBmp);
  FreeAndNil(fTextList);
  FreeAndNil(fTextPointList);
  FreeAndNil(fFont);
  FreeAndNil(fPosBerechnung);
  FreeAndNil(fTextAndImageCenter);
  inherited;
end;


procedure TnfsButton.DestroyWindowHandle;
begin
  UnRegistHotKey;
  inherited;
end;

procedure TnfsButton.WMNCDestroy(var Message: TWMNCDestroy);
begin
  UnRegistHotKey;
  inherited;
end;

procedure TnfsButton.UnRegistHotKey;
begin
  exit;
  if fHotKeyId > 0 then
  begin
    UnRegisterHotKey(Handle, fHotKeyID);
    GlobalDeleteAtom(fHotKeyID);
    fHotkeyId := 0;
  end;
end;


procedure TnfsButton.Paint;
var
  Rect: TRect;
  NewRect: TRect;
  p_bmp: TPoint;
  s1: string;
  s2: string;
  i1: Integer;
  TextPoint : TTextPoint;
begin

  Rect := GetClientRect;

  Canvas.Pen.Color   := Parent.Brush.Color;
  Canvas.Brush.Color := Parent.Brush.Color;

  newRect.Top := Rect.Top -1;
  newRect.Left := Rect.Left -1;
  newRect.Bottom := Rect.Bottom +1;
  newRect.Right := Rect.Right +1;

  Canvas.RoundRect(newRect, fRoundRect, fRoundRect);

  if (FState = nfBtnNone) then
  begin
    Canvas.Pen.Color := clBtnShadow;
    //Canvas.Pen.Color := clBtnFace;
    //Canvas.Brush.Color := clBtnFace;
    Canvas.Brush.Color := fColor;
    if not fFlat then
      Canvas.RoundRect(Rect, fRoundRect, fRoundRect);
  end;

  if (FState = nfBtnOver) then
  begin
    Canvas.Pen.Color := clBtnShadow;
    //Canvas.Brush.Color := $00FBF1E5;
    Canvas.Brush.Color := fColorSelect;
    if fFlat then
    begin
      if fColorSelect = $00FBF1E5 then
        Canvas.Pen.Color := $00F9E2C6;
    end;
    if not fShowFrameSelect then
      Canvas.Pen.Color := Canvas.Brush.Color;
    Canvas.RoundRect(Rect, fRoundRect, fRoundRect);
  end;

  if (FState = nfBtnDown) then
  begin
    Canvas.Pen.Color := clBtnShadow;
    //Canvas.Pen.Color := $00995400;
    //Canvas.Brush.Color := $00FBF1E5;
    if not fShowFrameDown then
      Canvas.Pen.Color := Canvas.Brush.Color;
    Canvas.Brush.Color := fColorDown;
    Canvas.RoundRect(Rect, fRoundRect, fRoundRect);
    Rect.Top := Rect.Top + 1;
    Rect.Left := Rect.Left + 1;
    Rect.Right := Rect.Right - 1;
    Rect.Bottom := Rect.Bottom - 1;
    Canvas.Pen.Color := clBtnHighlight;
    if not fShowFrameDown then
      Canvas.Pen.Color := Canvas.Brush.Color;
    Canvas.RoundRect(Rect, fRoundRect, fRoundRect);
  end;

  if ((GetFocus = Handle) and (TabStop)) or (fDefault) then
  begin
    Rect.Left := Rect.Left + 1;
    Rect.Top := Rect.Top + 1;
    Rect.Bottom := Rect.Bottom - 1;
    Rect.Right := Rect.Right - 1;

    Canvas.DrawFocusRect(Rect);
  end;

  fGlyphIsDrawing := false;
  p_bmp.Y := 0;
  p_bmp.X := 0;
  if (fImageIndex > -1) and (fImages <> nil) and (Enabled) then
  begin
    DrawBitmapFromImageList(fImages, fImageIndex);
    getPicturePos(p_bmp);
    canvas.Draw(p_bmp.x,p_bmp.Y,fDrawBmp);
    fGlyphIsDrawing := true;
  end;

  if (fImageIndex > -1) and (fImages <> nil) and (not Enabled) and (fNumGlyphs > 1) then
  begin
    DrawBitmapFromImageList(fImages, fImageIndex);
    getPicturePos(p_bmp);
    canvas.Draw(p_bmp.x,p_bmp.Y,fDrawBmp);
    fGlyphIsDrawing := true;
  end;


  if (FDisabledImageIndex > -1) and (fDisabledImages <> nil) and (not Enabled) and (fNumGlyphs = 1) then
  begin
    DrawBitmapFromImageList(fDisabledImages, FDisabledImageIndex);
    getPicturePos(p_bmp);
    canvas.Draw(p_bmp.x,p_bmp.Y,fDrawBmp);
    fGlyphIsDrawing := true;
  end;


  Canvas.Brush.style := bsClear;
  Canvas.Font.Assign(Font);


  setTextPos;

  if not Enabled then
    Canvas.Font.Color := clBtnShadow;

  if fShowCaption then
  begin
    for i1 := 0 to fTextList.Count -1 do
    begin
      s1 := fTextList.Strings[i1];
      TextPoint := TTextPoint(fTextPointList.Items[i1]);
      if (i1=0) and (fShowAccelChar) and (Length(s1) > 1) and (s1[1] = '&') then
      begin
        s1 := s1[2];
        s2 := copy(fTextList.Strings[i1], 3, Length(fTextList.Strings[i1]));
        canvas.Font.Style := canvas.Font.Style + [fsUnderline];
        canvas.TextOut(TextPoint.X, TextPoint.Y, s1);
        canvas.Font.Style := canvas.Font.Style - [fsUnderline];
        canvas.TextOut(TextPoint.X + Canvas.TextWidth(s1), TextPoint.Y, s2);
        continue;
      end;
      Canvas.TextOut(TextPoint.X, TextPoint.Y, s1);
    end;
  end;

  if Trim(fPropNotification.Caption) > '' then
  begin
    Canvas.Font.Assign(fPropNotification.Font);
    Canvas.Pen.Color := fPropNotification.CircleFrameColor;
    Canvas.Pen.Width := 1;
    Canvas.Brush.Style := bsClear;

    if fPropNotification.CircleColorTransparent then
    begin
      Canvas.Brush.Color := fColor;
      if FState = nfBtnDown then
        Canvas.Brush.Color := fColorDown;
      if FState = nfBtnOver then
        Canvas.Brush.Color := fColorSelect;
    end
    else
      Canvas.Brush.Color := fPropNotification.CircleColor;

    if (FState = nfBtnDown) and (fShowTextDown) then
      Canvas.Ellipse(fPropNotification.KreisPos.A.X+1, fPropNotification.KreisPos.A.Y+1,
                     fPropNotification.KreisPos.B.X+1, fPropNotification.KreisPos.B.Y+1)
    else
      Canvas.Ellipse(fPropNotification.KreisPos.A.X, fPropNotification.KreisPos.A.Y,
                     fPropNotification.KreisPos.B.X, fPropNotification.KreisPos.B.Y);
    Canvas.Brush.Style := bsClear;
    if (FState = nfBtnDown) and (fShowTextDown) then
      canvas.TextOut(fPropNotification.TextPos.X+1, fPropNotification.TextPos.Y+1, fPropNotification.Caption)
    else
      canvas.TextOut(fPropNotification.TextPos.X, fPropNotification.TextPos.Y, fPropNotification.Caption);
  end;



end;


procedure TnfsButton.DrawBitmapFromImageList(aImgList: TCustomImageList; aImageIndex: Integer);
var
  rDest: TRect;
  rSource: TRect;
begin
  fbmp.Height := aImgList.Height;
  fbmp.Width  := aImgList.Width;
  fbmp.Transparent := true;

  if fNumGlyphs = 1 then
  begin
    aImgList.GetBitmap(aImageIndex, fbmp);
    fDrawBmp.Height := aImgList.Height;
    fDrawBmp.Width  := aImgList.Width;
    fDrawBmp.Transparent := true;
    fDrawBmp.Canvas.Brush.Color := clFuchsia;
    fDrawBmp.Canvas.FillRect(fDrawBmp.Canvas.ClipRect);
    fDrawBmp.Canvas.Draw(0,0, fbmp);
    exit;
  end;

  fDrawBmp.Height := aImgList.Height;
  fDrawBmp.Width  := trunc(aImgList.Width/fNumGlyphs);
  fDrawBmp.Transparent := true;
  fDrawBmp.Canvas.Brush.Color := clFuchsia;
  fDrawBmp.Canvas.FillRect(fDrawBmp.Canvas.ClipRect);
  aImgList.GetBitmap(aImageIndex, fbmp);

  rDest.Left   := 0;
  rDest.Right  := fDrawBmp.Width;
  rDest.Top    := 0;
  rDest.Bottom := fDrawBmp.Height;

  if not Enabled then
  begin
    rSource.Left   := trunc(fBmp.Width / 2);
    rSource.Right  := fBmp.Width;
    rSource.Top    := 0;
    rSource.Bottom := fBmp.Height;
  end;

  if Enabled then
  begin
    rSource.Left   := 0;
    rSource.Right  := trunc(fBmp.Width / 2);
    rSource.Top    := 0;
    rSource.Bottom := fBmp.Height;
  end;


  fDrawBmp.Canvas.CopyRect(rDest, fbmp.Canvas, rSource);

end;



procedure TnfsButton.setCaption1(const Value: string);
begin
  fCaption1 := Value;
  fTextList.Strings[0] := fCaption1;
  RegistHotKey;
  Invalidate;
end;

procedure TnfsButton.RegistHotKey;
begin
  if (csDesigning in ComponentState)  then
    exit;

  if fHotKeyId > 0 then
  begin
    UnRegistHotKey;
    //UnRegisterHotKey(Handle, fHotKeyID);
    //GlobalDeleteAtom(fHotKeyID);
  end;

  fHotKeyCharCode := 0;
  fHotKeySign := '';
  if (fShowAccelChar) and (Length(fCaption1) > 1) and (fCaption1[1] = '&') then
  begin
    fHotKeySign := UpperCase(fCaption1[2]);
    fHotKeyCharCode := Ord(fHotKeySign[1]);
  end;

end;


procedure TnfsButton.setCaption2(const Value: string);
begin
  fCaption2 := Value;
  fTextList.Strings[1] := fCaption2;
  Invalidate;
end;

procedure TnfsButton.setColor(const Value: TColor);
begin
  fColor := Value;
  Invalidate;
end;

procedure TnfsButton.setColorDown(const Value: TColor);
begin
  fColorDown := Value;
end;

procedure TnfsButton.setColorSelect(const Value: TColor);
begin
  fColorSelect := Value;
end;

procedure TnfsButton.SetDisabledImageIndex(const Value: Integer);
begin
  FDisabledImageIndex := Value;
  Invalidate;
end;

procedure TnfsButton.SetDisabledImages(const Value: TCustomImageList);
begin
  fDisabledImages := Value;
  Invalidate;
end;

procedure TnfsButton.SetEnabled(Value: Boolean);
begin
  inherited;
  Invalidate;
end;

procedure TnfsButton.setFlat(const Value: Boolean);
begin
  fFlat := Value;
  Invalidate;
end;

procedure TnfsButton.setFont(const Value: TFont);
begin
  fFont.Assign(Value);
  ParentFont := false;
end;

procedure TnfsButton.getPicturePos(var p: TPoint);
var
  bmp_Height: Integer;
  bmp_Width: Integer;
  h: Integer;
  w: Integer;
begin

  if (fTextAndImageCenter.UseTextAndImageCenter) then
  begin
    SetTextPosByUseTextAndImageCenter;
    p.X := fPosBerechnung.BMPPos.X;
    p.Y := fPosBerechnung.BMPPos.Y;
    exit;
  end;


  bmp_Height := trunc(fbmp.Height / 2);
  bmp_Width  := trunc(fbmp.Width / 2);
  if fNumGlyphs > 1 then
    bmp_Width := trunc(bmp_Width / 2);

  h := trunc(Height / 2);
  w := trunc(Width / 2);

  if FImageAlignment = iaLeft then
  begin
    p.Y := h - bmp_Height;
    p.X := fImagePos.Left;
  end;

  if FImageAlignment = iaCenter then
  begin
    p.Y := h - bmp_Height;
    p.X := w - bmp_Width;
  end;


  if FImageAlignment = iaRight then
  begin
    p.Y := h - bmp_Height;
    p.X := Width - fImagePos.Right - (bmp_Width * 2);
  end;



  if FImageAlignment = iaTop then
  begin
    p.Y := fImagePos.Top;
    p.X := w - bmp_Width;
  end;

  if fImagePos.Top > 0 then
    p.Y := fImagePos.Top;

  if (fImagePos.Left > 0) and (fImageAlignment <> iaRight) then
    p.X := fImagePos.Left;


  if (FState = nfBtnDown) and (fShowTextDown) then
  begin
    p.Y := p.Y + 1;
    p.X := p.X + 1;
  end;
end;



procedure TnfsButton.SetTextPosByUseTextAndImageCenter;
var
  i1: Integer;
  TextPoint: TTextPoint;
begin
  for i1 := 0 to fTextPointList.Count -1 do
  begin
    TextPoint := TTextPoint(fTextPointList.Items[i1]);
    TextPoint.X := 0;
    TextPoint.Y := 0;
  end;


  fPosBerechnung.GlyphIsDrawing := false;
  if (fImageIndex > -1) and (fImages <> nil) and (Enabled) then
    fPosBerechnung.GlyphIsDrawing := true;

  if (fImageIndex > -1) and (fImages <> nil) and (not Enabled) and (fNumGlyphs > 1) then
    fPosBerechnung.GlyphIsDrawing := true;


  if (FDisabledImageIndex > -1) and (fDisabledImages <> nil) and (not Enabled) and (fNumGlyphs = 1) then
    fPosBerechnung.GlyphIsDrawing := true;


  Canvas.Font.Assign(Font);
  fPosBerechnung.ZeichenFlaeche.Breite := Width;
  fPosBerechnung.ZeichenFlaeche.Hoehe  := Height;
  fPosBerechnung.BMP.Hoehe  := fbmp.Height;
  fPosBerechnung.BMP.Breite := fbmp.Width;
  fPosBerechnung.Canvas := Canvas;
  fPosBerechnung.ShowAccelChar := fShowAccelChar;
  fPosBerechnung.ShowCaption   := fShowCaption;
  fPosBerechnung.ImageMargin.Left  := fTextAndImageCenter.ImageMargin.Left;
  fPosBerechnung.ImageMargin.Right := fTextAndImageCenter.ImageMargin.Right;
  fPosBerechnung.ImageLeft  := fTextAndImageCenter.ImageLeft;
  fPosBerechnung.ImageRight := fTextAndImageCenter.ImageRight;
  if fNumGlyphs > 1 then
    fPosBerechnung.BMP.Breite := trunc(fPosBerechnung.BMP.Breite / 2);
  if (fTextList.Count = 0) or ((fTextList.Count > 0) and (Trim(fTextList.Strings[0]) = '')) then
    fPosBerechnung.Caption := ''
  else
    fPosBerechnung.Caption := Trim(fTextList.Strings[0]);

  fPosBerechnung.Berechne;
  if fTextPointList.Count > 0 then
  begin
    TextPoint := TTextPoint(fTextPointList.Items[0]);
    TextPoint.X := fPosBerechnung.CaptionPos.X;
    TextPoint.Y := fPosBerechnung.CaptionPos.Y;
  end;


end;


procedure TnfsButton.setTextPos;
var
  txt_Width: Integer;
  p_bmp: TPoint;
  h: Integer;
  w: Integer;
  TextPoint: TTextPoint;
  TextPoint_Prior: TTextPoint;
  TextList: TStringList;
  GesamtHoehe: Integer;
  GesamtHoeheHalbe: Integer;
  i1: Integer;
  BildHoehe: Integer;
begin
  for i1 := 0 to fTextPointList.Count -1 do
  begin
    TextPoint := TTextPoint(fTextPointList.Items[i1]);
    TextPoint.X := 0;
    TextPoint.Y := 0;
  end;

  if (fTextList.Count = 0) or ((fTextList.Count > 0) and (Trim(fTextList.Strings[0]) = '')) then
    exit;


  h := trunc(Height / 2);
  w := trunc(Width / 2);

  if (fTextAndImageCenter.UseTextAndImageCenter) then
  begin
    SetTextPosByUseTextAndImageCenter;
    exit;
  end;


  p_bmp.X := 0;
  if (fGlyphIsDrawing) and ((FImageAlignment = iaLeft) or (FImageAlignment = iaRight)) then
  begin
    getPicturePos(p_bmp);
    if FImageAlignment = iaLeft then
    begin
      w := Width - (p_bmp.X + trunc(fbmp.Width/fNumGlyphs));
      w := trunc(w/2);
    end;
  end;

  if (fGlyphIsDrawing) and ((FImageAlignment = iaCenter) and (fImagePos.Left > 0)) then
  begin
    getPicturePos(p_bmp);
    w := Width - (p_bmp.X + trunc(fbmp.Width/fNumGlyphs));
    w := trunc(w/2);
  end;

  if (fGlyphIsDrawing) and (FImageAlignment = iaRight) then
  begin
    getPicturePos(p_bmp);
    w :=  trunc(p_bmp.X / 2);
  end;

  BildHoehe := 0;
  if (fGlyphIsDrawing) and ((FImageAlignment = iaCenter) or (FImageAlignment = iaTop)) and (fImagePos.Left = 0) then
  begin
    getPicturePos(p_bmp);
    BildHoehe := p_bmp.Y + fbmp.Height;
    h := Height - BildHoehe;
    h := trunc(h/2);
  end;

  TextList := TStringList.Create;
  try
    TextList.AddStrings(fTextList);
    if TextList.Count < 1 then
      exit;

    if (fShowAccelChar) and (Length(TextList.Strings[0]) > 1) and (TextList.Strings[0][1]='&') then
      TextList.Strings[0] := copy(TextList.Strings[0], 2, Length(TextList.Strings[0]));

    GesamtHoehe := 0;
    Canvas.Font.Assign(Font);
    for i1 := 0 to TextList.Count -1 do
    begin
      if Trim(TextList.Strings[i1]) = '' then
        continue;
      GesamtHoehe := GesamtHoehe + canvas.TextHeight(TextList.Strings[i1]);
      if i1 > 0 then
        GesamtHoehe := GesamtHoehe + fTextAbstand; // Abstand
    end;

    GesamtHoeheHalbe := trunc(GesamtHoehe / 2);

    if fTextAlignIgnoreImage then
      w := trunc(Width / 2);


    for i1 := 0 to TextList.Count -1 do
    begin
      TextPoint_Prior := nil;
      if i1 > 0 then
        TextPoint_Prior := TTextPoint(fTextPointList.Items[i1-1]);
      if Trim(TextList.Strings[i1]) > '' then
      begin
        txt_Width := trunc(canvas.TextWidth(TextList.Strings[i1]) / 2);
        TextPoint := TTextPoint(fTextPointList.Items[i1]);
        TextPoint.X := w - txt_width;
        if fTextPos.Left > 0 then
          TextPoint.X := fTextPos.Left;
        if TextPoint_Prior = nil then
        begin
          TextPoint.Y := h - GesamthoeheHalbe+ BildHoehe;
          if (fGlyphIsDrawing) and ((FImageAlignment = iaCenter) or (FImageAlignment = iaTop)) then
            TextPoint.Y := TextPoint.Y;// + fTextAbstand;
          if fTextPos.Top > 0 then
            TextPoint.Y := fTextPos.Top;
        end
        else
          TextPoint.Y := TextPoint_Prior.Y + canvas.TextHeight(TextList.Strings[i1]) + fTextAbstand;

        if (not fTextAlignIgnoreImage) and (FImageAlignment = iaLeft) or ((FImageAlignment=iaCenter) and (fImagePos.Left > 0)) then
          TextPoint.X := TextPoint.X + (p_bmp.X + trunc(fbmp.Width/fNumGlyphs));

        if (FState = nfBtnDown) and (fShowTextDown) then
        begin
          TextPoint.X := TextPoint.X + 1;
          TextPoint.Y := TextPoint.Y + 1;
        end;
      end;
    end;
  finally
    FreeAndNil(TextList);
  end;
end;


procedure TnfsButton.SizeMove(var msg: TWMSize);
begin
  fPropNotification.Width := Width;
  fPropNotification.Height := Height;
end;



procedure TnfsButton.ImagePosChanged(Sender: TObject);
begin
  Paint;
end;

procedure TnfsButton.Notification(AComponent: TComponent;
  AOperation: TOperation);
begin
  inherited;
  if (AOperation = opRemove) and (AComponent = FImages) then
  begin
    FImages := nil;
    fImageIndex := -1;
    Invalidate;
  end;
  if (AOperation = opRemove) and (AComponent = fDisabledImages) then
  begin
    fDisabledImages := nil;
    FDisabledImageIndex := -1;
    Invalidate;
  end;

end;

procedure TnfsButton.NotificationTextChanged(Sender: TObject);
begin
  Invalidate;
end;

procedure TnfsButton.SetImageAlignment(const Value: TImageAlignment);
begin
  FImageAlignment := Value;
  Invalidate;
end;

procedure TnfsButton.SetImageIndex(const Value: Integer);
begin
  fImageIndex := Value;
  Invalidate;
  Paint;
end;



procedure TnfsButton.SetImages(const Value: TCustomImageList);
begin
  if Value <> FImages then
  begin
    fImages := Value;
    if (csDesigning In ComponentState) then
    begin
      if fImages.Height * 2 = fImages.Width then
        fNumGlyphs := 2
      else
        fNumGlyphs := 1;
    end;
    Invalidate;
  end;
end;



procedure TnfsButton.SetName(const NewName: TComponentName);
begin
  inherited;
  if (csDesigning in ComponentState) and (Parent <> nil) and (ParentColor) then
    fColor := Parent.Brush.Color;
  if (csDesigning in ComponentState) and (fCaption1 = '') and (fShowCaption) then
    setCaption1(NewName);

  Invalidate;
end;

procedure TnfsButton.setNumGlyps(const Value: TNumGlyphs);
begin
  fNumGlyphs := Value;
  Invalidate;
end;

procedure TnfsButton.setRoundRect(const Value: Integer);
begin
  fRoundRect := Value;
  Invalidate;
end;

procedure TnfsButton.setShowAccelChar(const Value: Boolean);
begin
  fShowAccelChar := Value;
  RegistHotKey;
  Invalidate;
end;

procedure TnfsButton.setShowCaption(const Value: Boolean);
begin
  fShowCaption := Value;
  Invalidate;
end;

procedure TnfsButton.setTextAlignIngoreImage(const Value: Boolean);
begin
  fTextAlignIgnoreImage := Value;
  Invalidate;
end;

procedure TnfsButton.SetTextAlignment(const Value: TImageAlignment);
begin
  FTextAlignment := Value;
  Invalidate;
end;


procedure TnfsButton.TextAndImageCenterChanged(Sender: TObject);
begin
  Paint;
end;

procedure TnfsButton.TextFontChanged(Sender: TObject);
var
  f: TFont;
begin
  if ParentFont then
  begin
    f := getParentFont;
    if f <> nil then
    begin
      if (f.Color <> fFont.Color)
      or (f.Size <> fFont.Size)
      or (f.Name <> fFont.Name)
      or (f.Height <> fFont.Height) then
        ParentFont := false;
    end;
  end;
  Paint;
end;

procedure TnfsButton.TextPosChanged(Sender: TObject);
begin
  Paint;
end;


procedure TnfsButton.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
  begin
    fKeyDown := true;
    FState := nfBtnDown;
    Paint;
  end;
end;

procedure TnfsButton.KeyUp(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) and (fKeyDown) then
  begin
    fKeyDown := false;
    FState := nfBtnOver;
    Key := 0;
    if Assigned(FOnClick) then
      FOnClick(Self);
    //setFocus;
    Paint;
  end;
end;


procedure TnfsButton.WMHotKey(var Msg: TWMHotKey);
begin
  if Msg.HotKey = fHotKeyID then
  begin
    fKeyDown := false;
    if Assigned(FOnClick) then
      FOnClick(Self);
    Paint;
  end;
end;

procedure TnfsButton.WMKeyDown(var Message: TMessage);
var
  Key  : word;
  ShiftState: TShiftState;
begin
  inherited;
  Key := TWMKey(Message).CharCode;
  ShiftState := KeyDataToShiftState(TWMKey(Message).KeyData);
  KeyDown(Key, ShiftState);
end;

procedure TnfsButton.WMKeyUp(var Message: TMessage);
var
  Key  : word;
  ShiftState: TShiftState;
begin
  inherited;
  Key := TWMKey(Message).CharCode;
  ShiftState := KeyDataToShiftState(TWMKey(Message).KeyData);
  KeyUp(Key, ShiftState);
end;

function TnfsButton.KeyDataToShiftState(KeyData: Longint): TShiftState;
const
  AltMask = $20000000;
begin
  Result := [];
  if GetKeyState(VK_SHIFT) < 0 then Include(Result, ssShift);
  if GetKeyState(VK_CONTROL) < 0 then Include(Result, ssCtrl);
  if KeyData and AltMask <> 0 then Include(Result, ssAlt);
end;

procedure TnfsButton.WMKillFocus(var Message: TMessage);
begin
  inherited;
  Invalidate;
end;

procedure TnfsButton.WMLButtonDown(var Message: TWMLButtonDown);
begin
  inherited;
  ButtonDown(Self, mbLeft, [], TWMMouse(Message).XPos, TWMMouse(Message).YPos);
end;

procedure TnfsButton.WMLButtonUp(var Message: TWMLButtonUp);
begin
  inherited;
  ButtonUp(Self, mbLeft, [], TWMMouse(Message).XPos, TWMMouse(Message).YPos);
end;

procedure TnfsButton.WMPaint(var Message: TWMPaint);
begin
  inherited;
end;

procedure TnfsButton.WMSetFocus(var Message: TMessage);
begin
  inherited;
  Invalidate;
end;

procedure TnfsButton.CMDialogKey(var Message: TCMDialogKey);
var
  CanClick: Boolean;
begin
  CanClick := false;
  if  Assigned(fOnClick)
  and (KeyDataToShiftState(Message.KeyData) = [ssAlt])
  and (Message.CharCode = fHotKeyCharCode) then
    CanClick := true;

  if (Message.CharCode = VK_RETURN)
  and (KeyDataToShiftState(Message.KeyData) = [])
  and (FDefault)
  and (Assigned(fOnClick)) then
    CanClick := true;


  if (fEscIsBtnClick) and (Message.CharCode = 27)
  and (KeyDataToShiftState(Message.KeyData) = [])
  and (Assigned(fOnClick)) then
    CanClick := true;


  if CanClick then
    FOnClick(Self)
  else
    inherited;

end;


{
function TnfsButton.GetParentForm: TForm;
var
  wParent: TWinControl;
  bCancel: Boolean;
begin
  Result := nil;
  try
    wParent := Parent;
    if not Assigned(wParent) then
      exit;
    bCancel := false;
    while not bCancel do
    begin
      if not Assigned(wParent) then
        exit;
      if wParent is TForm then
      begin
        Result := TForm(wParent);
        exit;
      end;
      wParent := wParent.Parent;
    end;
  except
  end;
end;
}



procedure TnfsButton.CMFontChanged(var Message: TMessage);
begin
  inherited;
end;

procedure TnfsButton.CMMouseEnter(var Message: TMessage);
begin
  FState := nfBtnOver;
  inherited;
  Paint;
end;

procedure TnfsButton.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  FState := nfBtnNone;
  Paint;
end;

procedure TnfsButton.CMParentColorChanged(var Message: TMessage);
begin
  if ParentColor then
  begin
    if Message.wParam <> 0 then
      SetColor(TColor(Message.lParam))
    else
      setColor(Parent.Brush.Color);
  end;
end;

procedure TnfsButton.CMParentFontChanged(var Message: TCMParentFontChanged);
var
  f: TFont;
begin
  inherited;

  f := GetParentFont;
  if f <> nil then
    fFont.Assign(f);

  {
  if Parent = nil then
    exit;

  if (Parent is TWinControl) and (ParentFont) then
  begin
    if IsPublishedProp(Parent, 'Font') then
    begin
      f := TFont(GetObjectProp(Parent, 'Font', TFont));
      fFont.Assign(f);
    end;
  end;
  }

end;

function TnfsButton.GetParentFont: TFont;
begin
  Result := nil;
  if Parent = nil then
    exit;

  if (Parent is TWinControl) and (ParentFont) then
  begin
    if IsPublishedProp(Parent, 'Font') then
    begin
      Result := TFont(GetObjectProp(Parent, 'Font', TFont));
    end;
  end;
end;


procedure TnfsButton.ButtonDown(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    FState := nfBtnDown;
    Paint;
  end;
end;

procedure TnfsButton.ButtonUp(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    FState := nfBtnOver;
    Paint;
    try
      if (CanFocus) and (Visible) and (Enabled) then
        setFocus;
    except
    end;

    if Assigned(FOnClick) then
      FOnClick(Self);
  end;

  if Button = mbRight then
  begin
    //if Assigned(FOnRClick) then
    //  FOnRClick(Self);
  end;

end;


procedure TnfsButton.SetDefault(Value: Boolean);
begin
  FDefault := Value;
  Invalidate;
end;



end.
