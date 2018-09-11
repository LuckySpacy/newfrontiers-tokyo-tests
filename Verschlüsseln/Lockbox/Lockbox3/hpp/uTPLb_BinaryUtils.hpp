﻿// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'uTPLb_BinaryUtils.pas' rev: 28.00 (Windows)

#ifndef Utplb_binaryutilsHPP
#define Utplb_binaryutilsHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <uTPLb_IntegerUtils.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Utplb_binaryutils
{
//-- type declarations -------------------------------------------------------
//-- var, const, procedure ---------------------------------------------------
extern DELPHI_PACKAGE unsigned __fastcall SwapEndien_u32(unsigned Value);
extern DELPHI_PACKAGE __int64 __fastcall SwapEndien_s64(__int64 Value);
extern DELPHI_PACKAGE unsigned __int64 __fastcall SwapEndien_u64(unsigned __int64 Value);
extern DELPHI_PACKAGE unsigned __fastcall RotateLeft1Bit_u32(unsigned Value);
extern DELPHI_PACKAGE void __fastcall Read_BigEndien_u32_Hex(const System::UnicodeString Value, System::Classes::TStream* BinaryOut);
extern DELPHI_PACKAGE NativeUInt __fastcall Get_TP_LockBox3_HINSTANCE(void);
}	/* namespace Utplb_binaryutils */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_UTPLB_BINARYUTILS)
using namespace Utplb_binaryutils;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// Utplb_binaryutilsHPP
