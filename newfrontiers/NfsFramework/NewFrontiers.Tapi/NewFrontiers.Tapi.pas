unit NewFrontiers.Tapi;

interface

type

  /// <summary>
  /// Der Record TTapiResult kapselt Ergebnisse einer Operation. Tritt ein
  /// Fehler auf, wird der Fehler in der Eigenschaft error zur Verfügung
  /// gestellt.
  /// </summary>
  TTapiResult = record

    /// <summary>
    /// true, falls der Aufruf erfolgreich war
    /// </summary>
    result: boolean;

    /// <summary>
    /// Schlug der Aufruf fehl, steht in error der Fehlergrund
    /// </summary>
    error: string;
  end;

  /// <summary>
  /// Interface für die verschiedenen TapiProvider implementierunngen. Der
  /// Aufruf der Funktionen wird von der konkerten Implementierung getrennt
  /// </summary>
  ITapiProvider = interface

    /// <summary>
    /// Tätigt einen Anruf über das eingestellte Gerät
    /// </summary>
    function anrufen(aNummer: string): TTapiResult;

  end;

  /// <summary>
  /// Klasse, die die Tapi-Dienstleistungen zur Verfügung stellt
  /// </summary>
  TTapi = class

    private
      _provider: ITapiProvider;

    public
      property Provider: ITapiProvider read _provider write _provider;

      class function normalisieren(aNummer: string): string;

  end;

implementation

uses System.SysUtils;

{ TTapi }

class function TTapi.normalisieren(aNummer: string): string;
var
  i: integer;
begin
  result := '';

  for i := 1 to length(aNummer) do
  begin
    if (CharInSet(aNummer[i], ['0' .. '9'])) then
      result := result + aNummer[i]
    else if (aNummer[i] = '+') then
      result := result + '00';
  end;
end;

end.
