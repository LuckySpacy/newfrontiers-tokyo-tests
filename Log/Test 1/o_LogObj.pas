unit o_LogObj;

interface

uses
  sysutils, classes, System.IOUtils;

type
  TLogObj = class
  private
    fLogPath: string;
    fFilename: string;
    fFullFilename: string;
    fMaxFileSize: Longint;
    fFullBackupFilename: string;
    function getFileSize: Integer;
  public
    constructor Create(aLogPath, aFilename: string; aMaxFileSize: Longint);
    destructor Destroy; override;
    procedure Write(aText: string);
  end;

implementation

{ TLogObj }

constructor TLogObj.Create(aLogPath, aFilename: string; aMaxFileSize: Longint);
begin
  fLogPath  := IncludeTrailingPathDelimiter(aLogPath);
  fFilename := aFilename;
  fFullFilename := fLogPath + fFilename;
  fFullBackupFilename := fLogPath + copy(ffilename, 1, length(ffilename)-4) +  FormatDateTime('yyyy-mm-dd_hhnnss', now) + '.bak';
  fMaxFileSize := aMaxFileSize;

  if getFileSize > fMaxFileSize then
  begin
    TFile.Move(fFullFilename, fFullBackupFilename);
  end;


end;

destructor TLogObj.Destroy;
begin

  inherited;
end;

function TLogObj.getFileSize: Longint;
var
  f: file of Byte;
  size: Longint;
begin
  Result := 0;
  if not FileExists(fFullFilename) then
    exit;
  AssignFile(f, fFullFilename);
  Reset(f);
  try
    Result := FileSize(f);
  finally
    closeFile(f);
  end;
end;

procedure TLogObj.Write(aText: string);
var
  f: Textfile;
  s: string;
begin
  AssignFile(f, fFullFilename);

  if (fileExists(fFullFilename)) then
    Append(f)
  else
    ReWrite(f);

  s := FormatDateTime('dd.mm.yyyy hh:nn:ss', now) + ' ' + aText;
  writeln(f, s);
  closefile(f);
end;

end.
