unit rttidatafu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,xmlstorage,RTTIstorage;

type
  TContact = class  (TPersistent)
 private
  fname,faddress,fcity,fstate,fzip:String;
 published
  property Name:String read fname write fname;
  property Address:String read faddress write faddress;
  property City:String read fcity write fcity;
  property State:String read fstate write fstate;
  property Zip:String read fzip write fzip;
 end;

  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Button2: TButton;
    Button3: TButton;
    Label2: TLabel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     XStore:TPersistentStorage;
     procedure OnNeedObject (Sender:TObject;Classname:String;var Obj:TPersistent) ;
     procedure OnFreeObject (Sender:TObject;Obj:TPersistent)  ;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
var ObjID:String; c:TContact;
begin
ObjID:=XStore.CReateObjectID;
c:=TContact(XSTore.attachtoobject(ObjID));
c.name:='Mike Johnson';
combobox1.text:= ObjID;
combobox1.items.add (Objid);
XStore.StoreObject(ObjId,c);
 XStore.DetachObject (c);
end;

procedure TForm1.OnNeedObject (Sender:TObject;Classname:String;var Obj:TPersistent) ;
begin
 if classname='CONTACT' then Obj:=TPersistent(TContact.create);
end;

procedure TForm1.OnFreeObject (Sender:TObject;Obj:TPersistent)  ;
begin
 TContact(Obj).free;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
if fileexists('StorageItems.dat') then combobox1.Items.LoadFromFile ('StorageItems.dat');
XStore:=TXMLStorage.create(nil);
TXMLStorage(XStore).filename:='Test.dat';
TXMLStorage(XStore).StoredClassName :='CONTACT';
TXMLStorage(XStore).OnNeedObject :=onneedobject;
TXMLStorage(XStore).OnFreeObject :=onfreeobject;
end;

procedure TForm1.Button2Click(Sender: TObject);
var c:TContact;
begin
 c:=TContact(XSTore.attachtoobject(combobox1.text));
 edit1.text:=c.name;
 edit2.text:=c.address;
 XStore.DetachObject (c);
end;

procedure TForm1.Button3Click(Sender: TObject);
var c:TContact;
begin
 c:=TContact(XSTore.attachtoobject(combobox1.text));
 c.name:=edit1.text;
 c.address:=edit2.text;
 XStore.StoreObject(combobox1.text,c);
 XStore.DetachObject (c);
end;

procedure TForm1.Button4Click(Sender: TObject);
var c:TContact;
begin
 c:=TContact(XSTore.attachtoobject(combobox1.text));
 c.name:=edit1.text;
 c.address:=edit2.text;
 XStore.DeleteObject(combobox1.text);
 XStore.DetachObject (c);
end;

end.
