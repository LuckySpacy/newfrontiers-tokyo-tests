unit NFSMaskButtonedEdit;

interface

{$R 'NFSMaskButtonedEdit.dcr'}


uses
  SysUtils, Classes, vcl.Controls, vcl.StdCtrls, vcl.Mask, vcl.ImgList, vcl.ExtCtrls, Messages, vcl.Menus,
  Windows, vcl.Themes, vcl.Forms, vcl.Graphics, NfsCustomMaskEdit, System.UITypes,
  System.Types;



type
  TNFSCustomMaskButtonedEdit = class;

  TNFSEditButton = class(TPersistent)
  strict private
    type
      TButtonState = (bsNormal, bsHot, bsPushed);
      TGlyph = class(TCustomControl)
      private
        FButton: TNFSEditButton;
        FState: TButtonState;
      protected
        procedure Click; override;
        procedure CreateWnd; override;
        procedure Paint; override;
        procedure WndProc(var Message: TMessage); override;
      public
        constructor Create(AButton: TNFSEditButton); reintroduce; virtual;
      end;
  protected
    type
      TButtonPosition = (bpLeft, bpRight);
  strict private
    FDisabledImageIndex: TImageIndex;
    FDropDownMenu: TPopupMenu;
    FEditControl: TNFSCustomMaskButtonedEdit;
    FGlyph: TGlyph;
    FHotImageIndex: TImageIndex;
    FImageIndex: TImageIndex;
    FPosition: TButtonPosition;
    FPressedImageIndex: TImageIndex;
    function GetEnabled: Boolean;
    function GetCustomHint: TCustomHint;
    function GetHint: string;
    function GetImages: TImageList;
    function GetVisible: Boolean;
    procedure SetDisabledImageIndex(const Value: TImageIndex);
    procedure SetEnabled(const Value: Boolean);
    procedure SetCustomHint(const Value: TCustomHint);
    procedure SetHint(const Value: string);
    procedure SetHotImageIndex(const Value: TImageIndex);
    procedure SetImageIndex(const Value: TImageIndex);
    procedure SetPressedImageIndex(const Value: TImageIndex);
    procedure SetVisible(const Value: Boolean);
  protected
    function GetOwner: TPersistent; override;
    procedure UpdateBounds; dynamic;
    property EditControl: TNFSCustomMaskButtonedEdit read FEditControl;
    property Glyph: TGlyph read FGlyph;
    property Images: TImageList read GetImages;
    property Position: TButtonPosition read FPosition;
  public
    constructor Create(EditControl: TNFSCustomMaskButtonedEdit; APosition: TButtonPosition); reintroduce; virtual;
    destructor Destroy; override;
  published
    property CustomHint: TCustomHint read GetCustomHint write SetCustomHint;
    property DisabledImageIndex: TImageIndex read FDisabledImageIndex write SetDisabledImageIndex default -1;
    property DropDownMenu: TPopupMenu read FDropDownMenu write FDropDownMenu;
    property Enabled: Boolean read GetEnabled write SetEnabled default True;
    property Hint: string read GetHint write SetHint;
    property HotImageIndex: TImageIndex read FHotImageIndex write SetHotImageIndex default -1;
    property ImageIndex: TImageIndex read FImageIndex write SetImageIndex default -1;
    property PressedImageIndex: TImageIndex read FPressedImageIndex write SetPressedImageIndex default -1;
    property Visible: Boolean read GetVisible write SetVisible default False;
  end;

  TNFSEditButtonClass = class of TNFSEditButton;

  TNFSCustomMaskButtonedEdit = class(TNfsCustomMaskEdit)
  private
    FCanvas: TControlCanvas;
    FImages: TImageList;
    FImageChangeLink: TChangeLink;
    FLeftButton: TNFSEditButton;
    FRightButton: TNFSEditButton;
    function AdjustTextHint(Margin: Integer; const Value: string): string;
    procedure ImageListChange(Sender: TObject);
    procedure SetImages(const Value: TImageList);
    function GetOnLeftButtonClick: TNotifyEvent;
    function GetOnRightButtonClick: TNotifyEvent;
    procedure SetLeftButton(const Value: TNFSEditButton);
    procedure SetOnLeftButtonClick(const Value: TNotifyEvent);
    procedure SetOnRightButtonClick(const Value: TNotifyEvent);
    procedure SetRightButton(const Value: TNFSEditButton);
  protected
    procedure DoSetTextHint(const Value: string); override;
    function GetEditButtonClass: TNFSEditButtonClass; dynamic;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure UpdateEditMargins; reintroduce;
    procedure WndProc(var Message: TMessage); override;
    property LeftButton: TNFSEditButton read FLeftButton write SetLeftButton;
    property RightButton: TNFSEditButton read FRightButton write SetRightButton;
    property OnLeftButtonClick: TNotifyEvent read GetOnLeftButtonClick write SetOnLeftButtonClick;
    property OnRightButtonClick: TNotifyEvent read GetOnRightButtonClick write SetOnRightButtonClick;
    property Images: TImageList read FImages write SetImages;
  public
    procedure DefaultHandler(var Message); override;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
  end;

  TNFSMaskButtonedEdit = class(TNFSCustomMaskButtonedEdit)
  private
  protected
  public
  published
    property Align;
    property Alignment;
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
    property CharCase;
    property Color;
    property Constraints;
    property Ctl3D;
    property DoubleBuffered;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property EditMask;
    property Font;
    property ImeMode;
    property ImeName;
    property MaxLength;
    property ParentBiDiMode;
    property ParentColor;
    property ParentCtl3D;
    property ParentDoubleBuffered;
    property ParentFont;
    property ParentShowHint;
    property PasswordChar;
    property PopupMenu;
    property ReadOnly;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Text;
    property TextHint;
    property Touch;
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

    property Images;
    property LeftButton;
    property RightButton;
    property OnLeftButtonClick;
    property OnRightButtonClick;
  end;


procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('new frontiers', [TNFSMaskButtonedEdit]);
end;

{ TNFSCustomMaskButtonedEdit }

function TNFSCustomMaskButtonedEdit.AdjustTextHint(Margin: Integer;
  const Value: string): string;
var
  LWidth, Count: Integer;
begin
  if (Margin = 0) or (Win32MajorVersion >= 6) then
    inherited DoSetTextHint(Value)
  else
  begin
    FCanvas.Font := Font;
    LWidth := FCanvas.TextWidth(' ');
    Count := Margin div LWidth;
    if (Margin mod LWidth) > 0 then
      Inc(Count);
    inherited DoSetTextHint(StringOfChar(' ', Count) + Value);
  end;
end;

constructor TNFSCustomMaskButtonedEdit.Create(AOwner: TComponent);
begin
  inherited;
  FCanvas := TControlCanvas.Create;
  FCanvas.Control := Self;
  FImageChangeLink := TChangeLink.Create;
  FImageChangeLink.OnChange := ImageListChange;
  FLeftButton := GetEditButtonClass.Create(Self, bpLeft);
  FRightButton := GetEditButtonClass.Create(Self, bpRight);
end;

{$LEGACYIFEND ON}
procedure TNFSCustomMaskButtonedEdit.DefaultHandler(var Message);
{$IF DEFINED(CLR)}
var
  LMessage: TMessage;
{$IFEND}
begin
  inherited;
{$IF DEFINED(CLR)}
  LMessage := UnwrapMessage(TObject(Message));
  case LMessage.Msg of
{$ELSE}
  case TMessage(Message).Msg of
{$IFEND}
    CN_CTLCOLOREDIT:
      begin
        FLeftButton.Glyph.Invalidate;
        FRightButton.Glyph.Invalidate;
      end;
    WM_SIZE: FRightButton.UpdateBounds;
  end;
end;
{$LEGACYIFEND OFF}

destructor TNFSCustomMaskButtonedEdit.Destroy;
begin
  FreeAndNil(FCanvas);
  FreeAndNil(FImageChangeLink);
  FreeAndNil(FLeftButton);
  FreeAndNil(FRightButton);
  inherited;
end;

procedure TNFSCustomMaskButtonedEdit.DoSetTextHint(const Value: string);
begin
  AdjustTextHint(0, Value);
end;

function TNFSCustomMaskButtonedEdit.GetEditButtonClass: TNFSEditButtonClass;
begin
  Result := TNFSEditButton;
end;

function TNFSCustomMaskButtonedEdit.GetOnLeftButtonClick: TNotifyEvent;
begin
  Result := LeftButton.Glyph.OnClick;
end;

function TNFSCustomMaskButtonedEdit.GetOnRightButtonClick: TNotifyEvent;
begin
  Result := RightButton.Glyph.OnClick;
end;

procedure TNFSCustomMaskButtonedEdit.ImageListChange(Sender: TObject);
begin
  if HandleAllocated then
  begin
    FLeftButton.UpdateBounds;
    FRightButton.UpdateBounds;
    UpdateEditMargins;
  end;
end;

procedure TNFSCustomMaskButtonedEdit.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if Operation = opRemove then
  begin
    if AComponent = FImages then
    begin
      FImages := nil;
      FLeftButton.UpdateBounds;
      FRightButton.UpdateBounds;
      UpdateEditMargins;
    end
    else if (LeftButton <> nil) and (AComponent = LeftButton.DropDownMenu) then
      LeftButton.DropDownMenu := nil
    else if (RightButton <> nil) and (AComponent = RightButton.DropDownMenu) then
      RightButton.DropDownMenu := nil;
  end;
end;

procedure TNFSCustomMaskButtonedEdit.SetImages(const Value: TImageList);
begin
  if Value <> FImages then
  begin
    if FImages <> nil then
      FImages.UnRegisterChanges(FImageChangeLink);
    FImages := Value;
    if FImages <> nil then
    begin
      FImages.RegisterChanges(FImageChangeLink);
      FImages.FreeNotification(Self);
    end;
    FLeftButton.UpdateBounds;
    FRightButton.UpdateBounds;
    UpdateEditMargins;
  end;
end;

procedure TNFSCustomMaskButtonedEdit.SetLeftButton(const Value: TNFSEditButton);
begin
  FLeftButton.Assign(Value);
end;

procedure TNFSCustomMaskButtonedEdit.SetOnLeftButtonClick(const Value: TNotifyEvent);
begin
  LeftButton.Glyph.OnClick := Value;
end;

procedure TNFSCustomMaskButtonedEdit.SetOnRightButtonClick(const Value: TNotifyEvent);
begin
  RightButton.Glyph.OnClick := Value;
end;

procedure TNFSCustomMaskButtonedEdit.SetRightButton(const Value: TNFSEditButton);
begin
  FRightButton.Assign(Value);
end;

procedure TNFSCustomMaskButtonedEdit.UpdateEditMargins;
var
  LMargin, RMargin: Integer;
begin
  if HandleAllocated then
  begin
    LMargin := 0;
    RMargin := 0;
    if (Images <> nil) then
    begin
      if LeftButton.Visible then
        LMargin := Images.Width + 2;
      if RightButton.Visible then
        RMargin := Images.Width + 2;
    end;
    SendMessage(Handle, EM_SETMARGINS, EC_LEFTMARGIN or EC_RIGHTMARGIN, MakeLong(LMargin, RMargin));
    AdjustTextHint(LMargin, TextHint);
    Invalidate;
  end;
end;


procedure TNFSCustomMaskButtonedEdit.WndProc(var Message: TMessage);
var
  LLeft, LTop: Integer;
begin
  case Message.Msg of
    CN_CTLCOLORSTATIC,
    CN_CTLCOLOREDIT:
      if FImages <> nil then
      begin
        if LeftButton.Visible then
        begin
          LLeft := LeftButton.Glyph.Left;
          LTop := LeftButton.Glyph.Top;
          if StyleServices.Enabled and Ctl3D then
          begin
            Inc(LLeft);
            Inc(LTop);
          end;
          ExcludeClipRect(Message.WParam, LLeft + 1, LTop + 1,
            LeftButton.Glyph.Width + LeftButton.Glyph.Left, LeftButton.Glyph.Height);
        end;

        if RightButton.Visible then
        begin
          LTop := RightButton.Glyph.Top;
          if StyleServices.Enabled and Ctl3D then
            Inc(LTop);
          ExcludeClipRect(Message.WParam, RightButton.Glyph.Left, LTop + 1,
            RightButton.Glyph.Width + RightButton.Glyph.Left, RightButton.Glyph.Height);
        end;
      end;
  end;

  inherited;

  case Message.Msg of
    CM_BORDERCHANGED,
    CM_CTL3DCHANGED:
      begin
        if not (csLoading in ComponentState) then
        begin
          LeftButton.UpdateBounds;
          RightButton.UpdateBounds;
        end;
      end;
    CM_FONTCHANGED:
      if not (csLoading in ComponentState) then
        UpdateEditMargins;
  end;
end;




constructor TNFSEditButton.Create(EditControl: TNFSCustomMaskButtonedEdit;
  APosition: TButtonPosition);
begin
  inherited Create;
  FEditControl := EditControl;
  FGlyph := TGlyph.Create(Self);
  FHotImageIndex := -1;
  FImageIndex := -1;
  FPosition := APosition;
  FPressedImageIndex := -1;
  FDisabledImageIndex := -1;
end;

destructor TNFSEditButton.Destroy;
begin
  FGlyph.Parent.RemoveControl(FGlyph);
  FGlyph.Free;
  inherited;
end;

function TNFSEditButton.GetCustomHint: TCustomHint;
begin
  Result := FGlyph.CustomHint;
end;

function TNFSEditButton.GetEnabled: Boolean;
begin
  Result := FGlyph.Enabled;
end;

function TNFSEditButton.GetHint: string;
begin
  Result := FGlyph.Hint;
end;

function TNFSEditButton.GetImages: TImageList;
begin
  Result := FEditControl.Images;
end;

function TNFSEditButton.GetOwner: TPersistent;
begin
  Result := FEditControl;
end;

function TNFSEditButton.GetVisible: Boolean;
begin
  Result := FGlyph.Visible;
end;

procedure TNFSEditButton.SetCustomHint(const Value: TCustomHint);
begin
  if Value <> FGlyph.CustomHint then
    FGlyph.CustomHint := Value;
end;

procedure TNFSEditButton.SetDisabledImageIndex(const Value: TImageIndex);
begin
  if Value <> FDisabledImageIndex then
  begin
    FDisabledImageIndex := Value;
    if not Enabled then
      FGlyph.Invalidate;
  end;
end;

procedure TNFSEditButton.SetEnabled(const Value: Boolean);
begin
  if Value <> FGlyph.Enabled then
  begin
    FGlyph.Enabled := Value;
    FGlyph.Invalidate;
  end;
end;

procedure TNFSEditButton.SetHint(const Value: string);
begin
  if Value <> FGlyph.Hint then
    FGlyph.Hint := Value;
end;

procedure TNFSEditButton.SetHotImageIndex(const Value: TImageIndex);
begin
  if Value <> FHotImageIndex then
  begin
    FHotImageIndex := Value;
    if FGlyph.FState = bsHot then
      FGlyph.Invalidate;
  end;
end;

procedure TNFSEditButton.SetImageIndex(const Value: TImageIndex);
begin
  if Value <> FImageIndex then
  begin
    FImageIndex := Value;
    if FGlyph.FState = bsNormal then
      FGlyph.Invalidate;
  end;
end;

procedure TNFSEditButton.SetPressedImageIndex(const Value: TImageIndex);
begin
  if Value <> FPressedImageIndex then
  begin
    FPressedImageIndex := Value;
    if FGlyph.FState = bsPushed then
      FGlyph.Invalidate;
  end;
end;

procedure TNFSEditButton.SetVisible(const Value: Boolean);
begin
  if Value <> FGlyph.Visible then
  begin
    FGlyph.Visible := Value;
    FEditControl.UpdateEditMargins;
  end;
end;

procedure TNFSEditButton.UpdateBounds;
var
  EdgeSize, NewLeft: Integer;
begin
  if FGlyph <> nil then
  begin
    if Images <> nil then
    begin
      FGlyph.Width := Images.Width;
      FGlyph.Height := Images.Height;
    end
    else
    begin
      FGlyph.Width := 0;
      FGlyph.Height := 0;
    end;
    FGlyph.Top := 0;
    NewLeft := FGlyph.Left;

    if not StyleServices.Enabled then
      FGlyph.Top := 1;

    case FPosition of
      bpLeft:
        begin
          if StyleServices.Enabled then
            NewLeft := 0
          else
            NewLeft := 1;
        end;
      bpRight:
        begin
          NewLeft := FEditControl.Width - FGlyph.Width;
          if FEditControl.BorderStyle <> bsNone then
            Dec(NewLeft, 4);
          if FEditControl.BevelKind <> bkNone then
          begin
            EdgeSize := 0;
            if FEditControl.BevelInner <> bvNone then
              Inc(EdgeSize, FEditControl.BevelWidth);
            if FEditControl.BevelOuter <> bvNone then
              Inc(EdgeSize, FEditControl.BevelWidth);
            if beRight in FEditControl.BevelEdges then
              Dec(NewLeft, EdgeSize);
            if beLeft in FEditControl.BevelEdges then
              Dec(NewLeft, EdgeSize);
          end;
          if not StyleServices.Enabled then
            Dec(NewLeft);
        end;
    end;

    if (not FEditControl.Ctl3D) and (FEditControl.BorderStyle <> bsNone) then
    begin
      FGlyph.Top := 2;
      Inc(NewLeft, 2);
    end;

    FGlyph.Left := NewLeft;

    if (csDesigning in FEditControl.ComponentState) and not Visible then
      FGlyph.Width := 0;
  end;
end;


procedure TNFSEditButton.TGlyph.Click;
begin
  // Replicate from TControl to set Sender to owning TButtonedEdit control
  if Assigned(OnClick) and (Action <> nil) and not DelegatesEqual(@OnClick, @Action.OnExecute) then
    OnClick(FButton.EditControl)
  else if not (csDesigning in ComponentState) and (ActionLink <> nil) then
    ActionLink.Execute(FButton.EditControl)
  else if Assigned(OnClick) then
    OnClick(FButton.EditControl);
end;

procedure TNFSEditButton.TGlyph.CreateWnd;
begin
  inherited;
  if Visible then
    FButton.FEditControl.UpdateEditMargins;
end;


procedure TNFSEditButton.TGlyph.Paint;
var
  LIndex: Integer;
begin
  inherited;
  if (FButton.Images <> nil) and Visible then
  begin
    LIndex := FButton.ImageIndex;
    if Enabled then
    begin
      case FState of
        bsHot:
          if FButton.HotImageIndex <> -1 then
            LIndex := FButton.HotImageIndex;
        bsPushed:
          if FButton.PressedImageIndex <> -1 then
            LIndex := FButton.PressedImageIndex;
      end;
    end
    else
      if FButton.DisabledImageIndex <> -1 then
        LIndex := FButton.DisabledImageIndex;
    if LIndex <> -1 then
      FButton.Images.Draw(Canvas, 0, 0, LIndex);
  end;
end;


procedure TNFSEditButton.TGlyph.WndProc(var Message: TMessage);
var
  LPoint: TPoint;
begin
  if (Message.Msg = WM_CONTEXTMENU) and (FButton.EditControl.PopupMenu = nil) then
    Exit;

  inherited;
  case Message.Msg of
    CM_MOUSEENTER: FState := bsHot;
    CM_MOUSELEAVE: FState := bsNormal;
    WM_LBUTTONDOWN:
      if FButton.FDropDownMenu <> nil then
      begin
        if not (csDesigning in Parent.ComponentState) then
        begin
          LPoint := ClientToScreen(Point(0, FButton.EditControl.Height));
          FButton.FDropDownMenu.Popup(LPoint.X, LPoint.Y);
        end;
      end
      else
        FState := bsPushed;
    WM_LBUTTONUP: FState := bsHot;
    CM_VISIBLECHANGED: FButton.UpdateBounds;
  else
    Exit;
  end;
  Invalidate;
end;

constructor TNFSEditButton.TGlyph.Create(AButton: TNFSEditButton);
begin
  inherited Create(AButton.FEditControl);
  FButton := AButton;
  FState := bsNormal;
  Parent := FButton.FEditControl;
  Visible := False;
end;






end.

