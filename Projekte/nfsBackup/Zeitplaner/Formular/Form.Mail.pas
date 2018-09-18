unit Form.Mail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Objekt.Maildat,
  System.UITypes;

type
  Tfrm_Mail = class(TForm)
    Panel1: TPanel;
    cbo_Provider: TComboBox;
    Label1: TLabel;
    Panel2: TPanel;
    btn_Ok: TButton;
    btn_Cancel: TButton;
    btn_Mail: TButton;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    edt_Host: TEdit;
    Label3: TLabel;
    edt_EMail: TEdit;
    Label4: TLabel;
    edt_User: TEdit;
    lbl_Passwort: TLabel;
    edt_Passwort: TEdit;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    edt_Betreff: TEdit;
    Label6: TLabel;
    edt_EMailAn: TEdit;
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_OkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btn_MailClick(Sender: TObject);
  private
    fMaildat: TMaildat;
    procedure LoadMailDat;
    procedure MailSenden;
    procedure MailError(Sender: TObject; aError: string);
  public
  end;

var
  frm_Mail: Tfrm_Mail;

implementation

{$R *.dfm}

uses
  Objekt.Allgemein, Objekt.SendMail;

procedure Tfrm_Mail.FormCreate(Sender: TObject);
begin
  edt_Host.Text := '';
  edt_EMail.Text := '';
  edt_User.Text := '';
  edt_Betreff.Text := '';
  cbo_Provider.ItemIndex := 0;
  fMaildat := TMaildat.Create;

  cbo_Provider.Clear;
  cbo_Provider.AddItem('Exchange', TObject(pvExchange));
  cbo_Provider.AddItem('GMail', TObject(pvGMail));
  cbo_Provider.AddItem('Web', TObject(pvWeb));

  LoadMailDat;

end;

procedure Tfrm_Mail.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fMaildat);
end;



procedure Tfrm_Mail.LoadMailDat;
var
  i1: Integer;
begin
  fMaildat.Load;
  cbo_Provider.ItemIndex := 0;
  for i1 := 0 to cbo_Provider.Items.Count -1 do
  begin
    if Integer(cbo_Provider.Items.Objects[i1]) = Ord(fMaildat.Provider)  then
    begin
      cbo_Provider.ItemIndex := i1;
      break;
    end;
  end;
  edt_Host.Text  := fMailDat.Host;
  edt_User.Text  := fMaildat.User;
  edt_EMail.Text := fMaildat.Mail;
  edt_Passwort.Text := fMaildat.Passwort;
  edt_Betreff.Text  := fMaildat.Betreff;
  edt_EMailAn.Text  := fMaildat.MailAn;
end;


procedure Tfrm_Mail.btn_CancelClick(Sender: TObject);
begin
  close;
end;


procedure Tfrm_Mail.btn_OkClick(Sender: TObject);
begin
  fMaildat.Host := edt_Host.Text;
  fMaildat.User := edt_User.Text;
  fMaildat.Mail := edt_EMail.Text;
  fMaildat.Passwort := edt_Passwort.Text;
  fMaildat.Betreff  := edt_Betreff.Text;
  fMaildat.MailAn   := edt_EMailAn.Text;
  fMaildat.Provider := TProvider(Integer(cbo_Provider.Items.Objects[cbo_Provider.ItemIndex]));
  fMaildat.Save;
  close;
end;


procedure Tfrm_Mail.btn_MailClick(Sender: TObject);
begin
  MailSenden;
end;



procedure Tfrm_Mail.MailSenden;
var
  Mail: TSendMail;
  Provider: TProvider;
  Cur: TCursor;
begin
  Cur := Screen.Cursor;
  Mail := TSendMail.Create;
  try
    Screen.Cursor := crHourGlass;
    Mail.MeineEMail := edt_EMail.Text;
    Mail.MeinPasswort := edt_Passwort.Text;
    Mail.MeinUsername := edt_User.Text;
    Mail.Betreff := edt_Betreff.Text;
    Mail.Nachricht := 'Das ist eine Nachricht (nfsBackup)';
    Mail.EMailAdresse := edt_EMailAn.Text;
    Mail.Host := edt_Host.Text;
    Mail.OnMailError := MailError;
    Provider := TProvider(Integer(cbo_Provider.Items.Objects[cbo_Provider.ItemIndex]));
    if Provider = pvExchange then
      Mail.SendenUeberExchange;
    if Provider = pvGmail then
      Mail.SendenUeberGMail;
    if Provider = pvWeb then
      Mail.SendenUeberWebDe;
  finally
    FreeAndNil(Mail);
    Screen.Cursor := Cur;
  end;

end;


procedure Tfrm_Mail.MailError(Sender: TObject; aError: string);
begin
  AllgemeinObj.Log.DebugInfo('Fehler beim Senden einer Mail: ' + aError);
  MessageDlg('Fehler beim Senden einer Mail:' + sLineBreak + aError, mtError, [mbOk], 0);
end;




end.
