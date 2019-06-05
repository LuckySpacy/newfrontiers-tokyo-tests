unit clienttestu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,SessionClient,middlexrtti;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    btnAdd: TButton;
    btnRemove: TButton;
    Label2: TLabel;
    txtSession: TEdit;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    txtName: TEdit;
    Label4: TLabel;
    memoData: TMemo;
    Button6: TButton;
    GroupBox2: TGroupBox;
    ListBox1: TListBox;
    Label1: TLabel;
    txtHost: TEdit;
    btnSave: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
  private
    { Private declarations }
   Client: TSessionClient;
   Q:TMiddleXQuickRTTI;
   procedure Refresh;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses addvarformu;

{$R *.DFM}

procedure TForm1.Refresh;
var i,max:integer; SD:TSessionData;
begin
 max:=client.Variables.count-1;
 Listbox1.Clear ;
 for i:= 0 to max do
  begin
    SD:= TSessionData(client.Variables.items[i]);
    Listbox1.Items.AddObject(SD.Variable,SD);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   Client:= TSessionClient.create('QSessions');
   Q:=TMiddleXQuickRTTI.create;
   Q.registerclass(TSessionData);
   Client.RTTIEnabler := Q;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
Client.free;
Q.free;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 cursor:=crhourglass;
 Client.RemoteCall(txtHost.text,'Create');
 txtSession.text:=client.SessionID ;
 cursor:=crDefault;
 btnAdd.enabled:=true;
 btnRemove.enabled:=true;
 btnSave.enabled:=true;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 cursor:=crhourglass;
 client.SessionID := txtSession.text;
 Client.RemoteCall(txtHost.text,'Get');
 Refresh;
 cursor:=crDefault;
  btnAdd.enabled:=true;
 btnRemove.enabled:=true;
 btnSave.enabled:=true;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 cursor:=crhourglass;
 client.SessionID := txtSession.text;
 Client.RemoteCall(txtHost.text,'Set');
 cursor:=crDefault;
 btnAdd.enabled:=true;
 btnRemove.enabled:=true;
 btnSave.enabled:=true;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
 btnAdd.enabled:=false;
 btnRemove.enabled:=false;
 btnSave.enabled:=false;
 cursor:=crhourglass;
 client.SessionID := txtSession.text;
 Client.RemoteCall(txtHost.text,'Destroy');     
 cursor:=crDefault;

end;

procedure TForm1.ListBox1DblClick(Sender: TObject);
var SD:TSessionData;
begin
  SD:=TSessionData(Listbox1.items.objects[listbox1.itemindex]);
  txtName.text:=SD.Variable;
  memoData.lines.text:=SD.Data;
end;

procedure TForm1.btnSaveClick(Sender: TObject);
var SD:TSessionData;
begin
  SD:=TSessionData(Listbox1.items.objects[listbox1.itemindex]);
  SD.Variable:=txtName.text;
  SD.Data:=MemoData.lines.text;
end;

procedure TForm1.btnAddClick(Sender: TObject);
var SD:TSessionData;
begin
if AddVariableForm.showmodal=mrOK then
 begin
   SD:=TSessionData(Client.variables.add);
   SD.Variable:=AddVariableForm.edit1.text;
   SD.Data:=AddVariableForm.memo1.text;
   refresh;
 end;
end;

procedure TForm1.btnRemoveClick(Sender: TObject);
begin
 Client.variables.Delete(listbox1.itemindex);
 refresh;
end;

end.
