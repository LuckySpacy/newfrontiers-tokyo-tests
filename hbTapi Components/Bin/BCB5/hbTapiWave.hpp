// Borland C++ Builder
// Copyright (c) 1995, 1999 by Borland International
// All rights reserved

// (DO NOT EDIT: machine generated header) 'hbTapiWave.pas' rev: 5.00

#ifndef hbTapiWaveHPP
#define hbTapiWaveHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <hbTapiVer.hpp>	// Pascal unit
#include <MMSystem.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Hbtapiwave
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS EWaveError;
#pragma pack(push, 1)
class PASCALIMPLEMENTATION EWaveError : public Sysutils::Exception 
{
	typedef Sysutils::Exception inherited;
	
public:
	unsigned FErrorCode;
	__fastcall EWaveError(unsigned Code, const AnsiString Msg);
	__property unsigned ErrorCode = {read=FErrorCode, nodefault};
	__property Message ;
public:
	#pragma option push -w-inl
	/* Exception.Create */ inline __fastcall EWaveError(const AnsiString Msg) : Sysutils::Exception(Msg
		) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateFmt */ inline __fastcall EWaveError(const AnsiString Msg, const System::TVarRec 
		* Args, const int Args_Size) : Sysutils::Exception(Msg, Args, Args_Size) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateRes */ inline __fastcall EWaveError(int Ident)/* overload */ : Sysutils::Exception(
		Ident) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResFmt */ inline __fastcall EWaveError(int Ident, const System::TVarRec * Args, 
		const int Args_Size)/* overload */ : Sysutils::Exception(Ident, Args, Args_Size) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateHelp */ inline __fastcall EWaveError(const AnsiString Msg, int AHelpContext) : Sysutils::Exception(
		Msg, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateFmtHelp */ inline __fastcall EWaveError(const AnsiString Msg, const System::TVarRec 
		* Args, const int Args_Size, int AHelpContext) : Sysutils::Exception(Msg, Args, Args_Size, AHelpContext
		) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResHelp */ inline __fastcall EWaveError(int Ident, int AHelpContext)/* overload */
		 : Sysutils::Exception(Ident, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResFmtHelp */ inline __fastcall EWaveError(System::PResStringRec ResStringRec, const 
		System::TVarRec * Args, const int Args_Size, int AHelpContext)/* overload */ : Sysutils::Exception(
		ResStringRec, Args, Args_Size, AHelpContext) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~EWaveError(void) { }
	#pragma option pop
	
};

#pragma pack(pop)

class DELPHICLASS EWaveIOError;
#pragma pack(push, 1)
class PASCALIMPLEMENTATION EWaveIOError : public EWaveError 
{
	typedef EWaveError inherited;
	
public:
	#pragma option push -w-inl
	/* EWaveError.CreateCode */ inline __fastcall EWaveIOError(unsigned Code, const AnsiString Msg) : EWaveError(
		Code, Msg) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* Exception.Create */ inline __fastcall EWaveIOError(const AnsiString Msg) : EWaveError(Msg) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateFmt */ inline __fastcall EWaveIOError(const AnsiString Msg, const System::TVarRec 
		* Args, const int Args_Size) : EWaveError(Msg, Args, Args_Size) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateRes */ inline __fastcall EWaveIOError(int Ident)/* overload */ : EWaveError(Ident
		) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResFmt */ inline __fastcall EWaveIOError(int Ident, const System::TVarRec * Args
		, const int Args_Size)/* overload */ : EWaveError(Ident, Args, Args_Size) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateHelp */ inline __fastcall EWaveIOError(const AnsiString Msg, int AHelpContext) : 
		EWaveError(Msg, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateFmtHelp */ inline __fastcall EWaveIOError(const AnsiString Msg, const System::TVarRec 
		* Args, const int Args_Size, int AHelpContext) : EWaveError(Msg, Args, Args_Size, AHelpContext) { }
		
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResHelp */ inline __fastcall EWaveIOError(int Ident, int AHelpContext)/* overload */
		 : EWaveError(Ident, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResFmtHelp */ inline __fastcall EWaveIOError(System::PResStringRec ResStringRec, 
		const System::TVarRec * Args, const int Args_Size, int AHelpContext)/* overload */ : EWaveError(ResStringRec
		, Args, Args_Size, AHelpContext) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~EWaveIOError(void) { }
	#pragma option pop
	
};

#pragma pack(pop)

typedef void __fastcall (__closure *TWaveErrorEvent)(System::TObject* Sender, unsigned ErrorCode, AnsiString 
	ErrorText);

class DELPHICLASS ThbWaveDevice;
#pragma pack(push, 1)
class PASCALIMPLEMENTATION ThbWaveDevice : public Classes::TComponent 
{
	typedef Classes::TComponent inherited;
	
private:
	Hbtapiver::ThbTapiComponentsAbout FAbout;
	HWND fWindowHandle;
	int fDeviceHandle;
	AnsiString fDeviceName;
	Classes::TStringList* fDeviceList;
	int fDeviceID;
	unsigned fDeviceFormats;
	bool fActive;
	System::TDateTime fTime;
	unsigned fTransferdData;
	unsigned fBufferTime;
	
protected:
	int fBlockCount;
	Classes::TStream* fStream;
	#pragma pack(push, 1)
	tWAVEFORMATEX fWavFrmEx;
	#pragma pack(pop)
	
	Word fBlockSize;
	Classes::TNotifyEvent fOnDone;
	TWaveErrorEvent fOnWaveError;
	virtual void __fastcall Open(void);
	virtual void __fastcall Close(void);
	virtual void __fastcall Loaded(void);
	void __fastcall ApplyActive(void);
	virtual void __fastcall WindowProc(Messages::TMessage &msg);
	bool __fastcall CheckMMResult(unsigned mmr, AnsiString Desc);
	unsigned __fastcall ProveMMResult(unsigned mmr, AnsiString Desc);
	void __fastcall FreeHeader(Mmsystem::PWaveHdr &Header);
	virtual Classes::TStrings* __fastcall GetDeviceList(void) = 0 ;
	virtual AnsiString __fastcall GetErrorText(unsigned err) = 0 ;
	System::TDateTime __fastcall GetTime(void);
	virtual void __fastcall SetDeviceID(const int Value);
	virtual void __fastcall SetDeviceName(const AnsiString Value);
	void __fastcall SetActive(const bool Value);
	virtual void __fastcall SetBufferTime(const unsigned Value);
	virtual bool __fastcall IsActive(void);
	virtual bool __fastcall IsFormatSupported(void) = 0 ;
	virtual void __fastcall TriggerDone(void);
	virtual void __fastcall TriggerWaveError(unsigned ErrorCode, AnsiString ErrorText);
	__property tWAVEFORMATEX WaveFormatEx = {read=fWavFrmEx, write=fWavFrmEx};
	__property bool Active = {read=IsActive, write=SetActive, nodefault};
	__property unsigned BufferTime = {read=fBufferTime, write=SetBufferTime, nodefault};
	__property int DeviceID = {read=fDeviceID, write=SetDeviceID, nodefault};
	__property unsigned DeviceFormats = {read=fDeviceFormats, nodefault};
	__property System::TDateTime Time = {read=GetTime};
	__property Classes::TNotifyEvent OnDone = {read=fOnDone, write=fOnDone};
	__property TWaveErrorEvent OnWaveError = {read=fOnWaveError, write=fOnWaveError};
	
public:
	__fastcall virtual ThbWaveDevice(Classes::TComponent* AOwner);
	__fastcall virtual ~ThbWaveDevice(void);
	__property Classes::TStrings* DeviceList = {read=GetDeviceList};
	__property AnsiString DeviceName = {read=fDeviceName, write=SetDeviceName};
	bool __fastcall Busy(void);
	bool __fastcall Available(void);
	
__published:
	__property Hbtapiver::ThbTapiComponentsAbout About = {read=FAbout, write=FAbout, stored=false, nodefault
		};
};

#pragma pack(pop)

class DELPHICLASS TPlaylist;
#pragma pack(push, 1)
class PASCALIMPLEMENTATION TPlaylist : public Classes::TStringList 
{
	typedef Classes::TStringList inherited;
	
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
	bool __fastcall GetData(Classes::TStream* &value);
	__property tWAVEFORMATEX WaveFormatEx = {read=GetWaveFormatEx};
	__property int ItemIndex = {read=FItemIndex, write=FItemIndex, nodefault};
public:
	#pragma option push -w-inl
	/* TStringList.Destroy */ inline __fastcall virtual ~TPlaylist(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TPlaylist(void) : Classes::TStringList() { }
	#pragma option pop
	
};

#pragma pack(pop)

class DELPHICLASS ThbWaveOut;
#pragma pack(push, 1)
class PASCALIMPLEMENTATION ThbWaveOut : public ThbWaveDevice 
{
	typedef ThbWaveDevice inherited;
	
private:
	TPlaylist* fPlayList;
	bool fLoop;
	
protected:
	virtual void __fastcall Open(void);
	virtual void __fastcall Close(void);
	Classes::TStrings* __fastcall GetPlaylist(void);
	virtual Classes::TStrings* __fastcall GetDeviceList(void);
	bool __fastcall GetNextPlayEntry(void);
	void __fastcall SetPlayList(const Classes::TStrings* Value);
	virtual AnsiString __fastcall GetErrorText(unsigned err);
	void __fastcall CreateOutBlock(Mmsystem::PWaveHdr &Header);
	unsigned __fastcall SendData(Mmsystem::PWaveHdr Header);
	unsigned __fastcall SendBlock(Mmsystem::PWaveHdr Header);
	void __fastcall TriggerNeedData(void * Buffer, int BufferSize, int &UsedSize);
	virtual bool __fastcall IsFormatSupported(void);
	virtual void __fastcall WindowProc(Messages::TMessage &msg);
	void __fastcall MMOutClose(Messages::TMessage &msg);
	void __fastcall MMOutDone(Messages::TMessage &msg);
	void __fastcall WMTimer(Messages::TMessage &msg);
	
public:
	__fastcall virtual ThbWaveOut(Classes::TComponent* AOwner);
	__fastcall virtual ~ThbWaveOut(void);
	__property DeviceID ;
	__property DeviceList ;
	__property DeviceFormats ;
	__property Time ;
	
__published:
	__property Active ;
	__property BufferTime ;
	__property DeviceName ;
	__property bool Loop = {read=fLoop, write=fLoop, nodefault};
	__property Classes::TStrings* Playlist = {read=GetPlaylist, write=SetPlayList};
	__property OnDone ;
	__property OnWaveError ;
};

#pragma pack(pop)

class DELPHICLASS ThbWaveIn;
#pragma pack(push, 1)
class PASCALIMPLEMENTATION ThbWaveIn : public ThbWaveDevice 
{
	typedef ThbWaveDevice inherited;
	
private:
	AnsiString fFilename;
	Word fNumBuffer;
	
protected:
	virtual void __fastcall Open(void);
	virtual void __fastcall Close(void);
	virtual Classes::TStrings* __fastcall GetDeviceList(void);
	virtual AnsiString __fastcall GetErrorText(unsigned err);
	unsigned __fastcall CreateInBlock(Mmsystem::PWaveHdr Header);
	virtual bool __fastcall IsFormatSupported(void);
	void __fastcall TriggerHaveData(void * Buffer, int BufferSize);
	virtual void __fastcall WindowProc(Messages::TMessage &msg);
	void __fastcall MMInClose(Messages::TMessage &msg);
	void __fastcall MMInDone(Messages::TMessage &msg);
	
public:
	__fastcall virtual ThbWaveIn(Classes::TComponent* AOwner);
	__property Word NumBuffer = {read=fNumBuffer, write=fNumBuffer, default=4};
	__property DeviceID ;
	__property DeviceList ;
	__property DeviceFormats ;
	__property Time ;
	
__published:
	__property Active ;
	__property BufferTime ;
	__property AnsiString Filename = {read=fFilename, write=fFilename};
	__property DeviceName ;
	__property OnDone ;
	__property OnWaveError ;
public:
	#pragma option push -w-inl
	/* ThbWaveDevice.Destroy */ inline __fastcall virtual ~ThbWaveIn(void) { }
	#pragma option pop
	
};

#pragma pack(pop)

class DELPHICLASS TWaveStream;
#pragma pack(push, 1)
class PASCALIMPLEMENTATION TWaveStream : public Classes::TStream 
{
	typedef Classes::TStream inherited;
	
private:
	tWAVEFORMATEX *FFormat;
	int FDataOffset;
	int FSize;
	int mm;
	#pragma pack(push, 1)
	_MMCKINFO pck;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	_MMCKINFO pckRIFF;
	#pragma pack(pop)
	
	HIDESBASE int __fastcall GetPosition(void);
	HIDESBASE void __fastcall SetPosition(int Pos);
	void __fastcall CheckMMIOWave(void);
	
public:
	__fastcall TWaveStream(int mmIO, Mmsystem::PWaveFormatEx WriteFormat);
	__fastcall virtual ~TWaveStream(void);
	virtual int __fastcall Read(void *Buffer, int Count);
	virtual int __fastcall Seek(int Offset, Word Origin);
	virtual int __fastcall Write(const void *Buffer, int Count);
	__property Mmsystem::PWaveFormatEx Format = {read=FFormat};
	__property int Position = {read=GetPosition, write=SetPosition, nodefault};
	__property int Size = {read=FSize, nodefault};
};

#pragma pack(pop)

class DELPHICLASS TMemoryWaveStream;
#pragma pack(push, 1)
class PASCALIMPLEMENTATION TMemoryWaveStream : public TWaveStream 
{
	typedef TWaveStream inherited;
	
private:
	int mmIO;
	
public:
	__fastcall virtual TMemoryWaveStream(void * Memory, int Size, Mmsystem::PWaveFormatEx WriteFormat);
		
	__fastcall virtual ~TMemoryWaveStream(void);
};

#pragma pack(pop)

class DELPHICLASS TFileWaveStream;
#pragma pack(push, 1)
class PASCALIMPLEMENTATION TFileWaveStream : public TWaveStream 
{
	typedef TWaveStream inherited;
	
private:
	int mmIO;
	
public:
	__fastcall virtual TFileWaveStream(AnsiString FileName, Mmsystem::PWaveFormatEx WriteFormat);
	__fastcall virtual ~TFileWaveStream(void);
};

#pragma pack(pop)

class DELPHICLASS TBeepStream;
#pragma pack(push, 1)
class PASCALIMPLEMENTATION TBeepStream : public Classes::TStream 
{
	typedef Classes::TStream inherited;
	
private:
	int fPos;
	unsigned fFreq;
	int fSize;
	Word fBlockAlign;
	unsigned fSamplesPerSec;
	
public:
	__fastcall TBeepStream(const tWAVEFORMATEX &WaveFormat, AnsiString Param);
	virtual int __fastcall Read(void *Buffer, int Count);
	virtual int __fastcall Write(const void *Buffer, int Count);
	virtual int __fastcall Seek(int Offset, Word Origin);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TBeepStream(void) { }
	#pragma option pop
	
};

#pragma pack(pop)

class DELPHICLASS TSilenceStream;
#pragma pack(push, 1)
class PASCALIMPLEMENTATION TSilenceStream : public Classes::TStream 
{
	typedef Classes::TStream inherited;
	
private:
	int fPos;
	int fSize;
	Word fBlockAlign;
	unsigned fSamplesPerSec;
	
public:
	__fastcall TSilenceStream(const tWAVEFORMATEX &WaveFormat, AnsiString Param);
	virtual int __fastcall Read(void *Buffer, int Count);
	virtual int __fastcall Write(const void *Buffer, int Count);
	virtual int __fastcall Seek(int Offset, Word Origin);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TSilenceStream(void) { }
	#pragma option pop
	
};

#pragma pack(pop)

//-- var, const, procedure ---------------------------------------------------

}	/* namespace Hbtapiwave */
#if !defined(NO_IMPLICIT_NAMESPACE_USE)
using namespace Hbtapiwave;
#endif
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// hbTapiWave
