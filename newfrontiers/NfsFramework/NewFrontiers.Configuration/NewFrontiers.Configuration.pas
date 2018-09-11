unit NewFrontiers.Configuration;

interface
  uses Generics.Collections;

  type
    ///	<summary>
    ///	  Basis-Interface f�r alle Arten der Konfiguration. Intern werden
    ///	  Hierarchie-Ebenen mit Punkten als Trennern angegeben. Also z.B.
    ///	  database.server oder sysmon.server. Die konkreten Implementierungen des
    ///	  Interfaces m�ssen das dann entsrpechend Umsetzen, z.B. in Sections in
    ///	  einem INI-File oder Ordnern in der Registry.
    ///	</summary>
    IConfiguration = interface(IInterface)

      ///	<summary>
      ///	  Gibt den Wert eines Konfigurationsschl�ssels als String aus
      ///	</summary>
      ///	<param name="aName">
      ///	  Schl�sselname
      ///	</param>
      ///	<param name="aDefault">
      ///	  Default-Wert, wenn der Schl�ssel nicht gefunden werden konnte
      ///	</param>
      ///	<returns>
      ///	  Der Wert des Schl�ssels
      ///	</returns>
      function getString(aName: string; aDefault: string = ''): string;

      ///	<summary>
      ///	  Gibt den Wert eines Konfigurationsschl�ssels als Integer aus
      ///	</summary>
      ///	<param name="aName">
      ///	  Schl�sselname
      ///	</param>
      ///	<param name="aDefault">
      ///	  Default-Wert, wenn der Schl�ssel nicht gefunden werden konnte
      ///	</param>
      ///	<returns>
      ///	  Der Wert des Schl�ssels
      ///	</returns>
      function getInteger(aName: string; aDefault: integer = 0): integer;

      ///	<summary>
      ///	  Gibt den Wert eines Konfigurationsschl�ssels als Integer aus
      ///	</summary>
      ///	<param name="aName">
      ///	  Schl�sselname
      ///	</param>
      ///	<param name="aDefault">
      ///	  Default-Wert, wenn der Schl�ssel nicht gefunden werden konnte
      ///	</param>
      ///	<returns>
      ///	  Der Wert des Schl�ssels
      ///	</returns>
      function getBoolean(aName: string; aDefault: boolean = false): boolean;

      ///	<summary>
      ///	  Gibt den Wert eines Konfigurationsschl�ssels als Integer aus
      ///	</summary>
      ///	<param name="aName">
      ///	  Schl�sselname
      ///	</param>
      ///	<param name="aDefault">
      ///	  Default-Wert, wenn der Schl�ssel nicht gefunden werden konnte
      ///	</param>
      ///	<returns>
      ///	  Der Wert des Schl�ssels
      ///	</returns>
      function getDateTime(aName: string; aDefault: TDateTime = 0): TDateTime;


      ///	<summary>
      ///	  Setzt den Wert eines Schl�ssels in der Konfiguration. Damit der
      ///	  Wert persistiert wird, muss saveConfiguration aufgerufen werden.
      ///	</summary>
      ///	<param name="aName">
      ///	  Schl�sselname
      ///	</param>
      ///	<param name="aValue">
      ///	  Neuer Wert des Schl�ssels
      ///	</param>
      ///	<returns>
      ///	  true, falls der Schl�ssel gesetzt werden konnte
      ///	</returns>
      function setString(aName, aValue: string): boolean;

      ///	<summary>
      ///	  Setzt den Wert eines Schl�ssels in der Konfiguration. Damit der
      ///	  Wert persistiert wird, muss saveConfiguration aufgerufen werden.
      ///	</summary>
      ///	<param name="aName">
      ///	  Schl�sselname
      ///	</param>
      ///	<param name="aValue">
      ///	  Neuer Wert des Schl�ssels
      ///	</param>
      ///	<returns>
      ///	  true, falls der Schl�ssel gesetzt werden konnte
      ///	</returns>
      function setInteger(aName: string; aValue: integer): boolean;

      ///	<summary>
      ///	  Setzt den Wert eines Schl�ssels in der Konfiguration. Damit der
      ///	  Wert persistiert wird, muss saveConfiguration aufgerufen werden.
      ///	</summary>
      ///	<param name="aName">
      ///	  Schl�sselname
      ///	</param>
      ///	<param name="aValue">
      ///	  Neuer Wert des Schl�ssels
      ///	</param>
      ///	<returns>
      ///	  true, falls der Schl�ssel gesetzt werden konnte
      ///	</returns>
      function setBoolean(aName: string; aValue: boolean): boolean;

      ///	<summary>
      ///	  Setzt den Wert eines Schl�ssels in der Konfiguration. Damit der
      ///	  Wert persistiert wird, muss saveConfiguration aufgerufen werden.
      ///	</summary>
      ///	<param name="aName">
      ///	  Schl�sselname
      ///	</param>
      ///	<param name="aValue">
      ///	  Neuer Wert des Schl�ssels
      ///	</param>
      ///	<returns>
      ///	  true, falls der Schl�ssel gesetzt werden konnte
      ///	</returns>
      function setDateTime(aName: string; aValue: TDateTime): boolean;

  end;


    ///	<summary>
    ///	  Der Configuration-Manager verwaltet die unterschiedlichen
    ///	  Konfigurationsquellen und erm�glicht das Lesen und Schreiben der
    ///	  Konfiguration. Implementiert als Singleton, so dass er auch genutzt
    ///	  werden kann, wenn keine Dependency Injection m�glich ist.
    ///	</summary>
    TConfigurationManager = class

    protected
      _configurationSources: TDictionary<string, IConfiguration>;

      constructor Create;

    public
      destructor Destroy; override;

      ///	<summary>
      ///	  Gibt die Instanz des Managers zur�ck. Existiert noch keine, wird
      ///	  eine neue Instanz angelegt.
      ///	</summary>
      class function getInstance: TConfigurationManager;

      ///	<summary>
      ///	  Gibt einen Konfigurationswert zur�ck
      ///	</summary>
      ///	<param name="aSchluessel">
      ///	  Schl�ssel der Form quelle://schluessel
      ///	</param>
      class function getString(aSchluessel: string): string;

      ///	<summary>
      ///	  Gibt einen Konfigurationswert zur�ck
      ///	</summary>
      ///	<param name="aSchluessel">
      ///	  Schl�ssel der Form quelle://schluessel
      ///	</param>
      class function getInteger(aSchluessel: string): integer;

      ///	<summary>
      ///	  Gibt einen Konfigurationswert zur�ck
      ///	</summary>
      ///	<param name="aSchluessel">
      ///	  Schl�ssel der Form quelle://schluessel
      ///	</param>
      class function getBoolean(aSchluessel: string): boolean;

      ///	<summary>
      ///	  Gibt einen Konfigurationswert zur�ck
      ///	</summary>
      ///	<param name="aSchluessel">
      ///	  Schl�ssel der Form quelle://schluessel
      ///	</param>
      class function getDateTime(aSchluessel: string): TDateTime;

      ///	<summary>
      ///	  F�gt eine weitere Konfigurationsquelle hinzu
      ///	</summary>
      ///	<param name="aName">
      ///	  Schl�sselname der Quelle
      ///	</param>
      ///	<param name="aSource">
      ///	  Die hinzuzuf�gende Quelle
      ///	</param>
      procedure addSource(aName: string; aSource: IConfiguration);

      ///	<summary>
      ///	  Gibt eine Quelle zur�ck
      ///	</summary>
      ///	<param name="aName">
      ///	  Name der zur�ckzugebenden Quelle
      ///	</param>
      function getSource(aName: string): IConfiguration;

  end;

implementation

  uses SysUtils, NewFrontiers.Utility.StringUtil;
  var _instance: TConfigurationManager;

{ TNfsConfigurationManager }

procedure TConfigurationManager.addSource(aName: string;
  aSource: IConfiguration);
var
  tempSource: IConfiguration;
begin

  if (aSource = nil) then
    raise EArgumentNilException.Create('Source darf nicht leer sein');


  if (_configurationSources.TryGetValue(aName, tempSource)) then
    raise EArgumentException.Create('Es wurde bereits eine Quelle mit diesem Schl�sselnamen hinzugef�gt.');


  _configurationSources.Add(aName, aSource);

end;

constructor TConfigurationManager.Create;
begin
  _configurationSources := TDictionary<string, IConfiguration>.Create();
end;

destructor TConfigurationManager.Destroy;
begin
  freeAndNil(_configurationSources);
  inherited;
end;

class function TConfigurationManager.getBoolean(aSchluessel: string): boolean;
var
  Source, Key: string;
begin

  TStringUtil.StringParts(aSchluessel, '://', Source, Key);

  result := TConfigurationManager.getInstance.getSource(Source).getBoolean(Key);
end;

class function TConfigurationManager.getDateTime(
  aSchluessel: string): TDateTime;
var
  Source, Key: string;
begin

  TStringUtil.StringParts(aSchluessel, '://', Source, Key);

  result := TConfigurationManager.getInstance.getSource(Source).getDateTime(Key);
end;

class function TConfigurationManager.getInstance: TConfigurationManager;
begin

  if (_instance = nil) then
    _instance := TConfigurationManager.Create;

  result := _instance;

end;

class function TConfigurationManager.getInteger(
  aSchluessel: string): integer;
var
  Source, Key: string;
begin

  TStringUtil.StringParts(aSchluessel, '://', Source, Key);

  result := TConfigurationManager.getInstance.getSource(Source).getInteger(Key);

end;

function TConfigurationManager.getSource(aName: string): IConfiguration;
begin

  result := _configurationSources.Items[aName];

  if (result = nil) then
    raise Exception.Create('Konfigurationsquelle ' + aName + ' nicht gefunden!');

end;

class function TConfigurationManager.getString(aSchluessel: string): string;
var
  Source, Key: string;
begin

  TStringUtil.StringParts(aSchluessel, '://', Source, Key);

  result := TConfigurationManager.getInstance.getSource(Source).getString(Key);
end;



end.
