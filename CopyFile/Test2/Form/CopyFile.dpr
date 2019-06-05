program CopyFile;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Vcl.Forms,
  Form.TestPrg in 'Form.TestPrg.pas' {frm_TestCopyFile},
  Form.CopyFile in 'Form.CopyFile.pas' {frm_CopyFile},
  Objekt.Dateikopieren in '..\Objekt\Objekt.Dateikopieren.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_TestCopyFile, frm_TestCopyFile);
  Application.Run;
end.
