﻿// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'uTPLb_HashDsc.pas' rev: 28.00 (Windows)

#ifndef Utplb_hashdscHPP
#define Utplb_hashdscHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <uTPLb_StreamCipher.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Utplb_hashdsc
{
//-- type declarations -------------------------------------------------------
__interface IHasher;
typedef System::DelphiInterface<IHasher> _di_IHasher;
__interface  INTERFACE_UUID("{982870E4-EC9B-48CD-B882-17F58F0A7D1A}") IHasher  : public System::IInterface 
{
	
public:
	virtual void __fastcall Update(System::Classes::TMemoryStream* Source) = 0 ;
	virtual void __fastcall End_Hash(System::Classes::TMemoryStream* PartBlock, System::Classes::TStream* Digest) = 0 ;
	virtual void __fastcall Burn(void) = 0 ;
	virtual System::DynamicArray<System::Byte> __fastcall SelfTest_Source(void) = 0 ;
	virtual System::DynamicArray<System::Byte> __fastcall SelfTest_ReferenceHashValue(void) = 0 ;
};

__interface IHashDsc;
typedef System::DelphiInterface<IHashDsc> _di_IHashDsc;
__interface  INTERFACE_UUID("{A3922AFC-C917-4364-9FD1-FD84A3E37558}") IHashDsc  : public Utplb_streamcipher::ICryptoGraphicAlgorithm 
{
	
public:
	virtual int __fastcall DigestSize(void) = 0 ;
	virtual int __fastcall UpdateSize(void) = 0 ;
	virtual _di_IHasher __fastcall MakeHasher(const System::_di_IInterface Params) = 0 ;
};

//-- var, const, procedure ---------------------------------------------------
}	/* namespace Utplb_hashdsc */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_UTPLB_HASHDSC)
using namespace Utplb_hashdsc;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// Utplb_hashdscHPP
