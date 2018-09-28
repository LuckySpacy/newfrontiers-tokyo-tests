unit Objekt.DHLVersionBase;

interface

uses
  SysUtils, Classes, geschaeftskundenversand_api_2;

type
  TDHLVersionBase = class
  protected
    fVersionAPI: Version;
  private
    fminorRelease: string;
    fmajorRelease: string;
    fBuild: string;
    procedure setmajorRelease(const Value: String);
    procedure setminorRelease(const Value: String);
    procedure setBuild(const Value: string);
  public
    constructor Create; virtual;
    destructor Destroy; override;
    function VersionAPI: Version;
    property majorRelease: string read fmajorRelease write setmajorRelease;
    property minorRelease: string read fminorRelease write setminorRelease;
    property Build: string read fBuild write setBuild;
  end;

implementation

{ TDHLVersionBase }

constructor TDHLVersionBase.Create;
begin
  fVersionAPI := nil;
end;

destructor TDHLVersionBase.Destroy;
begin
  inherited;
end;

procedure TDHLVersionBase.setBuild(const Value: string);
begin
  fBuild := Value;
  if fVersionAPI <> nil then
    fVersionAPI.Build := Value;
end;

procedure TDHLVersionBase.setmajorRelease(const Value: String);
begin
  fmajorRelease := Value;
  if fVersionAPI <> nil then
    fVersionAPI.majorRelease := Value;
end;

procedure TDHLVersionBase.setminorRelease(const Value: String);
begin
  fminorRelease := Value;
  if fVersionAPI <> nil then
    fVersionAPI.minorRelease := Value;
end;

function TDHLVersionBase.VersionAPI: Version;
begin
  Result := fVersionAPI;
end;

end.
