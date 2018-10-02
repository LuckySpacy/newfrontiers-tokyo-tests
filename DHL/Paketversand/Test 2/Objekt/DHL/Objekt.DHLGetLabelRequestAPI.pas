unit Objekt.DHLGetLabelRequestAPI;

interface

uses
  SysUtils, System.Classes, geschaeftskundenversand_api_2, Objekt.DHLVersion;

type
  TDHLGetLabelRequestAPI = class
  private
    fRequest: GetLabelRequest;
    fArray_Of_ShipmentNumber: Array_Of_shipmentNumber;
    fShipmentNumber: string;
    FVersion: TDHLVersion;
    procedure setShipmentNumber(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
    property Request: GetLabelRequest read fRequest write fRequest;
    property Version: TDHLVersion read FVersion write fVersion;
    property ShipmentNumber: string read fShipmentNumber write setShipmentNumber;
  end;

implementation

{ TDHLGetLabelRequestAPI }

constructor TDHLGetLabelRequestAPI.Create;
begin
  fVersion := TDHLVersion.Create;
  fRequest := GetLabelRequest.Create;
  fRequest.Version := FVersion.VersionAPI;
  //fRequest.labelResponseType := URL;
  setLength(fArray_Of_ShipmentNumber, 1);
end;

destructor TDHLGetLabelRequestAPI.Destroy;
begin
  FreeAndNil(fVersion);
  FreeAndNil(fRequest);
  inherited;
end;

procedure TDHLGetLabelRequestAPI.setShipmentNumber(const Value: string);
begin
  fArray_Of_ShipmentNumber[0] := Value;
  fShipmentNumber := Value;
  fRequest.shipmentNumber := fArray_Of_ShipmentNumber;
end;

end.
