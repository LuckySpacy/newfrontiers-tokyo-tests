unit o_zpl;

interface

uses
  SysUtils, Classes, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdFTP;

type
  TZPL = class(TComponent)
  private
    _ftp: TIdFtp;
    procedure FTPStatus(ASender: TObject; const AStatus: TIdStatus; const AStatusText: string);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure print(aIP, aText: string); overload;
    procedure print(aIP: string; aStream: TMemoryStream); overload;
  end;


implementation

{ TZPL }

uses
  Dialogs;

constructor TZPL.Create(AOwner: TComponent);
begin
  inherited;
  _ftp := TIdFtp.Create(AOwner);
  _ftp.OnStatus := FTPStatus;
end;

destructor TZPL.Destroy;
begin
  FreeAndNil(_ftp);
  inherited;
end;

procedure TZPL.print(aIP, aText: string);
var
  m: TMemoryStream;
  List: TStringList;
begin
  List := TStringList.Create;
  m := TMemoryStream.Create;
  try
    List.Text := aTexT;
    List.SaveToStream(m);
    m.Position := 0;
    _ftp.Host := aIP;
    //_ftp.Port := 9100;
    try
      _ftp.Connect;
    except
      ShowMessage('Verbindung konnte nicht hergestellt werden.');
      exit;
    end;
    try
      _ftp.Put(m, 'print.zpl');
    finally
      _ftp.Disconnect;
    end;
  finally
    FreeAndNil(List);
    FreeAndNil(m);
  end;
end;

procedure TZPL.FTPStatus(ASender: TObject; const AStatus: TIdStatus;
  const AStatusText: string);
begin
  ShowMessage(AStatusText);
end;


procedure TZPL.print(aIP: string; aStream: TMemoryStream);
begin
  _ftp.Host := aIP;
  try
    _ftp.Connect;
  except
      ShowMessage('Verbindung konnte nicht hergestellt werden.');
      exit;
  end;
  try
    aStream.Position := 0;
    _ftp.Put(aStream, 'print.zpl');
  finally
    _ftp.Disconnect;
  end;
end;

end.
