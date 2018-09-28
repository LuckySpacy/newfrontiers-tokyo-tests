unit Objekt.DHLShipment;

interface

uses
  SysUtils, Classes, geschaeftskundenversand_api_2,
  Objekt.DHLShipmentdetails, Objekt.DHLShipper, Objekt.DHLReceiver;

type
  TDHLShipment = class
  private
    fShipmentAPI: Shipment;
    fShipmentdetails: TDHLShipmentdetails;
    fShipper: TDHLShipper;
    fReceiver: TDHLReceiver;
  public
    constructor Create;
    destructor Destroy; override;
    function ShipmentAPI: Shipment;
    property Shipmentdetails: TDHLShipmentdetails read fShipmentdetails write fShipmentdetails;
    property Shipper: TDHLShipper read fShipper write fShipper;
    property Receiver: TDHLReceiver read fReceiver write fReceiver;
  end;

implementation

{ TDHLShipment }

constructor TDHLShipment.Create;
begin
  fShipmentAPI := Shipment.Create;
  fShipper := TDHLShipper.Create;
  fReceiver := TDHLReceiver.Create;
  fShipmentdetails := TDHLShipmentdetails.Create;
  fShipmentAPI.ShipmentDetails := Shipmentdetails.ShipmentDetailsTypeTypeAPI;
  fShipmentAPI.Shipper := fShipper.ShipperTypeAPI;
  fShipmentAPI.Receiver := fReceiver.ReceiverTypeAPI;
end;

destructor TDHLShipment.Destroy;
begin
  FreeAndNil(fReceiver);
  FreeAndNil(fShipper);
  FreeAndNil(fShipmentdetails);
  inherited;
end;

function TDHLShipment.ShipmentAPI: Shipment;
begin
  Result := fShipmentAPI;
end;

end.
