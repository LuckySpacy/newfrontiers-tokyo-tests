unit Form.TestPrg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Tfrm_TestCopyFile = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edt_Datei: TEdit;
    edt_Ziel: TEdit;
    btn_Copy: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btn_CopyClick(Sender: TObject);
  private
   // FrmCopyFile: Tfrm_CopyFile;
    procedure KopiereDatei(aSource, aDest: String);
    procedure AfterCopy(Sender: TObject);
  public
  end;

var
  frm_TestCopyFile: Tfrm_TestCopyFile;

implementation

{$R *.dfm}

uses
  Form.CopyFile;




procedure Tfrm_TestCopyFile.FormCreate(Sender: TObject);
begin
  edt_Datei.Text := 'g:\OPTIMA\Update\DLL.Ticket64.dll';
  edt_Ziel.Text  := 'c:\Users\tbachmann.GB\AppData\Roaming\Optima\DLL.Ticket64.dll';
end;


procedure Tfrm_TestCopyFile.btn_CopyClick(Sender: TObject);
begin
  KopiereDatei(edt_Datei.Text, edt_Ziel.Text);
end;

procedure Tfrm_TestCopyFile.KopiereDatei(aSource, aDest: String);
var
  Form: Tfrm_CopyFile;
begin
  Form := Tfrm_CopyFile.Create(Self);
  Form.OnAfterCopy := AfterCopy;
  Form.Show;
  Form.CopyFile(aSource, aDest);
end;

procedure Tfrm_TestCopyFile.AfterCopy(Sender: TObject);
begin
  Tfrm_CopyFile(Sender).Close;
  FreeAndNil(Sender);
end;


end.
