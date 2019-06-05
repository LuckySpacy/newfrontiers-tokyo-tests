unit LowxRTTI;

interface
uses classes,typinfo,sysutils,lowx,QuickRTTI ;

type

TLowXQuickRTTI = class (TCustomXMLRTTI)
 protected
   function outputXML :String; override;
   function outputSchema :String; override;
   procedure inputXML (sXML:String); override;
   procedure inputSchema (sSchema:String); override;
 public
    property Value;
    constructor create;override;
    destructor destroy;override;

 published
   property RTTIObject;
   property InTagProperties;
   property ShowType;
   property ObjectID;
   property XML:String read outputXML write inputXML;
   property TagName;
   property TagClassType;
   property FindTypes;
 end;


implementation

constructor TLowXQuickRTTI.create;
begin
  inherited create;
end;

destructor TLowXQuickRTTI.destroy;
begin
  try
   {}
  finally
    inherited destroy;
  end;
end;

function TLowXQuickRTTI.outputSchema :String;
begin
 result:='<Not Supported/>'
end;

procedure TLowXQuickRTTI.inputSchema (sSchema:String);
begin
 {Ignored}
end;

function TLowXQuickRTTI.outputXML :String;
var i,j,k,max:integer; typname:ttypekind;  q,q2:TLowXQuickRTTI; holdstream:tmemorystream;
  s:TStrings;L:TList; C:TCollection;holdtags,cname,thisprop,outhold,holdtag:String; ftags:TStringlist;
  clname:String;comp:TCOmponent;
begin
 outhold:='';
 uniquestring(outhold);
 {Thanks to for catching to error. I added a property "TagClassType" if the item is unassigned}

 if showtype then
   outhold:='<'+tagname+' TYPE="'+TagClassType+'"'
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
       Cache.rttiobject:=TPersistent(Childobject(thisprop));
       Cache.TagName := thisprop;
       outhold:=outhold + TLowXQuickRTTI(Cache).XML;
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

   //  if not(assigned(cache)) then cache:= createcache;
   
    max:= c.count-1;
      holdtag:=c.itemclass.classname;
      delete(holdtag,1,1);
    for k:= 0 to max do
     begin
      {create and output any internal items}
      if C.Items[k] is TPersistent then
        begin
          cache.rttiobject:=TPersistent(C.Items[k]) ;
          {   cache.tagname:= TPersistent(C.Items[k]).classname;}
          cache.tagname:= holdtag;
          outhold:=outhold+ TLowXQuickRTTI(Cache).xml;
        end;
     end;

   end;

   if  RTTIObject is TComponent then
   begin
    comp:=Tcomponent(self.rttiobject);
    max:= comp.componentcount-1;
    if max>0 then outhold:=outhold+'<COMPONENTS>';
    for k:= 0 to max do
     begin   
          cache.rttiobject:=Comp.components[k] ;
          cache.tagname:= trim(Comp.components[k].name);
          outhold:=outhold+ TLowXQuickRTTI(Cache).xml;
     end;
    if max>0 then  outhold:=outhold+'</COMPONENTS>';
  end;

 outhold:=outhold+'</'+tagname+'>'+#13+#10;
 fTags.free;//Dean
 result:= outhold;
end;

procedure TLowXQuickRTTI.inputXML (sXML:String);
var thisclass,thisobj,subobj,thisprop:String; i,j,k,max,cmax:integer;s:TStringlist;c:TCollection;ci:TCollectionItem;
q:TLowxQuickRTTI; ftags:TStringlist;holdtags,holdclassname,holdtag:String; 
begin
{OK.. I could get a whole list of objects.. but since
I'm delaing with em one at a time..}
if assigned(RTTIObject) then
begin
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
     TLowXQuickRTTI(Cache).xml:=subobj;
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
    c:=Tcollection(self.rttiobject);
    c.Clear;
   // s:=getTagList(sXML,'ITEM');
     holdtag:=c.itemclass.classname;
      delete(holdtag,1,1);
      
    s:=getTagList(sXML,holdtag);
    cmax:=s.count-1;            
    for k:= 0 to cmax do
       begin
           holdclassname:=GetTagProperty(s[k],holdtag,'TYPE');
           ci:= NewRegisteredCollectionItem(holdclassname,c); 
       end;
    for k:= 0 to cmax do
     begin
      {create and output any internal items}
      //ci:= c.Add;
      {q.rttiobject:=TPersistent(C.Items[k]) ;
      q.tagname:='ITEM'    ;
      q.XML:=s[k] ;}
      cache.rttiobject:=TPersistent(C.Items[k]) ;
     // cache.tagname:='ITEM'    ;
      cache.tagname:=holdtag;
      TLowXQuickRTTI(Cache).XML:=s[k] ;
     end;
      //q.free;
     s.Free//Dean
   end;
   fTags.Free;//Dean

 end; {if assigned RTTIObject}
end;

end.
