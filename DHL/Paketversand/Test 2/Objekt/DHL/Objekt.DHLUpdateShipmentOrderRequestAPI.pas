unit Objekt.DHLUpdateShipmentOrderRequestAPI;

interface

uses
  SysUtils, Classes, geschaeftskundenversand_api_2,
  Objekt.DHLVersion, Objekt.DHLShipmentorder;

type
  TDHLUpdateShipmentOrderRequestAPI = class
  private
    fRequest: UpdateShipmentOrderRequest;
    fDHLVersion: TDHLVersion;
    fDHLShipmentorder: TDHLShipmentorder;
    fShipmentNumber: string;
    procedure setShipmentNumber(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
    property Request: UpdateShipmentOrderRequest read fRequest write fRequest;
    property Version: TDHLVersion read fDHLVersion write fDHLVersion;
    property ShipmentOrder: TDHLShipmentorder read fDHLShipmentorder write fDHLShipmentOrder;
    property ShipmentNumber: string read fShipmentNumber write setShipmentNumber;
  end;

implementation

{ TDHLUpdateShipmentOrderRequestAPI }

constructor TDHLUpdateShipmentOrderRequestAPI.Create;
begin
  fRequest := UpdateShipmentOrderRequest.Create;
  fDHLVersion := TDHLVersion.Create;
  Request.Version := fDHLVersion.VersionAPI;
  fDHLShipmentorder := TDHLShipmentorder.Create;
  Request.ShipmentOrder := fDHLShipmentorder.ShipmentorderAPI;
end;

destructor TDHLUpdateShipmentOrderRequestAPI.Destroy;
begin
  FreeAndNil(fDHLVersion);
  FreeAndNil(fDHLShipmentorder);
  FreeAndNil(fRequest);
  inherited;
end;

procedure TDHLUpdateShipmentOrderRequestAPI.setShipmentNumber(
  const Value: string);
begin
  fShipmentNumber := Value;
  fRequest.shipmentNumber := Value;
end;

end.
