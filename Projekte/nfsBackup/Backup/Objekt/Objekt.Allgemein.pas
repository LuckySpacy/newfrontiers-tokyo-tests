unit Objekt.Allgemein;

interface

uses
  SysUtils, Classes, Objekt.Logger, Winapi.Windows, Objekt.Ini,
  uTPLb_CryptographicLibrary, uTPLb_Codec;

type
  TAllgemeinObj = class
  private
    fLog: TLoggerObj;
    fIni: TIni;
    fKey: string;
    fLibrary : TCryptographicLibrary;
    fCodec   : TCodec;
  protected
  public
    constructor Create;
    destructor Destroy; override;
    procedure Init;
    property Log: TLoggerObj read fLog write fLog;
    property Ini: TIni read fIni write fIni;
    function Verschluesseln(aValue: string): string;
    function Entschluesseln(aValue: string): string;
  end;

var
  AllgemeinObj: TAllgemeinObj;


implementation

{ TAllgemein }

constructor TAllgemeinObj.Create;
begin
  Init;
  fLog := TLoggerObj.Create;
  fIni := TIni.Create;
  fLibrary := TCryptographicLibrary.Create(nil);
  fCodec := TCodec.Create(nil);
  fCodec.CryptoLibrary := FLibrary;
  fCodec.StreamCipherId := 'native.StreamToBlock';
  fCodec.BlockCipherId := 'native.AES-256';
  fCodec.ChainModeId := 'native.ECB';
  fCodec.Password := fKey;
end;

destructor TAllgemeinObj.Destroy;
begin
  FreeAndNil(fLog);
  FreeAndNil(fIni);
  FreeAndNil(fLibrary);
  FreeAndNil(fCodec);
  inherited;
end;



procedure TAllgemeinObj.Init;
begin
  fKey := 'Au!7p‹e‰%"o9)$cC÷6543?=Qq@Gc';
end;



function TAllgemeinObj.Entschluesseln(aValue: string): string;
var
  fEncoding : TEncoding;
begin
  fCodec.DecryptString(Result, aValue, FEncoding.ANSI);
end;

function TAllgemeinObj.Verschluesseln(aValue: string): string;
var
  fEncoding : TEncoding;
begin
  fCodec.EncryptString(aValue, Result, FEncoding.ANSI);
end;

end.
