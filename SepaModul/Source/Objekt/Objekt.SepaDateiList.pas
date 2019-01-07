unit Objekt.SepaDateiList;

interface

uses
  SysUtils, Classes, Objekt.SepaDatei, contnrs;

type
  TSepaDateiList = class
  private
    fList: TObjectList;
    fFilePath: string;
    function GetCount: Integer;
    function getSepaDatei(Index: Integer): TSepaDatei;
    function getNewFilename: string;
    function getLastFileNumber: Integer;
    procedure setFilePath(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
    property Count: Integer read GetCount;
    property Item[Index: Integer]: TSepaDatei read getSepaDatei;
    function Add: TSepaDatei;
    function SepaDatei(aFilename: string): TSepaDatei;
    function SepaDateiByIban(aIBAN: string): TSepaDatei;
    function SepaDateiByIbanUndZahlung(aIBAN: string; aZahlung: TDateTime): TSepaDatei;
    property FilePath: string read fFilePath write setFilePath;
    procedure Init;
  end;

implementation

{ TSepaDateiList }


constructor TSepaDateiList.Create;
begin
  fList := TObjectList.Create;
  fFilePath := '';
end;

destructor TSepaDateiList.Destroy;
begin
  FreeAndNil(fList);
  inherited;
end;

function TSepaDateiList.Add: TSepaDatei;
begin
  Result := TSepaDatei.Create;
  fList.Add(Result);
end;


function TSepaDateiList.GetCount: Integer;
begin
  Result := fList.Count;
end;

function TSepaDateiList.SepaDatei(aFilename: string): TSepaDatei;
var
  i1: Integer;
begin
  for i1 := 0 to fList.Count -1 do
  begin
    if SameText(aFileName, TSepaDatei(fList.Items[i1]).Filename) then
    begin
      Result := TSepaDatei(fList.Items[i1]);
      exit;
    end;
  end;
  Result := Add;
  Result.Filename := aFilename;
end;


function TSepaDateiList.SepaDateiByIban(aIBAN: string): TSepaDatei;
var
  i1, i2: Integer;
  SepaDat: TSepaDatei;
begin
  Result := nil;
  for i1 := 0 to fList.Count -1 do
  begin
    SepaDat := TSepaDatei(fList.Items[i1]);
    for i2 := 0 to SepaDat.BSHeaderList.Count -1 do
    begin
      if SameText(SepaDat.BSHeaderList.Item[i2].IBAN, aIBAN) then
      begin
        Result := SepaDat;
        exit;
      end;
    end;
  end;
  Result := Add;
  Result.Filename := fFilePath + getNewFilename;
end;





procedure TSepaDateiList.setFilePath(const Value: string);
begin
  fFilePath := IncludeTrailingPathDelimiter(Value);
end;

function TSepaDateiList.getLastFileNumber: Integer;
var
  i1: Integer;
begin
  Result := -1;
  for i1 := 0 to fList.Count -1 do
  begin
    if Result < TSepaDatei(fList.Items[i1]).DateiNummer then
      Result := TSepaDatei(fList.Items[i1]).DateiNummer;
  end;
end;

function TSepaDateiList.getNewFilename: string;
var
  LastFileNumber: Integer;
  sFileNumber: string;
begin
  LastFileNumber := getLastFileNumber;
  inc(LastFileNumber);
  sFileNumber := IntToStr(LastFileNumber);
  while (Length(sFileNumber) <3) do
    sFileNumber := '0' + sFileNumber;
  Result := 'SEPA_G' + sFileNumber + '.xml';
end;

function TSepaDateiList.getSepaDatei(Index: Integer): TSepaDatei;
begin
  Result := nil;
  if Index > fList.Count -1 then
    exit;
  Result := TSepaDatei(fList[Index]);
end;

procedure TSepaDateiList.Init;
begin

end;

function TSepaDateiList.SepaDateiByIbanUndZahlung(aIBAN: string;  aZahlung: TDateTime): TSepaDatei;
var
  i1, i2: Integer;
  SepaDat: TSepaDatei;
begin
  Result := nil;
  for i1 := 0 to fList.Count -1 do
  begin
    SepaDat := TSepaDatei(fList.Items[i1]);
    for i2 := 0 to SepaDat.BSHeaderList.Count -1 do
    begin
      if (SameText(SepaDat.BSHeaderList.Item[i2].IBAN, aIBAN)) and (SepaDat.BSHeaderList.Item[i2].ZahlDatum = aZahlung) then
      begin
        Result := SepaDat;
        exit;
      end;
    end;
  end;
  Result := Add;
  Result.Filename := fFilePath + getNewFilename;
end;


end.
