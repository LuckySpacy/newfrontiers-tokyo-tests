unit Objekt.SepaBSPosList;

interface

uses
  SysUtils, Classes, Objekt.SepaBSPos, Contnrs;

type
  TSepaBSPosList = class
  private
    function GetCount: Integer;
    function getSepaBSPos(Index: Integer): TSepaBSPos;
  protected
    fList: TObjectList;
  public
    constructor Create;
    destructor Destroy; override;
    property Count: Integer read GetCount;
    property Item[Index: Integer]: TSepaBSPos read getSepaBSPos;
    function Add: TSepaBSPos;
  end;

implementation

{ TSepaBSPosList }


constructor TSepaBSPosList.Create;
begin
  fList := TObjectList.Create;
end;

destructor TSepaBSPosList.Destroy;
begin
  FreeAndNil(fList);
  inherited;
end;

function TSepaBSPosList.GetCount: Integer;
begin
  Result := fList.Count;
end;

function TSepaBSPosList.getSepaBSPos(Index: Integer): TSepaBSPos;
begin
  Result := nil;
  if Index > fList.Count -1 then
    exit;
  Result := TSepaBSPos(fList[Index]);
end;

function TSepaBSPosList.Add: TSepaBSPos;
begin
  Result := TSepaBSPos.Create;
  fList.Add(Result);
end;


end.
