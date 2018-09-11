program Project1;

uses
  FastMM4 in 'D:\Projekt\Tokyo\FastMM\FastMM4.pas',
  FastMM4Messages in 'D:\Projekt\Tokyo\FastMM\Translations\German\by Thomas Speck\FastMM4Messages.pas',
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
