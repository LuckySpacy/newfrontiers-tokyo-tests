unit Objekt.SepaModul;

interface

uses
  SysUtils, Classes, IBX.IBDatabase, IBX.IBQuery, Objekt.SepaBSHeaderList,
  o_Sepa_Log, o_nf;


type
  TSepaModul = class
  private
    fTrans: TIBTransaction;
    fLog : TSepa_Log;
    fAusgabepfad: string;
    fSicherungspfad: string;
    fBS: TSepaBSHeaderList;
    fAuftraggeber: string;
    function GetLogFileName: string;
    function GetSpecialFolder(const AFolder: Integer): string;
  public
    constructor Create;
    destructor Destroy; override;
    property Ausgabepfad: string read fAusgabepfad write fAusgabepfad;
    property Auftraggeber: string read fAuftraggeber write fAuftraggeber;
    property Sicherungspfad:string read fSicherungspfad write fSicherungspfad;
    property Trans: TIBTransaction read fTrans write fTrans;
    procedure VerarbeiteSepaUeberweisungen;
  end;

implementation

{ TSepaModul }

uses
  Winapi.SHFolder, Vcl.Forms, Objekt.SepaModulGutschrift;


constructor TSepaModul.Create;
begin
  fAusgabepfad := '';
  fSicherungspfad := '';
  fTrans := nil;
  fBS := nil;
  fLog := TSepa_Log.Create;
end;

destructor TSepaModul.Destroy;
begin
  FreeAndNil(fLog);
  inherited;
end;


function TSepaModul.GetLogFileName: string;
var
  Path: string;
  Filename: string;
begin
  Path := fAusgabepfad;
//  if not DirectoryExists(Path) then
  if Tnf.GetInstance.System.DirExist(Path) < 0 then
  begin
    Path := GetSpecialFolder(CSIDL_APPDATA) + '\Optima\';
//    if not DirectoryExists(Path) then
    if (Path <> '') and (Tnf.GetInstance.System.DirExist(Path) < 0) then
      ForceDirectories(Path);
  end;

  if fAuftraggeber = '' then
    Filename := 'SEPA_' + FormatDateTime('yyyymmdd', now) + '.log'
  else
    Filename := 'SEPA_' + fAuftraggeber + '_' + FormatDateTime('yyyymmdd', now) + '.log';

  Path := IncludeTrailingBackslash(Path) + 'Logs\';
  if not DirectoryExists(Path) then
    ForceDirectories(Path);

  Result := Path + Filename;

end;

function TSepaModul.GetSpecialFolder(const AFolder: Integer): string;
var
   path: string;
begin
   SetLength(path, 250);
   SHGetFolderPath(Application.Handle, AFolder, 0, 0, PChar(path));
   result := PChar(path);
end;

procedure TSepaModul.VerarbeiteSepaUeberweisungen;
var
  SepaGutschrift: TSepaModulGutschrift;
begin
  fLog.Filename := GetLogFileName;
  SepaGutschrift := TSepaModulGutschrift.Create;
  try
    SepaGutschrift.Ausgabepfad := fAusgabepfad;
    SepaGutschrift.Sicherungspfad := fSicherungspfad;
    SepaGutschrift.Trans := fTrans;
    SepaGutschrift.LadeAlleGutschriften;
    SepaGutschrift.SchreibeAlleGutschriften;
  finally
    FreeAndNil(SepaGutschrift);
  end;

end;

end.
