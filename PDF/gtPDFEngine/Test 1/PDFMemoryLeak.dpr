program PDFMemoryLeak;

uses
  FastMM4 in 'FastMM\FastMM4.pas',
  Vcl.Forms,
  Form.PDFMemoryLeak in 'Form.PDFMemoryLeak.pas' {frm_PDFMemoryLeak};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_PDFMemoryLeak, frm_PDFMemoryLeak);
  Application.Run;
end.
