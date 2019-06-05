unit servermainu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IdBaseComponent, IdComponent, IdTCPServer, IdHTTPServer, StdCtrls, Db,
  IBDatabase,NewsStoryDBU,Qremote,middlex,middleXRtti,newsstoryu;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Server: TIdHTTPServer;
    DB: TIBDatabase;
    Label1: TLabel;
    txtPort: TEdit;
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
 if Server.Active then
  begin
    Server.active:=false;
    DB.close;
    button1.caption:='Start';
  end else
    begin
    Server.defaultPort:=strtoint(txtPort.text);
    Server.Active:=true;
    DB.open;
    button1.caption:='Stop';
    end;
end;

procedure TForm1.ServerCommandGet(AThread: TIdPeerThread;
  RequestInfo: TIdHTTPRequestInfo; ResponseInfo: TIdHTTPResponseInfo);
var Q:TMiddleXQuickRTTi; outXML:String; RRq:TRemoteRequest; ni:TDBNewsStory; RR:TRemoteResponse;
    si:TDBStoryList;
begin
{Create a transaction for each connection}
 Q:=TMiddleXQuickRTTi.create;
 ni:=TDBNewsStory.create('NewsItem');
 si:=TDBStoryList.create('NewsList');
 RRq:= TRemoteRequest.create;
 RRQ.rttienabler:=Q;
 RRQ.RTTIObject := nil;
 RRQ.LoadFromXML ('RemoteRequest',RequestInfo.UnparsedParams );

 if RRQ.Service='NewsItem' then
  begin
   ni.db:=db;
   RRQ.RTTIObject := ni;
   RRQ.LoadFromXML ('RemoteRequest',RequestInfo.UnparsedParams );
   RR:= ni.ProcessCall (rrq.command,rrq.Parameters );
   RR.rttienabler:= Q;
   outXML:=RR.savetoXML ('RemoteResponse');
   RR.Free;
  end
  else
  if RRQ.Service='NewsList' then
  begin
   si.db:=db;
   RR:= si.ProcessCall (rrq.command,rrq.Parameters );
   RR.rttienabler:= Q;
   outXML:=RR.savetoXML ('RemoteResponse');
   RR.Free;
  end
  else
  begin
      RR:=TRemoteResponse.create;
      RR.RTTIEnabler:= Q;
      RR.ErrorNumber:=1;
      RR.ErrorMessage := 'Service ['+RRq.Service+'] Not Available.';
      outXML :=  RR.savetoXML ('RemoteResponse');
      RR.Free;
  end;

 ResponseInfo.ContentText := outXML;
 Q.free;
 ni.free;
 si.free;
end;

end.
