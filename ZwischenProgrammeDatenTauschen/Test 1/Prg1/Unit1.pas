unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Objekt.TapiData;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    fTapiData: TTapiData;
    procedure TapiAction(aValue: string);
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


{
procedure TForm1.Button1Click(Sender: TObject);
var
  aCopyData: TCopyDataStruct;
  hTargetWnd: HWND;
begin
  with aCopyData do
  begin
    dwData := 0;
    cbData := StrLen(PChar(Edit1.Text)) + 1;
    lpData := PChar(Edit1.Text)
  end;
  // Search window by the window title
  // Fenster anhand des Titelzeilentext suchen
  //hTargetWnd := FindWindowEx(0, 0, nil, PChar('Tfrm_Prg2'));
  hTargetWnd := FindWindow('Tfrm_Prg2', nil);
  if hTargetWnd <> 0 then
    SendMessage(hTargetWnd, WM_COPYDATA, Longint(Handle), Longint(@aCopyData))
  else
    ShowMessage('No Recipient found!');
end;
}


procedure TForm1.Button1Click(Sender: TObject);
var
  CopyData: TCopyDataStruct;
  hTargetWnd: HWND;
  s: UTF8String;
begin
  //hTargetWnd := FindWindow('TPrg2CopyData', nil);
//  hTargetWnd := FindWindow('Tfrm_Prg2', nil);
  hTargetWnd := FindWindow('TFrmMain', nil);
  if hTargetWnd = 0 then
  begin
    ShowMessage('No Recipient found!');
    exit;
  end;

  fTapiData.Init;
  fTapiData.Befehl := '1';
  fTapiData.KU_ID := 33927;

  //s := UTF8String(Edit1.Text);
  s := UTF8String(fTapiData.getValue);

  CopyData.dwData := 1;
  CopyData.cbData := Length(s) * SizeOf(AnsiChar);
  CopyData.lpData := PAnsiChar(s);

  SendMessage(hTargetWnd, WM_COPYDATA, WPARAM(Handle), LPARAM(@CopyData));

end;

procedure TForm1.Button2Click(Sender: TObject);
var
  s: string;
begin
  s := 'Befehl=1'+sLineBreak+'KU_ID=4711'+sLineBreak;
  TapiAction(s);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  fTapiData := TTapiData.Create;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fTapiData);
end;

procedure TForm1.TapiAction(aValue: string);
begin
  fTapiData.setValue(aValue);
  if fTapiData.Befehl = '1' then
    caption := IntToStr(fTapiData.KU_ID);
end;

end.
