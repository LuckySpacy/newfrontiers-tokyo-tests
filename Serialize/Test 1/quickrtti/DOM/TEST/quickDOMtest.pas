unit quicktest;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, QuickRTTI, MSXML2_TLB;

type
TNotes = class(Tpersistent)
 private
   fNotes:string;
 published
   property Data:String read fnotes write fnotes;
 end;

TContact = class  (TPersistent)
 private
  fname,faddress,fcity,fstate,fzip:String;
  fnotes:TNotes; flines:tstringlist;
  fmycollect:TCollection;
 public
  constructor create;
  destructor destroy;override;
 published
  property Name:String read fname write fname;
  property Address:String read faddress write faddress;
  property City:String read fcity write fcity;
  property State:String read fstate write fstate;
  property Zip:String read fzip write fzip;
  {Sub objects REALLY slow things down... most
   obvious is the TCollection... I guess too many layers
   and having to get info.. perhaps a global "type Cache"
   would really cut that down.}
  property Notes:TNotes read fnotes write fnotes;
  property Lines:Tstringlist read flines write flines;
  property MyCollect:TCollection read fmycollect write fmycollect;
 end;

 TMyItem = Class(TCollectionItem)
 private
  fname:String;
 published
   property Name:String read fname write fname;
 end;

  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    lblTimeIn: TLabel;
    lblTimeout: TLabel;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fquick:TQuickRTTI;
    c:TContact;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

constructor TContact.create;
var itm:TMyItem;
begin
 fnotes:=tnotes.create;
 fnotes.Data := 'This is my personal notes';
 flines:=tstringlist.create;
 flines.add ('Howdy!');
 flines.add ('My Name is mike');
 fmycollect:=TCollection.Create(TMyItem);
 itm:= TMyItem(fmycollect.add);
 itm.Name := 'Test Item';
end;

destructor TContact.destroy;
begin
 try
  fnotes.free;
 finally
  inherited destroy;
 end;
end;
procedure TForm1.Button1Click(Sender: TObject);
begin
{ask RTTI to build the XML on the fly!}
memo1.lines.text:=fquick.XML ;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
fquick:=TQuickRTTI.create;

{Here is my object}
c:=TContact.Create ;
c.name:='Ann Johnson';
c.Address :='424 S. Division Street'    ;
c.city:='Chenoa';
c.state:='IL';
c.zip:='61726';
{A sub object..just for fun}
//c.Notes.Data := 'Test Data';
{Tell QuickRTTI where to find the object}
fquick.RTTIObject :=c;

fquick.TagName := 'CONTACT';
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
{Ask RTTI to read the XML and populate our object!}
fquick.XML:= memo1.lines.text;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
fquick.free;
end;

procedure TForm1.Button3Click(Sender: TObject);
var st,en,xout,xin:double;i:integer;h:String;
begin
xout:=0;
xin:=0;
for i:= 0 to 9999 do
 begin
  st:=Gettickcount;
  h:=fquick.xml;
  en:=Gettickcount;
  xout:=xout+((en-st)/1000);

  st:=Gettickcount;
  fquick.xml:=h;
  en:=Gettickcount;
  xin:=xin+((en-st)/1000);
 end;

lblTimeIn.caption:='Obj>XML: ' + floattostr(trunc(10000/xout)) + ' per sec.';
lblTimeOut.caption:='XML>Obj: ' + floattostr(trunc(10000/xin)) + ' per sec.';
application.processmessages;
//button3click(self);
end;

procedure TForm1.Button4Click(Sender: TObject);
Var
  Doc : IXMLDOMDocument2;
begin
  Doc := CoDOMDocument.Create;
  Doc.async := False;
  fquick.OutputSchemaInfo := True;
  memo1.lines.text:=fquick.outputDOMXML(Doc).xml ;
end;

procedure TForm1.Button5Click(Sender: TObject);
Var
  Doc : IXMLDOMDocument2;
  ParseError : IXMLDOMParseError;
  Schemas : IXMLDOMSchemaCollection;
begin
  Schemas := CoXMLSchemaCache.Create;
  fquick.CreateSchemas(Schemas);

  Doc := CoDOMDocument.Create;
  Doc.async := False;
  Doc.validateOnParse := False;
  Doc.schemas := Schemas;
  if Doc.loadxml(memo1.lines.text) then
    fquick.inputDOMXML(Doc.selectSingleNode(fQuick.TagName) as IXMLDOMElement)
  else
    ShowMessage(Doc.parseError.Reason);
  ParseError := Doc.Validate;
  if ParseError.errorCode <> 0 then
    ShowMessage(ParseError.Reason);
end;

procedure TForm1.Button6Click(Sender: TObject);
Var
  Doc : IXMLDOMDocument2;
  st,en,xout,xin:double;i:integer;h:String;
begin
  Doc := CoDOMDocument.Create;
  Doc.async := False;
  fquick.OutputSchemaInfo := False;
xout:=0;
xin:=0;
for i:= 0 to 9999 do
 begin
  st:=Gettickcount;
  h:=fquick.outputDOMXML(Doc).xml;
  en:=Gettickcount;
  xout:=xout+((en-st)/1000);

  st:=Gettickcount;
  Doc.loadxml(h);
  fquick.inputDOMXML(Doc.selectSingleNode(fQuick.TagName) as IXMLDOMElement);
  en:=Gettickcount;
  xin:=xin+((en-st)/1000);
 end;

lblTimeIn.caption:='Obj>XML: ' + floattostr(trunc(10000/xout)) + ' per sec.';
lblTimeOut.caption:='XML>Obj: ' + floattostr(trunc(10000/xin)) + ' per sec.';
application.processmessages;
end;

procedure TForm1.Button7Click(Sender: TObject);
Var
  i : integer;
  URI : string;
  Schemas : IXMLDOMSchemaCollection;
begin
  Schemas := CoXMLSchemaCache.Create;
  fquick.CreateSchemas(Schemas);
  Memo1.Lines.Clear;
  for i := 0 to Schemas.length-1 do begin
    URI := Schemas.namespaceURI[i];
    Memo1.Lines.Add(URI);
    Memo1.Lines.Text := Memo1.Lines.Text + Schemas.get(URI).xml;
    Memo1.Lines.Add('');
    Memo1.Lines.Add('');
  end;

end;

end.
