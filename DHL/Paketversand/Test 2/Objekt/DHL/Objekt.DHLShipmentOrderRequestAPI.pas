unit Objekt.DHLShipmentOrderRequestAPI;

interface

uses
  SysUtils, Classes, geschaeftskundenversand_api_2,
  Objekt.DHLVersion, Objekt.DHLShipmentorder;


type
  TDHLShipmentOrderRequestAPI = class
  private
    fRequest: CreateShipmentOrderRequest;
    fDHLVersion: TDHLVersion;
    fDHLShipmentorder: TDHLShipmentorder;
    fArray_of_Shipmentorder: Array_Of_ShipmentOrderType;
  public
    constructor Create;
    destructor Destroy; override;
    property Request: CreateShipmentOrderRequest read fRequest write fRequest;
    property Version: TDHLVersion read fDHLVersion write fDHLVersion;
    property ShipmentOrder: TDHLShipmentorder read fDHLShipmentorder write fDHLShipmentOrder;
  end;


implementation

{ TDHLShipmentOrderRequestAPI }

constructor TDHLShipmentOrderRequestAPI.Create;
begin

  fRequest := CreateShipmentOrderRequest.Create;
  fDHLVersion := TDHLVersion.Create;
  fDHLShipmentorder := TDHLShipmentorder.Create;

  SetLength(fArray_of_Shipmentorder, 1);
  fArray_of_Shipmentorder[0] := fDHLShipmentorder.ShipmentorderAPI;

  fRequest.Version := fDHLVersion.VersionAPI;
  fRequest.ShipmentOrder := fArray_of_Shipmentorder;

end;

destructor TDHLShipmentOrderRequestAPI.Destroy;
begin
  FreeAndNil(fDHLVersion);
  FreeAndNil(fDHLShipmentorder);
  FreeAndNil(fRequest);
  inherited;
end;

end.
