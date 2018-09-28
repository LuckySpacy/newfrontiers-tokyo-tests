unit Objekt.DHLValidateShipmentOrderRequestAPI;

interface

uses
  SysUtils, Classes, geschaeftskundenversand_api_2,
  Objekt.DHLVersion, Objekt.DHLValidateShipmentorder;


type
  TDHLValidateShipmentOrderRequestAPI = class
  private
    fRequest: ValidateShipmentOrderRequest;
    fDHLVersion: TDHLVersion;
    fDHLShipmentorder: TDHLValidateShipmentorder;
    fArray_of_Shipmentorder: Array_Of_ValidateShipmentOrderType;
  public
    constructor Create;
    destructor Destroy; override;
    property Request: ValidateShipmentOrderRequest read fRequest write fRequest;
    property Version: TDHLVersion read fDHLVersion write fDHLVersion;
    property ShipmentOrder: TDHLValidateShipmentorder read fDHLShipmentorder write fDHLShipmentOrder;
  end;

implementation

{ TDHLValidateShipmentOrderRequestAPI }

constructor TDHLValidateShipmentOrderRequestAPI.Create;
begin
  fRequest := ValidateShipmentOrderRequest.Create;
  fDHLVersion := TDHLVersion.Create;
  fDHLShipmentorder := TDHLValidateShipmentorder.Create;

  SetLength(fArray_of_Shipmentorder, 1);
  fArray_of_Shipmentorder[0] := fDHLShipmentorder.ValidateShipmentorderAPI;

  fRequest.Version := fDHLVersion.VersionAPI;
  fRequest.ShipmentOrder := fArray_of_Shipmentorder;
end;

destructor TDHLValidateShipmentOrderRequestAPI.Destroy;
begin
  FreeAndNil(fDHLVersion);
  FreeAndNil(fDHLShipmentorder);
  FreeAndNil(fRequest);
  inherited;
end;

end.
