program SepaModul;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Vcl.Forms,
  Form.SepaModul in 'Form\Form.SepaModul.pas' {frmSepaModul},
  Datenmodul.dm in 'Form\Datenmodul.dm.pas' {dm: TDataModule},
  Objekt.SepaModul in 'Objekt\Objekt.SepaModul.pas',
  Objekt.SepaBSPos in 'Objekt\Objekt.SepaBSPos.pas',
  Objekt.SepaVZweck in 'Objekt\Objekt.SepaVZweck.pas',
  Objekt.SepaBSPosList in 'Objekt\Objekt.SepaBSPosList.pas',
  Objekt.SepaBSHeader in 'Objekt\Objekt.SepaBSHeader.pas',
  Objekt.SepaBSHeaderList in 'Objekt\Objekt.SepaBSHeaderList.pas',
  Objekt.SepaModulGutschrift in 'Objekt\Objekt.SepaModulGutschrift.pas',
  Objekt.SepaFormat in 'Objekt\Objekt.SepaFormat.pas',
  Objekt.SepaDatei in 'Objekt\Objekt.SepaDatei.pas',
  Objekt.SepaDateiList in 'Objekt\Objekt.SepaDateiList.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmSepaModul, frmSepaModul);
  Application.Run;
end.
