program NewsClient;

uses
  Forms,
  newsmainu in 'newsmainu.pas' {Form1},
  NewsStoryU in '..\StandAloneServer\NewsStoryU.pas',
  QRemote in '..\QRemote.pas',
  MiddlexRTTI in '..\..\middleX\MiddleXRTTI.pas',
  middlex in '..\..\middleX\middlex.pas',
  QuickRTTI in '..\..\Source\QuickRTTI.pas',
  newstoryformu in 'newstoryformu.pas' {NewStory};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TNewStory, NewStory);
  Application.Run;
end.
