unit Objekt.DateTime;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, DateUtils;

type
  TTbDateTime = class(TComponent)
  private
    fJahr: Word;
    fSekunde: Word;
    fStunde: Word;
    fTag: Word;
    fMinute: Word;
    fMonat: Word;
    fMilli: Word;
    function getDatum: TDateTime;
    procedure TryStrToWord(aStr: string; var aWord: Word; const aDefault: Word = 0);
  protected
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Jahr: Word read fJahr;
    property Monat: Word read fMonat;
    property Tag: Word read fTag;
    property Stunde: Word read fStunde;
    property Minute: Word read fMinute;
    property Sekunde: Word read fSekunde;
    property Milli: Word read fMilli;
    property Datum: TDateTime read getDatum;
    procedure SetMySqlDateTimeStr(aValue: string);
    procedure setDatum(aValue: TDateTime);
    procedure Init;
    function SetTimeToDate(aDate, aTime: TDateTime): TDateTime;
  end;

implementation

{ TTbDateTime }

constructor TTbDateTime.Create(AOwner: TComponent);
begin
  inherited;

end;

destructor TTbDateTime.Destroy;
begin

  inherited;
end;

function TTbDateTime.getDatum: TDateTime;
begin
  Result := EncodeDateTime(fJahr, fMonat, fTag, fStunde, fMinute, fSekunde, fMilli);
end;

procedure TTbDateTime.Init;
var
  dDatum: TDateTime;
begin
  dDatum := 0;
  DecodeDateTime(dDatum, fJahr, fMonat, fTag, fStunde, fMinute, fSekunde, fMilli);
end;

procedure TTbDateTime.setDatum(aValue: TDateTime);
begin
  DecodeDateTime(aValue, fJahr, fMonat, fTag, fStunde, fMinute, fSekunde, fMilli);
end;

procedure TTbDateTime.SetMySqlDateTimeStr(aValue: string);
var
  sJahr: string;
  sMonat: string;
  sTag: string;
  sStunde: string;
  sMin: string;
  sSek: string;
  wJahr: Word;
begin
  Init;
  if length(avalue) = 19 then
  begin
    sJahr   := copy(avalue, 1, 4);
    sMonat  := copy(aValue, 6,2);
    sTag    := copy(aValue, 9,2);
    sStunde := copy(aValue, 12,2);
    sMin := copy(aValue, 15,2);
    sSek := copy(aValue, 18,2);
    TryStrToWord(sJahr, fJahr);
    TryStrToWord(sMonat, fMonat);
    TryStrToWord(sTag, fTag);
    TryStrToWord(sStunde, fStunde);
    TryStrToWord(sMin, fMinute);
    TryStrToWord(sSek, fSekunde);
  end;
  if length(avalue) = 10 then
  begin
    sJahr   := copy(avalue, 1, 4);
    sMonat  := copy(aValue, 6,2);
    sTag    := copy(aValue, 9,2);
    TryStrToWord(sJahr, fJahr);
    TryStrToWord(sMonat, fMonat);
    TryStrToWord(sTag, fTag);
  end;
end;

procedure TTbDateTime.TryStrToWord(aStr: string; var aWord: Word; const aDefault: Word = 0);
var
  iTemp: Integer;
begin
  try
    if not TryStrToInt(aStr, iTemp) then
    begin
      aWord := aDefault;
      exit;
    end;
    aWord := Word(iTemp);
  except
    aWord := aDefault;
  end;
end;


function TTbDateTime.SetTimeToDate(aDate, aTime: TDateTime): TDateTime;
var
  Tag: Word;
  Monat: Word;
  Jahr: Word;
  Stunde: Word;
  Minute: Word;
  Sekunde: Word;
  Milli: Word;
begin
  DecodeDate(aDate, Jahr, Monat, Tag);
  DecodeTime(aTime, Stunde, Minute, Sekunde, Milli);
  Result := EncodeDateTime(Jahr, Monat, Tag, Stunde, Minute, Sekunde, Milli);
end;


end.
