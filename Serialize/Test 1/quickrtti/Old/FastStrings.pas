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

//Current version 2.1
//==============================================================================
//Date  : 01 October, 2000
//Found : DJ (#delphi undernet)
//Fixed : Pete M
//Change: Uppercase table was incorrect for international alphabets.
//==============================================================================
//Date  : 25 September, 2000
//Found : Lorenz Graf
//Fixed : Pete M
//Change: Incorrect value returned from FastMemPos if the SourceString and
//        FindString were the same values.
//        Also incorrect value returned from FastReplace if SourceString was ''
//==============================================================================
//Date  : 21 September, 2000
//Found : Pete M
//Fixed : Pete M
//Change: Forward searching routines could return errors if 0 was passed as the
//        StartPos.
//        This is actually an invalid value (1 is the first character)
//        So I inlcluded assert() statments.
//        Was *NOT* implemented in FastMEMPos as this is MEMORY and not a string
//==============================================================================
//Date  : 21 September, 2000
//Found : Chris Baldwin (TCrispy)
//Fixed : Pete M
//Change: NoCase routines were not working correctly with non-alphabetical
//        characters.  eg,   ) and #9 were thought to be the same
//        (Due to the UpCase routine simple ANDing the value eith $df)
//        Had to add lookup tables, which probably slows it down a little.
//==============================================================================
//Date  : 16 September, 2000
//Found : Lorenz Graf
//Fixed : Pete M
//Change: FastReplace had some EXIT statements before RESULT had been set.
//        I thought this would result in a Result of "", but it resulted in an
//        undetermined result (usually the same as the last valid result)
//        Set Result := '' in the first line of the code.
//==============================================================================
//Date  : 19 May, 2000
//Found : Dave Datta
//Fixed : Pete M
//Change: If the SOURCE was very small, and the REPLACE was very large, this
//        causes either an integer overflow or OutOfMemory.  In this case we
//        estimate the result size a lot lower and resize the result whenever
//        required (still not as often as StringReplace). See the const
//        cDeltaSize !!
//        You *may* still run out of memory, but that is a memory issue.
//==============================================================================
//Date  : 02 May, 2000
//Found : hans gulo (again)
//Fixed : Pete M
//Change: In some (odd) circumstances FastMemPos(NC) would return a true result
//        for a substring that did not exist.
//==============================================================================
//Date  : 12 Apr, 2000
//Found : hans gulo <hans@sangar.dhs.org>
//Fixed : Pete M
//Change: I was constantly converting to/from character indexes/pointers.
//        Considering we need pointers for MOVing data this was pointless +
//        Hans managed to write a quicker FastReplace in pure Object Pascal. (Nice job Hans)
//        Now I use pointers instead, this results in a much faster replace.
//        As I have always said, never assuming you have the fastest code :-)
//==============================================================================
//Date  : 5 Mar, 2000
//Found : Pete M
//Fixed : Pete M
//Change: Realised that I was moving [EDI] into ah before comparing
//        with al, when I could have just compared al, [EDI].  doh !
//        Fastpos is now about 28% faster
//==============================================================================
//Date  : 5 Mar, 2000
//Found : Pete M
//Fixed : Pete M
//Change: Changed FastPosNoCase to implement the above changes AND to use a
//        lookup table for UpCase characters.
//==============================================================================
//Date  : 1 Mar, 2000
//Found : Pete M
//Fixed : Pete M
//Change: Changed the name of MyMove to FastCharMove, and added it to the
//        interface section.
//==============================================================================
//Date  : 15 Jan, 2000
//Found : Pete M
//Fixed : Pete M
//Change: Created a FastCharPos and FastCharPosNoCase, if the code knows that
//        the FindString is only 1 char, it can use faster methods.
//==============================================================================
//Date  : 10 Jan, 2000
//Found : Pete M
//Fixed : Pete M
//Change: Moved TFastPosProc into the interface section, so other routines
//        can use the same technique that I do in FastReplace
//==============================================================================
//Date  : 17 Dec, 1999
//Found : Bob Richardson
//Fixed : Pete M
//Change: Oops a daisy.  FastPosBack (and NoCase) were not setting SearchLen
//        if a valid StartPos was passed.
//==============================================================================
//Date  : 17 Dec, 1999
//Found : VRP (on #Delphi EFNET)
//Fixed : VRP
//Change: Added SmartPos.  This will allow people to easily change POS to SmartPos
//        as the parameters are in the same order.  Clever use of default params
//        means that the extra functionality of FastStrings may be used by passing
//        some extra params.
//==============================================================================

unit FastStrings;

interface

uses
   Windows, SysUtils;

//This TYPE declaration will become apparent later
Type
  TFastPosProc = function (const aSource, aFind; const aSourceLen, aFindLen : integer) : Pointer;
  TFastPosIndexProc = function (const aSourceString, aFindString : String; const aSourceLen, aFindLen, StartPos : Integer) : Integer;

procedure FastCharMove(const Source; var Dest; Count : Integer);
function FastCharPos(const aSource : String; const C: Char; StartPos : Integer) : Integer;
function FastCharPosNoCase(const aSource : String; C: Char; StartPos : Integer) : Integer;
function FastPos(const aSourceString, aFindString : String; const aSourceLen, aFindLen, StartPos : Integer) : Integer;
function FastPosNoCase(const aSourceString, aFindString : String; const aSourceLen, aFindLen, StartPos : Integer) : Integer;
function FastPosBack(const aSourceString, aFindString : String; const aSourceLen, aFindLen, StartPos : Integer) : Integer;
function FastPosBackNoCase(const aSourceString, aFindString : String; const aSourceLen, aFindLen, StartPos : Integer) : Integer;
function FastReplace(const aSourceString : String; const aFindString, aReplaceString : String;
  CaseSensitive : Boolean = False) : String;
function SmartPos(const SearchStr,SourceStr : String;
                  const CaseSensitive : Boolean = TRUE;
                  const StartPos : Integer = 1;
                  const ForwardSearch : Boolean = TRUE) : Integer;

//pointer routines, which are faster
function FastmemPos(const aSource, aFind; const aSourceLen, aFindLen : integer) : Pointer;
function FastmemPosNC(const aSource, aFind; const aSourceLen, aFindLen : integer) : Pointer;

implementation

const
  cDeltaSize = 1.5;

var
  GUpcaseTable : array[0..255] of char;
  GUpcaseLUT: Pointer;

//NOTE : FastCharPos and FastCharPosNoCase do not require you to pass the length
//       of the string, this was only done in FastPos and FastPosNoCase because
//       they are used by FastReplace many times over, thus saving a LENGTH()
//       operation each time.  I can't see you using these two routines for the
//       same purposes so I didn't do that this time !
function FastCharPos(const aSource : String; const C: Char; StartPos : Integer) : Integer;
var
  L                           : Integer;
begin
  //If this assert failed, it is because you passed 0 for StartPos, lowest value is 1 !!
  Assert(StartPos > 0);
  
  Result := 0;
  L := Length(aSource);
  if L = 0 then exit;
  if StartPos > L then exit;
  Dec(StartPos);
  asm
      PUSH EDI                 //Preserve this register

      mov  EDI, aSource        //Point EDI at aSource
      add  EDI, StartPos
      mov  ECX, L              //Make a note of how many chars to search through
      sub  ECX, StartPos
      mov  AL,  C              //and which char we want
    @Loop:
      cmp  Al, [EDI]           //compare it against the SourceString
      jz   @Found
      inc  EDI
      dec  ECX
      jnz  @Loop
      jmp  @NotFound
    @Found:
      sub  EDI, aSource        //EDI has been incremented, so EDI-OrigAdress = Char pos !
      inc  EDI
      mov  Result,   EDI
    @NotFound:

      POP  EDI
  end;
end;

function FastCharPosNoCase(const aSource : String; C: Char; StartPos : Integer) : Integer;
var
  L                           : Integer;
begin
  Result := 0;
  L := Length(aSource);
  if L = 0 then exit;
  if StartPos > L then exit;
  Dec(StartPos);
  if StartPos < 0 then StartPos := 0;

  asm
      PUSH EDI                 //Preserve this register
      PUSH EBX
      mov  EDX, GUpcaseLUT

      mov  EDI, aSource        //Point EDI at aSource
      add  EDI, StartPos
      mov  ECX, L              //Make a note of how many chars to search through
      sub  ECX, StartPos

      xor  EBX, EBX
      mov  BL,  C
      mov  AL, [EDX+EBX]
    @Loop:
      mov  BL, [EDI]
      inc  EDI
      cmp  Al, [EDX+EBX]
      jz   @Found
      dec  ECX
      jnz  @Loop
      jmp  @NotFound
    @Found:
      sub  EDI, aSource        //EDI has been incremented, so EDI-OrigAdress = Char pos !
      mov  Result,   EDI
    @NotFound:

      POP  EBX
      POP  EDI
  end;
end;

function FastmemPos(const aSource, aFind; const aSourceLen, aFindLen : integer) : Pointer;
asm
          push ESI
          push EDI
          push EBX

          mov  ESI, aFind
          mov  EDI, aSource
          mov  ECX, aSourceLen

  //Quick exit code
          mov  Result, 0
  //SourceLen < FindLen
          cmp  ECX, aFindLen
          jl   @TheEnd
  //FindLen < 1
          cmp  aFindLen, 1
          jl   @TheEnd

  //Now DEC aSourceLen by aFindLen-1
          sub  ECX, aFindLen
          inc  ECX

  //Get the first char of aFindString, note how it is done outside
  //of the main loop, as it never changes !
          Mov  Al, [ESI]
          jmp  @Scasb
  @FindNext:
          inc  EDI  //Done only when returning from CompareStrings
          dec  ECX
          jz   @NotFound

  //Now the FindFirstCharacter loop !
  @ScaSB:
  //Get the value of the current character in aSourceString
  //This is equal to ah := EDI^, that is what the [] are around [EDI]
  //compare this character with aDestString[1]
          cmp [EDI], al
  //If they are equal we compare the strings

          jz   @CompareStrings
          inc  EDI
          dec  ECX
          jnz  @ScaSB
          jmp  @NotFound

  @CompareStrings:
  //Put the length of aFindLen in EBX
          mov  EBX, aFindLen

  @CompareNext:
  //We DEC EBX to point to the end of the string, ie, we dont
  //want to add the whole length as this would point past the end of string
          dec  EBX
          jz   @FullMatch

  //here is another optimization tip !
  //People at this point usually PUSH ESI etc and then POP ESI etc
  //at the end, instead I opted not to change ESI etc at all.
  //This saves lots of pushing and popping !

  //Get aFindString character + aFindStringLength (the last char)
          mov  Ah, [ESI+EBX]

  //Get aSourceString character (current position + aFindStringLength)
  //Compare them
          cmp  Ah, [EDI+EBX]
          Jnz  @FindNext

          Jmp  @CompareNext

    @FullMatch:
          //Move the address of the *current* character in EDI
          //note, we have not altered EDI since the first char was found
          mov  Result, EDI
          jmp  @TheEnd
    @NotFound:
          //The substring was not found
          mov  Result, 0

  @TheEnd:
          pop  EBX
          pop  EDI
          pop  ESI
end;

function FastmemPosNC(const aSource, aFind; const aSourceLen, aFindLen : integer) : Pointer;
asm
          push ESI
          push EDI
          push EBX

          mov  ESI, aFind
          mov  EDI, aSource
          mov  ECX, aSourceLen

  //Quick exit code
          mov  Result, 0
  //SourceLen < FindLen
          cmp  ECX, aFindLen
          jl   @TheEnd
  //FindLen < 1
          cmp  aFindLen, 1
          jl   @TheEnd

  //Now DEC aSourceLen by aFindLen-1
          sub  ECX, aFindLen
          inc  ECX

  //Get the first char of aFindString, note how it is done outside
  //of the main loop, as it never changes !
          mov  EDX, GUpcaseLUT
          xor  EBX, EBX
          jmp  @FindFirst
  @FindNext:
          inc  EDI  //Done only when returning from CompareStrings
          dec  ECX
          jz   @NotFound
  @FindFirst:
          mov  Bl, [ESI]
          mov  AL, [EDX+EBX]

  //Now the FindFirstCharacter loop !
  @ScaSB:
  //Get the value of the current character in aSourceString
  //This is equal to ah := EDI^, that is what the [] are around [EDI]
  //compare this character with aDestString[1]
          mov  Bl, [EDI]
          cmp  Al, [EDX+EBX]
  //If they are equal we compare the strings

          jz   @CompareStrings
          inc  EDI
          dec  ECX
          jnz  @ScaSB
          jmp  @NotFound

  @CompareStrings:
  //Save ECX
          push ECX
          mov  ECX, aFindLen

  @CompareNext:
          dec  ECX
          jz   @FullMatch

          mov  Bl, [ESI+ECX]
          mov  Al, [EDX+EBX]

          mov  Bl, [EDI+ECX]
          cmp  Al, [EDX+EBX]
          jz   @KeepChecking

          POP  ECX
          jmp  @FindNext

    @KeepChecking:
          Jmp  @CompareNext

    @FullMatch:
          pop  ECX
          mov  Result, EDI
          jmp  @TheEnd

    @NotFound:
          mov  Result, 0

  @TheEnd:
          pop  EBX
          pop  EDI
          pop  ESI
end;


//The first thing to note here is that I am passing the SourceLength and FindLength
//As neither Source or Find will alter at any point during FastReplace there is
//no need to call the LENGTH subroutine each time !
function FastPos(const aSourceString, aFindString : String; const aSourceLen, aFindLen, StartPos : Integer) : Integer;
begin
  //If this assert failed, it is because you passed 0 for StartPos, lowest value is 1 !!
  Assert(StartPos > 0);
  
  Result := Integer(FastmemPos(aSourceString[StartPos], aFindString[1],aSourceLen - (StartPos-1), aFindLen));
  if Result > 0 then
    Result := Result - Integer(@aSourceString[1]) +1;
end;

function FastPosNoCase(const aSourceString, aFindString : String; const aSourceLen, aFindLen, StartPos : Integer) : Integer;
begin
  //If this assert failed, it is because you passed 0 for StartPos, lowest value is 1 !!
  Assert(StartPos > 0);

  Result := Integer(FastmemPosNC(aSourceString[StartPos], aFindString[1],aSourceLen - (StartPos-1), aFindLen));
  if Result > 0 then
    Result := Result - Integer(@aSourceString[1]) +1;
end;

function FastPosBack(const aSourceString, aFindString : String; const aSourceLen, aFindLen, StartPos : Integer) : Integer;
var
  SourceLen : Integer;
begin
  if aFindLen < 1 then begin
    Result := 0;
    exit;
  end;
  if aFindLen > aSourceLen then begin
    Result := 0;
    exit;
  end;

  if (StartPos = 0) or  (StartPos + aFindLen >= aSourceLen) then
    SourceLen := aSourceLen - (aFindLen-1)
  else
    SourceLen := StartPos;

  asm
          push ESI
          push EDI
          push EBX

          mov EDI, aSourceString
          add EDI, SourceLen
          Dec EDI

          mov ESI, aFindString
          mov ECX, SourceLen
          Mov  Al, [ESI]

    @ScaSB:
          cmp  Al, [EDI]
          jne  @NextChar

    @CompareStrings:
          mov  EBX, aFindLen
          dec  EBX
          jz   @FullMatch

    @CompareNext:
          mov  Ah, [ESI+EBX]
          cmp  Ah, [EDI+EBX]
          Jnz  @NextChar

    @Matches:
          Dec  EBX
          Jnz  @CompareNext

    @FullMatch:
          mov  EAX, EDI
          sub  EAX, aSourceString
          inc  EAX
          mov  Result, EAX
          jmp  @TheEnd
    @NextChar:
          dec  EDI
          dec  ECX
          jnz  @ScaSB

          mov  Result,0

    @TheEnd:
          pop  EBX
          pop  EDI
          pop  ESI
  end;
end;


function FastPosBackNoCase(const aSourceString, aFindString : String; const aSourceLen, aFindLen, StartPos : Integer) : Integer;
var
  SourceLen : Integer;
begin
  if aFindLen < 1 then begin
    Result := 0;
    exit;
  end;
  if aFindLen > aSourceLen then begin
    Result := 0;
    exit;
  end;

  if (StartPos = 0) or  (StartPos + aFindLen >= aSourceLen) then
    SourceLen := aSourceLen - (aFindLen-1)
  else
    SourceLen := StartPos;

  asm
          push ESI
          push EDI
          push EBX

          mov  EDI, aSourceString
          add  EDI, SourceLen
          Dec  EDI

          mov  ESI, aFindString
          mov  ECX, SourceLen

          mov  EDX, GUpcaseLUT
          xor  EBX, EBX

          mov  Bl, [ESI]
          mov  Al, [EDX+EBX]

    @ScaSB:
          mov  Bl, [EDI]
          cmp  Al, [EDX+EBX]
          jne  @NextChar

    @CompareStrings:
          PUSH ECX
          mov  ECX, aFindLen
          dec  ECX
          jz   @FullMatch

    @CompareNext:
          mov  Bl, [ESI+ECX]
          mov  Ah, [EDX+EBX]
          mov  Bl, [EDI+ECX]
          cmp  Ah, [EDX+EBX]
          Jz   @Matches

    //Go back to findind the first char
          POP  ECX
          Jmp  @NextChar

    @Matches:
          Dec  ECX
          Jnz  @CompareNext

    @FullMatch:
          POP  ECX

          mov  EAX, EDI
          sub  EAX, aSourceString
          inc  EAX
          mov  Result, EAX
          jmp  @TheEnd
    @NextChar:
          dec  EDI
          dec  ECX
          jnz  @ScaSB

          mov  Result,0

    @TheEnd:
          pop  EBX
          pop  EDI
          pop  ESI
  end;
end;

//My move is not as fast as MOVE when source and destination are both
//DWord aligned, but certainly faster when they are not.
//As we are moving characters in a string, it is not very likely at all that
//both source and destination are DWord aligned, so moving bytes avoids the
//cycle penality of reading/writing DWords across physical boundaries
procedure FastCharMove(const Source; var Dest; Count : Integer);
asm
//Note:  When this function is called, delphi passes the parameters as follows
//ECX = Count
//EAX = Const Source
//EDX = Var Dest

        //If no bytes to copy, just quit altogether, no point pushing registers
        cmp   ECX,0
        Je    @JustQuit

        //Preserve the critical delphi registers
        push  ESI
        push  EDI

        //move Source into ESI  (generally the SOURCE register)
        //move Dest into EDI (generally the DEST register for string commands)
        //This may not actually be neccessary, as I am not using MOVsb etc
        //I may be able just to use EAX and EDX, there may be a penalty for
        //not using ESI, EDI but I doubt it, this is another thing worth trying !
        mov   ESI, EAX
        mov   EDI, EDX

        //The following loop is the same as repNZ MovSB, but oddly quicker !
    @Loop:
        //Get the source byte
        Mov   AL, [ESI]
        //Point to next byte
        Inc   ESI
        //Put it into the Dest
        mov   [EDI], AL
        //Point dest to next position
        Inc   EDI
        //Dec ECX to note how many we have left to copy
        Dec   ECX
        //If ECX <> 0 then loop
        Jnz   @Loop

        //Another optimization note.
        //Many people like to do this

        //Mov AL, [ESI]
        //Mov [EDI], Al
        //Inc ESI
        //Inc ESI

        //There is a hidden problem here, I wont go into too much detail, but
        //the pentium can continue processing instructions while it is still
        //working out the desult of INC ESI or INC EDI
        //(almost like a multithreaded CPU)
        //if, however, you go to use them while they are still being calculated
        //the processor will stop until they are calculated (a penalty)
        //Therefore I alter ESI and EDI as far in advance as possible of using them

        //Pop the critical Delphi registers that we have altered
        pop   EDI
        pop   ESI
    @JustQuit:
end;

//Point 1
//I pass CONST aSourceString rather than just aSourceString
//This is because I will just be passed a pointer to the data
//rather than a 10mb copy of the data itself, much quicker !
function FastReplace(const aSourceString : String; const aFindString, aReplaceString : String;
   CaseSensitive : Boolean = False) : String;
var
  PResult                     : PChar;
  PReplace                    : PChar;
  PSource                     : PChar;
  PFind                       : PChar;
  PPosition                   : PChar;
  CurrentPos,
  BytesUsed,
  lResult,
  lReplace,
  lSource,
  lFind                       : Integer;
  Find                        : TFastPosProc;

  CopySize                    : Integer;
begin
  LSource := Length(aSourceString);
  if LSource = 0 then begin
    Result := aSourceString;
    exit;
  end;
  PSource := @aSourceString[1];

  LFind := Length(aFindString);
  if LFind = 0 then exit;
  PFind := @aFindString[1];

  LReplace := Length(aReplaceString);

  //Here we may get an Integer Overflow, or OutOfMemory, if so, we use a Delta

  try
    if LReplace <= LFind then
      SetLength(Result,lSource)
    else
      SetLength(Result, (LSource *LReplace) div  LFind);
  except
    SetLength(Result,0);
  end;

  LResult := Length(Result);
  if LResult = 0 then begin
    LResult := Trunc((LSource + LReplace) * cDeltaSize);
    SetLength(Result, LResult);
  end;


  PResult := @Result[1];


  if CaseSensitive then
    Find := FastmemPos
  else
    Find := FastmemPosNC;


  if LReplace > 0 then begin
    BytesUsed := 0;
    PReplace := @aReplaceString[1];
    repeat
      PPosition := Find(PSource^,PFind^,lSource, lFind);
      if PPosition = nil then break;

      CopySize := PPosition - PSource;
      Inc(BytesUsed, CopySize + LReplace);

      if BytesUsed >= LResult then begin
        //We have run out of space
        CurrentPos := Integer(PResult) - Integer(@Result[1]) +1;
        LResult := Trunc(LResult * cDeltaSize);
        SetLength(Result,LResult);
        PResult := @Result[CurrentPos];
      end;

      FastCharMove(PSource^,PResult^,CopySize);
      Dec(lSource,CopySize + LFind);
      Inc(PSource,CopySize + LFind);
      Inc(PResult,CopySize);

      FastCharMove(PReplace^,PResult^,LReplace);
      Inc(PResult,LReplace);

    until lSource < lFind;
  end else begin
    repeat
      PPosition := Find(PSource^,PFind^,lSource, lFind);
      if PPosition = nil then break;

      CopySize := PPosition - PSource;
      FastCharMove(PSource^,PResult^,CopySize);
      Dec(lSource,CopySize + LFind);
      Inc(PSource,CopySize + LFind);
      Inc(PResult,CopySize);

    until lSource < lFind;
  end;

  FastCharMove(PSource^,PResult^,LSource);
  SetLength(Result, (PResult+LSource) - @Result[1]);
end;

function SmartPos(const SearchStr,SourceStr : String;
                  const CaseSensitive : Boolean = TRUE;
                  const StartPos : Integer = 1;
                  const ForwardSearch : Boolean = TRUE) : Integer;
begin
  // NOTE:  When using StartPos, the returned value is absolute!
  if (CaseSensitive) then
    if (ForwardSearch) then
      Result:=
        FastPos(SourceStr,SearchStr,Length(SourceStr),Length(SearchStr),StartPos)
    else
      Result:=
        FastPosBack(SourceStr,SearchStr,Length(SourceStr),Length(SearchStr),StartPos)
  else
    if (ForwardSearch) then
      Result:=
        FastPosNoCase(SourceStr,SearchStr,Length(SourceStr),Length(SearchStr),StartPos)
    else
      Result:=
        FastPosBackNoCase(SourceStr,SearchStr,Length(SourceStr),Length(SearchStr),StartPos)
end;

var
  I: Integer;
initialization
  for I:=0 to 255 do GUpcaseTable[I] := Chr(I);
  CharUpperBuff(@GUpcaseTable[1], 256);
  GUpcaseLUT := @GUpcaseTable[0];
end.



