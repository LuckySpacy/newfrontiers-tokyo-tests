﻿// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'uTPLb_SimpleBlockCipher.pas' rev: 28.00 (Windows)

#ifndef Utplb_simpleblockcipherHPP
#define Utplb_simpleblockcipherHPP

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
#include <uTPLb_BlockCipher.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Utplb_simpleblockcipher
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TSimpleBlockCipher;
class DELPHICLASS TSimpleBlockCipherKey;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TSimpleBlockCipher : public System::TInterfacedObject
{
	typedef System::TInterfacedObject inherited;
	
private:
	System::UnicodeString __fastcall DisplayName(void);
	System::UnicodeString __fastcall ProgId(void);
	Utplb_streamcipher::TAlgorithmicFeatureSet __fastcall Features(void);
	System::UnicodeString __fastcall DefinitionURL(void);
	System::UnicodeString __fastcall WikipediaReference(void);
	Utplb_streamcipher::TSymetricKey* __fastcall GenerateKey(System::Classes::TStream* Seed);
	Utplb_streamcipher::TSymetricKey* __fastcall LoadKeyFromStream(System::Classes::TStream* Store);
	int __fastcall BlockSize(void);
	int __fastcall KeySize(void);
	int __fastcall SeedByteSize(void);
	Utplb_blockcipher::_di_IBlockCodec __fastcall MakeBlockCodec(Utplb_streamcipher::TSymetricKey* Key);
	System::DynamicArray<System::Byte> __fastcall SelfTest_Key(void);
	System::DynamicArray<System::Byte> __fastcall SelfTest_Plaintext(void);
	System::DynamicArray<System::Byte> __fastcall SelfTest_Ciphertext(void);
	
protected:
	virtual System::DynamicArray<System::Byte> __fastcall Encrypt(const System::DynamicArray<System::Byte> Buffer, TSimpleBlockCipherKey* Key, bool doEncrypt) = 0 ;
	
public:
	System::UnicodeString FProgId;
	System::UnicodeString FDisplayName;
	Utplb_streamcipher::TAlgorithmicFeatureSet FFeatures;
	int FBlockSizeInBytes;
	__fastcall TSimpleBlockCipher(const System::UnicodeString ProgId1, const System::UnicodeString DisplayName1, Utplb_streamcipher::TAlgorithmicFeatureSet Features1, int BlockSizeInBytes1);
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TSimpleBlockCipher(void) { }
	
private:
	void *__IBlockCipher;	// Utplb_blockcipher::IBlockCipher 
	
public:
	#if defined(MANAGED_INTERFACE_OPERATORS)
	// {0562074A-4D94-4721-BC4A-65E48372A7E7}
	operator Utplb_streamcipher::_di_ICryptoGraphicAlgorithm()
	{
		Utplb_streamcipher::_di_ICryptoGraphicAlgorithm intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator Utplb_streamcipher::ICryptoGraphicAlgorithm*(void) { return (Utplb_streamcipher::ICryptoGraphicAlgorithm*)&__IBlockCipher; }
	#endif
	#if defined(MANAGED_INTERFACE_OPERATORS)
	// {CB927B43-8A02-4332-B844-A174D1D6B705}
	operator Utplb_blockcipher::_di_IBlockCipher()
	{
		Utplb_blockcipher::_di_IBlockCipher intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator Utplb_blockcipher::IBlockCipher*(void) { return (Utplb_blockcipher::IBlockCipher*)&__IBlockCipher; }
	#endif
	
};

#pragma pack(pop)

typedef System::TMetaClass* TSimpleBlockCipherClass;

#pragma pack(push,4)
class PASCALIMPLEMENTATION TSimpleBlockCipherKey : public Utplb_streamcipher::TSymetricKey
{
	typedef Utplb_streamcipher::TSymetricKey inherited;
	
public:
	System::DynamicArray<System::Byte> FKeyData;
	virtual void __fastcall SaveToStream(System::Classes::TStream* Stream);
	virtual void __fastcall Burn(void);
public:
	/* TObject.Create */ inline __fastcall TSimpleBlockCipherKey(void) : Utplb_streamcipher::TSymetricKey() { }
	/* TObject.Destroy */ inline __fastcall virtual ~TSimpleBlockCipherKey(void) { }
	
};

#pragma pack(pop)

class DELPHICLASS TSimpleBlockCipherCodec;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TSimpleBlockCipherCodec : public System::TInterfacedObject
{
	typedef System::TInterfacedObject inherited;
	
protected:
	TSimpleBlockCipherKey* FKey;
	System::DynamicArray<System::Byte> FBuffer;
	TSimpleBlockCipher* FCipher;
	void __fastcall Encrypt_Block(System::Classes::TMemoryStream* Plaintext, System::Classes::TMemoryStream* Ciphertext);
	void __fastcall Decrypt_Block(System::Classes::TMemoryStream* Plaintext, System::Classes::TMemoryStream* Ciphertext);
	void __fastcall Reset(void);
	void __fastcall Burn(void);
public:
	/* TObject.Create */ inline __fastcall TSimpleBlockCipherCodec(void) : System::TInterfacedObject() { }
	/* TObject.Destroy */ inline __fastcall virtual ~TSimpleBlockCipherCodec(void) { }
	
private:
	void *__IBlockCodec;	// Utplb_blockcipher::IBlockCodec 
	
public:
	#if defined(MANAGED_INTERFACE_OPERATORS)
	// {7E783A4E-EF17-4820-AB33-EF8EF9DA6F22}
	operator Utplb_blockcipher::_di_IBlockCodec()
	{
		Utplb_blockcipher::_di_IBlockCodec intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator Utplb_blockcipher::IBlockCodec*(void) { return (Utplb_blockcipher::IBlockCodec*)&__IBlockCodec; }
	#endif
	
};

#pragma pack(pop)

//-- var, const, procedure ---------------------------------------------------
}	/* namespace Utplb_simpleblockcipher */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_UTPLB_SIMPLEBLOCKCIPHER)
using namespace Utplb_simpleblockcipher;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// Utplb_simpleblockcipherHPP
