unit QuickRTTI;

interface
uses classes,typinfo,sysutils;

type
{See bottom for copyright info
*********

Version 2.1: July 13, 2001
Thanks, contributions, etc:
 *Ivan Lucena <lucena_ivan@hotmail.com> TCollection polymorphism problem
 *Mason Louie <kantide@yahoo.com> - discovering a problem with nil object properties. *fixed*
 *Ian Hayes <davout@dial.pipex.com> - FindTypes idea - desiding which property types you want to find
             also "exclude" - not yet implimented in 2.1
 *Kiriakos Vlahos <kvlahos@london.edu> - for the great MSDOM Enabler.
 *Vincent van der Vlis <vlisvjs@picoSOFT.co.za> - found the original set [] problem.
 *Michael Yui <ycomp@sympatico.ca> - for helping with some real-world testing.
 *Jeff Broadhead <Jeff@BrooklineTechnologies.com> - got me to implement Tcollections handling
 *Christopher C. Lichti <chlichti@mindspring.com> - for some interesting discussion -
                he's got an RTTI Object Dataset.. dataaware against objects.
 *Andrzej Ligudzinski <Andrzej.Ligudzinski@numeron.com.pl> - confirming an error in version 1.
}



{Base class to get RTTI info... without all the XML and stuff}
TRTTIEnabler = class (TPersistent)
 private
   i:TTYpekind;
   fobj:TPersistent; PList:PPropList;
   props:tstringlist;
   objs:TStringlist;
   fval,ftag,ftagclasstype:String;
   QCache:TRTTIEnabler;
   ffindTypes:TTypeKinds;
   fregister:TStringList;
 protected
   procedure SetValue (Fieldname:String;Value:String);
   function  GetValue (Fieldname:String):String;
   procedure SetObject (o:TPersistent);virtual;
   property  Cache:TRTTIEnabler read QCache write QCache;
 public
   constructor create;dynamic;
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
   procedure RegisterClass(classtype:TClass);
   procedure UnregisterClass(classtype:TClass);
   function  RegisteredCount:integer;
   function  RegisteredName(index:integer):String;
   function  Registered(index:integer):TClass;
   function  NewRegisteredCollectionItem (classname:String;collection:TCollection):TCollectionItem;
   function  NewRegisteredComponent (classname:String;Aowner:Tcomponent):TComponent;
 published
   property RTTIObject:TPersistent read fobj write SetObject;
   property TagName:String read ftag write ftag;
   property TagClassType:String read ftagclasstype write ftagclasstype;
   property FindTypes:TTypeKinds read ffindtypes write ffindtypes;
 end;

 TCustomXMLRTTI = class (TRTTIENABLER)
 private
   ftag,fobjid,fintag:String;
   fshowtype:boolean;
 protected
   function  outputXML :String; virtual;abstract;
   procedure inputXML (sXML:String); virtual;abstract;
   function  outputSchema :String; virtual;abstract;
   procedure inputSchema (sSchema:String); virtual;abstract;
   property  Cache;
 public
   constructor create; override;
   property Value;
 published
   property RTTIObject;
   property InTagProperties:String read fintag write fintag; {comma delim}
   property ShowType:Boolean read fshowtype write fshowtype;
   property ObjectID:String read fobjid write fobjid;
   property XML:String read outputXML write inputXML;
   property Schema:String read outputSchema write inputSchema;
   property TagClassType;
   property FindTypes;
 end;

 {
  To make life even more better... a "self" aware class to descend from.. dumps out its own
  XML using a parser you hand to it.
  }

TXMLAware = class(TPersistent)
 private
  fq: TCustomXMLRTTI;
 public
  function SaveToXML (sTagName:String):String;
  procedure LoadFromXML(sTagName,sXML:String);
  property  RTTIEnabler:TCustomXMLRTTI read fq write fq;
 end;



implementation

function TXMLAware.SaveToXML (sTagName:String):String;
begin
 if assigned(fq) then
  begin
    fq.RTTIObject :=self;
    fq.TagName := sTagName;
    result:= fq.XML ;
  end else Exception.Create('RTTIEnabler not assigned.');
end;                

procedure TXMLAware.LoadFromXML(sTagName,sXML:String);
begin
 if assigned(fq) then
  begin
    fq.RTTIObject :=self;
    fq.TagName := sTagName;
    fq.XML:=sXML ;
  end else Exception.Create('RTTIEnabler not assigned.');
end;



{CustomXMLRTTI}

constructor TCustomXMLRTTI.create;
begin
  inherited create;
  fshowtype:=true;
  fintag:='';
  ftag:='';
end;


function TRTTIEnabler.ChildObjectCount:integer;
begin
  result:=objs.count;
end;

function TRTTIEnabler.ChildObjectName(index:integer):String;
begin
result:=objs[index];
end;

function TRTTIEnabler.ChildObject(name:String):TObject;
var idx:integer;
begin
idx:= objs.indexof(name);
result:=nil;
if idx>-1 then
  result:=TRTTIEnabler(objs.objects[idx]).RTTIObject;
end;
function  TRTTIEnabler.RegisteredCount:integer;
begin
 result:=fregister.count;
end;

function  TRTTIEnabler.RegisteredName(index:integer):String;
var o:TObject;n:String;
begin
 o:= TObject(fregister.objects[index]);
 if o<>nil then
      n:=o.classname;
 result:= n;
end;

function  TRTTIEnabler.Registered(index:integer):TClass;
var OClass:TClass;
begin
 OClass:=TObject(fregister.objects[index]).classtype;
 result:= OClass;
end;

procedure TRTTIEnabler.RegisterCLass(classType:TClass);
var o:TObject; n:String;
begin
 n:=classtype.classname;
 if fregister.IndexOf(Uppercase(n))=-1 then
  begin
    if assigned(Cache) then Cache.RegisterClass (classtype);
    o:=classtype.NewInstance ;
    fregister.AddObject(Uppercase(classtype.ClassName) , o );
  end;
end;

procedure TRTTIEnabler.UnRegisterCLass(classType:TClass);
var idx:integer;
begin
   idx:= fregister.IndexOf(Uppercase(classtype.classname));
   if idx>-1 then
  begin
    if assigned(Cache) then  Cache.UnRegisterClass (classtype);
    TObject(fregister.objects[idx]).free;
    fregister.delete(idx);
  end;
end;


function  TRTTIEnabler.NewRegisteredCollectionItem (classname:String;collection:TCollection):TCollectionItem;
var idx:integer;o:TObject;ci:TCollectionItem;
begin
   idx:= fregister.IndexOf(Uppercase(classname));
   if idx>-1 then
  begin
   o:= fregister.objects[idx];
   ci:= TCollectionItem(o.NewInstance);
   ci.create(collection);
   result:=ci;
  end;
end;

function  TRTTIEnabler.NewRegisteredComponent (classname:String;Aowner:TComponent):TComponent;
var idx:integer;o:TObject;c :TComponent;
begin
   idx:= fregister.IndexOf(Uppercase(classname));
   if idx>-1 then
  begin
   o:= fregister.objects[idx];
   c:= TComponent(o.NewInstance);
   c.create(AOwner);
   result:=c;
  end;
end;

constructor TRTTIEnabler.create;
begin
  inherited create;
  objs:=tstringlist.create;
  props:=tstringlist.create;
  fregister:=Tstringlist.create;
  ffindtypes:=[ tkInteger, tkChar, tkEnumeration, tkFloat,
      tkString, tkSet, tkClass, tkMethod, tkWChar, tkLString, tkWString,
      tkVariant, tkArray, tkRecord, tkInterface, tkInt64, tkDynArray];
end;

destructor TRTTIEnabler.destroy;
var i:integer;
begin
try
if assigned(objs) then
 while objs.count>0 do
  begin
    TRTTIEnabler(objs.objects[0]).free;
    objs.delete(0);
  end;
  objs.free;    //KV
  props.free;   //KV

  for i:=0 to fRegister.Count-1 do  //Dean
   if assigned(fRegister.Objects[i]) then fRegister.Objects[i].free;  //Dean
  fRegister.Free; //Dean

  if assigned(QCache) then begin
       QCache.rttiobject:=nil;
       QCache.free;
     end;
  finally
    inherited destroy;
end;
end;

procedure TRTTIEnabler.SetObject (o:TPersistent);
// Modified by KV
var
  Count, PropCount : integer;
  PTI:PTypeInfo;
  PTempList : PPropList;
  Tinfo:TPropInfo;
  i:integer;
  //vin:variant;
  tempq:TRTTIEnabler;
  ttinfo:TTypeinfo;
  CT:TClass ;   max:integer;
begin
TagClassType:='nil';
if assigned(o) then
begin
  if Tagname='' then
     begin
        if o is TComponent then
          begin
          tagname:=TComponent(o).name
          end
          else
          begin
          ftag:=o.classname;
          delete(ftag,1,1) {trim the T}
          end;
     end;

       CT:=self.classtype;
       TagClassType:=o.classname;
      if not(assigned(cache)) then
       begin
        cache:= TRTTIEnabler(CT.NewInstance ) ;
        cache.create;
        cache.FindTypes := ffindtypes;
        max:=fregister.count-1 ;
        for i:= 0 to max do
         begin
           cache.RegisterClass(fregister.objects[i].classtype);
         end;
        end;

 while objs.count>0 do
  begin
    TRTTIEnabler(objs.objects[0]).free;
    objs.delete(0);
  end;

props.clear;
fobj:=o;
PTI:=o.ClassInfo ;
PropCount := GetTypeData(PTI)^.PropCount;
if PropCount = 0 then exit;

GetMem(PTempList, PropCount * SizeOf(Pointer));

try
  PList:= PTempList;
  Count := GetPropList(PTI,fFindTypes,
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
        // tempq:=  createcache  ;
        tempq:= TRTTIEnabler(CT.NewInstance) ;
        tempq.create;
        
        tempq.FindTypes := ffindtypes;
        tempq.RTTIObject := TPersistent(GetObjectProp(fobj,Tinfo.name));
        if assigned(tempq.rttiobject) then
          tempq.TagClassType := tempq.rttiobject.ClassName
         else
          tempq.TagClassType :='nil';
         objs.AddObject (Uppercase(Tinfo.Name),tempq)  ;
         tempq.TagName := Tinfo.name;
        end;
     props.addobject(Uppercase(Tinfo.Name), Pointer(PList[i]) );
   end;
  finally
    FreeMem(PTempList, PropCount * SizeOf(Pointer));
  end;
end else if tagname='' then TagName:='NULL';
end;

function TRTTIEnabler.propertyCount:integer;
begin
result:=-1;
if assigned(props) then result:=props.count;
end;


function TRTTIEnabler.propertynames(index:integer):String;
var ppos:integer;
begin
result:='';
if assigned(props) then result:=props[index];

end;

function TRTTIEnabler.indexof(name:String):Integer;
begin
if assigned(props) then result:=props.IndexOf (Uppercase(name));
end;

function TRTTIEnabler.propertyVarTypes(index:integer):string;
var Tinfo:TPropInfo;
begin
result:='';
if assigned(props) then
begin
  Tinfo:=TPropinfo(Pointer(props.objects[index])^);
  result:=Tinfo.PropType^.name;
end;

end;

function TRTTIEnabler.propertyTypes(index:integer):TTYpeKind;
var Tinfo:TPropInfo;
begin
if assigned(props) then
begin
  Tinfo:=TPropinfo(Pointer(props.objects[index])^);
  result:=Tinfo.PropType^.kind;
end;

end;

procedure TRTTIEnabler.SetValue (Fieldname:String;Value:String);
var  vin:Variant; fname:Shortstring;
begin
 if assigned(fobj) then
  begin
   fname:=fieldname;
   Vin:=Value;
   if Vin<>'' then
      SetPropValue(fobj,fName,Vin);
   if Vin='' then
   begin
   i:=PropType(fobj,fname);
   case i of
   tkSet :  SetPropValue(fobj,fName,'[]') ;{Sets don't like getting set to an empty string.}
   tkEnumeration: SetPropValue(fobj,fName,0);
   else
     SetPropValue(fobj,fName,Vin);
   end;{case}
   end;
  end;
end;

function TRTTIEnabler.GetValue (Fieldname:String):String;
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
July  13,2001 Michael Johnson / Big Attic House
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
