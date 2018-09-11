unit NewFrontiers.Configuration.Registry;

interface

  uses NewFrontiers.Configuration, Registry, Windows;

  type

    TConfigurationRegistry = class(TInterfacedObject, IConfiguration)


    protected
      _rootKey: HKEY;
      _baseKey: string;
      _registry: TRegistry;

      procedure openRegistry(aWriteAccess: boolean);
      procedure closeRegistry;

    public

      ///	<summary>
      ///	  Root-Schlüssel, der verwendet wird. Üblicherweise HKEY_CURRENT_USER
      ///	</summary>
      property RootKey: HKEY read _rootKey write _rootKey;

      ///	<summary>
      ///	  Basis-Schlüssel, der geöffnet wird. z.B. Software\ASS\Optima
      ///	</summary>
      property BaseKey: string read _baseKey write _baseKey;

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

  uses SysUtils, NewFrontiers.Utility.StringUtil;

procedure TConfigurationRegistry.closeRegistry;
begin
  _registry.CloseKey;
  freeAndNil(_registry);
end;

function TConfigurationRegistry.getBoolean(aName: string;
  aDefault: boolean): boolean;
var Ident, Section: string;
begin

  openRegistry(false);

  TStringUtil.StringParts(aName, '.', Section, Ident);

  if (_registry.ValueExists(Section + '\' + Ident)) then
    result := _registry.ReadBool(Section + '\' + Ident)
  else
    result := aDefault;

  closeRegistry;
end;

function TConfigurationRegistry.getDateTime(aName: string;
  aDefault: TDateTime): TDateTime;
var Ident, Section: string;
begin

  openRegistry(false);

  TStringUtil.StringParts(aName, '.', Section, Ident);

  if (_registry.ValueExists(Section + '\' + Ident)) then
    result := _registry.ReadDateTime(Section + '\' + Ident)
  else
    result := aDefault;

  closeRegistry;
end;

function TConfigurationRegistry.getInteger(aName: string;
  aDefault: integer): integer;
var Ident, Section: string;
begin

  openRegistry(false);

  TStringUtil.StringParts(aName, '.', Section, Ident);

  if (_registry.ValueExists(Section + '\' + Ident)) then
    result := _registry.ReadInteger(Section + '\' + Ident)
  else
    result := aDefault;

  closeRegistry;

end;

function TConfigurationRegistry.getString(aName, aDefault: string): string;
var Ident, Section: string;
begin

  openRegistry(false);

  TStringUtil.StringParts(aName, '.', Section, Ident);

  if (_registry.ValueExists(Section + '\' + Ident)) then
    result := _registry.ReadString(Section + '\' + Ident)
  else
    result := aDefault;

  closeRegistry;

end;


procedure TConfigurationRegistry.openRegistry(aWriteAccess: boolean);
begin

  _registry := TRegistry.Create;
  _registry.RootKey := _rootKey;

  if (not aWriteAccess) then
     _registry.OpenKeyReadOnly(_baseKey)
  else
     _registry.OpenKey(_baseKey, true);

end;

function TConfigurationRegistry.setBoolean(aName: string;
  aValue: boolean): boolean;
var Ident, Section: string;
begin

  result := true;

  openRegistry(true);

  TStringUtil.StringParts(aName, '.', Section, Ident);
  _registry.WriteBool(Section + '\' + Ident, aValue);

  closeRegistry;
end;

function TConfigurationRegistry.setDateTime(aName: string;
  aValue: TDateTime): boolean;
var Ident, Section: string;
begin

  result := true;

  openRegistry(true);

  TStringUtil.StringParts(aName, '.', Section, Ident);
  _registry.WriteDateTime(Section + '\' + Ident, aValue);

  closeRegistry;
end;

function TConfigurationRegistry.setInteger(aName: string;
  aValue: integer): boolean;
var Ident, Section: string;
begin

  result := true;

  openRegistry(true);

  TStringUtil.StringParts(aName, '.', Section, Ident);
  _registry.WriteInteger(Section + '\' + Ident, aValue);

  closeRegistry;

end;

function TConfigurationRegistry.setString(aName, aValue: string): boolean;
var Ident, Section: string;
begin

  result := true;

  openRegistry(true);

  TStringUtil.StringParts(aName, '.', Section, Ident);
  _registry.WriteString(Section + '\' + Ident, aValue);

  closeRegistry;

end;


end.
