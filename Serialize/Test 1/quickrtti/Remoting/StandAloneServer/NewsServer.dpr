program NewsServer;

uses
  Forms,
  servermainu in 'servermainu.pas' {Form1},
  NewsStoryU in 'NewsStoryU.pas',
  QRemote in '..\QRemote.pas',
  QuickRTTI in '..\..\Source\QuickRTTI.pas',
  MiddlexRTTI in '..\..\middleX\MiddleXRTTI.pas',
  middlex in '..\..\middleX\middlex.pas',
  NewsStoryDBU in 'NewsStoryDBU.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
