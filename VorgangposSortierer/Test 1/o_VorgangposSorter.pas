unit o_VorgangposSorter;

interface

uses
  SysUtils, Classes, o_baselistobj, o_vorgangpossortlist, o_vorgangpossort,
  System.Contnrs;

type
  TVorgangposSorter = class(TBaseListObj)
  private
    function FindList(aId: Integer): TVorgangpossortlist;
  public
    constructor Create; override;
    destructor Destroy; override;
    function Add(aId: Integer): TVorgangposSort;
    procedure ErstelleSortNummern;
    function GetPosSort(aId: Integer): TVorgangposSort;
  end;

implementation

{ TVorgangposSorter }




constructor TVorgangposSorter.Create;
begin
  inherited;
end;

destructor TVorgangposSorter.Destroy;
begin

  inherited;
end;



procedure TVorgangposSorter.ErstelleSortNummern;
  procedure ErstelleSortNr(aListId: Integer; aIdx: string; var aPrnNr: Integer);
  var
    SortList: TVorgangPosSortList;
    Nr: Integer;
    i1: Integer;
    Idx: string;
    SortPos: TVorgangposSort;
  begin
    Nr := 0;
    SortList := FindList(aListId);
    if SortList = nil then
      exit;
    for i1 := 0 to SortList.Count -1 do
    begin
      inc(aPrnNr);
      inc(Nr);
      Idx := aIdx + '.' + IntToStr(Nr);
      SortPos := SortList.Item[i1];
      SortPos.PrnNr := aPrnNr;
      SortPos.Nr    := Nr;
      SortPos.Idx   := Idx;
      ErstelleSortNr(SortPos.Id, Idx, aPrnNr);
    end;
  end;
var
  i1: Integer;
  PrnNr: Integer;
  Nr: Integer;
  Idx: String;
  SortList: TVorgangPosSortList;
  SortPos: TVorgangposSort;
begin
  PrnNr := 0;
  Nr := 0;
  Idx := '';
  SortList := FindList(0);
  if SortList = nil then
    exit;
  for i1 := 0 to SortList.Count -1 do
  begin
    inc(PrnNr);
    inc(Nr);
    Idx := IntToStr(Nr);
    SortPos := SortList.Item[i1];
    SortPos.PrnNr := PrnNr;
    SortPos.Nr    := Nr;
    SortPos.Idx   := Idx;
    ErstelleSortNr(SortPos.Id, Idx, PrnNr);
  end;
end;

function TVorgangposSorter.Add(aId: Integer): TVorgangposSort;
var
  x: TVorgangpossortlist;
  PosSort: TVorgangposSort;
begin
  x := FindList(aId);
  if x = nil then
  begin
    PosSort := GetPosSort(aId);
    if PosSort <> nil then
      PosSort.HasChild := true;
    x := TVorgangposSortList.Create;
    x.Id := aId;
    _List.Add(x);
  end;
  Result := x.Add;
end;


function TVorgangposSorter.FindList(aId: Integer): TVorgangpossortlist;
var
  i1: Integer;
begin
  Result := nil;
  for i1 := 0 to _List.Count -1 do
  begin
    if TVorgangpossortlist(_List.Items[i1]).Id = aId then
    begin
      Result := TVorgangpossortlist(_List.Items[i1]);
      exit;
    end;
  end;
end;

function TVorgangposSorter.GetPosSort(aId: Integer): TVorgangposSort;
var
  i1, i2: Integer;
  SortList: TVorgangpossortlist;
begin
  Result := nil;
  for i1 := 0 to _List.Count -1 do
  begin
    SortList := TVorgangpossortlist(_List.Items[i1]);
    for i2 := 0 to SortList.Count -1 do
    begin
      if SortList.Item[i2].Id = aId then
      begin
        Result := SortList.Item[i2];
        exit;
      end;
    end;
  end;
end;

end.
