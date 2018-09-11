unit NewFrontiers.Utility.StringUtil;

interface

  uses System.Classes;

  type

    TStringUtil = class


      public
        ///	<summary>
        ///	  Prüft, ob ein übergebener String mit einem bestimmten Substring
        ///	  beginnt
        ///	</summary>
        class function startsWith(aSubString, aString: string): boolean;

        ///	<summary>
        ///	  Prüft, ob der übergebene String leer ist.
        ///	</summary>
        class function isEmpty(aString: string): boolean;

        ///	<summary>
        ///	  Trennt einen String am ersten vorkommen des Trennzeichens auf und
        ///	  gibt die beiden Teile zurück
        ///	</summary>
        class procedure stringParts(aInput, aDelimiter: string; out aPart1: string; out aPart2: string);

        ///	<summary>
        ///	  Fügt die einzelnen Teile der String-Liste zu einem String zusammen
        ///	</summary>
        class function Implode(sDelimiter : string; sArray : TStrings): string; overload;

        ///	<summary>
        ///	  Fügt die einzelnen Teile des Array zu einem String zusammen
        ///	</summary>
        class function Implode(sDelimiter : string; sArray : array of string): string; overload;

        ///	<summary>
        ///	  Prüft, ob der Substring im String enthalten ist
        ///	</summary>
        class function Contains(aSubString, aString: string): boolean;

    end;

implementation

{ TStringUtil }

class function TStringUtil.Implode(sDelimiter: string;
  sArray: TStrings): string;
var
  I : integer;
  sReturn : string;
begin
  sReturn := '';
  for I := 0 to sArray.Count - 1 do
  begin
    sReturn := sReturn + sArray[I];
    if (I+1 < sArray.Count) then
    begin
      sReturn := sReturn + sDelimiter;
    end;
  end;
  Implode := sReturn;
end;

class function TStringUtil.Contains(aSubString, aString: string): boolean;
begin
  result := Pos(aSubstring, aString) > 0;
end;

class function TStringUtil.Implode(sDelimiter: string;
  sArray: array of string): string;
var
  I : integer;
  sReturn : string;
begin
  sReturn := '';
  for I := 0 to Length(sArray) - 1 do
  begin
    sReturn := sReturn + sArray[I];
    if (I+1 < Length(sArray)) then
    begin
      sReturn := sReturn + sDelimiter;
    end;
  end;
  Implode := sReturn;
end;

class function TStringUtil.isEmpty(aString: string): boolean;
begin
  result := aString = '';
end;

class function TStringUtil.startsWith(aSubString, aString: string): boolean;
begin
  result := Pos(aSubstring, aString) = 1;
end;

class procedure TStringUtil.stringParts(aInput, aDelimiter: string; out aPart1,
  aPart2: string);
var
  posTrenner: integer;
begin

  posTrenner := Pos(aDelimiter, aInput);

  if (posTrenner <= 0) then
  begin
    aPart1 := 'default';
    aPart2 := aInput;
  end

  else begin
    aPart1 := Copy(aInput, 1, posTrenner-1);
    aPart2 := Copy(aInput, posTrenner+length(aDelimiter), 255);
  end;
end;

end.
