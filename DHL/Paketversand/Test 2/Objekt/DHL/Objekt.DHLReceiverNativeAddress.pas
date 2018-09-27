unit Objekt.DHLReceiverNativeAddress;

interface

uses
  SysUtils, Classes, geschaeftskundenversand_api_2, Objekt.DHLOrigin;

type
  TDHLReceiverNativeAddress = class
  private
    fReceiverNativeAdressTypeAPI: ReceiverNativeAddressType;
    fStreetName: string;
    fZip: string;
    fStreetNumber: string;
    fName1: string;
    fCity: string;
    fName3: string;
    fDispatchingInformation: string;
    fAddressAdditionArray: Array_Of_addressAddition2;
    fAddressAddition: string;
    fOrigin: TDHLOrigin;
    procedure setCity(const Value: string);
    procedure setName2(const Value: string);
    procedure setName3(const Value: string);
    procedure setStreetName(const Value: string);
    procedure setStreetNumber(const Value: string);
    procedure setZip(const Value: string);
    procedure setDispatchingInformation(const Value: string);
    procedure setAddressAddition(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
    function ReceiverNativeAddressTypeAPI: ReceiverNativeAddressType;
    property Name2: string read fName1 write setName2;
    property Name3: string read fName3 write setName3;
    property StreetName: string read fStreetName write setStreetName;
    property StreetNumber: string read fStreetNumber write setStreetNumber;
    property DispatchingInformation: string read fDispatchingInformation write setDispatchingInformation;
    property AddressAddition: string read fAddressAddition write setAddressAddition;
    property Zip: string read fZip write setZip;
    property City: string read fCity write setCity;
    property Origin: TDHLOrigin read fOrigin write fOrigin;
  end;

implementation

{ TDHLReceiverNativeAddress }

constructor TDHLReceiverNativeAddress.Create;
begin
  fOrigin := TDHLOrigin.Create;
  setLength(fAddressAdditionArray, 1);
  fReceiverNativeAdressTypeAPI := ReceiverNativeAddressType.Create;
  fReceiverNativeAdressTypeAPI.addressAddition := fAddressAdditionArray;
  fReceiverNativeAdressTypeAPI.Origin := fOrigin.OriginAPI;
end;

destructor TDHLReceiverNativeAddress.Destroy;
begin
  //FreeAndNil(fReceiverNativeAdressTypeAPI);
  FreeAndNil(fOrigin);
  inherited;
end;

function TDHLReceiverNativeAddress.ReceiverNativeAddressTypeAPI: ReceiverNativeAddressType;
begin
  Result := fReceiverNativeAdressTypeAPI;
end;

procedure TDHLReceiverNativeAddress.setAddressAddition(const Value: string);
begin
  fAddressAddition := Value;
  fAddressAdditionArray[0] := value;
end;

procedure TDHLReceiverNativeAddress.setCity(const Value: string);
begin
  fCity := Value;
  fReceiverNativeAdressTypeAPI.city := Value;
end;

procedure TDHLReceiverNativeAddress.setDispatchingInformation(const Value: string);
begin
  fDispatchingInformation := Value;
  fReceiverNativeAdressTypeAPI.dispatchingInformation := Value;
end;

procedure TDHLReceiverNativeAddress.setName2(const Value: string);
begin
  fName1 := Value;
  fReceiverNativeAdressTypeAPI.name2 := Value;
end;

procedure TDHLReceiverNativeAddress.setName3(const Value: string);
begin
  fName3 := Value;
  fReceiverNativeAdressTypeAPI.name3 := Value;
end;

procedure TDHLReceiverNativeAddress.setStreetName(const Value: string);
begin
  fStreetName := Value;
  fReceiverNativeAdressTypeAPI.streetName := Value;
end;

procedure TDHLReceiverNativeAddress.setStreetNumber(const Value: string);
begin
  fStreetNumber := Value;
  fReceiverNativeAdressTypeAPI.streetNumber := value;
end;

procedure TDHLReceiverNativeAddress.setZip(const Value: string);
begin
  fZip := Value;
  fReceiverNativeAdressTypeAPI.zip := Value;
end;

end.
