unit Objekt.DHLShipper;

interface

uses
  SysUtils, Classes, geschaeftskundenversand_api_2,
  Objekt.DHLNameType, Objekt.DHLNativeAdress, Objekt.DHLCommunication;

type
  TDHLShipper = class
  private
    fShipperTypeAPI: ShipperType;
    fName: TDHLNameType;
    fAdress: TDHLNativeAdress;
    fCommunication: TDHLCommunication;
  public
    constructor Create;
    destructor Destroy; override;
    function ShipperTypeAPI: ShipperType;
    property Name: TDHLNameType read fName write fName;
    property Adress: TDHLNativeAdress read fAdress write fAdress;
    property Communication: TDHLCommunication read fCommunication write fCommunication;
  end;

implementation

{ TDHLShipper }

constructor TDHLShipper.Create;
begin
  fName := TDHLNameType.Create;
  fAdress := TDHLNativeAdress.Create;
  fCommunication := TDHLCommunication.Create;
  fShipperTypeAPI := ShipperType.Create;
  fShipperTypeAPI.Name_ := fName.NameTypeAPI;
  fShipperTypeAPI.Address := fAdress.NativeAdressTypeAPI;
  fShipperTypeAPI.Communication := fCommunication.CommunicationTypeAPI;
  //fShipperTypeAPI.Addres
end;

destructor TDHLShipper.Destroy;
begin
  FreeAndNil(fName);
  FreeAndNil(fAdress);
  FreeAndNil(fCommunication);
  FreeAndNil(fShipperTypeAPI);
  inherited;
end;

function TDHLShipper.ShipperTypeAPI: ShipperType;
begin
  Result := fShipperTypeAPI;
end;

end.
