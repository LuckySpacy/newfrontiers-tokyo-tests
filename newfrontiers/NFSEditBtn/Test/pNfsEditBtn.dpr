program pNfsEditBtn;

uses
  Vcl.Forms,
  Form.NFSEditbtn in 'Form.NFSEditbtn.pas' {Form17},
  NFSEditBtn in '..\NFSEditBtn.pas',
  NFSEditProp in '..\NFSEditProp.pas',
  NFSEditBtnProp in '..\NFSEditBtnProp.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm17, Form17);
  Application.Run;
end.
