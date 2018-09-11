// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'hbCommUtils.pas' rev: 6.00

#ifndef hbCommUtilsHPP
#define hbCommUtilsHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Windows.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Hbcommutils
{
//-- type declarations -------------------------------------------------------
//-- var, const, procedure ---------------------------------------------------
#pragma error Unsupported symbol type (23, hbCommUtils)
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
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// hbCommUtils
