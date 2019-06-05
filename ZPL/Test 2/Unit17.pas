unit Unit17;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdFTP, o_zpl, Vcl.ExtCtrls;

type
  TForm17 = class(TForm)
    Memo1: TMemo;
    IdFTP1: TIdFTP;
    Panel1: TPanel;
    Button1: TButton;
    btn_Drucken_Stream: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btn_Drucken_StreamClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    procedure Print2Streams;
    procedure Drucken(aStream: TMemoryStream);
  public
    { Public-Deklarationen }
  end;

var
  Form17: TForm17;

implementation

{$R *.dfm}

uses
  o_BinConverter;



procedure TForm17.FormCreate(Sender: TObject);
begin
  Memo1.Clear;
  Memo1.Lines.Add('~WC');
   {
^XA
^F050,50
^A0N,50,50
^FDHello World^FS
^XS
  }
end;


procedure TForm17.Print2Streams;
var
  m1, m2, m3: TMemoryStream;
begin
  m1 := TMemoryStream.Create;
  m2 := TMemoryStream.Create;
  m3 := TMemoryStream.Create;
  try
    Memo1.Clear;
    Memo1.Lines.Add('^XA');
    Memo1.Lines.Add('^FO50,50^ADN,36,20^FDThomas');
    Memo1.Lines.SaveToStream(m1);
    m1.Position := 0;
    Memo1.Clear;
    Memo1.Lines.Add('^FS');
    Memo1.Lines.Add('^XZ');
    Memo1.Lines.SaveToStream(m2);
    m2.Position := 0;
    m1.SaveToStream(m3);
    m2.SaveToStream(m3);
    Drucken(m3);
  finally
    FreeAndNil(m1);
    FreeAndNil(m2);
    FreeAndNil(m3);
  end;
end;

procedure TForm17.btn_Drucken_StreamClick(Sender: TObject);
var
  m: TMemoryStream;
  ZPL: TZPL;
begin
//  Print2Streams;
//  exit;
  ZPL := TZPL.Create(Self);
  m := TMemoryStream.Create;
  try
    Memo1.Lines.SaveToStream(m);
    ZPL.print('192.168.208.54', m);
  finally
    FreeAndNil(m);
    FreeAndNil(ZPL);
  end;
end;

procedure TForm17.Button1Click(Sender: TObject);
var
  ZPL: TZPL;
begin
  ZPL := TZPL.Create(Self);
  try
    ZPL.print('192.168.208.54', Memo1.Lines.Text)
  finally
    FreeAndNil(ZPL);
  end;

end;


procedure TForm17.Button2Click(Sender: TObject);
var
  m: TMemoryStream;
  PrintStream: TMemoryStream;
  s: string;
  a: AnsiString;
begin
  m := TMemoryStream.Create;
  PrintStream := TMemoryStream.Create;
  try
    m.LoadFromFile('d:\ZPL\KN-Signet-schwarz.bmp');
    m.Position := 0;

    s := '^XA' +
         '^FO100,100^GFB,' +
         IntToStr(m.Size)+',' +
         IntToStr(151811)+',' +
         IntToStr(19458)+',';
        // + Memo1.Text;

         {
    s := '^XA' +
         '^FO100,100^GFA,' +
         IntToStr(trunc(length(Memo1.Text)/2))+',' +
         IntToStr(trunc(length(Memo1.Text)/2))+',' +
         IntToStr(80)+','
         + Memo1.Text;
         }


    Memo1.Clear;
    Memo1.Lines.Text := s;
    Memo1.Lines.SaveToStream(PrintStream);
    m.SaveToStream(PrintStream);
    Memo1.Clear;
    Memo1.Lines.Add('^XZ');
    Memo1.Lines.SaveToStream(PrintStream);
    Drucken(PrintStream);
  finally
    FreeAndNil(m);
    FreeAndNil(PrintStream);
  end;
end;




procedure TForm17.Drucken(aStream: TMemoryStream);
var
  ZPL: TZPL;
begin
  ZPL := TZPL.Create(Self);
  try
    ZPL.print('172.16.10.210', aStream);
  finally
    FreeAndNil(ZPL);
  end;
end;




procedure TForm17.Button3Click(Sender: TObject);
begin
  Memo1.Lines.Text := BinFileToHexString('d:\ZPL\T.bmp');
  HexStringToFile(Memo1.Lines.Text, 'd:\zpl\Test3.bmp');
end;


end.
