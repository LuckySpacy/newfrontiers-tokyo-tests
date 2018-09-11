unit NFSEditButton;

interface

uses
  Winapi.Messages, Winapi.Windows, System.SysUtils, System.Classes, System.Contnrs, System.UITypes,
  Vcl.Controls, Vcl.Forms, Vcl.Menus, Vcl.Graphics, Vcl.StdCtrls, Vcl.GraphUtil, Vcl.ImgList, Vcl.Themes, Winapi.ShellAPI,
  nfsCustomMaskEdit;

type
  TNFSMaskButtonedEdit = class(TNfsCustomMaskEdit)
  public
    Images: TImageList;
end;

type
  TtbEditButton = class(TPersistent)
  strict private
    type
      TButtonState = (bsNormal, bsHot, bsPushed);
      TGlyph = class(TCustomControl)
      private
        FButton: TtbEditButton;
        FState: TButtonState;
      protected
        procedure Click; override;
        procedure CreateWnd; override;
        procedure Paint; override;
        procedure WndProc(var Message: TMessage); override;
      public
        constructor Create(AButton: TtbEditButton); reintroduce; virtual;
      end;
  protected
    type
      TButtonPosition = (bpLeft, bpRight);
  strict private
    FDisabledImageIndex: System.UITypes.TImageIndex;
    FDropDownMenu: TPopupMenu;
    FEditControl: TNFSMaskButtonedEdit;
    FGlyph: TGlyph;
    FHotImageIndex: System.UITypes.TImageIndex;
    FImageIndex: System.UITypes.TImageIndex;
    FPosition: TButtonPosition;
    FPressedImageIndex: System.UITypes.TImageIndex;
    function GetEnabled: Boolean;
    function GetCustomHint: TCustomHint;
    function GetHint: string;
    function GetImages: TImageList;
    function GetVisible: Boolean;
    procedure SetDisabledImageIndex(const Value: System.UITypes.TImageIndex);
    procedure SetEnabled(const Value: Boolean);
    procedure SetCustomHint(const Value: TCustomHint);
    procedure SetHint(const Value: string);
    procedure SetHotImageIndex(const Value: System.UITypes.TImageIndex);
    procedure SetImageIndex(const Value: System.UITypes.TImageIndex);
    procedure SetPressedImageIndex(const Value: System.UITypes.TImageIndex);
    procedure SetVisible(const Value: Boolean);
  protected
    function GetOwner: TPersistent; override;
    procedure UpdateBounds; dynamic;
    property EditControl: TNFSMaskButtonedEdit read FEditControl;
    property Glyph: TGlyph read FGlyph;
    property Images: TImageList read GetImages;
    property Position: TButtonPosition read FPosition;
  public
    constructor Create(EditControl: TNFSMaskButtonedEdit; APosition: TButtonPosition); reintroduce; virtual;
    destructor Destroy; override;
  published
    property CustomHint: TCustomHint read GetCustomHint write SetCustomHint;
    property DisabledImageIndex: System.UITypes.TImageIndex read FDisabledImageIndex write SetDisabledImageIndex default -1;
    property DropDownMenu: TPopupMenu read FDropDownMenu write FDropDownMenu;
    property Enabled: Boolean read GetEnabled write SetEnabled default True;
    property Hint: string read GetHint write SetHint;
    property HotImageIndex: System.UITypes.TImageIndex read FHotImageIndex write SetHotImageIndex default -1;
    property ImageIndex: System.UITypes.TImageIndex read FImageIndex write SetImageIndex default -1;
    property PressedImageIndex: System.UITypes.TImageIndex read FPressedImageIndex write SetPressedImageIndex default -1;
    property Visible: Boolean read GetVisible write SetVisible default False;
  end;


implementation

{ TtbEditButton }

uses
  nfsMaskButtonedEdit;

constructor TtbEditButton.Create(EditControl: TNFSMaskButtonedEdit;
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

destructor TtbEditButton.Destroy;
begin
  FGlyph.Parent.RemoveControl(FGlyph);
  FGlyph.Free;
  inherited;
end;

function TtbEditButton.GetCustomHint: TCustomHint;
begin
  Result := FGlyph.CustomHint;
end;

function TtbEditButton.GetEnabled: Boolean;
begin
  Result := FGlyph.Enabled;
end;

function TtbEditButton.GetHint: string;
begin
  Result := FGlyph.Hint;
end;

function TtbEditButton.GetImages: TImageList;
begin
  Result := FEditControl.Images;
end;

function TtbEditButton.GetOwner: TPersistent;
begin
  Result := FEditControl;
end;

function TtbEditButton.GetVisible: Boolean;
begin
  Result := FGlyph.Visible;
end;

procedure TtbEditButton.SetCustomHint(const Value: TCustomHint);
begin
  if Value <> FGlyph.CustomHint then
    FGlyph.CustomHint := Value;
end;

procedure TtbEditButton.SetDisabledImageIndex(const Value: System.UITypes.TImageIndex);
begin
  if Value <> FDisabledImageIndex then
  begin
    FDisabledImageIndex := Value;
    if not Enabled then
      FGlyph.Invalidate;
  end;
end;

procedure TtbEditButton.SetEnabled(const Value: Boolean);
begin
  if Value <> FGlyph.Enabled then
  begin
    FGlyph.Enabled := Value;
    FGlyph.Invalidate;
  end;
end;

procedure TtbEditButton.SetHint(const Value: string);
begin
  if Value <> FGlyph.Hint then
    FGlyph.Hint := Value;
end;

procedure TtbEditButton.SetHotImageIndex(const Value: System.UITypes.TImageIndex);
begin
  if Value <> FHotImageIndex then
  begin
    FHotImageIndex := Value;
    if FGlyph.FState = bsHot then
      FGlyph.Invalidate;
  end;
end;

procedure TtbEditButton.SetImageIndex(const Value: System.UITypes.TImageIndex);
begin
  if Value <> FImageIndex then
  begin
    FImageIndex := Value;
    if FGlyph.FState = bsNormal then
      FGlyph.Invalidate;
  end;
end;

procedure TtbEditButton.SetPressedImageIndex(const Value: System.UITypes.TImageIndex);
begin
  if Value <> FPressedImageIndex then
  begin
    FPressedImageIndex := Value;
    if FGlyph.FState = bsPushed then
      FGlyph.Invalidate;
  end;
end;

procedure TtbEditButton.SetVisible(const Value: Boolean);
begin
  if Value <> FGlyph.Visible then
  begin
    FGlyph.Visible := Value;
    FEditControl.UpdateEditMargins;
  end;
end;

procedure TtbEditButton.UpdateBounds;
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

{ TtbEditButton.TGlyph }

procedure TtbEditButton.TGlyph.Click;
begin
  if Assigned(OnClick) and (Action <> nil) and not DelegatesEqual(@OnClick, @Action.OnExecute) then
    OnClick(FButton.EditControl)
  else if not (csDesigning in ComponentState) and (ActionLink <> nil) then
    ActionLink.Execute(FButton.EditControl)
  else if Assigned(OnClick) then
    OnClick(FButton.EditControl);
end;

constructor TtbEditButton.TGlyph.Create(AButton: TtbEditButton);
begin
  inherited Create(AButton.FEditControl);
  FButton := AButton;
  FState := bsNormal;
  Parent := FButton.FEditControl;
  Visible := False;
end;

procedure TtbEditButton.TGlyph.CreateWnd;
begin
  inherited;
  if Visible then
    FButton.FEditControl.UpdateEditMargins;
end;

procedure TtbEditButton.TGlyph.Paint;
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

procedure TtbEditButton.TGlyph.WndProc(var Message: TMessage);
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

end.

