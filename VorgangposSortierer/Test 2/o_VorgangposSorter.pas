unit o_VorgangposSorter;

interface

uses
  SysUtils, Classes, o_baselistobj, o_vorgangpossortlist, o_vorgangpossort,
  System.Contnrs;

type
  TVorgangposSorter = class(TBaseListObj)
  private
    function FindList(aId: Integer): TVorgangpossortlist;
    function GetPosSort(aId: Integer): TVorgangposSort;
    function getPrintidx(aIdx: string): string;
    procedure DeletePosSortInList(aPosSort: TVorgangposSort);
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure Add(aSortPos: TVorgangposSort);
    procedure ErstelleSortNummern;
    procedure EineEbeneNachOben(aId: Integer);
    procedure EineEbeneNachUnten(aVonId, aNachId: Integer);
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
  procedure ErstelleSortNr(aListId, aPrevListId: Integer; aIdx: string; var aPrnNr: Integer);
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
      SortPos.PrintIdx := getPrintidx(Idx);
      SortPos.PrevListId := aPrevListId;
      SortPos.ListId     := SortList.Id;
      ErstelleSortNr(SortPos.Id, SortList.Id, Idx, aPrnNr);
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
    SortPos.PrintIdx := Idx;
    SortPos.ListId   := SortList.Id;
   ErstelleSortNr(SortPos.Id, SortList.Id, Idx, PrnNr);
  end;
end;

function TVorgangposSorter.getPrintidx(aIdx: string): string;
var
  iPos: Integer;
  s: string;
begin
  Result := aIdx;
  s := aIdx;
  iPos := Pos('.', s);
  while iPos > 0 do
  begin
    s := copy(s, iPos+1, Length(s));
    Result := '  ' + Result;
    iPos := Pos('.', s);
  end;
end;

procedure TVorgangposSorter.Add(aSortPos: TVorgangposSort);
var
  x: TVorgangpossortlist;
  PosSort: TVorgangposSort;
begin
  x := FindList(aSortPos.ParentId);
  if x = nil then
  begin
    PosSort := GetPosSort(aSortPos.ParentId);
    if PosSort <> nil then
      PosSort.HasChild := true;
    x := TVorgangposSortList.Create;
    x.Id := aSortPos.ParentId;
    _List.Add(x);
  end;
  x.Add(aSortPos);
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





procedure TVorgangposSorter.DeletePosSortInList(aPosSort: TVorgangposSort);
var
  SortList: TVorgangpossortlist;
  i1: Integer;
begin
  SortList := FindList(aPosSort.ListId);
  if SortList = nil then
    exit;
  for i1 := 0 to SortList.Count -1 do
  begin
    if SortList.Item[i1].Id = aPosSort.Id then
    begin
      SortList.Delete(i1);
      exit;
    end;
  end;
end;


procedure TVorgangposSorter.EineEbeneNachOben(aId: Integer);
var
  PosSort: TVorgangPosSort;
  PosSortList: TVorgangpossortlist;
begin
  PosSort := getPosSort(aId);
  if PosSort = nil then
    exit;
  if PosSort.ListId = PosSort.PrevListId then // Es gibt keine Ebene über der jetzigen.
    exit;
  PosSortList := FindList(PosSort.PrevListId);
  if PosSortList = nil then
    exit;
  DeletePosSortInList(PosSort);
  PosSort.ParentId := PosSortList.Id;
  PosSortList.Add(PosSort);
end;



procedure TVorgangposSorter.EineEbeneNachUnten(aVonId, aNachId: Integer);
var
  PosSortVon: TVorgangPosSort;
  PosSortNach: TVorgangPosSort;
  PosSortList: TVorgangpossortlist;
begin
  PosSortVon := getPosSort(aVonId);
  if PosSortVon = nil then
    exit;
  PosSortNach := getPosSort(aNachId);
  if PosSortNach = nil then
    exit;
  PosSortList := FindList(PosSortNach.ListId);
  DeletePosSortInList(PosSortVon);
  if PosSortVon.ListId = PosSortNach.ListId then
  begin
    PosSortVon.ParentId := PosSortNach.Id;
    Add(PosSortVon);
  end
  else
  begin
    PosSortVon.ParentId := PosSortList.Id;
    PosSortList.Add(PosSortVon);
  end;
end;

end.
