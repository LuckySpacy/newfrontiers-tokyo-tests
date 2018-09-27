unit Objekt.DHLServiceconfiguration;

interface

uses
  SysUtils, Classes, geschaeftskundenversand_api_2;

type
  TDHLServiceconfiguration = class
  private
    fServiceconfigurationAPI: Serviceconfiguration;
    fsequenceNumber: string;
    fActive: string;
    procedure setActive(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
    function ServiceconfigurationAPI: Serviceconfiguration;
    property Active: string read fActive write setActive;
  end;

implementation

{ TDHLServiceconfiguration }

constructor TDHLServiceconfiguration.Create;
begin
  fServiceconfigurationAPI := Serviceconfiguration.Create;
end;

destructor TDHLServiceconfiguration.Destroy;
begin
  FreeAndNil(fServiceconfigurationAPI);
  inherited;
end;

function TDHLServiceconfiguration.ServiceconfigurationAPI: Serviceconfiguration;
begin
  Result := fServiceconfigurationAPI;
end;


procedure TDHLServiceconfiguration.setActive(const Value: string);
begin
  fActive := Value;
  fServiceconfigurationAPI.active := fActive;
end;

end.
