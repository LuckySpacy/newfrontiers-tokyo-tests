unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
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
  DECUtil, DECCipher, DECHash, DECFmt;

var
  ACipherClass: TDECCipherClass = TCipher_Rijndael;
  ACipherMode: TCipherMode = cmCBCx;
  AHashClass: TDECHashClass = THash_Whirlpool;
  ATextFormat: TDECFormatClass = TFormat_Mime64;
  AKDFIndex: LongWord = 1;


function Encrypt(const AText: String; const APassword: String): String; overload;
var
  ASalt: Binary;
  AData: Binary;
  APass: Binary;
begin
  with ValidCipher(ACipherClass).Create, Context do
  try
    ASalt := RandomBinary(16);
    APass := ValidHash(AHashClass).KDFx(APassword[1], Length(APassword) * SizeOf(APassword[1]), ASalt[1], Length(ASalt), KeySize, TFormat_Copy, AKDFIndex);
    Mode := ACipherMode;
    Init(APass);
    SetLength(AData, Length(AText) * SizeOf(AText[1]));
    Encode(AText[1], AData[1], Length(AData));
    Result := ValidFormat(ATextFormat).Encode(ASalt + AData + CalcMAC);
  finally
    Free;
    ProtectBinary(ASalt);
    ProtectBinary(AData);
    ProtectBinary(APass);
  end;
end;

function Encrypt(const AText: WideString; const APassword: WideString): WideString; overload;
var
  ASalt: Binary;
  AData: Binary;
  APass: Binary;
begin
  with ValidCipher(ACipherClass).Create, Context do
  try
    ASalt := RandomBinary(16);
    APass := ValidHash(AHashClass).KDFx(APassword[1], Length(APassword) * SizeOf(APassword[1]), ASalt[1], Length(ASalt), KeySize, TFormat_Copy, AKDFIndex);
    Mode := ACipherMode;
    Init(APass);
    SetLength(AData, Length(AText) * SizeOf(AText[1]));
    Encode(AText[1], AData[1], Length(AData));
    Result := ValidFormat(ATextFormat).Encode(ASalt + AData + CalcMAC);
  finally
    Free;
    ProtectBinary(ASalt);
    ProtectBinary(AData);
    ProtectBinary(APass);
  end;
end;

function Decrypt(const AText: String; const APassword: String): String; overload;
var
  ASalt: Binary;
  AData: Binary;
  ACheck: Binary;
  APass: Binary;
  ALen: Integer;
begin
  with ValidCipher(ACipherClass).Create, Context do
  try
    ASalt := ValidFormat(ATextFormat).Decode(AText);
    ALen := Length(ASalt) - 16 - BufferSize;
    AData := System.Copy(ASalt, 17, ALen);
    ACheck := System.Copy(ASalt, ALen + 17, BufferSize);
    SetLength(ASalt, 16);
    APass := ValidHash(AHashClass).KDFx(APassword[1], Length(APassword) * SizeOf(APassword[1]), ASalt[1], Length(ASalt), KeySize, TFormat_Copy, AKDFIndex);
    Mode := ACipherMode;
    Init(APass);
    SetLength(Result, ALen div SizeOf(AText[1]));
    Decode(AData[1], Result[1], ALen);
    if ACheck <> CalcMAC then
      raise Exception.Create('Invalid data');
  finally
    Free;
    ProtectBinary(ASalt);
    ProtectBinary(AData);
    ProtectBinary(ACheck);
    ProtectBinary(APass);
  end;
end;

function Decrypt(const AText: WideString; const APassword: WideString): WideString; overload;
var
  ASalt: Binary;
  AData: Binary;
  ACheck: Binary;
  APass: Binary;
  ALen: Integer;
begin
  with ValidCipher(ACipherClass).Create, Context do
  try
    ASalt := ValidFormat(ATextFormat).Decode(AText);
    ALen := Length(ASalt) - 16 - BufferSize;
    AData := System.Copy(ASalt, 17, ALen);
    ACheck := System.Copy(ASalt, ALen + 17, BufferSize);
    SetLength(ASalt, 16);
    APass := ValidHash(AHashClass).KDFx(APassword[1], Length(APassword) * SizeOf(APassword[1]), ASalt[1], Length(ASalt), KeySize, TFormat_Copy, AKDFIndex);
    Mode := ACipherMode;
    Init(APass);
    SetLength(Result, ALen div SizeOf(AText[1]));
    Decode(AData[1], Result[1], ALen);
    if ACheck <> CalcMAC then
      raise Exception.Create('Invalid data');
  finally
    Free;
    ProtectBinary(ASalt);
    ProtectBinary(AData);
    ProtectBinary(ACheck);
    ProtectBinary(APass);
  end;
end;

end.
