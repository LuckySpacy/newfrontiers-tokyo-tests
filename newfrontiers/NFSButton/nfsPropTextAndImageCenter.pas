unit nfsPropTextAndImageCenter;

interface

uses
  Classes, SysUtils, Contnrs, Controls, StdCtrls, ExtCtrls, Graphics;

type
  TnfsPropTextAndImageCenter = class(TPersistent)
  private
    fOnChanged: TNotifyEvent;
    fImageMargin: TMargins;
    fUseTextAndImageCenter: Boolean;
    fImageLeft: Boolean;
    fImageRight: Boolean;
    procedure setUseTextAndImageCenter(const Value: Boolean);
    procedure MarginChanged(Sender: TObject);
    procedure setImageLeft(const Value: Boolean);
    procedure setImageRight(const Value: Boolean);
  protected
  public
    constructor Create;
    destructor Destroy; override;
  published
    property OnChanged: TNotifyEvent read fOnChanged write fOnChanged;
    property ImageMargin: TMargins read fImageMargin write fImageMargin;
    property UseTextAndImageCenter: Boolean read fUseTextAndImageCenter write setUseTextAndImageCenter default false;
    property ImageLeft: Boolean read fImageLeft write setImageLeft default true;
    property ImageRight: Boolean read fImageRight write setImageRight default false;
  end;

implementation

{ TnfsPropTextAndImageCenter }

constructor TnfsPropTextAndImageCenter.Create;
begin
  fOnChanged := nil;
  fImageMargin := TMargins.Create(nil);
  fImageMargin.Right := 5;
  fImageMargin.Left := 5;
  fImageMargin.OnChange := MarginChanged;
  fImageLeft := true;
  fImageRight := false;
end;

destructor TnfsPropTextAndImageCenter.Destroy;
begin
  FreeAndNil(fImageMargin);
  inherited;
end;

procedure TnfsPropTextAndImageCenter.MarginChanged(Sender: TObject);
begin
  if Assigned(fOnChanged) then
    fOnChanged(Self);
end;

procedure TnfsPropTextAndImageCenter.setImageLeft(const Value: Boolean);
begin
  fImageLeft := Value;
  fImageRight := not fImageLeft;
  if Assigned(fOnChanged) then
    fOnChanged(Self);
end;

procedure TnfsPropTextAndImageCenter.setImageRight(const Value: Boolean);
begin
  fImageRight := Value;
  fImageLeft  := not fImageRight;
  if Assigned(fOnChanged) then
    fOnChanged(Self);
end;

procedure TnfsPropTextAndImageCenter.setUseTextAndImageCenter(
  const Value: Boolean);
begin
  fUseTextAndImageCenter := Value;
  if Assigned(fOnChanged) then
    fOnChanged(Self);
end;

end.
