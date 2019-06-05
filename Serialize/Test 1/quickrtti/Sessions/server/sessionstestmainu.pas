unit sessionstestmainu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IdThreadMgr, IdThreadMgrPool, IdBaseComponent, IdComponent, IdTCPServer,
  IdHTTPServer, StdCtrls,middlex,middlexrtti,qremote,sessionserver;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Server: TIdHTTPServer;
    IdThreadMgrPool1: TIdThreadMgrPool;
    procedure Button1Click(Sender: TObject);
    procedure ServerCommandGet(AThread: TIdPeerThread;
      RequestInfo: TIdHTTPRequestInfo; ResponseInfo: TIdHTTPResponseInfo);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin
 if Server.active then
   begin
      Server.active:=false;
      button1.caption:='Start';
   end else
   begin
      Server.active:=true;
      button1.caption:='Stop';
   end;
end;

procedure TForm1.ServerCommandGet(AThread: TIdPeerThread;
  RequestInfo: TIdHTTPRequestInfo; ResponseInfo: TIdHTTPResponseInfo);
var Q:TMiddleXQuickRTTi; outXML:String; RRq:TRemoteRequest;  RR:TRemoteResponse;
    SS:TSessionServer;
begin
{Create a transaction for each connection}
 Q:=TMiddleXQuickRTTi.create;
 RRq:= TRemoteRequest.create;
 RRQ.rttienabler:=Q;
 RRQ.RTTIObject := nil;
 RRQ.LoadFromXML ('RemoteRequest',RequestInfo.UnparsedParams );
 outxml:='';
 if RRQ.Service='QSessions' then
  begin
   ss:=TSessionServer.create('QSessions');
   SS.rttienabler:=q;
   Q.RegisterClass(TSessionData);
   RRQ.RTTIObject := SS;
   RRQ.LoadFromXML ('RemoteRequest',RequestInfo.UnparsedParams );
   RR:= SS.ProcessCall (rrq.command,rrq.Parameters );
   RR.rttienabler:= Q;
   outXML:=RR.savetoXML ('RemoteResponse');
   RR.Free;
  end ;
 ResponseInfo.ContentText := outXML;
 Q.free;
end;

end.
