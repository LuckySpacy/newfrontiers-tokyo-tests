unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, clisted, contnrs,
  Vcl.ComCtrls, Vcl.CheckLst;


type
  TCheckObj = class
    Id: Integer;
    Kurz: string;
    Text: string;
    Checked: Boolean;
  end;

type
  TForm1 = class(TForm)
    edt: TCheckListEdit;
    Button1: TButton;
    mem: TMemo;
    CheckListBox1: TCheckListBox;
    ComboBoxEx1: TComboBoxEx;
    ComboBox1: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtCheckListItemToText(sender: TObject; var aText: string);
    procedure edtShowCheckList(Sender: TObject);
    procedure edtClickCheck(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure edtTextToCheckListItem(sender: TObject; var aItem: string);
    procedure edtClick(Sender: TObject);
    procedure edtClickBtn(Sender: TObject);
    procedure ComboBox1DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure ComboBox1Select(Sender: TObject);
  private
    fList: TObjectList;
    Selected: array of Boolean;
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}




procedure TForm1.FormCreate(Sender: TObject);
  function ErzeugeCheckObj(aKurz, aText: String; var aId: Integer): TCheckObj;
  begin
    inc(aId);
    Result := TCheckObj.Create;
    Result.Id := aId;
    Result.Kurz := aKurz;
    Result.Text := aKurz + ' ' + aText;
    Result.Checked := false;
    fList.Add(Result);
  end;
var
  i1: Integer;
begin
  fList := TObjectList.Create;

  i1 := 0;
  ErzeugeCheckObj('[1]', 'Test1', i1);
  ErzeugeCheckObj('[2]', 'Test2', i1);
  ErzeugeCheckObj('[3]', 'Test3', i1);
  ErzeugeCheckObj('[4]', 'Test4', i1);
  ErzeugeCheckObj('[5]', 'Test5', i1);
  ErzeugeCheckObj('[6]', 'Test6', i1);
  ErzeugeCheckObj('[7]', 'Test7', i1);
  ErzeugeCheckObj('[8]', 'Test8', i1);
  ErzeugeCheckObj('[9]', 'Test9', i1);
  ErzeugeCheckObj('[10]', 'Test10', i1);
  ErzeugeCheckObj('[10]', 'Test11', i1);
  ErzeugeCheckObj('[10]', 'Test12', i1);
  ErzeugeCheckObj('[10]', 'Test13', i1);

  edt.Clear;

  for i1 := 0 to fList.Count -1 do
    edt.Items.AddObject(TCheckObj(fList.Items[i1]).Text, fList.Items[i1]);

end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fList);
end;


procedure TForm1.Button1Click(Sender: TObject);
var
  i1: Integer;
  x: TCheckObj;
begin
  //edt.Text := 'Hallo ein Text';
  {
  for i1 := 0 to edt.Items.Count -1 do
  begin
    if edt.Checked[i1] then
      mem.Lines.Add(edt.Items[i1]);
  end;
  }
  mem.Clear;
  for i1 := 0 to fList.Count -1 do
  begin
    x := TCheckObj(fList.Items[i1]);
    if x.checked then
      mem.Lines.Add(x.Text);
  end;
end;

procedure TForm1.ComboBox1DrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  SetLength(Selected, TComboBox(Control).Items.Count);
  with TComboBox(Control).Canvas do
  begin
    FillRect(rect);

    Rect.Left := Rect.Left + 1;
    Rect.Right := Rect.Left + 13;
    Rect.Bottom := Rect.Bottom;
    Rect.Top := Rect.Top;

    if not (odSelected in State) and (Selected[Index]) then
      DrawFrameControl(Handle, Rect, DFC_BUTTON,
        DFCS_BUTTONCHECK or DFCS_CHECKED or DFCS_FLAT)
    else if (odFocused in State) and (Selected[Index]) then
      DrawFrameControl(Handle, Rect, DFC_BUTTON,
        DFCS_BUTTONCHECK or DFCS_CHECKED or DFCS_FLAT)
    else if (Selected[Index]) then
      DrawFrameControl(Handle, Rect, DFC_BUTTON,
        DFCS_BUTTONCHECK or DFCS_CHECKED or DFCS_FLAT)
    else if not (Selected[Index]) then
      DrawFrameControl(Handle, Rect, DFC_BUTTON, DFCS_BUTTONCHECK or DFCS_FLAT);

    TextOut(Rect.Left + 15, Rect.Top, TComboBox(Control).Items[Index]);
  end;
end;

procedure TForm1.ComboBox1Select(Sender: TObject);
var
  i: Integer;
  Sel: string;
begin
  Sel := EmptyStr;
  Selected[TComboBox(Sender).ItemIndex] := not Selected[TComboBox(Sender).ItemIndex];
  for i := 0 to TComboBox(Sender).Items.Count - 1 do
    if Selected[i] then
      Sel := Sel + TComboBox(Sender).Items[i] + ' ';
end;

procedure TForm1.edtCheckListItemToText(sender: TObject; var aText: string);
var
  s: string;
  iAnfang: Integer;
  iEnde: Integer;
begin
  exit;
//  aText := '1';
//  exit;
  s := aText;

  iAnfang := Pos('[', s);
  iEnde   := Pos(']', s);
  if (iAnfang > 0) and (iEnde > 0) then
    s := copy(s, iAnfang+1, iEnde-iAnfang-1)
  else
    s := '';
  aText := s;
//  mem.Lines.Add(s);
end;


procedure TForm1.edtClick(Sender: TObject);
var
  i1: Integer;
  x: TCheckObj;
begin
  for i1 := 0 to edt.Items.Count -1 do
  begin
    x := TCheckObj(edt.Items.Objects[i1]);
    edt.Checked[i1] := x.Checked;
  end;
end;

procedure TForm1.edtClickBtn(Sender: TObject);
var
  i1: Integer;
  x: TCheckObj;
  s: string;
begin
  s := '';
  for i1 := 0 to edt.Items.Count -1 do
  begin
    x := TCheckObj(edt.Items.Objects[i1]);
    if not x.Checked then
      continue;

    if s = '' then
      s := s + x.Text
    else
      s := s + ',' + x.Text;

  end;
  edt.Text := '['+s+']';
end;

procedure TForm1.edtClickCheck(Sender: TObject);
var
  i1: Integer;
  x: TCheckObj;
begin
  for i1 := 0 to edt.Items.Count -1 do
  begin

   if edt.Checked[i1] then
     Caption := IntToStr(i1);

    x := TCheckObj(edt.Items.Objects[i1]);
    x.Checked := edt.State[i1] = cbChecked;

  end;

  mem.Clear;
  for i1 := 0 to edt.Items.Count -1 do
  begin

    x := TCheckObj(edt.Items.Objects[i1]);

    if x.Checked then
      mem.Lines.Add(x.Text);

  end;

end;

procedure TForm1.edtShowCheckList(Sender: TObject);
var
  i1: Integer;
  x: TCheckObj;
begin
  exit;
  for i1 := 0 to edt.Items.Count -1 do
  begin
    x := TCheckObj(edt.Items.Objects[i1]);
    edt.Checked[i1] := x.Checked;
  end;
end;


procedure TForm1.edtTextToCheckListItem(sender: TObject; var aItem: string);
begin
  //aItem := TCheckObj(Sender).Kurz;
end;

end.
