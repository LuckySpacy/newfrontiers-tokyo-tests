// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'hbTapiWave.pas' rev: 27.00 (Windows)

#ifndef HbtapiwaveHPP
#define HbtapiwaveHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <Winapi.Windows.hpp>	// Pascal unit
#include <Winapi.Messages.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <Winapi.MMSystem.hpp>	// Pascal unit
#include <hbTapiVer.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Hbtapiwave
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS EWaveError;
#pragma pack(push,4)
class PASCALIMPLEMENTATION EWaveError : public System::Sysutils::Exception
{
	typedef System::Sysutils::Exception inherited;
	
public:
	unsigned FErrorCode;
	__fastcall EWaveError(unsigned Code, const System::UnicodeString Msg);
	__property unsigned ErrorCode = {read=FErrorCode, nodefault};
	__property Message = {default=0};
public:
	/* Exception.Create */ inline __fastcall EWaveError(const System::UnicodeString Msg) : System::Sysutils::Exception(Msg) { }
	/* Exception.CreateFmt */ inline __fastcall EWaveError(const System::UnicodeString Msg, System::TVarRec const *Args, const int Args_High) : System::Sysutils::Exception(Msg, Args, Args_High) { }
	/* Exception.CreateRes */ inline __fastcall EWaveError(NativeUInt Ident)/* overload */ : System::Sysutils::Exception(Ident) { }
	/* Exception.CreateRes */ inline __fastcall EWaveError(System::PResStringRec ResStringRec)/* overload */ : System::Sysutils::Exception(ResStringRec) { }
	/* Exception.CreateResFmt */ inline __fastcall EWaveError(NativeUInt Ident, System::TVarRec const *Args, const int Args_High)/* overload */ : System::Sysutils::Exception(Ident, Args, Args_High) { }
	/* Exception.CreateResFmt */ inline __fastcall EWaveError(System::PResStringRec ResStringRec, System::TVarRec const *Args, const int Args_High)/* overload */ : System::Sysutils::Exception(ResStringRec, Args, Args_High) { }
	/* Exception.CreateHelp */ inline __fastcall EWaveError(const System::UnicodeString Msg, int AHelpContext) : System::Sysutils::Exception(Msg, AHelpContext) { }
	/* Exception.CreateFmtHelp */ inline __fastcall EWaveError(const System::UnicodeString Msg, System::TVarRec const *Args, const int Args_High, int AHelpContext) : System::Sysutils::Exception(Msg, Args, Args_High, AHelpContext) { }
	/* Exception.CreateResHelp */ inline __fastcall EWaveError(NativeUInt Ident, int AHelpContext)/* overload */ : System::Sysutils::Exception(Ident, AHelpContext) { }
	/* Exception.CreateResHelp */ inline __fastcall EWaveError(System::PResStringRec ResStringRec, int AHelpContext)/* overload */ : System::Sysutils::Exception(ResStringRec, AHelpContext) { }
	/* Exception.CreateResFmtHelp */ inline __fastcall EWaveError(System::PResStringRec ResStringRec, System::TVarRec const *Args, const int Args_High, int AHelpContext)/* overload */ : System::Sysutils::Exception(ResStringRec, Args, Args_High, AHelpContext) { }
	/* Exception.CreateResFmtHelp */ inline __fastcall EWaveError(NativeUInt Ident, System::TVarRec const *Args, const int Args_High, int AHelpContext)/* overload */ : System::Sysutils::Exception(Ident, Args, Args_High, AHelpContext) { }
	/* Exception.Destroy */ inline __fastcall virtual ~EWaveError(void) { }
	
};

#pragma pack(pop)

class DELPHICLASS EWaveIOError;
#pragma pack(push,4)
class PASCALIMPLEMENTATION EWaveIOError : public EWaveError
{
	typedef EWaveError inherited;
	
public:
	/* EWaveError.CreateCode */ inline __fastcall EWaveIOError(unsigned Code, const System::UnicodeString Msg) : EWaveError(Code, Msg) { }
	
public:
	/* Exception.Create */ inline __fastcall EWaveIOError(const System::UnicodeString Msg) : EWaveError(Msg) { }
	/* Exception.CreateFmt */ inline __fastcall EWaveIOError(const System::UnicodeString Msg, System::TVarRec const *Args, const int Args_High) : EWaveError(Msg, Args, Args_High) { }
	/* Exception.CreateRes */ inline __fastcall EWaveIOError(NativeUInt Ident)/* overload */ : EWaveError(Ident) { }
	/* Exception.CreateRes */ inline __fastcall EWaveIOError(System::PResStringRec ResStringRec)/* overload */ : EWaveError(ResStringRec) { }
	/* Exception.CreateResFmt */ inline __fastcall EWaveIOError(NativeUInt Ident, System::TVarRec const *Args, const int Args_High)/* overload */ : EWaveError(Ident, Args, Args_High) { }
	/* Exception.CreateResFmt */ inline __fastcall EWaveIOError(System::PResStringRec ResStringRec, System::TVarRec const *Args, const int Args_High)/* overload */ : EWaveError(ResStringRec, Args, Args_High) { }
	/* Exception.CreateHelp */ inline __fastcall EWaveIOError(const System::UnicodeString Msg, int AHelpContext) : EWaveError(Msg, AHelpContext) { }
	/* Exception.CreateFmtHelp */ inline __fastcall EWaveIOError(const System::UnicodeString Msg, System::TVarRec const *Args, const int Args_High, int AHelpContext) : EWaveError(Msg, Args, Args_High, AHelpContext) { }
	/* Exception.CreateResHelp */ inline __fastcall EWaveIOError(NativeUInt Ident, int AHelpContext)/* overload */ : EWaveError(Ident, AHelpContext) { }
	/* Exception.CreateResHelp */ inline __fastcall EWaveIOError(System::PResStringRec ResStringRec, int AHelpContext)/* overload */ : EWaveError(ResStringRec, AHelpContext) { }
	/* Exception.CreateResFmtHelp */ inline __fastcall EWaveIOError(System::PResStringRec ResStringRec, System::TVarRec const *Args, const int Args_High, int AHelpContext)/* overload */ : EWaveError(ResStringRec, Args, Args_High, AHelpContext) { }
	/* Exception.CreateResFmtHelp */ inline __fastcall EWaveIOError(NativeUInt Ident, System::TVarRec const *Args, const int Args_High, int AHelpContext)/* overload */ : EWaveError(Ident, Args, Args_High, AHelpContext) { }
	/* Exception.Destroy */ inline __fastcall virtual ~EWaveIOError(void) { }
	
};

#pragma pack(pop)

typedef void __fastcall (__closure *TWaveErrorEvent)(System::TObject* Sender, unsigned ErrorCode, System::UnicodeString ErrorText);

class DELPHICLASS ThbWaveDevice;
class PASCALIMPLEMENTATION ThbWaveDevice : public System::Classes::TComponent
{
	typedef System::Classes::TComponent inherited;
	
private:
	Hbtapiver::ThbTapiComponentsAbout FAbout;
	HWND fWindowHandle;
	NativeInt fDeviceHandle;
	System::UnicodeString fDeviceName;
	System::Classes::TStringList* fDeviceList;
	int fDeviceID;
	unsigned fDeviceFormats;
	bool fActive;
	System::TDateTime fTime;
	unsigned fTransferdData;
	unsigned fBufferTime;
	
protected:
	int fBlockCount;
	System::Classes::TStream* fStream;
	tWAVEFORMATEX fWavFrmEx;
	System::Word fBlockSize;
	System::Classes::TNotifyEvent fOnDone;
	TWaveErrorEvent fOnWaveError;
	virtual void __fastcall Open(void);
	virtual void __fastcall Close(void);
	virtual void __fastcall Loaded(void);
	void __fastcall ApplyActive(void);
	virtual void __fastcall WindowProc(Winapi::Messages::TMessage &msg);
	bool __fastcall CheckMMResult(unsigned mmr, System::UnicodeString Desc = System::UnicodeString());
	unsigned __fastcall ProveMMResult(unsigned mmr, System::UnicodeString Desc = System::UnicodeString());
	void __fastcall FreeHeader(Winapi::Mmsystem::PWaveHdr &Header);
	virtual System::Classes::TStrings* __fastcall GetDeviceList(void) = 0 ;
	virtual System::UnicodeString __fastcall GetErrorText(unsigned err) = 0 ;
	System::TDateTime __fastcall GetTime(void);
	virtual void __fastcall SetDeviceID(const int Value);
	virtual void __fastcall SetDeviceName(const System::UnicodeString Value);
	void __fastcall SetActive(const bool Value);
	virtual void __fastcall SetBufferTime(const unsigned Value);
	virtual bool __fastcall IsActive(void);
	virtual bool __fastcall IsFormatSupported(void) = 0 ;
	virtual void __fastcall TriggerDone(void);
	virtual void __fastcall TriggerWaveError(unsigned ErrorCode, System::UnicodeString ErrorText);
	__property tWAVEFORMATEX WaveFormatEx = {read=fWavFrmEx, write=fWavFrmEx};
	__property bool Active = {read=IsActive, write=SetActive, nodefault};
	__property unsigned BufferTime = {read=fBufferTime, write=SetBufferTime, nodefault};
	__property int DeviceID = {read=fDeviceID, write=SetDeviceID, nodefault};
	__property unsigned DeviceFormats = {read=fDeviceFormats, nodefault};
	__property System::TDateTime Time = {read=GetTime};
	__property System::Classes::TNotifyEvent OnDone = {read=fOnDone, write=fOnDone};
	__property TWaveErrorEvent OnWaveError = {read=fOnWaveError, write=fOnWaveError};
	
public:
	__fastcall virtual ThbWaveDevice(System::Classes::TComponent* AOwner);
	__fastcall virtual ~ThbWaveDevice(void);
	__property System::Classes::TStrings* DeviceList = {read=GetDeviceList};
	__property System::UnicodeString DeviceName = {read=fDeviceName, write=SetDeviceName};
	bool __fastcall Busy(void);
	bool __fastcall Available(void);
	
__published:
	__property Hbtapiver::ThbTapiComponentsAbout About = {read=FAbout, write=FAbout, stored=false, nodefault};
};


class DELPHICLASS TPlaylist;
class PASCALIMPLEMENTATION TPlaylist : public System::Classes::TStringList
{
	typedef System::Classes::TStringList inherited;
	
private:
	int FItemIndex;
	tWAVEFORMATEX __fastcall GetWaveFormatEx(void);
	
public:
	void __fastcall CheckContent(void);
	void __fastcall First(void);
	void __fastcall Last(void);
	void __fastcall Next(void);
	void __fastcall Prior(void);
	bool __fastcall EOF(void);
	bool __fastcall GetData(System::Classes::TStream* &value);
	__property tWAVEFORMATEX WaveFormatEx = {read=GetWaveFormatEx};
	__property int ItemIndex = {read=FItemIndex, write=FItemIndex, nodefault};
public:
	/* TStringList.Create */ inline __fastcall TPlaylist(void)/* overload */ : System::Classes::TStringList() { }
	/* TStringList.Create */ inline __fastcall TPlaylist(bool OwnsObjects)/* overload */ : System::Classes::TStringList(OwnsObjects) { }
	/* TStringList.Destroy */ inline __fastcall virtual ~TPlaylist(void) { }
	
};


class DELPHICLASS ThbWaveOut;
class PASCALIMPLEMENTATION ThbWaveOut : public ThbWaveDevice
{
	typedef ThbWaveDevice inherited;
	
private:
	TPlaylist* fPlayList;
	bool fLoop;
	
protected:
	virtual void __fastcall Open(void);
	virtual void __fastcall Close(void);
	System::Classes::TStrings* __fastcall GetPlaylist(void);
	virtual System::Classes::TStrings* __fastcall GetDeviceList(void);
	bool __fastcall GetNextPlayEntry(void);
	void __fastcall SetPlayList(System::Classes::TStrings* const Value);
	virtual System::UnicodeString __fastcall GetErrorText(unsigned err);
	void __fastcall CreateOutBlock(Winapi::Mmsystem::PWaveHdr &Header);
	unsigned __fastcall SendData(Winapi::Mmsystem::PWaveHdr Header);
	unsigned __fastcall SendBlock(Winapi::Mmsystem::PWaveHdr Header);
	void __fastcall TriggerNeedData(void * Buffer, int BufferSize, int &UsedSize);
	virtual bool __fastcall IsFormatSupported(void);
	virtual void __fastcall WindowProc(Winapi::Messages::TMessage &msg);
	void __fastcall MMOutClose(Winapi::Messages::TMessage &msg);
	void __fastcall MMOutDone(Winapi::Messages::TMessage &msg);
	void __fastcall WMTimer(Winapi::Messages::TMessage &msg);
	
public:
	__fastcall virtual ThbWaveOut(System::Classes::TComponent* AOwner);
	__fastcall virtual ~ThbWaveOut(void);
	__property DeviceID;
	__property DeviceList;
	__property DeviceFormats;
	__property Time = {default=0};
	
__published:
	__property Active;
	__property BufferTime;
	__property DeviceName = {default=0};
	__property bool Loop = {read=fLoop, write=fLoop, nodefault};
	__property System::Classes::TStrings* Playlist = {read=GetPlaylist, write=SetPlayList};
	__property OnDone;
	__property OnWaveError;
};


class DELPHICLASS ThbWaveIn;
class PASCALIMPLEMENTATION ThbWaveIn : public ThbWaveDevice
{
	typedef ThbWaveDevice inherited;
	
private:
	System::UnicodeString fFilename;
	System::Word fNumBuffer;
	
protected:
	virtual void __fastcall Open(void);
	virtual void __fastcall Close(void);
	virtual System::Classes::TStrings* __fastcall GetDeviceList(void);
	virtual System::UnicodeString __fastcall GetErrorText(unsigned err);
	unsigned __fastcall CreateInBlock(Winapi::Mmsystem::PWaveHdr Header);
	virtual bool __fastcall IsFormatSupported(void);
	void __fastcall TriggerHaveData(void * Buffer, int BufferSize);
	virtual void __fastcall WindowProc(Winapi::Messages::TMessage &msg);
	void __fastcall MMInClose(Winapi::Messages::TMessage &msg);
	void __fastcall MMInDone(Winapi::Messages::TMessage &msg);
	
public:
	__fastcall virtual ThbWaveIn(System::Classes::TComponent* AOwner);
	__property System::Word NumBuffer = {read=fNumBuffer, write=fNumBuffer, default=4};
	__property DeviceID;
	__property DeviceList;
	__property DeviceFormats;
	__property Time = {default=0};
	
__published:
	__property Active;
	__property BufferTime;
	__property System::UnicodeString Filename = {read=fFilename, write=fFilename};
	__property DeviceName = {default=0};
	__property OnDone;
	__property OnWaveError;
public:
	/* ThbWaveDevice.Destroy */ inline __fastcall virtual ~ThbWaveIn(void) { }
	
};


class DELPHICLASS TWaveStream;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TWaveStream : public System::Classes::TStream
{
	typedef System::Classes::TStream inherited;
	
private:
	tWAVEFORMATEX *FFormat;
	int FDataOffset;
	int FSize;
	NativeInt mm;
	_MMCKINFO pck;
	_MMCKINFO pckRIFF;
	HIDESBASE int __fastcall GetPosition(void);
	HIDESBASE void __fastcall SetPosition(int Pos);
	void __fastcall CheckMMIOWave(void);
	
public:
	__fastcall TWaveStream(NativeInt mmIO, Winapi::Mmsystem::PWaveFormatEx WriteFormat);
	__fastcall virtual ~TWaveStream(void);
	virtual int __fastcall Read(void *Buffer, int Count)/* overload */;
	virtual int __fastcall Seek(int Offset, System::Word Origin)/* overload */;
	virtual int __fastcall Write(const void *Buffer, int Count)/* overload */;
	__property Winapi::Mmsystem::PWaveFormatEx Format = {read=FFormat};
	__property int Position = {read=GetPosition, write=SetPosition, nodefault};
	__property int Size = {read=FSize, nodefault};
	/* Hoisted overloads: */
	
public:
	inline int __fastcall  Read(System::DynamicArray<System::Byte> Buffer, int Offset, int Count){ return System::Classes::TStream::Read(Buffer, Offset, Count); }
	inline int __fastcall  Read(System::DynamicArray<System::Byte> &Buffer, int Count){ return System::Classes::TStream::Read(Buffer, Count); }
	inline __int64 __fastcall  Seek(const __int64 Offset, System::Classes::TSeekOrigin Origin){ return System::Classes::TStream::Seek(Offset, Origin); }
	inline __int64 __fastcall  Seek _DEPRECATED_ATTRIBUTE0 (const __int64 Offset, System::Word Origin){ return System::Classes::TStream::Seek(Offset, Origin); }
	inline int __fastcall  Write(const System::DynamicArray<System::Byte> Buffer, int Offset, int Count){ return System::Classes::TStream::Write(Buffer, Offset, Count); }
	inline int __fastcall  Write(const System::DynamicArray<System::Byte> Buffer, int Count){ return System::Classes::TStream::Write(Buffer, Count); }
	
};

#pragma pack(pop)

class DELPHICLASS TMemoryWaveStream;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TMemoryWaveStream : public TWaveStream
{
	typedef TWaveStream inherited;
	
private:
	NativeInt mmIO;
	
public:
	__fastcall virtual TMemoryWaveStream(void * Memory, int Size, Winapi::Mmsystem::PWaveFormatEx WriteFormat);
	__fastcall virtual ~TMemoryWaveStream(void);
};

#pragma pack(pop)

class DELPHICLASS TFileWaveStream;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TFileWaveStream : public TWaveStream
{
	typedef TWaveStream inherited;
	
private:
	NativeInt mmIO;
	
public:
	__fastcall virtual TFileWaveStream(System::UnicodeString FileName, Winapi::Mmsystem::PWaveFormatEx WriteFormat);
	__fastcall virtual ~TFileWaveStream(void);
};

#pragma pack(pop)

class DELPHICLASS TBeepStream;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TBeepStream : public System::Classes::TStream
{
	typedef System::Classes::TStream inherited;
	
private:
	int fPos;
	unsigned fFreq;
	int fSize;
	System::Word fBlockAlign;
	unsigned fSamplesPerSec;
	
public:
	__fastcall TBeepStream(const tWAVEFORMATEX &WaveFormat, System::UnicodeString Param);
	virtual int __fastcall Read(void *Buffer, int Count)/* overload */;
	virtual int __fastcall Write(const void *Buffer, int Count)/* overload */;
	virtual int __fastcall Seek(int Offset, System::Word Origin)/* overload */;
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TBeepStream(void) { }
	
	/* Hoisted overloads: */
	
public:
	inline int __fastcall  Read(System::DynamicArray<System::Byte> Buffer, int Offset, int Count){ return System::Classes::TStream::Read(Buffer, Offset, Count); }
	inline int __fastcall  Read(System::DynamicArray<System::Byte> &Buffer, int Count){ return System::Classes::TStream::Read(Buffer, Count); }
	inline int __fastcall  Write(const System::DynamicArray<System::Byte> Buffer, int Offset, int Count){ return System::Classes::TStream::Write(Buffer, Offset, Count); }
	inline int __fastcall  Write(const System::DynamicArray<System::Byte> Buffer, int Count){ return System::Classes::TStream::Write(Buffer, Count); }
	inline __int64 __fastcall  Seek(const __int64 Offset, System::Classes::TSeekOrigin Origin){ return System::Classes::TStream::Seek(Offset, Origin); }
	inline __int64 __fastcall  Seek _DEPRECATED_ATTRIBUTE0 (const __int64 Offset, System::Word Origin){ return System::Classes::TStream::Seek(Offset, Origin); }
	
};

#pragma pack(pop)

class DELPHICLASS TSilenceStream;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TSilenceStream : public System::Classes::TStream
{
	typedef System::Classes::TStream inherited;
	
private:
	int fPos;
	int fSize;
	System::Word fBlockAlign;
	unsigned fSamplesPerSec;
	
public:
	__fastcall TSilenceStream(const tWAVEFORMATEX &WaveFormat, System::UnicodeString Param);
	virtual int __fastcall Read(void *Buffer, int Count)/* overload */;
	virtual int __fastcall Write(const void *Buffer, int Count)/* overload */;
	virtual int __fastcall Seek(int Offset, System::Word Origin)/* overload */;
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TSilenceStream(void) { }
	
	/* Hoisted overloads: */
	
public:
	inline int __fastcall  Read(System::DynamicArray<System::Byte> Buffer, int Offset, int Count){ return System::Classes::TStream::Read(Buffer, Offset, Count); }
	inline int __fastcall  Read(System::DynamicArray<System::Byte> &Buffer, int Count){ return System::Classes::TStream::Read(Buffer, Count); }
	inline int __fastcall  Write(const System::DynamicArray<System::Byte> Buffer, int Offset, int Count){ return System::Classes::TStream::Write(Buffer, Offset, Count); }
	inline int __fastcall  Write(const System::DynamicArray<System::Byte> Buffer, int Count){ return System::Classes::TStream::Write(Buffer, Count); }
	inline __int64 __fastcall  Seek(const __int64 Offset, System::Classes::TSeekOrigin Origin){ return System::Classes::TStream::Seek(Offset, Origin); }
	inline __int64 __fastcall  Seek _DEPRECATED_ATTRIBUTE0 (const __int64 Offset, System::Word Origin){ return System::Classes::TStream::Seek(Offset, Origin); }
	
};

#pragma pack(pop)

//-- var, const, procedure ---------------------------------------------------
}	/* namespace Hbtapiwave */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_HBTAPIWAVE)
using namespace Hbtapiwave;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// HbtapiwaveHPP
