unit Objekt.DHLShipment2;

interface

uses
  SysUtils, Classes, geschaeftskundenversand_api_2,
  Objekt.DHLShipmentdetails, Objekt.DHLShipper, Objekt.DHLReceiver;

type
  TDHLShipment2 = class
  private
    fShipment2API: Shipment2;
    fShipmentdetails: TDHLShipmentdetails;
    fShipper: TDHLShipper;
    fReceiver: TDHLReceiver;
  public
    constructor Create;
    destructor Destroy; override;
    function Shipment2API: Shipment2;
    property Shipmentdetails: TDHLShipmentdetails read fShipmentdetails write fShipmentdetails;
    property Shipper: TDHLShipper read fShipper write fShipper;
    property Receiver: TDHLReceiver read fReceiver write fReceiver;
    procedure Copy(aShipment2: TDHLShipment2);
  end;

implementation

{ TDHLShipment2 }


constructor TDHLShipment2.Create;
begin
  fShipment2API := Shipment2.Create;
  fShipper := TDHLShipper.Create;
  fReceiver := TDHLReceiver.Create;
  fShipmentdetails := TDHLShipmentdetails.Create;
  fShipment2API.ShipmentDetails := Shipmentdetails.ShipmentDetailsTypeTypeAPI;
  fShipment2API.Shipper := fShipper.ShipperTypeAPI;
  fShipment2API.Receiver := fReceiver.ReceiverTypeAPI;
end;

destructor TDHLShipment2.Destroy;
begin
  FreeAndNil(fReceiver);
  FreeAndNil(fShipper);
  FreeAndNil(fShipmentdetails);
  //FreeAndNil(fShipment2API);
  inherited;
end;

function TDHLShipment2.Shipment2API: Shipment2;
begin
  Result := fShipment2API;
end;


procedure TDHLShipment2.Copy(aShipment2: TDHLShipment2);
begin
  fShipmentdetails.Copy(aShipment2.Shipmentdetails);
  fShipper.Copy(aShipment2.Shipper);
  fReceiver.Copy(aShipment2.Receiver);
end;


end.
