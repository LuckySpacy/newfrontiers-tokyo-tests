unit Objekt.DHLOrigin;

interface

uses
  SysUtils, Classes, geschaeftskundenversand_api_2;


type
  TDHLOrigin = class
  private
    fOriginAPI: Origin;
    fCountry: string;
    fCountryISOCode: string;
    fState: string;
    procedure setCountry(const Value: string);
    procedure setCountryISOCode(const Value: string);
    procedure setState(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
    function OriginAPI: Origin;
    property Country: string read fCountry write setCountry;
    property CountryISOCode: string read fCountryISOCode write setCountryISOCode;
    property State: string read fState write setState;
    procedure copy(aOrigin: TDHLOrigin);
  end;

implementation

{ TDHLOrigin }


constructor TDHLOrigin.Create;
begin
  fOriginAPI := Origin.Create;
end;

destructor TDHLOrigin.Destroy;
begin
 {
  try
    FreeAndNil(fOriginAPI);
  except
  end;
  }
  //FreeAndNil(fOriginAPI);
  inherited;
end;

function TDHLOrigin.OriginAPI: Origin;
begin
  Result := fOriginAPI;
end;

procedure TDHLOrigin.setCountry(const Value: string);
begin
  fCountry := Value;
  fOriginAPI.country := Value;
end;

procedure TDHLOrigin.setCountryISOCode(const Value: string);
begin
  fCountryISOCode := Value;
  fOriginAPI.countryISOCode := Value;
end;

procedure TDHLOrigin.setState(const Value: string);
begin
  fState := Value;
  fOriginAPI.state := Value;
end;

procedure TDHLOrigin.copy(aOrigin: TDHLOrigin);
begin
  setCountry(aOrigin.Country);
  setCountryISOCode(aOrigin.CountryISOCode);
  setState(aOrigin.State);
end;


end.
