unit Objekt.Backup;

interface

uses
  SysUtils, Classes, IBX.IBServices, Objekt.Option, Vcl.Forms, Vcl.Controls;

type
  TStartBackupEvent = procedure(Sender: TObject; aOption: TOption) of object;
  TEndBackupEvent = procedure(Sender: TObject; aOption: TOption) of object;
  TBackupErrorEvent = procedure(Sender: TObject; aOption: TOption; aError: string) of object;


type
  TBackup = class
  private
    fBackupFilenameList: TStringList;
    fBackupProtokollPfad: string;
    fOnStartBackup: TStartBackupEvent;
    fOnEndBackup: TEndBackupEvent;
    fOnBackupError: TBackupErrorEvent;
    function getBackupFilename(aValue: string): string;
    function getBackupProtokollFilename(aValue:string): string;
  public
    constructor Create;
    destructor Destroy; override;
    function StartBackup(aOption: TOption): string;
    procedure LeseBackupsInList(aValue: string);
    procedure CheckAndDeleteOldestFile(aValue: string; aMaxAnzahl: Integer);
    property BackupProtokollPfad: string read fBackupProtokollPfad write fBackupProtokollPfad;
    property OnStartBackup: TStartBackupEvent read fOnStartBackup write fOnStartBackup;
    property OnEndBackup: TEndBackupEvent read fOnEndBackup write fOnEndBackup;
    property OnBackupError: TBackupErrorEvent read fOnBackupError write fOnBackupError;
  end;

implementation

{ TBackup }

uses
  Allgemein.System, Objekt.Allgemein;



constructor TBackup.Create;
begin
  fBackupFilenameList := TStringList.Create;
  fBackupFilenameList.Sorted := true;
  fBackupProtokollPfad := '';
end;

destructor TBackup.Destroy;
begin
  FreeAndNil(fBackupFilenameList);
  inherited;
end;


function TBackup.StartBackup(aOption: TOption): string;
var
  s: string[255];
  Backup: TIBBackupService;
  BackupFilename: string;
  BackupProtokollFilename: string;
  BackupProtokoll: TStringList;
  Cur: TCursor;
begin
  Cur := Screen.Cursor;
  Result := '';
  if aOption = nil then
    exit;
  Backup := TIBBackupService.Create(nil);
  try
    BackupFilename := aOption.Backupdatei;
    BackupProtokollFilename :=  getBackupProtokollFilename(BackupFilename);
    DeleteFile(BackupProtokollFilename);

    if (aOption.Zeitstempel)
    or ((aOption.MaxAnzahlBackupDateien) and (aOption.MaxAnzahlBackup > 0)) then
      BackupFilename := getBackupFilename(aOption.Backupdatei);

    if ((aOption.MaxAnzahlBackupDateien) and (aOption.MaxAnzahlBackup > 0)) then
      CheckAndDeleteOldestFile(aOption.Backupdatei, aOption.MaxAnzahlBackup);

    if Trim(BackupFilename) = '' then
    begin
      AllgemeinObj.Log.DebugInfo('Es wird kein Backup durchgeführt, da Backupdateiname leer ist.');
      exit;
    end;

    if FileExists(BackupFilename) then
      AllgemeinObj.Log.DebugInfo('Datei wird gelöscht(2):' + BackupFilename);

    DeleteFile(BackupFilename);

    s := aOption.Servername + ':' + aOption.Datenbank;

    Backup.ServerName := aOption.Servername;
    Backup.DatabaseName := aOption.Datenbank;
    Backup.BackupFile.Text := BackupFilename;
    Backup.LoginPrompt := false;
    Backup.Options := [];
    Backup.Params.Add('password='+aOption.Passwort);
    Backup.Params.Add('user_name='+aOption.User);


    try
      if Assigned(fOnStartBackup) then
        fOnStartBackup(Self, aOption);
      Screen.Cursor := crHourglass;

      Backup.Verbose := true;
      Backup.Active := true;
      Backup.ServiceStart;
      BackupProtokoll := TStringList.Create;
      try
        while not Backup.Eof do
          BackupProtokoll.Add(Backup.GetNextLine);
        BackupProtokoll.SaveToFile(BackupProtokollFilename);
      finally
        FreeAndNil(BackupProtokoll);
      end;

      if Assigned(fOnEndBackup) then
        fOnEndBackup(Self, aOption);

    except
      on E:Exception do
      begin
        Result :=  'Fehler beim Durchführen der Sicherung: ' + E.Message;
        if Assigned(fOnBackupError) then
          fOnBackupError(Self, aOption, E.Message);
      end;
    end;

    Backup.Active := false;

  finally
    FreeAndNil(Backup);
    Screen.Cursor := Cur;
  end;
end;


function TBackup.getBackupFilename(aValue: string): string;
var
  ext: string;
  NewFilename: string;
begin
  ext := ExtractFileExt(aValue);
  NewFilename := copy(aValue, 1, Length(aValue)- Length(ext));
  NewFilename := NewFilename + '_' + FormatDateTime('yyyymmddhhnn', now)+ ext;
  Result := NewFilename;
end;



procedure TBackup.LeseBackupsInList(aValue: string);
var
  i1: Integer;
  ext: string;
  Pfad: string;
  Filename: string;
  RawFilename: string;
  VglFilename: string;
  FilenameList: TStringList;
  DateiDatum: TDateTime;
begin
  fBackupFilenameList.Clear;
  Pfad := ExtractFilePath(aValue);
  Filename := ExtractFileName(aValue);
  ext := ExtractFileExt(Filename);
  if SameText('.fdb', ext) then
    exit; // Nur zur Sicherheit, dass keine Datenbanken gelöscht werden
  RawFilename := copy(Filename, 1, Length(Filename)-Length(ext));
  FilenameList := TStringList.Create;
  try
    GetAllFiles(Pfad, FilenameList, true, false, '*'+ext);
    for i1 := 0 to Filenamelist.Count -1 do
    begin
      VglFilename := ExtractFileName(FilenameList.Strings[i1]);
      VglFilename := copy(VglFilename, 1, Length(RawFilename));
      if SameText(RawFilename, VglFilename) then
      begin
        DateiDatum := getFileAge(FilenameList.Strings[i1]);
        fBackupFilenameList.Add(FormatDateTime('yyyymmddhhnnss', DateiDatum)+'='+FilenameList.Strings[i1]);
      end;
    end;
  finally
    FreeAndNil(FilenameList);
  end;
end;


procedure TBackup.CheckAndDeleteOldestFile(aValue: string; aMaxAnzahl: Integer);
var
  Filename: string;
  ext: string;
begin
  LeseBackupsInList(aValue);
  if (fBackupFilenameList.Count = 0) then
    AllgemeinObj.Log.DebugInfo('Keine älteren Backupdatein zum Löschen gefunden');
//  AllgemeinObj.Log.DebugInfo('Anz der Backupdateien:' + IntToStr(fBackupFilenameList.Count) + ' / ' +
//                             'Anz der max. Backupdateien:' + IntToStr(aMaxAnzahl));
  if (fBackupFilenameList.Count = 0) or (fBackupFilenameList.Count < aMaxAnzahl) then
    exit;
  Filename := fBackupFilenameList.ValueFromIndex[0];
  ext := ExtractFileExt(Filename);
  if SameText('.fdb', ext) then
  begin
    AllgemeinObj.Log.DebugInfo('Eine Backupdatei mit der Erweiterung ".fdb" ist nicht zulässig:'+aValue);
    exit; // Nur zur Sicherheit, dass keine Datenbanken gelöscht werden
  end;
  AllgemeinObj.Log.DebugInfo('Datei wird gelöscht(1):' + Filename);
  DeleteFile(Filename);
end;

function TBackUp.getBackupProtokollFilename(aValue:string): string;
var
  Filename: string;
  RawFilename: string;
  ext: string;
  Path: string;
begin
  Path := ExtractFilePath(aValue);
  if (fBackupProtokollPfad > '') and (DirectoryExists(fBackupProtokollPfad)) then
    Path := fBackupProtokollPfad;
  Filename := ExtractFileName(aValue);
  ext := ExtractFileExt(Filename);
  RawFilename := copy(Filename, 1, Length(Filename)-Length(ext));
  Result := Path + RawFilename + '_BackupProtokoll.txt';
end;


end.
