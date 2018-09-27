unit Objekt.DHLShipmentItem;

interface

uses
  SysUtils, Classes, geschaeftskundenversand_api_2;

type
  TDHLShipmentItem = class
  private
    fShipmentItemTypeAPI: ShipmentItemType;
    fweightInKGAPI: weightInKG;
    fWeightKG: real;
    fLengthCM: Int64;
    fWidthCM: Int64;
    fHeightCM: Int64;
    procedure setWeightKG(const Value: real);
    procedure setLengthCM(const Value: Int64);
    procedure setWidthCM(const Value: Int64);
    procedure setHeightCM(const Value: Int64);
  public
    constructor Create;
    destructor Destroy; override;
    function ShipmentItemTypeAPI: ShipmentItemType;
    property WeightKG: real read fWeightKG write setWeightKG;
    property LengthCM: Int64 read fLengthCM write setLengthCM;
    property WidthCM: Int64 read fWidthCM write setWidthCM;
    property HeightCM: Int64 read fHeightCM write setHeightCM;
  end;

implementation

{ TDHLShipmentItem }

constructor TDHLShipmentItem.Create;
begin
  fShipmentItemTypeAPI := ShipmentItemType.Create;
  fweightInKGAPI := weightInKG.Create;
  fShipmentItemTypeAPI.weightInKG := fweightInKGAPI;
end;

destructor TDHLShipmentItem.Destroy;
begin
  //FreeAndNil(fweightInKGAPI);
  //FreeAndNil(fShipmentItemTypeAPI);
  inherited;
end;


procedure TDHLShipmentItem.setHeightCM(const Value: Int64);
begin
  fHeightCM := Value;
  fShipmentItemTypeAPI.heightInCM := Value;
end;

procedure TDHLShipmentItem.setLengthCM(const Value: Int64);
begin
  fLengthCM := Value;
  fShipmentItemTypeAPI.lengthInCM := Value;
end;

procedure TDHLShipmentItem.setWeightKG(const Value: real);
var
  s: string;
begin
  s := FloatToStr(Value);
  s := StringReplace(s, ',', '.', [rfReplaceAll]);
  fWeightKG := Value;
  fweightInKGAPI.DecimalString := s;
end;

procedure TDHLShipmentItem.setWidthCM(const Value: Int64);
begin
  fWidthCM := Value;
  fShipmentItemTypeAPI.widthInCM := fWidthCM;
end;

function TDHLShipmentItem.ShipmentItemTypeAPI: ShipmentItemType;
begin
  Result := fShipmentItemTypeAPI;
end;

end.
