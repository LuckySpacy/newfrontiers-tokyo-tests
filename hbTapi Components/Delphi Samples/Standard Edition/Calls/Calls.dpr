program Calls;

uses
  Forms,
  uMain in 'uMain.pas' {MainForm},
  uCallDisplay in 'uCallDisplay.pas' {FrameCallDisplay: TFrame};

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
