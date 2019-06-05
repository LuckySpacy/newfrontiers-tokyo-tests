unit newstoryformu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TNewStory = class(TForm)
    Panel3: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblDate: TLabel;
    txtTitle: TEdit;
    txtByLine: TEdit;
    Panel5: TPanel;
    Save: TButton;
    MemoStory: TMemo;
    Cancel: TButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewStory: TNewStory;

implementation

{$R *.DFM}

procedure TNewStory.FormCreate(Sender: TObject);
begin
lblDate.caption:=Datetostr(now);
txtTitle.text:='';
txtByLine.text:='';
memostory.text:='';
end;

end.
