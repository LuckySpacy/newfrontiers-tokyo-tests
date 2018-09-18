program NFSBackupUI;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Vcl.Forms,
  Form.NFSBackupUI in 'Formular\Form.NFSBackupUI.pas' {frm_NFSBackupUI},
  Objekt.Option in '..\Backup\Objekt\Objekt.Option.pas',
  Objekt.BaseList in '..\Backup\Objekt\Objekt.BaseList.pas',
  Objekt.OptionList in '..\Backup\Objekt\Objekt.OptionList.pas',
  Form.Option in 'Formular\Form.Option.pas' {frm_Option},
  Objekt.Backup in '..\Backup\Objekt\Objekt.Backup.pas',
  Allgemein.Types in 'Allgemein\Allgemein.Types.pas',
  Allgemein.System in 'Allgemein\Allgemein.System.pas',
  Allgemein.SysFolderlocation in 'Allgemein\Allgemein.SysFolderlocation.pas',
  Allgemein.RegIni in 'Allgemein\Allgemein.RegIni.pas',
  Allgemein.Funktionen in 'Allgemein\Allgemein.Funktionen.pas',
  Objekt.Backupchecker in '..\Backup\Objekt\Objekt.Backupchecker.pas',
  Objekt.DateTime in '..\Backup\Objekt\Objekt.DateTime.pas',
  Objekt.Logger in '..\Backup\Objekt\Objekt.Logger.pas',
  Objekt.Allgemein in '..\Backup\Objekt\Objekt.Allgemein.pas',
  Objekt.Ini in '..\Backup\Objekt\Objekt.Ini.pas',
  Datenmodul.DM in '..\Backup\Datenmodul\Datenmodul.DM.pas' {dm: TDataModule},
  Vcl.Themes,
  Vcl.Styles,
  Form.Mail in 'Formular\Form.Mail.pas' {frm_Mail},
  Objekt.Maildat in '..\Backup\Objekt\Objekt.Maildat.pas',
  Objekt.SendMail in '..\Backup\Objekt\Objekt.SendMail.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  //Application.ShowMainForm := false;
  Application.CreateForm(Tfrm_NFSBackupUI, frm_NFSBackupUI);
  Application.Run;
end.
