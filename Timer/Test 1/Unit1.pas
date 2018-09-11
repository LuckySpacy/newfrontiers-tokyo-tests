unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, unit2, Vcl.ExtCtrls, Objekt.Timer;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  Form: TForm2;
begin
  Form := TForm2.Create(nil);
  try
    Form.ShowModal;
  finally
    FreeAndNil(Form);
  end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  //fTimer := TFormTimer.Create;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  //FreeAndNil(fTimer);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Caption := 'Hallo';
end;

end.
