unit Objekt.Dateikopieren;

interface

uses
  System.SysUtils, System.Classes;

type
  TDateiKopierenProgressEvent = procedure(aFileSize, aBytesTransferred: Int64) of object;
  TDateiKopierenFileSizeEvent = procedure(aFileSize: Int64) of object;


type
  TDateiKopieren = class
  private
    fOnProgress: TDateiKopierenProgressEvent;
    fCancel: Boolean;
    fOnFileSize: TDateiKopierenFileSizeEvent;
    fOnAfterCopy: TNotifyEvent;
  public
    procedure CopyFile(aSource, aDest: String);
    property OnProgress: TDateiKopierenProgressEvent read fOnProgress write fOnProgress;
    property OnFileSize: TDateiKopierenFileSizeEvent read fOnFileSize write fOnFileSize;
    property OnAfterCopy: TNotifyEvent read fOnAfterCopy write fOnAfterCopy;
    property Cancel: Boolean read fCancel write fCancel;
    constructor Create;
  end;

implementation

{ TDateiKopieren }

constructor TDateiKopieren.Create;
begin
  fCancel := false;
end;


function GetFileSize(const FileName: string): Int64;
var
  FileStream: TFileStream;
begin
  FileStream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyNone);
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

procedure TDateiKopieren.CopyFile(aSource, aDest: String);
var
  FromF, ToF: file;
  NumRead, NumWritten, DataSize: Integer;
  Buf: array[1..2048] of Char;
  FileSize: Int64;
  BytesTransferred: Int64;
begin
  Filesize := GetFileSize(aSource);
  if Assigned(fOnFileSize) then
    fOnFileSize(FileSize);
  BytesTransferred := 0;
  try
    DataSize := SizeOf(Buf);
    AssignFile(FromF, aSource);
    Reset(FromF, 1);
    AssignFile(ToF, aDest);
    Rewrite(ToF, 1);
    repeat
    BlockRead(FromF, Buf, DataSize, NumRead);
    BlockWrite(ToF, Buf, NumRead, NumWritten);
    if Assigned(fOnProgress) then
    begin
      BytesTransferred := BytesTransferred + DataSize;
      fOnProgress(FileSize, BytesTransferred);
      if fCancel then
        break;
    end;
    until (NumRead = 0) or (NumWritten <> NumRead);
  finally
    CloseFile(FromF);
    CloseFile(ToF);
    if fCancel then
      DeleteFile(aDest);
    if Assigned(fOnAfterCopy) then
      fOnAfterCopy(Self);
  end;
end;


end.
