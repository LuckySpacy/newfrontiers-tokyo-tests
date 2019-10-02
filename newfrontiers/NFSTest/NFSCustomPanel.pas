unit NFSCustomPanel;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.ExtCtrls;

type
  TNFSCustomPanel = class(TCustomPanel)
  private
    { Private-Deklarationen }
  protected
    { Protected-Deklarationen }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    { Published-Deklarationen }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Samples', [TNFSCustomPanel]);
end;

{ TCustomPanel1 }

constructor TNFSCustomPanel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  BevelOuter := bvNone;
  Caption := 'XXXXXXXXXXXXX';
end;

destructor TNFSCustomPanel.Destroy;
begin

  inherited;
end;

end.
