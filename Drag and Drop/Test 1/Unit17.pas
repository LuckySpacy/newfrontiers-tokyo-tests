unit Unit17;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, DragDrop, DropTarget,
  DragDropFile, o_DragAndDropDataAdapter, o_ObjOutlookDrop;

type
  TForm17 = class(TForm)
    grd: TStringGrid;
    DataFormatAdapterTarget: TDataFormatAdapter;
    DropFileTarget1: TDropFileTarget;
    procedure FormCreate(Sender: TObject);
    procedure DropFileTarget1Drop(Sender: TObject; ShiftState: TShiftState;
      APoint: TPoint; var Effect: Integer);
    procedure FormDestroy(Sender: TObject);
  private
    fPfad: string;
    fDragAndDropAdapter: TDragAndDropDataAdapter;
    fOutlookDrop: TObjOutlookDrop;
  public
  end;

var
  Form17: TForm17;

implementation

{$R *.dfm}

uses
  DragDropGraphics;


procedure TForm17.FormCreate(Sender: TObject);
begin
  grd.ColWidths[0] := 10;
  grd.ColWidths[1] := 200;
  grd.ColWidths[2] := 200;
  fPfad := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
  DropFileTarget1.Target := grd;
  fDragAndDropAdapter := TDragAndDropDataAdapter.Create;
  DataFormatAdapterTarget.Enabled := true;

  {
  fOutlookDrop := TObjOutlookDrop.Create;
  if fOutlookDrop.canUse then
    fOutlookDrop.DataFormatAdapterOutlook := DataFormatAdapterOutlook;
  DataFormatAdapterOutlook.Enabled := fOutlookDrop.canUse;
  }

end;

procedure TForm17.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fDragAndDropAdapter);
  FreeAndNil(fOutlookDrop);
end;

procedure TForm17.DropFileTarget1Drop(Sender: TObject; ShiftState: TShiftState;
  APoint: TPoint; var Effect: Integer);
var
  BitmapData: TBitmapDataFormat;
begin //

  if (TVirtualFileStreamDataFormat(DataFormatAdapterTarget.DataFormat).FileNames.Count > 0) then
  begin
    fDragAndDropAdapter.SaveVirtualFileStream(TVirtualFileStreamDataFormat(DataFormatAdapterTarget.DataFormat), fPfad);
    exit;
  end;
            {
  if (DataFormatAdapterBitmap.DataFormat <> nil) then
  begin
    if (DataFormatAdapterBitmap.DataFormat as TBitmapDataFormat).HasData then
    begin
      BitmapData := TBitmapDataFormat(DataFormatAdapterBitmap.DataFormat);
      ShowMessage('Bitmap');
      exit;
    end;

    if (DataFormatAdapterOutlook.DataFormat <> nil) then
    begin
      fOutlookDrop.Dropped;
      if fOutlookDrop.OutlookDropMessages.Count > 0 then
      begin
        exit;
      end;
    end;


  end;
    }

end;


end.
