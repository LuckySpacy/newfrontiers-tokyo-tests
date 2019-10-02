unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, NFSRichViewtoolbar,
  RVScroll, RichView, RVEdit, NFSRichViewEdit, Vcl.StdCtrls, Vcl.Samples.Spin,
  AdvPanel, NfsLabel, NFSCustomPanel, Vcl.Menus, NFSRichviewPopUp, AdvUtil,
  Vcl.Buttons, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, RVHunSpell,
  NFSRichViewHunspell;

type
  TEnumMenuItemProc = procedure (item: TMenuItem) of object;

type
  TForm1 = class(TForm)
    rv: TNFSRichViewEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    SpinEdit1: TSpinEdit;
    btn_Sichtbar: TButton;
    Panel1: TPanel;
    NfsLabel1: TNfsLabel;
    NFSCustomPanel1: TNFSCustomPanel;
    Toolbar: TNFSRichViewtoolbar;
    pop: TPopupMenu;
    Hallo1: TMenuItem;
    Button4: TButton;
    NFSRichviewPopUp1: TNFSRichviewPopUp;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    NFSCustomPanel2: TNFSCustomPanel;
    NFSRvHunspell1: TNFSRvHunspell;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btn_SichtbarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grdControlEditDone(Sender: TObject; ARow,
      ACol: Integer; CtrlID, CtrlType, CtrlVal: string);
    procedure Hallo1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure NFSRichviewPopUp1mnu_OeffnenClick(Sender: TObject);
    procedure EnumMenuItem(item: TMenuItem);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    //procedure SchreibeItems(item: TMenuItem; proc: TEnumMenuItemProc);
    procedure CreateItems;
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{
DictCustomerDir := C:\Users\tbachmann.GB\AppData\Roaming\Optima\Hunspell\TBACH\
DictCustomerName := Custom.woe
DictDir := C:\Users\tbachmann.GB\AppData\Roaming\Optima\Hunspell\TBACH\
DictName := German.dic
DLLDir := C:\Users\tbachmann.GB\AppData\Roaming\Optima\Hunspell\TBACH\
DLLName := hunspell32.dll
}


procedure EnumerateMenuItems(item: TMenuItem; proc: TEnumMenuItemProc);
var
  i: Integer;
  subItem: TMenuItem;
begin
  for i := 0 to Pred(item.Count) do
  begin
    subItem := item.Items[i];
    proc(subItem);
    if subItem.Count > 0 then
      EnumerateMenuItems(subItem, proc);
  end;
end;

procedure TForm1.grdControlEditDone(Sender: TObject; ARow,
  ACol: Integer; CtrlID, CtrlType, CtrlVal: string);
begin
  ShowMessage('Edit Done');

end;

procedure TForm1.Hallo1Click(Sender: TObject);
begin
  ShowMessage('hallo');
end;

procedure TForm1.NFSRichviewPopUp1mnu_OeffnenClick(Sender: TObject);
begin
  ShowMessage('Open');
end;

procedure TForm1.btn_SichtbarClick(Sender: TObject);
begin
  //NFSRichViewtoolbar1.Visible := not NFSRichViewtoolbar1.Visible;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
   Toolbar.Hunspell.Spell.UseSpell := true;
  //Toolbar.Visible := true;
  //Toolbar.RichviewEdit := nil;
  //NFSRichViewtoolbar1.Buttons.Bold.Visible := true;
  //NFSRichViewtoolbar1.Spell.UseSpell := true;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Toolbar.Hunspell.Spell.UseSpell := false;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  //NFSRichViewtoolbar1.Positions.Fontsize := SpinEdit1.Value;
  //NFSRichViewtoolbar1.Durchnummerieren;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  rv.ClearIt;
  EnumerateMenuItems(pop.Items, EnumMenuItem);
  rv.Format;
end;



procedure TForm1.Button5Click(Sender: TObject);
var
  m: TMenuItem;
begin
  m := NFSRichviewPopUp1.FindMenuItemByName('mnu_Format_Zwischenablage');
  if m <> nil then
    Caption := m.Name;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  rv.ReadOnly := true;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  rv.ReadOnly := false;
end;

procedure TForm1.EnumMenuItem(item: TMenuItem);
begin
  rv.AddNL(Item.Caption, 0, 0);
end;



{
procedure TForm1.SchreibeItems(item: TMenuItem; proc: TEnumMenuItemProc);
var
  i: Integer;
  subItem: TMenuItem;
begin
  for i := 0 to Pred(item.Count) do
  begin
    rv.AddNL(Item.Caption, 0, 0);
    subItem := item.Items[i];
    proc(subItem);
    if subItem.Count > 0 then
      SchreibeItems(subItem, proc);
  end;
end;
}

procedure TForm1.FormCreate(Sender: TObject);
//var
//  Toolbar : TNfsRichViewToolbar;
begin
  //Toolbar := TNfsRichViewToolbar.Create(Self);
   Toolbar.Hunspell.Spell.UseSpell := true;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Toolbar.FontFavList.Add('Tahoma');
  Toolbar.FontFavList.Add('Comic Sans MS');
  CreateItems;
end;


procedure TForm1.CreateItems;
  function CreateItem(aSourceItem: TMenuItem; aCaption, aShortCut: string): TMenuItem;
  var
    NewItem: TMenuItem;
  begin
    NewItem := TMenuItem.Create(Self);
    NewItem.Caption := aCaption;
    if aShortCut > '' then
      NewItem.ShortCut := TextToShortCut(aShortCut);
    aSourceItem.Add(NewItem);
    Result := NewItem;
//    Newitem.Onclick := Hallo1Click;
  end;
var
  Item: TMenuItem;
begin
  pop.Items.Clear;
  CreateItem(pop.Items, 'Datei', '');
  CreateItem(pop.Items, 'Bearbeiten', '');
  Item := CreateItem(pop.Items, 'Einfügen', '');
  CreateItem(pop.Items, 'Tabelle', '');
  CreateItem(pop.Items, 'Zwischenablage', '');

  CreateItem(pop.Items[0], 'Öffnen', '').OnClick := Hallo1Click;

  CreateItem(pop.Items[0], 'Speichern', '');
  CreateItem(pop.Items[0], 'Alles entfernen', '');
  CreateItem(pop.Items[0], 'Druckvorschau', '');
  CreateItem(pop.Items[0], 'Drucken', '');

  CreateItem(pop.Items[1], 'Rückgängig', 'Strg+Z');
  CreateItem(pop.Items[1], '-', '');
  CreateItem(pop.Items[1], 'Ausschneiden', 'Strg+X');
  CreateItem(pop.Items[1], 'Kopieren', 'Strg+C');
  CreateItem(pop.Items[1], 'Einfügen', 'Strg+V');
  CreateItem(pop.Items[1], 'Löschen', 'Entf');
  CreateItem(pop.Items[1], '-', '');
  CreateItem(pop.Items[1], 'Alles markieren', 'Strg+A');
  CreateItem(pop.Items[1], 'Suchen', 'Strg+F');
  CreateItem(pop.Items[1], 'Suchen und Ersetzen', 'Strg+H');
  CreateItem(pop.Items[1], '-', '');
  CreateItem(pop.Items[1], 'Seitenumbruch', '');

  CreateItem(Item, 'Datei einfügen', '');
  CreateItem(Item, 'Bild einfügen', '');
  CreateItem(Item, 'Linie', '');

  CreateItem(pop.Items[3], 'Tabelle einfügen', '');
  Item := CreateItem(pop.Items[3], 'Einfügen', '');
  CreateItem(Item, 'Zeile einfügen', '');
  CreateItem(Item, 'Spalte links einfügen', '');
  CreateItem(Item, 'Spalte rechts einfügen', '');

end;


end.
