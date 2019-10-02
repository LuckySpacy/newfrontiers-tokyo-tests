unit Objekt.Logger;

interface

uses
  SysUtils, Classes, Log4d;

type
  TLoggerObj = class
  private
    fLogPath: string;
    fDebugLog: log4d.TLogLogger;
    fBackupLog: log4d.TLogLogger;
    fDienstLog: log4d.TLogLogger;
  protected
  public
    constructor Create;
    destructor Destroy; override;
    procedure Init;
    property LogPath: string read fLogPath;
    procedure DebugInfo(aMsg: string);
    procedure BackupInfo(aMsg: string);
    procedure DienstInfo(aMsg: string);
    function getLogger: log4d.TLogLogger;
    function getLoggerIni: log4d.TLogLogger;
    function getLoggerDienst: log4d.TLogLogger;
  end;


implementation

{ TLoggerObj }

uses
  Allgemein.System, Allgemein.Types, vcl.Forms, Winapi.ShlObj;

constructor TLoggerObj.Create;
begin

  fDebugLog := nil;
  fBackupLog := nil;
  fDienstLog := nil;

 if (not FileExists(ExtractFilePath(Application.ExeName) + 'log4dBackup.props')) then
   exit;

  TLogPropertyConfigurator.Configure(ExtractFilePath(Application.ExeName) + 'log4dBackup.props');

  fLogPath := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + 'LogFiles\';
  //fLogPath := GetShellFolder(CSIDL_APPDATA) + '\Optima\TapiLogFiles\';

  if not DirectoryExists(fLogPath) then
    ForceDirectories(fLogPath);


  fDebugLog := TLogLogger.GetLogger('Debug');
  fBackupLog := TLogLogger.GetLogger('Backup');
  fDienstLog := TLogLogger.GetLogger('Dienst');

  if fDebugLog.Appenders.Count = 1 then
    (fDebugLog.Appenders[0] as ILogRollingFileAppender).renameLogfile(fLogPath + 'Debug.log');  //<-- Pfad zuweisen

  if fBackupLog.Appenders.Count = 1 then
    (fBackupLog.Appenders[0] as ILogRollingFileAppender).renameLogfile(fLogPath + 'Backup.log');  //<-- Pfad zuweisen

  if fDienstLog.Appenders.Count = 1 then
    (fDienstLog.Appenders[0] as ILogRollingFileAppender).renameLogfile(fLogPath + 'Dienst.log');  //<-- Pfad zuweisen


end;

destructor TLoggerObj.Destroy;
begin

  inherited;
end;

procedure TLoggerObj.DienstInfo(aMsg: string);
begin
  if fDienstLog = nil then
    exit;
  fDienstLog.Info(aMsg);
end;

function TLoggerObj.getLogger: log4d.TLogLogger;
begin
  Result := fDebugLog;
end;

function TLoggerObj.getLoggerDienst: log4d.TLogLogger;
begin
  Result := fDienstLog;
end;

function TLoggerObj.getLoggerIni: log4d.TLogLogger;
begin
  Result := fBackupLog;
end;

procedure TLoggerObj.DebugInfo(aMsg: string);
begin
  if fDebugLog = nil then
    exit;
  fDebugLog.Info(aMsg);
end;

procedure TLoggerObj.BackupInfo(aMsg: string);
begin
  if fBackupLog = nil then
    exit;
  fBackupLog.Info(aMsg);
end;

procedure TLoggerObj.Init;
begin

end;

end.
