program RemoteTest;

uses
  Forms,
  remotetestu in 'remotetestu.pas' {Form1},
  QRemote in 'QRemote.pas',
  MiddlexRTTI in '..\middleX\MiddleXRTTI.pas',
  QuickRTTI in '..\Source\QuickRTTI.pas',
  middlex in '..\middleX\middlex.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
