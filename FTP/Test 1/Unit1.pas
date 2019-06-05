unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdFTP, IdFTPCommon;

type
  TForm1 = class(TForm)
    ftp: TIdFTP;
    Button1: TButton;
    cbx_Passiv: TCheckBox;
    procedure Button1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  ftp.TransferType := ftbinary;
  ftp.Passive := cbx_Passiv.Checked;
  ftp.connect;
  ftp.changedir('httpdocs/katalog/bilder/');
  //ftp.Put('c:\FTPTest\NFS Logo.jpg', 'httpdocs/katalog/bilder/NFSBild.jpg');
  try
    ftp.Delete('NFSBild.jpg');
    //ftp.Delete('httpdocs/katalog/bilder/NFSBild.jpg');
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
    end;
  end;
  //ftp.Put('c:\FTPTest\NFS Logo.jpg', 'httpdocs/katalog/bilder/NFSBild.jpg');
  ftp.Put('c:\FTPTest\NFS Logo.jpg', 'NFSBild.jpg');
  ftp.Disconnect;
  ShowMessage('Fertig');
end;

end.
