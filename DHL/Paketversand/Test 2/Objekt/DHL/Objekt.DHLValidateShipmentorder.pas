unit Objekt.DHLValidateShipmentorder;

interface

uses
  SysUtils, Classes, geschaeftskundenversand_api_2,
  Objekt.DHLServiceconfiguration, Objekt.DHLShipment;

type
  TDHLValidateShipmentorder = class
  private
    fValidateShipmentOrderTypeAPI: ValidateShipmentOrderType;
    fsequenceNumber: string;
    fPrintOnlyIfCodeable: TDHLServiceconfiguration;
    fShipment: TDHLShipment;
    procedure setsequenceNumber(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
    function ValidateShipmentorderAPI: ValidateShipmentOrderType;
    property sequenceNumber: string read fsequenceNumber write setsequenceNumber;
    property PrintOnlyIfCodeable: TDHLServiceconfiguration read fPrintOnlyIfCodeable write fPrintOnlyIfCodeable;
    property Shipment: TDHLShipment read fShipment write fShipment;
  end;

implementation

{ TDHLValidateShipmentorder }

constructor TDHLValidateShipmentorder.Create;
begin
  fValidateShipmentOrderTypeAPI := ValidateShipmentOrderType.Create;

  fPrintOnlyIfCodeable := TDHLServiceconfiguration.Create;
  fValidateShipmentOrderTypeAPI.PrintOnlyIfCodeable := fPrintOnlyIfCodeable.ServiceconfigurationAPI;

  fShipment := TDHLShipment.Create;
  ValidateShipmentorderAPI.Shipment := fShipment.ShipmentAPI;
end;

destructor TDHLValidateShipmentorder.Destroy;
begin
  FreeAndNil(fPrintOnlyIfCodeable);
  FreeAndNil(fShipment);
  inherited;
end;

procedure TDHLValidateShipmentorder.setsequenceNumber(const Value: string);
begin
  fsequenceNumber := Value;
  fValidateShipmentOrderTypeAPI.sequenceNumber := Value;
end;

function TDHLValidateShipmentorder.ValidateShipmentorderAPI: ValidateShipmentOrderType;
begin
  Result := fValidateShipmentOrderTypeAPI;
end;

end.
