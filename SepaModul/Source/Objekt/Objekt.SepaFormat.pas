unit Objekt.SepaFormat;

interface

uses
  SysUtils, Classes;


type
  TSepaFormat = class
  private
  public
    constructor Create;
    destructor Destroy; override;
    function SepaDateToDateTime(aSepaDate: string): TDateTime;
    function DateToSepaDate(aDateTime: TDateTime): string;
    function SepaStrToInt(aValue: string): Integer;
    function SepaCurrStrToCurr(aValue: string): Currency;
    function SepaCurrToCurrStr(aValue: Currency): String;
    function IsoDateTime: string;
  end;

implementation

{ TSepaFormat }

constructor TSepaFormat.Create;
begin

end;


destructor TSepaFormat.Destroy;
begin

  inherited;
end;

function TSepaFormat.IsoDateTime: string;
begin
  Result := FormatDateTime('YYYY-MM-DD', now) + 'T' + FormatDateTime('hh:nn:ss', now);
end;

function TSepaFormat.SepaDateToDateTime(aSepaDate: string): TDateTime;
var
  sJahr: string;
  sMonat: string;
  sTag: string;
  sDatum: string;
begin
  sJahr  := copy(aSepaDate, 1, 4);
  sMonat := copy(aSepaDate, 6,2);
  sTag   := copy(aSepaDate, 9,2);
  sDatum := sTag + '.' + sMonat + '.' + sJahr;
  if not TryStrToDate(sDatum, Result) then
    Result := StrToDate('01.01.1999');
end;

function TSepaFormat.SepaCurrStrToCurr(aValue: string): Currency;
var
  s: string;
begin
  s := StringReplace(aValue, ',', '', [rfReplaceAll]);
  s := StringReplace(aValue, '.', ',', [rfReplaceAll]);
  if not TryStrToCurr(s, Result) then
    Result := 0;
end;

function TSepaFormat.SepaCurrToCurrStr(aValue: Currency): String;
begin
  Result := CurrToStr(aValue);
  Result := StringReplace(Result, ',', '.', [rfReplaceAll]);
end;

function TSepaFormat.SepaStrToInt(aValue: string): Integer;
begin
  if not TryStrToInt(aValue, Result) then
    Result := 0;
end;


function TSepaFormat.DateToSepaDate(aDateTime: TDateTime): string;
var
  Jahr: Word;
  Monat: Word;
  Tag: Word;
  sMonat: string;
  sTag: string;
begin
  DecodeDate(aDateTime, Jahr, Monat, Tag);
  sMonat := IntToStr(Monat);
  sTag   := IntToStr(Tag);
  if Length(sTag) = 1 then
    sTag := '0' + sTag;
  if Length(sMonat) = 1 then
    sMonat := '0' + sMonat;
  Result := IntToStr(Jahr) + '-' + sMonat + '-' + sTag;
end;


end.
