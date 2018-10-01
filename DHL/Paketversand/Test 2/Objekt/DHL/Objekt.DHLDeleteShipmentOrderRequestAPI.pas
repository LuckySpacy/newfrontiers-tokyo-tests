unit Objekt.DHLDeleteShipmentOrderRequestAPI;

interface

uses
  SysUtils, Classes, geschaeftskundenversand_api_2, Objekt.DHLVersion;

type
  TDHLDeleteShipmentOrderRequestAPI = class
  private
    fRequest: DeleteShipmentOrderRequest;
    fShipmentNumber: string;
    FVersion: TDHLVersion;
    procedure setShipmentNumber(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
    property Request: DeleteShipmentOrderRequest read fRequest write fRequest;
    property Version: TDHLVersion read FVersion write fVersion;
    property ShipmentNumber: string read fShipmentNumber write setShipmentNumber;
  end;

implementation

{ TDHLDeleteShipmentOrderRequestAPI }

constructor TDHLDeleteShipmentOrderRequestAPI.Create;
begin
  fRequest := DeleteShipmentOrderRequest.Create;
  Version := TDHLVersion.Create;
  fRequest := Version.VersionAPI;
end;

destructor TDHLDeleteShipmentOrderRequestAPI.Destroy;
begin
  FreeAndNil(fRequest);
  inherited;
end;

procedure TDHLDeleteShipmentOrderRequestAPI.setShipmentNumber(const Value: string);
begin
  fShipmentNumber := Value;
  fRequest.shipmentNumber := Value;
end;


end.
