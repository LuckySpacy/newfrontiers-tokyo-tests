program SessionTester;

uses
  Forms,
  clienttestu in 'clienttestu.pas' {Form1},
  SessionClient in 'SessionClient.pas',
  QuickRTTI in '..\..\Source\QuickRTTI.pas',
  QRemote in '..\..\Remoting\QRemote.pas',
  MiddlexRTTI in '..\..\middleX\MiddleXRTTI.pas',
  middlex in '..\..\middleX\middlex.pas',
  addvarformu in 'addvarformu.pas' {AddVariableForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TAddVariableForm, AddVariableForm);
  Application.Run;
end.
