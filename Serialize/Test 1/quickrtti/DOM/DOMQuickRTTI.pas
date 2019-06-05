unit DOMQuickRTTI;

interface
uses classes,typinfo,sysutils,QuickRTTI, MSXML2_TLB,Dialogs;

type

{
This file is released under an MIT style license as detailed at opensource.org.
Just don't preteend you wrote it, and leave this comment in the text, and
I'll be happy.  Consider it my resume :)

www.bigattichouse.com
www.delphi-programming.com

}
TMSDOMQuickRTTI = class (TCustomXMLRTTI)
 private
   fOutputSchemaInfo: boolean; fid:integer; fDoc : IXMLDOMDocument2  ;
   fSchemas:IXMLDOMSchemaCollection;
 protected
   function outputXML :String; override;
   function outputSchema :String; override;
   procedure inputXML (sXML:String); override;
   procedure inputSchema (sSchema:String); override;
   function dtType(TypeKind:TTypeKind):string;   
   procedure SetObject (o:TPersistent);override;
 public
   constructor create;override;
   destructor destroy;override;
   function  outputDOMXML:IXMLDOMElement;
   procedure inputDOMXML(DomElem:IXMLDOMElement);
   procedure CreateSchemas (Schemas : IXMLDOMSchemaCollection);
published
   property RTTIObject;
   property ObjectID;
   property TagName;
   property XML;
   property Schema;
   property Doc : IXMLDOMDocument2 read fdoc write fdoc;
   property Schemas : IXMLDOMSchemaCollection read fschemas write fschemas;
   property DOMElement:IXMLDOMElement read OutputDOMXML write InputDOMXML ;
   property ID:integer read fid write fid;
   property OutputSchemaInfo: boolean read fOutputSchemaInfo write fOutputSchemaInfo;
 end;


implementation

constructor TMSDOMQuickRTTI.create;
begin
  inherited create;
  fid:=-1;
  fOutputSchemaInfo := False;
end;

destructor TMSDOMQuickRTTI.destroy;
begin
try
{}
finally
    inherited destroy;
end;
end;

function TMSDOMQuickRTTI.OutputSchema:String;
var URI:String; i,max:integer; hold:tStringlist;
begin
 if not(assigned(fSchemas)) then
    begin
    fSchemas := CoXMLSchemaCache.Create;
    CreateSchemas(fSchemas);
    end;
    hold:=tstringlist.create;
    max:=Schemas.length;
    for i := 0 to max-1 do begin
     URI := Schemas.namespaceURI[i];
   //  hold.Add(URI);
     hold.add( Schemas.get(URI).xml);
    end;
    result:=hold.text;
    hold.free;
end;

procedure TMSDOMQuickRTTI.InputSchema(SSchema:String);
begin
 {Not implemented}
end;

function TMSDOMQuickRTTI.outputXML:String;
begin
  if not(assigned(DOC)) then Doc := CoDOMDocument.Create;
  Doc.async := False;
  OutputSchemaInfo := True;
  result:=outputDOMXML.xml;
  Doc:=nil;
end;

function  TMSDOMQuickRTTI.outputDOMXML:IXMLDOMElement;
var
  i,k:integer;
  typname:ttypekind;
  q:TMSDOMQuickRTTI;
  s:TStrings;
  C:TCollection;
  DomNode, DomNode1 : IXMLDOMNode;
  OutElement:IXMLDOMElement;
begin
{
  Use the MSXML parser to create the object representation as an IXMLDomElement.
  Then use the IXMLDomElement.xml property to get the XML object representation.
  The RTTI property OutputSchemaInfo determines whether Namespace schema info is included.
}
  if not(assigned(DOC)) then Doc := CoDOMDocument.Create;
  OutElement := Doc.createElement(TagName);
  OutElement.setAttribute('TYPE',RTTIobject.ClassName);
  if OutputSchemaInfo then
    OutElement.setAttribute('xmlns','x-schema:'+'delphi.'+RTTIObject.ClassName+'.'+TagName+'.xml');
  if fid>-1 then
    OutElement.setAttribute('ID',inttostr(fid));
  if Objectid<>'' then
    OutElement.setAttribute('ID',ObjectID);
  //  The above line allows us to have collections of items.. like tlist
  for i:= 0 to self.propertyCount -1 do
  begin
    typname :=  self.propertyTypes (i);
    if typname<>tkclass then begin
      DomNode := Doc.CreateNode(NODE_ELEMENT,   propertynames(i) , '');
      DomNode1 := Doc.CreateNode(NODE_TEXT,  '', '');
      DomNode1.nodeValue := GetValue(propertynames(i));
      DomNode.appendChild(DomNode1);
      OutElement.appendChild(DomNode);
    end else begin
      
      q:=TMSDOMQuickRTTI(Cache);
      q.rttiobject:=TPersistent(ChildObject(propertynames(i))) ;
      q.OutputSchemaInfo := OutputSchemaInfo;
      q.tagname:=propertynames(i);
      OutElement.appendChild(q.outputDomXML);

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
     OutElement.appendChild(DomNode);
    end;
  end;

  if  RTTIObject is TCollection then begin
    c:=Tcollection(self.rttiobject);
    //q:=TMSDOMQuickRTTI.create;
      q:=TMSDOMQuickRTTI(Cache);
    q.OutputSchemaInfo := OutputSchemaInfo;
    for k:= 0 to c.Count-1 do begin
      {create and output any internal items}
      if C.Items[k] is TPersistent then begin
        q.rttiobject:=TPersistent(C.Items[k]) ;
        q.tagname:='ITEM'    ;
        OutElement.appendChild(q.outputDomXML);
      end;
    end;
    
  end;
  result:=OutElement ;
end;


procedure TMSDOMQuickRTTI.SetObject (o:TPersistent);
begin
   inherited SetObject(o);
  {perhaps this should be in the set object section}
   //if not(assigned(fSchemas)) then fSchemas := CoXMLSchemaCache.Create;
  // CreateSchemas(fSchemas);
end;


procedure TMSDOMQuickRTTI.InputXML(sXML:String);
Var
  ParseError : IXMLDOMParseError;
begin
   if not(assigned(fSchemas)) then
    begin
    fSchemas := CoXMLSchemaCache.Create;
    CreateSchemas(fSchemas);
    end;
  if not(assigned(DOC)) then Doc := CoDOMDocument.Create;
  Doc.async := False;
  Doc.validateOnParse := False;
  Doc.schemas := Schemas;
  if Doc.loadxml(sXML) then
    inputDOMXML(Doc.selectSingleNode(TagName)  as IXMLDOMElement)
  else
    raise( Exception.create( Doc.parseError.Reason));
  ParseError := Doc.Validate;
  if ParseError.errorCode <> 0 then
    ShowMessage(ParseError.Reason);
  Doc:=nil;
end;


procedure TMSDOMQuickRTTI.inputDOMXML(DomElem:IXMLDOMElement);
var
  q:TMSDOMQuickRTTI;
  Node : IXMLDomNode;
  Index, i : integer;
  holdclassname:String;
  ci:TCollectionItem;
begin
{
  The equivalent to inputXML using the XMLparser.  Can optionally validate
  the XML file using the Schema information created by CreateSchemas.
  See the quicktest example for how to do this.
}
 // q:=TMSDOMQuickRTTi.create;
  q:=TMSDOMQuickRTTi(Cache);
  if RTTIObject is TStrings then TStrings(RTTIObject).clear;
  if RTTIObject is TCollection then TCollection(self.rttiobject).Clear;

  //if not(assigned(DOC)) then Doc := CoDOMDocument.Create;
  for i := 0 to DomElem.ChildNodes.length - 1 do begin
    Node := DomElem.ChildNodes.item[i];
    if Node.NodeType = NODE_ELEMENT then begin
      if (RTTIObject is TStrings) and (Node.NodeName = 'LINE') then
        TStrings(RTTIObject).Add(Node.Text)
      else
       if (RTTIObject is TCollection) and (Node.NodeName = 'ITEM') then begin

        q.tagname := Node.nodename;
        q.OutputSchemaInfo :=OutputSchemaInfo;
      {  q.RTTIObject := TCollection(self.rttiobject).Add;
        q.inputDOMXML(Node as IXMLDOMElement);           }
           holdclassname:= Node.attributes.item[0].text  ;  {namedtype seemed to bomb out on 'Type' ??}
           ci:= NewRegisteredCollectionItem(holdclassname,TCollection(self.rttiobject));
           q.rttiobject:=ci ;
           q.inputDOMXML(Node as IXMLDOMElement);            
      end else begin
        Index := IndexOf(Node.nodeName);
       // if Index < 0 then continue;
        if propertyTypes(Index) = tkClass then
         begin
           q.OutputSchemaInfo :=OutputSchemaInfo;
           q.rttiObject:=TPersistent(ChildObject(propertynames(Index)));
           q.tagname:=propertynames(Index);
           q.inputDomXML(Node as IXMLDOMElement);
          // q.XML := node.Get_xml ;
          end
        else
         // SetValue(VAlue[PropertyNames(Index)],Node.Text);
          SetValue( PropertyNames(Index),Node.Text);
      end;
    end;
  end;
 
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

procedure TMSDOMQuickRTTI.CreateSchemas(Schemas : IXMLDOMSchemaCollection);
{
  Create Schema information.  One Schema is created for each class and added to
  the IXMLDOMSchemaCollection.  This Scema collection can be used to validate
  XML input.  See the quicktest for an example.
}
var
  i, Count,r,rmax:integer;
  typname:ttypekind;
  q:TMSDOMQuickRTTI;
  C:TCollection;
  Doc : IXMLDOMDocument2;
  Schema, Root, DomNode, DomNode1  : IXMLDOMElement;
  SS : string;
  hold:TPersistent;
begin
  if not(assigned(DOC)) then Doc := CoDOMDocument.Create;
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
   // q:=TMSDOMQuickRTTI.create;
   q:= TMSDOMQuickRTTI(cache);
    try
      //MEJ Count := c.Count;
      //MEJ if Count = 0 then
      // temprorarily add an object
      {I really want all the POSSIBLE classes out of the registered types so:} //MEJ
    rmax:= RegisteredCount -1 ;
    for r:= 0 to rmax do
    begin
     //if r=-1 then
     // hold:=c.add {make sure we get the base class}
     // else
      hold:=NewRegisteredCollectionItem(registeredName(r),c);
      q.rttiobject:=hold ;
      q.TagName := 'ITEM';
      q.createSchemas(Schemas);
      Schema.SetAttribute('xmlns:'+q.RTTIObject.ClassName+'ITEM',
                      'delphi.'+q.RTTIObject.ClassName+'.'+'ITEM');

      DomNode := Doc.createElement('element');
      DomNode.SetAttribute('type', q.RTTIObject.ClassName+'ITEM'+':'+'ITEM');
      Root.appendChild(DomNode);
      if count=0 then c.clear;
    end;
    finally
      {}
    end;
  end;

  for i:= 0 to propertycount-1 do begin
    typname :=  self.propertyTypes (i);
    if typname<>tkclass then begin
      DomNode := Doc.createElement('ElementType');
      DomNode.SetAttribute('name', propertynames(i));
      DomNode.SetAttribute('dt:type', dtType(typname));
      if typname = tkEnumeration then begin
        DomNode.SetAttribute('dt:values', GetEnumNames(GetTypeData(PPropInfo(value[propertynames(i)])^.PropType^)));
      end;
      Schema.appendChild(DomNode);

      DomNode := Doc.createElement('element');
      DomNode.SetAttribute('type', propertynames(i));
      Root.appendChild(DomNode);
    end else begin
    //  q:= TMSDOMQuickRTTI.create;
    q:= TMSDOMQuickRTTI(cache);
  
      q.rttiobject := TPersistent(Childobject(propertynames(i)));
      q.tagname:= propertynames(i);
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

function TMSDOMQuickRTTI.dtType(TypeKind: TTypeKind): string;
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
