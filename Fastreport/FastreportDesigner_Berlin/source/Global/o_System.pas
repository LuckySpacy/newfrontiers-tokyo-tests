unit o_System;

interface

{$WARN SYMBOL_PLATFORM OFF}
{$WARN UNIT_PLATFORM OFF}

uses
  Windows, SysUtils, Classes, FileCtrl, Dialogs, ShellApi, Forms, ClipBrd;


// In dieser Unit befinden sich Befehle, Rund um das Betriebssystem.
// Dazu gehören, Lesen der Festplatte, SystemDirectory's, Ausgabe von Dateiinformationen usw.

// Das Präfix nf_ steht für new|frontiers und beinhaltet, dass es sich hierbei
// um eine Globale new|frontiers Funktion handelt.

// Wichtig: Diese Funktionen sind alle Projektunabhängig.
//          Hier sollten keine projektspezifische Funktionen geschrieben werden.
//          In Optima gibt es dafür die Unit f_Optima.
//          Es sollten nur Delphi-Standard Units eingebunden werden.


type
  Tnf_System = class
  public
    class function  Directory(aPath: String; const aSearchRec: TSearchRec): Boolean;
    class procedure GetSubDirectory(aPath: String; aStrings: TStrings;const All: Boolean = true);
    class procedure GetAllFiles(aPath: String; aStrings: TStrings;
                      const WithPathName: Boolean; const All: Boolean = true; const Mask: String = '*.*');
    class function GetFileNameWithoutExt(const aFileName: string): string;
    class function ChangeFileName(const aOldFileName, aNewFileName: string): string;
    class function AppendFileName(const aFilename, aAppendName: string): string;
    class function GetTempFullFilename: string;
    class function GetNetworkPath(const aDriveChar: Char): string;
    class function ConnectDrive(_drvLetter: string; _netPath: string;
                                _showError: Boolean; _reconnect: Boolean): DWORD;
    class function GetTempPath: String;
    class function DoNetworkConnection(aDrive: Char; aShowError: Boolean): Boolean;
    class function FileExist(aFilename: string): Integer;
    class function DirExist(aPath: string): Integer;
    class function GetShellFolder(aCSIDL: Integer): string;
  end;



implementation

uses
  o_sysfolderlocation;


class function Tnf_System.Directory(aPath: String; const aSearchRec: TSearchRec): Boolean;
begin
  Result := false;
  if (aSearchRec.Attr = faArchive)
  or (aSearchRec.Attr < 16) then
    exit;

  if (aSearchRec.Name = '.')
  or (aSearchRec.Name = '..') then
    exit;
  aPath := IncludeTrailingBackslash(aPath) + aSearchRec.Name;
  Result := DirectoryExists(aPath);
end;


class function Tnf_System.GetShellFolder(aCSIDL: Integer): string;
var
  ShellFolder: TSysFolderLocation;
begin
  ShellFolder := TSysFolderLocation.Create(aCSIDL);
  try
    Result := ShellFolder.GetShellFolder;
  finally
    FreeAndNil(ShellFolder);
  end;
end;

class procedure Tnf_System.GetSubDirectory(aPath: String; aStrings: TStrings;const All: Boolean = true);
var
  Search: TSearchRec;
  sList1: TStringList;
  sList2: TStringList;
  i1    : Integer;
begin
  aStrings.Clear;
  aPath := Trim(aPath);
  aPath := IncludeTrailingBackslash(aPath);

  FindFirst(aPath + '*.*', faAnyFile, Search);
  repeat
    if Tnf_System.Directory(aPath, Search) then
      aStrings.Add(Lowercase(aPath + Search.Name));
  until FindNext(Search) <> 0;

  if not All then
    exit;

  sList1 := TStringList.Create;
  sList2 := TStringList.Create;
  try
    sList1.Clear;
    sList1.Assign(aStrings);
    while sList1.Count > 0 do
    begin
      sList2.Clear;
      for i1 := 0 to sList1.Count -1 do
      begin
        aPath := IncludeTrailingBackslash(sList1.Strings[i1]);
        FindFirst(aPath + '*.*', faAnyFile, Search);
        repeat
          if Tnf_System.Directory(aPath, Search) then
            sList2.Add(Lowercase(aPath + Search.Name));
        until FindNext(Search) <> 0;
      end;
      sList1.Assign(sList2);
      for i1 := 0 to sList2.Count -1 do
        aStrings.Add(sList2.Strings[i1]);
    end;
    sList1.Assign(aStrings);
    sList1.Sort;
    aStrings.Assign(sList1);
    FindClose(Search);
  finally
    FreeAndNil(sList1);
    FreeAndNil(sList2);
  end;

end;


// Liest alle Dateien im angegebenem Pfad (aPath) in eine StringList.
// WithPathName = true = Der Pfadname wird mit in die Stringliste geschrieben
// All = true = Es wird auch in Unterverzeichnisse gesucht
// Mask = Filtereinstellung für die Dateien, die Eingelesen werden sollen.
class procedure Tnf_System.GetAllFiles(aPath: String; aStrings: TStrings;
  const WithPathName: Boolean; const All: Boolean = true; const Mask: String = '*.*');
var
  Search: TSearchRec;
  i1    : Integer;
  sList : TStringList;
begin
  sList := TStringList.Create;
  try
    aStrings.Clear;
    try
      if All then
        Tnf_System.GetSubDirectory(aPath, sList);
      aPath := Trim(aPath);
      aPath := IncludeTrailingBackslash(aPath);
      FindFirst(aPath + Mask, faAnyFile, Search);
      repeat
        Application.ProcessMessages;
        if not Tnf_System.Directory(aPath, Search) then
        begin
          if  (Search.Name <> '.') and (Search.Name <> '..')
          and (Search.Name > '') then
          begin
            if WithPathName then
              aStrings.Add(Lowercase(aPath + Search.Name))
            else
              aStrings.Add(Lowercase(Search.Name));
          end;
        end;
        if Trim(Search.Name) = '' then
          break; // Dieser Break ist wichtig, da unter WINNT beim nächsten FindNext ein Fehler auftritt (tb 05.03.2008)
      until FindNext(Search) <> 0;
      FindClose(Search);
      if not All then
      begin
        sList.Assign(aStrings);
        sList.Sort;
        aStrings.Assign(sList);
        exit;
      end;
      for i1 := 0 to sList.Count -1 do
      begin
        Application.ProcessMessages;
        aPath := Trim(sList.Strings[i1]);
        aPath := IncludeTrailingBackslash(aPath);
        FindFirst(aPath + Mask, faAnyFile, Search);
        repeat
          if not Tnf_System.Directory(aPath, Search) then
          begin
            if  (Search.Name <> '.') and (Search.Name <> '..')
            and (Search.Name > '') then
            begin
              if WithPathName then
                aStrings.Add(Lowercase(aPath + Search.Name))
              else
                aStrings.Add(Lowercase(Search.Name));
            end;
          end;
          if Trim(Search.Name) = '' then
            break; // Dieser Break ist wichtig, da unter WINNT beim nächsten FindNext ein Fehler auftritt (tb 05.03.2008)
        until FindNext(Search) <> 0;
        FindClose(Search);
      end;
      sList.Assign(aStrings);
      sList.Sort;
      aStrings.Assign(sList);
    except
      on E: Exception do
      begin
        MessageDlg('Error in (sySystem.pas) procedure syGetAllFiles(aPath: String; aStrings: TStrings;',
          mtError, [mbOk], 0);
        MessageDlg(E.Message, mtError, [mbOk], 0);
        raise;
      end;
    end;
  finally
    FreeAndNil(sList);
    FindClose(Search);
  end;
end;

// Die Dateiendung aus dem Filenamen entfernen
class function Tnf_System.GetFileNameWithoutExt(const aFileName: string): string;
var
  ext: string;
begin
  ext := ExtractFileExt(aFilename);
  Result := copy(aFileName, 1, Length(aFileName) - Length(ext));
end;



// Den Filenamen ändern, ohne die Dateiendung zu verändern.
// aOldFileName kann den Pfad beinhalten, muss aber nicht.
class function Tnf_System.ChangeFileName(const aOldFileName, aNewFileName: string): string;
var
  Path: string;
  Ext : string;
begin
  Path := Trim(ExtractFilePath(aOldFileName));
  Ext  := ExtractFileExt(aOldFileName);
  Result := Path + aNewFileName + Ext;
end;


// Hängt an einem bestehenden Filename (aFilename) etwas hinten dran.
class function Tnf_System.AppendFileName(const aFilename,
  aAppendName: string): string;
var
  Path    : string;
  Ext     : string;
  FileName: string;
begin
  Path     := Trim(ExtractFilePath(aFilename));
  Ext      := ExtractFileExt(aFilename);
  FileName := ExtractFileName(aFileName);
  FileName := GetFileNameWithoutExt(FileName);
  Result   := Path + Filename + aAppendName + Ext;
end;


class function Tnf_System.GetTempPath: String;
var
  s  : string;
  Len: Integer;
begin
  Len := Windows.GetTempPath(0, nil);
  if Len > 0 then
  begin
    SetLength(S, Len);
    Len := Windows.GetTempPath(Len, PChar(S));
    SetLength(S, Len);
    Result := s;
  end
  else
    Result := '';
end;


// Zurückgeliefert wird einen temporären Dateiname + temporäres Verzeichnis
class function Tnf_System.GetTempFullFilename: string;
var
  buffer: array[0..MAX_PATH] of Char;
  s: string;
begin
  Result := '';
  s := GetTempPath;
  if s = '' then
    exit;
  GetTempFileName(PWideChar(s), '~', 0, buffer);
  //GetTempFileName(PWideChar(GetTempPath), '~', 0, buffer);
  Result := string(buffer);
end;



// Diese Funktion liefert anhand des Netzwerkbuchstabens den damit verbundenen
// Netzwerkpfad
class function Tnf_System.GetNetworkPath(const aDriveChar: Char): string;
const
  MaxVolSize = 260;
var
  Path : array [0..3] of Char;
  NU, VolSize : DWord;
  Vol : PChar;
  Error: DWord;
begin
  Path[0] := aDriveChar;
  Path[1] := ':';
  Path[2] := #0;
  VolSize := MaxVolSize;
  GetMem(Vol, MaxVolSize);
  Vol[0] := #0;
  Result := '';
  try
    Error := WNetGetConnection(Path, Vol, VolSize);
    if (Error = WN_SUCCESS) or (Error = 1201) then
      Result := StrPas(Vol)
    else
    begin
      if GetVolumeInformation(PChar(aDriveChar + ':\'),
        Vol, MAX_PATH, nil, NU, NU, nil, 0) then
        Result := Vol;
      Result := Format('[%s]',[Result]);
    end;
  finally
    FreeMem(Vol, MaxVolSize);
  end;
end;

// Diese Funktion verbindet sich mit dem angegebenen Laufwerksbuchstabe an das Netzwerk.
// Vorsicht: Hier wird keine neue Verbindung hergestellt, sondern eine bereits bestehende
//           wieder neu verbunden.
class function Tnf_System.ConnectDrive(_drvLetter, _netPath: string; _showError,
  _reconnect: Boolean): DWORD;
var
  nRes: TNetResource;
  errCode: DWORD;
  dwFlags: DWORD;
begin
  { NetRessource mit #0 füllen => Keine unitialisierte Werte }
  FillChar(NRes, SizeOf(NRes), #0);
  nRes.dwType := RESOURCETYPE_DISK;
  { Laufwerkbuchstabe und Netzwerkpfad setzen }
  nRes.lpLocalName  := PChar(_drvLetter);
  nRes.lpRemoteName := PChar(_netPath); { Beispiel: \\Test\C }
  { Überprüfung, ob gespeichert werden soll }
  if _reconnect then
    dwFlags := CONNECT_UPDATE_PROFILE and CONNECT_INTERACTIVE
  else
    dwFlags := CONNECT_INTERACTIVE;

  //errCode := WNetAddConnection3(Form1.Handle, nRes, nil, nil, dwFlags);
  errCode := WNetAddConnection3(0, nRes, nil, nil, dwFlags);
  { Fehlernachricht aneigen }
  if (errCode <> NO_ERROR) and (_showError) then
  begin
    Application.MessageBox(PChar('An error occured while connecting:' + #13#10 +
      SysErrorMessage(GetLastError)),
      'Error while connecting!',
      MB_OK);
  end;
  Result := errCode; { NO_ERROR }
end;

//Verbinde einen bestehenden Laufwerksbuchstaben mit dem Netzwerk.
class function Tnf_System.DoNetworkConnection(aDrive: Char; aShowError: Boolean): Boolean;
var
  NetworkPath: string;
  Error: Integer;
begin
  Result := false;
  try
    Networkpath := GetNetworkPath(aDrive);
    Error       := ConnectDrive(aDrive + ':', Networkpath, aShowError, true);
    Result      := Error = 0;
  except
    on E: Exception do
    begin
      if aShowError then
        MessageDlg(E.Message, mtError, [mbOk], 0);
    end;
  end;
end;


//Überprüft, ob eine Datei vorhanden ist.
//Falls diese Datei nicht gefunden wird, wird versucht eine Verbindung zum Netzwerk
//aufzubauen und danach wird nochmals überprüft, ob die Datei vorhanden ist.
class function Tnf_System.FileExist(aFilename: string): Integer;
begin
  // Result = 0  / Datei existiert.
  // Result = -1 / Datei existiert nicht
  // Result = -2 / Netzwerkverbindung konnte nicht hergestellt werden.
  try
    Result := 0;
    if not FileExists(aFilename) then
    begin
      if not DoNetworkConnection(aFilename[1], false) then
        Result := -2;
      if not FileExists(aFilename) then
      begin
        if Result <> -2 then
          Result := -1;
      end;
    end;
  except
    Result := -3;
  end;
end;


class function Tnf_System.DirExist(aPath: string): Integer;
begin
  // Result = 0  / Pfad existiert.
  // Result = -1 / Pfad existiert nicht
  // Result = -2 / Netzwerkverbindung konnte nicht hergestellt werden.
  try
    Result := 0;
    if not DirectoryExists(aPath) then
    begin
      if not DoNetworkConnection(aPath[1], false) then
        Result := -2;
      if not DirectoryExists(aPath) then
      begin
        if Result <> -2 then
          Result := -1;
      end;
    end;
  except
    Result := -3;
  end;
end;


end.
