unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Generics.Collections;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
   // ntList: ist<Integer>;
   IntList: TList<Integer>;
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  IntList.Add(1);
  IntList.Add(2);
  IntList.Add(3);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  i1: Integer;
begin
  Memo1.Clear;
  for i1 := 0 to IntList.Count-1 do
  begin
    Memo1.Lines.Add(IntToStr(IntList.Items[i1]));
  end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  IntList := TList<Integer>.Create;

end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FreeAndNil(IntList);
end;

end.
