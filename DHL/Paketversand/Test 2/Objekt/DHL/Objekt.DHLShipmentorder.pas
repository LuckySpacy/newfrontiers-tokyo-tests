unit Objekt.DHLShipmentorder;

interface

uses
  SysUtils, Classes, geschaeftskundenversand_api_2,
  Objekt.DHLServiceconfiguration, Objekt.DHLShipment2;

type
  TDHLShipmentorder = class
  private
    fShipmentOrderTypeAPI: ShipmentOrderType;
    fsequenceNumber: string;
    fPrintOnlyIfCodeable: TDHLServiceconfiguration;
    fShipment2: TDHLShipment2;
    procedure setsequenceNumber(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
    function ShipmentorderAPI: ShipmentOrderType;
    property sequenceNumber: string read fsequenceNumber write setsequenceNumber;
    property PrintOnlyIfCodeable: TDHLServiceconfiguration read fPrintOnlyIfCodeable write fPrintOnlyIfCodeable;
    property Shipment: TDHLShipment2 read fShipment2 write fShipment2;
  end;


implementation

{ TDHLShipmentorder }

constructor TDHLShipmentorder.Create;
begin
  fShipmentOrderTypeAPI := ShipmentOrderType.Create;
  fShipmentOrderTypeAPI.labelResponseType := URL;

  fPrintOnlyIfCodeable := TDHLServiceconfiguration.Create;
  fShipmentOrderTypeAPI.PrintOnlyIfCodeable := fPrintOnlyIfCodeable.ServiceconfigurationAPI;

  fShipment2 := TDHLShipment2.Create;
  ShipmentorderAPI.Shipment := fShipment2.Shipment2API;


end;

destructor TDHLShipmentorder.Destroy;
begin
  FreeAndNil(fPrintOnlyIfCodeable);
  FreeAndNil(fShipment2);
  //FreeAndNil(fShipmentOrderTypeAPI);
  inherited;
end;


procedure TDHLShipmentorder.setsequenceNumber(const Value: string);
begin
  fsequenceNumber := Value;
  fShipmentOrderTypeAPI.sequenceNumber := Value;
end;

function TDHLShipmentorder.ShipmentorderAPI: ShipmentOrderType;
begin
  Result := fShipmentOrderTypeAPI;
end;

end.
