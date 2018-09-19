unit Allgemein.SysFolderlocation;

interface

uses
  Windows,
  SysUtils,
  shlobj,
  ActiveX;

type
  TSysFolderLocation = class(TObject)
  private
    _CSIDL: Integer;
    function PathFromIDList(Pidl: PItemIdList): WideString;
  public
    property CSIDL: Integer read _CSIDL write _CSIDL;
    constructor Create(CSIDL: Integer);
    function GetShellFolder: WideString;
    class function GetFolder(aCSIDL: Integer): string;
  end;

implementation

{ SysFolderLocation }

function SHGetFolderLocation(hwndOwnder: THandle; nFolder: Integer; hToken: THandle; dwReserved: DWORD; ppidl:
  PItemIdList): HRESULT; stdcall; external 'shell32.dll' name 'SHGetFolderLocation';
function SHGetPathFromIDListW(Pidl: PItemIDList; pszPath: PWideChar): BOOL; stdcall; external 'shell32.dll' name 'SHGetPathFromIDListW';

resourcestring
  rsE_GetPathFromIDList = 'Ordner kann nicht ermittelt werden';
  rsE_S_FALSE = 'Ordner existiert nicht';
  rsE_InvalidArgument = 'Argument ungültig';

constructor TSysFolderLocation.Create(CSIDL: Integer);
begin
  _CSIDL := CSIDL;
end;

class function TSysFolderLocation.GetFolder(aCSIDL: Integer): string;
var
  Folder : TSysFolderLocation;
begin
  Folder := TSysFolderLocation.Create(aCSIDL);
  try
    try
      Result := Folder.GetShellFolder;
    except
      Result := 'Invalid';
      raise;
    end;
  finally
    FreeAndNil(Folder);
  end;
end;

function TSysFolderLocation.GetShellFolder: WideString;
var
  ppidl: PItemIdList;
begin
  try
    case SHGetFolderLocation(0, _CSIDL, 0, 0, @ppidl) of
      S_OK: Result := trim(PathFromIDList(ppidl));
      S_FALSE: raise Exception.Create(rsE_S_FALSE);
      E_INVALIDARG: raise Exception.Create(rsE_InvalidArgument);
    end;
  finally
    CoTaskMemFree(ppidl);
  end;
end;

function TSysFolderLocation.PathFromIDList(Pidl: PItemIdList): WideString;
const
  NTFS_MAX_PATH = 32767;
var
  Path: PWideChar;
begin
  GetMem(Path, (NTFS_MAX_PATH + 1) * 2);
  try
    if not SHGetPathFromIDListW(Pidl, Path) then
    begin
      FreeMem(Path);
      raise Exception.Create(rsE_GetPathFromIDList);
    end;
    Result := WideString(Path);
  finally
    FreeMem(Path);
  end;
end;

end.
