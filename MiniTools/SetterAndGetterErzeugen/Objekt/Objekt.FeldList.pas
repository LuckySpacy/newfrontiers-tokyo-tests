unit Objekt.FeldList;

interface

uses
  SysUtils, Classes, Contnrs, Objekt.Feld;

type
  TFeldList = class
  private
    fPraefix: string;
    function GetCount: Integer;
    function getFeld(Index: Integer): TFeld;
    procedure setPreafix(const Value: string);
  protected
    fList: TObjectList;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    property Count: Integer read GetCount;
    function Add: TFeld;
    property Item[Index: Integer]: TFeld read getFeld;
    procedure Clear;
    procedure PropertyList(aStrings: TStrings);
    procedure InitList(aStrings: TStrings);
    procedure SaveToDBList(aStrings: TStrings);
    procedure LoadFromQuery(aStrings: TStrings);
    property Preafix: string read fPraefix write setPreafix;
    function getMaxNamenlaenge: Integer;
    function FuelleMitLeer(aValue: string; aMaxLength: Integer): string;
  end;

implementation

{ TFeldList }

uses
  db;



constructor TFeldList.Create;
begin
  fList := TObjectList.Create;
  fPraefix := '';
end;

destructor TFeldList.Destroy;
begin
  FreeAndNil(fList);
  inherited;
end;



function TFeldList.FuelleMitLeer(aValue: string; aMaxLength: Integer): string;
begin
  Result := aValue;
  while Length(Result) < aMaxLength do
    Result := Result + ' ';
end;

procedure TFeldList.Clear;
begin
  fList.Clear;
end;


function TFeldList.GetCount: Integer;
begin
  Result := fList.Count;
end;

function TFeldList.getFeld(Index: Integer): TFeld;
begin
  Result := nil;
  if Index > fList.Count -1 then
    exit;
  Result := TFeld(fList[Index]);
end;



function TFeldList.getMaxNamenlaenge: Integer;
var
  i1: Integer;
  s: string;
begin
  Result := 0;
  for i1 := 0 to fList.Count -1 do
  begin
    if Length(Item[i1].Name) > Result then
      Result := Length(Item[i1].Name);
  end;
end;

function TFeldList.Add: TFeld;
begin
  Result := TFeld.Create;
  fList.Add(Result);
end;


procedure TFeldList.PropertyList(aStrings: TStrings);
var
  i1: Integer;
  s: string;
  MaxLength: Integer;
  VariName: string;
begin
  aStrings.Clear;
  MaxLength := getMaxNamenlaenge;
  for i1 := 0 to fList.Count -1 do
  begin
    VariName := FuelleMitLeer(Item[i1].Name, MaxLength);
    s := 'property ' + VariName + ': ' + Item[i1].TypAsString + ' read f' + Variname + ' write set' + Item[i1].Name + ';';
    aStrings.Add(s);
  end;
end;

procedure TFeldList.SaveToDBList(aStrings: TStrings);
var
  i1: Integer;
  s: string;
begin
  aStrings.Clear;
  aStrings.Add('queryBuilder');
  aStrings.Add('.table(getTableName)');
  for i1 := 0 to fList.Count -1 do
  begin
    if Item[i1].Typ = ftDateTime then
      s := '.fieldDT(' + '''' + fPraefix + Item[i1].Name + '''' + ', f' + Item[i1].Name + ')'
    else
      s := '.field(' + '''' + fPraefix + Item[i1].Name + '''' + ', f' + Item[i1].Name + ')';
    aStrings.Add(s);
  end;
end;

procedure TFeldList.InitList(aStrings: TStrings);
var
  i1: Integer;
  s: string;
  MaxLength: Integer;
begin
  MaxLength := getMaxNamenlaenge;
  aStrings.Clear;
  for i1 := 0 to fList.Count -1 do
  begin
    s := 'f' + Item[i1].Name;
    s := FuelleMitLeer(s, MaxLength);
    s := s + ' := ';
    if Item[i1].TypIsString then
      s := s + QuotedStr('') + ';';
    if Item[i1].TypIsZahl then
      s := s + '0;';
    if Item[i1].Typ = ftBoolean then
      s := s + 'false;';
    if Item[i1].Typ = ftDateTime then
      s := s + '0;';
    aStrings.Add(s);
  end;
end;


procedure TFeldList.LoadFromQuery(aStrings: TStrings);
var
  i1: Integer;
  s: string;
  qry: string;
  MaxLength: Integer;
begin
  MaxLength := 0;
  aStrings.Clear;
  for i1 := 0 to fList.Count -1 do
  begin
    qry := 'aQuery.FieldByName(' + QuotedStr(fPraefix + Item[i1].Name) + ').';
    if Item[i1].Typ = ftInteger then
      qry := qry + 'AsInteger;';
    if Item[i1].Typ = ftFloat then
      qry := qry + 'AsFloat;';
    if (Item[i1].TypIsString) and (Item[i1].Typ <> ftBoolean) then
      qry := qry + 'AsString;';
    if (Item[i1].Typ = ftBoolean) then
      qry := qry + 'AsString = ' + QuotedStr('T') + ';';
    if (Item[i1].Typ = ftDateTime) then
      qry := qry + 'AsDateTime;';
    s := 'f' + Item[i1].Name;
    if Length(s) > MaxLength then
      MaxLength := Length(s);
    s := s + ' := ';
    s := s + qry;
    //aStrings.Add(s);
  end;

  for i1 := 0 to fList.Count -1 do
  begin
    qry := 'aQuery.FieldByName(' + QuotedStr(fPraefix + Item[i1].Name) + ').';
    if Item[i1].Typ = ftInteger then
      qry := qry + 'AsInteger;';
    if Item[i1].Typ = ftFloat then
      qry := qry + 'AsFloat;';
    if (Item[i1].TypIsString) and (Item[i1].Typ <> ftBoolean) then
      qry := qry + 'AsString;';
    if (Item[i1].Typ = ftBoolean) then
      qry := qry + 'AsString = ' + QuotedStr('T') + ';';
    if (Item[i1].Typ = ftDateTime) then
      qry := qry + 'AsDateTime;';
    s := 'f' + Item[i1].Name;
    s := FuelleMitLeer(s, MaxLength);
    s := s + ' := ';
    s := s + qry;
    aStrings.Add(s);
  end;


end;


procedure TFeldList.setPreafix(const Value: string);
begin
  fPraefix := Value;
  if fPraefix[Length(fPraefix)] <> '_' then
    fPraefix := fPraefix + '_';
end;

end.
