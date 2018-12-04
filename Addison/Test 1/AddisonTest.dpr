program AddisonTest;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Vcl.Forms,
  Form.AddisonTest in 'Form.AddisonTest.pas' {Form1},
  afibu_TLB in 'addison\afibu_TLB.pas',
  addisonbasics_TLB in 'addison\addisonbasics_TLB.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
