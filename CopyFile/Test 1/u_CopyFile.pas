unit u_CopyFile;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, o_CopyFile;


type
  TCopyCallBack = function( TotalFileSize, TotalBytesTransferred, StreamSize, StreamBytesTransferred: int64;
                            StreamNumber, CallbackReason: Dword;
                            SourceFile, DestinationFile: THandle; Data: Pointer): DWord;

type
  Tfrm_CopyFile = class(TForm)
    pg: TProgressBar;
  private
   // function CallBack1(TotalFileSize, TotalBytesTransferred, StreamSize, StreamBytesTransferred: int64; StreamNumber, CallbackReason: Dword; SourceFile, DestinationFile: THandle; Data: Pointer): DWord;
  public
    procedure CopyFile(aSource, aDest: String);
  end;

var
  frm_CopyFile: Tfrm_CopyFile;

implementation

{$R *.dfm}

{ Tfrm_CopyFile }

function CallBack1(TotalFileSize, TotalBytesTransferred, StreamSize, StreamBytesTransferred: int64; StreamNumber, CallbackReason: Dword; SourceFile, DestinationFile: THandle; Data: Pointer): DWord;
begin
  {
  if CopyStream <> StreamNumber then
  begin
    inc(CopyCount);
    CopyStream :=  StreamNumber;
  end;
  }
  //Caption := IntToStr(StreamBytesTransferred);
  Result := PROGRESS_CONTINUE;
  //Form1.lblCount.Caption := 'Copied' + IntToStr(CopyCount);
  application.ProcessMessages;
end;




{ Tfrm_CopyFile }

{
procedure Tfrm_CopyFile.CopyFile(aSource, aDest: TStrings);
var
  CopyFileObj: TCopyFile;
begin
  CopyFileObj := TCopyFile.Create;
  CopyFileObj.CallBack := CallBack1;
  CopyFileObj.CopyFile(aSource, aDest);
  FreeAndNil(CopyFileObj);
end;
}

function GetFileSize(const aFileName: string): Int64;
var
  FileStream: TFileStream;
begin
  Result := 0;
  if not FileExists(aFileName) then
    exit;
  FileStream := TFileStream.Create(aFileName, fmOpenRead or fmShareDenyNone);
  try
    try
      Result := FileStream.Size;
    except
      Result := 0;
    end;
  finally
    FileStream.Free;
  end;
end;


procedure CopyFileWithProgress(const AFrom, ATo: String; var AProgress: TProgressBar);
var
  FromF, ToF: file;
  NumRead, NumWritten, DataSize: Integer;
  Buf: array[1..2048] of Char;
begin
  try
    AProgress.Position := 0;
    AProgress.Max := GetFileSize(aFrom);
    DataSize := SizeOf(Buf);
    AssignFile(FromF, AFrom);
    Reset(FromF, 1);
    AssignFile(ToF, ATo);
    Rewrite(ToF, 1);
    repeat
    BlockRead(FromF, Buf, DataSize, NumRead);
    BlockWrite(ToF, Buf, NumRead, NumWritten);
    if Assigned(AProgress) then
    begin
      AProgress.Position := AProgress.Position + DataSize;
      Application.ProcessMessages;
    end;
    until (NumRead = 0) or (NumWritten <> NumRead);
  finally
    CloseFile(FromF);
    CloseFile(ToF);
  end;
end;



procedure Tfrm_CopyFile.CopyFile(aSource, aDest: String);
begin
  CopyFileWithProgress(aSource, aDest, pg);
end;


end.
