program DevSpecific;

uses
  Forms,
  uMain in 'uMain.pas' {MainForm};

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
