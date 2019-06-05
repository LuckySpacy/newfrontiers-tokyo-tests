unit QRemote;

interface

uses classes,sysutils,quickRTTI,IdTCPConnection, IdTCPClient, IdHTTP, IdBaseComponent,
  IdComponent, IdTCPServer, IdHTTPServer, 
  IdThreadMgr, IdThreadMgrPool;

{Relies on Indy Components}

type


TRemoteRequest = class(TXMLAware)
  private
    fcommand,fguid,fservice:String; fparams:TStringlist;
    fObj:TPersistent;
  published
    property Service:String read fservice write fservice;
    property Command:String read fcommand write fcommand;
    property Parameters:tstringlist read fparams write fparams;
    property RTTIObject:TPersistent read fObj write fObj;
    property GUID:String read fGUID write fGUID; {sort of a transaction id sort of thing, optional}
  end;

TRemoteResponse = class(TXMLAware)
  private
    fObj:TPersistent;
    ferr:integer; fmsg,fGUID,fservice:String;
  published
    property Service:String read fservice write fservice;
    property ErrorNumber:integer read ferr write ferr;
    property ErrorMessage:String read fmsg write fmsg;
    property RTTIObject:TPersistent read fObj write fObj;
    property GUID:String read fGUID write fGUID; {echos the GUID back to you.}
  end;

TQRemoteObject = class(TXMLAware)
 private
   fservice:String;
 public
   function ProcessCall (Command:String;Parameters:TStrings):TRemoteResponse;virtual;
   constructor create (Service:String);virtual;
   procedure RemoteCall(URL,Command:String);
   property  Service:String read fservice write fservice;
 end;


TQRemoteObjectProcessor = class(TPersistent)
  private
    fobjs:TList;
  public
    Constructor create;
    destructor  destroy;override;
  published
     function AddObject (Obj:TQRemoteObject):integer;
     procedure DeleteObject (index:integer);
     function ObjectCount:integer;
     function GetObject(index:integer):TQRemoteObject;
     function ServiceIndex(Service:String):integer;
     procedure ProcessCall (RTTIENabler:TCustomXMLRTTI;RequestXML:String; var ResponseXML:String);
  end;


{This call assumes the server is going to send and receive the same object for processing..
hand it a user, call login, and get the user back all filled in...}
function ReceiveRemoteCall (Q:TCustomXMLRTTI;RequestXML:String):TRemoteRequest;
function BuildResponse (Obj:TQRemoteObject;Q:TCustomXMLRTTI;ErrorNumber:integer;ErrorMessage:String) : TRemoteResponse;


implementation


procedure TQRemoteObjectProcessor.ProcessCall (RTTIENabler:TCustomXMLRTTI;RequestXML:String; var ResponseXML:String);
var Obj,Hold:TQRemoteObject;O:TObject; RRq:TRemoteRequest; RR:TRemoteResponse; Q:TCustomXMLRTTI;  idx:integer;
begin
  Q:=RTTIENABLER;
  RRq:= ReceiveRemoteCall(Q,RequestXML);
  idx:= self.ServiceIndex(RRq.service);
  if idx>-1 then
   begin
    Obj:= TQRemoteObject(fobjs[idx]);
    {Make a copy of the base object... for thread safety}
    try
    Hold:=TQRemoteObject(Obj.newinstance);
    Hold.create(Obj.service);
    hold.RTTIEnabler := Q;
    RRq.RTTIObject := hold;
    RRq.RTTIEnabler:=q;
    RRQ.LoadFromXML ('RemoteRequest',RequestXML);
    RR:= Hold.ProcessCall (RRq.command,RRq.Parameters);
    RR.RTTIObject := Hold;
    RR.RTTIEnabler:= Q;
    ResponseXML :=  RR.savetoXML ('RemoteResponse');
    RR.Free;
    finally
     HOld.free;{clean up!}
    end;
   end else
    begin
      RR:=TRemoteResponse.create;
      RR.RTTIEnabler:= Q;
      RR.ErrorNumber:=1;
      RR.ErrorMessage := 'Service ['+RRq.Service+'] Not Available.';
      ResponseXML :=  RR.savetoXML ('RemoteResponse');
      RR.Free;
    end;
   RRq.free;
end;

Constructor TQRemoteObjectProcessor.create;
begin
   fobjs:=tlist.create;
end;
destructor  TQRemoteObjectProcessor.destroy;
begin
 try
    while fobjs.count>0 do
     begin
       if assigned(TQRemoteObject(fobjs[0])) then TQRemoteObject(fobjs[0]).free;
       fobjs.delete(0);
     end;
 finally
    inherited destroy;
 end;
end;

function TQRemoteObjectProcessor.AddObject (Obj:TQRemoteObject):integer;
begin
  fobjs.add(Obj);
end;

procedure TQRemoteObjectProcessor.DeleteObject (index:integer);
begin
   if assigned(TQRemoteObject(fobjs[index])) then TQRemoteObject(fobjs[index]).free;
   fobjs.delete(index);
end;

function TQRemoteObjectProcessor.ObjectCount:integer;
begin
 result:=fobjs.count;
end;

function TQRemoteObjectProcessor.GetObject(index:integer):TQRemoteObject;
begin
  result:= TQRemoteObject(fobjs[index]);
end;

function TQRemoteObjectProcessor.ServiceIndex(Service:String):integer;
var found,i,max:integer; Obj:TQRemoteObject;
begin
max:=fobjs.count-1;
result:=-1;
for i:= 0 to max do
 begin
   Obj:= GetObject(i);
   if Obj.Service=Service then result:= i;
 end;
end;




function BuildResponse (Obj:TQRemoteObject;Q:TCustomXMLRTTI;ErrorNumber:integer;ErrorMessage:String) : TRemoteResponse;
var xmlout:String;  RR:TRemoteResponse;
begin
{Server will hand back the current time in an object}
  RR:=TRemoteResponse.create;
  RR.Service:= Obj.service;
  RR.RTTIEnabler := Q;
  RR.RTTIObject := Obj;
  RR.ErrorNumber := ErrorNumber;
  RR.ErrorMessage := ErrorMessage;
  result:=RR;
end;

function ReceiveRemoteCall (Q:TCustomXMLRTTI;RequestXML:String):TRemoteRequest;
var RRq:TRemoteRequest;
begin
  RRq:=TRemoteRequest.create;
  RRq.RTTIEnabler:=Q;
  RRq.LoadFromXML ('RemoteRequest',RequestXML);
  result:=RRq;
end;

constructor TQRemoteObject.create (Service:String);
begin
 fservice:=Service;
end;

function TQRemoteObject.ProcessCall (Command:String;Parameters:TStrings):TRemoteResponse;
begin
 {do your processing and then call inherited(Command,Parameters}
end;


function MakeRemoteCall (Obj:TXMLAware;URL,Service,Command:String):TRemoteResponse;
var Q:TCustomXMLRTTI; RR:TRemoteResponse; RRq:TRemoterequest;
    postlines,readlines:tstringlist;ms:Tmemorystream; Client:TIdHTTP;
    raiseerr:integer;Msg:String; Err:Exception;
begin
{Server will hand back the current time in an object}
  raiseerr:=0;
  try
  Client:=TIdHTTP.create(nil);
  Q:=Obj.RTTIEnabler;
  RRq:=TRemoteRequest.create;
  RRQ.rttiobject:=Obj;
  RRq.rttienabler:= Q;
  RRQ.service:=Service;
  RRQ.command:=Command;
  postlines:=tstringlist.create;
  postlines.text:= RRQ.SavetoXML('RemoteRequest');
  ms:=Tmemorystream.create;
  Client.Post(URL,postlines,ms);
  readlines:=tstringlist.create;
  ms.seek(0,0);
  readlines.loadfromstream(ms);
  RR:=TRemoteResponse.create;
  RR.RTTIEnabler := Q;
  RR.RTTIObject:= Obj;
  RR.LoadFromXML ('RemoteResponse',readlines.text);
  raiseerr:=RR.ErrorNumber ;
  msg:=rr.ErrorMessage ;
  rr.free;
  except on E:Exception do
   begin
    raiseerr:=2;
    msg:=E.Message;
   end
  end;

  if assigned(RRQ) then RRQ.free;
  if assigned(Client) then Client.free;
 if raiseerr>0 then
  begin   
   Err:=Exception.create(Msg);
   raise(err);         
  end;
end;

procedure TQRemoteObject.RemoteCall (URL,Command:String);
begin
  MakeRemoteCall (self,URL,fservice,Command);
end;        

end.
