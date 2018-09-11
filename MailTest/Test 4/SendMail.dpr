program SendMail;

uses
  Vcl.Forms,
  Form.SendMail in 'Form\Form.SendMail.pas' {frm_Sendmail},
  Objekt.SendMail in 'Objekt\Objekt.SendMail.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_Sendmail, frm_Sendmail);
  Application.Run;
end.
