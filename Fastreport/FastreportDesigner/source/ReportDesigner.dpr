program ReportDesigner;

uses
  Forms,
  u_ReportDesigner in 'u_ReportDesigner.pas' {Form1},
  o_nf in 'Global\o_nf.pas',
  o_func in 'Global\o_func.pas',
  o_printer in 'Global\o_printer.pas',
  o_RegIni in 'Global\o_RegIni.pas',
  o_sysfolderlocation in 'Global\o_sysfolderlocation.pas',
  o_System in 'Global\o_System.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
