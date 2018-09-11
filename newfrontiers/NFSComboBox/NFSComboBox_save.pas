unit NFSComboBox;

interface

uses
  Windows, Messages, SysUtils, Classes, DB, Controls, StdCtrls, IBDatabase, IBQuery;

type
  TNFSComboBox = class(TComboBox)
  private
    { Private-Deklarationen }
    FValues: TStrings;
    FSQL   : TStrings;
    FTransaction : TIBTransaction;
    procedure setFValues(Value: TStrings);
    procedure setFSQL(Value: TStrings);
  protected
    { Protected-Deklarationen }
  public
    { Public-Deklarationen }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Add(aItem: string; aValue: string); overload;
    procedure Add(aQuery: TDataset; FieldItem, FieldValue: integer); overload;
    procedure Add(aQuery: TDataset; Anzahl, ID: integer; vor, hinter: string); overload;
    procedure AddFromSQL(Anzahl, ID: integer; vor, hinter: string); overload;
    procedure AddFromSQL(Text, ID: integer); overload;
    procedure Delete(aIdx: integer);
    function  getIdxValue: string;
    function  getIdxValueInt: integer;
    procedure Clear; override;
    procedure setItemIndex(aValue: string); overload;
    procedure setItemIndex(aValue: integer); reintroduce; overload;
    procedure SelectIdxValue(aValue: integer);
    procedure SelectNamesValue(aValue: string);
  published
    { Published-Deklarationen }
    property Values : TStrings read FValues write setFValues;
    property SQL : TStrings read FSQL write setFSQL;
    property Transaction : TIBTransaction read FTransaction write FTransaction;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('new frontiers', [TNFSComboBox]);
end;

{ TNFSComboBox }

procedure TNFSComboBox.Add(aItem, aValue: string);
begin
     if Values = nil then Values := TStringList.Create;

     Items.Add(aItem);
     FValues.Add(aValue);
end;

procedure TNFSComboBox.Add(aQuery: TDataset; FieldItem,
  FieldValue: integer);
begin
     if Values = nil then Values := TStringList.Create;

     while not aQuery.Eof do begin
        Add(aQuery.Fields[FieldItem].asString, aQuery.Fields[FieldValue].asString);
        aQuery.Next;
     end;
end;

{ Die Methode fügt Felder in der Reihenfolge der Query beginnend mit dem ersten Feld der Query ein

  Anzahl:      wie viele DB-Felder sollen verwendet werden (beginnend mit dem ersten Feld der query)
  ID:          an welcher Stelle ist das Feld mit der zu verwendenden ID
  vor, hinter: Zeichen vor bzw. hinter allen Feldern nach dem ersten
}
procedure TNFSComboBox.Add(aQuery: TDataset; Anzahl, ID: integer; vor, hinter: string);
var
i: integer;
temp: string;
begin
  if Values = nil then Values := TStringList.Create;

  while not aQuery.Eof do begin
//        Add(aQuery.Fields[FieldItem].asString + ' (' + aQuery.Fields[FieldItem2].asString + ')', aQuery.Fields[FieldValue].asString);
     temp := aQuery.Fields[0].asString;
     For i := 1 to (Anzahl - 1) do
     begin
       temp := temp + vor + aQuery.Fields[i].asString + hinter
     end;
     Add(temp, aQuery.Fields[ID].asString);
     aQuery.Next;
  end;
end;

{ Die Methode fügt Felder in der Reihenfolge der Query beginnend mit dem ersten Feld der Query ein

  Anzahl:      wie viele DB-Felder sollen verwendet werden (beginnend mit dem ersten Feld der query)
  ID:          an welcher Stelle ist das Feld mit der zu verwendenden ID
  vor, hinter: Zeichen vor bzw. hinter allen Feldern nach dem ersten
}
procedure TNFSComboBox.AddFromSQL(Anzahl, ID: integer; vor, hinter: string);
var WasOpen: boolean;
    Query: TIBQuery;
begin

     if (SQL.Text = '') or (Transaction = nil) then Exit;

     Query := TIBquery.Create(self);
     Query.Transaction := self.Transaction;
     WasOpen := Transaction.InTransaction;
     if not WasOpen then Transaction.startTransaction;

     Query.SQL := SQL;
     Query.Open;
     Add(Query, Anzahl, ID, vor, hinter);
     Query.Close;
     Query.Free;

     self.Enabled := (self.ItemCount > 0);

     if self.Items.Count > 0 then self.ItemIndex := 0
     else self.ItemIndex := -1;

     if not WasOpen then Transaction.Rollback;

end;

procedure TNFSComboBox.AddFromSQL(Text, ID: integer);
var WasOpen: boolean;
    Query: TIBQuery;
begin

     if (SQL.Text = '') or (Transaction = nil) then Exit;

     Query := TIBquery.Create(self);
     Query.Transaction := self.Transaction;
     WasOpen := Transaction.InTransaction;
     if not WasOpen then Transaction.startTransaction;

     Query.SQL := SQL;
     Query.Open;
     Add(Query, Text, ID);
     Query.Close;
     Query.Free;

     self.Enabled := (self.ItemCount > 0);

     if self.Items.Count > 0 then self.ItemIndex := 0
     else self.ItemIndex := -1;

     if not WasOpen then Transaction.Rollback;

end;

procedure TNFSComboBox.Clear;
begin
     if Values = nil then Values := TStringList.Create;

     Items.Clear;
     Values.Clear;
end;

constructor TNFSComboBox.Create(AOwner: TComponent);
begin
     inherited;
     FValues := TStringList.Create;
     FSQL    := TStringList.Create;
end;

procedure TNFSComboBox.Delete(aIdx: integer);
begin
     if aIdx > Items.Count-1 then Exit
     else begin
        Items.Delete(aIdx);
        Values.Delete(aIdx);
     end;
end;

destructor TNFSComboBox.Destroy;
begin
     if FValues <> nil then begin
        FValues.Free;
        FValues := nil;
     end;

     if FSQL <> nil then begin
        FSQL.Free;
        FSQL := nil;
     end;
     
     inherited;
end;

function TNFSComboBox.getIdxValue: string;
begin
     if (self.ItemIndex <> -1) and (self.ItemIndex < self.Items.Count) then
        result := Values[self.ItemIndex]
     else
        result := 'FEHLER!';
end;


function TNFSComboBox.getIdxValueInt: integer;
var i: integer;
    Temp: boolean;
    Temp2: string;
begin

     // numerisch?
     Temp  := true;
     Temp2 := getIdxValue;
     for i := 1 to Length(Temp2) do
        if not (CharInSet(Temp2[i], ['0'..'9'])) then begin
           Temp := false;
           Break;
        end;

     if not Temp then result := -1
     else result := StrToInt(Temp2);

end;


procedure TNFSComboBox.setFSQL(Value: TStrings);
begin
     FSQL.Assign(Value);
end;

procedure TNFSComboBox.setFValues(Value: TStrings);
begin
     FValues.Assign(Value);
end;

procedure TNFSComboBox.setItemIndex(aValue: string);
var i: integer;
    found: boolean;
begin

     found := false;

     for i := 0 to Values.Count-1 do
         if Values[i] = aValue then begin
            self.ItemIndex := i;
            found := true;
            Break;
         end;

     if not found then self.ItemIndex := -1;

     self.Repaint;
end;


procedure TNFSComboBox.setItemIndex(aValue: integer);
begin
     setItemIndex(IntToStr(aValue));
end;



//[tb 04.12.2012] Es wird nach dem ID-Wert gesucht, wenn gefunden selektiert.
procedure TNFSComboBox.SelectIdxValue(aValue: integer);
var
  i1: Integer;
  iValue: Integer;
begin
  for i1 := 0 to Values.Count - 1 do
  begin
    if not TryStrToInt(Values[i1], iValue) then
      iValue := -2;
    if aValue = iValue then
    begin
      ItemIndex := i1;
      break;
    end;
  end;
end;

procedure TNFSComboBox.SelectNamesValue(aValue: string);
var
  i1: Integer;
begin
  for i1 := 0 to Items.Count - 1 do
  begin
    if Items.Strings[i1] = aValue then
    begin
      ItemIndex := i1;
      break;
    end;
  end;
end;



end.

