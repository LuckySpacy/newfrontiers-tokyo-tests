program RTTIXML;

uses
  Forms,
  quicktest in 'quicktest.pas' {Form1},
  QuickRTTI in '..\QuickRTTI.pas',
  lowX in '..\lowx.pas',
  LowxRTTI in '..\LowxRTTI.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
