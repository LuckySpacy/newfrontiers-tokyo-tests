unit SessionServer;

interface
uses Classes,sysutils,QuickRTTI,QRemote,filectrl,guids,windows;

type


TSessionData = class(TCollectionItem)
 private
   fVarName,fData:String;
 published
   property Variable:String read fvarname write fvarname;
   property Data:String read fdata write fdata;
 end;

TSessionServer =class(TQRemoteObject)
 private
   fvars:TCollection; fsessionid:String;
   function IndexOfItem(Name:String):integer;
   procedure SetValue (Name,Value:String);
   function  GetValue (Name:STring):String;
 public
   constructor Create(Service:String);override;
   destructor Destroy;override;
   property Values[name:STring]:String read getvalue write setvalue; default;
 published
   property SessionID:String read fsessionid write fsessionid;
   property Variables:TCollection read fvars write fvars;
   function ProcessCall (Command:String;Parameters:TStrings):TRemoteResponse;override;
 end;

implementation

constructor TSessionServer.Create(Service:String); 
begin
 fvars:=TCollection.create(TSessionData);
 inherited create(service);
end;

destructor TSessionServer.Destroy;
begin
 try
   fvars.clear;
   fvars.free;
 finally
  inherited destroy;
 end;
end;

function TSessionServer.IndexOfItem(Name:String):integer;
var i,max,idx:integer;uname:String;
begin
idx:=-1;
max:= fvars.count-1;
uname:=Uppercase(Name);
while ((i<=max) and (idx=-1)) do
 begin
   {variable is ALREADY uppercase.. see SetData}
   if  TSessionData(fvars.items[i]).Variable=UName then idx:=i;
   inc(i);
 end;
result:=idx;
end;

procedure TSessionServer.SetValue (Name,Value:String);
var idx:integer; SD:TSessionData;
begin
idx:=IndexOfItem(Name);
if idx>-1 then
 begin
   TSessionData(fvars.items[idx]).Data:=Value;
 end else
  begin
    SD:=TSessionData(fvars.add);
    SD.Variable:=Uppercase(NAME);
    SD.Data:=Value;
  end;
end;

function  TSessionServer.GetValue (Name:STring):String;
var idx:integer;
begin
idx:=IndexOfItem(Name);
result:='';
if idx>-1 then
 begin
    result:=TSessionData(fvars.items[idx]).Data;
 end;
end;

function TSessionServer.ProcessCall (Command:String;Parameters:TStrings):TRemoteResponse;
var f:tStringlist;wd:Pchar;workingdir:String;
begin
 result:=TRemoteResponse.create;
 result.RTTIObject := self;
 result.Service :=    self.service;
 result.ErrorNumber := 0;

{Here is where you process and use your storage mechanism... when you get to this point, your
object is populated as it was on the client side... process yourself and return yourself or
an error}

{
for my example I am creating a folder in the system directory which will hold each session as a separate file.
I would recommend using a SQL Database instead
}
 {Find out where windows is located}
 wd:=stralloc(1024);
 GetWindowsDirectory(wd,1024);
 workingdir:=strpas(wd)+'\QSessions\';
 forcedirectories(workingdir);
 f:=tstringlist.create;

if Uppercase(command)='CREATE' then
 begin
   if trim(fsessionid)='' then fsessionid:= CreateObjectID ;{GUIDS.pas}
   f.text:= self.SaveToXML('Sessions');
   f.savetofile(workingdir+fsessionid+'.dat');
 end;

if Uppercase(command)='GET' then
if fileexists (workingdir+fsessionid+'.dat') then
 begin
   f.loadfromfile(workingdir+fsessionid+'.dat');
   self.LoadFromXML('Sessions',f.text);
 end else
  begin
    result.ErrorNumber :=1;
    result.ErrorMessage := 'Session Doesn''t Exist.'
  end;

if Uppercase(command)='SET' then
if fileexists (workingdir+fsessionid+'.dat') then
 begin
   f.text:= self.SaveToXML('Sessions');
   f.savetofile(workingdir+fsessionid+'.dat');
 end else
  begin
    result.ErrorNumber :=1;
    result.ErrorMessage := 'Session Doesn''t Exist.'
  end;

if Uppercase(command)='DESTROY' then
 begin
  sysutils.DeleteFile(workingdir+fsessionid+'.dat');
 end;

end;

end.
