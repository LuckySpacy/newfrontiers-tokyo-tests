unit NFSEditProp;

interface

uses
  Classes, SysUtils, Contnrs, Controls, StdCtrls, ExtCtrls, Graphics,
  Vcl.Mask;

type
  TnfsEditProp = class(TPersistent)
  private
    fOnChanged: TNotifyEvent;
    fAlignment: TAlignment;
    fEdit: TMaskEdit;
    fFont: TFont;
    fEnabled: Boolean;
    procedure setAlignment(const Value: TAlignment);
    procedure setFont(const Value: TFont);
    procedure setText(const Value: string);
    procedure FontChanged(Sender: TObject);
    procedure setEnabled(const Value: Boolean);
    function getText: string;
    function getReadOnly: Boolean;
    procedure setReadOnly(const Value: Boolean);
    function getColor: TColor;
    procedure setColor(const Value: TColor);
  protected
  public
    constructor Create;
    destructor Destroy; override;
    property Edit: TMaskEdit read fEdit write fEdit;
  published
    property Alignment: TAlignment read fAlignment write setAlignment;
    property Font: TFont read fFont write setFont;
    property Text: string read getText write setText;
    property OnChanged: TNotifyEvent read fOnChanged write fOnChanged;
    property Enabled: Boolean read fEnabled write setEnabled default true;
    property ReadOnly: Boolean read getReadOnly write setReadOnly default true;
    property Color: TColor read getColor write setColor default clWindow;
  end;


implementation

{ TnfsEditProp }

constructor TnfsEditProp.Create;
begin
  fFont := TFont.Create;
  fFont.OnChange := FontChanged;
  fEnabled := true;
end;

destructor TnfsEditProp.Destroy;
begin
  FreeAndNil(fFont);
  inherited;
end;

procedure TnfsEditProp.FontChanged(Sender: TObject);
begin
  if Assigned(fOnChanged) then
    fOnChanged(self);
end;

function TnfsEditProp.getColor: TColor;
begin
  Result := fEdit.Color;
end;

function TnfsEditProp.getReadOnly: Boolean;
begin
  Result := fEdit.ReadOnly;
end;

function TnfsEditProp.getText: string;
begin
  Result := fEdit.Text;
end;

procedure TnfsEditProp.setAlignment(const Value: TAlignment);
begin
  fAlignment := Value;
  fEdit.Alignment := Value;
end;

procedure TnfsEditProp.setColor(const Value: TColor);
begin
  fEdit.Color := Value;
  if Assigned(fOnChanged) then
    fOnChanged(Self);
end;

procedure TnfsEditProp.setEnabled(const Value: Boolean);
begin
  fEnabled := Value;
  fEdit.Enabled := Value;
  fEdit.Invalidate;
end;

procedure TnfsEditProp.setFont(const Value: TFont);
begin
  fFont.Assign(Value);
  fEdit.Font.Assign(fFont);
  fEdit.Font.Color := fFont.Color;
end;

procedure TnfsEditProp.setReadOnly(const Value: Boolean);
begin
  fEdit.ReadOnly := Value;
end;

procedure TnfsEditProp.setText(const Value: string);
begin
  fEdit.Text := Value;
end;

end.
