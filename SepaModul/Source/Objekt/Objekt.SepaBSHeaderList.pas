unit Objekt.SepaBSHeaderList;

interface

uses
  SysUtils, Classes, Objekt.SepaBSHeader, contnrs;

type
  TSepaBSHeaderList = class
  private
    fList: TObjectList;
    fMsgId: string;
    fNm: string;
    fCreDtTM: string;
    fCtrlSum: real;
    fNbOfTxs: Integer;
    function GetCount: Integer;
    function getSepaBSHeader(Index: Integer): TSepaBSHeader;
    function getMsgId: string;
    function getNbOfTxs: Integer;
    function getCtrlSum: real;
  public
    constructor Create;
    destructor Destroy; override;
    property Count: Integer read GetCount;
    property Item[Index: Integer]: TSepaBSHeader read getSepaBSHeader;
    function Add: TSepaBSHeader;
    property MsgId: string read getMsgId write fMsgId;
    property CreDtTm: string read fCreDtTM write fCreDtTM;
    property CtrlSum: real read getCtrlSum;
    property NbOfTxs: Integer read getNbOfTxs;
    property Nm: string read fNm write fNm;
    procedure Init;
    function getBSHeader(aIBAN: string; aZahldatum: TDateTime): TSepaBSHeader;
  end;

implementation

{ TSepaBSHeaderList }


constructor TSepaBSHeaderList.Create;
begin
  fList := TObjectList.Create;
  Init;
end;

destructor TSepaBSHeaderList.Destroy;
begin
  FreeAndNil(fList);
  inherited;
end;


function TSepaBSHeaderList.GetCount: Integer;
begin
  Result := fList.Count;
end;

function TSepaBSHeaderList.getCtrlSum: real;
var
  i1: Integer;
begin
  Result := 0;
  for i1 := 0 to fList.Count -1 do
  begin
    Result := Result + TSepaBSHeader(fList.Items[i1]).CtrlSum;
  end;
end;

function TSepaBSHeaderList.getMsgId: string;
begin
  if fMsgId = '' then
    fMsgId := FormatDateTime('yyyy-mm-dd hh:mm:nn:zzz', now);
  Result := fMsgId;
end;


function TSepaBSHeaderList.getNbOfTxs: Integer;
begin
  fNbOfTxs := fList.Count;
  Result := fNbOfTxs;
end;

function TSepaBSHeaderList.getSepaBSHeader(Index: Integer): TSepaBSHeader;
begin
  Result := nil;
  if Index > fList.Count -1 then
    exit;
  Result := TSepaBSHeader(fList[Index]);
end;

procedure TSepaBSHeaderList.Init;
begin
  fMsgId   := '';
  fNm      := '';
  fCreDtTM := '';
  fCtrlSum := 0;
end;

function TSepaBSHeaderList.Add: TSepaBSHeader;
begin
  Result := TSepaBSHeader.Create;
  fList.Add(Result);
end;

function TSepaBSHeaderList.getBSHeader(aIBAN: string; aZahldatum: TDateTime): TSepaBSHeader;
var
  i1: Integer;
begin
  for i1 := 0 to fList.Count -1 do
  begin
    if (TSepaBSHeader(fList.Items[i1]).IBAN = aIBAN) and (TSepaBSHeader(fList.Items[i1]).Zahldatum = aZahldatum) then
    begin
      Result := TSepaBSHeader(fList.Items[i1]);
      exit;
    end;
  end;
  Result := Add;
end;




end.
