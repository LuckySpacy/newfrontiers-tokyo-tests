unit o_func;

interface

{$WARN SYMBOL_PLATFORM OFF}
{$WARN UNIT_PLATFORM OFF}


// In dieser Unit befinden sich Befehle, die dazu dienen die Delphi Funktionen
// zu erweitern.

// Das Präfix nf_ steht für new|frontiers und beinhaltet, dass es sich hierbei
// um eine Globale new|frontiers Funktion handelt.

// Wichtig: Diese Funktionen sind alle Projektunabhängig.
//          Hier sollten keine Projetspezifische Funktionen geschrieben werden.
//          In Optima gibt es dafür die Unit f_Optima
//          Es sollten nur Delphi-Standard Units eingebunden werden.


uses
  SysUtils, Classes, Windows;

type
  Tnf_func = class
  public
    class function IndexOfArray(aValue: string; aArray: array of String): Integer;
    class function TextCoder(aValue: string; aPassword: Integer; aDecode: Boolean): string;
    class function StrToInt(const aValue: string; const aDefault: Integer = 0): Integer;
    class function BoolToStr(const aValue: Boolean): string;
    class function GetIntFromStr(const aValue: string; const aDefault: Integer = -1): Integer;
    class function FillStr(const aValue: string; const aLength: Integer;
                        const aFillStr: string; const aRight: Boolean = false): string;
    class procedure SplittStrByLength(const aValue: string; const aLength: Integer; aStrings: TStrings);
    class function InsertBetween(aStr, aValue: string; aPos: Integer): string;
  end;


implementation


// Den Indexwert aus einem Array Lesen
class function Tnf_func.IndexOfArray(aValue: string; aArray: array of String): Integer;
var
  i1: Integer;
begin
  Result := low(aArray);
  for i1 := low(aArray) to high(aArray) do
  begin
    if AnsiCompareText(aValue, aArray[i1]) = 0 then
    begin
      Result := i1;
      exit;
    end;
  end;
end;


class function Tnf_func.InsertBetween(aStr, aValue: string; aPos: Integer): string;
var
  s1: string;
  s2: string;
begin
  s1     := copy(aStr, 1, aPos);
  s2     := copy(aStr, aPos+1, Length(aStr));
  Result := s1 + aValue + s2;
end;

// Einfaches Verschlüsseln und Entschlüsseln eines Textes
class function Tnf_func.TextCoder(aValue: string; aPassword: Integer; aDecode: Boolean): string;
var
  i, c, x: Integer;
begin
  if aDecode then x := -1 else x := 1;
  RandSeed := aPassword;
  Result := '';
  for i := 1 to length(aValue) do
  begin
    c := ord(aValue[i]);
    if c in [32..122] then
    begin
      c := c+(x*Random(90));
      if (c<32) or (c>122) then c := c-(x*91);
    end;
    Result := Result + chr(c);
  end;
end;

// Einen Stringwert in einen Integerwert wandeln
// Sollte dies scheitern, dann einen bestimmten Wert zurückgeben (Default = 0).
class function Tnf_func.StrToInt(const aValue: string; const aDefault: Integer = 0): Integer;
begin
  if TryStrToInt(aValue, Result) then
    exit;
  Result := aDefault;
end;


// Einen Boolschenwert in einen String mit '0' oder '1' wandeln
class function Tnf_func.BoolToStr(const aValue: Boolean): string;
begin
  if aValue then
    Result := '1'
  else
    Result := '0';
end;


// Nur die Zahlen aus einen String lesen
class function Tnf_func.GetIntFromStr(const aValue: string; const aDefault: Integer = -1): Integer;
var
  i1    : Integer;
  s     : string;
begin
  s := '';
  for i1 := 1 to Length(aValue) do
  begin
    if  (aValue[i1] >= '0')
    and (aValue[i1] <= '9') then
      s := s + aValue[i1];
  end;
  Result := Tnf_func.StrToInt(s, aDefault);
end;

// Füllt einen String mit Strings auf bis Stringlänge erreicht ist.
// Im Defaultwert ist Auffüllen nach Links vorgegeben.
class function Tnf_func.FillStr(const aValue: string; const aLength: Integer;
  const aFillStr: string; const aRight: Boolean = false): string;
begin
  Result := aValue;
  while Length(Result) < aLength do
  begin
    if aRight then
      Result := Result + aFillStr
    else
      Result := aFillStr + Result;
  end;
end;


// Einen String bei einer bestimmten Länge aufspalten.
class procedure Tnf_func.SplittStrByLength(const aValue: string; const aLength: Integer; aStrings: TStrings);
var
  s: string;
begin
  aStrings.Clear;
  s := aValue;
  while s > '' do
  begin
    aStrings.add(copy(s, 1, aLength));
    delete(s, 1, aLength);
  end;
end;


end.
