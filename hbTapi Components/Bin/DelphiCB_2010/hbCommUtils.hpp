// CodeGear C++Builder
// Copyright (c) 1995, 2009 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Hbcommutils.pas' rev: 21.00

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
extern PACKAGE System::UnicodeString __fastcall CommEventToStr(unsigned Event);
extern PACKAGE System::UnicodeString __fastcall CommEventsToStr(unsigned Event, System::UnicodeString Separator);
extern PACKAGE System::UnicodeString __fastcall CommSignalToStr(unsigned Signal);
extern PACKAGE System::UnicodeString __fastcall CommErrorsToStr(unsigned Errors, System::UnicodeString Separator);
extern PACKAGE System::Byte __fastcall StrToParity(System::UnicodeString Parity);
extern PACKAGE System::UnicodeString __fastcall ParityToStr(System::Byte Parity);
extern PACKAGE System::Byte __fastcall StrToStopbits(System::UnicodeString Stopbits);
extern PACKAGE System::UnicodeString __fastcall StopBitsToStr(System::Byte Stopbits);

}	/* namespace Hbcommutils */
using namespace Hbcommutils;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// HbcommutilsHPP
