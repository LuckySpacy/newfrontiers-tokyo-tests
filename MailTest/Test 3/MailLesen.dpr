program MailLesen;

uses
  Vcl.Forms,
  fntMailLesen in 'fntMailLesen.pas' {frm_MailLesen},
  o_MailLesen in 'o_MailLesen.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_MailLesen, frm_MailLesen);
  Application.Run;
end.
