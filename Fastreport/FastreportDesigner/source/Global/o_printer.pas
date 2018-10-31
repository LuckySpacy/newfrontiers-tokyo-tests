unit o_printer;

interface

{$WARN SYMBOL_PLATFORM OFF}
{$WARN UNIT_PLATFORM OFF}


// In dieser Unit befinden sich Befehle, die dazu dienen die Delphi Funktionen
// zu erweitern.

// Das Präfix nf_ steht für new|frontiers und beinhaltet, dass es sich hierbei
// um eine Globale new|frontiers Funktion handelt.

// Wichtig: Diese Funktionen sind alle Projektunabhängig.
//          Hier sollten keine Projetspezifische Funktionen geschrieben werden.
//          In Optima gibt es dafür die Unit f_Optima
//          Es sollten nur Delphi-Standard Units eingebunden werden.

uses
  SysUtils, Classes, Printers, WinSpool, Windows, Messages;

function GetDefaultPrinterA(prnName : PAnsiChar; var bufSize : DWORD ) : BOOL; stdcall; external 'winspool.drv' name 'GetDefaultPrinterA';

type
  Tnf_printers = class
  private
  public
    class procedure GetPaperBins(sl: TStrings; aPrinterIndex: Integer); overload;
    class procedure GetPaperBins(sl: TStrings; aPrinterName: string); overload;
    class function GetDefaultPrinterName: string;
    class function GetPrinterIndex(aPrinterName: string): Integer;
    class function PrinterExists(aPrinterName: string): Boolean;
  end;


implementation

{ Tnf_printers }



//Liefert die Druckerschächte eines Druckers zurück.
class procedure Tnf_printers.GetPaperBins(sl: TStrings; aPrinterIndex: Integer);
type
  TBinName      = array [0..23] of Char;
  TBinNameArray = array [1..High(Integer) div SizeOf(TBinName)] of TBinName;
  PBinnameArray = ^TBinNameArray;
  TBinArray     = array [1..High(Integer) div SizeOf(Word)] of Word;
  PBinArray     = ^TBinArray;
var
  Device, Driver, Port: array [0..255] of Char;
  hDevMode: THandle;
  i, numBinNames, numBins, temp: Integer;
  pBinNames: PBinnameArray;
  pBins: PBinArray;
begin
  sl.Clear;
  Printer.PrinterIndex := aPrinterIndex;
  Printer.GetPrinter(Device, Driver, Port, hDevmode);
  numBinNames := WinSpool.DeviceCapabilities(Device, Port, DC_BINNAMES, nil, nil);
  numBins     := WinSpool.DeviceCapabilities(Device, Port, DC_BINS, nil, nil);
  if numBins <> numBinNames then
  begin
    raise Exception.Create('DeviceCapabilities reports different number of bins and bin names!');
  end;
  if numBinNames > 0 then
  begin
    //pBins := nil;
    GetMem(pBinNames, numBinNames * SizeOf(TBinname));
    GetMem(pBins, numBins * SizeOf(Word));
    try
      WinSpool.DeviceCapabilities(Device, Port, DC_BINNAMES, PChar(pBinNames), nil);
      WinSpool.DeviceCapabilities(Device, Port, DC_BINS, PChar(pBins), nil);
      for i := 1 to numBinNames do
      begin
        temp := pBins^[i];
        sl.addObject(pBinNames^[i], TObject(temp));
      end;
    finally
      FreeMem(pBinNames);
      if pBins <> nil then
        FreeMem(pBins);
    end;
  end;
end;


class procedure Tnf_printers.GetPaperBins(sl: TStrings; aPrinterName: string);
var
  PrinterIndex: Integer;
begin
  sl.Clear;
  PrinterIndex := GetPrinterIndex(aPrinterName);
  GetPaperBins(sl, PrinterIndex);
end;

class function Tnf_printers.GetPrinterIndex(aPrinterName: string): Integer;
var
  i1: Integer;
begin
  Result := 0;
  for i1 := 0 to Printer.Printers.Count - 1 do
  begin
    if SameText(aPrinterName, Printer.Printers[i1]) then
    begin
      Result := i1;
      exit;
    end;
  end;
end;


class function Tnf_printers.PrinterExists(aPrinterName: string): Boolean;
var
  i1: Integer;
begin
  Result := false;
  for i1 := 0 to Printer.Printers.Count - 1 do
  begin
    if SameText(aPrinterName, Printer.Printers[i1]) then
    begin
      Result := true;
      exit;
    end;
  end;
end;


class function Tnf_printers.GetDefaultPrinterName: string;
var
  lprnName: PAnsiChar;
  lBufSize: DWord;
begin
  GetMem(lprnName, 1000);
  try
    GetDefaultPrinterA(lprnName, lBufSize);
    Result := lprnName;
  finally
    FreeMem(lprnName);
  end;
end;



end.
