program SuchenUndErsetzen;

uses
  Vcl.Forms,
  Form.SuchenUndErsetzen in 'Form\Form.SuchenUndErsetzen.pas' {frm_SuchenUndErsetzen},
  Objekt.Global in 'Objekt\Objekt.Global.pas',
  Objekt.Ini in 'Objekt\Objekt.Ini.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_SuchenUndErsetzen, frm_SuchenUndErsetzen);
  Application.Run;
end.
