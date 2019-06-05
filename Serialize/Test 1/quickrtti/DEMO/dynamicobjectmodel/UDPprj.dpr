program UDPprj;

uses
  Forms,
  unitdemo in 'unitdemo.pas' {Form1},
  udpclasses in 'udpclasses.pas',
  LowxRTTI in '..\..\LOWX\LowxRTTI.pas',
  lowX in '..\..\LOWX\lowx.pas',
  QuickRTTI in '..\..\Source\QuickRTTI.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
