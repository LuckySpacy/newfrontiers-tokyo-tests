unit Form.MakeBmpTransparent;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, AdvEdit,
  AdvEdBtn, AdvDirectoryEdit, c_AllgTypes;

type
  Tfra_MakeBMPTransparent = class(TForm)
    edt_Pfad: TAdvDirectoryEdit;
    Label1: TLabel;
    PaintBox1: TPaintBox;
    btn_Konvertieren: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_KonvertierenClick(Sender: TObject);
  private
    FIni: string;
    FPath: string;
  public
  end;

var
  fra_MakeBMPTransparent: Tfra_MakeBMPTransparent;

implementation

{$R *.dfm}

uses
  u_regini, u_system;




procedure Tfra_MakeBMPTransparent.FormCreate(Sender: TObject);
begin
  FPath := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
  FIni  := FPath + 'MakeBmpTransparent.ini';
end;


procedure Tfra_MakeBMPTransparent.FormShow(Sender: TObject);
begin
  edt_Pfad.Text := ReadIni(FIni, 'Pfad', 'Pfad', '');
end;


procedure Tfra_MakeBMPTransparent.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  WriteIni(FIni, 'Pfad', 'Pfad', edt_Pfad.Text);
end;


procedure Tfra_MakeBMPTransparent.btn_KonvertierenClick(Sender: TObject);
var
  ListBild1: TStringList;
  i1: Integer;
  Filename: string;
  bmp1: TBitmap;
begin
  ListBild1 := TStringList.Create;
  try
    GetAllFiles(edt_Pfad.Text, ListBild1, true, false, '*.bmp');
    for i1 := 0 to ListBild1.Count -1 do
    begin
      FileName := ExtractFileName(ListBild1.Strings[i1]);
      bmp1 := TBitmap.Create;
      bmp1.LoadFromFile(ListBild1.Strings[i1]);
      bmp1.Canvas.Brush.Color := clFuchsia;
      bmp1.Canvas.Pen.Color := clFuchsia;
      bmp1.Canvas.MoveTo(0,bmp1.Height-1);
      bmp1.Canvas.LineTo(1,bmp1.Height-2);
      bmp1.SaveToFile(ListBild1.Strings[i1]);
    end;
    ShowMessage('Fertig');
  finally
    FreeAndNil(ListBild1);
  end;
end;



end.
