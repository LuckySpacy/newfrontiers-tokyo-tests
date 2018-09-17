unit Dienst.nfsBackup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.SvcMgr, Vcl.Dialogs,
  Objekt.Allgemein, Objekt.Backupchecker, Objekt.Option, Objekt.OptionList;

type
  TnfsBackup = class(TService)
    procedure ServiceCreate(Sender: TObject);
    procedure ServiceDestroy(Sender: TObject);
    procedure ServiceAfterInstall(Sender: TService);
    procedure ServiceAfterUninstall(Sender: TService);
    procedure ServiceBeforeInstall(Sender: TService);
    procedure ServiceBeforeUninstall(Sender: TService);
    procedure ServiceContinue(Sender: TService; var Continued: Boolean);
    procedure ServiceExecute(Sender: TService);
    procedure ServicePause(Sender: TService; var Paused: Boolean);
    procedure ServiceShutdown(Sender: TService);
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
  private
    fDataFile: string;
    fProgrammpfad: string;
    fBackupchecker: TBackupchecker;
    procedure BackupLauft(Sender: TObject; aOption: TOption);
    procedure BackupEndet(Sender: TObject; aOption: TOption);
    procedure ErrorBackup(Sender: TObject; aOption: TOption; aError: string);
  public
    function GetServiceController: TServiceController; override;
  end;

var
  nfsBackup: TnfsBackup;

implementation

{$R *.dfm}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  nfsBackup.Controller(CtrlCode);
end;


function TnfsBackup.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;



procedure TnfsBackup.ServiceCreate(Sender: TObject);
begin
  AllgemeinObj := TAllgemeinObj.create;
  AllgemeinObj.Log.DienstInfo('ServiceCreate');
  AllgemeinObj.Log.DienstInfo('Version 1.0.0 vom 17.09.2018 10:30');
  fProgrammpfad := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
  AllgemeinObj.Log.DebugInfo('fProgrammpfad='+fProgrammpfad);
  fDataFile := fProgrammpfad + 'nfsBackup.dat';
  AllgemeinObj.Log.DebugInfo('fDataFile='+fDataFile);
  fBackupchecker := TBackupchecker.Create;
  fBackupChecker.FullDataFilename := fDataFile;
end;

procedure TnfsBackup.ServiceDestroy(Sender: TObject);
begin
  FreeAndNil(fBackupchecker);
  FreeAndNil(AllgemeinObj);
end;

procedure TnfsBackup.ServiceExecute(Sender: TService);
begin
  AllgemeinObj.Log.DienstInfo('Dienst läuft');
  fBackupchecker.TimerEnabled := true;

  while not Terminated do
  begin
    sleep(100);
    ServiceThread.ProcessRequests(false);
  end;
  fBackupchecker.TimerEnabled := false;

  AllgemeinObj.Log.DienstInfo('Dienst ist beendet');
end;

procedure TnfsBackup.ServicePause(Sender: TService; var Paused: Boolean);
begin
  AllgemeinObj.Log.DienstInfo('ServicePause');
end;

procedure TnfsBackup.ServiceShutdown(Sender: TService);
begin
  AllgemeinObj.Log.DienstInfo('Shutdown');
end;

procedure TnfsBackup.ServiceStart(Sender: TService; var Started: Boolean);
begin
  AllgemeinObj.Log.DienstInfo('ServiceStart');
end;

procedure TnfsBackup.ServiceStop(Sender: TService; var Stopped: Boolean);
begin
  AllgemeinObj.Log.DienstInfo('ServiceStop');
end;

procedure TnfsBackup.ServiceAfterInstall(Sender: TService);
begin
  AllgemeinObj.Log.DienstInfo('AfterInstall');
end;


procedure TnfsBackup.ServiceAfterUninstall(Sender: TService);
begin
  AllgemeinObj.Log.DienstInfo('AfterUnInstall');
end;

procedure TnfsBackup.ServiceBeforeInstall(Sender: TService);
begin
  AllgemeinObj.Log.DienstInfo('BeforeInstall');
end;

procedure TnfsBackup.ServiceBeforeUninstall(Sender: TService);
begin
  AllgemeinObj.Log.DienstInfo('BeforeUnInstall');
end;

procedure TnfsBackup.ServiceContinue(Sender: TService; var Continued: Boolean);
begin
  AllgemeinObj.Log.DienstInfo('ServiceContinue');
end;


procedure TnfsBackup.BackupEndet(Sender: TObject; aOption: TOption);
begin
  AllgemeinObj.Log.BackupInfo('Backup beendet - ' + aOption.Datenbank);
end;

procedure TnfsBackup.BackupLauft(Sender: TObject; aOption: TOption);
begin
  AllgemeinObj.Log.BackupInfo('');
  AllgemeinObj.Log.BackupInfo('Backup läuft - ' + aOption.Datenbank);
end;

procedure TnfsBackup.ErrorBackup(Sender: TObject; aOption: TOption;
  aError: string);
begin
  AllgemeinObj.Log.BackupInfo('Backupfehler: ' +  aError);
end;



end.
