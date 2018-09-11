{-------------------------------------------------------------------------
   Copyright by Haeger + Busch, Germany                / >>>>>>>>> /-----
   Ingenieurbuero fuer Kommunikationsloesungen         / <<<<<<<<< /
 ----------------------------------------------------/ >>>>>>>>> /
   Homepage  : http://www.hbTapi.com
   EMail     : info@hbTapi.com
   Package   : hbTapi Components
   Version   : 10.2
 -------------------------------------------------------------------------}

unit hbCommUtils;

interface
uses classes, windows;

procedure EnumSerialPorts (PortList: TStrings);
function  CommEventToStr(Event: DWORD): String;
function  CommEventsToStr (Event: DWORD; Separator: String): String;
function  CommSignalToStr (Signal: DWORD): String;
function  CommErrorsToStr (Errors: DWORD; Separator: String): String;
function  StrToParity     (Parity: String): Byte;
function  ParityToStr     (Parity: Byte): String;
function  StrToStopbits   (Stopbits: String): Byte;
function  StopBitsToStr   (Stopbits: Byte): String;

implementation
uses sysutils, hbComm;

{*****************************************************************************}
procedure AddStr(var S1: String; S2, Separator: String);
begin
  if S1 = '' then
    S1 := S2
  else
    S1 := S1 + Separator + S2;
end;

{*****************************************************************************}
procedure EnumSerialPorts(PortList: TStrings);
var
 istr: string;
 isize, i: dword;
 p : PChar;
 x : Integer;
 b : TBits;
 cc : TCommConfig;
 ccSize : DWord;
begin
  PortList.Clear;
  if Win32Platform = VER_PLATFORM_WIN32_NT then
  begin
    Setlength(istr, $FFFF);
    isize := QueryDosDevice(nil, @istr[1], $FFFF);
    p := @iStr[1];
    b := TBits.Create;
    try
      b.Size := 256;
      for i := 1 to isize do
      begin
        if istr[i] = #0 then
        begin
          if StrPos(p, 'COM') = p then
          begin
            inc(p,3);
            x := StrToIntDef(String(p),0);
            b[x] := True;
          end;
          p := @iStr[i+1];
        end;
      end;
      for i := 1 to b.size-1 do
      begin
        if b[i] then
          PortList.Add('COM'+IntToStr(i));
      end;
    finally
      b.Free;
    end;
  end
  else
  begin
    for i := 1 to 255 do
    begin
      ccSize := sizeof(cc);
      iStr := 'COM'+IntToStr(i);
      if GetDefaultCommConfig(PChar(iStr), cc, ccSize) then
        PortList.Add(iStr);
    end;
  end;
end;

{*****************************************************************************}
function CommEventToStr(Event: DWORD): String;
begin
  case Event of
    EV_RXCHAR   : result := 'RXCHAR';      { Any Character received }
    EV_RXFLAG   : result := 'RXFLAG';      { The event character was received }
    EV_TXEMPTY  : result := 'TXEMPTY';     { Transmitt Queue Empty }
    EV_CTS      : result := 'CTS';         { CTS changed state }
    EV_DSR      : result := 'DSR';         { DSR changed state }
    EV_RLSD     : result := 'RLSD';        { RLSD changed state }
    EV_BREAK    : result := 'BREAK';       { BREAK received }
    EV_ERR      : result := 'ERR';         { Line status error occurred }
    EV_RING     : result := 'RING';        { Ring signal detected }
    EV_PERR     : result := 'PERR';        { Printer error occured }
    EV_RX80FULL : result := 'RX80FULL';    { Receive buffer is 80 percent full }
    EV_EVENT1   : result := 'EVENT1';      { Provider specific event 1 }
    EV_EVENT2   : result := 'EVENT2';      { Provider specific event 2 }
  else
    result := Format('$%x', [Event]);
  end;
end;

{*****************************************************************************}
function CommEventsToStr(Event: DWORD; Separator: String): String;

begin
  result := '';
  if Event and EV_RXCHAR   > 0 then AddStr(result, 'RXCHAR',  Separator);  { Any Character received }
  if Event and EV_RXFLAG   > 0 then AddStr(result, 'RXFLAG',  Separator);  { The event character was received }
  if Event and EV_TXEMPTY  > 0 then AddStr(result, 'TXEMPTY', Separator);  { Transmitt Queue Empty }
  if Event and EV_CTS      > 0 then AddStr(result, 'CTS',     Separator);  { CTS changed state }
  if Event and EV_DSR      > 0 then AddStr(result, 'DSR',     Separator);  { DSR changed state }
  if Event and EV_RLSD     > 0 then AddStr(result, 'RLSD',    Separator);  { RLSD changed state }
  if Event and EV_BREAK    > 0 then AddStr(result, 'BREAK',   Separator);  { BREAK received }
  if Event and EV_ERR      > 0 then AddStr(result, 'ERR',     Separator);  { Line status error occurred }
  if Event and EV_RING     > 0 then AddStr(result, 'RING',    Separator);  { Ring signal detected }
  if Event and EV_PERR     > 0 then AddStr(result, 'PERR',    Separator);  { Printer error occured }
  if Event and EV_RX80FULL > 0 then AddStr(result, 'RX80FULL',Separator);  { Receive buffer is 80 percent full }
  if Event and EV_EVENT1   > 0 then AddStr(result, 'EVENT1',  Separator);  { Provider specific event 1 }
  if Event and EV_EVENT2   > 0 then AddStr(result, 'EVENT2',  Separator);  { Provider specific event 2 }
end;

{*****************************************************************************}
function CommSignalToStr(Signal: DWORD): String;
begin
  case Signal of
    COMPORTSIGNAL_NONE: result := 'NONE';
    COMPORTSIGNAL_DTR : result := 'DTR';
    COMPORTSIGNAL_DSR : result := 'DSR';
    COMPORTSIGNAL_RTS : result := 'RTS';
    COMPORTSIGNAL_CTS : result := 'CTS';
    COMPORTSIGNAL_RING: result := 'RING';
    COMPORTSIGNAL_DCD : result := 'DCD';
    COMPORTSIGNAL_TXD : result := 'TXD';
    COMPORTSIGNAL_RXD : result := 'RXD';
  else
    result := Format('$%x', [Signal]);
  end;
end;

{*****************************************************************************}
function CommErrorsToStr(Errors: DWORD; Separator: String) : String;
begin
  result := '';
  if (Errors and CE_RXOVER)   > 0 then AddStr(result, 'RXOVER',   Separator);
  if (Errors and CE_OVERRUN)  > 0 then AddStr(result, 'OVERRUN',  Separator);
  if (Errors and CE_RXPARITY) > 0 then AddStr(result, 'RXPARITY', Separator);
  if (Errors and CE_FRAME)    > 0 then AddStr(result, 'FRAME',    Separator);
  if (Errors and CE_BREAK)    > 0 then AddStr(result, 'BREAK',    Separator);
  if (Errors and CE_TXFULL)   > 0 then AddStr(result, 'TXFULLTX', Separator);
end;

function StrToParity(Parity: String): Byte;
begin
  if (Parity = '') or (CompareText(Parity, 'NONE') = 0) or (CompareText(Parity, 'N') = 0) then
    result := NOPARITY
  else if (CompareText(Parity, 'EVEN') = 0) or (CompareText(Parity, 'E') = 0) then
    result := EVENPARITY
  else if (CompareText(Parity, 'ODD') = 0) or (CompareText(Parity, 'O') = 0) then
    result := ODDPARITY
  else if (CompareText(Parity, 'MARK') = 0) or (CompareText(Parity, 'M') = 0) then
    result := MARKPARITY
  else if (CompareText(Parity, 'SPACE') = 0) or (CompareText(Parity, 'S') = 0) then
    result := SPACEPARITY
  else
    result := NOPARITY;
end;

function ParityToStr(Parity: Byte): String;
begin
  case Parity of
    EVENPARITY  : result := 'E';
    ODDPARITY   : result := 'O';
    MARKPARITY  : result := 'M';
    SPACEPARITY : result := 'S';
  else
    result := 'N'; // NOPARITY
  end;
end;

function StrToStopbits(Stopbits: String): Byte;
begin
  if (CompareText(Stopbits, 'ONE') = 0) or (CompareText(Stopbits, '1') = 0) then
    result := ONESTOPBIT
  else if (CompareText(Stopbits, 'TWO') = 0) or (CompareText(Stopbits, '2') = 0) then
    result := TWOSTOPBITS
  else if (CompareText(Stopbits, 'ONE5') = 0) or (CompareText(Stopbits, '1.5') = 0) then
    result := ONE5STOPBITS
  else
    result := ONESTOPBIT;
end;

function StopbitsToStr(Stopbits: Byte): String;
begin
  case Stopbits of
    ONE5STOPBITS : result := '1.5';
    TWOSTOPBITS  : result := '2';
  else
    result := '1'; // ONESTOPBIT
  end;
end;

end.

