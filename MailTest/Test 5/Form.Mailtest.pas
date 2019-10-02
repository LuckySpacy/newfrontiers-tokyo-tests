unit Form.Mailtest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Types.Mail, Log4d, Objekt.SendMail;

type
  Tfrm_Mailtest = class(TForm)
    PageControl1: TPageControl;
    tbs_Mail: TTabSheet;
    tbs_Einstellung: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel3: TPanel;
    edt_Betreff: TEdit;
    edt_An: TEdit;
    edt_CC: TEdit;
    edt_BCC: TEdit;
    Panel4: TPanel;
    mem_Body: TMemo;
    btn_Senden: TButton;
    Panel5: TPanel;
    Panel6: TPanel;
    Label192: TLabel;
    Label193: TLabel;
    Label5: TLabel;
    lbl_MailPort: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Edt_SMTP: TEdit;
    Edt_User: TEdit;
    Edt_Passwort: TEdit;
    Panel7: TPanel;
    edt_Port: TEdit;
    cbo_TLS: TComboBox;
    cbo_AuthType: TComboBox;
    cbo_SSLVersion: TComboBox;
    edt_AbsMail: TEdit;
    Label6: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure btn_SendenClick(Sender: TObject);
  private
    fPath: string;
    fLogPath: string;
    fIniFilename: string;
    fDemoLog: log4d.TLogLogger;
    fSendMail: TSendMail;
    procedure MailSenden;
    procedure MailError(Sender: TObject; aError: string);
    procedure BevorConnect(Sender: TObject);
    procedure AfterConnect(Sender: TObject);
    procedure BevorSend(Sender: TObject);
    procedure AfterSend(Sender: TObject);
  public
  end;

var
  frm_Mailtest: Tfrm_Mailtest;

implementation

{$R *.dfm}

uses
  Allgemein.RegIni;


procedure Tfrm_Mailtest.FormCreate(Sender: TObject);
var
  i1: Integer;
begin

  if (not FileExists(ExtractFilePath(Application.ExeName) + 'log4d.props')) then
        raise Exception.Create('Log-Konfigurationsdatei (log4d.props) nicht gefunden');

  TLogPropertyConfigurator.Configure(ExtractFilePath(Application.ExeName) + 'log4d.props');
  fLogPath := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + '\LogFiles\';

  if not DirectoryExists(fLogPath) then
    ForceDirectories(fLogPath);

  fDemoLog := TLogLogger.GetLogger('Demo');

  if fDemoLog.Appenders.Count = 1 then
    (fDemoLog.Appenders[0] as ILogRollingFileAppender).renameLogfile(fLogPath + 'Demo.log');  //<-- Pfad zuweisen

  edt_An.Text := '';
  edt_CC.Text := '';
  edt_BCC.Text := '';
  edt_Betreff.Text := '';
  mem_Body.Clear;
  fPath := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
  fIniFilename := fPath + 'Mailtest.Ini';

  cbo_TLS.Items.clear;
  for i1 := 0 to c_UstTLSMax do
    cbo_TLS.Items.Add(c_UseTLS[i1].Text);

  cbo_AuthType.Items.Clear;
  for i1 := 0 to c_AuthTypeMax do
    cbo_AuthType.Items.Add(c_AuthType[i1].Text);

  cbo_SSLVersion.Items.Clear;
  for i1 := 0 to c_SSLVersionMax do
    cbo_SSLVersion.Items.Add(c_SSLVersion[i1].Text);

  fSendMail := TSendMail.Create;
  fSendMail.OnMailError := MailError;
  fSendMail.OnBevorConnect := BevorConnect;
  fSendMail.OnAfterConnect := AfterConnect;
  fSendMail.OnBevorSend := BevorSend;
  fSendMail.OnAfterSend := AfterSend;

end;

procedure Tfrm_Mailtest.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fSendMail);
end;

procedure Tfrm_Mailtest.FormShow(Sender: TObject);
begin
  edt_An.Text      := ReadIni(fIniFilename, 'Mail', 'An', '');
  edt_CC.Text      := ReadIni(fIniFilename, 'Mail', 'CC', '');
  edt_BCC.Text     := ReadIni(fIniFilename, 'Mail', 'BCC', '');
  edt_Betreff.Text := ReadIni(fIniFilename, 'Mail', 'Betreff', '');
  mem_Body.Text    := ReadIni(fIniFilename, 'Mail', 'Body', '');
  edt_SMTP.Text    := ReadIni(fIniFilename, 'MailEinstellung', 'SMTP', '');
  edt_User.Text    := ReadIni(fIniFilename, 'MailEinstellung', 'User', '');
  edt_Port.Text    := ReadIni(fIniFilename, 'MailEinstellung', 'Port', '');
  edt_Passwort.Text := ReadIni(fIniFilename, 'MailEinstellung', 'Passwort', '');
  edt_AbsMail.Text := ReadIni(fIniFilename, 'MailEinstellung', 'AbsenderMail', '');
  cbo_TLS.ItemIndex := StrToInt(ReadIni(fIniFilename, 'MailEinstellung', 'TLS', '-1'));
  cbo_AuthType.ItemIndex := StrToInt(ReadIni(fIniFilename, 'MailEinstellung', 'AuthType', '-1'));
  cbo_SSLVersion.ItemIndex := StrToInt(ReadIni(fIniFilename, 'MailEinstellung', 'SSLVersion', '-1'));
end;


procedure Tfrm_Mailtest.AfterConnect(Sender: TObject);
begin
  fDemoLog.Info('AfterConnect');
end;

procedure Tfrm_Mailtest.AfterSend(Sender: TObject);
begin
  fDemoLog.Info('AfterSend');
end;

procedure Tfrm_Mailtest.BevorConnect(Sender: TObject);
begin
  fDemoLog.Info('BevorConnect');
end;

procedure Tfrm_Mailtest.BevorSend(Sender: TObject);
begin
  fDemoLog.Info('BevorSend');
end;

procedure Tfrm_Mailtest.btn_SendenClick(Sender: TObject);
begin
  MailSenden;
end;

procedure Tfrm_Mailtest.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  WriteIni(fIniFilename, 'Mail', 'An', edt_An.Text);
  WriteIni(fIniFilename, 'Mail', 'CC', edt_CC.Text);
  WriteIni(fIniFilename, 'Mail', 'BCC', edt_BCC.Text);
  WriteIni(fIniFilename, 'Mail', 'Betreff', edt_Betreff.Text);
  WriteIni(fIniFilename, 'Mail', 'Body', mem_Body.Text);
  WriteIni(fIniFilename, 'MailEinstellung', 'AbsenderMail', edt_AbsMail.Text);
  WriteIni(fIniFilename, 'MailEinstellung', 'SMTP', edt_SMTP.Text);
  WriteIni(fIniFilename, 'MailEinstellung', 'User', edt_User.Text);
  WriteIni(fIniFilename, 'MailEinstellung', 'Port', edt_Port.Text);
  WriteIni(fIniFilename, 'MailEinstellung', 'Passwort', edt_Passwort.Text);
  WriteIni(fIniFilename, 'MailEinstellung', 'TLS', IntToStr(cbo_TLS.ItemIndex));
  WriteIni(fIniFilename, 'MailEinstellung', 'AuthType', IntToStr(cbo_AuthType.ItemIndex));
  WriteIni(fIniFilename, 'MailEinstellung', 'SSLVersion', IntToStr(cbo_SSLVersion.ItemIndex));
end;


procedure Tfrm_Mailtest.MailError(Sender: TObject; aError: string);
begin
  fDemoLog.Info(aError);
  MessageDlg(aError, mtError, [mbOk], 0);
end;

procedure Tfrm_Mailtest.MailSenden;
begin
  fSendMail.MeineEMail   := edt_AbsMail.Text;
  fSendMail.MeinUsername := Edt_User.Text;
  fSendMail.MeinPasswort := edt_Passwort.Text;
  fSendMail.MeineEMail   := edt_AbsMail.Text;
  fSendMail.Betreff      := edt_Betreff.Text;
  fSendMail.Nachricht    := mem_Body.Text;
  fSendMail.Host         := edt_SMTP.Text;
  fSendMail.EMailAdresse := edt_An.Text;
  fSendMail.Port         := StrToInt(Trim(edt_Port.Text));
  fSendMail.UseTLS := cbo_TLS.ItemIndex;
  fSendMail.AuthType := cbo_AuthType.ItemIndex;
  fSendMail.SSLVersion := cbo_SSLVersion.ItemIndex;
  fSendMail.Senden;
end;


end.
