unit Form.SendMail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Objekt.SendMail;

type
  Tfrm_Sendmail = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edt_MeineWebEMail: TEdit;
    edt_MeinWebPasswort: TEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edt_Betreff: TEdit;
    mem_Nachricht: TMemo;
    edt_EMail: TEdit;
    btn_Senden: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure btn_SendenClick(Sender: TObject);
  private
    fSendMail: TSendMail;
  public
  end;

var
  frm_Sendmail: Tfrm_Sendmail;

implementation

{$R *.dfm}

procedure Tfrm_Sendmail.btn_SendenClick(Sender: TObject);
begin
  fSendMail.MeineEMail   := edt_MeineWebEMail.Text;
  fSendMail.MeinPasswort := edt_MeinWebPasswort.Text;
  fSendMail.Betreff      := edt_Betreff.Text;
  fSendMail.Nachricht    := mem_Nachricht.Text;
  fSendMail.EMailAdresse := edt_EMail.Text;

  //fSendMail.SendenUeberWebDe;
  fSendMail.SendenUeberExchange;

  ShowMessage('E-Mail wurde versendet');

end;

procedure Tfrm_Sendmail.FormCreate(Sender: TObject);
begin
  fSendMail := TSendMail.Create;
  edt_MeineWebEMail.Text := 'bachmann@new-frontiers.de';
  edt_EMail.Text := 'bachmann@new-frontiers.de';
end;

procedure Tfrm_Sendmail.FormDeactivate(Sender: TObject);
begin
  FreeAndNil(fSendMail);
end;

end.
