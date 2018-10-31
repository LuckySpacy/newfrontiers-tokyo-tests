unit Objekt.DHLManifestResponse;

interface

uses
  System.SysUtils, System.Classes, Objekt.DHLVersionResponse, Objekt.DHLStatusinformation;

type
  TDHLManifestResponse = class
  private
    fVersion: TDHLVersionResponse;
    fManifestData: string;
    fStatus: TDHLStatusinformation;
  public
    constructor Create;
    destructor Destroy; override;
    property Version: TDHLVersionResponse read fVersion write fVersion;
    property Status: TDHLStatusinformation read fStatus write fStatus;
    property ManifestData: string read fManifestData write fManifestData;
  end;

implementation

{ TDHLManifestResponse }

constructor TDHLManifestResponse.Create;
begin
  fVersion := TDHLVersionResponse.Create;
  fStatus  := TDHLStatusinformation.Create;
  fManifestData := '';
end;

destructor TDHLManifestResponse.Destroy;
begin
  FreeAndNil(fVersion);
  FreeAndNil(fStatus);
  inherited;
end;

end.
