unit o_GridDataList;

interface

uses
  SysUtils, Classes, o_baselistobj, o_GridData, o_VorgangposSorter;

type
  TGridDataList = class(TBaseListObj)
  private
    fSorter: TVorgangposSorter;
    function getGridData(Index: Integer): TGridData;
    function getIndex(aId: Integer): Integer;
  public
    constructor Create; override;
    destructor Destroy; override;
    function Add: TGridData;
    property Item[Index: Integer]: TGridData read getGridData;
    procedure LadeSorter;
    procedure PosTauschen(aVonId, aNachId: Integer);
    procedure EineEbeneNachOben(aId: Integer);
    procedure EineEbeneNachUnten(aVonId, aNachId: Integer);
  end;

implementation

{ TGridDataList }


function NachPrNrSortieren(Item1, Item2: Pointer): Integer;
begin
  Result := 0;
  if TGridData(Item1).SortPos.PrnNr < TGridData(Item2).SortPos.PrnNr then
    Result := -1
  else
    if TGridData(Item1).SortPos.PrnNr > TGridData(Item2).SortPos.PrnNr then
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

procedure TGridDataList.LadeSorter;
var
  i1: Integer;
  GridData: TGridData;
begin
  fSorter.Clear;
  for i1 := 0 to _List.Count -1 do
  begin
    GridData := TGridData(_List.Items[i1]);
    fSorter.Add(GridData.SortPos);
  end;
  fSorter.ErstelleSortNummern;
  _List.Sort(@NachPrNrSortieren);
end;

function TGridDataList.Add: TGridData;
begin
  Result := TGridData.Create;
  _List.Add(Result);
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

  LadeSorter;

end;

function TGridDataList.getIndex(aId: Integer): Integer;
var
  i1: Integer;
begin
  for i1 := 0 to _List.Count -1 do
  begin
    if TGridData(_List.Items[i1]).SortPos.Id = aId then
    begin
      Result := i1;
      exit;
    end;
  end;
end;

procedure TGridDataList.EineEbeneNachOben(aId: Integer);
begin
  fSorter.EineEbeneNachOben(aId);
  fSorter.ErstelleSortNummern;
  _List.Sort(@NachPrNrSortieren);
end;



procedure TGridDataList.EineEbeneNachUnten(aVonId, aNachId: Integer);
begin
  fSorter.EineEbeneNachUnten(aVonId, aNachId);
  fSorter.ErstelleSortNummern;
  _List.Sort(@NachPrNrSortieren);
end;

end.
