program DFormTest;

uses
  Forms,
  dformmainu in 'dformmainu.pas' {Form1},
  QuickRTTI in '..\Source\QuickRTTI.pas',
  DFormsRTTI in '..\middleX\DFormsRTTI.pas',
  middlex in '..\middleX\middlex.pas',
  exposedfiler in '..\Source\exposedfiler.pas',
  MiddlexRTTI in '..\middleX\MiddleXRTTI.pas',
  testformu in 'testformu.pas' {Form2},
  Classes in '..\..\..\Program Files\Borland\Delphi5\Source\Vcl\classes.pas',
  LowxRTTI in '..\LOWX\LowxRTTI.pas',
  lowX in '..\LOWX\lowx.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
