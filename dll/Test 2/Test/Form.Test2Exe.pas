unit Form.Test2Exe;

interface

uses
  sharemem,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TShowDLL = procedure; StdCall;
  TShow2DLL = procedure(aConnection, aLoginMA: String; aMandantNr, aKuId: Integer); StdCall;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    procedure ShowDLL1;
    procedure ShowDLL2;
  public
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure ShowForm; StdCall; external 'TMSDLLTest.dll';

procedure TForm2.Button1Click(Sender: TObject);
begin
  ShowDLL1;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  ShowDLL2;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  //ShowForm;
end;

procedure TForm2.ShowDLL1;
var
  DLLHandle: THandle;
  DLLShow: TShowDLL;
begin
  DLLHandle := LoadLibrary('TMSDLLTest.dll');
  DLLShow := GetProcAddress(DLLHandle, 'ShowForm');
  DLLShow;
  FreeLibrary(DLLHandle);
end;

procedure TForm2.ShowDLL2;
var
  DLLHandle: THandle;
  DLLShow: TShow2DLL;
begin
  DLLHandle := LoadLibrary('TMSDLLTest.dll');
  DLLShow := GetProcAddress(DLLHandle, 'ShowForm2');
  DLLShow('localhost:c:/Datenbank/demo4.fdb', 'tbach', 75, 336519);
  FreeLibrary(DLLHandle);
end;


end.
