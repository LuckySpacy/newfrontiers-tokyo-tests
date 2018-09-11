unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvUtil, Vcl.Grids, AdvObj, BaseGrid,
  AdvGrid, Vcl.ExtCtrls, o_GridDataList, o_GridData, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    grd: TAdvStringGrid;
    Panel1: TPanel;
    btn_LadeGrid: TButton;
    procedure FormCreate(Sender: TObject);
    procedure grdGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure FormDestroy(Sender: TObject);
    procedure btn_LadeGridClick(Sender: TObject);
    procedure grdKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    function SucheTauschRowUp(aParentId: Integer): Integer;
    function SucheTauschRowDown(aParentId: Integer): Integer;
  private
    fGridDataList: TGridDataList;
    procedure LadeGridData;
    procedure LadeGrid;
    procedure RefreshGrid;
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.FormCreate(Sender: TObject);
begin
  grd.ColCount := 6;
  grd.Options := grd.Options + [goColSizing];
  grd.Options := grd.Options + [goRowSelect];
  grd.Options := grd.Options - [goRangeSelect];
  grd.ShowSelection := false;
  grd.SortSettings.show := false;
  grd.DefaultRowHeight := 20;
  grd.SelectionRectangle := true;
  grd.ShowHint := true;
  grd.SortSettings.Show := true;
  grd.FixedColWidth := 10;
  grd.Cells[1,0] := 'ID';
  grd.Cells[2,0] := 'PosIdx';
  grd.Cells[3,0] := 'PrnNr';
  grd.Cells[4,0] := 'PosNr';
  grd.Cells[5,0] := 'Text';
  grd.ColWidths[5] := 200;
  fGridDataList := TGridDataList.Create;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fGridDataList);
end;

procedure TForm1.grdGetAlignment(Sender: TObject; ARow, ACol: Integer;
  var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if (ACol = 3) or (ACol=4) then
    HAlign := taRightJustify;

end;


procedure TForm1.grdKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  GridData: TGridData;
  IdVon: Integer;
  IdNach: Integer;
  NewRow: Integer;
begin
  if Shift = [ssCtrl] then
  begin
    IdVon   := 0;
    IdNach  := 0;
    NewRow  := 0;
    if (Key = VK_UP) and (grd.Objects[0, grd.Row] <> nil) then
    begin
      GridData := TGridData(grd.Objects[0, grd.Row]);
      IdVon := GridData.Id;
      NewRow := SucheTauschRowUp(GridData.ParentId);
    end;
    if (Key = VK_DOWN) and (grd.Objects[0, grd.Row] <> nil) then
    begin
      GridData := TGridData(grd.Objects[0, grd.Row]);
      IdVon := GridData.Id;
      NewRow := SucheTauschRowDown(GridData.ParentId);
    end;
    if (IdVon > 0) and (NewRow > 0) then
    begin
      GridData := TGridData(grd.Objects[0, NewRow]);
      IdNach := GridData.Id;
      fGridDataList.PosTauschen(IdVon, IdNach);
      RefreshGrid;
      grd.GotoCell(0, NewRow);
      //caption := 'Von: ' + IntToStr(IdVon) + ' Nach: ' + IntToStr(IdNach);
    end;
  end;

end;

function TForm1.SucheTauschRowUp(aParentId: Integer): Integer;
var
  Row: Integer;
  GridData: TGridData;
begin
  Result := -1;
  Row := grd.Row -1;
  while Row > 0 do
  begin
    if grd.Objects[0, Row] = nil then
    begin
      dec(Row);
      continue;
    end;
    GridData := TGridData(grd.Objects[0, Row]);
    if GridData.ParentId = aParentId then
    begin
      Result := Row;
      exit;
    end;
    dec(Row);
  end;
end;

function TForm1.SucheTauschRowDown(aParentId: Integer): Integer;
var
  Row: Integer;
  StartRow: Integer;
  GridData: TGridData;
begin
  Result := -1;
  Row := grd.Row +1;
  StartRow := Row;
  while Row < grd.RowCount do
  begin
    if grd.Objects[0, Row] = nil then
    begin
      inc(Row);
      continue;
    end;
    GridData := TGridData(grd.Objects[0, Row]);
    if (GridData.ParentId = aParentId) and (not GridData.HasChild) then
    begin
      Result := Row -1;
      if Result < StartRow then
        Result := StartRow;
      exit;
    end;
    if (GridData.ParentId = aParentId) and (StartRow < Row) then
    begin
      Result := Row-1;
      exit;
    end;
    inc(Row);
  end;
  if (Result = -1) and (StartRow-1 <> grd.RowCount) then
  begin
    GridData := TGridData(grd.Objects[0, StartRow-1]);
    if (GridData <> nil) and (GridData.ParentId = 0) then
      Result := grd.RowCount-1;
  end;
end;



procedure TForm1.btn_LadeGridClick(Sender: TObject);
begin
  LadeGrid;
end;


procedure TForm1.LadeGrid;
begin
  grd.ClearNormalCells;
  LadeGridData;
  fGridDataList.LadeSorter;
  RefreshGrid;
end;

procedure TForm1.RefreshGrid;
var
  i1: Integer;
  x: TGridData;
begin
  for i1 := 0 to fGridDataList.Count -1 do
  begin
    x := fGridDataList.Item[i1];
    grd.Objects[0, i1+1] := x;
    grd.Cells[1, i1+1] := IntToStr(x.Id);
    grd.Cells[2, i1+1] := x.Idx;
    grd.Cells[3, i1+1] := IntToStr(x.PrnNr);
    grd.Cells[4, i1+1] := IntToStr(x.Nr);
    grd.Cells[5, i1+1] := x.Bez;
  end;
end;


procedure TForm1.LadeGridData;
  procedure Add(aBez: string; aParentId, aId: Integer);
  var
    x: TGridData;
  begin
    x := fGridDataList.Add;
    x.Id  := aId;
    x.Bez := aBez;
    x.ParentId := aParentId;
  end;
begin
  fGridDataList.Clear;
  Add('Hardware', 0, 1);
  Add('Drucker', 1, 2);
  Add('Epson SD', 2, 3);
  Add('Brother YZ', 2, 4);
  Add('Software', 0, 5);
  Add('Optima', 5, 6);
  Add('Bleistift', 0, 7);
  Add('Kuli', 0, 8);
  Add('Dell', 2, 9);
end;


end.
