unit fsQuickRTTI;

interface
uses classes,typinfo,sysutils,fslowx,dialogs,faststrings,faststringfuncs;

type
{
The Faststrings library has a "cardware" type license.
If you need to use it, please review the license and contact the author.

In simple objects, it doesn't seem to make things go much faster.
}

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

TQuickRTTI = class (TPersistent)
 private
  fobj:TPersistent; PList:PPropList;
  props:tstringlist; proptypes:TList;
  classcache:String;
  objs:TStringlist;
   ftag:String;
   fid:integer;
   holdQ:TQuickRTTI;
 protected
   function outputXML :String;
   procedure inputXML (sXML:String);
   procedure SetValue (Fieldname:String;Value:String);
   function GetValue (Fieldname:String):String;
   procedure SetObjects (Fieldname:String;Value:TObject);
   function GetObjects (Fieldname:String):TObject;
   procedure SetObject (o:TPersistent);
 public
   constructor create;
   destructor destroy;override;
   function propertyCount:integer;
   function indexof(name:String):Integer;
   function propertynames(index:integer):String;
   function propertyVarTypes(index:integer):String;
   function propertyTypes(index:integer):TTYpeKind;
   property Value[Fieldname:String]:String read GetValue write SetValue;
   property Objects[Fieldname:String]:TObject read GetObjects write SetObjects;
 published
   property RTTIObject:TPersistent read fobj write SetObject;
   property XML:String read outputXML write inputXML;
   property TagName:String read ftag write ftag;
   property ID:integer read fid write fid;
 end;

function TypeKindToVarType (tk:TTypeKind):integer;


implementation

function TypeKindToVarType (tk:TTypeKind):integer;
begin
result:=-1;
CASE tk of
  tkInteger:     result:=varInteger  ;
  tkChar:        result:=varString  ;
{  tkEnumeration: result:=var  ;}
  tkFloat:       result:=varDouble  ;
  tkString:     result:=varString  ;
{  tkClass:      result:=var  ;
  tkMethod:     result:=var  ;}
  tkWChar:      result:=varString  ;
  tkLString:    result:=varString  ;
  tkWString:    result:=varString  ;
  tkVariant:    result:=varVariant  ;
  tkArray:      result:=varArray  ;
  tkRecord:     result:=varArray  ;
  tkInterface:  result:=varDispatch  ;
  tkInt64:   result:=varInteger  ;
  tkDynArray: result:=varArray  ;
end;
end;

constructor TQuickRTTI.create;
begin
  objs:=tstringlist.create;
  props:=tstringlist.create;
  proptypes:=tlist.create;
  ftag:='';
  fid:=-1;
end;

destructor TQuickRTTI.destroy;
var tempq:TQuickRTTI;
begin
try
 while proptypes.count>0 do proptypes.delete(0);
 while objs.count>0 do
  begin
    tempq:=TQuickRTTI(objs.objects[objs.count-1]);
    tempq.free;
    objs.delete(objs.count-1);
  end;
  objs.free;
  props.free;
finally
    inherited destroy;
end;
end;

procedure TQuickRTTI.SetObject (o:TPersistent);
var PTI:PTypeInfo;List:TPropList;
   Tinfo :TPropInfo;   i  :integer;   vin:variant;
   tempq:TQuickRTTI; ttinfo:TTypeinfo; nc:String;
begin
if not(assigned(props)) then props:=tstringlist.create;

props.clear;
fobj:=o;
PTI:=o.ClassInfo ;
PList:= @List;
 GetPropList(PTI,[ tkInteger, tkChar, tkEnumeration, tkFloat,
    tkString, tkSet, tkClass, tkMethod, tkWChar, tkLString, tkWString,
    tkVariant, tkArray, tkRecord, tkInterface, tkInt64, tkDynArray],
    PList);

{getting the list... but I'm pretty much trying to ignore
method calls for this version}

for i:= 0 to 255 do
if  assigned(Plist[i]) then
 begin
   Tinfo:= Plist[i]^;
   vin:=GetPropValue(fobj,Tinfo.Name,True);

   ttinfo:=tinfo.PropType^^;
   if ttinfo.kind=tkClass  then
      begin
       tempq:=TQuickRTTI.create;
       tempq.RTTIObject := TPersistent(GetObjectProp(fobj,Tinfo.name));
       objs.AddObject (Uppercase(Tinfo.Name),tempq)  ;
       tempq.TagName := Tinfo.name;
       props.addobject(Uppercase(Tinfo.Name), Pointer(PList[i]));
//      if newtypes then proptypes.Add (Pointer(Ord(Tinfo.PropType^.kind)));
      end
     else
      begin
      props.addobject(Uppercase(Tinfo.Name), Pointer(PList[i]) );
//       if newtypes then proptypes.Add (Pointer(Ord(Tinfo.PropType^.kind)));
      end;
end;
 
end;

function TQuickRTTI.propertyCount:integer;
begin
result:=-1;
if assigned(props) then result:=props.count;
end;


function TQuickRTTI.propertynames(index:integer):String;
 
begin
result:='';
if assigned(props) then result:=props[index];

end;

function TQuickRTTI.indexof(name:String):Integer;
begin
result:=-1;
if assigned(props) then result:=props.IndexOf (Uppercase(name));
end;

function TQuickRTTI.propertyVarTypes(index:integer):string;
var Tinfo:TPropInfo;
begin
result:='';
if assigned(props) then
begin
  Tinfo:=TPropinfo(Pointer(props.objects[index])^);
  result:=Tinfo.PropType^.name;
end;

end;

function TQuickRTTI.propertyTypes(index:integer):TTYpeKind;
var Tinfo:TPropInfo;
begin
result:=TTypeKind(0);
//if assigned(props) then
//begin
  Tinfo:=TPropinfo(Pointer(props.objects[index])^);
  result:=Tinfo.PropType^.kind;
//end;

//if ((index>-1) AND (index<=proptypes.count-1)) then
//  result:=TTypeKind(longint(proptypes[index]));
end;
procedure TQuickRTTI.SetObjects (Fieldname:String;Value:TObject);
var idx:integer;
begin
  idx:= objs.indexof(UPPERCASE(fieldname));
  TQuickRTTI(objs.objects[idx]).RTTIObject:=TPersistent(Value);
end;

function TQuickRTTI.GetObjects (Fieldname:String):TObject;
var idx:integer;
begin
  idx:= objs.indexof(UPPERCASE(fieldname));
  result:=TQuickRTTI(objs.objects[idx]).RTTIObject;
end;

procedure TQuickRTTI.SetValue (Fieldname:String;Value:String);
var  vin,vhold :Variant; fname:Shortstring;
begin
   fname:=UPPERCASE(fieldname);
   Vin:=Value;

 {try to convert text dates just-in-case}
   if ((typinfo.PropType (fobj,fname)=tkFloat ) AND
        (Vartype(Vin)=varstring)) then
    if findfastpos('/',Vin)<>0 then
        begin
         vhold:=strtodatetime(Vin);
         vin:= vhold;
        end;

   SetPropValue(fobj,fName,Vin);
end;

function TQuickRTTI.GetValue (Fieldname:String):String;
var v,vin:Variant;
  fname,sname,ename:Shortstring;
  ppos,idx:integer;q:TQuickRTTi;
begin
   fname:=fieldname;
   ppos:=findfastpos('.',fname);
   if ppos>0 then begin
        sname:= copystr(fname,1,ppos-1);
        ename:= copystr(fname,ppos+1,length(fname)-ppos-1)
        end;

   if ppos>1 then
    begin
      {Property.anotherproperty}
      idx:=objs.indexof(sname);
      if idx>0 then
       begin
         q:=TQuickRTTI(objs.objects[idx]);
         result:=q.Value[ename];
       end;
    end
   else
     vin:=GetPropValue(fobj,fName,True);

   Varcast(v,vin,varString);
   result:=vin;
end;

function TQuickRTTI.outputXML :String;
var  i,k:integer; typname:ttypekind;  q,q2:TQuickRTTI; 
  s:TStrings;  C:TCollection; 
begin
 result:='<'+ftag+' TYPE="'+fobj.ClassName+'"' ;
 if fid>-1 then result:=result+' ID='+inttostr(fid)+' ';
 // The above line allows us to have collections of items.. like tlist
 result:=result+'>'+#13+#10;
 for i:= 0 to props.count-1 do
 begin
 typname :=  self.propertyTypes (i);
  if typname<>tkclass then
   result:=result+' <'+props[i]+'>'+GetValue(propertynames(i))+'</'+props[i]+'>'+#13+#10
   else
   begin
     q:= TQuickRTTI(objs.objects[objs.indexof(propertynames(i))]);
     result:=result+ q.outputxml ;
   end;

 end;

   if  RTTIObject is TStrings then
   begin
    s:=TStrings(self.rttiobject);
    for k:= 0 to s.Count-1 do
    result:=result + '<LINE INDEX="'+inttostr(k)+'">' + s[k] + '</LINE>';
   end;

   {if  RTTIObject is TList then
   begin
    L:=TList(self.rttiobject);
      q:=TQuickRTTI.create;
    for k:= 0 to s.Count-1 do
     begin
      {create and output any internal items

      if L[k] is TPersistent then
        begin
        q.rttiobject:=TPeristent(L[k])
        q.tagname:='ITEM'
        result:=result + q.outputXML ;
        end;
     end;
      q.free;
   end;                                    }
   if  RTTIObject is TCollection then
   begin
    c:=Tcollection(self.rttiobject);
    q2:=TQuickRTTI.create;
    for k:= 0 to c.Count-1 do
     begin
      {create and output any internal items}
      if C.Items[k] is TPersistent then
        begin
        q2.rttiobject:=TPersistent(C.Items[k]) ;
        q2.tagname:='ITEM'    ;
        result:=result + q2.outputXML ;
        end;
     end;
      q2.tagname:='';
      q2.free;

   end;
 result:=result+'</'+ftag+'>'+#13+#10;
end;

procedure TQuickRTTI.inputXML (sXML:String);
var thisclass,thisobj,subobj,hold,holdprop:String; i,j,k:integer;s:TStringlist;c:TCollection;ci:TCollectionItem;
q:TQuickRTTI; holdxml:String;
begin
{OK.. I could get a whole list of objects.. but since
I'm delaing with em one at a time..}
thisclass:= fobj.ClassName;
thisobj:=GetTagString (sXML,ftag);
{Now let RTTI discover itself in the XML!}
for i:= 0 to props.count-1 do
 begin
  if self.propertyTypes(i) <> tkClass then
   begin
   holdprop:=props[i];
   hold:=GetTagData(thisobj,holdprop);
   SetValue(holdprop,hold);
   hold:='';
   holdprop:='';
   end
   else
   begin
     subobj:=GetTagString (thisobj,props[i]) ;
     TQuickRtti(objs.objects[objs.indexof(props[i])]).xml:=subobj;
     thisobj:=FastReplace(thisobj,subobj,'');
     subobj:='';
   end;

 end;
 if  RTTIObject is TStrings then
   begin
   TStrings(RTTIObject).clear;
    s:=getTagList(sXML,'LINE');
    for j:= 0 to s.count-1 do
     begin
        s[j]:=GetTagData(s[j],'LINE');
     end;
    TStrings(RTTIObject).assign (s);
    s.clear;
    s.free;
   end;

   if  RTTIObject is TCollection then
   begin
    {This is incredibly slow..
     I can get 5X as much down w/out including a TCollection..
     what on earth could be so slow?}
    q:=TQuickRTTi.create;
    c:=Tcollection(self.rttiobject);
    c.Clear;
    s:=getTagList(sXML,'ITEM');
    for k:= 0 to s.Count-1 do
     begin
      {create and output any internal items}
      ci:= c.Add;
      q.rttiobject:=ci; //TPersistent(C.Items[k]) ;
      q.tagname:='ITEM'    ;
      q.XML:=s[k] ;
      ci:=nil;
     end;
      q.free;
      s.clear;
      s.free;
   end;

end;

end.
