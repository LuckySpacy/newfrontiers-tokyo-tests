program SessionStandAlone;

uses
  Forms,
  sessionstestmainu in 'sessionstestmainu.pas' {Form1},
  SessionServer in 'SessionServer.pas',
  QuickRTTI in '..\..\Source\QuickRTTI.pas',
  QRemote in '..\..\Remoting\QRemote.pas',
  middlex in '..\..\middleX\middlex.pas',
  MiddlexRTTI in '..\..\middleX\MiddleXRTTI.pas',
  GUIDs in '..\..\Source\GUIDs.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
