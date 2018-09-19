program TokyoInstaller;

uses
  Vcl.Forms,
  Form.TokyoInstaller in 'Form\Form.TokyoInstaller.pas' {Form1},
  Objekt.Global in 'Objekt\Objekt.Global.pas',
  Allgemein.Funktionen in 'Allgemein\Allgemein.Funktionen.pas',
  Allgemein.RegIni in 'Allgemein\Allgemein.RegIni.pas',
  Allgemein.SysFolderlocation in 'Allgemein\Allgemein.SysFolderlocation.pas',
  Allgemein.System in 'Allgemein\Allgemein.System.pas',
  Allgemein.Types in 'Allgemein\Allgemein.Types.pas',
  Objekt.Ini in 'Objekt\Objekt.Ini.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
