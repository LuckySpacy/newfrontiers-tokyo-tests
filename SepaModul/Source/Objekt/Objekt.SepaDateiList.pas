unit Objekt.SepaDateiList;

interface

uses
  SysUtils, Classes, Objekt.SepaDatei, contnrs;

type
  TSepaDateiList = class
  private
    fList: TObjectList;
    function GetCount: Integer;
    function getSepaDatei(Index: Integer): TSepaDatei;
  public
    constructor Create;
    destructor Destroy; override;
    property Count: Integer read GetCount;
    property Item[Index: Integer]: TSepaDatei read getSepaDatei;
    function Add: TSepaDatei;
    function SepaDatei(aFilename: string): TSepaDatei;
    procedure Init;
  end;

implementation

{ TSepaDateiList }


constructor TSepaDateiList.Create;
begin
  fList := TObjectList.Create;
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

end.
