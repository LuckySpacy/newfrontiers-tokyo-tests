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

function addiereZahlen(Zahl1, Zahl2: Integer): integer; StdCall; external 'Testdll.dll';
procedure showText(text: PChar); StdCall; external 'Testdll.dll';

procedure TForm1.Button1Click(Sender: TObject);
var
  Zahl: Integer;
begin
  showText(PChar('Hallo'));
  Zahl := addiereZahlen(1,2);
  Caption := IntToStr(Zahl);
end;

end.
