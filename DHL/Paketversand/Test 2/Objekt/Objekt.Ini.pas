unit Objekt.Ini;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Allgemein.SysFolderlocation, Allgemein.Types, Allgemein.RegIni, shellapi;

type
  TIni = class
  private
    fUserPfad: string;
    fIniFilename: string;
    function getUserPfad: string;
    function getIniFilename: string;
    function getAuthentication_User: string;
    procedure setAuthentication_User(const Value: string);
    function getAuthentication_Password: string;
    procedure setAuthentication_Password(const Value: string);
    function getcis_User: string;
    procedure setcis_User(const Value: string);
    function getcis_Password: string;
    procedure setcis_Password(const Value: string);
    function getUrl: string;
    procedure setUrl(const Value: string);
  public
    property UserPfad: string read getUserPfad;
    property IniFilename: string read getIniFilename;
    constructor Create;
    destructor Destroy; override;
    property Authentication_User: string read getAuthentication_User write setAuthentication_User;
    property Authentication_Password: string read getAuthentication_Password write setAuthentication_Password;
    property cis_User: string read getcis_User write setcis_User;
    property cis_Password: string read getcis_Password write setcis_Password;
    property Url: string read getUrl write setUrl;
  end;

implementation

{ TIni }

constructor TIni.Create;
begin
  fUserPfad := '';
  fIniFilename := '';
end;

destructor TIni.Destroy;
begin

  inherited;
end;


function TIni.getIniFilename: string;
begin
  Result := fIniFilename;
  if Result = '' then
    Result := getUserPfad + 'Paketversand.Ini';
  fIniFilename := Result;
end;

function TIni.getUserPfad: string;
begin
  Result := fUserPfad;
  if Result = '' then
  begin
    Result := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
    fUserPfad := Result;
    if not DirectoryExists(fUserPfad) then
      ForceDirectories(fUserPfad);
  end;
end;

procedure TIni.setAuthentication_User(const Value: string);
begin
  writeIni(IniFilename, 'Einstellung', 'Authentication_User', Value);
end;

function TIni.getAuthentication_User: string;
begin
  Result := ReadIni(IniFilename, 'Einstellung', 'Authentication_User', '');
end;


procedure TIni.setAuthentication_Password(const Value: string);
begin
  writeIni(IniFilename, 'Einstellung', 'Authentication_Password', Value);
end;

function TIni.getAuthentication_Password: string;
begin
  Result := ReadIni(IniFilename, 'Einstellung', 'Authentication_Password', '');
end;


procedure TIni.setcis_User(const Value: string);
begin
  writeIni(IniFilename, 'Einstellung', 'cis_User', Value);
end;

function TIni.getcis_User: string;
begin
  Result := ReadIni(IniFilename, 'Einstellung', 'cis_User', '');
end;


procedure TIni.setcis_Password(const Value: string);
begin
  writeIni(IniFilename, 'Einstellung', 'cis_Password', Value);
end;

function TIni.getcis_Password: string;
begin
  Result := ReadIni(IniFilename, 'Einstellung', 'cis_Password', '');
end;


procedure TIni.setUrl(const Value: string);
begin
  writeIni(IniFilename, 'Einstellung', 'Url', Value);
end;

function TIni.getUrl: string;
begin
  Result := ReadIni(IniFilename, 'Einstellung', 'Url', '');
end;






end.

