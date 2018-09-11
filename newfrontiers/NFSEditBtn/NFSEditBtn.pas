unit NFSEditBtn;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls, Vcl.Mask, Vcl.Graphics,
  Vcl.ExtCtrls, Vcl.Forms, nfsButton, nfsEditProp, nfsEditBtnProp, Winapi.Messages ;

type
  TNFSEditBtn = class(TCustomPanel)
  private
    fEdit: TMaskEdit;
    fButton1: TnfsButton;
    fButton2: TnfsButton;
    fButton3: TnfsButton;
    fEditProp: TnfsEditProp;
    fOnEditChange: TNotifyEvent;
    fOnEditEnter: TNotifyEvent;
    fOnEditExit: TNotifyEvent;
    fOnEditDblClick: TNotifyEvent;
    fOnEditClick: TNotifyEvent;
    fOnEditKeyPress: TKeyPressEvent;
    fOnEditKeyDown: TKeyEvent;
    fOnEditKeyUp: TKeyEvent;
    fBtn1Prop: TnfsEditBtnProp;
    fBtn2Prop: TnfsEditBtnProp;
    fBtn3Prop: TnfsEditBtnProp;
    fOnButton1Click: TNotifyEvent;
    fOnButton2Click: TNotifyEvent;
    fEnabled: Boolean;
    fOnButton3Click: TNotifyEvent;
    fOnEditMouseMove: TMouseMoveEvent;
    fOnEditMouseEnter: TNotifyEvent;
    fOnEditMouseLeave: TNotifyEvent;
    fOnEditMouseUp: TMouseEvent;
    fOnEditMouseDown: TMouseEvent;
    fColorValue: TColor;
    //fColor: TColor;
    procedure EditPropChanged(Sender: TObject);
    procedure EditChange(Sender: TObject);
    procedure EditEnter(Sender: TObject);
    procedure EditExit(Sender: TObject);
    procedure EditClick(Sender: TObject);
    procedure EditDblClick(Sender: TObject);
    procedure EditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditKeyPress(Sender: TObject; var Key: Char);
    procedure EditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure setDefaultButtonStyle(aButton: TnfsButton);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ButtonResize(Sender: TObject);
    procedure EditMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure EditMouseEnter(Sender: TObject);
    procedure EditMouseLeave(Sender: TObject);
    procedure EditMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure EditMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    function getText: string;
    procedure setText(const Value: string);
    procedure setColorValue(const Value: TColor);
   // procedure setColor(const Value: TColor);
  protected
    procedure Resize; override;
    procedure WMExitSizeMove(var Message: TMessage); message WM_EXITSIZEMOVE;
    procedure Notification(AComponent: TComponent; AOperation: TOperation); override;
    procedure SizeMove(var msg: TWMSize); message WM_SIZE;
    procedure setEnabled(const Value: Boolean); reintroduce;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property ColorValue: TColor read fColorValue write setColorValue;
  published
    property Edit: TnfsEditProp read fEditProp write fEditProp;
    property Button1: TnfsEditBtnProp read fBtn1Prop write fBtn1Prop;
    property Button2: TnfsEditBtnProp read fBtn2Prop write fBtn2Prop;
    property Button3: TnfsEditBtnProp read fBtn3Prop write fBtn3Prop;
    property OnEditChange: TNotifyEvent read fOnEditChange write fOnEditChange;
    property OnEditEnter: TNotifyEvent read fOnEditEnter write fOnEditEnter;
    property OnEditExit: TNotifyEvent read fOnEditExit write fOnEditExit;
    property OnEditClick: TNotifyEvent read fOnEditClick write fOnEditClick;
    property OnEditDblClick: TNotifyEvent read fOnEditDblClick write fOnEditDblClick;
    property OnEditKeyDown: TKeyEvent read fOnEditKeyDown write fOnEditKeyDown;
    property OnEditKeyPress: TKeyPressEvent read fOnEditKeyPress write fOnEditKeyPress;
    property OnEditKeyUp: TKeyEvent read fOnEditKeyUp write fOnEditKeyUp;
    property OnButton1Click: TNotifyEvent read fOnButton1Click write fOnButton1Click;
    property OnButton2Click: TNotifyEvent read fOnButton2Click write fOnButton2Click;
    property OnButton3Click: TNotifyEvent read fOnButton3Click write fOnButton3Click;
    property OnEditMouseMove: TMouseMoveEvent read fOnEditMouseMove write fOnEditMouseMove;
    property OnEditMouseEnter: TNotifyEvent read fOnEditMouseEnter write fOnEditMouseEnter;
    property OnEditMouseLeave: TNotifyEvent read fOnEditMouseLeave write fOnEditMouseLeave;
    property OnEditMouseDown: TMouseEvent read fOnEditMouseDown write fOnEditMouseDown;
    property OnEditMouseUp: TMouseEvent read fOnEditMouseUp write fOnEditMouseUp;
    property Enabled: Boolean read fEnabled write setEnabled default true;
    property Text: string read getText write setText;
    property Hint;
    property ShowHint;
    property Anchors;
    property Align;
    //property Color: TColor read fColor write setColor;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('new frontiers', [TNFSEditBtn]);
end;

{ TNFSEditBtn }


constructor TNFSEditBtn.Create(AOwner: TComponent);
begin
  inherited;
  ShowCaption := false;
  BevelOuter  := bvNone;
  BevelKind   := bkTile;
  Height      := 22;
  ParentBackground := false;
  fEnabled := true;
  fColorValue := clNone;

  fEdit := TMaskEdit.Create(self);
  fEdit.Parent := Self;
  fEdit.Align := alNone;
  fEdit.BorderStyle := bsNone;
  fEdit.Top  := 1;
  fEdit.Left := 1;
  fEdit.ReadOnly := true;
  fEdit.OnEnter := EditEnter;
  FEdit.OnExit  := EditExit;
  FEdit.OnKeyDown := EditKeyDown;
  FEdit.OnKeyPress := EditKeyPress;
  FEdit.OnKeyUp    := EditKeyUp;
  fEdit.OnClick    := EditClick;
  fEdit.OnDblClick := EditDblClick;
  fEdit.OnMouseDown := EditMouseDown;
  fEdit.OnMouseEnter := EditMouseEnter;
  fEdit.OnMouseLeave := EditMouseLeave;
  fEdit.OnMouseMove  := EditMouseMove;
  fEdit.OnMouseUp    := EditMouseUp;

  fEdit.Height := Height;
  FEdit.Width   := 140;
  fEdit.Anchors := [akLeft,akTop,akRight,akBottom];

  fButton3 := TnfsButton.Create(Self);
  fButton3.OnClick := Button3Click;
  setDefaultButtonStyle(fButton3);


  fButton2 := TnfsButton.Create(Self);
  fButton2.OnClick := Button2Click;
  setDefaultButtonStyle(fButton2);

  fButton1 := TnfsButton.Create(Self);
  fButton1.OnClick := Button1Click;
  setDefaultButtonStyle(fButton1);


  fEditProp := TnfsEditProp.Create;
  fEditProp.Edit := fEdit;
  fEditProp.OnChanged := EditPropChanged;
  fEdit.OnChange := EditChange;
  fEdit.OnKeyDown := EditKeyDown;
  fEdit.OnKeyPress := EditKeyPress;
  fEdit.OnKeyUp    := EditKeyUp;

  fBtn1Prop := TnfsEditBtnProp.Create;
  fBtn1Prop.Button := fButton1;
  fBtn1Prop.OnResize := ButtonResize;

  fBtn2Prop := TnfsEditBtnProp.Create;
  fBtn2Prop.Button := fButton2;
  fBtn2Prop.OnResize := ButtonResize;

  fBtn3Prop := TnfsEditBtnProp.Create;
  fBtn3Prop.Button := fButton3;
  fBtn3Prop.Visible := false;
  fBtn3Prop.OnResize := ButtonResize;

  color := fEdit.Color;

  FEdit.Enabled := true;



end;


destructor TNFSEditBtn.Destroy;
begin
  FreeAndNil(fEditProp);
  FreeAndNil(fBtn1Prop);
  FreeAndNil(fBtn2Prop);
  FreeAndNil(fBtn3Prop);
  inherited;
end;



procedure TNFSEditBtn.setColorValue(const Value: TColor);
begin
  fColorValue := Value;
  fEdit.Text  := ColorToString(Value);
end;

procedure TNFSEditBtn.setDefaultButtonStyle(aButton: TnfsButton);
begin
  aButton.Parent := Self;
  aButton.Margins.Top := 0;
  aButton.Margins.Bottom := 0;
  aButton.Margins.Left := 0;
  aButton.Margins.Right := 2;
  aButton.Align := alRight;
  aButton.AlignWithMargins := true;
  aButton.TextAlignment := iaLeft;
  aButton.Left := 0;
  //aButton.TextAlignIgnoreImage := true;
  aButton.Width := 17;
  aButton.Cursor := crHandPoint;
  aButton.Flat := true;
end;


procedure TNFSEditBtn.setEnabled(const Value: Boolean);
begin
  fEnabled := Value;
  fEdit.Enabled := Value;
  fButton1.Enabled := Value;
  fButton2.Enabled := Value;
  fButton3.Enabled := Value;
end;

procedure TNFSEditBtn.setText(const Value: string);
begin
  fEditProp.Text := Value;
end;

procedure TNFSEditBtn.SizeMove(var msg: TWMSize);
begin
  ButtonResize(self);
end;

procedure TNFSEditBtn.WMExitSizeMove(var Message: TMessage);
begin
  Resize;
end;


procedure TNFSEditBtn.EditChange(Sender: TObject);
begin
  if Assigned(fOnEditChange) then
    fOnEditChange(self);
end;

procedure TNFSEditBtn.EditClick(Sender: TObject);
begin
  if Assigned(fOnEditClick) then
    fOnEditClick(Self);
end;

procedure TNFSEditBtn.EditDblClick(Sender: TObject);
begin
  if Assigned(fOnEditDblClick) then
    fOnEditDblClick(Self);
end;

procedure TNFSEditBtn.EditEnter(Sender: TObject);
begin
  if Assigned(fOnEditEnter) then
    fOnEditEnter(Self);
end;

procedure TNFSEditBtn.EditExit(Sender: TObject);
begin
  if Assigned(fOnEditExit) then
    fOnEditExit(Self);
end;

procedure TNFSEditBtn.EditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Assigned(fOnEditKeyDown) then
    fOnEditKeyDown(Sender, Key, Shift);
end;

procedure TNFSEditBtn.EditKeyPress(Sender: TObject; var Key: Char);
begin
  if Assigned(fOnEditKeyPress) then
    fOnEditKeyPress(Sender, Key);
end;

procedure TNFSEditBtn.EditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Assigned(fOnEditKeyUp) then
    fOnEditKeyUp(Sender, Key, Shift);
end;

procedure TNFSEditBtn.EditMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Assigned(fOnEditMouseDown) then
    fOnEditMouseDown(Self, Button, Shift, X, X);
end;

procedure TNFSEditBtn.EditMouseEnter(Sender: TObject);
begin
  if Assigned(fOnEditMouseEnter) then
    fOnEditMouseEnter(Self);
end;

procedure TNFSEditBtn.EditMouseLeave(Sender: TObject);
begin
  if Assigned(fOnEditMouseLeave) then
    fOnEditMouseLeave(Self);
end;

procedure TNFSEditBtn.EditMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if Assigned(fOnEditMouseMove) then
    fOnEditMouseMove(Self, Shift, X, Y);
end;

procedure TNFSEditBtn.EditMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Assigned(fOnEditMouseUp) then
    fOnEditMouseUp(Self, Button, Shift, X, X);
end;

procedure TNFSEditBtn.EditPropChanged(Sender: TObject);
begin
  fEdit.Font.Assign(fEditProp.Font);
  Color := fEdit.Color;
  fEdit.Invalidate;
  fButton1.Invalidate;
  fButton2.Invalidate;
  fButton3.Invalidate;
  Invalidate;
end;

function TNFSEditBtn.getText: string;
begin
  Result := fEditProp.Text;
end;

procedure TNFSEditBtn.Notification(AComponent: TComponent;
  AOperation: TOperation);
begin
  inherited;
end;

procedure TNFSEditBtn.Resize;
begin
  inherited;
end;


procedure TNFSEditBtn.Button1Click(Sender: TObject);
begin
  if Assigned(fOnButton1Click) then
    fOnButton1Click(Self);
end;

procedure TNFSEditBtn.Button2Click(Sender: TObject);
begin
  if Assigned(fOnButton2Click) then
    fOnButton2Click(Self);
end;

procedure TNFSEditBtn.Button3Click(Sender: TObject);
begin
  if Assigned(fOnButton3Click) then
    fOnButton3Click(Self);
end;

procedure TNFSEditBtn.ButtonResize(Sender: TObject);
var
  Button1Width: Integer;
  Button2Width: Integer;
  Button3Width: Integer;
  Button1Visible: Boolean;
  Button2Visible: Boolean;
  Button3Visible: Boolean;
begin

  Button1Width := 0;
  Button2Width := 0;
  Button3Width := 0;

  Button1Visible := fButton1.Visible;
  Button2Visible := fButton2.Visible;
  Button3Visible := fButton3.Visible;

  fButton1.Visible := false;
  fButton2.Visible := false;
  fButton3.Visible := false;
  fButton1.Left := 0;
  fButton2.Left := 0;
  fButton3.Left := 0;

  fButton1.Visible := Button1Visible;
  fButton2.Visible := Button2Visible;
  fButton3.Visible := Button3Visible;


  if fButton1.Visible then
    Button1Width := fButton1.Width + fButton1.Margins.Left + fButton1.Margins.Right;
  if fButton2.Visible then
    Button2Width := fButton2.Width + fButton2.Margins.Left + fButton2.Margins.Right;
  if fButton3.Visible then
    Button3Width := fButton3.Width + fButton3.Margins.Left + fButton3.Margins.Right;

  FEdit.Width := ClientWidth - Button1Width - Button2Width - Button3Width - 2;

end;

end.
