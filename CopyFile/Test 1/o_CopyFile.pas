unit o_CopyFile;

interface

uses
  System.Classes, System.SysUtils, Winapi.Windows, Winapi.Messages;

type
  TCopyCallBack = function( TotalFileSize, TotalBytesTransferred, StreamSize, StreamBytesTransferred: int64;
                            StreamNumber, CallbackReason: Dword;
                            SourceFile, DestinationFile: THandle; Data: Pointer): DWord;

type
  TCopyFile = class
  private
  public
    fCallBack: TCopyCallBack;
    procedure CopyFile(aSource, aDest: TStrings);
    property CallBack: TCopyCallBack read fCallBack write fCallBack;
  end;

implementation

{ Tfrm_CopyFile }


procedure TCopyFile.CopyFile(aSource, aDest: TStrings);
var
  Cancelled: Boolean;
begin
  Cancelled := false;
  CopyFileEx(PWideChar(aSource), PWideChar(aSource), @fCallBack, nil, @Cancelled, COPY_FILE_FAIL_IF_EXISTS);
end;

end.
