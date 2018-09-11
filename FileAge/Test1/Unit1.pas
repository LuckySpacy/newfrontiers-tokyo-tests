unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  d: TDateTime;
begin
  //FileAge('d:\Delphi\Tokyo\Test\FileAge\Test1\unit1.pas');
  FileAge('d:\Delphi\Tokyo\Test\FileAge\Test1\unit1.pas', d);
  caption := FormatDateTime('dd.mm.yyyy hh:nn:ss', d);
end;

end.
