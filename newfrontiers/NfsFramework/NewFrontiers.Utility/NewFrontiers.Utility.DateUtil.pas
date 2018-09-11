unit NewFrontiers.Utility.DateUtil;

interface

  type
    TDateUtil = class

      public
        ///	<summary>
        ///	  Gibt das Datum des nächsten Wochentags zurück (z.B. nächster
        ///	  Montag)
        ///	</summary>
        ///	<param name="aAusgangsdatum">
        ///	  Ab diesem Datum wird der nächste Tag gesucht. DIe Sucher erfolgt
        ///	  inklusive des Ausgangsdatums.
        ///	</param>
        class function getNextWochentag(aAusgangsdatum: TDateTime; aWochentag: Integer): TDateTime;

    end;

implementation
  uses DateUtils;



{ TDateUtil }

class function TDateUtil.getNextWochentag(aAusgangsdatum: TDateTime;
  aWochentag: Integer): TDateTime;
begin

  result := aAusgangsdatum;

  while (DayOfTheWeek(result) <> aWochentag) do
    result := result +1;


end;

end.
