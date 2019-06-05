unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvTreeViewBase, AdvTreeViewData,
  AdvCustomTreeView, AdvTreeView;

type
  TForm1 = class(TForm)
    tree: TAdvTreeView;
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
  c: TadvTreeViewColumn;
  n: TAdvTreeViewNode;
  vn: TAdvTreeViewVirtualNode;
begin //
  tree.ClearColumns;
  tree.ClearNodes;

  tree.NodesAppearance.HeightMode := tnhmVariable;


  c := Tree.Columns.Add;
  c.Text := ' ';
  c.Width := 200;


  vn := Tree.AddVirtualNode;
  vn. := 'Test';

  vn := Tree.AddVirtualNode(vn);
  vn.Text[0] := 'Test 1';


end;

end.
