// CodeGear C++Builder
// Copyright (c) 1995, 2016 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'hbCommUtils.pas' rev: 31.00 (Windows)

#ifndef HbcommutilsHPP
#define HbcommutilsHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>
#include <SysInit.hpp>
#include <System.Classes.hpp>
#include <Winapi.Windows.hpp>

//-- user supplied -----------------------------------------------------------

namespace Hbcommutils
{
//-- forward type declarations -----------------------------------------------
//-- type declarations -------------------------------------------------------
//-- var, const, procedure ---------------------------------------------------
extern DELPHI_PACKAGE void __fastcall EnumSerialPorts(System::Classes::TStrings* PortList);
extern DELPHI_PACKAGE System::UnicodeString __fastcall CommEventToStr(unsigned Event);
extern DELPHI_PACKAGE System::UnicodeString __fastcall CommEventsToStr(unsigned Event, System::UnicodeString Separator);
extern DELPHI_PACKAGE System::UnicodeString __fastcall CommSignalToStr(unsigned Signal);
extern DELPHI_PACKAGE System::UnicodeString __fastcall CommErrorsToStr(unsigned Errors, System::UnicodeString Separator);
extern DELPHI_PACKAGE System::Byte __fastcall StrToParity(System::UnicodeString Parity);
extern DELPHI_PACKAGE System::UnicodeString __fastcall ParityToStr(System::Byte Parity);
extern DELPHI_PACKAGE System::Byte __fastcall StrToStopbits(System::UnicodeString Stopbits);
extern DELPHI_PACKAGE System::UnicodeString __fastcall StopBitsToStr(System::Byte Stopbits);
}	/* namespace Hbcommutils */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_HBCOMMUTILS)
using namespace Hbcommutils;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// HbcommutilsHPP
