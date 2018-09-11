unit fntMailTest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, o_SendMail;

type
  TfrmMailTest = class(TForm)
    GroupBox1: TGroupBox;
    edt_MeineWebEMail: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edt_MeinWebPasswort: TEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    edt_Betreff: TEdit;
    mem_Nachricht: TMemo;
    Label5: TLabel;
    edt_EMail: TEdit;
    btn_Senden: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btn_SendenClick(Sender: TObject);
  private
  public
  end;

var
  frmMailTest: TfrmMailTest;

implementation

{$R *.dfm}


procedure TfrmMailTest.FormCreate(Sender: TObject);
begin
  edt_MeineWebEMail.Text   := '';
  edt_MeinWebPasswort.Text := '';
  edt_Betreff.Text         := '';
  edt_EMail.Text           := '';
  mem_Nachricht.Clear;
end;


procedure TfrmMailTest.btn_SendenClick(Sender: TObject);
var
  SendMail: TSendMail;
begin
  SendMail := TSendMail.Create;
  try
    SendMail.MeineEMail   := edt_MeineWebEMail.Text;
    SendMail.MeinPasswort := edt_MeinWebPasswort.Text;
    SendMail.Betreff      := edt_Betreff.Text;
    SendMail.Nachricht    := mem_Nachricht.Text;
    SendMail.EMailAdresse := edt_EMail.Text;

    SendMail.SendenUeberWebDe;

    ShowMessage('E-Mail wurde versendet');

  finally
    FreeAndNil(SendMail);
  end;
end;


end.
