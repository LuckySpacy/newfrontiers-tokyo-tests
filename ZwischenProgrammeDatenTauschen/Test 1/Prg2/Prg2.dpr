program Prg2;

uses
  Vcl.Forms,
  Unit2 in 'Unit2.pas' {frm_Prg2},
  Objekt.Prg2CopyData in 'Objekt.Prg2CopyData.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_Prg2, frm_Prg2);
  Application.Run;
end.
