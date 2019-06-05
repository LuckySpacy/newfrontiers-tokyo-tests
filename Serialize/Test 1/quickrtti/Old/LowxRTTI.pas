unit LowxRTTI;

interface
uses classes,typinfo,sysutils,lowx,QuickRTTI ;

type

TLowXQuickRTTI = class (TCustomQuickRTTI)
 protected
   function outputXML :String; override;
   procedure inputXML (sXML:String); override;
 public
    property Value;
 published
   property RTTIObject;
   property InTagProperties;
   property ShowType;
   property ObjectID;
   property XML:String read outputXML write inputXML;
   property TagName;
 end;


implementation

function TLowXQuickRTTI.outputXML :String;
var i,j,k,max:integer; typname:ttypekind;  q,q2:TLowXQuickRTTI; holdstream:tmemorystream;
  s:TStrings;L:TList; C:TCollection;holdtags,cname,thisprop,outhold:String; ftags:TStringlist;
begin
 outhold:='';
 uniquestring(outhold);
 if showtype then
   outhold:='<'+tagname+' TYPE="'+RTTIObject.ClassName+'"'
   else
   outhold:='<'+tagname;


 if objectid<>'' then outhold:=outhold+' ID="'+objectid+'"';
 if intagproperties<>'' then
 begin
 ftags:=tstringlist.create;
 holdtags:=intagproperties;
 while pos(',',holdtags)<>0 do holdtags:=replacestring(holdtags,',',#13#10);
 ftags.text:=holdtags;
 end;
 if intagproperties<>'' then
 begin
  for i:= 0 to propertycount-1 do
  if ftags.indexof(propertynames(i))>-1 then
  begin
  thisprop:=propertynames(i);
  typname :=  self.propertyTypes (i);
  if typname<>tkclass then
   outhold:=outhold+' '+thisprop+'="'+GetValue(thisprop)+'" ';
  end;
 end;

 // The above line allows us to have collections of items.. like tlist
 outhold:=outhold+'>'+#13+#10;
 for i:= 0 to propertycount-1 do
 begin
 thisprop:=propertynames(i);
 typname :=  self.propertyTypes (i);
  if typname<>tkclass then
    begin
    if intagproperties='' then
     outhold:=outhold+' <'+thisprop+'>'+GetValue(thisprop)+'</'+thisprop+'>'+#13+#10
     else
     if ftags.indexof(propertynames(i))=-1 then
            outhold:=outhold+' <'+thisprop+'>'+GetValue(thisprop)+'</'+thisprop+'>'+#13+#10
    end
   else
   begin
       if not(assigned(cache)) then cache:= tLowXQuickRTTi.create;
       Cache.rttiobject:=TPersistent(Childobject(thisprop));
       Cache.TagName := thisprop;
       outhold:=outhold+ Cache.XML;
   end;

 end;

   if  RTTIObject is TStrings then
   begin
    s:=TStrings(self.rttiobject);
    for k:= 0 to s.Count-1 do
    outhold:=outhold+'<LINE INDEX="'+inttostr(k)+'">' + s[k] + '</LINE>';
   end;

   if  RTTIObject is TCollection then
   begin
    c:=Tcollection(self.rttiobject);

     if not(assigned(cache)) then cache:= tLowXQuickRTTi.create;
    max:= c.count-1;
    for k:= 0 to max do
     begin
      {create and output any internal items}
      if C.Items[k] is TPersistent then
        begin
      //    q2:=TQuickRTTI.create;
       //   q2.rttiobject:=TPersistent(C.Items[k]) ;
       //   q2.tagname:='ITEM'    ;
       // if not(assigned(qcache)) then Qcache:=TQuickrtti.create;
         cache.rttiobject:=TPersistent(C.Items[k]) ;
         cache.tagname:='ITEM'    ;
        // outhold:=outhold+ q2.outputXML ;
          outhold:=outhold+ cache.XML;
        //  q2.free;
        end;
     end;

   end;
 outhold:=outhold+'</'+tagname+'>'+#13+#10;

 result:= outhold;
end;

procedure TLowXQuickRTTI.inputXML (sXML:String);
var thisclass,thisobj,subobj,thisprop:String; i,j,k,max,cmax:integer;s:TStringlist;c:TCollection;ci:TCollectionItem;
q:TLowxQuickRTTI; ftags:TStringlist;holdtags:String;
begin
{OK.. I could get a whole list of objects.. but since
I'm delaing with em one at a time..}
thisclass:= RTTIObject.ClassName;
thisobj:=GetTagString (sXML,tagname);
{Now let RTTI discover itself in the XML!}
max:=propertyCount-1;

if intagproperties<>'' then
begin
 ftags:=tstringlist.create;
 holdtags:=intagproperties;
 while pos(',',holdtags)<>0 do holdtags:=replacestring(holdtags,',',#13#10);
 ftags.text:=holdtags;
end;

for i:= 0 to max do
 begin
  thisprop:= propertynames(i);
  if self.propertyTypes(i) <> tkClass then
   begin
      if intagproperties='' then
        SetValue(thisprop,GetTagData(thisobj,thisprop))
      else
        begin
        if ftags.indexof(thisprop)=-1 then
          SetValue(thisprop,GetTagData(thisobj,thisprop))
          else
          SetValue(thisprop,GetTagProperty(sXML,tagname,thisprop))

        end;
   end
   else
   begin
     subobj:=GetTagString (thisobj,thisprop) ;
     //TQuickRtti(objs.objects[objs.indexof(props[i])]).xml:=subobj;
     //QCache.RTTIObject:= TPersistent(objs.objects[objs.indexof(props[i])]);
     Cache.RTTIObject:= TPersistent(childobject(thisprop));
     Cache.TagName := thisprop;
     Cache.xml:=subobj;
     thisobj:=Replacestring(thisobj,subobj,'');
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
    s.free;
   end;

   if  RTTIObject is TCollection then
   begin
    if not(assigned(cache)) then cache:=tLowXQuickRTTi.create;
    //q:=TQuickRTTi.create;
    c:=Tcollection(self.rttiobject);
    c.Clear;
    s:=getTagList(sXML,'ITEM');
    cmax:=s.count-1;
    for k:= 0 to cmax do c.add;
    for k:= 0 to cmax do
     begin
      {create and output any internal items}
      //ci:= c.Add;
      {q.rttiobject:=TPersistent(C.Items[k]) ;
      q.tagname:='ITEM'    ;
      q.XML:=s[k] ;}
      cache.rttiobject:=TPersistent(C.Items[k]) ;
      cache.tagname:='ITEM'    ;
      cache.XML:=s[k] ;
     end;
      //q.free;
   end;

end;

end.
