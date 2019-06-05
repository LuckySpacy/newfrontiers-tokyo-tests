unit QuickRTTI;

interface
uses classes,typinfo,sysutils;

type

TCustomQuickRTTI = class (TPersistent)
 private
   fobj:TPersistent; PList:PPropList;
   props:tstringlist;
   objs:TStringlist;
   fval,ftag,fobjid,fintag:String;
   fshowtype:boolean;
   QCache:TCustomQuickRTTI;
 protected
   function  outputXML :String; virtual;abstract;
   procedure inputXML (sXML:String); virtual;abstract;
   procedure SetValue (Fieldname:String;Value:String);
   function  GetValue (Fieldname:String):String;
   procedure SetObject (o:TPersistent);
   property  Cache:TCustomQuickRTTI read QCache write QCache;
 public
   constructor create;
   destructor destroy;override;
   function propertyCount:integer;
   function indexof(name:String):Integer;
   function propertynames(index:integer):String;
   function propertyVarTypes(index:integer):String;
   function propertyTypes(index:integer):TTYpeKind;
   function ChildObjectCount:integer;
   function ChildObjectName(index:integer):String;
   function ChildObject(name:String):TObject;
   property Value[Fieldname:String]:String read GetValue write SetValue;
 published
   property RTTIObject:TPersistent read fobj write SetObject;
   property InTagProperties:String read fintag write fintag; {comma delim}
   property ShowType:Boolean read fshowtype write fshowtype;
   property ObjectID:String read fobjid write fobjid;
   property XML:String read outputXML write inputXML;
   property TagName:String read ftag write ftag;
 end;


implementation


function TCustomQuickRTTI.ChildObjectCount:integer;
begin
  result:=objs.count;
end;

function TCustomQuickRTTI.ChildObjectName(index:integer):String;
begin
result:=objs[index];
end;

function TCustomQuickRTTI.ChildObject(name:String):TObject;
var idx:integer;
begin
idx:= objs.indexof(name);
result:=nil;
if idx>-1 then
  result:=TCustomQuickRTTI(objs.objects[idx]).RTTIObject;
end;

constructor TCustomQuickRTTI.create;
begin
  fshowtype:=true;
  fintag:='';
  objs:=tstringlist.create;
  props:=tstringlist.create;
  ftag:=''; 
end;

destructor TCustomQuickRTTI.destroy;
//var tempq:TQuickRTTI;
begin
try
if assigned(objs) then
 while objs.count>0 do
  begin
  //  tempq:=TCustomQuickRTTI(objs.objects[objs.count-1]);
  //  tempq.free;
    objs.delete(objs.count-1);
  end;
  objs.free;    //KV
  props.free;   //KV
  if assigned(QCache) then begin
       QCache.rttiobject:=nil;
       QCache.free;
     end;
  finally
    inherited destroy;
end;
end;

procedure TCustomQuickRTTI.SetObject (o:TPersistent);
// Modified by KV
var
  Count, PropCount : integer;
  PTI:PTypeInfo;
  PTempList : PPropList;
  Tinfo:TPropInfo;
  i:integer;
  //vin:variant;
  tempq:TCustomQuickRTTI;
  ttinfo:TTypeinfo;
begin
if assigned(o) then
begin
if not(assigned(props)) then props:=tstringlist.create;
props.clear;
fobj:=o;
PTI:=o.ClassInfo ;
PropCount := GetTypeData(PTI)^.PropCount;
if PropCount = 0 then exit;

GetMem(PTempList, PropCount * SizeOf(Pointer));
try
  PList:= PTempList;
  Count := GetPropList(PTI,[ tkInteger, tkChar, tkEnumeration, tkFloat,
      tkString, tkSet, tkClass, tkMethod, tkWChar, tkLString, tkWString,
      tkVariant, tkArray, tkRecord, tkInterface, tkInt64, tkDynArray],
      PList);

  {getting the list... but I'm pretty much trying to ignore
  method calls for this version}
  for i:= 0 to Count-1 do
  if  assigned(Plist[i]) then
   begin
     Tinfo:= Plist[i]^;
     //vin:=GetPropValue(fobj,Tinfo.Name,True);

     ttinfo:=tinfo.PropType^^;
     if ttinfo.kind=tkClass  then
        begin
         tempq:=TCustomQuickRTTI.create;
         tempq.RTTIObject := TPersistent(GetObjectProp(fobj,Tinfo.name));
         objs.AddObject (Uppercase(Tinfo.Name),tempq)  ;
         tempq.TagName := Tinfo.name;
        end;
     props.addobject(Uppercase(Tinfo.Name), Pointer(PList[i]) );
   end;
  finally
    FreeMem(PTempList, PropCount * SizeOf(Pointer));
  end;
end;
end;

function TCustomQuickRTTI.propertyCount:integer;
begin
result:=-1;
if assigned(props) then result:=props.count;
end;


function TCustomQuickRTTI.propertynames(index:integer):String;
var ppos:integer;
begin
result:='';
if assigned(props) then result:=props[index];

end;

function TCustomQuickRTTI.indexof(name:String):Integer;
begin
if assigned(props) then result:=props.IndexOf (Uppercase(name));
end;

function TCustomQuickRTTI.propertyVarTypes(index:integer):string;
var Tinfo:TPropInfo;
begin
result:='';
if assigned(props) then
begin
  Tinfo:=TPropinfo(Pointer(props.objects[index])^);
  result:=Tinfo.PropType^.name;
end;

end;

function TCustomQuickRTTI.propertyTypes(index:integer):TTYpeKind;
var Tinfo:TPropInfo;
begin
 
if assigned(props) then
begin
  Tinfo:=TPropinfo(Pointer(props.objects[index])^);
  result:=Tinfo.PropType^.kind;
end;

end;

procedure TCustomQuickRTTI.SetValue (Fieldname:String;Value:String);
var  vin:Variant; fname:Shortstring;
begin
 if assigned(fobj) then
  begin
   fname:=fieldname;
   Vin:=Value;
   SetPropValue(fobj,fName,Vin);
  end;
end;

function TCustomQuickRTTI.GetValue (Fieldname:String):String;
var v,vin:Variant;
  fname,sname,ename:Shortstring;
  ppos,idx:integer; p:TPersistent;//q:TCustomQuickRTTI;
begin
 result:='';
 if assigned(fobj) then
  begin
   fname:=fieldname;
   ppos:=pos('.',fname);
   if ppos>0 then begin
        sname:= copy(fname,1,ppos-1);
        ename:= copy(fname,ppos+1,length(fname)-ppos-1)
        end;

   if ppos>1 then
    begin
      {Property.anotherproperty}
      idx:=objs.indexof(sname);
      if idx>0 then
       begin
        // q:=TCustomQuickRTTI(objs.objects[idx]);
         p:=TPersistent(objs.objects[idx]);
         QCache.RTTIObject := p;
         //result:=q.Value[ename];
         result:=QCache.value[ename];
       end;
    end
   else
     vin:=GetPropValue(fobj,fName,True);

   Varcast(v,vin,varString);
   result:=vin;
   end;
end;

end.

{
This file is released under an MIT style license as detailed at opensource.org.
Just don't preteend you wrote it, and leave this comment in the text, and
I'll be happy.  Consider it my resume :)

April 17,2000 Michael Johnson
 father@bigattichouse.com
 www.bigattichouse.com

Quick RTTI gives you simple string based access to RTTI data in any
RTTI capable component.  WIth the addition of my lowx and strutils you
can also read and write basic XML structures based off of your component.
SUPER easy.

Just set RTTIObject:= some TPersistent descendant (any TComponent) and you will have
nice string based access to all its fields by name... cool huh.

I am testing an "Object Shell" that will allow using QuickRTTI and
Toadbase to use/store RTTI Objects thru memory mapped files, ie..
web based persistence.. I know, why not use CORBA..

 hell, in the
words of Disney via Mr W.T.Pooh "...I wouldn't climb this tree / if a bear
flew like a bee / but I wouldn't be a bear then / so I guess I wouldn't
care then..."

Perhaps having the simple ability to convert TComponents to and from XML
will open up a new world for delphi... now to work on RPC !..
}
