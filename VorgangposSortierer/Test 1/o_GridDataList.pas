unit o_GridDataList;

interface

uses
  SysUtils, Classes, o_baselistobj, o_GridData, o_VorgangposSorter,
  o_Vorgangpossort;

type
  TGridDataList = class(TBaseListObj)
  private
    fSorter: TVorgangposSorter;
    function getGridData(Index: Integer): TGridData;
    procedure UebernehmeSortNrVonSorter;
    function getPrintidx(aIdx: string): string;
  public
    constructor Create; override;
    destructor Destroy; override;
    function Add: TGridData;
    property Item[Index: Integer]: TGridData read getGridData;
    procedure LadeSorter;
    procedure PosTauschen(aVonId, aNachId: Integer);
    function getIndex(aId: Integer): Integer;
  end;


implementation

{ TGridDataList }


function NachPrNrSortieren(Item1, Item2: Pointer): Integer;
begin
  Result := 0;
  if TGridData(Item1).PrnNr < TGridData(Item2).PrnNr then
    Result := -1
  else
    if TGridData(Item1).PrnNr > TGridData(Item2).PrnNr then
      Result := 1;
end;

constructor TGridDataList.Create;
begin
  inherited;
  fSorter := TVorgangposSorter.Create;
end;

destructor TGridDataList.Destroy;
begin
  FreeAndNil(fSorter);
  inherited;
end;

function TGridDataList.getGridData(Index: Integer): TGridData;
begin
  Result := nil;
  if Index > _List.Count then
    exit;
  Result := TGridData(_List.Items[Index]);
end;


function TGridDataList.getIndex(aId: Integer): Integer;
var
  i1: Integer;
begin
  for i1 := 0 to _List.Count -1 do
  begin
    if TGridData(_List.Items[i1]).Id = aId then
    begin
      Result := i1;
      exit;
    end;
  end;
end;

procedure TGridDataList.LadeSorter;
var
  i1: Integer;
  GridData: TGridData;
  SortPos: TVorgangposSort;
begin
  fSorter.Clear;
  for i1 := 0 to _List.Count -1 do
  begin
    GridData := TGridData(_List.Items[i1]);
    SortPos := fSorter.Add(GridData.ParentId);
    SortPos.Id  := GridData.Id;
    SortPos.Idx := GridData.Idx;
    SortPos.PrnNr := GridData.PrnNr;
    SortPos.Frm := GridData.Frm;
    SortPos.Nr  := GridData.Nr;
    SortPos.ParentId := GridData.ParentId;
  end;
  fSorter.ErstelleSortNummern;
  UebernehmeSortNrVonSorter;
  _List.Sort(@NachPrNrSortieren);
end;

procedure TGridDataList.PosTauschen(aVonId, aNachId: Integer);
var
  VonIndex: Integer;
  NachIndex: Integer;
  i1: Integer;
begin
  VonIndex  := getIndex(aVonId);
  NachIndex := getIndex(aNachId);
  if VonIndex > NachIndex then
  begin
    i1 := VonIndex - 1;
    while VonIndex > NachIndex do
    begin
      _List.Exchange(VonIndex, i1);
      dec(i1);
      dec(VonIndex);
    end;
  end;

  if VonIndex < NachIndex then
  begin
    i1 := VonIndex + 1;
    while VonIndex < NachIndex do
    begin
      _List.Exchange(VonIndex, i1);
      inc(i1);
      inc(VonIndex);
    end;
  end;

  fSorter.ErstelleSortNummern;
  UebernehmeSortNrVonSorter;

end;

procedure TGridDataList.UebernehmeSortNrVonSorter;
var
  i1: Integer;
  GridData: TGridData;
  SortPos: TVorgangposSort;
begin
  for i1 := 0 to _List.Count -1 do
  begin
    GridData := TGridData(_List.Items[i1]);
    SortPos := fSorter.GetPosSort(GridData.Id);
    if SortPos = nil then
      continue;
    GridData.Idx   := getPrintidx(SortPos.Idx);
    GridData.Frm   := SortPos.Frm;
    GridData.PrnNr := SortPos.PrnNr;
    GridData.Nr    := SortPos.Nr;
    GridData.HasChild := SortPos.HasChild;
  end;
end;

function TGridDataList.getPrintidx(aIdx: string): string;
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

function TGridDataList.Add: TGridData;
begin
  Result := TGridData.Create;
  _List.Add(Result);
end;



end.
