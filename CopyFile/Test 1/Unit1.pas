unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, u_copyFile;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin //
  frm_CopyFile.Show;
  frm_CopyFile.CopyFile('g:\OPTIMA\Update\DLL.Ticket64.dll', 'c:\Users\tbachmann.GB\AppData\Roaming\Optima\DLL.Ticket64.dll');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  frm_CopyFile := Tfrm_CopyFile.Create(Self);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FreeAndNil(frm_CopyFile);
end;

end.
