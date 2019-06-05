program rtti_tester;

uses
  Forms,
  base_driver in 'base_driver.pas' {Form1},
  TypInfo in '..\..\..\program files\borland\delphi5\source\vcl\typinfo.pas',
  QuickRTTI in '..\..\Source\QuickRTTI.pas',
  LowxRTTI in '..\..\LOWX\LowxRTTI.pas',
  lowX in '..\..\LOWX\lowx.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
