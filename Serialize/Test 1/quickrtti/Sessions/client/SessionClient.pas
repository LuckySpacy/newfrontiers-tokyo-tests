unit SessionClient;

interface
uses Classes,sysutils,QuickRTTI,QRemote;

type


TSessionData = class(TCollectionItem)
 private
   fVarName,fData:String;
 published
   property Variable:String read fvarname write fvarname;
   property Data:String read fdata write fdata;
 end;

TSessionClient =class(TQRemoteObject)
 private
   fvars:TCollection;
   fsessionid:STring;
   fexpires:TDateTime;
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
   property Expiration:TDateTime read fexpires write fexpires;
 end;

implementation

constructor TSessionClient.Create(Service:String);
begin
 fvars:=TCollection.create(TSessionData);
 inherited create(Service);
 fexpires:=0;
end;

destructor TSessionClient.Destroy;
begin
 try
   fvars.clear;
   fvars.free;
 finally
  inherited destroy;
 end;
end;

function TSessionClient.IndexOfItem(Name:String):integer;
var i,max,idx:integer;uname:String;
begin
idx:=-1;
max:= fvars.count-1;
uname:=Uppercase(Name);
while ((i<=max) and (idx=-1)) do
 begin
   {variable is ALREADY uppercase.. see SetData}
   if  TSessiondata(fvars.items[i]).Variable=UName then idx:=i;
   inc(i);
 end;
result:=idx;
end;

procedure TSessionClient.SetValue (Name,Value:String);
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

function  TSessionClient.GetValue (Name:STring):String;
var idx:integer;
begin
idx:=IndexOfItem(Name);
result:='';
if idx>-1 then
 begin
    result:=TSessionData(fvars.items[idx]).Data;
 end;
end;

end.
