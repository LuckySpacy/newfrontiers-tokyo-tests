unit Unit17;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Win.ScktComp,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, vcl.printers,
  IdExplicitTLSClientServerBase, IdFTP, IdIOHandler, IdIOHandlerStream;


type
  TPassThroughData = record
      nLen: Word;
      Data: array[0..255] of Byte;
  end;

type
  TForm17 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    IdTCPClient1: TIdTCPClient;
    Button3: TButton;
    Button4: TButton;
    IdFTP1: TIdFTP;
    IdIOHandlerStream1: TIdIOHandlerStream;
    Button5: TButton;
    Memo1: TMemo;
    edt_IP: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure ClientSocket1Error(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure ClientSocket1Connecting(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocket1Connect(Sender: TObject; Socket: TCustomWinSocket);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    procedure PrintText(const s: Ansistring);
  public
    { Public-Deklarationen }
  end;

var
  Form17: TForm17;

implementation

{$R *.dfm}

uses
  fmx.printer, rawprinting;


procedure TForm17.Button1Click(Sender: TObject);
begin
  {
  ClientSocket1.Address := '172.16.10.210';
  ClientSocket1.Port := 9100;
  //ClientSocket1.Active := true;
  ClientSocket1.Open;
  }
end;


procedure TForm17.ClientSocket1Connect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  //ShowMessage('connect');
  //ClientSocket1.Socket.SendStream()
  socket.SendText('~W');
  //ClientSocket1.Active := false;
  //ClientSocket1.Close;
end;

procedure TForm17.ClientSocket1Connecting(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  ShowMessage('Connecting');
end;

procedure TForm17.ClientSocket1Error(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  ShowMessage(IntToStr(ErrorCode));
end;


procedure TForm17.Button2Click(Sender: TObject);
var
 f : TextFile;
 i1: Integer;
begin

  RAWPrint('ZDesigner GT800 (ZPL)', '', '~W');
  exit;


  for i1 := 0 to Printer.Count -1 do
  begin
    if SameText('ZDesigner GT800 (ZPL)', Printer.Printers[i1].Title) then
    begin
      Printer.ActivePrinter := Printer.Printers[i1];
      break;
    end;
  end;


  AssignPrn(f); // Textfile mit Drucker verbinden

  try
    Rewrite(f); // Textfile initialisieren
    Write(f, '' + #10);
    Write(f, 'N'+ #10);
    Write(f, 'A30,200,0,4,1,1,N,''' + 'TEXT'''+ #10);
    Write(f, 'B30,20,0,1,2,5,50,N,''' + 'BARCODE''' + #10);
    Write(f, 'P1'+ #10);

  finally
    CloseFile(f); // Textdatei schlieﬂen
  end;
end;


procedure TForm17.Button3Click(Sender: TObject);
var
  i1: IntegeR;
begin
  for i1 := 0 to Printer.Count -1 do
  begin
    if SameText('ZDesigner GT800 (ZPL)', Printer.Printers[i1].Title) then
    begin
      Printer.ActivePrinter := Printer.Printers[i1];
      break;
    end;
  end;
  Printer.BeginDoc;
  PrintText('~WC'); //statt TextOut
  Printer.EndDoc;
end;

procedure TForm17.Button4Click(Sender: TObject);
begin
  idftp1.Connect;
  idftp1.Put('d:\_a\drucker\Test.zpl');
  idftp1.Disconnect;
end;

procedure TForm17.Button5Click(Sender: TObject);
var
  List: TStringList;
  st: TMemoryStream;
begin
  List := TStringList.Create;
  st   := TMemoryStream.Create;
  try
    //List.Add('~WC');
    {
    list.Add(#10);
    List.Add('N'+ #10);
    List.Add('A30,200,0,4,1,1,N,''' + 'TEXT'''+ #10);
    List.Add('B30,20,0,1,2,5,50,N,''' + 'BARCODE''' + #10);
    List.Add('P1'+ #10);
    }

    idftp1.Host := edt_IP.Text;
    List.Text := Memo1.Text;

    List.SaveToStream(st);
    list.SaveToFile('o:\zpl.txt');
    st.Position := 0;
    try
      idftp1.Connect;
    except
      on e: exception do
      begin
        showMessage('Connect' + e.Message);
      end;
    end;
    try
      idftp1.Put(st, 'test.zpl');
    except
      on e: exception do
      begin
        showMessage('Put' + e.Message);
      end;
    end;
    try
      idftp1.Disconnect;
    except
      on e: exception do
      begin
        showMessage('Desconnect' + e.Message);
      end;
    end;
  finally
    FreeAndNil(List);
    FreeAndNil(st);
  end;
end;

procedure TForm17.PrintText(const s: Ansistring);
var
  PTBlock: TPassThroughData;
begin
  PTBlock.nLen := Length(s);
  StrPCopy(@PTBlock.Data, s);
  Escape(vcl.printers.Printer.Handle, PASSTHROUGH, 0, @PTBlock, nil);
end;


end.
