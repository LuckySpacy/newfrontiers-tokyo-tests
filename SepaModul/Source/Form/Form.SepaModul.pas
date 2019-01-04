unit Form.SepaModul;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Objekt.SepaModul, Vcl.StdCtrls;

type
  TfrmSepaModul = class(TForm)
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    fSepaModul: TSepaModul;
  public
  end;

var
  frmSepaModul: TfrmSepaModul;

implementation

{$R *.dfm}

uses
  Datenmodul.dm;


procedure TfrmSepaModul.Button1Click(Sender: TObject);
begin
  fSepaModul.VerarbeiteSepaUeberweisungen;
end;

procedure TfrmSepaModul.FormCreate(Sender: TObject);
begin
  fSepaModul := TSepaModul.Create;
  fSepaModul.Ausgabepfad := 'c:\temp\Sepa\';
  fSepaModul.Sicherungspfad := 'c:\temp\Sepa\save\';
  fSepaModul.Trans := dm.IBT;
end;

procedure TfrmSepaModul.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fSepaModul);
end;


end.
