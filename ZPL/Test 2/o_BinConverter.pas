unit o_BinConverter;

interface

uses
  Classes, SysUtils;


function BinToHexString(aStream: TStream): WideString;
function BinFileToHexString(aFullFilename: string): WideString;
procedure HexStringToBin(const aHex: string; aStream: TStream);
procedure HexStringToFile(aHex, aFullFilename: string);

implementation


function BinToHexString(aStream: TStream): WideString;
var
  nChars: Integer;
  LStr1, LStr2: Widestring;
begin
  aStream.Position := 0;
  nChars := astream.Size div SizeOf(LStr1[1]);
  SetLength(LStr1, nChars);
  if nChars > 0 then
  astream.ReadBuffer(LStr1[1], nChars * SizeOf(LStr1[1]));

  SetLength(LStr2, Length(LStr1) * 4);
  BinToHex(LStr1[1], PWideChar(LStr2), Length(LStr1) * SizeOf(Char));
  Result := LStr2;
end;

function BinFileToHexString(aFullFilename: string): WideString;
var
  m: TMemoryStream;
begin
  m := TMemoryStream.Create;
  try
    m.LoadFromFile(aFullFileName);
    Result := BinToHexString(m);
  finally
    FreeAndNil(m);
  end;
end;


procedure HexStringToBin(const aHex: string; aStream: TStream);
var
  LStr1, LStr2: WideString;
  l: Integer;
begin
  LStr1 := aHex;
  SetLength(LStr2, Length(LStr1) div 4);
  HexToBin(PWideChar(LStr1), LStr2[1], Length(LStr1) div SizeOf(Char));

  aStream.Position := 0;
  l := Length(lstr2) * SizeOf(WideChar);
  aStream.Write(lstr2[1], l);

end;

procedure HexStringToFile(aHex, aFullFilename: string);
var
  m: TMemoryStream;
begin
  m := TMemoryStream.Create;
  try
    HexStringToBin(aHex, m);
    m.Position := 0;
    m.SaveToFile(aFullFileName);
  finally
    FreeAndNil(m);
  end;
end;

end.
