unit Objekt.DHLVersion;

interface

uses
  SysUtils, Classes, geschaeftskundenversand_api_2;

type
  TDHLVersion = class
  private
    fVersionAPI: Version;
    fminorRelease: Integer;
    fmajorRelease: Integer;
    procedure setmajorRelease(const Value: Integer);
    procedure setminorRelease(const Value: Integer);
  public
    constructor Create;
    destructor Destroy; override;
    function VersionAPI: Version;
    property majorRelease: Integer read fmajorRelease write setmajorRelease;
    property minorRelease: Integer read fminorRelease write setminorRelease;
  end;

implementation

{ TDHLVersion }

constructor TDHLVersion.Create;
begin
  fVersionAPI := Version.Create;
end;

destructor TDHLVersion.Destroy;
begin
  //FreeAndNil(fVersionAPI);
  inherited;
end;

procedure TDHLVersion.setmajorRelease(const Value: Integer);
begin
  fmajorRelease := Value;
  fVersionAPI.majorRelease := IntToStr(Value);
end;

procedure TDHLVersion.setminorRelease(const Value: Integer);
begin
  fminorRelease := Value;
  fVersionAPI.minorRelease := IntToStr(Value);
end;

function TDHLVersion.VersionAPI: Version;
begin
  Result := fVersionAPI;
end;

end.
