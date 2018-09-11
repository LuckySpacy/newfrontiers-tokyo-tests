unit NewFrontiers.Tapi;

interface

type

  /// <summary>
  /// Der Record TTapiResult kapselt Ergebnisse einer Operation. Tritt ein
  /// Fehler auf, wird der Fehler in der Eigenschaft error zur Verf�gung
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
  /// Interface f�r die verschiedenen TapiProvider implementierunngen. Der
  /// Aufruf der Funktionen wird von der konkerten Implementierung getrennt
  /// </summary>
  ITapiProvider = interface

    /// <summary>
    /// T�tigt einen Anruf �ber das eingestellte Ger�t
    /// </summary>
    function anrufen(aNummer: string): TTapiResult;

  end;

  /// <summary>
  /// Klasse, die die Tapi-Dienstleistungen zur Verf�gung stellt
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
