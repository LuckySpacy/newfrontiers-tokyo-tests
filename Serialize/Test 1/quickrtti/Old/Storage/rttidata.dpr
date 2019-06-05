program rttidata;

uses
  Forms,
  rttidatafu in 'rttidatafu.pas' {Form1},
  RTTIStorage in 'RTTIStorage.pas',
  XMLStorage in 'XMLStorage.pas',
  lowX in 'lowx.pas',
  QuickRTTI in 'QuickRTTI.pas',
  Stubtest in 'Stubtest.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
