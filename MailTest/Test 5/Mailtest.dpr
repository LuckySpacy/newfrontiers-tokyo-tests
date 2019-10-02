program Mailtest;

uses
  FastMM4 in 'FastMM\FastMM4.pas',
  FastMM4Messages in 'FastMM\Translations\German\by Thomas Speck\FastMM4Messages.pas',
  Vcl.Forms,
  Form.Mailtest in 'Form.Mailtest.pas' {frm_Mailtest},
  Allgemein.RegIni in 'Allgemein.RegIni.pas',
  Types.Mail in 'Types.Mail.pas',
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Objekt.SendMail in 'Objekt.SendMail.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_Mailtest, frm_Mailtest);
  Application.Run;
end.
