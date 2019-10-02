program Project1;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Prop.NFSSpell in '..\..\..\..\Projekte\Optima\Komponenten\newfrontiers\NFSRichViewToolbar\Property\Prop.NFSSpell.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
