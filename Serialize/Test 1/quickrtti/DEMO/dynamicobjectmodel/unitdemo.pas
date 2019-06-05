unit unitdemo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  lowxRTTI,quickRTTI,udpclasses, StdCtrls, ExtCtrls, Buttons,
  ComCtrls, Menus, ActnList;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    RadioGroup1: TRadioGroup;
    Edit2: TEdit;
    Label2: TLabel;
    btnAddProperty: TBitBtn;
    btnAdd: TBitBtn;
    Panel2: TPanel;
    btnShowInstanceXML: TBitBtn;
    btnCreateInstance: TBitBtn;
    ScrollBox1: TScrollBox;
    btnSaveType: TBitBtn;
    SaveDialog1: TSaveDialog;
    btnCreateNewType: TBitBtn;
    OpenDialog1: TOpenDialog;
    btnLoadType: TBitBtn;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    EntityTypedefinitions1: TMenuItem;
    Creationofinstances1: TMenuItem;
    ActionList1: TActionList;
    actShowEntityXML: TAction;
    ActCreateInstance: TAction;
    Panel3: TPanel;
    Memo1: TMemo;
    Panel4: TPanel;
    Splitter1: TSplitter;
    Memo2: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure GenerateXML(TagName:String; str:TStrings);
    procedure Edit2Change(Sender: TObject);
    procedure btnAddPropertyClick(Sender: TObject);
    procedure btnSaveTypeClick(Sender: TObject);
    procedure btnCreateNewTypeClick(Sender: TObject);
    procedure btnLoadTypeClick(Sender: TObject);
    procedure ClearScrollBox;
    procedure Exit1Click(Sender: TObject);
    procedure EntityTypedefinitions1Click(Sender: TObject);
    procedure Creationofinstances1Click(Sender: TObject);
    procedure actShowEntityXMLExecute(Sender: TObject);
    procedure actShowEntityXMLUpdate(Sender: TObject);
    procedure ActCreateInstanceExecute(Sender: TObject);
    procedure ActCreateInstanceUpdate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    tipoEntita:TEntityType;
    fquick: TCustomXMLRTTI;
    entita:TEntity;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
entita:=nil;
tipoEntita:=TEntityType.Create;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
tipoEntita.Free;
entita.free;
end;

procedure TForm1.btnAddClick(Sender: TObject);
var pt:TPropertyType;
begin
pt:=TPropertyType.Create(tipoEntita.PropertyTypes);
pt.PropertyName:=edit1.text;
if RadioGroup1.Items[RadioGroup1.ItemIndex] = 'Integer' then
pt.PropertyKind:=pkInteger
else if RadioGroup1.Items[RadioGroup1.ItemIndex] = 'String' then pt.PropertyKind:=pkString else
   pt.PropertyKind:=pkDate;
panel1.visible:=false;
GenerateXML('Entity Type',memo1.lines);
end;

procedure TForm1.GenerateXML(TagName:string; str:TStrings);
begin
fquick:=TLowXQuickRTTI.create;
fquick.RegisterClass(TPropertyType);
fquick.RTTIObject :=tipoEntita;
fquick.TagName := TagName;
memo1.lines.text:=fquick.XML ;
fquick.free;
end;



procedure TForm1.Edit2Change(Sender: TObject);
begin
tipoEntita.Name:=edit2.text;
end;

procedure TForm1.btnAddPropertyClick(Sender: TObject);
begin
edit1.Text:='';
radiogroup1.ItemIndex:=0;
panel1.visible:=true;
ActiveControl:=Edit1;
end;



procedure TForm1.btnSaveTypeClick(Sender: TObject);
begin
saveDialog1.FileName:=TipoEntita.Name;
if SaveDialog1.execute then
begin
memo1.Lines.SaveToFile(SaveDialog1.filename);
end;
end;

procedure TForm1.btnCreateNewTypeClick(Sender: TObject);
begin
if assigned(tipoEntita) then freeAndNil(TipoEntita);
if assigned(Entita) then freeAndNil(Entita);
memo1.lines.clear;
memo2.lines.clear;
ClearScrollBox;
tipoEntita:=TEntityType.Create;
edit2.text:='';
edit2.setFocus;
end;

procedure TForm1.btnLoadTypeClick(Sender: TObject);
begin
ClearScrollBox;
if Assigned(TipoEntita) then FreeAndNil(TipoEntita);
TipoEntita:=TEntityType.create;
//loading the entity type
fquick:=TLowXQuickRTTI.create;
fquick.RegisterClass(TPropertyType);
fquick.RTTIObject :=TipoEntita;

if openDialog1.execute then
begin
memo2.lines.clear;
memo2.lines.LoadFromFile(openDialog1.filename);
Fquick.TagName:='Entity Type';
fQuick.XML:=memo2.lines.Text;
end;
memo2.lines.Text:=fquick.XML;
FQuick.Free;
BtnCreateInstance.enabled:=true;
btnCreateInstance.Caption:='Create an instance '+#13#10+' of '+tipoEntita.Name;

end;



procedure TForm1.ClearScrollBox;
var i:integer;
begin
for i:=ScrollBox1.componentCount-1 downto 0 do
 ScrollBox1.controls[i].free;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
Close;
end;

procedure TForm1.EntityTypedefinitions1Click(Sender: TObject);
begin
pageControl1.ActivePageIndex:=0;
end;

procedure TForm1.Creationofinstances1Click(Sender: TObject);
begin
pageControl1.ActivePageIndex:=1;
end;

procedure TForm1.actShowEntityXMLExecute(Sender: TObject);
begin
if Assigned(entita) then
begin
fquick:=TLowXQuickRTTI.create;
fquick.RegisterClass(TProperty);
fquick.RegisterClass(TStringProperty);
fquick.RegisterClass(TIntegerProperty);
fquick.RTTIObject :=Entita;
fquick.TagName := 'Entity';
memo2.lines.text:=fquick.XML ;
fquick.free;
end;
end;

procedure TForm1.actShowEntityXMLUpdate(Sender: TObject);
begin
(Sender as TAction).enabled:=Assigned(Entita);
end;

procedure TForm1.ActCreateInstanceExecute(Sender: TObject);
begin
if Assigned(TipoEntita) then
begin
fquick:=TLowXQuickRTTI.create;
fquick.RegisterClass(TStringProperty);
fquick.RegisterClass(TIntegerProperty);
fquick.RegisterClass(TDateProperty);
//creating the entity from the entity type just loaded
if Assigned(entita) then freeAndNil(entita);
entita:=tipoEntita.CreateEntity;
fquick.RTTIObject :=Entita;
fquick.TagName := 'Entity';
memo2.lines.clear;
memo2.lines.text:=fquick.XML ;
entita.EntityKind.EditEntity(entita,scrollBox1);
fquick.Free;
btnCreateInstance.enabled:=false;
end;
end;

procedure TForm1.ActCreateInstanceUpdate(Sender: TObject);
begin
(Sender as TAction).enabled:=Assigned(TipoEntita);
end;

end.
