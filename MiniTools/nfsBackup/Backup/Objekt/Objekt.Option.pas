unit Objekt.Option;

interface

uses
  SysUtils, Classes;


type
  TOption = class
  private
    fPasswort: string;
    fConvert: Boolean;
    fOldMetadata: Boolean;
    fStartZeit: TDateTime;
    fZeitstempel: Boolean;
    fBackupdatei: string;
    fLimbo: Boolean;
    fOnlyMeta: Boolean;
    fDatenbank: string;
    fChecksum: Boolean;
    fUser: string;
    fNoGarbage: Boolean;
    fNonTransportable: Boolean;
    fId: Integer;
    fServername: string;
    fMaxAnzBackupDateien: Boolean;
    fMaxAnzBackup: Integer;
    fLastBackupDate: TDateTime;
    fStatusMeldung: String;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Init;
    property Servername: string read fServername write fServername;
    property Datenbank: string read fDatenbank write fDatenbank;
    property Backupdatei: string read fBackupdatei write fBackupdatei;
    property StartZeit: TDateTime read fStartZeit write fStartZeit;
    property User: string read fUser write fUser;
    property Passwort: string read fPasswort write fPasswort;
    property Checksum: Boolean read fChecksum write fChecksum;
    property Limbo: Boolean read fLimbo write fLimbo;
    property OnlyMeta: Boolean read fOnlyMeta write fOnlyMeta;
    property NoGarbage: Boolean read fNoGarbage write fNoGarbage;
    property OldMetadata: Boolean read fOldMetadata write fOldMetadata;
    property Convert: Boolean read fConvert write fConvert;
    property Zeitstempel: Boolean read fZeitstempel write fZeitstempel;
    property NonTransportable: Boolean read fNonTransportable write fNonTransportable;
    property MaxAnzahlBackupDateien: Boolean read fMaxAnzBackupDateien write fMaxAnzBackupDateien;
    property MaxAnzahlBackup: Integer read fMaxAnzBackup write fMaxAnzBackup;
    property Id: Integer read fId write fId;
    property LastBackupDate: TDateTime read fLastBackupDate write fLastBackupDate;
    property StatusMeldung: String read fStatusMeldung write fStatusMeldung;
    function getCSVLine: string;
    procedure setCSVLine(aValue: string);
    function BToStr(aValue: Boolean): string;
  end;

implementation

{ TOption }

uses
  System.Hash, DateUtils;


constructor TOption.Create;
begin
  Init;
end;

destructor TOption.Destroy;
begin

  inherited;
end;


procedure TOption.Init;
begin
  fServername  := '';
  fPasswort    := '';
  fConvert     := false;
  fOldMetadata := false;
  fStartZeit   := 0;
  fZeitstempel := false;
  fBackupdatei := '';
  fLimbo       := false;
  fOnlyMeta    := false;
  fDatenbank   := '';
  fChecksum    := false;
  fUser        := '';
  fNoGarbage   := false;
  fNonTransportable := false;
  fMaxAnzBackupDateien := false;
  fMaxAnzBackup := 0;
  fLastBackupDate := IncDay(trunc(now), -1);
  fId := 0;
  fStatusMeldung := 'Wartet';
end;

procedure TOption.setCSVLine(aValue: string);
var
  Liste: TStringList;
  i1: Integer;
begin
  Init;
  Liste := TStringList.Create;
  Liste.Delimiter := ';';
  Liste.StrictDelimiter := true;
  Liste.DelimitedText := aValue;
  if Liste.Count < 16 then
    exit;

  fServername  := Liste.Strings[0];
  fDatenbank   := Trim(Liste.Strings[1]);
  fBackupDatei := Liste.Strings[2];
  fUser        := Liste.Strings[3];
  fPasswort    := Liste.Strings[4];
  if not TryStrToDateTime(Liste.Strings[5], fStartZeit) then
    fStartZeit := 0;
  fConvert     := Liste.Strings[6] = '1';
  fOldMetadata := Liste.Strings[7] = '1';
  fZeitstempel := Liste.Strings[8] = '1';
  fLimbo       := Liste.Strings[9] = '1';
  fOnlyMeta    := Liste.Strings[10] = '1';
  fCheckSum    := Liste.Strings[11] = '1';
  fNoGarbage   := Liste.Strings[12] = '1';
  fNonTransportable := Liste.Strings[13] = '1';
  fMaxAnzBackupDateien := Liste.Strings[14] = '1';

  if not TryStrToInt(Liste.Strings[15], i1) then
  begin
    if fMaxAnzBackupDateien then
      fMaxAnzBackup := 1
    else
      fMaxAnzBackup := 0;
  end
  else
    fMaxAnzBackup := i1;


end;

function TOption.getCSVLine: string;
begin
  Result := fServername + ';' + fDatenbank + ';' + fBackupDatei + ';' + fUser + ';' + fPasswort + ';'
            + FormatDateTime('dd.mm.yyyy hh:nn:ss', fStartZeit) + ';'
            + BToStr(fConvert) + ';' + BToStr(fOldMetadata) + ';'
            + BToStr(fZeitstempel) + ';' + BToStr(fLimbo) + ';'
            + BToStr(fOnlyMeta) + ';' + BToStr(fCheckSum) + ';'
            + BToStr(fNoGarbage) + ';' + BToStr(fNonTransportable)+ ';'
            + BToStr(fMaxAnzBackupDateien) + ';' + IntToStr(fMaxAnzBackup);
end;


function TOption.BToStr(aValue: Boolean): string;
begin
  if aValue then
    Result := '1'
  else
    Result := '0';
end;



end.
