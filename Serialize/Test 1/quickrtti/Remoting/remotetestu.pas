unit remotetestu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,QRemote, IdTCPConnection, IdTCPClient, IdHTTP, IdBaseComponent,
  IdComponent, IdTCPServer, IdHTTPServer,quickRTTI,middleXRTTI,
  IdThreadMgr, IdThreadMgrPool;

type


  TNetTime = class(TQRemoteObject)
    private
      fts:TDateTime ;
    published
      property TimeStamp:TDateTime read fts write fts;
      function ProcessCall (Command:String;Parameters:TStrings):TRemoteResponse; override;
    end;


  TForm1 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Server: TIdHTTPServer;
    Button2: TButton;
    lblTime: TLabel;
    lblCount: TLabel;
    IdThreadMgrPool1: TIdThreadMgrPool;
    procedure Button1Click(Sender: TObject);
    procedure ServerCommandGet(AThread: TIdPeerThread;
      RequestInfo: TIdHTTPRequestInfo; ResponseInfo: TIdHTTPResponseInfo);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    Processor:TQRemoteObjectProcessor;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

function TNetTime.ProcessCall (Command:String;Parameters:TStrings):TRemoteResponse;
begin
try
  if Command='Get' then
   begin
     self.timestamp:=now;
   end;
   result:= BuildResponse (self,self.RTTIEnabler,0,'');
 except on E:Exception do
 begin
   result.errornumber := 1;
   result.errormessage := 'Example Error';
 end;
end;
end;

{
The idea is that you create objects that know how to process themselves, and then you slap a
server on the front end.
}

procedure TForm1.Button1Click(Sender: TObject);
begin
 if Server.Active then
  begin
    Server.active:=false;
    button1.caption:='Start';
  end else
    begin
    Server.Active:=true;
    button1.caption:='Stop';
    end;
end;


procedure TForm1.ServerCommandGet(AThread: TIdPeerThread;
  RequestInfo: TIdHTTPRequestInfo; ResponseInfo: TIdHTTPResponseInfo);
var Q:TMiddleXQuickRTTI; outXML:String;
begin
  Q:=TMiddleXQuickRTTI.create;
  Processor.ProcessCall(Q,RequestInfo.UnparsedParams ,OutXML);
  ResponseInfo.contenttext:=outXML;
  Q.Free;
end;

procedure TForm1.Button2Click(Sender: TObject);
var NT:TNETTime; Q:TMiddleXQuickRTTI; RR:TRemoteResponse; RRq:TRemoterequest;
    postlines,readlines:tstringlist;ms:Tmemorystream; Client:TIdHTTP;
    E:Exception;  i:integer;   st,en:longint;
begin
st:=GetTickCount;
 for i := 0 to 100 do
  begin
  NT:=TNetTime.create ('Time');
  try
  NT.remotecall('http://127.0.0.1/','Get');    {One call does it all!}
  lblTime.caption:= datetimetostr(nt.TimeStamp)   ;
  application.processmessages;
  finally
  NT.free;
  end;
  end;

en:=GetTickCOunt-st;
showmessage(inttostr(en));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    Processor:=TQRemoteObjectProcessor.create;
    Processor.AddObject(TNetTime.create('Time')); {Dynamic anyone?}
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
 Processor.free;
end;

end.
