program Project1;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  u_CopyFile in 'u_CopyFile.pas' {frm_CopyFile},
  o_CopyFile in 'o_CopyFile.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
