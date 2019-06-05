unit quicktest;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,QuickRTTI,LowXRTTI,MiddleXRTTI,DOMQuickRTTI;

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
//  property Notes:TNotes read fnotes write fnotes;
// property Lines:Tstringlist read flines write flines;
       property MyCollect:TCollection read fmycollect write fmycollect;
 end;

 TSubObject = class (TPersistent)
  private
    fname:String;
  published
    property Name:String read fname write fname;
  end;

 TBaseItem = class(TCollectionItem) ;

 TMyItem = Class(TBaseItem)
 private
  fname:String;
  flist:TStringlist;
  fsub:TSubobject;
 public
   constructor create(Collection:TCollection);override;
 published
   property Name:String read fname write fname;
   property List:TStringlist read flist write flist;
   property Sub:TSubObject read fsub write fsub;
 end;

  TMyOtherItem = Class(TBaseItem)
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
    Label2: TLabel;
    cboRTTI: TComboBox;
    lblCOunt: TLabel;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fquick: TCustomXMLRTTI;
    c:TContact;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

constructor TMyItem.create(Collection:TCollection);
begin
 inherited create(Collection);
 flist:=tstringlist.create;
 fsub:=tsubobject.create;
 fsub.name:='Mike';
end;

constructor TContact.create;
var fmi:TMyItem; fmo:TMyOtherItem;
begin
 fnotes:=tnotes.create;
 flines:=tstringlist.create;
 flines.add ('Howdy!');
 flines.add ('My Name is mike');
 fmycollect:=TCollection.Create(TBaseItem); {Polymorphism in collections test}
 fmi:=TMyItem.create(fmycollect);
 fmo:=TMyOtherItem.create(fmycollect);
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
if uppercase(cbortti.text)='LOWX' then
begin
  fquick:=TLowXQuickRTTI.create;
end;

if uppercase(cbortti.text)='MIDDLEX' then
begin
  fquick:=TMiddleXQuickRTTI.create;
end;

if uppercase(cbortti.text)='MSDOM' then
begin
  fquick:=TMSDOMQuickRTTI.create;
end;
  fquick.RegisterClass(TMyItem);
  fquick.RegisterCLass(TMyOtherItem);
    fquick.RTTIObject :=c;
  fquick.TagName := 'CONTACT';
  memo1.lines.text:=fquick.XML ;
fquick.free;
end;

procedure TForm1.FormCreate(Sender: TObject);
var other:TMyOtherItem; itm:TMyItem;
begin


{Here is my object}
c:=TContact.Create ;
c.name:='Ann Johnson';
c.Address :='424 S. Division Street'    ;
c.city:='Chenoa';
c.state:='IL';
c.zip:='61726';
 {other:=TMyOtherItem.create(c.mycollect);
 itm:= TMyItem.create(c.mycollect);
 itm.Name := 'Test Item';}
 
{A sub object..just for fun}
//c.Notes.Data := 'Test Data';
{Tell QuickRTTI where to find the object}

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
{Ask RTTI to read the XML and populate our object!}
if uppercase(cbortti.text)='LOWX' then
begin
  fquick:=TLowXQuickRTTI.create;
end;

if uppercase(cbortti.text)='MIDDLEX' then
begin
  fquick:=TMiddleXQuickRTTI.create;
end;

if uppercase(cbortti.text)='MSDOM' then
begin
  fquick:=TMSDOMQuickRTTI.create;
end;
  fquick.RegisterClass(TMyItem);
  fquick.RegisterClass(TBaseItem);
  fquick.RegisterCLass(TMyOtherItem);
  fquick.RTTIObject :=c;
  fquick.TagName := 'CONTACT';

fquick.XML:= memo1.lines.text;
fquick.free;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
c.free;
end;

procedure TForm1.Button3Click(Sender: TObject);
var st,en,xout,xin:double;i:integer;h:String;
begin
if uppercase(cbortti.text)='LOWX' then
begin
  fquick:=TLowXQuickRTTI.create;
end;

if uppercase(cbortti.text)='MIDDLEX' then
begin
  fquick:=TMiddleXQuickRTTI.create;
end;

if uppercase(cbortti.text)='MSDOM' then
begin
  fquick:=TMSDOMQuickRTTI.create;
end;
  fquick.RegisterClass(TMyItem);
  fquick.RegisterCLass(TMyOtherItem);
  fquick.RTTIObject :=c;
  fquick.TagName := 'CONTACT';

st:=Gettickcount;
xout:=0.00001;
xin:=0.00001;
for i:= 0 to 10000 do
 begin
  st:=Gettickcount;
  h:=fquick.xml;
  en:=Gettickcount;
  xout:=xout+((en-st)/1000);
  st:=Gettickcount;
  fquick.xml:=h;
  en:=Gettickcount;
  xin:=xin+((en-st)/1000);
  if i mod 10  = 0 then
  begin
   lblCount.caption:=inttostr(i);
   application.processmessages;
  end;
 end;

fquick.free;

lblTimeIn.caption:='Obj>XML: ' + floattostr(trunc(10000/xout)) + ' per sec.';
lblTimeOut.caption:='XML>Obj: ' + floattostr(trunc(10000/xin)) + ' per sec.';
application.processmessages;
//button3click(self);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
if uppercase(cbortti.text)='LOWX' then
begin
  fquick:=TLowXQuickRTTI.create;
end;
if uppercase(cbortti.text)='MSDOM' then
begin
  fquick:=TMSDOMQuickRTTI.create;
end;

if uppercase(cbortti.text)='MIDDLEX' then
begin
  fquick:=TMiddleXQuickRTTI.create;
end;
  fquick.RegisterClass(TBaseItem);
  fquick.RegisterClass(TMyItem);
  fquick.RegisterCLass(TMyOtherItem);

  fquick.RTTIObject :=c;
  fquick.TagName := 'CONTACT';
  memo1.text:= fquick.schema;
  fquick.free;
end;

end.
