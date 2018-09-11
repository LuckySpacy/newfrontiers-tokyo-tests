﻿// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'uTPLb_XXTEA.pas' rev: 28.00 (Windows)

#ifndef Utplb_xxteaHPP
#define Utplb_xxteaHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <uTPLb_StreamCipher.hpp>	// Pascal unit
#include <uTPLb_BlockCipher.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <System.Types.hpp>	// Pascal unit
#include <uTPLb_Decorators.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Utplb_xxtea
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TXXTEA_LargeBlock;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TXXTEA_LargeBlock : public System::TInterfacedObject
{
	typedef System::TInterfacedObject inherited;
	
private:
	Utplb_blockcipher::_di_IBlockChainingModel FChaining;
	System::UnicodeString __fastcall DisplayName(void);
	System::UnicodeString __fastcall ProgId(void);
	Utplb_streamcipher::TAlgorithmicFeatureSet __fastcall Features(void);
	System::UnicodeString __fastcall DefinitionURL(void);
	System::UnicodeString __fastcall WikipediaReference(void);
	Utplb_streamcipher::TSymetricKey* __fastcall GenerateKey(System::Classes::TStream* Seed);
	Utplb_streamcipher::TSymetricKey* __fastcall LoadKeyFromStream(System::Classes::TStream* Store);
	int __fastcall SeedByteSize(void);
	Utplb_streamcipher::_di_IStreamCipher __fastcall Parameterize(const System::_di_IInterface Params);
	Utplb_streamcipher::_di_IStreamEncryptor __fastcall Start_Encrypt(Utplb_streamcipher::TSymetricKey* Key, System::Classes::TStream* CipherText);
	Utplb_streamcipher::_di_IStreamDecryptor __fastcall Start_Decrypt(Utplb_streamcipher::TSymetricKey* Key, System::Classes::TStream* PlainText);
	System::TObject* __fastcall ControlObject(void);
	
public:
	__fastcall TXXTEA_LargeBlock(void);
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TXXTEA_LargeBlock(void) { }
	
private:
	void *__IControlObject;	// Utplb_decorators::IControlObject 
	void *__IStreamCipher;	// Utplb_streamcipher::IStreamCipher 
	
public:
	#if defined(MANAGED_INTERFACE_OPERATORS)
	// {420914AC-6242-417E-8D18-7B163056DA60}
	operator Utplb_decorators::_di_IControlObject()
	{
		Utplb_decorators::_di_IControlObject intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator Utplb_decorators::IControlObject*(void) { return (Utplb_decorators::IControlObject*)&__IControlObject; }
	#endif
	#if defined(MANAGED_INTERFACE_OPERATORS)
	// {0562074A-4D94-4721-BC4A-65E48372A7E7}
	operator Utplb_streamcipher::_di_ICryptoGraphicAlgorithm()
	{
		Utplb_streamcipher::_di_ICryptoGraphicAlgorithm intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator Utplb_streamcipher::ICryptoGraphicAlgorithm*(void) { return (Utplb_streamcipher::ICryptoGraphicAlgorithm*)&__IStreamCipher; }
	#endif
	#if defined(MANAGED_INTERFACE_OPERATORS)
	// {E2F61BDB-42A3-4A9B-A02C-FA710B23F660}
	operator Utplb_streamcipher::_di_IStreamCipher()
	{
		Utplb_streamcipher::_di_IStreamCipher intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator Utplb_streamcipher::IStreamCipher*(void) { return (Utplb_streamcipher::IStreamCipher*)&__IStreamCipher; }
	#endif
	
};

#pragma pack(pop)

typedef System::StaticArray<unsigned, 4> TTEA_Key;

//-- var, const, procedure ---------------------------------------------------
extern DELPHI_PACKAGE void __fastcall XXTEA_Encrypt(const TTEA_Key &Key, const System::TLongWordDynArray Plaintext, System::TLongWordDynArray &Ciphertext);
extern DELPHI_PACKAGE void __fastcall XXTEA_Decrypt(const TTEA_Key &Key, const System::TLongWordDynArray Ciphertext, System::TLongWordDynArray &Plaintext);
}	/* namespace Utplb_xxtea */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_UTPLB_XXTEA)
using namespace Utplb_xxtea;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// Utplb_xxteaHPP
