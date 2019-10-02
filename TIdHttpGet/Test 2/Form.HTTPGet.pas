unit Form.HTTPGet;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, Vcl.ExtCtrls,
  IdExplicitTLSClientServerBase, IdFTP;

const
 cFTPPath = 'httpdocs/katalog/bilder';

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Check: TButton;
    http: TIdHTTP;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    Image1: TImage;
    ftp: TIdFTP;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure CheckClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  IdFTPCommon;


procedure TForm1.FormCreate(Sender: TObject);
begin
  Edit1.Text := 'http://www.ynot-gmbh.de/katalog/bilder/B-vhs_Film-43767.jpg';
  ftp.Host := 'kundenserver.asis.net';
  ftp.Username := 'ynotgmbhftp';
  ftp.Password := '#kNedp?=JMjqQqR6!s.&%r~3E6-m;@';
end;


procedure TForm1.Button1Click(Sender: TObject);
var
  StrLst: TStringList;
  Vorhanden: Boolean;
  d: TDateTime;
begin
  StrLst := TStringList.Create;
  ftp.TransferType := ftBinary;
  ftp.Connect;
  ftp.ChangeDir(cFTPPath);
  d := ftp.FileDate('B-vhs_Film-43767.jpg');
  ShowMessage(FormatDateTime('dd.mm.yyyy hh:nn:ss', d));
  //ftp.List(StrLst, 'httpdocs/katalog/bilder/B-vhs_Film-43767.jpg');
  {
  Vorhanden := StrLst.Count > 0;
  if Vorhanden then
    ShowMessage('Bild vorhanden')
  else
    ShowMessage('Bild nicht vorhanden');
  }
  FreeAndNil(StrLst);
  ftp.Disconnect;

end;

procedure TForm1.CheckClick(Sender: TObject);
var
  x: TMemoryStream;
begin
  x := TMemoryStream.Create;
  try
    try
      HTTP.Request.UserAgent:='Indy';
      HTTP.HandleRedirects:=true;
      HTTP.Request.Connection:= 'Keep-Alive';
      HTTP.Request.CacheControl:= 'no-cache';
      Http.Get(Edit1.Text, x);
      x.Position := 0;
      //Image1.Picture.Graphic.LoadFromStream(x);
    except
      on E:Exception do
      begin
        ShowMessage(e.Message);
        exit;
      end;
    end;
  finally
    FreeAndNil(x);
  end;
  ShowMessage('Bild vorhanden');
end;


end.
