unit Objekt.DHLNativeAdress;

interface

uses
  SysUtils, Classes, geschaeftskundenversand_api_2, Objekt.DHLOrigin;

type
  TDHLNativeAdress = class
  private
    fAdressAdditionArray: Array_Of_addressAddition;
    fNativeAdressTypeAPI: NativeAddressType;
    fStreetName: string;
    fStreetNumber: string;
    fDispatchingInformation: string;
    fZip: string;
    fCity: string;
    fAddressAddition: string;
    fDHLOrigin: TDHLOrigin;
    procedure setStreetName(const Value: string);
    procedure setStreetNumber(const Value: string);
    procedure setDispatchingInformation(const Value: string);
    procedure setZip(const Value: string);
    procedure setCity(const Value: string);
    procedure setAddressAddition(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
    function NativeAdressTypeAPI: NativeAddressType;
    property StreetName: string read fStreetName write setStreetName;
    property StreetNumber: string read fStreetNumber write setStreetNumber;
    property DispatchingInformation: string read fDispatchingInformation write setDispatchingInformation;
    property Zip: string read fZip write setZip;
    property City: string read fCity write setCity;
    property AddressAddition: string read fAddressAddition write setAddressAddition;
    property Origin: TDHLOrigin read fDHLOrigin write fDHLOrigin;
  end;

implementation

{ TDHLNativeAdress }

constructor TDHLNativeAdress.Create;
begin
  fDHLOrigin := TDHLOrigin.Create;
  fNativeAdressTypeAPI := NativeAddressType.Create;
  SetLength(fAdressAdditionArray, 1);
  fNativeAdressTypeAPI.addressAddition := fAdressAdditionArray;
  fNativeAdressTypeAPI.Origin := fDHLOrigin.OriginAPI;
end;

destructor TDHLNativeAdress.Destroy;
begin
  FreeAndNil(fDHLOrigin);
  //FreeAndNil(fNativeAdressTypeAPI);
  inherited;
end;

function TDHLNativeAdress.NativeAdressTypeAPI: NativeAddressType;
begin
  Result := fNativeAdressTypeAPI;
end;

procedure TDHLNativeAdress.setAddressAddition(const Value: string);
begin
  fAddressAddition := Value;
  fAdressAdditionArray[0] := Value;
end;

procedure TDHLNativeAdress.setCity(const Value: string);
begin
  fCity := Value;
  fNativeAdressTypeAPI.city := Value;
end;

procedure TDHLNativeAdress.setDispatchingInformation(const Value: string);
begin
  fDispatchingInformation := Value;
  fNativeAdressTypeAPI.dispatchingInformation := Value;
end;

procedure TDHLNativeAdress.setStreetName(const Value: string);
begin
  fStreetName := Value;
  NativeAdressTypeAPI.streetName := Value;
end;

procedure TDHLNativeAdress.setStreetNumber(const Value: string);
begin
  fStreetNumber := Value;
  fNativeAdressTypeAPI.streetNumber := Value;
end;

procedure TDHLNativeAdress.setZip(const Value: string);
begin
  fZip := Value;
  fNativeAdressTypeAPI.zip := Value;
end;

end.
