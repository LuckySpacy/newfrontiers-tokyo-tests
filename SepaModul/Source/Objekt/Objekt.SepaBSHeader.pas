unit Objekt.SepaBSHeader;

interface

uses
  SysUtils, Classes, Objekt.SepaBSPosList;

type
  TSepaBSHeader = class
  private
    fIBAN: string;
    fAuftraggeber: string;
    fBIC: string;
    fBS: TSepaBSPosList;
    fZahlDatum: TDateTime;
    fPmtMtd: string;
    fPmtInfId: string;
    fChrgBr: string;
    fMsgId: string;
    fChanged: Boolean;
    function getCtrlSum: Currency;
    function getNbOfTxs: Integer;
    function getMsgId: string;
    function getPmtInfId: string;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Init;
    property IBAN: string read fIBAN write fIBAN;
    property Auftraggeber: string read fAuftraggeber write fAuftraggeber;
    property BIC: string read fBIC write fBIC;
    property BS: TSepaBSPosList read fBS write fBS;
    property ZahlDatum: TDateTime read fZahlDatum write fZahlDatum;
    property PmtInfId: string read getPmtInfId write fPmtInfId;
    property PmtMtd: string read fPmtMtd write fPmtMtd;
    property NbOfTxs: Integer read getNbOfTxs;
    property CtrlSum: Currency read getCtrlSum;
    property ChrgBr: string read fChrgBr write fChrgBr;
    property MsgId: string read getMsgId write fMsgId;
    property Changed: Boolean read fChanged write fChanged;
  end;

implementation

{ TSepaBSHeader }

constructor TSepaBSHeader.Create;
begin
  fBS := TSepaBSPosList.Create;
  fChanged := false;
  Init;
end;

destructor TSepaBSHeader.Destroy;
begin
  FreeAndNil(fBS);
  inherited;
end;

function TSepaBSHeader.getCtrlSum: Currency;
var
  i1: Integer;
begin
  Result := 0;
  for i1 := 0 to fBS.Count -1 do
    Result := Result + fBS.Item[i1].Betrag;
end;

function TSepaBSHeader.getMsgId: string;
begin
  if fMsgId = '' then
    fMsgId := FormatDateTime('yyyy-mm-dd hh:mm:nn:zzz', now);
  Result := fMsgId;
end;

function TSepaBSHeader.getNbOfTxs: Integer;
var
  i1: Integer;
begin
  Result := 0;
  for i1 := 0 to fBS.Count -1 do
   Inc(Result);
end;

function TSepaBSHeader.getPmtInfId: string;
begin
  if fPmtInfId = '' then
    fPmtInfId := FormatDateTime('yyyymmddhhnnsszzz', now);
  Result := fPmtInfId;
end;

procedure TSepaBSHeader.Init;
begin
  fIBAN         := '';
  fAuftraggeber := '';
  fBIC          := '';
  fZahldatum    := StrToDate('01.01.1999');
  fPmtMtd       := '';
  fPmtInfId     := '';
  fChrgBr       := '';
end;

end.
