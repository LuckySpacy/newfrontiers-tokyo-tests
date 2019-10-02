unit Objekt.SendMail;

interface

uses
  SysUtils, Classes,
  IdMessage, IdPOP3, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdMessageClient, IdSMTPBase, IdSMTP, Vcl.StdCtrls, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdGlobal,
  IdSASlLogin, IdUserPassProvider;


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
    fPort: Integer;
    fSSLVersion: Integer;
    fAuthType: Integer;
    fUseTLS: Integer;
    fSASLLogin: TIdSASLLogin;
    fUserPassProvider: TIdUserPassProvider;
    fOnAfterConnect: TNotifyEvent;
    fOnBevorSend: TNotifyEvent;
    fOnAfterSend: TNotifyEvent;
    fOnBevorConnect: TNotifyEvent;
    procedure VersendeEMail;
    function IdSMTPAuthenticationType: TIdSMTPAuthenticationType;
    function IdSSLVersion: TIdSSLVersion;
    function IdUseTLS: TIdUseTLS;
    procedure SetSendParam;
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
    property Port: Integer read fPort write fPort;
    property OnMailError: TMailErrorEvent read fOnMailError write fOnMailError;
    procedure SendenUeberWebDe;
    procedure SendenUeberGMail;
    procedure SendenUeberExchange;
    procedure Senden;
    property UseTLS: Integer read fUseTLS write fUseTLS;
    property AuthType: Integer read fAuthType write fAuthType;
    property SSLVersion: Integer read fSSLVersion write fSSLVersion;
    property OnBevorConnect: TNotifyEvent read fOnBevorConnect write fOnBevorConnect;
    property OnAfterConnect: TNotifyEvent read fOnAfterConnect write fOnAfterConnect;
    property OnBevorSend: TNotifyEvent read fOnBevorSend write fOnBevorSend;
    property OnAfterSend: TNotifyEvent read fOnAfterSend write fOnAfterSend;
  end;


implementation

{ TSendMail }

uses
  VCL.Dialogs;

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
  fPort := 0;
  fUseTLS := 0;
  fAuthType := 0;
  fSSLVersion := 0;
  fSASLLogin := nil;
  fUserPassProvider := nil;

end;

destructor TSendMail.Destroy;
begin
  FreeAndNil(FSmtp);
  FreeAndNil(FMsg);
  FreeAndNil(FIOHandler);
  if fSASLLogin <> nil then
    FreeAndNil(fSASLLogin);
  if fUserPassProvider <> nil then
    FreeAndNil(fUserPassProvider);

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

procedure TSendMail.Senden;
begin
  Fsmtp.Host := fHost;
  Fsmtp.Password := FMeinPasswort;
  Fsmtp.Username := FMeinUsername;
  Fsmtp.Port := fPort;
  Fsmtp.AuthType := IdSMTPAuthenticationType;
  Fsmtp.UseTLS := IdUseTLS;
  {
  fsmtp.SASLMechanisms.Clear;
  fIOHandler.MaxLineAction := maException;
  fIOHandler.Port := fPort;
  fIOHandler.SSLOptions.Method := IdSSLVersion;
  fIOHandler.SSLOptions.Mode   := sslmUnassigned;
  fIOHandler.SSLOptions.VerifyMode := [];
  fIOHandler.SSLOptions.VerifyDepth := 0;
  }
  SetSendParam;

  //fsmtp.IOHandler := fIOHandler;
  VersendeEMail;
end;

procedure TSendMail.SetSendParam;
begin
  fSmtp.SASLMechanisms.Clear;
  if (fUseTLS = 0) and (fIOHandler <> nil) then
    FreeAndNil(fIOHandler);

  if (fUseTLS = 0) and (fIOHandler = nil) then
    exit;

  if fIOHandler = nil then
    fIOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);

  fSmtp.IOHandler := fIOHandler;
  TIdSSLIOHandlerSocketOpenSSL(fSmtp.IOHandler).SSLOptions.Method := IdSSLVersion;
  fSmtp.UseTLS := IdUseTLS;

  fSmtp.AuthType := IdSMTPAuthenticationType;

  if IdSMTPAuthenticationType = satSASL then
  begin
    if fSASLLogin = nil then
      fSASLLogin := TIdSASLLogin.Create(nil);
    if fUserPassProvider = nil then
      fUserPassProvider := TIdUserPassProvider.Create(fSASLLogin);
    fSASLLogin.UserPassProvider := fUserPassProvider;
    fUserPassProvider.Username := fSmtp.Username;
    fUserPassProvider.Password := fSmtp.Password;
    fSmtp.SASLMechanisms.Add.SASL := fSASLLogin;
  end;


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
  VersendeEMail;
end;


procedure TSendMail.VersendeEMail;
begin
  FMsg.From.Address := FMeineEmail;
  FMsg.Recipients.EMailAddresses := FEMailAdresse;
  FMsg.Body.Add(FNachricht);
  FMsg.Subject := FBetreff;
  try
    if Assigned(fOnBevorConnect) then
      fOnBevorConnect(Self);
    Fsmtp.Connect;
    if Assigned(fOnAfterConnect) then
      fOnAfterConnect(Self);
    //if IdSMTPAuthenticationType = satSASL then
    //  fSmtp.Authenticate;

    //if not fsmtp.Authenticate  then
    //  MessageDlg('Autenticate fehlgeschlagen', mtError, [mbOk], 0);

    if Assigned(fOnBevorSend) then
      fOnBevorSend(Self);
    Fsmtp.Send(FMsg);
    if Assigned(fOnAfterSend) then
      fOnAfterSend(Self);
    Fsmtp.Disconnect;
  except
    on E: Exception do
    begin
      if Assigned(fOnMailError) then
        fOnMailError(Self, e.Message);
    end;
  end;
end;


function TSendMail.IdSMTPAuthenticationType: TIdSMTPAuthenticationType;
begin
  Result := satDefault;
  case fAuthType of
    0 : Result := satNone;
    1 : Result := satDefault;
    2 : Result := satSASL;
  end;
end;

function TSendMail.IdSSLVersion: TIdSSLVersion;
begin
  Result := sslvTLSv1;
  case fSSLVersion of
    0: Result := sslvSSLv2;
    1: Result := sslvSSLv23;
    2: Result := sslvSSLv3;
    3: Result := sslvTLSv1;
    4: Result := sslvTLSv1_1;
    5: Result := sslvTLSv1_2;
  end;
end;

function TSendMail.IdUseTLS: TIdUseTLS;
begin
  Result := utUseExplicitTLS;
  case fUseTLS of
    0: Result := utNoTLSSupport;
    1: Result := utUseImplicitTLS;
    2: Result := utUseRequireTLS;
    3: Result := utUseExplicitTLS;
  end;
end;

end.
