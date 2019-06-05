//==================================================
//All code herein is copyrighted by
//Peter Morris
//-----
//No copying, alteration, or use is permitted without
//prior permission from myself.
//------
//Do not alter / remove this copyright notice
//Email me at : FastStrings@stuckindoors.com
//
//(Check out www.stuckindoors.com if you need a free events page on your site !)
//==================================================
//Ps
//Permission can be obtained very easily, and there is no ££££ involved,
//please email me for permission, this way you can be included on the
//email list to be notififed of updates / fixes etc.

//(It just includes sending my kids a postcard, nothing more !)

//Modifications
//==============================================================================
//Date  : 28 July, 2000
//Found : Pete M
//Fixed : Pete M
//Change: Some people have requested ReverseStr.
//        Personally I have no idea what you would use it for, but it was simple
//        enough to write so I did.
//        Ps, Oliver's 1st ever birthday tomorrow :-)
//==============================================================================
//Date  : 3 July, 2000
//Found : Pete M + Ozz Nixon (Brain patchwork DX)
//Fixed : Pete M
//Change: changed Left to LeftStr (so as not to get confused with TForm.Left)
//        changed RIGHT to RightStr to comply with LEFT
//        Added CopyStr (quicker than COPY)
//        Used SetLength method as pointed out by Ozz Nixon
//==============================================================================
//Date  : 10 July, 2000
//Found : NEW FEATURE
//Fixed : Pete M
//Change: Routine to convert HTML RGB to TColor,
//        HEX to INT
//        URL to plain text
//        Decrypt and Encrypt
//        StringMatches
//        MissingText
//        ExtractHTML
//        ExtractNonHTML
//        RandomStr
//        RandomFilename
//        UniqueFilename
//        GetValue
//        WordAt
//==============================================================================
//Date  : 3 July, 2000
//Found : NEW FEATURE
//Fixed : Pete M
//Change: After using ASP for a short while I have become quite fond of the
//        LEFT and RIGHT functions.  So I added them.
//==============================================================================
//Date  : 26 June, 2000
//Found : NEW FEATURE
//Fixed : Pete M
//Change: Someone asked for a StringCount function, to count how many times a
//        sub string exists within a string.
//        Don't know if it is fast or not, so you'll just have to try it out.

unit FastStringFuncs;

interface

Uses
  FastStrings, Graphics, Sysutils, Classes;

const
  cHexChars = '0123456789ABCDEF';

function Decrypt(const S: String; Key: Word): String;
function Encrypt(const S: String; Key: Word): String;
function ExtractHTML(S : String) : String;
function ExtractNonHTML(S : String) : String;
function CopyStr(const aSourceString : String; aStart, aLength : Integer) : String;
function GetValue(ValueName, Text : String) : String;
function HexToInt(aHex : String) : int64;
function LeftStr(const aSourceString : String; Size : Integer) : String;
function StringMatches(Value, Pattern : String) : Boolean;
function MissingText(Pattern, Source : String; SearchText : String = '?') : String;
function RandomFileName(aFilename : String) : String;
function RandomStr(aLength : Longint) : String;
function ReverseStr(const aSourceString : String) : String;
function RightStr(const aSourceString : String; Size : Integer) : String;
function RGBToColor(aRGB : String) : TColor;
function StringCount(const aSourceString, aFindString : String; Const CaseSensitive : Boolean = TRUE) : Integer;
function UniqueFilename(aFilename : String) : String;
function URLToText(aValue : String) : String;
function WordAt(Text : String; Position : Integer) : String;

procedure Split(aValue : String; aDelimiter : Char; Result : TStrings);

implementation
const
  cKey1 = 52845;
  cKey2 = 22719;

function StripHTMLorNonHTML(S : String; WantHTML : Boolean) : String; forward;

//Encrypt a string
function Encrypt(const S: String; Key: Word): String;
var
I: byte;
begin
 SetLength(result,length(s));
 for I := 1 to Length(S) do
    begin
        Result[I] := char(byte(S[I]) xor (Key shr 8));
        Key := (byte(Result[I]) + Key) * cKey1 + cKey2;
    end;
end;

//Return only the HTML of a string
function ExtractHTML(S : String) : String;
begin
  Result := StripHTMLorNonHTML(S,True);
end;

function CopyStr(const aSourceString : String; aStart, aLength : Integer) : String;
var
  L                           : Integer;
begin
  L := Length(aSourceString);
  if L=0 then exit;

  if aStart + (aLength-1) > L then aLength := L - (aStart-1);

  if (aStart <1) then exit;

  SetLength(Result,aLength);
  FastCharMove(aSourceString[aStart], Result[1], aLength);
end;

//Take all HTML out of a string
function ExtractNonHTML(S : String) : String;
begin
  Result := StripHTMLorNonHTML(S,False);
end;

//Decrypt a string encoded with Encrypt
function Decrypt(const S: String; Key: Word): String;
var
I: byte;
begin
 SetLength(result,length(s));
 for I := 1 to Length(S) do
    begin
        Result[I] := char(byte(S[I]) xor (Key shr 8));
        Key := (byte(S[I]) + Key) * cKey1 + cKey2;
    end;
end;

//GetValue("age","name=pete password=pete age=27") would return 27
function GetValue(ValueName, Text : String) : String;
var
  S     : String;
  L,
  X,
  P     : Integer;
  FoundEquals,
  WordStarted,
  InQuote : Boolean;
begin
  Result := '';
  S := UpperCase(Text);
  P := Pos(UpperCase(ValueName),S);
  if P = 0 then exit;

  Delete(Text,1,P-1);

  L := Length(S);
  WordStarted := False;
  FoundEquals := False;
  InQuote := False;

  for X := 1 to L do
    if Text[X] = '=' then begin
      FoundEquals := True;
      P := X;
      Break;
    end;

  if not FoundEquals then exit;

  for X := P +1 to L do
    if Text[X] <> ' ' then begin
      WordStarted := True;
      P := X;
      Break;
    end;

  if not WordStarted then exit;

  if Text[X] in ['"', ''''] then begin
    InQuote := True;
    Inc(P);
  end;

  for X:= P to L do begin
    if InQuote then begin
      if Text[X] in ['"', ''''] then
        Break
      else
        Result := Result + Text[X];
    end else begin
      if UpCase(Text[X]) in ['A'..'Z','0'..'9','\','/','.','-','_',':'] then
        Result := Result + Text[X]
      else
        Break;
    end;
  end;
end;

//Convert a text-HEX value (FF0088 for example) to an integer
function  HexToInt(aHex : String) : int64;
var
  Multiplier      : Int64;
  Position        : Byte;
  Value           : Integer;
begin
  Result := 0;
  Multiplier := 1;
  Position := Length(aHex);
  while Position >0 do begin
    Value := FastCharPosNoCase(cHexChars, aHex[Position], 1)-1;
    if Value = -1 then
      raise Exception.Create('Invalid hex character ' + aHex[Position]);

    Result := Result + (Value * Multiplier);
    Multiplier := Multiplier * 16;
    Dec(Position);
  end;
end;

//Get the left X amount of chars
function LeftStr(const aSourceString : String; Size : Integer) : String;
begin
  if Size > Length(aSourceString) then
    Result := aSourceString
  else begin
    SetLength(Result, Size);
    Move(aSourceString[1],Result[1],Size);
  end;
end;

//Do strings match with wildcards, eg
//StringMatches('The cat sat on the mat', 'The * sat * the *') = True
function StringMatches(Value, Pattern : String) : Boolean;
var
  NextPos,
  Star1,
  Star2       : Integer;
  NextPattern   : String;
begin
  Star1 := FastCharPos(Pattern,'*',1);
  if Star1 = 0 then
    Result := (Value = Pattern)
  else begin
    Result := (Copy(Value,1,Star1-1) = Copy(Pattern,1,Star1-1));
    if Result then begin
      if Star1 > 1 then Value := Copy(Value,Star1,Length(Value));
      Pattern := Copy(Pattern,Star1+1,Length(Pattern));

      NextPattern := Pattern;
      Star2 := FastCharPos(NextPattern, '*',1);
      if Star2 > 0 then NextPattern := Copy(NextPattern,1,Star2-1);

      NextPos := pos(NextPattern,Value);
      if (NextPos = 0) and not (NextPattern = '') then
        Result := False
      else begin
        Value := Copy(Value,NextPos,Length(Value));
        if Pattern = '' then
          Result := True
        else
          Result := Result and StringMatches(Value,Pattern);
      end;
    end;
  end;
end;

//Missing text will tell you what text is missing, eg
//MissingText('the ? sat on the mat','the cat sat on the mat','?') = 'cat'
function MissingText(Pattern, Source : String; SearchText : String = '?') : String;
var
  Position                    : Longint;
  BeforeText,
  AfterText                   : String;
  BeforePos,
  AfterPos                     : Integer;
  lSearchText,
  lBeforeText,
  lAfterText,
  lSource                     : Longint;
begin
  Result := '';
  Position := Pos(SearchText,Pattern);
  if Position = 0 then exit;

  lSearchText := Length(SearchText);
  lSource := Length(Source);
  BeforeText := Copy(Pattern,1,Position-1);
  AfterText := Copy(Pattern,Position+lSearchText,lSource);

  lBeforeText := Length(BeforeText);
  lAfterText := Length(AfterText);

  AfterPos := lBeforeText;
  repeat
    AfterPos := FastPosNoCase(Source,AfterText,lSource,lAfterText,AfterPos+lSearchText);
    if AfterPos > 0 then begin
      BeforePos := FastPosBackNoCase(Source,BeforeText,AfterPos-1,lBeforeText,AfterPos - (lBeforeText-1));
      if (BeforePos > 0) then begin
        Result := Copy(Source,BeforePos + lBeforeText, AfterPos - (BeforePos + lBeforeText));
        Break;
      end;
    end;
  until AfterPos = 0;
end;

//Generates a random filename but preserves the original path + extension
function RandomFilename(aFilename : String) : String;
var
  Path,
  Filename,
  Ext               : String;
begin
  Result := aFilename;
  Path := ExtractFilepath(aFilename);
  Ext := ExtractFileExt(aFilename);
  Filename := ExtractFilename(aFilename);
  if Length(Ext) > 0 then
    Filename := Copy(Filename,1,Length(Filename)-Length(Ext));
  repeat
    Result := Path + RandomStr(32) + Ext;
  until not FileExists(Result);
end;

//Makes a string of aLength filled with random characters
function RandomStr(aLength : Longint) : String;
var
  X                           : Longint;
begin
  if aLength <= 0 then exit;
  SetLength(Result, aLength);
  for X:=1 to aLength do
    Result[X] := Chr(Random(26) + 65);
end;

function ReverseStr(const aSourceString : String) : String;
var
  L                           : Integer;
  S,
  D                           : Pointer;
begin
  L := Length(aSourceString);
  SetLength(Result,L);
  if L = 0 then exit;

  S := @aSourceString[1];
  D := @Result[L];

  asm
    push ESI
    push EDI

    mov  ECX, L
    mov  ESI, S
    mov  EDI, D

  @Loop:
    mov  Al, [ESI]
    inc  ESI
    mov  [EDI], Al
    dec  EDI
    dec  ECX
    jnz  @Loop

    pop  EDI
    pop  ESI
  end;
end;

//Returns X amount of chars from the right of a string
function RightStr(const aSourceString : String; Size : Integer) : String;
begin
  if Size > Length(aSourceString) then
    Result := aSourceString
  else begin
    SetLength(Result, Size);
    FastCharMove(aSourceString[Length(aSourceString)-(Size-1)],Result[1],Size);
  end;
end;

//Converts a typical HTML RRGGBB color to a TColor
function RGBToColor(aRGB : String) : TColor;
begin
  if Length(aRGB) < 6 then raise EConvertError.Create('Not a valid RGB value');
  if aRGB[1] = '#' then aRGB := Copy(aRGB,2,Length(aRGB));
  if Length(aRGB) <> 6 then raise EConvertError.Create('Not a valid RGB value');

  Result := HexToInt(aRGB);
  asm
    mov   EAX, Result
    BSwap EAX
    shr   EAX, 8
    mov   Result, EAX
  end;
end;

//Splits a delimited text line into TStrings (does not account for stuff in quotes but it should)
procedure Split(aValue : String; aDelimiter : Char; Result : TStrings);
var
  X : Integer;
  S : String;
begin
  if Result = nil then Result := TStringList.Create;
  Result.Clear;
  S := '';
  for X:=1 to Length(aValue) do begin
    if aValue[X] <> aDelimiter then
      S:=S + aValue[X]
    else begin
      Result.Add(S);
      S := '';
    end;
  end;
  if S <> '' then Result.Add(S);
end;

//counts how many times a substring exists within a string
//StringCount('XXXXX','XX') would return 2
function StringCount(const aSourceString, aFindString : String; Const CaseSensitive : Boolean = TRUE) : Integer;
var
  Find,
  Source,
  NextPos                     : PChar;
  LSource,
  LFind                       : Integer;
  Next                        : TFastPosProc;
begin
  Result := 0;
  LSource := Length(aSourceString);
  if LSource = 0 then exit;

  LFind := Length(aFindString);
  if LFind = 0 then exit;

  if CaseSensitive then
    Next := FastmemPos
  else
    Next := FastmemPosNC;

  Source := @aSourceString[1];
  Find := @aFindString[1];

  repeat
    NextPos := Next(Source^,Find^,LSource,LFind);
    if NextPos <> nil then begin
      Dec(LSource, (NextPos - Source) + LFind);
      Inc(Result);
      Source := NextPos + LFind;
    end;
  until NextPos = nil;
end;

//Used by ExtractHTML and ExtractNonHTML
function StripHTMLorNonHTML(S : String; WantHTML : Boolean) : String;
var
  X,
  TagCnt    : Integer;
begin
  S := StringReplace(S,'&nbsp;',' ',[rfReplaceAll, rfIgnoreCase]);
  S := StringReplace(S,'&amp;','&', [rfReplaceAll, rfIgnoreCase]);
  S := StringReplace(S,'&lt;','<', [rfReplaceAll, rfIgnoreCase]);
  S := StringReplace(S,'&gt;','>', [rfReplaceAll, rfIgnoreCase]);
  s := StringReplace(S,'&quot;','"', [rfReplaceAll, rfIgnoreCase]);
  TagCnt := 0;
  Result := '';
  For X:=1 to Length(S) do begin
    case S[X] of
      '<' : Inc(TagCnt);
      '>' : Dec(TagCnt);
    else
      case WantHTML of
        False :
          if TagCnt <= 0 then begin
            Result := Result + S[X];
            TagCnt := 0;
          end;
        True :
          if TagCnt >= 1 then begin
            Result := Result + S[X];
          end else
            if TagCnt < 0 then TagCnt := 0;
      end;
    end;
  end;
end;

//Generates a UniqueFilename, makes sure the file does not exist before returning a result
function UniqueFilename(aFilename : String) : String;
var
  Path,
  Filename,
  Ext               : String;
  Index             : Integer;
begin
  Result := aFilename;
  if FileExists(aFilename) then begin
    Path := ExtractFilepath(aFilename);
    Ext := ExtractFileExt(aFilename);
    Filename := ExtractFilename(aFilename);
    if Length(Ext) > 0 then
      Filename := Copy(Filename,1,Length(Filename)-Length(Ext));
    Index := 2;
    repeat
      Result := Path + Filename + IntToStr(Index) + Ext;
      Inc(Index);
    until not FileExists(Result);
  end;
end;

//Decodes all that %3c stuff you get in a URL
function  URLToText(aValue : String) : String;
var
  X     : Integer;
begin
  Result := '';
  X := 1;
  while X <= Length(aValue) do begin
    if aValue[X] <> '%' then
      Result := Result + aValue[X]
    else begin
      Result := Result + Chr( HexToInt( Copy(aValue,X+1,2) ) );
      Inc(X,2);
    end;
    Inc(X);
  end;
end;

//Returns the whole word at a position
function  WordAt(Text : String; Position : Integer) : String;
var
  L,
  X : Integer;
begin
  Result := '';
  L := Length(Text);

  for X:=Position to L do begin
    if Upcase(Text[X]) in ['A'..'Z','0'..'9'] then
      Result := Result + Text[X]
    else
      Break;
  end;

  for X:=Position-1 downto 1 do begin
    if Upcase(Text[X]) in ['A'..'Z','0'..'9'] then
      Result := Text[X] + Result
    else
      Break;
  end;
end;



end.
