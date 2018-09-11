﻿// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'uTPLb_CipherUtils.pas' rev: 28.00 (Windows)

#ifndef Utplb_cipherutilsHPP
#define Utplb_cipherutilsHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <uTPLb_StreamCipher.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Utplb_cipherutils
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TDummyKey;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TDummyKey : public Utplb_streamcipher::TSymetricKey
{
	typedef Utplb_streamcipher::TSymetricKey inherited;
	
public:
	virtual void __fastcall SaveToStream(System::Classes::TStream* Stream);
	virtual void __fastcall Burn(void);
public:
	/* TObject.Create */ inline __fastcall TDummyKey(void) : Utplb_streamcipher::TSymetricKey() { }
	/* TObject.Destroy */ inline __fastcall virtual ~TDummyKey(void) { }
	
};

#pragma pack(pop)

//-- var, const, procedure ---------------------------------------------------
}	/* namespace Utplb_cipherutils */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_UTPLB_CIPHERUTILS)
using namespace Utplb_cipherutils;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// Utplb_cipherutilsHPP
