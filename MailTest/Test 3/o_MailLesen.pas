unit o_MailLesen;

interface

uses
  SysUtils, Classes,
  IdMessage, IdPOP3, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdMessageClient, IdSMTPBase, IdSMTP, Vcl.StdCtrls, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdGlobal;


type
  TMailLesen = class(TObject)
  private
    FPop3: TIdPOP3;
    FSmtp: TIdSMTP;
    FMsg: TIdMessage;
    FIOHandler: TIdSSLIOHandlerSocketOpenSSL;
    //FIOHandler: TIdSSLIOHandlerSocketBase;
    FMeineEmail: string;
    FMeinPasswort: string;
    FBetreff: string;
    FNachricht: string;
    FEMailAdresse: string;
    procedure LeseEMail;
  public
    constructor Create;
    destructor Destroy; override;
    property MeineEMail: string read FMeineEmail write FMeineEMail;
    property MeinPasswort: string read FMeinPasswort write FMeinPasswort;
    property Betreff: string read FBetreff write FBetreff;
    property Nachricht: string read FNachricht write FNachricht;
    property EMailAdresse: string read FEMailAdresse write FEMailAdresse;
    procedure UeberWebDe;
    procedure UeberGMail;
  end;

implementation

{ TMailLesen }

uses
  Dialogs;

constructor TMailLesen.Create;
begin
  inherited;
  FSmtp      := TIdSMTP.Create(nil);
  FMsg       := TIdMessage.Create(nil);
  FIOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  FPop3 := TIdPOP3.Create(nil);
  //FSmtp.IOHandler := FIOHandler;
  FPop3.IOHandler := FIOHandler;

  FMeineEmail   := '';
  FMeinPasswort := '';
  FBetreff      := '';
  FNachricht    := '';
  FEMailAdresse := '';
end;

destructor TMailLesen.Destroy;
begin
  FreeAndNil(FPop3);
  FreeAndNil(FSmtp);
  FreeAndNil(FMsg);
  FreeAndNil(FIOHandler);
  inherited;
end;

procedure TMailLesen.LeseEMail;
var
  MailCount: Integer;
begin
  FPop3.Connect;
  MailCount := FPop3.CheckMessages;
  ShowMessage(IntToStr(MailCount));
end;

procedure TMailLesen.UeberGMail;
begin
  //FPop3.Host := 'imap.gmail.com';
  FPop3.Host := 'pop.gmail.com';
  FPop3.Port := 995;
  FPop3.Username := FMeineEMail;
  FPop3.Password := FMeinPasswort;
  FPOP3.UseTLS   := utUseExplicitTLS;

  FIOHandler.Host := FPop3.Host;
  FIOHandler.Destination := FPop3.Host + ':995';
  FIOHandler.DefaultPort := 0;
  FIOHandler.SSLOptions.Method := sslvSSLv3;
  FIOHandler.SSLOptions.Mode := sslmUnassigned;
  FIOHandler.SSLOptions.VerifyMode := [];
  FIOHandler.SSLOptions.VerifyDepth := 0;


  LeseEMail;
end;

procedure TMailLesen.UeberWebDe;
begin

end;

end.
