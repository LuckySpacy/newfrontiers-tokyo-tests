unit Objekt.DHLManifestRequestAPI;

interface

uses
  SysUtils, System.Classes, geschaeftskundenversand_api_2, Objekt.DHLVersion;

type
  TDHLManifestRequestAPI = class
  private
    fRequest: GetManifestRequest;
    FVersion: TDHLVersion;
    fManifestDate: TDateTime;
    procedure setManifestDate(const Value: TDateTime);
  public
    constructor Create;
    destructor Destroy; override;
    property Request: GetManifestRequest read fRequest write fRequest;
    property Version: TDHLVersion read FVersion write fVersion;
    property ManifestDate: TDateTime read fManifestDate write setManifestDate;
  end;

implementation

{ TDHLManifestRequestAPI }

constructor TDHLManifestRequestAPI.Create;
begin
  fVersion := TDHLVersion.Create;
  fRequest := GetManifestRequest.Create;
  fRequest.Version := FVersion.VersionAPI;
end;

destructor TDHLManifestRequestAPI.Destroy;
begin
  FreeAndNil(fVersion);
  FreeAndNil(fRequest);
  inherited;
end;

procedure TDHLManifestRequestAPI.setManifestDate(const Value: TDateTime);
begin
  fManifestDate := Value;
  fRequest.manifestDate := FormatDateTime('yyyy-mm-dd', fManifestDate);
end;

end.
