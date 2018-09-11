unit o_SendMail;

interface

uses
  SysUtils, Classes,
  IdMessage, IdPOP3, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdMessageClient, IdSMTPBase, IdSMTP, Vcl.StdCtrls, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdGlobal;


type
  TSendMail = class(TObject)
  private
    FSmtp: TIdSMTP;
    FMsg: TIdMessage;
    FIOHandler: TIdSSLIOHandlerSocketOpenSSL;
    FMeineEmail: string;
    FMeinPasswort: string;
    FBetreff: string;
    FNachricht: string;
    FEMailAdresse: string;
    procedure VersendeEMail;
  public
    constructor Create;
    destructor Destroy; override;
    property MeineEMail: string read FMeineEmail write FMeineEMail;
    property MeinPasswort: string read FMeinPasswort write FMeinPasswort;
    property Betreff: string read FBetreff write FBetreff;
    property Nachricht: string read FNachricht write FNachricht;
    property EMailAdresse: string read FEMailAdresse write FEMailAdresse;
    procedure SendenUeberWebDe;
    procedure SendenUeberGMail;
  end;


implementation

{ TSendMail }

constructor TSendMail.Create;
begin
  inherited;
  FSmtp      := TIdSMTP.Create(nil);
  FMsg       := TIdMessage.Create(nil);
  FIOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  FSmtp.IOHandler := FIOHandler;

  FMeineEmail   := '';
  FMeinPasswort := '';
  FBetreff      := '';
  FNachricht    := '';
  FEMailAdresse := '';
end;

destructor TSendMail.Destroy;
begin
  FreeAndNil(FSmtp);
  FreeAndNil(FMsg);
  FreeAndNil(FIOHandler);
  inherited;
end;

procedure TSendMail.SendenUeberGMail;
begin
  Fsmtp.Host := 'smtp.gmail.com';
  Fsmtp.Password := FMeinPasswort;
  Fsmtp.Port := 587;
  Fsmtp.UseTLS := utUseExplicitTLS;
  Fsmtp.Username := FMeineEmail;
  FIOHandler.Destination := 'smtp.gmail.com:587';
  FIOHandler.Host := 'smtp.gmail.com';
  FIOHandler.MaxLineAction := maException;
  FIOHandler.Port := 587;
  FIOHandler.SSLOptions.Method := ssLvTlSv1;
  FIOHandler.SSLOptions.Mode   := sslmUnassigned;
  FIOHandler.SSLOptions.VerifyMode := [];
  FIOHandler.SSLOptions.VerifyDepth := 0;
  VersendeEMail;
end;

procedure TSendMail.SendenUeberWebDe;
begin
  Fsmtp.Host := 'smtp.web.de';
  Fsmtp.Password := FMeinPasswort;
  Fsmtp.Port := 587;
  Fsmtp.UseTLS := utUseExplicitTLS;
  Fsmtp.Username := FMeineEmail;
  FIOHandler.Destination := 'smtp.web.de:587';
  FIOHandler.Host := 'smtp.web.de';
  FIOHandler.MaxLineAction := maException;
  FIOHandler.Port := 587;
  FIOHandler.SSLOptions.Method := ssLvTlSv1;
  FIOHandler.SSLOptions.Mode   := sslmUnassigned;
  FIOHandler.SSLOptions.VerifyMode := [];
  FIOHandler.SSLOptions.VerifyDepth := 0;
  VersendeEMail;
end;

procedure TSendMail.VersendeEMail;
begin
  FMsg.From.Address := FMeineEmail;
  FMsg.Recipients.EMailAddresses := FEMailAdresse;
  FMsg.Body.Add(FNachricht);
  FMsg.Subject := FBetreff;

  Fsmtp.Connect;
  Fsmtp.Send(FMsg);
  Fsmtp.Disconnect;
end;

end.
