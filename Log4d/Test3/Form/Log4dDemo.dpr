program Log4dDemo;

uses
  FastMM4 in '..\FastMM\FastMM4.pas',
  FastMM4Messages in '..\FastMM\Translations\German\by Thomas Speck\FastMM4Messages.pas',
  Vcl.Forms,
  Form.Log4dDemo in 'Form.Log4dDemo.pas' {frm_Log4dDemo};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_Log4dDemo, frm_Log4dDemo);
  Application.Run;
end.
