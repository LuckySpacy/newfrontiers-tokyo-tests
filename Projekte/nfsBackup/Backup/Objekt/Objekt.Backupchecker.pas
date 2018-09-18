unit Objekt.Backupchecker;

interface

uses
  SysUtils, Classes, Objekt.Option, Objekt.OptionList, Vcl.ExtCtrls,
  Objekt.DateTime, Vcl.Controls, Vcl.Forms;


type
  TStartBackupEvent = procedure(Sender: TObject; aOption: TOption) of object;
  TEndBackupEvent = procedure(Sender: TObject; aOption: TOption) of object;
  TBackupErrorEvent = procedure(Sender: TObject; aOption: TOption; aError: string) of object;


type
  TBackupchecker = class
  private
    fOptionList: TOptionList;
    fDataPfad: string;
    fCheckTimer: TTimer;
    fFullDataFilename: string;
    fDateTime: TTbDateTime;
    fTimerEnabled: Boolean;
    fAktualData: Boolean;
    fOnStartBackup: TStartBackupEvent;
    fOnEndBackup: TEndBackupEvent;
    fOnBackupError: TBackupErrorEvent;
    procedure Check(Sender: TObject);
    procedure setFullDataFilename(const Value: string);
    function getStartZeit(aStartTime: TDateTime): TDateTime;
    procedure setTimerEnabled(const Value: Boolean);
    procedure ErrorBackup(Sender: TObject; aOption: TOption; aError: string);
  public
    constructor Create;
    destructor Destroy; override;
    property FullDataFilename: string read fFullDataFilename write setFullDataFilename;
    property TimerEnabled: Boolean read fTimerEnabled write setTimerEnabled;
    property AktualData: Boolean read fAktualData write fAktualData;
    property OnStartBackup: TStartBackupEvent read fOnStartBackup write fOnStartBackup;
    property OnEndBackup: TEndBackupEvent read fOnEndBackup write fOnEndBackup;
    property OnBackupError: TBackupErrorEvent read fOnBackupError write fOnBackupError;
  end;

implementation

{ TBackupchecker }

uses
  Objekt.Backup, Objekt.Allgemein;


constructor TBackupchecker.Create;
begin
  fOptionList := TOptionList.Create;
  fDataPfad := '';
  fTimerEnabled := false;
  fCheckTimer := TTimer.Create(nil);
  //fCheckTimer.Interval := 600000; // Alle 10 Minuten
  //fCheckTimer.Interval := 1000; //
  AllgemeinObj.Log.DebugInfo('Inifile=' + AllgemeinObj.Ini.IniFilename);
  fCheckTimer.Interval := AllgemeinObj.Ini.CheckInterval;
  fCheckTimer.Enabled := fTimerEnabled;
  fCheckTimer.OnTimer := Check;
  fDateTime := TTbDateTime.Create(nil);
  fAktualData := false;
  AllgemeinObj.Log.DebugInfo('TimerInterval=' + IntToStr(fCheckTimer.Interval));
end;

destructor TBackupchecker.Destroy;
begin
  FreeAndNil(fCheckTimer);
  FreeAndNil(fOptionList);
  FreeAndNil(fDateTime);
  inherited;
end;





procedure TBackupchecker.setFullDataFilename(const Value: string);
begin
  fFullDataFilename := '';
  if not FileExists(Value) then
  begin
    AllgemeinObj.Log.BackupInfo('Backupdatei exisitiert nicht: ' + Value);
    exit;
  end;
  fDataPfad := ExtractFilePath(Value);
  fFullDataFilename := Value;
  fOptionList.LoadFromFile(fFullDataFilename);
  fAktualData := false;
end;

procedure TBackupchecker.setTimerEnabled(const Value: Boolean);
begin
  fTimerEnabled := Value;
  fCheckTimer.Enabled := fTimerEnabled;
end;


procedure TBackupchecker.Check(Sender: TObject);
var
  i1: Integer;
  Option: TOption;
  Startzeit : TDateTime;
  Backup: TBackup;
  //s: string;
  Cur: TCursor;
begin
  if fDataPfad = '' then
    exit;

  if fAktualData then
  begin
    fOptionList.LoadFromFile(fFullDataFilename);
    fAktualData := false;
  end;

  if fOptionList.Count <= 0 then
  begin
    AllgemeinObj.Log.BackupInfo('OptionListCount=' + IntToStr(fOptionList.Count) + ' / Keine Backupinfo vorhanden.');
    exit;
  end;
  Cur := Screen.Cursor;
  try
    fCheckTimer.Enabled := false;
    for i1 := 0 to fOptionList.Count -1 do
    begin
      Option := fOptionList.Item[i1];
      //s := Option.Datenbank + ' / ' + Option.Backupdatei + ' / ' + 'Start:' + FormatDateTime('hh:nn', Option.StartZeit) + ' / ' +
      //     'Letztes Backup:' + FormatDateTime('dd.mm.yyyy', Option.LastBackupDate);
      //AllgemeinObj.Log.BackupInfo(s);
       //AllgemeinObj.Log.DebugInfo('LastBackup ' + FormatDateTime('dd.mm.yyyy hh:nn', Option.LastBackupDate));
      if Option.LastBackupDate >= trunc(now) then
        continue;
      Startzeit := getStartZeit(Option.StartZeit);
      //AllgemeinObj.Log.DebugInfo('Startzeit ' + FormatDateTime('dd.mm.yyyy hh:nn', Option.Startzeit));
      if now < Startzeit then
        continue;
      Backup := TBackup.Create;
      try
        if Assigned(fOnStartBackup) then
          fOnStartBackup(Self, Option);
        Screen.Cursor := crHourglass;
        Backup.BackupProtokollPfad := AllgemeinObj.Log.LogPath;
        Backup.OnBackupError := ErrorBackup;
        AllgemeinObj.Log.BackupInfo('Starte Backup - ' + Option.Datenbank);
        Backup.StartBackup(Option);
        Option.LastBackupDate := trunc(now);
        AllgemeinObj.Log.BackupInfo('Ende Backup');
      finally
        FreeAndNil(Backup);
        if Assigned(fOnEndBackup) then
          fOnEndBackup(Self, Option);
      end;
    end;
  finally
    Screen.Cursor := Cur;
    fCheckTimer.Enabled := true;
  end;
end;

procedure TBackupchecker.ErrorBackup(Sender: TObject; aOption: TOption;
  aError: string);
begin
  aOption.StatusMeldung := 'Backup Error';
  AllgemeinObj.Log.BackupInfo(aError);
  AllgemeinObj.Log.DebugInfo(aError);
  if Assigned(fOnBackupError) then
    fOnBackupError(Self, aOption, aError);
end;



function TBackupChecker.getStartZeit(aStartTime: TDateTime): TDateTime;
begin
  Result := fDateTime.SetTimeToDate(now, aStartTime);
end;

end.
