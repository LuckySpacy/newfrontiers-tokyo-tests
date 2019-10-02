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
    function getManuellesBackup: Boolean;
    procedure setManuellesBackup(const Value: Boolean);
    function getSkin: string;
    procedure setSkin(const Value: string);
    function getCheckInterval: Integer;
    procedure setCheckInterval(const Value: Integer);
  public
    property UserPfad: string read getUserPfad;
    property IniFilename: string read getIniFilename;
    property ManuellesBackup: Boolean read getManuellesBackup write setManuellesBackup;
    property Skin: string read getSkin write setSkin;
    property CheckInterval: Integer read getCheckInterval write setCheckInterval;
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TIni }

uses
  DateUtils;

constructor TIni.Create;
begin
  fUserPfad := '';
  fIniFilename := '';
end;

destructor TIni.Destroy;
begin

  inherited;
end;


function TIni.getCheckInterval: Integer;
var
  s: string;
  Interval: Integer;
begin
  s := ReadIni(IniFilename, 'Einstellung', 'CheckInterval', '600000');  // 10 Minuten
  if not TryStrToInt(s, Interval) then
  begin
    Result := 600000;
    setCheckInterval(Result);
  end
  else
    Result := Interval;
end;

function TIni.getIniFilename: string;
begin
  Result := fIniFilename;
  if Result = '' then
    Result := getUserPfad + 'nfsBackup.Ini';
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


function TIni.getManuellesBackup: Boolean;
begin
  Result := ReadIni(IniFilename, 'Einstellung', 'ManuellesBackup', '1') = '1';
end;

function TIni.getSkin: string;
begin
  Result := ReadIni(IniFilename, 'Einstellung', 'Skin', '');
end;

procedure TIni.setCheckInterval(const Value: Integer);
begin
  WriteIni(IniFilename, 'Einstellung', 'CheckInterval', IntToStr(Value));
end;

procedure TIni.setManuellesBackup(const Value: Boolean);
begin
  if Value then
    WriteIni(IniFilename, 'Einstellung', 'ManuellesBackup', '1')
  else
    WriteIni(IniFilename, 'Einstellung', 'ManuellesBackup', '0');
end;



procedure TIni.setSkin(const Value: string);
begin   //

end;

end.
