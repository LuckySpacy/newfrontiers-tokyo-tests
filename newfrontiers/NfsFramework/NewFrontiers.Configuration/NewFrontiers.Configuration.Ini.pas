unit NewFrontiers.Configuration.Ini;

interface

uses NewFrontiers.Configuration, IniFiles;

type
    ///	<summary>
    ///	  Gibt an, wie die INI Datei geöffnet werden soll. Bei imAlwaysOpen, wird
    ///	  die Datei einmal geöffnet und beim Zerstören des Objekts wieder
    ///	  geschlossen. Bei imAlwaysClosed wird die Datei nach jedem Zugriff
    ///	  geschlossen.
    ///	</summary>
    TIniMode = (imAlwaysOpen, imAlwaysClosed);


    TConfigurationIni = class(TInterfacedObject, IConfiguration)


    protected
      _filename: string;
      _iniFile: TIniFile;
      _mode: TIniMode;

      procedure loadConfiguration;
      procedure closeConfiguration;

    public
      ///	<summary>
      ///	  Dateiname inklusive Pfad
      ///	</summary>
      property Filename: string read _filename write _filename;

      ///	<summary>
      ///	  Modus für das Verhalten der Ini-Datei. Default: imAlwaysOpen
      ///	</summary>
      property Mode: TIniMode read _mode write _mode;

      constructor Create;
      destructor Destroy; override;

      function getString(aName: string; aDefault: string = ''): string;
      function getInteger(aName: string; aDefault: integer = 0): integer;
      function getBoolean(aName: string; aDefault: boolean = false): boolean;
      function getDateTime(aName: string; aDefault: TDateTime = 0): TDateTime;

      function setString(aName, aValue: string): boolean;
      function setInteger(aName: string; aValue: integer): boolean;
      function setBoolean(aName: string; aValue: boolean): boolean;
      function setDateTime(aName: string; aValue: TDateTime): boolean;


  end;

implementation

  uses SysUtils, NewFrontiers.Utility.StringUtil, Classes;

{ TNfsConfigurationIni }

procedure TConfigurationIni.closeConfiguration;
begin
  if (_iniFile = nil) then
  begin
    // TODO: Datei anlegen, falls diese nicht existiert
    loadConfiguration;
  end;

  _iniFile.Free;
  _iniFile  := nil;
end;

constructor TConfigurationIni.Create;
begin
    _mode := imAlwaysOpen;
end;

destructor TConfigurationIni.Destroy;
begin
  closeConfiguration;
  inherited;
end;

function TConfigurationIni.getBoolean(aName: string;
  aDefault: boolean): boolean;
var Ident, Section: string;
begin

  if (_iniFile = nil) then
    loadConfiguration;

  TStringUtil.StringParts(aName, '.', Section, Ident);
  result := _iniFile.ReadBool(Section, Ident, aDefault);

  if (_mode = imAlwaysClosed) then
    closeConfiguration;
end;

function TConfigurationIni.getDateTime(aName: string;
  aDefault: TDateTime): TDateTime;
var Ident, Section: string;
begin

  if (_iniFile = nil) then
    loadConfiguration;

  TStringUtil.StringParts(aName, '.', Section, Ident);
  result := _iniFile.ReadDateTime(Section, Ident, aDefault);

  if (_mode = imAlwaysClosed) then
    closeConfiguration;
end;

function TConfigurationIni.getInteger(aName: string;
  aDefault: integer): integer;
var Ident, Section: string;
begin

  if (_iniFile = nil) then
    loadConfiguration;

  TStringUtil.StringParts(aName, '.', Section, Ident);
  result := _iniFile.ReadInteger(Section, Ident, aDefault);

  if (_mode = imAlwaysClosed) then
    closeConfiguration;


end;

function TConfigurationIni.getString(aName, aDefault: string): string;
var Ident, Section: string;
begin

  if (_iniFile = nil) then
    loadConfiguration;

  TStringUtil.StringParts(aName, '.', Section, Ident);

  if (not _iniFile.SectionExists(Section)) then
    raise Exception.Create('Section ' + Section + ' in INI-Datei ' + Filename + ' nicht gefunden');

  result := _iniFile.ReadString(Section, Ident, aDefault);

  if (_mode = imAlwaysClosed) then
    closeConfiguration;

end;

procedure TConfigurationIni.loadConfiguration;
begin

  if (not FileExists(_filename)) then
    raise Exception.Create(Format('Datei %s konnte nicht gefunden werden', [_filename]));

  _iniFile := TIniFile.Create(Filename);

end;


function TConfigurationIni.setBoolean(aName: string; aValue: boolean): boolean;
var Ident, Section: string;
begin
  result := true;

  if (_iniFile = nil) then
    loadConfiguration;

  TStringUtil.StringParts(aName, '.', Section, Ident);
  _iniFile.WriteBool(Section, Ident, aValue);

  if (_mode = imAlwaysClosed) then
    closeConfiguration;
end;

function TConfigurationIni.setDateTime(aName: string;
  aValue: TDateTime): boolean;
var Ident, Section: string;
begin
  result := true;

  if (_iniFile = nil) then
    loadConfiguration;

  TStringUtil.StringParts(aName, '.', Section, Ident);
  _iniFile.WriteDateTime(Section, Ident, aValue);

  if (_mode = imAlwaysClosed) then
    closeConfiguration;
end;

function TConfigurationIni.setInteger(aName: string;
  aValue: integer): boolean;
var Ident, Section: string;
begin

  result := true;

  if (_iniFile = nil) then
    loadConfiguration;

  TStringUtil.StringParts(aName, '.', Section, Ident);
  _iniFile.WriteInteger(Section, Ident, aValue);

  if (_mode = imAlwaysClosed) then
    closeConfiguration;

end;

function TConfigurationIni.setString(aName, aValue: string): boolean;
var Ident, Section: string;
begin

  result := true;

  if (_iniFile = nil) then
    loadConfiguration;

  TStringUtil.StringParts(aName, '.', Section, Ident);
  _iniFile.WriteString(Section, Ident, aValue);

  if (_mode = imAlwaysClosed) then
    closeConfiguration;

end;


end.
