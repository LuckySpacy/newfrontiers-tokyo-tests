unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    GroupBox1: TGroupBox;
    lbl_Bildschirmhoehe: TLabel;
    lbl_Bildschirmbreite: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  nb30;

function GetAdapterInfo(Lana: Char): String;
var  Adapter : TAdapterStatus;
var  NCB    : TNCB;
begin
  FillChar(NCB, SizeOf(NCB), 0);
  NCB.ncb_command := Char(NCBRESET);
  NCB.ncb_lana_num := AnsiChar(Lana);
  if Netbios(@NCB) <> Char(NRC_GOODRET) then
     begin
     Result := 'not found 1';
     Exit;
     end;
  FillChar(NCB, SizeOf(NCB), 0);
  NCB.ncb_command := Char(NCBASTAT);
  NCB.ncb_lana_num := AnsiChar(Lana);
  NCB.ncb_callname := '*';
  FillChar(Adapter, SizeOf(Adapter), 0);
  NCB.ncb_buffer := @Adapter;
  NCB.ncb_length := SizeOf(Adapter);
  if Netbios(@NCB) <> Char(NRC_GOODRET) then
     begin
     Result := 'not found 2';
     Exit;
     end;
  Result :=
    IntToHex(Byte(Adapter.adapter_address[0]), 2) + '-' +
    IntToHex(Byte(Adapter.adapter_address[1]), 2) + '-' +
    IntToHex(Byte(Adapter.adapter_address[2]), 2) + '-' +
    IntToHex(Byte(Adapter.adapter_address[3]), 2) + '-' +
    IntToHex(Byte(Adapter.adapter_address[4]), 2) + '-' +
    IntToHex(Byte(Adapter.adapter_address[5]), 2);
end;


function GetMACAdress: string;
var AdapterList : TLanaEnum;
var NCB        : TNCB;
begin
  FillChar(NCB, SizeOf(NCB), 0);
  NCB.ncb_command := Char(NCBENUM);
  NCB.ncb_buffer := @AdapterList;
  NCB.ncb_length := SizeOf(AdapterList);
  Netbios(@NCB);
  if Byte(AdapterList.length) > 0 then
     Result := GetAdapterInfo(Char(AdapterList.lana[0]))
  else
     Result := 'not found 3';
end;







procedure TForm1.Button1Click(Sender: TObject);
begin
  caption := GetMACAdress;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  lbl_Bildschirmhoehe.Caption := 'Höhe: ' + IntToStr(screen.Monitors[0].Height);
  lbl_BildschirmBreite.Caption := 'Breite: ' + IntToStr(screen.Monitors[0].Width);
end;

end.
