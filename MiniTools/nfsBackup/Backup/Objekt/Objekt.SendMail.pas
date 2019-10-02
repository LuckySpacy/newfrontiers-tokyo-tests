unit Objekt.SendMail;

interface

uses
  SysUtils, Classes,
  IdMessage, IdPOP3, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdMessageClient, IdSMTPBase, IdSMTP, Vcl.StdCtrls, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdGlobal;


type
  TMailErrorEvent=procedure(Sender: TObject; aError: string) of object;


type
  TSendMail = class(TObject)
  private
    fSmtp: TIdSMTP;
    fMsg: TIdMessage;
    fIOHandler: TIdSSLIOHandlerSocketOpenSSL;
    fMeineEmail: string;
    fMeinPasswort: string;
    fBetreff: string;
    fNachricht: string;
    fEMailAdresse: string;
    fMeinUsername: string;
    fOnMailError: TMailErrorEvent;
    fHost: string;
    procedure VersendeEMail;
  public
    constructor Create;
    destructor Destroy; override;
    property MeineEMail: string read fMeineEmail write fMeineEMail;
    property MeinPasswort: string read fMeinPasswort write fMeinPasswort;
    property MeinUsername: string read fMeinUsername write fMeinUsername;
    property Betreff: string read fBetreff write fBetreff;
    property Nachricht: string read fNachricht write fNachricht;
    property EMailAdresse: string read fEMailAdresse write fEMailAdresse;
    property Host: string read fHost write fHost;
    property OnMailError: TMailErrorEvent read fOnMailError write fOnMailError;
    procedure SendenUeberWebDe;
    procedure SendenUeberGMail;
    procedure SendenUeberExchange;
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
  fHost := '';
  fOnMailError  := nil;
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
  fsmtp.IOHandler := fIOHandler;
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
  fsmtp.IOHandler := fIOHandler;
  VersendeEMail;
end;

procedure TSendMail.SendenUeberExchange;
begin
  //Fsmtp.Host := 'exchange.ass-systemhaus.de';
  //Fsmtp.Host := '172.16.10.11';
  Fsmtp.Host := fHost;
  Fsmtp.Password := FMeinPasswort;
  Fsmtp.Username := FMeinUsername;
  Fsmtp.Port := 25;
  Fsmtp.AuthType := satDefault;
  Fsmtp.UseTLS := utNoTLSSupport;
  fsmtp.SASLMechanisms.Clear;
  FSmtp.IOHandler := nil;
          {
  FIOHandler.Host := fHost;
  FIOHandler.MaxLineAction := maException;
  FIOHandler.Port := 25;
  FIOHandler.SSLOptions.Method := sslvSSLv2;
  FIOHandler.SSLOptions.Mode   := sslmUnassigned;
  FIOHandler.SSLOptions.VerifyMode := [];
  FIOHandler.SSLOptions.VerifyDepth := 0;
  fsmtp.IOHandler := fIOHandler;
           }

  VersendeEMail;
end;


procedure TSendMail.VersendeEMail;
begin
  FMsg.From.Address := FMeineEmail;
  FMsg.Recipients.EMailAddresses := FEMailAdresse;
  FMsg.Body.Add(FNachricht);
  FMsg.Subject := FBetreff;
  try
    Fsmtp.Connect;
    Fsmtp.Send(FMsg);
    Fsmtp.Disconnect;
  except
    on E: Exception do
    begin
      if Assigned(fOnMailError) then
        fOnMailError(Self, e.Message);
    end;
  end;
end;

end.
