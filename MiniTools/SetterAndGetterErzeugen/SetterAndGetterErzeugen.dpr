program SetterAndGetterErzeugen;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Vcl.Forms,
  Form.SetterAndGetterErzeugen in 'Form.SetterAndGetterErzeugen.pas' {Form1},
  Objekt.Feld in 'Objekt\Objekt.Feld.pas',
  Objekt.FeldList in 'Objekt\Objekt.FeldList.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
