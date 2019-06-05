unit newsmainu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,newsstoryu, ExtCtrls,middlex,middlexRTTI;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button2: TButton;
    Panel3: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel5: TPanel;
    MemoStory: TMemo;
    lblDate: TLabel;
    txtTitle: TEdit;
    txtByLine: TEdit;
    Save: TButton;
    Panel6: TPanel;
    ListBox1: TListBox;
    Button1: TButton;
    txtURL: TEdit;
    procedure ListBox1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    L:TStoryList;sid:STring;
    Q:TMiddleXQuickRTTI;
  public
    { Public declarations }
    procedure LoadNEwsItem (story_id:String);
  end;

var
  Form1: TForm1;

implementation

uses newstoryformu;

{$R *.DFM}

procedure TFOrm1.LoadNewsItem (story_id:String);
var n:TClientNewsStory;name:String;
begin
 n:=TClientNewsStory.create ('NewsItem'); 
 n.RTTIEnabler := Q;
 n.story_id:=story_id;
 sid:=story_id;
 n.RemoteCall(txtURL.text,'Get');
 lblDate.caption:=datetostr(n.created);
 txtTitle.text:=n.title;
 txtByLine.text:=n.byline;
 memoStory.lines.text:= n.STORY ;
 n.free;
end;

procedure TForm1.ListBox1DblClick(Sender: TObject);
var n:STring;
begin
 n:= L.story_ids.names[ listbox1.ItemIndex ];
 LoadNewsItem(n);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
L:=TStoryList.create('NewsList');

Q:=TMiddleXQuickRTTI.create;
L.RTTIEnabler := Q;

end;

procedure TForm1.Button2Click(Sender: TObject);
var  i,max:integer;name:String;
begin
 L.RemoteCall(txtURL.text,'Get');
 max:=L.story_ids.count-1;
 Listbox1.clear;
 for i:= 0 to max do
  begin
   name:= L.story_ids.names[i];
   Listbox1.Items.Add(L.story_ids.values[name]);
  end;
end;

procedure TForm1.SaveClick(Sender: TObject);
var n:TClientNewsStory;name:String;
begin
 n:=TClientNewsStory.create ('NewsItem');
 n.RTTIEnabler := Q;
 name:= L.story_ids.names[ listbox1.ItemIndex ]; 
 n.story_id:= sid;
 n.TITLE := txtTitle.text;
 n.BYLINE := txtByLine.text;
 n.story := memostory.text;
 n.RemoteCall(txtURL.text,'Update');
 n.free;
 memostory.text:='';
 lblDate.caption:='';
 txtTitle.text:='';
 txtByLine.text:='';
 LoadNewsItem(sid);
end;

procedure TForm1.Button1Click(Sender: TObject);
var n:TClientNewsStory;
begin
if NewStory.SHowmodal=mrOK then
 begin
 n:=TClientNewsStory.create ('NewsItem');     
 n.RTTIEnabler := Q;
 n.story_id:= '';
 n.TITLE := newstory.txtTitle.text;
 n.BYLINE := newstory.txtByLine.text;
 n.story := newstory.memostory.text;
 n.created := now;
 n.RemoteCall(txtURL.text,'Insert');
 n.free;
 Button2click(self);
 end;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
L.free;
Q.free;
end;

end.
