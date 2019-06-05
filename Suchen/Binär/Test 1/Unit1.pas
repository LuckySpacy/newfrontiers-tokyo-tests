unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    edt: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    fList: TStringList;
  public
    function Suchen(aZahl: Integer): Integer;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.FormCreate(Sender: TObject);
var
  i1: Integer;
begin
  fList := TStringList.Create;
  //for i1 := 1 to 1000000 do
  for i1 := 1 to 10000 do
  begin
    fList.Add(IntToStr(i1));
  end;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fList);
end;

function TForm1.Suchen(aZahl: Integer): Integer;
var
  L, R, M : Integer;
  Gefunden: Boolean;
  Zahl: Integer;
  Durchlauf: Integer;
begin
  Result := -1;
  Memo1.Clear;

  if aZahl > fList.Count then
  begin
    memo1.Lines.Add('Zahl ist zu hoch');
    exit;
  end;

  L := 0;
  R := fList.Count;
  M := -1;
  Gefunden := false;
  Durchlauf := 0;

  while (L <= R) and (not Gefunden) do
  begin
    M := (L+R) div 2;
    Zahl := StrToInt(fList.Strings[M]);
    Memo1.Lines.Add('Geprüfte Zahl: ' + fList.Strings[M]);
    if aZahl < Zahl then
      R := M - 1;
    if aZahl > Zahl then
      L := M + 1;
    if aZahl = Zahl then
      Gefunden := true;
    inc(Durchlauf);
  end;

  if Gefunden then
    Result := M;

  Memo1.Lines.Add('Durchlauf: ' + IntToStr(Durchlauf));

end;


procedure TForm1.Button1Click(Sender: TObject);
var
  ItemIndex: Integer;
begin
  ItemIndex := Suchen(StrToInt(edt.Text));
  if ItemIndex > -1 then
    Caption := 'Gefunden = ' + fList.Strings[ItemIndex]
  else
    Caption := 'Nicht Gefunden ';
end;


end.
