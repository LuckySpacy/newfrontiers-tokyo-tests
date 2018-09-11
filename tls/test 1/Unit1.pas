unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdMessageClient, IdSMTPBase, IdSMTP, IdMessage, IdSASL, IdSASLUserPass,
  IdSASLLogin, IdUserPassProvider;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    IdMessage1: TIdMessage;
    IdSMTP1: TIdSMTP;
    IdSMTP2: TIdSMTP;
    btn_SASL: TButton;
    IdUserPassProvider1: TIdUserPassProvider;
    procedure Button1Click(Sender: TObject);
    procedure smtpConnected(Sender: TObject);
    procedure smtpDisconnected(Sender: TObject);
    procedure smtpStatus(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: string);
    procedure smtpWork(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure btn_SASLClick(Sender: TObject);
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
var
  idSMTP1: TIdSMTP;
begin
  idSMTP1 := TIdSMTP.Create(nil);
  try
    idSMTP1.IOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(idSMTP1);
    idSMTP1.UseTLS := utUseExplicitTLS;
    TIdSSLIOHandlerSocketOpenSSL(idSMTP1.IOHandler).SSLOptions.Method := sslvTLSv1;

    idSMTP1.Host := 'smtp.office365.com';
    idSMTP1.Port := 587;

    idSMTP1.AuthType := satDefault;
    idSMTP1.Username := 'theisel@anamed-gele.com';
    idSMTP1.Password := 'Gts586647';

    try
      idSMTP1.Connect;
      try
        // idSMTP1.Authenticate;

        idSMTP1.Send(IdMessage1);

      finally
        idSMTP1.Disconnect;
      end;
      ShowMessage('OK');
    except
      on E: Exception do
      begin
        ShowMessage(Format('Failed!'#13'[%s] %s', [E.ClassName, E.Message]));
        raise;
      end;
    end;
  finally
    idSMTP1.Free;
  end;


end;

procedure TForm1.btn_SASLClick(Sender: TObject);
var
  idSMTP1: TIdSMTP;
  idSASLLogin: TIdSASLLogin;
  idUserPassProvider: TIdUserPassProvider;
 begin
  idSMTP1 := TIdSMTP.Create(nil);
  try
    idSMTP1.IOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(idSMTP1);
    idSMTP1.UseTLS := utUseExplicitTLS;
    TIdSSLIOHandlerSocketOpenSSL(idSMTP1.IOHandler).SSLOptions.Method := sslvTLSv1_2;

    idSMTP1.Host := 'smtp.office365.com';
    idSMTP1.Port := 587;

    idSASLLogin := TIdSASLLogin.Create(idSMTP1);
    idUserPassProvider := TIdUserPassProvider.Create(idSASLLogin);
    idSASLLogin.UserPassProvider := idUserPassProvider;
    idUserPassProvider.Username := 'theisel@anamed-gele.com';
    idUserPassProvider.Password := 'Gts586647';

    idSMTP1.AuthType := satSASL;


     idSMTP1.SASLMechanisms.Add.SASL := idSASLLogin;




    try
      idSMTP1.Connect;
      try
         idSMTP1.Authenticate;

        idSMTP1.Send(IdMessage1);

      finally
        idSMTP1.Disconnect;
      end;
      ShowMessage('OK');
    except
      on E: Exception do
      begin
        ShowMessage(Format('Failed!'#13'[%s] %s', [E.ClassName, E.Message]));
        raise;
      end;
    end;
  finally
    idSMTP1.Free;
  end;


end;

procedure TForm1.smtpConnected(Sender: TObject);
begin
  memo1.Lines.Add('Connected');
end;

procedure TForm1.smtpDisconnected(Sender: TObject);
begin
  Memo1.Lines.Add('Disconnected');
end;

procedure TForm1.smtpStatus(ASender: TObject; const AStatus: TIdStatus;
  const AStatusText: string);
begin
  Memo1.Lines.Add(aStatustext);
end;

procedure TForm1.smtpWork(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
  Memo1.Lines.Add('WorkCount ' + IntToStr(aworkcount));
end;

end.
