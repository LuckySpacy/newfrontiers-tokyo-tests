program RTTIXML;

uses
  Forms,
  quicktest in 'quicktest.pas' {Form1},
  QuickRTTI in '..\..\Source\QuickRTTI.pas',
  lowX in '..\..\LOWX\lowx.pas',
  LowxRTTI in '..\..\LOWX\LowxRTTI.pas',
  middlex in '..\..\middleX\middlex.pas',
  MiddlexRTTI in '..\..\middleX\MiddleXRTTI.pas',
  DOMQuickRTTI in '..\..\DOM\DOMQuickRTTI.pas',
  MSXML2_TLB in '..\..\DOM\MSXML2_TLB.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
