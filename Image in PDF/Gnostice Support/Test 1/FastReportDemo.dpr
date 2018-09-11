program FastReportDemo;

uses
  Forms,
  XDocFR in 'XDocFR.pas' {frmFR};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmFR, frmFR);
  Application.Run;
//  ReportMemoryLeaksOnShutdown := True;
end.
