unit Frame.Sendungsverfolgung;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, iduri;

type
  Tfra_Sendungsverfolgung = class(TFrame)
    Panel1: TPanel;
    Button1: TButton;
    IdHTTP: TIdHTTP;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

implementation

{$R *.dfm}

procedure Tfra_Sendungsverfolgung.Button1Click(Sender: TObject);
var
  sxml: string;
  s: string;
  resp: TMemoryStream;
begin
  sxml :='?xml=<?xml version="1.0" encoding="UTF-8" standalone="no"?> <data appname="zt12345" language-code="de" password="geheim" piece-code="00340434161094015902" request="d-get-piece-detail"/>';
  s := 'https://cig.dhl.de/services/sandbox/rest/sendungsverfolgung' + sxml;
  {
  resp := TMemoryStream.Create;
  try
    idHTTP.Get(s, resp);
  except
  end;
  resp.Position := 0;
  Memo1.Lines.LoadFromStream(resp);
  FreeAndNil(resp);
  }

  try
    //Memo1.Lines.Text :=  idHTTP.Get(TIdURI.URLEncode(s));
    s :=  TIdURI.URLEncode(s);
    Memo1.Lines.Text :=  idHTTP.Get(TIdURI.URLEncode(s));
  except

  end;

end;

end.
