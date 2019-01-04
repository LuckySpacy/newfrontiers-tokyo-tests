unit Objekt.SepaBSPos;

interface

uses
  SysUtils, Classes, Objekt.SepaVZweck;

type
  TSepaBSPos = class
  private
    fBetrag: Currency;
    fIBAN: string;
    fEmpfaenger: string;
    fBIC: string;
    fVZweck: TSepaVZweck;
    fWaehrung: string;
    fZahldatum: TDateTime;
    fEndToEnd: string;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Init;
    property Betrag: Currency read fBetrag write fBetrag;
    property IBAN: string read fIBAN write fIBAN;
    property Empfaenger: string read fEmpfaenger write fEmpfaenger;
    property Waehrung: string read fWaehrung write fWaehrung;
    property BIC: string read fBIC write FBIC;
    property VZweck: TSepaVZweck read fVZweck write fVZweck;
    property Zahldatum: TDateTime read fZahldatum write fZahldatum;
    property EndToEnd: string read fEndToEnd write fEndToEnd;
    function VZweckStr: string;
  end;

implementation

{ TSepaBSPos }

constructor TSepaBSPos.Create;
begin
  fVZweck := TSepaVZweck.Create;
end;

destructor TSepaBSPos.Destroy;
begin
  FreeAndNil(fVZweck);
  inherited;
end;

procedure TSepaBSPos.Init;
begin
  fBetrag     := 0;
  fIBAN       := '';
  fEmpfaenger := '';
  fBIC        := '';
  fWaehrung   := 'EUR';
  fZahldatum  := StrToDate('01.01.1999');
  fEndToEnd   := '';
  fVZweck.Init;
end;

function TSepaBSPos.VZweckStr: string;
begin

  Result := '';
  if Trim(fVZweck.Zweck1) > '' then
    Result := Result + Trim(fVZweck.Zweck1) + ' ';
  if Trim(fVZweck.Zweck2) > '' then
    Result := Result + Trim(fVZweck.Zweck2) + ' ';
  if Trim(fVZweck.Zweck3) > '' then
    Result := Result + Trim(fVZweck.Zweck3) + ' ';
  if Trim(fVZweck.Zweck4) > '' then
    Result := Result + Trim(fVZweck.Zweck4) + ' ';

  Result := Trim(Result);

end;

end.
