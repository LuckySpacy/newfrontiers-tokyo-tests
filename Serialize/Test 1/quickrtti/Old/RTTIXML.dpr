program RTTIXML;

uses
  Forms,
  quicktest in 'quicktest.pas' {Form1},
  QuickRTTI in 'QuickRTTI.pas',
  lowX in 'lowx.pas',
  QDataPool in 'QuickRTTI20\Source\QDataPool.pas',
  IBQDataPool in 'QuickRTTI20\Source\IBQDataPool.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
