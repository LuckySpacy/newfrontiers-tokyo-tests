unit DOMQuickRTTI;

interface
uses classes,typinfo,sysutils,QuickRTTI, MSXML2_TLB, Dialogs;

type

{
This file is released under an MIT style license as detailed at opensource.org.
Just don't preteend you wrote it, and leave this comment in the text, and
I'll be happy.  Consider it my resume :)

www.bigattichouse.com
www.delphi-programming.com

}
TDOMQuickRTTI = class (TPersistent)
 private
   fobj:TPersistent;
   PList:PPropList;
   props:tstringlist;
   objs:TStringlist;
   ftag,fobjid:String;
   fid:integer;
   fOutputSchemaInfo: boolean;
 protected
   function  outputXML :String; override;
   procedure inputXML (sXML:String); override;
   procedure SetValue (Fieldname:String; Value:String);
   function GetValue (Fieldname:String):String;
   procedure SetObject (o:TPersistent);
   function dtType(TypeKind:TTypeKind):string;
 public
   constructor create;
   destructor destroy;override;
   function propertyCount:integer;
   function indexof(name:String):Integer;
   function propertynames(index:integer):String;
   function propertyVarTypes(index:integer):String;
   function propertyTypes(index:integer):TTypeKind;
   property Value[Fieldname:String]:String read GetValue write SetValue;
   function  outputDOMXML(Doc : IXMLDOMDocument2) :IXMLDOMElement;
   procedure inputDOMXML (DomElem:IXMLDOMElement);
   procedure CreateSchemas(Schemas : IXMLDOMSchemaCollection);
published
   property RTTIObject:TPersistent read fobj write SetObject;
   property ObjectID:String read fobjid write fobjid;
   property XML:String read outputXML write inputXML;
   property TagName:String read ftag write ftag;
   property ID:integer read fid write fid;
   property OutputSchemaInfo: boolean read fOutputSchemaInfo write fOutputSchemaInfo;
 end;


implementation
constructor TQuickRTTI.create;
begin
  objs:=tstringlist.create;
  props:=tstringlist.create;
  ftag:='';
  fid:=-1;
  fOutputSchemaInfo := False;
end;

destructor TQuickRTTI.destroy;
var tempq:TQuickRTTI;
begin
try
 while objs.count>0 do
  begin
    tempq:=TQuickRTTI(objs.objects[objs.count-1]);
    tempq.free;
    objs.delete(objs.count-1);
  end;
  objs.free;    //KV
  props.free;   //KV
finally
    inherited destroy;
end;
end;

procedure TQuickRTTI.SetObject (o:TPersistent);
// Modified by KV
var
  Count, PropCount : integer;
  PTI:PTypeInfo;
  PTempList : PPropList;
  Tinfo:TPropInfo;
  i:integer;
  //vin:variant;
  tempq:TQuickRTTI;
  ttinfo:TTypeinfo;
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
         tempq:=TQuickRTTI.create;
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
  result := -1;  //KV
  if assigned(props) then
    result:=props.IndexOf (Uppercase(name))
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

if assigned(props) then
begin
  Tinfo:=TPropinfo(Pointer(props.objects[index])^);
  result:=Tinfo.PropType^.kind;
end else
  Raise Exception.Create('Internal Error');  //KV

end;

procedure TQuickRTTI.SetValue (Fieldname:String;Value:String);
var  vin:Variant; fname:Shortstring;
begin
   fname:=fieldname;
   Vin:=Value;
   SetPropValue(fobj,fName,Vin);
end;

function TQuickRTTI.GetValue (Fieldname:String):String;
var v,vin:Variant;
  fname,sname,ename:Shortstring;
  ppos,idx:integer;q:TQuickRTTi;
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
         q:=TQuickRTTI(objs.objects[idx]);
         result:=q.Value[ename];
       end;
    end
   else
     vin:=GetPropValue(fobj,fName,True);

   Varcast(v,vin,varString);
   result:=vin;
end;

function TQuickRTTI.outputXML(Doc: IXMLDOMDocument2): IXMLDOMElement;
{
  Use the MSXML parser to create the object representation as an IXMLDomElement.
  Then use the IXMLDomElement.xml property to get the XML object representation.
  The RTTI property OutputSchemaInfo determines whether Namespace schema info is included.
}

var
  i,k:integer;
  typname:ttypekind;
  q:TQuickRTTI;
  s:TStrings;
  C:TCollection;
  DomNode, DomNode1 : IXMLDOMNode;
begin
  Result := Doc.createElement(TagName);
  Result.setAttribute('TYPE',fobj.ClassName);
  if OutputSchemaInfo then
    Result.setAttribute('xmlns','x-schema:'+'delphi.'+RTTIObject.ClassName+'.'+TagName+'.xml');
  if fid>-1 then
    Result.setAttribute('ID',inttostr(fid));
  if fobjid<>'' then
    Result.setAttribute('ID',fobjid);
  //  The above line allows us to have collections of items.. like tlist
  for i:= 0 to props.count-1 do
  begin
    typname :=  self.propertyTypes (i);
    if typname<>tkclass then begin
      DomNode := Doc.CreateNode(NODE_ELEMENT,  props[i], '');
      DomNode1 := Doc.CreateNode(NODE_TEXT,  '', '');
      DomNode1.nodeValue := GetValue(propertynames(i));
      DomNode.appendChild(DomNode1);
      Result.appendChild(DomNode);
    end else begin
      q:= TQuickRTTI(objs.objects[objs.indexof(propertynames(i))]);
      q.OutputSchemaInfo := OutputSchemaInfo;
      Result.appendChild(q.outputDomXML(Doc));
    end;
  end;

 if  RTTIObject is TStrings then begin
   s:=TStrings(self.rttiobject);
   for k:= 0 to s.Count-1 do begin
     DomNode := Doc.CreateNode(NODE_ELEMENT,  'LINE', '');
    (DomNode as IXMLDOMElement).setAttribute('INDEX',inttostr(k));
     DomNode1 := Doc.CreateNode(NODE_TEXT,  '', '');
     DomNode1.nodeValue := s[k];
     DomNode.appendChild(DomNode1);
     Result.appendChild(DomNode);
    end;
  end;

  if  RTTIObject is TCollection then begin
    c:=Tcollection(self.rttiobject);
    q:=TQuickRTTI.create;
    q.OutputSchemaInfo := OutputSchemaInfo;
    for k:= 0 to c.Count-1 do begin
      {create and output any internal items}
      if C.Items[k] is TPersistent then begin
        q.rttiobject:=TPersistent(C.Items[k]) ;
        q.tagname:='ITEM'    ;
        Result.appendChild(q.outputDomXML(Doc));
      end;
    end;
    q.free;
  end;
end;

procedure TQuickRTTI.inputXML(DomElem: IXMLDOMElement);
{
  The equivalent to inputXML using the XMLparser.  Can optionally validate
  the XML file using the Schema information created by CreateSchemas.
  See the quicktest example for how to do this.
}
var
  q:TQuickRTTI;
  Node : IXMLDomNode;
  Index, i : integer;
begin
  q:=TQuickRTTi.create;
  if RTTIObject is TStrings then TStrings(RTTIObject).clear;
  if RTTIObject is TCollection then TCollection(self.rttiobject).Clear;

  for i := 0 to DomElem.ChildNodes.length - 1 do begin
    Node := DomElem.ChildNodes.item[i];
    if Node.NodeType = NODE_ELEMENT then begin
      if (RTTIObject is TStrings) and (Node.NodeName = 'LINE') then
        TStrings(RTTIObject).Add(Node.Text)
      else if (RTTIObject is TCollection) and (Node.NodeName = 'ITEM') then begin
        q.RTTIObject := TCollection(self.rttiobject).Add;
        q.inputDOMXML(Node as IXMLDOMElement);
      end else begin
        Index := IndexOf(Node.nodeName);
        if Index < 0 then continue;
        if propertyTypes(Index) = tkClass then
          TQuickRtti(objs.objects[objs.indexof(props[Index])]).inputDomXML(Node as IXMLDOMElement)
        else
          SetValue(props[Index],Node.Text);
      end;
    end;
  end;
  q.free;
end;

function GetEnumNames(PTD : PTypeData): string;
var
  i : integer;
  P: ^ShortString;
begin
  P := @PTD^.NameList;
  for i := PTD.MinValue to PTD.MaxValue do begin
    Result := Result + P^;
    if i < PTD.MaxValue then begin
      Inc(Integer(P), Length(P^) + 1);
      Result := Result + '';
    end;
  end;
end;

procedure TQuickRTTI.CreateSchemas(Schemas : IXMLDOMSchemaCollection);
{
  Create Schema information.  One Schema is created for each class and added to
  the IXMLDOMSchemaCollection.  This Scema collection can be used to validate
  XML input.  See the quicktest for an example.
}
var
  i, Count:integer;
  typname:ttypekind;
  q:TQuickRTTI;
  C:TCollection;
  Doc : IXMLDOMDocument2;
  Schema, Root, DomNode, DomNode1  : IXMLDOMElement;
  SS : string;
begin
  Doc := CoDOMDocument.Create;
  Doc.async := False;
  Schema := Doc.createElement('Schema');
  Schema.SetAttribute('xmlns','urn:schemas-microsoft-com:xml-data');
  Schema.SetAttribute('xmlns:dt','urn:schemas-microsoft-com:datatypes');
  Doc.appendChild(Schema);

  DomNode := Doc.createElement('AttributeType');
  DomNode.SetAttribute('name', 'TYPE');
  //DomNode.SetAttribute('dt:type', 'enumeration');
  //DomNode.SetAttribute('dt:values', fobj.ClassName);
  DomNode.SetAttribute('dt:type', 'string');
  Schema.appendChild(DomNode);

  if  RTTIObject is TStrings then begin
    DomNode := Doc.createElement('AttributeType');
    DomNode.SetAttribute('name', 'INDEX');
    DomNode.SetAttribute('dt:type', 'int');
    Schema.appendChild(DomNode);
    DomNode := Doc.createElement('ElementType');
    DomNode.SetAttribute('name', 'LINE');
    DomNode.SetAttribute('dt:type', 'string');
    DomNode1 := Doc.createElement('attribute');
    DomNode1.SetAttribute('type', 'INDEX');
    DomNode.appendChild(DomNode1);
    Schema.appendChild(DomNode);
  end;

  Root := Doc.createElement('ElementType');
  Root.SetAttribute('name', TagName);
  DomNode := Doc.createElement('attribute');
  DomNode.SetAttribute('type', 'TYPE');
  Root.appendChild(DomNode);

  if  RTTIObject is TStrings then begin
    DomNode := Doc.createElement('element');
    DomNode.SetAttribute('type', 'LINE');
    DomNode.SetAttribute('maxOccurs', '*');
  end;

  if  RTTIObject is TCollection then begin
    c:=Tcollection(self.rttiobject);
    q:=TQuickRTTI.create;
    try
      Count := c.Count;
      if Count = 0 then
        // temprorarily add an object
        c.Add;
      q.rttiobject:=TPersistent(C.Items[0]) ;
      q.TagName := 'ITEM';
      q.CreateSchemas(Schemas);

      Schema.SetAttribute('xmlns:'+q.RTTIObject.ClassName+'ITEM',
                      'delphi.'+q.RTTIObject.ClassName+'.'+'ITEM');

      DomNode := Doc.createElement('element');
      DomNode.SetAttribute('type', q.RTTIObject.ClassName+'ITEM'+':'+'ITEM');
      Root.appendChild(DomNode);

      if Count = 0 then c.Clear;
    finally
      q.free;
    end;
  end;

  for i:= 0 to props.count-1 do begin
    typname :=  self.propertyTypes (i);
    if typname<>tkclass then begin
      DomNode := Doc.createElement('ElementType');
      DomNode.SetAttribute('name', propertynames(i));
      DomNode.SetAttribute('dt:type', dtType(typname));
      if typname = tkEnumeration then begin
        DomNode.SetAttribute('dt:values', GetEnumNames(GetTypeData(PPropInfo(props[i])^.PropType^)));
      end;
      Schema.appendChild(DomNode);

      DomNode := Doc.createElement('element');
      DomNode.SetAttribute('type', propertynames(i));
      Root.appendChild(DomNode);
    end else begin
      q:= TQuickRTTI(objs.objects[objs.indexof(propertynames(i))]);
      q.CreateSchemas(Schemas);

      Schema.SetAttribute('xmlns:'+q.RTTIObject.ClassName+propertynames(i),
                      'delphi.'+q.RTTIObject.ClassName+'.'+propertynames(i));

      DomNode := Doc.createElement('element');
      DomNode.SetAttribute('type', q.RTTIObject.ClassName+propertynames(i)+':'+propertynames(i));
      Root.appendChild(DomNode);
    end;
  end;

  Schema.AppendChild(Root);

  SS := Doc.xml;
  Doc.Save(Doc);  //!!! to avoid a very mysterious bug in the following statement
  Schemas.add('x-schema:'+'delphi.'+RTTIObject.ClassName+'.'+TagName+'.xml', Doc);

end;

function TQuickRTTI.dtType(TypeKind: TTypeKind): string;
begin
  Result := '';
  Case TypeKind of
    tkInteger : Result := 'int';
    tkChar :  Result := 'char';
    tkEnumeration : Result := 'enumeration';
    tkFloat : Result := 'float';
    tkString : Result := 'string';
    tkSet : Result := 'string';
    tkClass : Result := 'string';
    tkMethod : Result := 'string';
    tkWChar : Result := 'char';
    tkLString : Result := 'string';
    tkWString : Result := 'string';
    tkVariant : Result := 'string';
    tkArray : Result := 'string';
    tkRecord : Result := 'string';
    tkInterface : Result := 'string';
    tkInt64 :  Result := 'int';
    tkDynArray : Result := 'string';
  end;
end;

end.
