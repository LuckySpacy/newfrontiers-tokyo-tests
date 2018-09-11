unit u_PosSorter;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvUtil, Vcl.Grids, AdvObj, BaseGrid,
  AdvGrid, Vcl.StdCtrls, Vcl.ExtCtrls, o_GridDataList, o_GridData;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    btn_LadeGrid: TButton;
    grd: TAdvStringGrid;
    btn_Neu: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure grdGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure btn_LadeGridClick(Sender: TObject);
    procedure grdKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    fGridDataList: TGridDataList;
    procedure LadeGrid;
    procedure LadeGridData;
    procedure RefreshGrid;
    function SucheTauschRowUp(aListId: Integer): Integer;
    function SucheTauschRowDown(aListId: Integer): Integer;
    function getRowFromId(aId: Integer): Integer;
    procedure GotoRowFromId(aId: Integer);
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


procedure TForm1.FormShow(Sender: TObject);
begin
  grd.SetFocus;
end;

procedure TForm1.grdGetAlignment(Sender: TObject; ARow, ACol: Integer;
  var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if (ACol = 3) or (ACol=4) then
    HAlign := taRightJustify;
end;



procedure TForm1.btn_LadeGridClick(Sender: TObject);
begin
  LadeGrid;
  grd.SetFocus;
end;

procedure TForm1.LadeGridData;
  procedure Add(aBez: string; aParentId, aId: Integer);
  var
    x: TGridData;
  begin
    x := fGridDataList.Add;
    x.Bez := aBez;
    x.SortPos.Id  := aId;
    x.SortPos.ParentId := aParentId;
  end;
begin
  fGridDataList.Clear;


  Add('Hardware', 0, 1);
  Add('Drucker', 1, 2);
  Add('Epson SD', 2, 3);
  Add('Brother YZ', 2, 4);
  Add('Dell', 2, 9);

  Add('Software', 0, 5);
  Add('Optima', 5, 6);


  Add('Bleistift', 0, 7);
  Add('Kuli', 0, 8);

  Add('Drucker Zubehör', 1, 10);
  Add('Usb-Kabel', 10, 11);
  Add('Stromkabel', 10, 12);

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
  grd.RowCount := fGridDataList.Count + 1;
  for i1 := 0 to fGridDataList.Count -1 do
  begin
    x := fGridDataList.Item[i1];
    grd.Objects[0, i1+1] := x;
    grd.Cells[1, i1+1] := IntToStr(x.SortPos.Id);
    grd.Cells[2, i1+1] := x.SortPos.PrintIdx;
    grd.Cells[3, i1+1] := IntToStr(x.SortPos.PrnNr);
    grd.Cells[4, i1+1] := IntToStr(x.SortPos.Nr);
    grd.Cells[5, i1+1] := x.Bez;
  end;
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
      IdVon := GridData.SortPos.Id;
      NewRow := SucheTauschRowUp(GridData.SortPos.ListId);
    end;
    if (Key = VK_DOWN) and (grd.Objects[0, grd.Row] <> nil) then
    begin
      GridData := TGridData(grd.Objects[0, grd.Row]);
      IdVon := GridData.SortPos.Id;
      NewRow := SucheTauschRowDown(GridData.SortPos.ListId);
    end;
    if (IdVon > 0) and (NewRow > 0) then
    begin
      GridData := TGridData(grd.Objects[0, NewRow]);
      IdNach := GridData.SortPos.Id;
      fGridDataList.PosTauschen(IdVon, IdNach);
      RefreshGrid;
      GotoRowFromId(IdVon);
      //grd.GotoCell(0, NewRow);
      //caption := 'Von: ' + IntToStr(IdVon) + ' Nach: ' + IntToStr(IdNach);
    end;
    if (Key = VK_LEFT) and (grd.Objects[0, grd.Row] <> nil) then
    begin
      GridData := TGridData(grd.Objects[0, grd.Row]);
      IdVon := GridData.SortPos.Id;
      fGridDataList.EineEbeneNachOben(IdVon);
      RefreshGrid;
      GotoRowFromId(IdVon);
    end;
    if (Key = VK_RIGHT) and (grd.Objects[0, grd.Row] <> nil) then
    begin
      GridData := TGridData(grd.Objects[0, grd.Row]);
      IdVon := GridData.SortPos.Id;
      GridData := TGridData(grd.Objects[0, grd.Row-1]);
      if GridData = nil then
        exit;
      IdNach := GridData.SortPos.Id;
      fGridDataList.EineEbeneNachUnten(IdVon, IdNach);
      RefreshGrid;
      GotoRowFromId(IdVon);
    end;
  end;

end;

function TForm1.SucheTauschRowUp(aListId: Integer): Integer;
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
    if GridData.SortPos.ListId = aListId then
    begin
      Result := Row;
      exit;
    end;
    dec(Row);
  end;
end;

function TForm1.SucheTauschRowDown(aListId: Integer): Integer;
var
  Row: Integer;
  GridData: TGridData;
begin
  Result := -1;
  Row := grd.Row +1;
  while Row < grd.RowCount do
  begin
    if grd.Objects[0, Row] = nil then
    begin
      inc(Row);
      continue;
    end;
    GridData := TGridData(grd.Objects[0, Row]);
    if (GridData.SortPos.ListId = aListId) then
    begin
      Result := Row;
      exit;
    end;
    inc(Row);
  end;
end;


function TForm1.getRowFromId(aId: Integer): Integer;
var
  GridData: TGridData;
  i1: Integer;
begin
  Result := 1;
  for i1 := 1 to grd.Rowcount -1 do
  begin
    GridData := TGridData(grd.Objects[0, i1]);
    if GridData = nil then
      continue;
    if GridData.SortPos.Id = aId then
    begin
      Result := i1;
      exit;
    end;
  end;
end;




procedure TForm1.GotoRowFromId(aId: Integer);
begin
  grd.GotoCell(0, getRowFromId(aId));
end;

end.
