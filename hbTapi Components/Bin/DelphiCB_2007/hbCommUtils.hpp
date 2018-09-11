// CodeGear C++Builder
// Copyright (c) 1995, 2007 by CodeGear
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Hbcommutils.pas' rev: 11.00

#ifndef HbcommutilsHPP
#define HbcommutilsHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member functions
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <Sysinit.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Hbcommutils
{
//-- type declarations -------------------------------------------------------
//-- var, const, procedure ---------------------------------------------------
extern PACKAGE void __fastcall EnumSerialPorts(Classes::TStrings* PortList);
extern PACKAGE AnsiString __fastcall CommEventToStr(unsigned Event);
extern PACKAGE AnsiString __fastcall CommEventsToStr(unsigned Event, AnsiString Separator);
extern PACKAGE AnsiString __fastcall CommSignalToStr(unsigned Signal);
extern PACKAGE AnsiString __fastcall CommErrorsToStr(unsigned Errors, AnsiString Separator);
extern PACKAGE Byte __fastcall StrToParity(AnsiString Parity);
extern PACKAGE AnsiString __fastcall ParityToStr(Byte Parity);
extern PACKAGE Byte __fastcall StrToStopbits(AnsiString Stopbits);
extern PACKAGE AnsiString __fastcall StopBitsToStr(Byte Stopbits);

}	/* namespace Hbcommutils */
using namespace Hbcommutils;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// Hbcommutils
