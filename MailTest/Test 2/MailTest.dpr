program MailTest;

uses
  Vcl.Forms,
  fntMailTest in 'fntMailTest.pas' {frmMailTest},
  o_SendMail in 'o_SendMail.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMailTest, frmMailTest);
  Application.Run;
end.
