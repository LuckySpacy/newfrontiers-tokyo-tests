unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, clisted, nfsCheckListEdit, contnrs;

type
  TCheckObj = class
    Id: Integer;
    Kurz: string;
    Text: string;
    Checked: Boolean;
  end;

type
  TForm1 = class(TForm)
    edt: TNfsCheckListEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtStateChanged(Sender: TObject; var aText: string);
  private
    fList: TObjectList;
    function getAnzeigeText(aValue: string): string;
  public
    { Public-Deklarationen }
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
  ErzeugeCheckObj('1', 'Test1', i1);
  ErzeugeCheckObj('2', 'Test2', i1);
  ErzeugeCheckObj('3', 'Test3', i1);
  ErzeugeCheckObj('4', 'Test4', i1);
  ErzeugeCheckObj('5', 'Test5', i1);
  ErzeugeCheckObj('6', 'Test6', i1);
  ErzeugeCheckObj('7', 'Test7', i1);
  ErzeugeCheckObj('8', 'Test8', i1);
  ErzeugeCheckObj('9', 'Test9', i1);
  ErzeugeCheckObj('10', 'Test10', i1);
  ErzeugeCheckObj('10', 'Test11', i1);
  ErzeugeCheckObj('10', 'Test12', i1);
  ErzeugeCheckObj('10', 'Test13', i1);

  edt.Clear;

  for i1 := 0 to fList.Count -1 do
    edt.Items.AddObject(TCheckObj(fList.Items[i1]).Text, fList.Items[i1]);

end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fList);
end;

function TForm1.getAnzeigeText(aValue: string): string;
var
  s: string;
  iAnfang: Integer;
  iEnde: Integer;
begin
  s := aValue;

  iAnfang := Pos('[', s);
  iEnde   := Pos(']', s);
  if (iAnfang > 0) and (iEnde > 0) then
    s := copy(s, iAnfang+1, iEnde-iAnfang-1)
  else
    s := '';
  Result := s;
end;


procedure TForm1.edtStateChanged(Sender: TObject; var aText: string);
var
  i1: Integer;
  x: TCheckObj;
begin
  aText := '';
  for i1 := 0 to edt.Items.Count -1 do
  begin
    x := TCheckObj(edt.Items.Objects[i1]);
    if not edt.Checked[i1] then
      continue;
    if aText = '' then
      aText := x.Kurz
    else
      aText := aText + ',' + x.Kurz;
  end;
  if aText > '' then
    aText := '[' + aText + ']';
end;


end.
