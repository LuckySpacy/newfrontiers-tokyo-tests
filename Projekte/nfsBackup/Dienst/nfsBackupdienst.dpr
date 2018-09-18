program nfsBackupdienst;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Vcl.SvcMgr,
  Dienst.nfsBackup in 'Dienst.nfsBackup.pas' {nfsBackup: TService},
  Objekt.Allgemein in '..\Backup\Objekt\Objekt.Allgemein.pas',
  Objekt.Logger in '..\Backup\Objekt\Objekt.Logger.pas',
  Allgemein.System in '..\Allgemein\Allgemein.System.pas',
  Allgemein.Types in '..\Allgemein\Allgemein.Types.pas',
  Allgemein.SysFolderlocation in '..\Allgemein\Allgemein.SysFolderlocation.pas',
  Objekt.Ini in '..\Backup\Objekt\Objekt.Ini.pas',
  Allgemein.RegIni in '..\Allgemein\Allgemein.RegIni.pas',
  Objekt.Backupchecker in '..\Backup\Objekt\Objekt.Backupchecker.pas',
  Objekt.Option in '..\Backup\Objekt\Objekt.Option.pas',
  Objekt.OptionList in '..\Backup\Objekt\Objekt.OptionList.pas',
  Objekt.BaseList in '..\Backup\Objekt\Objekt.BaseList.pas',
  Objekt.DateTime in '..\Backup\Objekt\Objekt.DateTime.pas',
  Objekt.Backup in '..\Backup\Objekt\Objekt.Backup.pas',
  Objekt.Maildat in '..\Backup\Objekt\Objekt.Maildat.pas',
  Objekt.SendMail in '..\Backup\Objekt\Objekt.SendMail.pas';

{$R *.RES}

begin
  // F�r Windows 2003 Server muss StartServiceCtrlDispatcher vor
  // CoRegisterClassObject aufgerufen werden, das indirekt von
  // Application.Initialize aufgerufen werden kann. TServiceApplication.DelayInitialize
  // erm�glicht, dass Application.Initialize von TService.Main (nach
  // StartServiceCtrlDispatcher) aufgerufen werden kann.
  //
  // Eine verz�gerte Initialisierung des Application-Objekts kann sich auf
  // Ereignisse auswirken, die dann vor der Initialisierung ausgel�st werden,
  // wie z.B. TService.OnCreate. Dies wird nur empfohlen, wenn ServiceApplication
  // ein Klassenobjekt bei OLE registriert und f�r die Verwendung mit
  // Windows 2003 Server vorgesehen ist.
  //
  // Application.DelayInitialize := True;
  //
  if not Application.DelayInitialize or Application.Installing then
    Application.Initialize;
  Application.CreateForm(TnfsBackup, nfsBackup);
  Application.Run;
end.
