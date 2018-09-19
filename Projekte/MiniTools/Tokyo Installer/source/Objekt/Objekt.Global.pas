unit Objekt.Global;

interface

uses
  SysUtils, Classes, variants,
  Allgemein.SysFolderlocation, Allgemein.Types, Allgemein.RegIni, shellapi,
  Winapi.Windows, Vcl.dialogs;

type
  TGlobal = class(TComponent)
  private
    fUserPfad: string;
    function getUserPfad: string;
    function getIniFilename: string;
  protected
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Userpfad: string read getUserPfad;
    property IniFilename: string read getIniFilename;
    function ProgrammPfad: string;
  end;

var
  Global: TGlobal;


implementation

{ TGlobal }


constructor TGlobal.Create(AOwner: TComponent);
begin
  inherited;
  fUserPfad := '';
end;

destructor TGlobal.Destroy;
begin

  inherited;
end;

function TGlobal.getIniFilename: string;
begin
  Result := getUserPfad + 'TokyoInstaller.ini';
end;

function TGlobal.getUserPfad: string;
begin
  Result := fUserPfad;
  if Result = '' then
  begin
    Result := IncludeTrailingPathDelimiter(TSysFolderLocation.GetFolder(cCSIDL_APPDATA)) + 'MiniTools\TokyoInstaller\';
    fUserPfad := Result;
    if not DirectoryExists(fUserPfad) then
      ForceDirectories(fUserPfad);
  end;
end;

function TGlobal.ProgrammPfad: string;
begin
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
end;

end.
