// CodeGear C++Builder
// Copyright (c) 1995, 2013 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'hbTapi.pas' rev: 26.00 (Windows)

#ifndef HbtapiHPP
#define HbtapiHPP

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
#include <Vcl.Graphics.hpp>	// Pascal unit
#include <hbTapiApi.hpp>	// Pascal unit
#include <hbTapiVer.hpp>	// Pascal unit
#include <System.Contnrs.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Hbtapi
{
//-- type declarations -------------------------------------------------------
typedef System::TMetaClass* ThbTapiCallClass;

typedef unsigned TTapiResult;

class DELPHICLASS ThbTapiCallList;
class DELPHICLASS TProtectedList;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TProtectedList : public System::Classes::TList
{
	typedef System::Classes::TList inherited;
	
private:
	NativeUInt FMutex;
	
public:
	bool __fastcall Acquire(unsigned Timeout = (unsigned)(0xffffffff));
	void __fastcall Release(void);
	__fastcall TProtectedList(void);
	__fastcall virtual ~TProtectedList(void);
};

#pragma pack(pop)

class DELPHICLASS ThbTapiCall;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiCallList : public TProtectedList
{
	typedef TProtectedList inherited;
	
public:
	ThbTapiCall* operator[](int Index) { return Items[Index]; }
	
protected:
	HIDESBASE ThbTapiCall* __fastcall Get(int Index);
	HIDESBASE void __fastcall Put(int Index, ThbTapiCall* Item);
	
public:
	HIDESBASE int __fastcall Add(ThbTapiCall* Item);
	ThbTapiCall* __fastcall ByHandle(unsigned CallHandle);
	HIDESBASE void __fastcall Assign(ThbTapiCallList* Value);
	__property ThbTapiCall* Items[int Index] = {read=Get, write=Put/*, default*/};
public:
	/* TProtectedList.Create */ inline __fastcall ThbTapiCallList(void) : TProtectedList() { }
	/* TProtectedList.Destroy */ inline __fastcall virtual ~ThbTapiCallList(void) { }
	
};

#pragma pack(pop)
typedef ThbTapiCallList TTapiCallList;

class DELPHICLASS ThbTapiTSP;
class DELPHICLASS ThbTapiDevice;
#pragma pack(push,1)
struct DECLSPEC_DRECORD TTapiDeviceExtentionID
{
public:
	unsigned dwExtensionID0;
	unsigned dwExtensionID1;
	unsigned dwExtensionID2;
	unsigned dwExtensionID3;
};
#pragma pack(pop)


#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiTSP : public System::Classes::TPersistent
{
	typedef System::Classes::TPersistent inherited;
	
private:
	ThbTapiDevice* FDevice;
	int FDeviceID;
	TTapiDeviceExtentionID FExtensionID;
	unsigned FExtLowVersion;
	unsigned FExtHighVersion;
	unsigned FExtVersion;
	unsigned FAPILowVersion;
	unsigned FAPIHighVersion;
	unsigned FAPIVersion;
	
protected:
	virtual unsigned __fastcall NegotiateAPIVersion(void) = 0 ;
	virtual unsigned __fastcall NegotiateExtVersion(void) = 0 ;
	void __fastcall Set_Version(int index, unsigned value);
	unsigned __fastcall Get_ExtensionID(int index);
	
public:
	__fastcall ThbTapiTSP(ThbTapiDevice* ATapiDevice);
	virtual unsigned __fastcall Init(int DeviceID);
	virtual void __fastcall Done(void);
	virtual unsigned __fastcall Update(void);
	virtual void __fastcall Assign(System::Classes::TPersistent* Source);
	bool __fastcall CompareExtensionID(const lineextensionid_tag &value)/* overload */;
	bool __fastcall CompareExtensionID(const phoneextensionid_tag &value)/* overload */;
	bool __fastcall CompareExtensionIDs(unsigned ID0, unsigned ID1, unsigned ID2, unsigned ID3);
	__property unsigned APIVersion = {read=FAPIVersion, nodefault};
	__property unsigned APILowVersion = {read=FAPILowVersion, write=Set_Version, index=0, nodefault};
	__property unsigned APIHighVersion = {read=FAPIHighVersion, write=Set_Version, index=1, nodefault};
	__property unsigned ExtVersion = {read=FExtVersion, nodefault};
	__property TTapiDeviceExtentionID ExtensionID = {read=FExtensionID};
	__property unsigned ExtensionID0 = {read=Get_ExtensionID, index=0, nodefault};
	__property unsigned ExtensionID1 = {read=Get_ExtensionID, index=1, nodefault};
	__property unsigned ExtensionID2 = {read=Get_ExtensionID, index=2, nodefault};
	__property unsigned ExtensionID3 = {read=Get_ExtensionID, index=3, nodefault};
	
__published:
	__property unsigned ExtLowVersion = {read=FExtLowVersion, write=Set_Version, index=2, default=0};
	__property unsigned ExtHighVersion = {read=FExtHighVersion, write=Set_Version, index=3, default=0};
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~ThbTapiTSP(void) { }
	
};

#pragma pack(pop)
typedef ThbTapiTSP TTapiTSP;

class DELPHICLASS ThbTapiLinePrivileges;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiLinePrivileges : public System::Classes::TPersistent
{
	typedef System::Classes::TPersistent inherited;
	
private:
	bool FPrivNone;
	bool FPrivOwner;
	bool FPrivMonitor;
	bool FAutoSelect;
	
protected:
	unsigned __fastcall Get_Value(void);
	void __fastcall Set_Value(unsigned Value);
	bool __fastcall Get_Priv(int Index);
	virtual void __fastcall Set_Priv(int index, bool value);
	System::UnicodeString __fastcall Get_Text(void);
	
public:
	__fastcall ThbTapiLinePrivileges(void);
	__property unsigned Value = {read=Get_Value, write=Set_Value, nodefault};
	__property System::UnicodeString Text = {read=Get_Text};
	
__published:
	__property bool AutoSelect = {read=FAutoSelect, write=FAutoSelect, default=1};
	__property bool Monitor = {read=Get_Priv, write=Set_Priv, index=0, default=1};
	__property bool None = {read=Get_Priv, write=Set_Priv, index=1, default=0};
	__property bool Owner = {read=Get_Priv, write=Set_Priv, index=2, default=1};
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~ThbTapiLinePrivileges(void) { }
	
};

#pragma pack(pop)
typedef ThbTapiLinePrivileges TTapiLinePrivileges;

class DELPHICLASS ThbTapiLine;
class DELPHICLASS ThbTapiAddress;
typedef void __fastcall (__closure *ThbTapiAddressStateEvent)(ThbTapiLine* Sender, ThbTapiAddress* Address, unsigned AddressState);

typedef void __fastcall (__closure *ThbTapiAddrEvent)(ThbTapiLine* Sender, ThbTapiAddress* Addr, unsigned AddressState);

typedef void __fastcall (__closure *ThbTapiCallDigitEvent)(ThbTapiLine* Sender, ThbTapiCall* Call, System::WideChar Digit);

typedef void __fastcall (__closure *ThbTapiCallEvent)(ThbTapiLine* Sender, ThbTapiCall* Call);

typedef void __fastcall (__closure *ThbTapiCallGatherDigitsEvent)(ThbTapiLine* Sender, ThbTapiCall* Call, System::UnicodeString Digits, unsigned Termination);

typedef void __fastcall (__closure *ThbTapiCallGenerateEvent)(ThbTapiLine* Sender, ThbTapiCall* Call, unsigned GenerateTermination);

typedef void __fastcall (__closure *ThbTapiCallInfoEvent)(ThbTapiLine* Sender, ThbTapiCall* Call, unsigned InfoState);

typedef void __fastcall (__closure *ThbTapiCallPrivilegeEvent)(ThbTapiLine* Sender, ThbTapiCall* Call, unsigned CallPrivilege);

typedef void __fastcall (__closure *ThbTapiCallStateEvent)(ThbTapiLine* Sender, ThbTapiCall* Call, unsigned CallState);

typedef void __fastcall (__closure *ThbTapiCallStateModeEvent)(ThbTapiLine* Sender, ThbTapiCall* Call, unsigned StateMode);

typedef void __fastcall (__closure *ThbTapiCallToneEvent)(ThbTapiLine* Sender, ThbTapiCall* Call, unsigned AppSpecific);

typedef void __fastcall (__closure *ThbTapiDeviceEvent)(System::TObject* Sender, unsigned DeviceID);

typedef void __fastcall (__closure *ThbTapiDeviceNameEvent)(System::TObject* Sender, unsigned DeviceID, System::UnicodeString DeviceName);

typedef void __fastcall (__closure *ThbTapiDeviceStateEvent)(System::TObject* Sender, unsigned State, unsigned StateDetail1, unsigned StateDetail2);

typedef void __fastcall (__closure *ThbTapiLineDevSpecificEvent)(ThbTapiLine* Sender, ThbTapiCall* Call, unsigned DeviceSpecific1, unsigned DeviceSpecific2, unsigned DeviceSpecific3);

typedef void __fastcall (__closure *ThbTapiLineDevSpecReplyEvent)(System::TObject* Sender, unsigned RequestID, void * Data, unsigned DataSize, ThbTapiAddress* Address, ThbTapiCall* Call, unsigned ReplyCode);

typedef void __fastcall (__closure *ThbTapiLineDevSpecTimeoutEvent)(System::TObject* Sender, unsigned RequestID, void * Data, unsigned DataSize, ThbTapiAddress* Address, ThbTapiCall* Call, unsigned ElapsedTime);

typedef void __fastcall (__closure *ThbTapiLineRingEvent)(ThbTapiLine* Sender, unsigned RingMode, unsigned RingCount);

class DELPHICLASS ThbTapiPhone;
typedef void __fastcall (__closure *ThbTapiPhoneButtonEvent)(ThbTapiPhone* Sender, unsigned ButtonID, unsigned ButtonMode, unsigned ButtonState);

typedef void __fastcall (__closure *ThbTapiPhoneButtonLampEvent)(ThbTapiPhone* Sender, unsigned ButtonLampID);

typedef void __fastcall (__closure *ThbTapiPhoneDevSpecificEvent)(ThbTapiPhone* Sender, unsigned DeviceSpecific1, unsigned DeviceSpecific2, unsigned DeviceSpecific3);

typedef void __fastcall (__closure *ThbTapiPhoneDigitEvent)(ThbTapiPhone* Sender, System::WideChar Digit);

typedef void __fastcall (__closure *ThbTapiMessageEvent)(System::TObject* Sender, unsigned MessageID, unsigned Device, unsigned Param1, unsigned Param2, unsigned Param3);

typedef void __fastcall (__closure *ThbTapiReplyEvent)(System::TObject* Sender, unsigned RequestID, unsigned ReplyCode);

typedef void __fastcall (__closure *ThbTapiTimeoutEvent)(System::TObject* Sender, unsigned RequestID);

typedef void __fastcall (__closure *ThbTapiDetailedMessageEvent)(System::TObject* Sender, unsigned MessageID, unsigned Device, unsigned CallbackInstance, unsigned Param1, unsigned Param2, unsigned Param3);

typedef void __fastcall (__closure *ThbTapiRequestMakeCallEvent)(System::TObject* Sender, System::UnicodeString DestAddress, System::UnicodeString AppName, System::UnicodeString CalledParty, System::UnicodeString Comment);

typedef void __fastcall (__closure *ThbTapiDevSpecReplyEvent)(System::TObject* Sender, unsigned RequestID, void * Data, unsigned DataSize, unsigned ReplyCode);

typedef void __fastcall (__closure *ThbTapiDevSpecTimeoutEvent)(System::TObject* Sender, unsigned RequestID, void * Data, unsigned DataSize, unsigned ElapsedTime);

typedef void __fastcall (__closure *ThbTapiErrorEvent)(System::TObject* Sender, System::Sysutils::Exception* Error, System::TObject* Causer);

class DELPHICLASS EhbTapiError;
#pragma pack(push,4)
class PASCALIMPLEMENTATION EhbTapiError : public System::Sysutils::Exception
{
	typedef System::Sysutils::Exception inherited;
	
public:
	unsigned FErrorCode;
	__fastcall EhbTapiError(unsigned Code, const System::UnicodeString Msg);
	__property unsigned ErrorCode = {read=FErrorCode, nodefault};
	__property Message = {default=0};
public:
	/* Exception.Create */ inline __fastcall EhbTapiError(const System::UnicodeString Msg) : System::Sysutils::Exception(Msg) { }
	/* Exception.CreateFmt */ inline __fastcall EhbTapiError(const System::UnicodeString Msg, System::TVarRec const *Args, const int Args_Size) : System::Sysutils::Exception(Msg, Args, Args_Size) { }
	/* Exception.CreateRes */ inline __fastcall EhbTapiError(NativeUInt Ident)/* overload */ : System::Sysutils::Exception(Ident) { }
	/* Exception.CreateRes */ inline __fastcall EhbTapiError(System::PResStringRec ResStringRec)/* overload */ : System::Sysutils::Exception(ResStringRec) { }
	/* Exception.CreateResFmt */ inline __fastcall EhbTapiError(NativeUInt Ident, System::TVarRec const *Args, const int Args_Size)/* overload */ : System::Sysutils::Exception(Ident, Args, Args_Size) { }
	/* Exception.CreateResFmt */ inline __fastcall EhbTapiError(System::PResStringRec ResStringRec, System::TVarRec const *Args, const int Args_Size)/* overload */ : System::Sysutils::Exception(ResStringRec, Args, Args_Size) { }
	/* Exception.CreateHelp */ inline __fastcall EhbTapiError(const System::UnicodeString Msg, int AHelpContext) : System::Sysutils::Exception(Msg, AHelpContext) { }
	/* Exception.CreateFmtHelp */ inline __fastcall EhbTapiError(const System::UnicodeString Msg, System::TVarRec const *Args, const int Args_Size, int AHelpContext) : System::Sysutils::Exception(Msg, Args, Args_Size, AHelpContext) { }
	/* Exception.CreateResHelp */ inline __fastcall EhbTapiError(NativeUInt Ident, int AHelpContext)/* overload */ : System::Sysutils::Exception(Ident, AHelpContext) { }
	/* Exception.CreateResHelp */ inline __fastcall EhbTapiError(System::PResStringRec ResStringRec, int AHelpContext)/* overload */ : System::Sysutils::Exception(ResStringRec, AHelpContext) { }
	/* Exception.CreateResFmtHelp */ inline __fastcall EhbTapiError(System::PResStringRec ResStringRec, System::TVarRec const *Args, const int Args_Size, int AHelpContext)/* overload */ : System::Sysutils::Exception(ResStringRec, Args, Args_Size, AHelpContext) { }
	/* Exception.CreateResFmtHelp */ inline __fastcall EhbTapiError(NativeUInt Ident, System::TVarRec const *Args, const int Args_Size, int AHelpContext)/* overload */ : System::Sysutils::Exception(Ident, Args, Args_Size, AHelpContext) { }
	/* Exception.Destroy */ inline __fastcall virtual ~EhbTapiError(void) { }
	
};

#pragma pack(pop)

struct TTapiVarData;
typedef TTapiVarData *PTapiVarData;

#pragma pack(push,1)
struct DECLSPEC_DRECORD TTapiVarData
{
public:
	unsigned dwTotalSize;
	unsigned dwNeededSize;
	unsigned dwUsedSize;
};
#pragma pack(pop)


class DELPHICLASS TProtectedObjectList;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TProtectedObjectList : public System::Contnrs::TObjectList
{
	typedef System::Contnrs::TObjectList inherited;
	
private:
	NativeUInt FMutex;
	
public:
	bool __fastcall Acquire(unsigned Timeout = (unsigned)(0xffffffff));
	void __fastcall Release(void);
	__fastcall TProtectedObjectList(void);
	__fastcall virtual ~TProtectedObjectList(void);
};

#pragma pack(pop)

class DELPHICLASS ThbTapiLineList;
class DELPHICLASS ThbCustomTapiLine;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiLineList : public System::Classes::TList
{
	typedef System::Classes::TList inherited;
	
public:
	ThbCustomTapiLine* operator[](int Index) { return Items[Index]; }
	
protected:
	HIDESBASE ThbCustomTapiLine* __fastcall Get(int Index);
	HIDESBASE void __fastcall Put(int Index, ThbCustomTapiLine* Item);
	
public:
	int __fastcall IndexOfDeviceID(int value);
	__property ThbCustomTapiLine* Items[int Index] = {read=Get, write=Put/*, default*/};
public:
	/* TList.Destroy */ inline __fastcall virtual ~ThbTapiLineList(void) { }
	
public:
	/* TObject.Create */ inline __fastcall ThbTapiLineList(void) : System::Classes::TList() { }
	
};

#pragma pack(pop)

class DELPHICLASS ThbTapiPhoneList;
class DELPHICLASS ThbCustomTapiPhone;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiPhoneList : public System::Classes::TList
{
	typedef System::Classes::TList inherited;
	
public:
	ThbCustomTapiPhone* operator[](int Index) { return Items[Index]; }
	
protected:
	HIDESBASE ThbCustomTapiPhone* __fastcall Get(int Index);
	HIDESBASE void __fastcall Put(int Index, ThbCustomTapiPhone* Item);
	
public:
	__property ThbCustomTapiPhone* Items[int Index] = {read=Get, write=Put/*, default*/};
public:
	/* TList.Destroy */ inline __fastcall virtual ~ThbTapiPhoneList(void) { }
	
public:
	/* TObject.Create */ inline __fastcall ThbTapiPhoneList(void) : System::Classes::TList() { }
	
};

#pragma pack(pop)

class DELPHICLASS ThbTapiLineTSP;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiLineTSP : public ThbTapiTSP
{
	typedef ThbTapiTSP inherited;
	
__published:
	virtual unsigned __fastcall NegotiateAPIVersion(void);
	virtual unsigned __fastcall NegotiateExtVersion(void);
public:
	/* ThbTapiTSP.Create */ inline __fastcall ThbTapiLineTSP(ThbTapiDevice* ATapiDevice) : ThbTapiTSP(ATapiDevice) { }
	
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~ThbTapiLineTSP(void) { }
	
};

#pragma pack(pop)

class DELPHICLASS ThbTapiPhoneTSP;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiPhoneTSP : public ThbTapiTSP
{
	typedef ThbTapiTSP inherited;
	
__published:
	virtual unsigned __fastcall NegotiateAPIVersion(void);
	virtual unsigned __fastcall NegotiateExtVersion(void);
public:
	/* ThbTapiTSP.Create */ inline __fastcall ThbTapiPhoneTSP(ThbTapiDevice* ATapiDevice) : ThbTapiTSP(ATapiDevice) { }
	
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~ThbTapiPhoneTSP(void) { }
	
};

#pragma pack(pop)

class DELPHICLASS ThbTapiPhonePrivileges;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiPhonePrivileges : public System::Classes::TPersistent
{
	typedef System::Classes::TPersistent inherited;
	
private:
	bool FAutoSelect;
	bool FPrivOwner;
	
protected:
	unsigned __fastcall Get_Value(void);
	void __fastcall Set_Value(unsigned Value);
	bool __fastcall Get_Priv(int index);
	void __fastcall Set_Priv(int index, bool value);
	
public:
	__fastcall ThbTapiPhonePrivileges(void);
	__property unsigned Value = {read=Get_Value, write=Set_Value, nodefault};
	
__published:
	__property bool AutoSelect = {read=FAutoSelect, write=FAutoSelect, default=1};
	__property bool Monitor = {read=Get_Priv, write=Set_Priv, index=0, default=0};
	__property bool Owner = {read=Get_Priv, write=Set_Priv, index=1, default=1};
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~ThbTapiPhonePrivileges(void) { }
	
};

#pragma pack(pop)

class DELPHICLASS ThbTapiPhoneControl;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiPhoneControl : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	ThbCustomTapiPhone* FPhone;
	unsigned FButtonLampID;
	phonebuttoninfo_tag *FButtonInfo;
	
protected:
	unsigned __fastcall UpdateData(void);
	unsigned __fastcall Get_LampMode(void);
	unsigned __fastcall Get_ButtonMode(void);
	unsigned __fastcall Get_ButtonState(void);
	System::UnicodeString __fastcall Get_ButtonText(void);
	unsigned __fastcall Get_ButtonFunction(void);
	void __fastcall Set_LampMode(unsigned Value);
	
public:
	__fastcall ThbTapiPhoneControl(ThbCustomTapiPhone* OwnerPhone, unsigned BtnLampID);
	__fastcall virtual ~ThbTapiPhoneControl(void);
	void __fastcall Invalidate(void);
	void __fastcall Update(void);
	System::UnicodeString __fastcall ButtonFunctionText(void);
	System::UnicodeString __fastcall ButtonModeText(void);
	System::UnicodeString __fastcall ButtonStateText(void);
	bool __fastcall IsButton(void);
	bool __fastcall IsLamp(void);
	System::UnicodeString __fastcall LampModeText(void);
	__property unsigned ID = {read=FButtonLampID, nodefault};
	__property unsigned ButtonMode = {read=Get_ButtonMode, nodefault};
	__property unsigned ButtonFunction = {read=Get_ButtonFunction, nodefault};
	__property System::UnicodeString ButtonText = {read=Get_ButtonText};
	__property unsigned ButtonState = {read=Get_ButtonState, nodefault};
	__property unsigned LampMode = {read=Get_LampMode, write=Set_LampMode, nodefault};
};

#pragma pack(pop)

class DELPHICLASS ThbTapiPhoneControlList;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiPhoneControlList : public System::Contnrs::TObjectList
{
	typedef System::Contnrs::TObjectList inherited;
	
public:
	ThbTapiPhoneControl* operator[](int Index) { return Items[Index]; }
	
protected:
	HIDESBASE ThbTapiPhoneControl* __fastcall Get(int Index);
	HIDESBASE void __fastcall Put(int Index, ThbTapiPhoneControl* Item);
	
public:
	void __fastcall Update(void);
	HIDESBASE int __fastcall Add(ThbTapiPhoneControl* Item);
	__property ThbTapiPhoneControl* Items[int Index] = {read=Get, write=Put/*, default*/};
public:
	/* TObjectList.Create */ inline __fastcall ThbTapiPhoneControlList(void)/* overload */ : System::Contnrs::TObjectList() { }
	/* TObjectList.Create */ inline __fastcall ThbTapiPhoneControlList(bool AOwnsObjects)/* overload */ : System::Contnrs::TObjectList(AOwnsObjects) { }
	
public:
	/* TList.Destroy */ inline __fastcall virtual ~ThbTapiPhoneControlList(void) { }
	
};

#pragma pack(pop)

class DELPHICLASS ThbTapiPhoneDisplay;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiPhoneDisplay : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	ThbCustomTapiPhone* FPhone;
	
protected:
	bool __fastcall Get_Available(void);
	unsigned __fastcall Get_NumColumns(void);
	unsigned __fastcall Get_NumRows(void);
	System::UnicodeString __fastcall Get_Text(void);
	void __fastcall Set_Text(System::UnicodeString Value);
	
public:
	__fastcall ThbTapiPhoneDisplay(ThbCustomTapiPhone* OwnerPhone);
	__property bool Available = {read=Get_Available, nodefault};
	__property unsigned NumColumns = {read=Get_NumColumns, nodefault};
	__property unsigned NumRows = {read=Get_NumRows, nodefault};
	__property System::UnicodeString Text = {read=Get_Text, write=Set_Text};
public:
	/* TObject.Destroy */ inline __fastcall virtual ~ThbTapiPhoneDisplay(void) { }
	
};

#pragma pack(pop)

class DELPHICLASS ThbTapiPhoneRinger;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiPhoneRinger : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	ThbCustomTapiPhone* FPhone;
	
protected:
	bool __fastcall Get_Available(void);
	unsigned __fastcall Get_Mode(void);
	unsigned __fastcall Get_Volume(void);
	void __fastcall Set_Mode(unsigned Value);
	void __fastcall Set_Volume(unsigned Value);
	
public:
	__fastcall ThbTapiPhoneRinger(ThbCustomTapiPhone* OwnerPhone);
	__property bool Available = {read=Get_Available, nodefault};
	__property unsigned Mode = {read=Get_Mode, write=Set_Mode, nodefault};
	__property unsigned Volume = {read=Get_Volume, write=Set_Volume, nodefault};
public:
	/* TObject.Destroy */ inline __fastcall virtual ~ThbTapiPhoneRinger(void) { }
	
};

#pragma pack(pop)

class DELPHICLASS ThbTapiPhoneCaps;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiPhoneCaps : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	ThbCustomTapiPhone* FPhone;
	phonecaps_tag *FCaps;
	System::Classes::TStrings* FDeviceClasses;
	
protected:
	bool __fastcall Get_Available(void);
	unsigned __fastcall Get_DWORD(int Index);
	System::UnicodeString __fastcall Get_String(int Index);
	unsigned __fastcall Get_ButtonMode(unsigned Index);
	unsigned __fastcall Get_ButtonFunction(unsigned Index);
	unsigned __fastcall Get_LampMode(unsigned Index);
	System::Classes::TStrings* __fastcall Get_DeviceClasses(void);
	virtual Hbtapiapi::PPhoneCaps __fastcall Get_PHONECAPS(void);
	
public:
	__fastcall ThbTapiPhoneCaps(ThbCustomTapiPhone* OwnerPhone);
	__fastcall virtual ~ThbTapiPhoneCaps(void);
	void __fastcall Invalidate(void);
	void __fastcall Update(void);
	unsigned __fastcall UpdateData(void);
	__property bool Available = {read=Get_Available, nodefault};
	__property unsigned TotalSize = {read=Get_DWORD, index=0, nodefault};
	__property unsigned NeededSize = {read=Get_DWORD, index=1, nodefault};
	__property unsigned UsedSize = {read=Get_DWORD, index=2, nodefault};
	__property unsigned ProviderInfoSize = {read=Get_DWORD, index=3, nodefault};
	__property unsigned ProviderInfoOffset = {read=Get_DWORD, index=4, nodefault};
	__property System::UnicodeString ProviderInfo = {read=Get_String, index=0};
	__property unsigned PhoneInfoSize = {read=Get_DWORD, index=5, nodefault};
	__property unsigned PhoneInfoOffset = {read=Get_DWORD, index=6, nodefault};
	__property System::UnicodeString PhoneInfo = {read=Get_String, index=1};
	__property unsigned PermanentPhoneID = {read=Get_DWORD, index=7, nodefault};
	__property unsigned PhoneNameSize = {read=Get_DWORD, index=8, nodefault};
	__property unsigned PhoneNameOffset = {read=Get_DWORD, index=9, nodefault};
	__property System::UnicodeString PhoneName = {read=Get_String, index=2};
	__property unsigned StringFormat = {read=Get_DWORD, index=10, nodefault};
	__property unsigned PhoneStates = {read=Get_DWORD, index=11, nodefault};
	__property unsigned HookSwitchDevs = {read=Get_DWORD, index=12, nodefault};
	__property unsigned HandsetHookSwitchModes = {read=Get_DWORD, index=13, nodefault};
	__property unsigned SpeakerHookSwitchModes = {read=Get_DWORD, index=14, nodefault};
	__property unsigned HeadsetHookSwitchModes = {read=Get_DWORD, index=15, nodefault};
	__property unsigned VolumeFlags = {read=Get_DWORD, index=16, nodefault};
	__property unsigned GainFlags = {read=Get_DWORD, index=17, nodefault};
	__property unsigned DisplayNumRows = {read=Get_DWORD, index=18, nodefault};
	__property unsigned DisplayNumColumns = {read=Get_DWORD, index=19, nodefault};
	__property unsigned NumRingModes = {read=Get_DWORD, index=20, nodefault};
	__property unsigned NumButtonLamps = {read=Get_DWORD, index=21, nodefault};
	__property unsigned ButtonModesSize = {read=Get_DWORD, index=22, nodefault};
	__property unsigned ButtonModesOffset = {read=Get_DWORD, index=23, nodefault};
	__property unsigned ButtonFunctionsSize = {read=Get_DWORD, index=24, nodefault};
	__property unsigned ButtonFunctionsOffset = {read=Get_DWORD, index=25, nodefault};
	__property unsigned LampModesSize = {read=Get_DWORD, index=26, nodefault};
	__property unsigned LampModesOffset = {read=Get_DWORD, index=27, nodefault};
	__property unsigned NumSetData = {read=Get_DWORD, index=28, nodefault};
	__property unsigned SetDataSize = {read=Get_DWORD, index=29, nodefault};
	__property unsigned SetDataOffset = {read=Get_DWORD, index=30, nodefault};
	__property unsigned NumGetData = {read=Get_DWORD, index=31, nodefault};
	__property unsigned GetDataSize = {read=Get_DWORD, index=32, nodefault};
	__property unsigned GetDataOffset = {read=Get_DWORD, index=33, nodefault};
	__property unsigned DevSpecificSize = {read=Get_DWORD, index=34, nodefault};
	__property unsigned DevSpecificOffset = {read=Get_DWORD, index=35, nodefault};
	__property System::UnicodeString DevSpecific = {read=Get_String, index=7};
	__property System::Classes::TStrings* DeviceClasses = {read=Get_DeviceClasses};
	__property unsigned DeviceClassesSize = {read=Get_DWORD, index=36, nodefault};
	__property unsigned DeviceClassesOffset = {read=Get_DWORD, index=37, nodefault};
	__property unsigned PhoneFeatures = {read=Get_DWORD, index=38, nodefault};
	__property unsigned SettableHandsetHookSwitchModes = {read=Get_DWORD, index=39, nodefault};
	__property unsigned SettableSpeakerHookSwitchModes = {read=Get_DWORD, index=40, nodefault};
	__property unsigned SettableHeadsetHookSwitchModes = {read=Get_DWORD, index=41, nodefault};
	__property unsigned MonitoredHandsetHookSwitchModes = {read=Get_DWORD, index=42, nodefault};
	__property unsigned MonitoredSpeakerHookSwitchModes = {read=Get_DWORD, index=43, nodefault};
	__property unsigned MonitoredHeadsetHookSwitchModes = {read=Get_DWORD, index=44, nodefault};
	__property unsigned ButtonModes[unsigned index] = {read=Get_ButtonMode};
	__property unsigned ButtonFunctions[unsigned index] = {read=Get_ButtonFunction};
	__property unsigned LampModes[unsigned index] = {read=Get_LampMode};
	__property Hbtapiapi::PPhoneCaps PHONECAPS = {read=Get_PHONECAPS};
};

#pragma pack(pop)

typedef System::StaticArray<System::TObject*, 3> TRequestObjects;

class DELPHICLASS ThbTapiRequest;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiRequest : public System::TObject
{
	typedef System::TObject inherited;
	
public:
	unsigned FID;
	unsigned FRequestType;
	unsigned FTimeout;
	unsigned FTickCount;
	TRequestObjects FObjects;
	int FTag;
	bool FHandled;
	System::Classes::TStringList* FNotes;
	
protected:
	System::TObject* __fastcall Get_Object(int index);
	ThbTapiCall* __fastcall Get_Call(int index);
	void __fastcall Set_Object(int index, System::TObject* value);
	ThbCustomTapiLine* __fastcall Get_Line(void);
	ThbCustomTapiPhone* __fastcall Get_Phone(void);
	System::UnicodeString __fastcall Get_Note(System::UnicodeString Note);
	void __fastcall Set_Note(System::UnicodeString Note, System::UnicodeString Value);
	__property unsigned ID = {read=FID, write=FID, nodefault};
	__property System::TObject* Obj1 = {read=Get_Object, write=Set_Object, index=0};
	__property System::TObject* Obj2 = {read=Get_Object, write=Set_Object, index=1};
	__property System::TObject* Obj3 = {read=Get_Object, write=Set_Object, index=2};
	__property System::TObject* Obj[int index] = {read=Get_Object, write=Set_Object};
	__property unsigned TickCount = {read=FTickCount, nodefault};
	
public:
	__fastcall ThbTapiRequest(int aID, unsigned aTimeout);
	__fastcall virtual ~ThbTapiRequest(void);
	__property unsigned RequestType = {read=FRequestType, write=FRequestType, nodefault};
	__property unsigned Timeout = {read=FTimeout, write=FTimeout, nodefault};
	__property ThbCustomTapiLine* Line = {read=Get_Line};
	__property ThbCustomTapiPhone* Phone = {read=Get_Phone};
	__property int Tag = {read=FTag, write=FTag, nodefault};
	__property ThbTapiCall* Calls[int index] = {read=Get_Call};
	__property System::UnicodeString Notes[System::UnicodeString index] = {read=Get_Note, write=Set_Note};
};

#pragma pack(pop)

class DELPHICLASS ThbTapiRequestList;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiRequestList : public TProtectedList
{
	typedef TProtectedList inherited;
	
public:
	ThbTapiRequest* operator[](int Index) { return Items[Index]; }
	
protected:
	HIDESBASE ThbTapiRequest* __fastcall Get(int Index);
	HIDESBASE void __fastcall Put(int Index, ThbTapiRequest* Item);
	unsigned __fastcall GetUniqueID(void);
	
public:
	__fastcall ThbTapiRequestList(void);
	__fastcall virtual ~ThbTapiRequestList(void);
	__property ThbTapiRequest* Items[int Index] = {read=Get, write=Put/*, default*/};
	unsigned __fastcall GetNextTimeout(void);
	ThbTapiRequest* __fastcall AddRequest(int aID, unsigned aTimeout)/* overload */;
	ThbTapiRequest* __fastcall GetRequest(int RequestID);
	int __fastcall IndexOfID(unsigned ID);
	int __fastcall IndexOfRequest(unsigned ID, unsigned RequestType = (unsigned)(0x0), System::TObject* Obj = (System::TObject*)(0x0));
	void __fastcall RemoveAllRequests(System::TObject* Target = (System::TObject*)(0x0));
};

#pragma pack(pop)

class DELPHICLASS ThbTapiDevSpecificData;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiDevSpecificData : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	void *FData;
	unsigned FDataSize;
	
public:
	__fastcall ThbTapiDevSpecificData(void * Data, unsigned DataSize);
	__fastcall virtual ~ThbTapiDevSpecificData(void);
	__property void * Data = {read=FData};
	__property unsigned DataSize = {read=FDataSize, nodefault};
};

#pragma pack(pop)

class DELPHICLASS ThbTapiDevSpecificDataList;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiDevSpecificDataList : public TProtectedList
{
	typedef TProtectedList inherited;
	
public:
	ThbTapiDevSpecificData* operator[](int Index) { return Items[Index]; }
	
protected:
	HIDESBASE ThbTapiDevSpecificData* __fastcall Get(int Index);
	HIDESBASE void __fastcall Put(int Index, ThbTapiDevSpecificData* Item);
	
public:
	__fastcall virtual ~ThbTapiDevSpecificDataList(void);
	virtual void __fastcall Clear(void);
	__property ThbTapiDevSpecificData* Items[int Index] = {read=Get, write=Put/*, default*/};
public:
	/* TProtectedList.Create */ inline __fastcall ThbTapiDevSpecificDataList(void) : TProtectedList() { }
	
};

#pragma pack(pop)

class DELPHICLASS ThbTapiLineDevSpecificData;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiLineDevSpecificData : public ThbTapiDevSpecificData
{
	typedef ThbTapiDevSpecificData inherited;
	
private:
	ThbTapiAddress* FAddress;
	ThbTapiCall* FCall;
	
public:
	__property ThbTapiAddress* Address = {read=FAddress, write=FAddress};
	__property ThbTapiCall* Call = {read=FCall, write=FCall};
public:
	/* ThbTapiDevSpecificData.Create */ inline __fastcall ThbTapiLineDevSpecificData(void * Data, unsigned DataSize) : ThbTapiDevSpecificData(Data, DataSize) { }
	/* ThbTapiDevSpecificData.Destroy */ inline __fastcall virtual ~ThbTapiLineDevSpecificData(void) { }
	
};

#pragma pack(pop)

class DELPHICLASS ThbTapiLineDevSpecificFeatureData;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiLineDevSpecificFeatureData : public ThbTapiDevSpecificData
{
	typedef ThbTapiDevSpecificData inherited;
	
private:
	unsigned FFeature;
	
public:
	__property unsigned Feature = {read=FFeature, write=FFeature, nodefault};
public:
	/* ThbTapiDevSpecificData.Create */ inline __fastcall ThbTapiLineDevSpecificFeatureData(void * Data, unsigned DataSize) : ThbTapiDevSpecificData(Data, DataSize) { }
	/* ThbTapiDevSpecificData.Destroy */ inline __fastcall virtual ~ThbTapiLineDevSpecificFeatureData(void) { }
	
};

#pragma pack(pop)

typedef linemessage_tag *PTapiMessage;

typedef linemessage_tag TTapiMessage;

class DELPHICLASS ThbTapiMsgStackItem;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiMsgStackItem : public System::TObject
{
	typedef System::TObject inherited;
	
public:
	linemessage_tag TapiMessage;
public:
	/* TObject.Create */ inline __fastcall ThbTapiMsgStackItem(void) : System::TObject() { }
	/* TObject.Destroy */ inline __fastcall virtual ~ThbTapiMsgStackItem(void) { }
	
};

#pragma pack(pop)

class DELPHICLASS ThbTapiLineMsgStackItem;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiLineMsgStackItem : public ThbTapiMsgStackItem
{
	typedef ThbTapiMsgStackItem inherited;
	
public:
	__fastcall ThbTapiLineMsgStackItem(const linemessage_tag &LineMsg);
public:
	/* TObject.Destroy */ inline __fastcall virtual ~ThbTapiLineMsgStackItem(void) { }
	
};

#pragma pack(pop)

class DELPHICLASS ThbTapiPhoneMsgStackItem;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiPhoneMsgStackItem : public ThbTapiMsgStackItem
{
	typedef ThbTapiMsgStackItem inherited;
	
public:
	__fastcall ThbTapiPhoneMsgStackItem(const linemessage_tag &PhoneMsg);
public:
	/* TObject.Destroy */ inline __fastcall virtual ~ThbTapiPhoneMsgStackItem(void) { }
	
};

#pragma pack(pop)

class DELPHICLASS ThbTapiMsgStack;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiMsgStack : public TProtectedObjectList
{
	typedef TProtectedObjectList inherited;
	
public:
	ThbTapiMsgStackItem* operator[](int Index) { return Items[Index]; }
	
private:
	System::UnicodeString __fastcall GetDebugStr(int index);
	void __fastcall Optimize(linemessage_tag &TapiMessage);
	
protected:
	HIDESBASE ThbTapiMsgStackItem* __fastcall Get(int Index);
	HIDESBASE void __fastcall Put(int Index, ThbTapiMsgStackItem* Item);
	
public:
	int __fastcall GetMsg(PTapiMessage TapiMessage);
	ThbTapiMsgStackItem* __fastcall GetNextMessage(void);
	int __fastcall GetReplyCode(unsigned RequestID, unsigned &ReplyCode);
	__property ThbTapiMsgStackItem* Items[int Index] = {read=Get, write=Put/*, default*/};
	__property System::UnicodeString DebugStr[int index] = {read=GetDebugStr};
public:
	/* TProtectedObjectList.Create */ inline __fastcall ThbTapiMsgStack(void) : TProtectedObjectList() { }
	/* TProtectedObjectList.Destroy */ inline __fastcall virtual ~ThbTapiMsgStack(void) { }
	
};

#pragma pack(pop)

class DELPHICLASS ThbTapiEventThread;
class DELPHICLASS ThbTapiApplication;
class PASCALIMPLEMENTATION ThbTapiEventThread : public System::Classes::TThread
{
	typedef System::Classes::TThread inherited;
	
private:
	ThbTapiApplication* FAppl;
	NativeUInt FWakeUpEvent;
	bool FSendNextTimerMsg;
	
protected:
	virtual void __fastcall Execute(void);
	
public:
	HIDESBASE void __fastcall Terminate(void);
	__fastcall ThbTapiEventThread(ThbTapiApplication* Appl);
	__fastcall virtual ~ThbTapiEventThread(void);
};


class DELPHICLASS ThbTapiComponent;
class PASCALIMPLEMENTATION ThbTapiComponent : public System::Classes::TComponent
{
	typedef System::Classes::TComponent inherited;
	
private:
	Hbtapiver::ThbTapiComponentsAbout FAbout;
	ThbTapiErrorEvent FOnError;
	
protected:
	ThbTapiApplication* FAppl;
	bool FEnabled;
	unsigned FLastRequestID;
	virtual void __fastcall ApplyEnabled(void);
	virtual void __fastcall Handle_Exception(System::Sysutils::Exception* Error, System::TObject* Causer = (System::TObject*)(0x0));
	virtual void __fastcall SetEnabled(bool value);
	virtual bool __fastcall IsEnabled(void);
	bool __fastcall EnableTapiComponent(void);
	void __fastcall DisableTapiComponent(void);
	
public:
	__fastcall virtual ThbTapiComponent(System::Classes::TComponent* AOwner);
	__fastcall virtual ~ThbTapiComponent(void);
	__property bool Enabled = {read=FEnabled, write=SetEnabled, nodefault};
	__property unsigned LastRequestID = {read=FLastRequestID, nodefault};
	
protected:
	__property ThbTapiErrorEvent OnError = {read=FOnError, write=FOnError};
	
__published:
	__property Hbtapiver::ThbTapiComponentsAbout About = {read=FAbout, write=FAbout, stored=false, nodefault};
};


class DELPHICLASS ThbTapiAppl;
class PASCALIMPLEMENTATION ThbTapiAppl : public ThbTapiComponent
{
	typedef ThbTapiComponent inherited;
	
private:
	System::UnicodeString FApplName;
	ThbTapiDeviceEvent FOnLineCreate;
	ThbTapiDeviceEvent FOnLineRemove;
	ThbTapiDeviceEvent FOnPhoneCreate;
	ThbTapiDeviceEvent FOnPhoneRemove;
	ThbTapiRequestMakeCallEvent FOnRequestMakeCall;
	System::Classes::TNotifyEvent FOnShutdown;
	System::Classes::TNotifyEvent FOnInitialize;
	int FAutoShutdown;
	
protected:
	virtual void __fastcall Loaded(void);
	virtual void __fastcall ApplyEnabled(void);
	virtual void __fastcall Handle_DeviceCreate(System::UnicodeString AClass, unsigned ADeviceID);
	virtual void __fastcall Handle_DeviceRemove(System::UnicodeString AClass, unsigned ADeviceID);
	void __fastcall Set_Enabled(const bool value);
	void __fastcall Set_ApplName(const System::UnicodeString Value);
	void __fastcall Set_AutoShutdown(const int Value);
	
public:
	__fastcall virtual ThbTapiAppl(System::Classes::TComponent* AOwner);
	
__published:
	__property int AutoShutdown = {read=FAutoShutdown, write=Set_AutoShutdown, nodefault};
	__property System::UnicodeString ApplName = {read=FApplName, write=Set_ApplName};
	__property bool Enabled = {read=FEnabled, write=Set_Enabled, nodefault};
	__property System::Classes::TNotifyEvent OnShutdown = {read=FOnShutdown, write=FOnShutdown};
	__property System::Classes::TNotifyEvent OnInitialize = {read=FOnInitialize, write=FOnInitialize};
	__property ThbTapiDeviceEvent OnLineCreate = {read=FOnLineCreate, write=FOnLineCreate};
	__property ThbTapiDeviceEvent OnLineRemove = {read=FOnLineRemove, write=FOnLineRemove};
	__property ThbTapiDeviceEvent OnPhoneCreate = {read=FOnPhoneCreate, write=FOnPhoneCreate};
	__property ThbTapiDeviceEvent OnPhoneRemove = {read=FOnPhoneRemove, write=FOnPhoneRemove};
	__property ThbTapiRequestMakeCallEvent OnRequestMakeCall = {read=FOnRequestMakeCall, write=FOnRequestMakeCall};
public:
	/* ThbTapiComponent.Destroy */ inline __fastcall virtual ~ThbTapiAppl(void) { }
	
};


class PASCALIMPLEMENTATION ThbTapiApplication : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	unsigned FLineApp;
	unsigned FPhoneApp;
	ThbTapiEventThread* FTSPEventThread;
	HWND FWindowHandle;
	unsigned FWindowMessage;
	unsigned FNumLines;
	NativeUInt FLineEvent;
	unsigned FNumPhones;
	NativeUInt FPhoneEvent;
	ThbTapiLineList* FLines;
	ThbTapiPhoneList* FPhones;
	unsigned FCallbackInstance;
	unsigned FLastCI;
	bool FBeep;
	bool FDesignTime;
	bool FAssistMakeCall;
	int FAutoShutdown;
	int FInitializeTime;
	System::UnicodeString FAppName;
	System::Classes::TStrings* FLineDevices;
	System::Classes::TStrings* FPhoneDevices;
	ThbTapiMsgStack* FMsgStack;
	ThbTapiMsgStack* FReplyStack;
	int FNumWaitProcs;
	System::Classes::TNotifyEvent FOnInitialize;
	ThbTapiDeviceNameEvent FOnLineCreate;
	ThbTapiDeviceNameEvent FOnLineRemove;
	ThbTapiDeviceNameEvent FOnLineRename;
	ThbTapiDeviceNameEvent FOnPhoneCreate;
	ThbTapiDeviceNameEvent FOnPhoneRemove;
	ThbTapiDeviceNameEvent FOnPhoneRename;
	ThbTapiRequestMakeCallEvent FOnRequestMakeCall;
	ThbTapiDetailedMessageEvent FOnTapiMessage;
	System::Classes::TNotifyEvent FOnShutdown;
	System::Classes::TNotifyEvent FOnReinit;
	ThbTapiErrorEvent FOnError;
	bool FProcessing;
	unsigned __fastcall Init_Lines(System::UnicodeString AppName);
	unsigned __fastcall Init_Phones(System::UnicodeString AppName);
	void __fastcall Update_LineDevice(int DeviceID);
	void __fastcall Update_LineDevices(bool TriggerRenaming = false);
	void __fastcall Update_PhoneDevice(int DeviceID);
	void __fastcall Update_PhoneDevices(bool TriggerRenaming = false);
	ThbCustomTapiLine* __fastcall Get_LineByCallbackInst(unsigned CallbackInstance);
	ThbCustomTapiPhone* __fastcall Get_PhoneByCallbackInst(unsigned CallbackInstance);
	
protected:
	void __fastcall AddTapiComponent(System::TObject* Value);
	void __fastcall RemoveTapiComponent(System::TObject* Value);
	void __fastcall EnableTapiComponent(ThbTapiComponent* Value, bool Enable);
	unsigned __fastcall NewCallbackInstance(void);
	void __fastcall Handle_LineRequest(unsigned Param1, unsigned Param2, unsigned Param3);
	virtual void __fastcall Handle_Exception(System::Sysutils::Exception* Error)/* overload */;
	virtual void __fastcall Handle_Exception(System::TObject* Sender, System::Sysutils::Exception* Error, System::TObject* Causer)/* overload */;
	void __fastcall Trigger_Initialize(void);
	void __fastcall Trigger_Shutdown(void);
	void __fastcall Trigger_Reinit(void);
	void __fastcall Trigger_LineCreate(unsigned DeviceID, System::UnicodeString DeviceName);
	void __fastcall Trigger_LineRemove(unsigned DeviceID, System::UnicodeString DeviceName);
	void __fastcall Trigger_LineRename(unsigned DeviceID, System::UnicodeString DeviceName);
	void __fastcall Trigger_PhoneCreate(unsigned DeviceID, System::UnicodeString DeviceName);
	void __fastcall Trigger_PhoneRemove(unsigned DeviceID, System::UnicodeString DeviceName);
	void __fastcall Trigger_PhoneRename(unsigned DeviceID, System::UnicodeString DeviceName);
	virtual void __fastcall Trigger_TapiMessage(unsigned MessageID, unsigned Device, unsigned CallbackInstance, unsigned Param1, unsigned Param2, unsigned Param3);
	bool __fastcall IsActive(void);
	System::UnicodeString __fastcall DefaultApplName(void);
	void __fastcall Set_AppName(System::UnicodeString Value);
	void __fastcall Set_Active(bool Value);
	void __fastcall Set_AssistMakeCall(bool Value);
	void __fastcall Set_AutoShutdown(int Value);
	bool __fastcall ProcessTapiMessage(void);
	int __fastcall ProcessTapiMessages(int MaxMessages = 0x7fffffff);
	void __fastcall WindowProc(Winapi::Messages::TMessage &Message);
	void __fastcall TimerEventProc(unsigned TickCount = (unsigned)(0x0));
	__property int AutoShutdown = {read=FAutoShutdown, write=Set_AutoShutdown, nodefault};
	
public:
	__fastcall ThbTapiApplication(void);
	__fastcall virtual ~ThbTapiApplication(void);
	unsigned __fastcall Init(System::UnicodeString AppName = System::UnicodeString());
	unsigned __fastcall Done(void);
	void __fastcall Initialize(void);
	void __fastcall Shutdown(void);
	bool __fastcall CouldShutdown(void);
	__property bool Active = {read=IsActive, write=Set_Active, nodefault};
	__property bool AssistMakeCall = {read=FAssistMakeCall, write=Set_AssistMakeCall, nodefault};
	__property System::UnicodeString AppName = {read=FAppName, write=Set_AppName};
	__property System::Classes::TStrings* LineDevices = {read=FLineDevices};
	__property ThbTapiLineList* Lines = {read=FLines};
	__property System::Classes::TStrings* PhoneDevices = {read=FPhoneDevices};
	__property ThbTapiPhoneList* Phones = {read=FPhones};
	__property ThbTapiErrorEvent OnError = {read=FOnError, write=FOnError};
	__property System::Classes::TNotifyEvent OnInitialize = {read=FOnInitialize, write=FOnInitialize};
	__property ThbTapiDeviceNameEvent OnLineCreate = {read=FOnLineCreate, write=FOnLineCreate};
	__property ThbTapiDeviceNameEvent OnLineRemove = {read=FOnLineRemove, write=FOnLineRemove};
	__property ThbTapiDeviceNameEvent OnLineRename = {read=FOnLineRename, write=FOnLineRename};
	__property ThbTapiDeviceNameEvent OnPhoneCreate = {read=FOnPhoneCreate, write=FOnPhoneCreate};
	__property ThbTapiDeviceNameEvent OnPhoneRemove = {read=FOnPhoneRemove, write=FOnPhoneRemove};
	__property ThbTapiDeviceNameEvent OnPhoneRename = {read=FOnPhoneRename, write=FOnPhoneRename};
	__property ThbTapiRequestMakeCallEvent OnRequestMakeCall = {read=FOnRequestMakeCall, write=FOnRequestMakeCall};
	__property System::Classes::TNotifyEvent OnShutdown = {read=FOnShutdown, write=FOnShutdown};
	__property System::Classes::TNotifyEvent OnReinit = {read=FOnReinit, write=FOnReinit};
	__property unsigned LineApp = {read=FLineApp, nodefault};
	__property unsigned PhoneApp = {read=FPhoneApp, nodefault};
	__property ThbTapiDetailedMessageEvent OnTapiMessage = {read=FOnTapiMessage, write=FOnTapiMessage};
};


class DELPHICLASS ThbTapiRelatedWaveDevice;
class PASCALIMPLEMENTATION ThbTapiDevice : public ThbTapiComponent
{
	typedef ThbTapiComponent inherited;
	
private:
	bool FActive;
	bool FInitialized;
	int FDeviceID;
	System::UnicodeString FDeviceName;
	unsigned FHandle;
	bool FClosedByTapi;
	unsigned FCallbackInstance;
	ThbTapiRequestList* FRequests;
	ThbTapiRequestList* FTimerEvents;
	ThbTapiTSP* FTSP;
	Vcl::Graphics::TIcon* FIcon;
	NativeUInt FAbortEvent;
	unsigned FPermanentDeviceID;
	ThbTapiRelatedWaveDevice* FWaveInDev;
	ThbTapiRelatedWaveDevice* FWaveOutDev;
	System::Classes::TNotifyEvent FOnDeviceClose;
	System::Classes::TNotifyEvent FOnDeviceRemove;
	ThbTapiDeviceStateEvent FOnDevStateChange;
	ThbTapiMessageEvent FOnTapiMessage;
	ThbTapiReplyEvent FOnTapiReply;
	ThbTapiTimeoutEvent FOnTapiTimeout;
	System::Classes::TNotifyEvent FOnTapiReinit;
	System::Classes::TNotifyEvent FOnTapiTranslateChange;
	
protected:
	virtual void __fastcall ApplyActive(void);
	virtual void __fastcall ApplyEnabled(void);
	void __fastcall CheckActive(void);
	unsigned __fastcall NewCallbackInstance(void);
	virtual void __fastcall SetEnabled(bool value);
	virtual void __fastcall Set_Active(bool value);
	virtual bool __fastcall Get_Active(void);
	virtual bool __fastcall Get_Available(void);
	void __fastcall Process_TapiMessage(unsigned Device, unsigned Msg, unsigned Param1, unsigned Param2, unsigned Param3);
	void __fastcall Process_InternalTimer(unsigned TickCount);
	virtual void __fastcall Handle_DeviceClose(void);
	virtual void __fastcall Handle_DeviceRemove(unsigned DeviceID);
	virtual void __fastcall Handle_TapiMessage(unsigned MessageID, unsigned Device, unsigned Param1, unsigned Param2, unsigned Param3);
	virtual void __fastcall Handle_DeviceState(unsigned DeviceState, unsigned DeviceStateDetail1, unsigned DeviceStateDetail2);
	virtual void __fastcall Handle_TapiReply(unsigned RequestID, unsigned ReplyCode);
	virtual void __fastcall Handle_Reply(unsigned RequestID, unsigned ReplyCode, ThbTapiRequest* Request) = 0 ;
	virtual void __fastcall Handle_Timeout(unsigned RequestID, ThbTapiRequest* Request);
	virtual void __fastcall Handle_Timer(unsigned RequestID, ThbTapiRequest* Request);
	virtual void __fastcall Handle_InternalTimer(unsigned TickCount);
	virtual void __fastcall Trigger_DeviceRemove(void);
	virtual void __fastcall Trigger_DeviceClose(void);
	virtual void __fastcall Trigger_DeviceState(unsigned DeviceState, unsigned DeviceStateDetail1, unsigned DeviceStateDetail2);
	virtual void __fastcall Trigger_TapiMessage(unsigned MessageID, unsigned Device, unsigned Param1, unsigned Param2, unsigned Param3);
	virtual void __fastcall Trigger_TapiReply(unsigned RequestID, unsigned ReplyCode);
	virtual void __fastcall Trigger_TapiReinit(void);
	virtual void __fastcall Trigger_TapiTimeout(unsigned RequestID, ThbTapiRequest* Request);
	virtual void __fastcall Trigger_TapiTranslateChange(void);
	virtual void __fastcall Set_DeviceID(int Value);
	virtual System::UnicodeString __fastcall Get_DeviceName(void);
	virtual System::Classes::TStrings* __fastcall Get_DeviceList(void) = 0 ;
	virtual HICON __fastcall Get_IconHandle(System::UnicodeString DeviceClass = System::UnicodeString());
	virtual Vcl::Graphics::TIcon* __fastcall Get_Icon(void);
	virtual void __fastcall Set_DeviceName(System::UnicodeString Value);
	virtual unsigned __fastcall Get_ReplyTimeout(void) = 0 ;
	virtual bool __fastcall Get_SyncMode(void) = 0 ;
	virtual void __fastcall Set_PermanentDeviceID(unsigned Value) = 0 ;
	unsigned __fastcall WaitForAsyncReply(unsigned RequestID, unsigned &ReplyCode);
	unsigned __fastcall CheckAsyncTapiResult(unsigned RequestID);
	unsigned __fastcall GetAsyncTapiResult(unsigned RequestID);
	virtual bool __fastcall IsActive(void);
	virtual void __fastcall CheckEnabled(void);
	__property ThbTapiRequestList* Requests = {read=FRequests};
	__property ThbTapiRequestList* TimerEvents = {read=FTimerEvents};
	__property ThbTapiRelatedWaveDevice* WaveIn = {read=FWaveInDev};
	__property ThbTapiRelatedWaveDevice* WaveOut = {read=FWaveOutDev};
	__property unsigned PermanentDeviceID = {read=FPermanentDeviceID, write=Set_PermanentDeviceID, nodefault};
	__property System::Classes::TNotifyEvent OnDeviceRemove = {read=FOnDeviceRemove, write=FOnDeviceRemove};
	__property System::Classes::TNotifyEvent OnDeviceClose = {read=FOnDeviceClose, write=FOnDeviceClose};
	__property ThbTapiDeviceStateEvent OnDeviceState = {read=FOnDevStateChange, write=FOnDevStateChange};
	__property ThbTapiMessageEvent OnTapiMessage = {read=FOnTapiMessage, write=FOnTapiMessage};
	__property ThbTapiReplyEvent OnTapiReply = {read=FOnTapiReply, write=FOnTapiReply};
	__property ThbTapiTimeoutEvent OnTapiTimeout = {read=FOnTapiTimeout, write=FOnTapiTimeout};
	__property System::Classes::TNotifyEvent OnTapiTranslateChange = {read=FOnTapiTranslateChange, write=FOnTapiTranslateChange};
	__property unsigned Handle = {read=FHandle, nodefault};
	__property unsigned CallbackInstance = {read=FCallbackInstance, nodefault};
	
public:
	__fastcall virtual ThbTapiDevice(System::Classes::TComponent* AOwner);
	__fastcall virtual ~ThbTapiDevice(void);
	virtual void __fastcall Loaded(void);
	virtual unsigned __fastcall Init(int DeviceID);
	virtual void __fastcall Done(void);
	virtual void __fastcall Open(void) = 0 ;
	virtual void __fastcall Close(void) = 0 ;
	ThbTapiRequest* __fastcall GetRequest(int RequestID);
	System::TObject* __fastcall GetRequestObj(int RequestID, System::UnicodeString Obj);
	System::Variant __fastcall GetRequestNote(int RequestID, System::UnicodeString Ident);
	void __fastcall SetRequestNote(int RequestID, System::UnicodeString Ident, const System::Variant &Value);
	__property bool Active = {read=Get_Active, write=Set_Active, default=0};
	__property bool Available = {read=Get_Available, nodefault};
	__property int DeviceID = {read=FDeviceID, write=Set_DeviceID, default=-1};
	__property System::UnicodeString DeviceName = {read=Get_DeviceName, write=Set_DeviceName};
	__property System::Classes::TStrings* DeviceList = {read=Get_DeviceList};
	__property Vcl::Graphics::TIcon* Icon = {read=Get_Icon};
	__property ThbTapiTSP* TSP = {read=FTSP, write=FTSP};
};


class DELPHICLASS ThbTapiCallPartyID;
class DELPHICLASS ThbTapiCommDevice;
class DELPHICLASS ThbTapiCallGatherDigits;
class DELPHICLASS ThbTapiCallMonitorDigits;
class DELPHICLASS ThbTapiCallInfo;
class DELPHICLASS ThbTapiCallMonitorMedia;
class DELPHICLASS ThbTapiCallParams;
class DELPHICLASS ThbTapiCallRemoteID;
class DELPHICLASS ThbTapiCallMonitorSilence;
class DELPHICLASS ThbTapiCallStatus;
class PASCALIMPLEMENTATION ThbTapiCall : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	bool FAlive;
	bool FAutoOwner;
	unsigned FBeginTC;
	System::TDateTime FBeginTime;
	unsigned FBusyMode;
	ThbTapiCallPartyID* FCalledID;
	ThbTapiCallPartyID* FCallerID;
	ThbTapiCommDevice* FComm;
	bool FConfirmed;
	bool FConnected;
	ThbTapiCallPartyID* FConnectedID;
	unsigned FConnectedMode;
	System::TDateTime FConnectTime;
	ThbTapiCall* FConsultCall;
	unsigned FDialtoneMode;
	ThbTapiCallGatherDigits* FDigitCollector;
	ThbTapiCallMonitorDigits* FDigitMonitor;
	unsigned FDisconnectMode;
	unsigned FEndTC;
	System::TDateTime FEndTime;
	unsigned FHandle;
	ThbTapiCallInfo* FInfo;
	ThbCustomTapiLine* FLine;
	ThbTapiCallMonitorMedia* FMediaMonitor;
	System::Classes::TStrings* FNotes;
	unsigned FOfferingMode;
	unsigned FOriginHistory;
	ThbTapiCallParams* FParams;
	ThbTapiCall* FPrimaryCall;
	ThbTapiCallPartyID* FRedirectingID;
	ThbTapiCallPartyID* FRedirectionID;
	ThbTapiCallRemoteID* FRemoteID;
	ThbTapiCallMonitorSilence* FSilenceMonitor;
	unsigned FSpecialInfoMode;
	unsigned FStateHistory;
	ThbTapiCallStatus* FStatus;
	int FTag;
	ThbTapiRelatedWaveDevice* FWaveInDev;
	ThbTapiRelatedWaveDevice* FWaveOutDev;
	unsigned FState;
	unsigned FStateMode;
	unsigned FPrivilege;
	
protected:
	virtual void __fastcall Handle_CallState(unsigned State, unsigned StateDetail, unsigned Privilege);
	virtual void __fastcall Handle_CallInfo(unsigned Info);
	void __fastcall Handle_Reply(unsigned RequestID, unsigned ReplyCode, ThbTapiRequest* Request);
	void __fastcall Handle_Timeout(unsigned RequestID, ThbTapiRequest* Request);
	virtual bool __fastcall Get_Active(void);
	ThbTapiAddress* __fastcall Get_Address(void);
	unsigned __fastcall Get_CallInfoDWORD(int index);
	System::UnicodeString __fastcall Get_CallInfoString(int index);
	unsigned __fastcall Get_CallStatusDWORD(int index);
	ThbTapiCall* __fastcall Get_ConsultCall(void);
	unsigned __fastcall Get_MediaMode(void);
	System::UnicodeString __fastcall Get_Note(System::UnicodeString Name);
	unsigned __fastcall Get_Origin(void);
	bool __fastcall Get_Owner(void);
	ThbTapiCall* __fastcall Get_PrimaryCall(void);
	unsigned __fastcall Get_State(void);
	unsigned __fastcall Get_StateMode(void);
	unsigned __fastcall Get_Privilege(void);
	System::UnicodeString __fastcall Get_OriginText(void);
	void __fastcall Set_Alive(bool Value);
	void __fastcall Set_Connected(bool Value);
	void __fastcall Set_MediaMode(unsigned Value);
	void __fastcall Set_Note(System::UnicodeString Name, const System::UnicodeString Value);
	void __fastcall Set_Notes(System::Classes::TStrings* Value);
	void __fastcall Set_Owner(bool Value);
	void __fastcall Set_Privilege(unsigned Value);
	bool __fastcall CheckOwnership(void);
	unsigned __fastcall Get_ID(System::UnicodeString DeviceClass, unsigned &DeviceID);
	unsigned __fastcall PendingRequest(void);
	void __fastcall RemoveLinks(ThbTapiCall* Call);
	void __fastcall Validate(void);
	ThbTapiCall* __fastcall Get_ConferenceCall(void);
	Hbtapiapi::PLineCallInfo __fastcall Get_LINECALLINFO(void);
	Hbtapiapi::PLineCallStatus __fastcall Get_LINECALLSTATUS(void);
	
public:
	__fastcall virtual ThbTapiCall(ThbCustomTapiLine* OwnerLine, unsigned CallHandle);
	__fastcall virtual ~ThbTapiCall(void);
	System::UnicodeString __fastcall BusyModeText(void);
	System::UnicodeString __fastcall ConnectedModeText(void);
	System::UnicodeString __fastcall DisconnectModeText(void);
	System::UnicodeString __fastcall FeaturesText(System::UnicodeString Separator = L", ");
	bool __fastcall IsBusy(void);
	bool __fastcall IsConnected(void);
	bool __fastcall IsDialing(void);
	bool __fastcall IsHeld(void);
	bool __fastcall IsIncoming(void);
	bool __fastcall IsOffering(void);
	bool __fastcall IsOutgoing(void);
	System::UnicodeString __fastcall MediaModeText(System::UnicodeString Separator = L", ");
	System::UnicodeString __fastcall OfferingModeText(void);
	System::UnicodeString __fastcall PrivilegeText(System::UnicodeString Separator = L", ");
	System::UnicodeString __fastcall SpecialInfoModeText(void);
	System::UnicodeString __fastcall StateModeText(void);
	System::UnicodeString __fastcall StateText(void);
	bool __fastcall Valid(void);
	bool __fastcall WasBusy(void);
	bool __fastcall WasConnected(void);
	bool __fastcall WasDialing(void);
	bool __fastcall WasDisconnected(void);
	bool __fastcall WasHeld(void);
	bool __fastcall WasIncoming(void);
	bool __fastcall WasOffering(void);
	bool __fastcall WasOutgoing(void);
	void __fastcall Accept(System::UnicodeString UserUserInfo = System::UnicodeString());
	void __fastcall Answer(System::UnicodeString UserUserInfo = System::UnicodeString());
	void __fastcall ClearNotes(void);
	virtual void __fastcall Deallocate(void);
	void __fastcall Dial(System::UnicodeString DestAddr);
	void __fastcall Drop(System::UnicodeString UserUserInfo = System::UnicodeString());
	__property bool Active = {read=Get_Active, nodefault};
	__property ThbTapiAddress* Address = {read=Get_Address};
	__property bool Alive = {read=FAlive, nodefault};
	__property bool AutoOwner = {read=FAutoOwner, write=FAutoOwner, nodefault};
	__property unsigned BeginTC = {read=FBeginTC, nodefault};
	__property System::TDateTime BeginTime = {read=FBeginTime};
	__property unsigned BusyMode = {read=FBusyMode, nodefault};
	__property ThbTapiCallPartyID* CallerID = {read=FCallerID};
	__property unsigned CallID = {read=Get_CallInfoDWORD, index=6, nodefault};
	__property ThbTapiCommDevice* Comm = {read=FComm};
	__property unsigned ConnectedMode = {read=FConnectedMode, nodefault};
	__property System::TDateTime ConnectTime = {read=FConnectTime};
	__property unsigned DailtoneMode = {read=FDialtoneMode, nodefault};
	__property unsigned DisconnectMode = {read=FDisconnectMode, nodefault};
	__property unsigned EndTC = {read=FEndTC, nodefault};
	__property System::TDateTime EndTime = {read=FEndTime};
	__property unsigned Features = {read=Get_CallStatusDWORD, index=3, nodefault};
	__property ThbTapiCallInfo* Info = {read=FInfo};
	__property ThbCustomTapiLine* Line = {read=FLine};
	__property unsigned MediaMode = {read=Get_MediaMode, write=Set_MediaMode, nodefault};
	__property System::UnicodeString Notes[System::UnicodeString Value] = {read=Get_Note, write=Set_Note};
	__property System::Classes::TStrings* NotesList = {read=FNotes, write=Set_Notes};
	__property unsigned OfferingMode = {read=FOfferingMode, nodefault};
	__property unsigned Origin = {read=Get_Origin, nodefault};
	__property unsigned OriginHistory = {read=FOriginHistory, write=FOriginHistory, nodefault};
	__property System::UnicodeString OriginText = {read=Get_OriginText};
	__property bool Owner = {read=Get_Owner, write=Set_Owner, nodefault};
	__property ThbTapiCallParams* Params = {read=FParams};
	__property unsigned Privilege = {read=Get_Privilege, write=Set_Privilege, nodefault};
	__property unsigned SpecialInfoMode = {read=FSpecialInfoMode, nodefault};
	__property unsigned State = {read=Get_State, nodefault};
	__property unsigned StateHistory = {read=FStateHistory, write=FStateHistory, nodefault};
	__property unsigned StateMode = {read=Get_StateMode, nodefault};
	__property ThbTapiCallStatus* Status = {read=FStatus};
	__property int Tag = {read=FTag, write=FTag, nodefault};
	__property ThbTapiRelatedWaveDevice* WaveIn = {read=FWaveInDev};
	__property ThbTapiRelatedWaveDevice* WaveOut = {read=FWaveOutDev};
	ThbTapiCall* __fastcall CompleteTransfer(bool BuildConf = false);
	void __fastcall HandOff(System::UnicodeString FileName);
	void __fastcall Hold(void);
	void __fastcall SwapHold(ThbTapiCall* Call = (ThbTapiCall*)(0x0));
	void __fastcall Unhold(void);
	void __fastcall Park(System::UnicodeString DestAddress);
	void __fastcall GenerateDigits(System::UnicodeString Digits, unsigned Duration);
	void __fastcall GeneratePulseDigits(System::UnicodeString Digits, unsigned Duration);
	ThbTapiCall* __fastcall SetupTransfer(void);
	void __fastcall BlindTransfer(System::UnicodeString DestAddr);
	__property ThbTapiCallPartyID* CalledID = {read=FCalledID};
	__property ThbTapiCallPartyID* ConnectedID = {read=FConnectedID};
	__property ThbTapiCallGatherDigits* GatherDigits = {read=FDigitCollector};
	__property ThbTapiCallMonitorDigits* MonitorDigits = {read=FDigitMonitor};
	__property ThbTapiCallMonitorSilence* MonitorSilence = {read=FSilenceMonitor};
	__property ThbTapiCallRemoteID* RemoteID = {read=FRemoteID};
	int __fastcall GetCallData(/* out */ void * &Data);
	bool __fastcall IsConferenceCall(void);
	ThbTapiCall* __fastcall PrepareAddToConference(void);
	void __fastcall AddToConference(void);
	void __fastcall GenerateTone(unsigned ToneMode, unsigned Duration);
	void __fastcall MonitorTone(unsigned Frequency1, unsigned Frequency2, unsigned Frequency3, unsigned Duration, unsigned AppSpecific);
	void __fastcall Redirect(System::UnicodeString DestAddr);
	void __fastcall RemoveFromConference(void);
	void __fastcall SetCallData(void * Data, unsigned DataSize);
	void __fastcall SetupConference(ThbTapiCall* &ConfCall, ThbTapiCall* &ConsultCall);
	__property ThbTapiCall* ConferenceCall = {read=Get_ConferenceCall};
	__property unsigned Handle = {read=FHandle, nodefault};
	__property Hbtapiapi::PLineCallInfo LINECALLINFO = {read=Get_LINECALLINFO};
	__property Hbtapiapi::PLineCallStatus LINECALLSTATUS = {read=Get_LINECALLSTATUS};
	__property ThbTapiCallMonitorMedia* MonitorMedia = {read=FMediaMonitor};
	__property ThbTapiCallPartyID* RedirectingID = {read=FRedirectingID};
	__property ThbTapiCallPartyID* RedirectionID = {read=FRedirectionID};
};


typedef ThbTapiCall* *PTapiCall;

class DELPHICLASS ThbTapiCallBasicPartyID;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiCallBasicPartyID : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	ThbTapiCall* FOwner;
	
protected:
	virtual System::UnicodeString __fastcall Get_Address(void) = 0 ;
	virtual unsigned __fastcall Get_Flags(void) = 0 ;
	virtual System::UnicodeString __fastcall Get_Name(void) = 0 ;
	bool __fastcall Get_AddressAvail(void);
	bool __fastcall Get_NameAvail(void);
	bool __fastcall Get_OutOfArea(void);
	bool __fastcall Get_Partial(void);
	bool __fastcall Get_Blocked(void);
	bool __fastcall Get_Unavail(void);
	bool __fastcall Get_Unknown(void);
	
public:
	__fastcall ThbTapiCallBasicPartyID(ThbTapiCall* AOwner);
	
protected:
	__property System::UnicodeString Address = {read=Get_Address};
	__property unsigned Flags = {read=Get_Flags, nodefault};
	__property System::UnicodeString Name = {read=Get_Name};
	__property bool AddressAvail = {read=Get_AddressAvail, nodefault};
	__property bool NameAvail = {read=Get_NameAvail, nodefault};
	__property bool OutOfArea = {read=Get_OutOfArea, nodefault};
	__property bool Partial = {read=Get_Partial, nodefault};
	__property bool Blocked = {read=Get_Blocked, nodefault};
	__property bool Unavail = {read=Get_Unavail, nodefault};
	__property bool Unknown = {read=Get_Unknown, nodefault};
public:
	/* TObject.Destroy */ inline __fastcall virtual ~ThbTapiCallBasicPartyID(void) { }
	
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiCallPartyID : public ThbTapiCallBasicPartyID
{
	typedef ThbTapiCallBasicPartyID inherited;
	
private:
	System::Byte FID;
	
protected:
	virtual System::UnicodeString __fastcall Get_Address(void);
	virtual unsigned __fastcall Get_Flags(void);
	virtual System::UnicodeString __fastcall Get_Name(void);
	
public:
	__fastcall ThbTapiCallPartyID(ThbTapiCall* AOwner, System::Byte AID);
	__property Address = {default=0};
	__property Flags;
	__property Name = {default=0};
	__property AddressAvail;
	__property NameAvail;
	__property OutOfArea;
	__property Partial;
	__property Blocked;
	__property Unavail;
	__property Unknown;
public:
	/* TObject.Destroy */ inline __fastcall virtual ~ThbTapiCallPartyID(void) { }
	
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiCallRemoteID : public ThbTapiCallBasicPartyID
{
	typedef ThbTapiCallBasicPartyID inherited;
	
protected:
	ThbTapiCallPartyID* __fastcall Get_RemoteID(void);
	virtual System::UnicodeString __fastcall Get_Address(void);
	virtual unsigned __fastcall Get_Flags(void);
	virtual System::UnicodeString __fastcall Get_Name(void);
	
public:
	__property Address = {default=0};
	__property Flags;
	__property Name = {default=0};
	__property AddressAvail;
	__property NameAvail;
	__property OutOfArea;
	__property Partial;
	__property Blocked;
	__property Unavail;
	__property Unknown;
public:
	/* ThbTapiCallBasicPartyID.Create */ inline __fastcall ThbTapiCallRemoteID(ThbTapiCall* AOwner) : ThbTapiCallBasicPartyID(AOwner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~ThbTapiCallRemoteID(void) { }
	
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiCallStatus : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	ThbTapiCall* FCall;
	linecallstatus_tag *FStatus;
	
protected:
	bool __fastcall Get_Available(void);
	unsigned __fastcall Get_DWORD(int index);
	void __fastcall Set_DWORD(int index, unsigned value);
	System::UnicodeString __fastcall Get_String(int index);
	Hbtapiapi::PLineCallStatus __fastcall Get_LINECALLSTATUS(void);
	
public:
	__fastcall ThbTapiCallStatus(ThbTapiCall* AOwner);
	__fastcall virtual ~ThbTapiCallStatus(void);
	unsigned __fastcall UpdateData(void);
	void __fastcall Invalidate(void);
	void __fastcall Update(void);
	__property Hbtapiapi::PLineCallStatus LINECALLSTATUS = {read=Get_LINECALLSTATUS};
	__property bool Available = {read=Get_Available, nodefault};
	__property unsigned CallState = {read=Get_DWORD, index=0, nodefault};
	__property unsigned CallStateMode = {read=Get_DWORD, index=1, nodefault};
	__property unsigned CallPrivilege = {read=Get_DWORD, index=2, nodefault};
	__property unsigned CallFeatures = {read=Get_DWORD, index=3, nodefault};
	__property unsigned DevSpecificSize = {read=Get_DWORD, index=4, nodefault};
	__property unsigned DevSpecificOffset = {read=Get_DWORD, index=5, nodefault};
	__property unsigned CallFeatures2 = {read=Get_DWORD, index=6, nodefault};
};

#pragma pack(pop)

class DELPHICLASS ThbTapiCallStoredRemoteID;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiCallStoredRemoteID : public ThbTapiCallRemoteID
{
	typedef ThbTapiCallRemoteID inherited;
	
private:
	System::UnicodeString FAddress;
	System::UnicodeString FName;
	unsigned FFlags;
	
protected:
	virtual System::UnicodeString __fastcall Get_Address(void);
	virtual unsigned __fastcall Get_Flags(void);
	virtual System::UnicodeString __fastcall Get_Name(void);
	
public:
	void __fastcall Store(void);
	void __fastcall Clear(void);
public:
	/* ThbTapiCallBasicPartyID.Create */ inline __fastcall ThbTapiCallStoredRemoteID(ThbTapiCall* AOwner) : ThbTapiCallRemoteID(AOwner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~ThbTapiCallStoredRemoteID(void) { }
	
};

#pragma pack(pop)

class DELPHICLASS ThbTapiLineCaps;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiLineCaps : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	ThbCustomTapiLine* FLine;
	linedevcaps_tag *FCaps;
	System::Classes::TStrings* FDeviceClasses;
	
protected:
	bool __fastcall Get_Available(void);
	unsigned __fastcall Get_DWORD(int index);
	System::UnicodeString __fastcall Get_String(int index);
	System::Classes::TStrings* __fastcall Get_DeviceClasses(void);
	unsigned __fastcall UpdateData(void);
	virtual Hbtapiapi::PLineDevCaps __fastcall Get_LINEDEVCAPS(void);
	
public:
	__fastcall ThbTapiLineCaps(ThbCustomTapiLine* AOwner);
	__fastcall virtual ~ThbTapiLineCaps(void);
	virtual void __fastcall Update(void);
	virtual void __fastcall Invalidate(void);
	System::UnicodeString __fastcall TextDump(void);
	__property bool Available = {read=Get_Available, nodefault};
	__property unsigned ProviderInfoSize = {read=Get_DWORD, index=0, nodefault};
	__property unsigned ProviderInfoOffset = {read=Get_DWORD, index=1, nodefault};
	__property System::UnicodeString ProviderInfo = {read=Get_String, index=0};
	__property unsigned SwitchInfoSize = {read=Get_DWORD, index=2, nodefault};
	__property unsigned SwitchInfoOffset = {read=Get_DWORD, index=3, nodefault};
	__property System::UnicodeString SwitchInfo = {read=Get_String, index=1};
	__property unsigned LineNameSize = {read=Get_DWORD, index=4, nodefault};
	__property unsigned LineNameOffset = {read=Get_DWORD, index=5, nodefault};
	__property System::UnicodeString LineName = {read=Get_String, index=2};
	__property unsigned PermanentLineID = {read=Get_DWORD, index=6, nodefault};
	__property unsigned StringFormat = {read=Get_DWORD, index=7, nodefault};
	__property unsigned AddressModes = {read=Get_DWORD, index=8, nodefault};
	__property unsigned NumAddresses = {read=Get_DWORD, index=9, nodefault};
	__property unsigned BearerModes = {read=Get_DWORD, index=10, nodefault};
	__property unsigned MaxRate = {read=Get_DWORD, index=11, nodefault};
	__property unsigned MediaModes = {read=Get_DWORD, index=12, nodefault};
	__property unsigned GenerateToneModes = {read=Get_DWORD, index=13, nodefault};
	__property unsigned GenerateToneMaxNumFreq = {read=Get_DWORD, index=14, nodefault};
	__property unsigned GenerateDigitModes = {read=Get_DWORD, index=15, nodefault};
	__property unsigned MonitorToneMaxNumFreq = {read=Get_DWORD, index=16, nodefault};
	__property unsigned MonitorToneMaxNumEntries = {read=Get_DWORD, index=17, nodefault};
	__property unsigned MonitorDigitModes = {read=Get_DWORD, index=18, nodefault};
	__property unsigned GatherDigitsMinTimeout = {read=Get_DWORD, index=19, nodefault};
	__property unsigned GatherDigitsMaxTimeout = {read=Get_DWORD, index=20, nodefault};
	__property unsigned MedCtlDigitMaxListSize = {read=Get_DWORD, index=21, nodefault};
	__property unsigned MedCtlMediaMaxListSize = {read=Get_DWORD, index=22, nodefault};
	__property unsigned MedCtlToneMaxListSize = {read=Get_DWORD, index=23, nodefault};
	__property unsigned MedCtlCallStateMaxListSize = {read=Get_DWORD, index=24, nodefault};
	__property unsigned DevCapFlags = {read=Get_DWORD, index=25, nodefault};
	__property unsigned MaxNumActiveCalls = {read=Get_DWORD, index=26, nodefault};
	__property unsigned AnswerMode = {read=Get_DWORD, index=27, nodefault};
	__property unsigned RingModes = {read=Get_DWORD, index=28, nodefault};
	__property unsigned LineStates = {read=Get_DWORD, index=29, nodefault};
	__property unsigned UUIAcceptSize = {read=Get_DWORD, index=30, nodefault};
	__property unsigned UUIAnswerSize = {read=Get_DWORD, index=31, nodefault};
	__property unsigned UUIMakeCallSize = {read=Get_DWORD, index=32, nodefault};
	__property unsigned UUIDropSize = {read=Get_DWORD, index=33, nodefault};
	__property unsigned UUISendUserUserInfoSize = {read=Get_DWORD, index=34, nodefault};
	__property unsigned UUICallInfoSize = {read=Get_DWORD, index=35, nodefault};
	__property unsigned NumTerminals = {read=Get_DWORD, index=36, nodefault};
	__property unsigned TerminalCapsSize = {read=Get_DWORD, index=37, nodefault};
	__property unsigned TerminalCapsOffset = {read=Get_DWORD, index=38, nodefault};
	__property unsigned TerminalTextEntrySize = {read=Get_DWORD, index=39, nodefault};
	__property unsigned TerminalTextSize = {read=Get_DWORD, index=40, nodefault};
	__property unsigned TerminalTextOffset = {read=Get_DWORD, index=41, nodefault};
	__property unsigned DevSpecificSize = {read=Get_DWORD, index=42, nodefault};
	__property unsigned DevSpecificOffset = {read=Get_DWORD, index=43, nodefault};
	__property unsigned LineFeatures = {read=Get_DWORD, index=44, nodefault};
	__property unsigned SettableDevStatus = {read=Get_DWORD, index=45, nodefault};
	__property System::Classes::TStrings* DeviceClasses = {read=Get_DeviceClasses};
	__property unsigned DeviceClassesSize = {read=Get_DWORD, index=46, nodefault};
	__property unsigned DeviceClassesOffset = {read=Get_DWORD, index=47, nodefault};
	__property Hbtapiapi::PLineDevCaps LINEDEVCAPS = {read=Get_LINEDEVCAPS};
};

#pragma pack(pop)

class DELPHICLASS ThbTapiLineStatus;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiLineStatus : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	ThbCustomTapiLine* FLine;
	linedevstatus_tag *FStatus;
	
protected:
	bool __fastcall Get_Available(void);
	unsigned __fastcall Get_DWORD(int index);
	System::UnicodeString __fastcall Get_String(int index);
	Hbtapiapi::PLineDevStatus __fastcall Get_LINEDEVSTATUS(void);
	
public:
	__fastcall ThbTapiLineStatus(ThbCustomTapiLine* AOwner);
	__fastcall virtual ~ThbTapiLineStatus(void);
	void __fastcall Update(void);
	void __fastcall Invalidate(void);
	unsigned __fastcall UpdateData(void);
	__property bool Available = {read=Get_Available, nodefault};
	__property unsigned NumOpens = {read=Get_DWORD, index=0, nodefault};
	__property unsigned OpenMediaModes = {read=Get_DWORD, index=1, nodefault};
	__property unsigned NumActiveCalls = {read=Get_DWORD, index=2, nodefault};
	__property unsigned NumOnHoldCalls = {read=Get_DWORD, index=3, nodefault};
	__property unsigned NumOnHoldPendCalls = {read=Get_DWORD, index=4, nodefault};
	__property unsigned LineFeatures = {read=Get_DWORD, index=5, nodefault};
	__property unsigned NumCallCompletions = {read=Get_DWORD, index=6, nodefault};
	__property unsigned RingMode = {read=Get_DWORD, index=7, nodefault};
	__property unsigned SignalLevel = {read=Get_DWORD, index=8, nodefault};
	__property unsigned BatteryLevel = {read=Get_DWORD, index=9, nodefault};
	__property unsigned RoamMode = {read=Get_DWORD, index=10, nodefault};
	__property unsigned DevStatusFlags = {read=Get_DWORD, index=11, nodefault};
	__property unsigned AvailableMediaModes = {read=Get_DWORD, index=12, nodefault};
	__property Hbtapiapi::PLineDevStatus LINEDEVSTATUS = {read=Get_LINEDEVSTATUS};
};

#pragma pack(pop)

class DELPHICLASS ThbTapiDeviceOptions;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiDeviceOptions : public System::Classes::TPersistent
{
	typedef System::Classes::TPersistent inherited;
	
private:
	unsigned FReplyTimeout;
	bool FSyncMode;
	
public:
	__fastcall ThbTapiDeviceOptions(void);
	
protected:
	__property unsigned ReplyTimeout = {read=FReplyTimeout, write=FReplyTimeout, default=60000};
	__property bool SyncMode = {read=FSyncMode, write=FSyncMode, default=1};
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~ThbTapiDeviceOptions(void) { }
	
};

#pragma pack(pop)

class DELPHICLASS ThbTapiLineOptions;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiLineOptions : public ThbTapiDeviceOptions
{
	typedef ThbTapiDeviceOptions inherited;
	
private:
	int FAutoFreeIdleCalls;
	int FAutoDropDiscCalls;
	
public:
	__fastcall ThbTapiLineOptions(void);
	
__published:
	__property int AutoFreeIdleCalls = {read=FAutoFreeIdleCalls, write=FAutoFreeIdleCalls, default=500};
	__property int AutoDropDiscCalls = {read=FAutoDropDiscCalls, write=FAutoDropDiscCalls, default=500};
	__property ReplyTimeout = {default=60000};
	__property SyncMode = {default=1};
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~ThbTapiLineOptions(void) { }
	
};

#pragma pack(pop)

class DELPHICLASS ThbTapiPhoneOptions;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiPhoneOptions : public ThbTapiDeviceOptions
{
	typedef ThbTapiDeviceOptions inherited;
	
__published:
	__property ReplyTimeout = {default=60000};
	__property SyncMode = {default=1};
public:
	/* ThbTapiDeviceOptions.Create */ inline __fastcall ThbTapiPhoneOptions(void) : ThbTapiDeviceOptions() { }
	
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~ThbTapiPhoneOptions(void) { }
	
};

#pragma pack(pop)

class DELPHICLASS ThbTapiAddressCaps;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiAddressCaps : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	ThbTapiAddress* FAddress;
	lineaddresscaps_tag *FCaps;
	System::Classes::TStrings* FDeviceClasses;
	
protected:
	bool __fastcall Get_Available(void);
	unsigned __fastcall Get_DWORD(int index);
	System::UnicodeString __fastcall Get_String(int index);
	System::Classes::TStrings* __fastcall Get_DeviceClasses(void);
	Hbtapiapi::PLineAddressCaps __fastcall Get_LINEADDRESSCAPS(void);
	
public:
	__fastcall ThbTapiAddressCaps(ThbTapiAddress* AOwner);
	__fastcall virtual ~ThbTapiAddressCaps(void);
	unsigned __fastcall UpdateData(void);
	void __fastcall Invalidate(void);
	__property bool Available = {read=Get_Available, nodefault};
	__property unsigned LineDeviceID = {read=Get_DWORD, index=0, nodefault};
	__property unsigned AddressSize = {read=Get_DWORD, index=1, nodefault};
	__property unsigned AddressOffset = {read=Get_DWORD, index=2, nodefault};
	__property System::UnicodeString Address = {read=Get_String, index=0};
	__property unsigned AddressSharing = {read=Get_DWORD, index=3, nodefault};
	__property unsigned AddressStates = {read=Get_DWORD, index=4, nodefault};
	__property unsigned CallInfoStates = {read=Get_DWORD, index=5, nodefault};
	__property unsigned CallerIDFlags = {read=Get_DWORD, index=6, nodefault};
	__property unsigned CalledIDFlags = {read=Get_DWORD, index=7, nodefault};
	__property unsigned ConnectedIDFlags = {read=Get_DWORD, index=8, nodefault};
	__property unsigned RedirectionIDFlags = {read=Get_DWORD, index=9, nodefault};
	__property unsigned RedirectingIDFlags = {read=Get_DWORD, index=10, nodefault};
	__property unsigned CallStates = {read=Get_DWORD, index=11, nodefault};
	__property unsigned DialToneModes = {read=Get_DWORD, index=12, nodefault};
	__property unsigned BusyModes = {read=Get_DWORD, index=13, nodefault};
	__property unsigned SpecialInfo = {read=Get_DWORD, index=14, nodefault};
	__property unsigned DisconnectModes = {read=Get_DWORD, index=15, nodefault};
	__property unsigned MaxNumActiveCalls = {read=Get_DWORD, index=16, nodefault};
	__property unsigned MaxNumOnHoldCalls = {read=Get_DWORD, index=17, nodefault};
	__property unsigned MaxNumOnHoldPendingCalls = {read=Get_DWORD, index=18, nodefault};
	__property unsigned MaxNumConference = {read=Get_DWORD, index=19, nodefault};
	__property unsigned MaxNumTransConf = {read=Get_DWORD, index=20, nodefault};
	__property unsigned AddrCapFlags = {read=Get_DWORD, index=21, nodefault};
	__property unsigned CallFeatures = {read=Get_DWORD, index=22, nodefault};
	__property unsigned RemoveFromConfCaps = {read=Get_DWORD, index=23, nodefault};
	__property unsigned RemoveFromConfState = {read=Get_DWORD, index=24, nodefault};
	__property unsigned TransferModes = {read=Get_DWORD, index=25, nodefault};
	__property unsigned ParkModes = {read=Get_DWORD, index=26, nodefault};
	__property unsigned ForwardModes = {read=Get_DWORD, index=27, nodefault};
	__property unsigned MaxForwardEntries = {read=Get_DWORD, index=28, nodefault};
	__property unsigned MaxSpecificEntries = {read=Get_DWORD, index=29, nodefault};
	__property unsigned MinFwdNumRings = {read=Get_DWORD, index=30, nodefault};
	__property unsigned MaxFwdNumRings = {read=Get_DWORD, index=31, nodefault};
	__property unsigned MaxCallCompletions = {read=Get_DWORD, index=32, nodefault};
	__property unsigned CallCompletionConds = {read=Get_DWORD, index=33, nodefault};
	__property unsigned CallCompletionModes = {read=Get_DWORD, index=34, nodefault};
	__property unsigned NumCompletionMessages = {read=Get_DWORD, index=35, nodefault};
	__property unsigned CompletionMsgTextEntrySize = {read=Get_DWORD, index=36, nodefault};
	__property unsigned CompletionMsgTextSize = {read=Get_DWORD, index=37, nodefault};
	__property unsigned CompletionMsgTextOffset = {read=Get_DWORD, index=38, nodefault};
	__property unsigned AddressFeatures = {read=Get_DWORD, index=39, nodefault};
	__property unsigned PredictiveAutoTransferStates = {read=Get_DWORD, index=40, nodefault};
	__property unsigned NumCallTreatments = {read=Get_DWORD, index=41, nodefault};
	__property unsigned CallTreatmentListSize = {read=Get_DWORD, index=42, nodefault};
	__property unsigned CallTreatmentListOffset = {read=Get_DWORD, index=43, nodefault};
	__property unsigned DeviceClassesSize = {read=Get_DWORD, index=44, nodefault};
	__property unsigned DeviceClassesOffset = {read=Get_DWORD, index=45, nodefault};
	__property System::Classes::TStrings* DeviceClasses = {read=Get_DeviceClasses};
	__property unsigned MaxCallDataSize = {read=Get_DWORD, index=46, nodefault};
	__property unsigned CallFeatures2 = {read=Get_DWORD, index=47, nodefault};
	__property unsigned MaxNoAnswerTimeout = {read=Get_DWORD, index=48, nodefault};
	__property unsigned ConnectedModes = {read=Get_DWORD, index=49, nodefault};
	__property unsigned OfferingModes = {read=Get_DWORD, index=50, nodefault};
	__property unsigned AvailableMediaModes = {read=Get_DWORD, index=51, nodefault};
	__property Hbtapiapi::PLineAddressCaps LINEADDRESSCAPS = {read=Get_LINEADDRESSCAPS};
};

#pragma pack(pop)

class DELPHICLASS ThbTapiForward;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiForward : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	lineforward_tag *FForward;
	unsigned FForwardMode;
	System::UnicodeString FCallerAddress;
	unsigned FDestCountryCode;
	System::UnicodeString FDestAddress;
	
public:
	__fastcall virtual ~ThbTapiForward(void);
	void __fastcall AssignLINEFORWARD(Hbtapiapi::PLineAddressStatus AddressStatus, unsigned Index);
	void __fastcall Clear(void);
	__property unsigned ForwardMode = {read=FForwardMode, write=FForwardMode, nodefault};
	__property System::UnicodeString CallerAddress = {read=FCallerAddress, write=FCallerAddress};
	__property unsigned DestCountryCode = {read=FDestCountryCode, write=FDestCountryCode, nodefault};
	__property System::UnicodeString DestAddress = {read=FDestAddress, write=FDestAddress};
public:
	/* TObject.Create */ inline __fastcall ThbTapiForward(void) : System::TObject() { }
	
};

#pragma pack(pop)

class DELPHICLASS ThbTapiForwardList;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiForwardList : public System::Contnrs::TObjectList
{
	typedef System::Contnrs::TObjectList inherited;
	
public:
	ThbTapiForward* operator[](int Index) { return Items[Index]; }
	
private:
	lineforwardlist_tag *FLINEFORWARDLIST;
	
protected:
	HIDESBASE ThbTapiForward* __fastcall Get(int Index);
	HIDESBASE void __fastcall Put(int Index, ThbTapiForward* Item);
	Hbtapiapi::PLineForwardList __fastcall Get_LINEFORWARDLIST(void);
	
public:
	__fastcall virtual ~ThbTapiForwardList(void);
	HIDESBASE int __fastcall Add(ThbTapiForward* Item);
	ThbTapiForward* __fastcall AddEntry(unsigned ForwardMode, System::UnicodeString CallerAddress, unsigned DestCountryCode, System::UnicodeString DestAddress);
	__property ThbTapiForward* Items[int Index] = {read=Get, write=Put/*, default*/};
	__property Hbtapiapi::PLineForwardList TapiData = {read=Get_LINEFORWARDLIST};
public:
	/* TObjectList.Create */ inline __fastcall ThbTapiForwardList(void)/* overload */ : System::Contnrs::TObjectList() { }
	/* TObjectList.Create */ inline __fastcall ThbTapiForwardList(bool AOwnsObjects)/* overload */ : System::Contnrs::TObjectList(AOwnsObjects) { }
	
};

#pragma pack(pop)

class DELPHICLASS ThbTapiAddressList;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiAddressList : public System::Contnrs::TObjectList
{
	typedef System::Contnrs::TObjectList inherited;
	
public:
	ThbTapiAddress* operator[](int Index) { return Items[Index]; }
	
private:
	ThbCustomTapiLine* FLine;
	
protected:
	HIDESBASE ThbTapiAddress* __fastcall Get(int Index);
	HIDESBASE void __fastcall Put(int Index, ThbTapiAddress* Item);
	
public:
	__fastcall ThbTapiAddressList(ThbCustomTapiLine* AOwner);
	void __fastcall InvalidateStatus(void);
	__property ThbTapiAddress* Items[int Index] = {read=Get, write=Put/*, default*/};
public:
	/* TList.Destroy */ inline __fastcall virtual ~ThbTapiAddressList(void) { }
	
};

#pragma pack(pop)

class DELPHICLASS ThbTapiAddressStatus;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiAddressStatus : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	ThbTapiAddress* FAddress;
	lineaddressstatus_tag *FStatus;
	ThbTapiForwardList* FForwardList;
	
protected:
	bool __fastcall Get_Available(void);
	unsigned __fastcall Get_DWORD(int index);
	ThbTapiForwardList* __fastcall Get_ForwardList(void);
	Hbtapiapi::PLineAddressStatus __fastcall Get_LINEADDRESSSTATUS(void);
	
public:
	__fastcall ThbTapiAddressStatus(ThbTapiAddress* AOwner);
	__fastcall virtual ~ThbTapiAddressStatus(void);
	void __fastcall Invalidate(void);
	void __fastcall Update(void);
	unsigned __fastcall UpdateData(void);
	__property bool Available = {read=Get_Available, nodefault};
	__property unsigned NumInUse = {read=Get_DWORD, index=0, nodefault};
	__property unsigned NumActiveCalls = {read=Get_DWORD, index=1, nodefault};
	__property unsigned NumOnHoldCalls = {read=Get_DWORD, index=2, nodefault};
	__property unsigned NumOnHoldPendCalls = {read=Get_DWORD, index=3, nodefault};
	__property unsigned AddressFeatures = {read=Get_DWORD, index=4, nodefault};
	__property unsigned NumRingsNoAnswer = {read=Get_DWORD, index=5, nodefault};
	__property unsigned ForwardNumEntries = {read=Get_DWORD, index=6, nodefault};
	__property unsigned ForwardSize = {read=Get_DWORD, index=7, nodefault};
	__property unsigned ForwardOffset = {read=Get_DWORD, index=8, nodefault};
	__property ThbTapiForwardList* ForwardList = {read=Get_ForwardList};
	__property Hbtapiapi::PLineAddressStatus LINEADDRESSSTATUS = {read=Get_LINEADDRESSSTATUS};
};

#pragma pack(pop)

class DELPHICLASS ThbTapiRelatedDevice;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiRelatedDevice : public System::Classes::TPersistent
{
	typedef System::Classes::TPersistent inherited;
	
private:
	System::UnicodeString FClass;
	varstring_tag *FData;
	System::TObject* FOwner;
	
protected:
	virtual bool __fastcall Get_Available(void);
	virtual int __fastcall Get_DeviceID(void);
	virtual int __fastcall Get_DeviceIDNo(int index);
	virtual int __fastcall Get_DeviceCount(void);
	virtual void __fastcall Set_DeviceClass(System::UnicodeString Value);
	__property bool Available = {read=Get_Available, nodefault};
	__property System::UnicodeString DeviceClass = {read=FClass, write=Set_DeviceClass};
	
public:
	__fastcall ThbTapiRelatedDevice(System::TObject* AOwner, System::UnicodeString AClass);
	__fastcall virtual ~ThbTapiRelatedDevice(void);
	virtual void __fastcall Invalidate(void);
	virtual void __fastcall Update(void);
	virtual unsigned __fastcall UpdateData(void);
};

#pragma pack(pop)

class DELPHICLASS ThbTapiPhoneLineDevice;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiPhoneLineDevice : public ThbTapiRelatedDevice
{
	typedef ThbTapiRelatedDevice inherited;
	
public:
	__property Available;
	__property int DeviceID = {read=Get_DeviceID, nodefault};
public:
	/* ThbTapiRelatedDevice.Create */ inline __fastcall ThbTapiPhoneLineDevice(System::TObject* AOwner, System::UnicodeString AClass) : ThbTapiRelatedDevice(AOwner, AClass) { }
	/* ThbTapiRelatedDevice.Destroy */ inline __fastcall virtual ~ThbTapiPhoneLineDevice(void) { }
	
};

#pragma pack(pop)

class DELPHICLASS ThbTapiLinePhoneDevices;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiLinePhoneDevices : public ThbTapiRelatedDevice
{
	typedef ThbTapiRelatedDevice inherited;
	
protected:
	virtual bool __fastcall Get_Available(void);
	
public:
	__property Available;
	__property int DeviceID[int index] = {read=Get_DeviceIDNo};
	__property int Count = {read=Get_DeviceCount, nodefault};
public:
	/* ThbTapiRelatedDevice.Create */ inline __fastcall ThbTapiLinePhoneDevices(System::TObject* AOwner, System::UnicodeString AClass) : ThbTapiRelatedDevice(AOwner, AClass) { }
	/* ThbTapiRelatedDevice.Destroy */ inline __fastcall virtual ~ThbTapiLinePhoneDevices(void) { }
	
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiRelatedWaveDevice : public ThbTapiRelatedDevice
{
	typedef ThbTapiRelatedDevice inherited;
	
public:
	__property Available;
	__property int DeviceID = {read=Get_DeviceID, nodefault};
	__property DeviceClass = {default=0};
public:
	/* ThbTapiRelatedDevice.Create */ inline __fastcall ThbTapiRelatedWaveDevice(System::TObject* AOwner, System::UnicodeString AClass) : ThbTapiRelatedDevice(AOwner, AClass) { }
	/* ThbTapiRelatedDevice.Destroy */ inline __fastcall virtual ~ThbTapiRelatedWaveDevice(void) { }
	
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiCommDevice : public ThbTapiRelatedDevice
{
	typedef ThbTapiRelatedDevice inherited;
	
protected:
	virtual bool __fastcall Get_Available(void);
	NativeUInt __fastcall Get_Handle(void);
	System::UnicodeString __fastcall Get_DeviceName(void);
	
public:
	virtual void __fastcall Invalidate(void);
	__property Available;
	__property System::UnicodeString DeviceName = {read=Get_DeviceName};
	__property NativeUInt Handle = {read=Get_Handle, nodefault};
	
__published:
	__property DeviceClass = {default=0};
public:
	/* ThbTapiRelatedDevice.Create */ inline __fastcall ThbTapiCommDevice(System::TObject* AOwner, System::UnicodeString AClass) : ThbTapiRelatedDevice(AOwner, AClass) { }
	/* ThbTapiRelatedDevice.Destroy */ inline __fastcall virtual ~ThbTapiCommDevice(void) { }
	
};

#pragma pack(pop)

class DELPHICLASS ThbTapiCallMonitorDigitsOptions;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiCallMonitorDigitsOptions : public System::Classes::TPersistent
{
	typedef System::Classes::TPersistent inherited;
	
private:
	unsigned FDigitModes;
	bool FAutoSelect;
	
protected:
	virtual void __fastcall SetDigitModes(unsigned Value);
	
public:
	__fastcall ThbTapiCallMonitorDigitsOptions(void);
	virtual void __fastcall Assign(System::Classes::TPersistent* Source);
	
__published:
	__property unsigned DigitModes = {read=FDigitModes, write=SetDigitModes, default=2};
	__property bool AutoSelect = {read=FAutoSelect, write=FAutoSelect, default=0};
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~ThbTapiCallMonitorDigitsOptions(void) { }
	
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiCallMonitorDigits : public ThbTapiCallMonitorDigitsOptions
{
	typedef ThbTapiCallMonitorDigitsOptions inherited;
	
private:
	ThbTapiCall* FCall;
	bool FActive;
	
protected:
	void __fastcall SetActive(const bool Value);
	virtual void __fastcall SetDigitModes(unsigned Value);
	bool __fastcall GetAvailable(void);
	
public:
	__fastcall ThbTapiCallMonitorDigits(ThbTapiCall* AOwner);
	unsigned __fastcall Init(void);
	void __fastcall Done(void);
	__property ThbTapiCall* Call = {read=FCall};
	__property bool Active = {read=FActive, write=SetActive, nodefault};
	__property bool Available = {read=GetAvailable, nodefault};
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~ThbTapiCallMonitorDigits(void) { }
	
};

#pragma pack(pop)

class DELPHICLASS ThbTapiCallMonitorMediaOptions;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiCallMonitorMediaOptions : public System::Classes::TPersistent
{
	typedef System::Classes::TPersistent inherited;
	
private:
	unsigned FMediaModes;
	
protected:
	virtual void __fastcall SetMediaModes(unsigned Value);
	
public:
	__fastcall ThbTapiCallMonitorMediaOptions(void);
	virtual void __fastcall Assign(System::Classes::TPersistent* Source);
	
__published:
	__property unsigned MediaModes = {read=FMediaModes, write=SetMediaModes, default=0};
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~ThbTapiCallMonitorMediaOptions(void) { }
	
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiCallMonitorMedia : public ThbTapiCallMonitorMediaOptions
{
	typedef ThbTapiCallMonitorMediaOptions inherited;
	
private:
	ThbTapiCall* FCall;
	bool FActive;
	
protected:
	void __fastcall SetActive(const bool Value);
	virtual void __fastcall SetMediaModes(unsigned Value);
	
public:
	__fastcall ThbTapiCallMonitorMedia(ThbTapiCall* AOwner);
	__property ThbTapiCall* Call = {read=FCall};
	__property bool Active = {read=FActive, write=SetActive, nodefault};
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~ThbTapiCallMonitorMedia(void) { }
	
};

#pragma pack(pop)

class DELPHICLASS ThbTapiCallGatherDigitsOptions;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiCallGatherDigitsOptions : public System::Classes::TPersistent
{
	typedef System::Classes::TPersistent inherited;
	
private:
	unsigned FDigitModes;
	System::UnicodeString FReceivedDigits;
	System::UnicodeString FTerminationDigits;
	unsigned FFirstDigitTimeout;
	unsigned FInterDigitTimeout;
	unsigned FNumDigits;
	
public:
	virtual void __fastcall Assign(System::Classes::TPersistent* Source);
	__fastcall ThbTapiCallGatherDigitsOptions(void);
	
__published:
	__property unsigned DigitModes = {read=FDigitModes, write=FDigitModes, default=2};
	__property System::UnicodeString TerminationDigits = {read=FTerminationDigits, write=FTerminationDigits};
	__property unsigned FirstDigitTimeout = {read=FFirstDigitTimeout, write=FFirstDigitTimeout, default=5000};
	__property unsigned InterDigitTimeout = {read=FInterDigitTimeout, write=FInterDigitTimeout, default=5000};
	__property unsigned NumDigits = {read=FNumDigits, write=FNumDigits, default=0};
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~ThbTapiCallGatherDigitsOptions(void) { }
	
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiCallGatherDigits : public ThbTapiCallGatherDigitsOptions
{
	typedef ThbTapiCallGatherDigitsOptions inherited;
	
private:
	bool FActive;
	ThbTapiCall* FCall;
	
protected:
	void __fastcall SetActive(const bool Value);
	void __fastcall Handle_GatherDigits(const unsigned GatherTermination);
	
public:
	__fastcall ThbTapiCallGatherDigits(ThbTapiCall* AOwner);
	__property bool Active = {read=FActive, write=SetActive, nodefault};
	__property ThbTapiCall* Call = {read=FCall};
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~ThbTapiCallGatherDigits(void) { }
	
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiCallInfo : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	ThbTapiCall* FCall;
	linecallinfo_tag *FInfo;
	
protected:
	bool __fastcall Get_Available(void);
	unsigned __fastcall Get_DWORD(int index);
	System::UnicodeString __fastcall Get_String(int index);
	Hbtapiapi::PLineCallInfo __fastcall Get_LINECALLINFO(void);
	void * __fastcall Get_CallData(void);
	
public:
	__fastcall ThbTapiCallInfo(ThbTapiCall* AOwner);
	__fastcall virtual ~ThbTapiCallInfo(void);
	unsigned __fastcall UpdateData(void);
	void __fastcall Invalidate(void);
	virtual void __fastcall Update(void);
	__property Hbtapiapi::PLineCallInfo LINECALLINFO = {read=Get_LINECALLINFO};
	__property bool Available = {read=Get_Available, nodefault};
	__property void * CallData = {read=Get_CallData};
	__property System::UnicodeString CallerID = {read=Get_String, index=0};
	__property System::UnicodeString CallerIDName = {read=Get_String, index=1};
	__property System::UnicodeString CalledID = {read=Get_String, index=2};
	__property System::UnicodeString CalledIDName = {read=Get_String, index=3};
	__property System::UnicodeString ConnectedID = {read=Get_String, index=4};
	__property System::UnicodeString ConnectedIDName = {read=Get_String, index=5};
	__property System::UnicodeString RedirectionID = {read=Get_String, index=6};
	__property System::UnicodeString RedirectionIDName = {read=Get_String, index=7};
	__property System::UnicodeString RedirectingID = {read=Get_String, index=8};
	__property System::UnicodeString RedirectingIDName = {read=Get_String, index=9};
	__property System::UnicodeString AppName = {read=Get_String, index=10};
	__property System::UnicodeString DisplayableAddress = {read=Get_String, index=11};
	__property System::UnicodeString CalledParty = {read=Get_String, index=12};
	__property System::UnicodeString Comment = {read=Get_String, index=13};
	__property System::UnicodeString Display = {read=Get_String, index=14};
	__property System::UnicodeString UserUserInfo = {read=Get_String, index=15};
	__property System::UnicodeString HighLevelComp = {read=Get_String, index=16};
	__property System::UnicodeString LowLevelComp = {read=Get_String, index=17};
	__property System::UnicodeString ChargingInfo = {read=Get_String, index=18};
	__property System::UnicodeString TerminalModes = {read=Get_String, index=19};
	__property System::UnicodeString DevSpecific = {read=Get_String, index=20};
	__property unsigned LineDeviceID = {read=Get_DWORD, index=0, nodefault};
	__property unsigned AddressID = {read=Get_DWORD, index=1, nodefault};
	__property unsigned BearerMode = {read=Get_DWORD, index=2, nodefault};
	__property unsigned Rate = {read=Get_DWORD, index=3, nodefault};
	__property unsigned MediaMode = {read=Get_DWORD, index=4, nodefault};
	__property unsigned AppSpecific = {read=Get_DWORD, index=5, nodefault};
	__property unsigned CallID = {read=Get_DWORD, index=6, nodefault};
	__property unsigned RelatedCallID = {read=Get_DWORD, index=7, nodefault};
	__property unsigned CallParamFlags = {read=Get_DWORD, index=8, nodefault};
	__property unsigned CallStates = {read=Get_DWORD, index=9, nodefault};
	__property unsigned MonitorDigitModes = {read=Get_DWORD, index=10, nodefault};
	__property unsigned MonitorMediaModes = {read=Get_DWORD, index=11, nodefault};
	__property unsigned Origin = {read=Get_DWORD, index=12, nodefault};
	__property unsigned Reason = {read=Get_DWORD, index=13, nodefault};
	__property unsigned CompletionID = {read=Get_DWORD, index=14, nodefault};
	__property unsigned NumOwners = {read=Get_DWORD, index=15, nodefault};
	__property unsigned NumMonitors = {read=Get_DWORD, index=16, nodefault};
	__property unsigned CountryCode = {read=Get_DWORD, index=17, nodefault};
	__property unsigned Trunk = {read=Get_DWORD, index=18, nodefault};
	__property unsigned CallerIDFlags = {read=Get_DWORD, index=19, nodefault};
	__property unsigned CallerIDSize = {read=Get_DWORD, index=20, nodefault};
	__property unsigned CallerIDOffset = {read=Get_DWORD, index=21, nodefault};
	__property unsigned CallerIDNameSize = {read=Get_DWORD, index=22, nodefault};
	__property unsigned CallerIDNameOffset = {read=Get_DWORD, index=23, nodefault};
	__property unsigned CalledIDFlags = {read=Get_DWORD, index=24, nodefault};
	__property unsigned CalledIDSize = {read=Get_DWORD, index=25, nodefault};
	__property unsigned CalledIDOffset = {read=Get_DWORD, index=26, nodefault};
	__property unsigned CalledIDNameSize = {read=Get_DWORD, index=27, nodefault};
	__property unsigned CalledIDNameOffset = {read=Get_DWORD, index=28, nodefault};
	__property unsigned ConnectedIDFlags = {read=Get_DWORD, index=29, nodefault};
	__property unsigned ConnectedIDSize = {read=Get_DWORD, index=30, nodefault};
	__property unsigned ConnectedIDOffset = {read=Get_DWORD, index=31, nodefault};
	__property unsigned ConnectedIDNameSize = {read=Get_DWORD, index=32, nodefault};
	__property unsigned ConnectedIDNameOffset = {read=Get_DWORD, index=33, nodefault};
	__property unsigned RedirectionIDFlags = {read=Get_DWORD, index=34, nodefault};
	__property unsigned RedirectionIDSize = {read=Get_DWORD, index=35, nodefault};
	__property unsigned RedirectionIDOffset = {read=Get_DWORD, index=36, nodefault};
	__property unsigned RedirectionIDNameSize = {read=Get_DWORD, index=37, nodefault};
	__property unsigned RedirectionIDNameOffset = {read=Get_DWORD, index=38, nodefault};
	__property unsigned RedirectingIDFlags = {read=Get_DWORD, index=39, nodefault};
	__property unsigned RedirectingIDSize = {read=Get_DWORD, index=40, nodefault};
	__property unsigned RedirectingIDOffset = {read=Get_DWORD, index=41, nodefault};
	__property unsigned RedirectingIDNameSize = {read=Get_DWORD, index=42, nodefault};
	__property unsigned RedirectingIDNameOffset = {read=Get_DWORD, index=43, nodefault};
	__property unsigned AppNameSize = {read=Get_DWORD, index=44, nodefault};
	__property unsigned AppNameOffset = {read=Get_DWORD, index=45, nodefault};
	__property unsigned DisplayableAddressSize = {read=Get_DWORD, index=46, nodefault};
	__property unsigned DisplayableAddressOffset = {read=Get_DWORD, index=47, nodefault};
	__property unsigned CalledPartySize = {read=Get_DWORD, index=48, nodefault};
	__property unsigned CalledPartyOffset = {read=Get_DWORD, index=49, nodefault};
	__property unsigned CommentSize = {read=Get_DWORD, index=50, nodefault};
	__property unsigned CommentOffset = {read=Get_DWORD, index=51, nodefault};
	__property unsigned DisplaySize = {read=Get_DWORD, index=52, nodefault};
	__property unsigned DisplayOffset = {read=Get_DWORD, index=53, nodefault};
	__property unsigned UserUserInfoSize = {read=Get_DWORD, index=54, nodefault};
	__property unsigned UserUserInfoOffset = {read=Get_DWORD, index=55, nodefault};
	__property unsigned HighLevelCompSize = {read=Get_DWORD, index=56, nodefault};
	__property unsigned HighLevelCompOffset = {read=Get_DWORD, index=57, nodefault};
	__property unsigned LowLevelCompSize = {read=Get_DWORD, index=58, nodefault};
	__property unsigned LowLevelCompOffset = {read=Get_DWORD, index=59, nodefault};
	__property unsigned ChargingInfoSize = {read=Get_DWORD, index=60, nodefault};
	__property unsigned ChargingInfoOffset = {read=Get_DWORD, index=61, nodefault};
	__property unsigned TerminalModesSize = {read=Get_DWORD, index=62, nodefault};
	__property unsigned TerminalModesOffset = {read=Get_DWORD, index=63, nodefault};
	__property unsigned DevSpecificSize = {read=Get_DWORD, index=64, nodefault};
	__property unsigned DevSpecificOffset = {read=Get_DWORD, index=65, nodefault};
	__property unsigned CallTreatment = {read=Get_DWORD, index=66, nodefault};
	__property unsigned CallDataSize = {read=Get_DWORD, index=67, nodefault};
	__property unsigned CallDataOffset = {read=Get_DWORD, index=68, nodefault};
	__property unsigned SendingFlowspecSize = {read=Get_DWORD, index=69, nodefault};
	__property unsigned SendingFlowspecOffset = {read=Get_DWORD, index=70, nodefault};
	__property unsigned ReceivingFlowspecSize = {read=Get_DWORD, index=71, nodefault};
	__property unsigned ReceivingFlowspecOffset = {read=Get_DWORD, index=72, nodefault};
};

#pragma pack(pop)

class DELPHICLASS ThbTapiCallMonitorSilenceOptions;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiCallMonitorSilenceOptions : public System::Classes::TPersistent
{
	typedef System::Classes::TPersistent inherited;
	
protected:
	unsigned FDuration;
	
public:
	virtual void __fastcall Assign(System::Classes::TPersistent* Source);
	
__published:
	__property unsigned Duration = {read=FDuration, write=FDuration, default=0};
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~ThbTapiCallMonitorSilenceOptions(void) { }
	
public:
	/* TObject.Create */ inline __fastcall ThbTapiCallMonitorSilenceOptions(void) : System::Classes::TPersistent() { }
	
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiCallMonitorSilence : public ThbTapiCallMonitorSilenceOptions
{
	typedef ThbTapiCallMonitorSilenceOptions inherited;
	
private:
	bool FActive;
	ThbTapiCall* FCall;
	
protected:
	void __fastcall SetActive(const bool Value);
	bool __fastcall GetAvailable(void);
	__property ThbTapiCall* Call = {read=FCall};
	
public:
	__fastcall ThbTapiCallMonitorSilence(ThbTapiCall* AOwner);
	__property bool Active = {read=FActive, write=SetActive, nodefault};
	__property unsigned Duration = {read=FDuration, write=FDuration, nodefault};
	__property bool Available = {read=GetAvailable, nodefault};
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~ThbTapiCallMonitorSilence(void) { }
	
};

#pragma pack(pop)

class DELPHICLASS ThbTapiCallOptions;
class DELPHICLASS ThbTapiLineCallParams;
class DELPHICLASS ThbTapiSystemLocation;
class PASCALIMPLEMENTATION ThbCustomTapiLine : public ThbTapiDevice
{
	typedef ThbTapiDevice inherited;
	
private:
	ThbTapiAddressList* FAddresses;
	System::Classes::TStringList* FAddressList;
	ThbTapiCallClass FCallClass;
	ThbTapiCallOptions* FCallOptions;
	ThbTapiLineCallParams* FCallParams;
	ThbTapiCallList* FCalls;
	ThbTapiLineCaps* FDeviceCaps;
	ThbTapiLineStatus* FDeviceStatus;
	unsigned FMediaModes;
	ThbTapiLineOptions* FOptions;
	ThbTapiLinePhoneDevices* FPhoneDevs;
	ThbTapiLinePrivileges* FPrivileges;
	ThbTapiCallList* FUnconfirmedCalls;
	ThbTapiDevSpecificDataList* FDevSpecificList;
	ThbTapiSystemLocation* FLocation;
	
protected:
	virtual void __fastcall Update_AddressList(void);
	virtual unsigned __fastcall Update_LineCalls(void);
	virtual unsigned __fastcall Update_StatusMessages(void);
	virtual void __fastcall Handle_AddressState(unsigned AddressID, unsigned AddressState);
	virtual void __fastcall Handle_AgentStatus(unsigned AddressID, unsigned AgentStatus, unsigned AgentStatusDetail);
	virtual ThbTapiCall* __fastcall Handle_AppNewCall(unsigned Call);
	virtual void __fastcall Handle_CallState(unsigned Call, unsigned State, unsigned CallStateDetail, unsigned CallPrivilege);
	virtual void __fastcall Handle_CallInfo(unsigned Call, unsigned InfoState);
	virtual void __fastcall Handle_DeviceState(unsigned DeviceState, unsigned DeviceStateDetail1, unsigned DeviceStateDetail2);
	virtual void __fastcall Handle_DevSpecific(unsigned LineOrCall, unsigned DeviceSpecific1, unsigned DeviceSpecific2, unsigned DeviceSpecific3);
	virtual void __fastcall Handle_DevSpecFeature(unsigned LineOrCall, unsigned DeviceSpecific1, unsigned DeviceSpecific2, unsigned DeviceSpecific3);
	virtual void __fastcall Handle_GatherDigits(unsigned Call, unsigned GatherTermination);
	virtual void __fastcall Handle_Generate(unsigned Call, unsigned GenerateTermination);
	virtual void __fastcall Handle_MonitorDigits(unsigned Call, unsigned Digit, unsigned DigitMode);
	virtual void __fastcall Handle_MonitorMedia(unsigned Call, unsigned MediaMode, unsigned TickCount);
	virtual void __fastcall Handle_MonitorTone(unsigned Call, unsigned AppSpecific);
	virtual void __fastcall Handle_DeviceRename(System::UnicodeString NewDeviceName);
	virtual void __fastcall Handle_Reply(unsigned RequestID, unsigned ReplyCode, ThbTapiRequest* Request);
	virtual void __fastcall Handle_TapiMessage(unsigned Device, unsigned Msg, unsigned Param1, unsigned Param2, unsigned Param3);
	virtual void __fastcall Handle_Timeout(unsigned RequestID, ThbTapiRequest* Request);
	virtual void __fastcall Handle_Timer(unsigned RequestID, ThbTapiRequest* Request);
	virtual void __fastcall Trigger_AddressState(ThbTapiAddress* Address, unsigned AddressState);
	virtual void __fastcall Trigger_CallBegin(ThbTapiCall* Call);
	virtual void __fastcall Trigger_CallEnd(ThbTapiCall* Call);
	virtual void __fastcall Trigger_CallInfo(ThbTapiCall* Call, unsigned InfoState);
	virtual void __fastcall Trigger_CallPrivilege(ThbTapiCall* Call, unsigned Privilege);
	virtual void __fastcall Trigger_CallState(ThbTapiCall* Call, unsigned State, unsigned StateDetail, unsigned Privilege);
	virtual void __fastcall Trigger_DeallocateCall(ThbTapiCall* Call);
	virtual void __fastcall Trigger_DeviceState(unsigned DeviceState, unsigned DeviceStateDetail1, unsigned DeviceStateDetail2);
	virtual void __fastcall Trigger_DevSpecific(ThbTapiCall* Call, unsigned DeviceSpecific1, unsigned DeviceSpecific2, unsigned DeviceSpecific3);
	virtual void __fastcall Trigger_DevSpecificFeature(ThbTapiCall* Call, unsigned DeviceSpecific1, unsigned DeviceSpecific2, unsigned DeviceSpecific3);
	virtual void __fastcall Trigger_DevSpecificReply(unsigned RequestID, ThbTapiDevSpecificData* DevSpecData, unsigned ReplyCode);
	virtual void __fastcall Trigger_DevSpecificTimeout(unsigned RequestID, ThbTapiDevSpecificData* DevSpecData, unsigned ElapsedTime);
	virtual void __fastcall Trigger_DevSpecificFeatureReply(unsigned RequestID, unsigned Feature, ThbTapiDevSpecificData* DevSpecData, unsigned ReplyCode);
	virtual void __fastcall Trigger_DevSpecificFeatureTimeout(unsigned RequestID, unsigned Feature, ThbTapiDevSpecificData* DevSpecData, unsigned ElapsedTime);
	virtual void __fastcall Trigger_Digit(ThbTapiCall* Call, unsigned Digit, unsigned DigitMode);
	virtual void __fastcall Trigger_GatherTerm(ThbTapiCall* Call, unsigned Termination);
	virtual void __fastcall Trigger_Generate(ThbTapiCall* Call, unsigned Termination);
	virtual void __fastcall Trigger_MonitorMedia(ThbTapiCall* Call, unsigned MediaMode, unsigned TickCount);
	virtual void __fastcall Trigger_MonitorTone(ThbTapiCall* Call, unsigned AppSpecific);
	virtual void __fastcall Trigger_MonitorSilence(ThbTapiCall* Call);
	virtual void __fastcall Trigger_NewCall(ThbTapiCall* Call);
	ThbTapiAddress* __fastcall Get_AddressByName(System::UnicodeString value);
	virtual System::UnicodeString __fastcall Get_DeviceName(void);
	virtual System::Classes::TStrings* __fastcall Get_DeviceList(void);
	virtual HICON __fastcall Get_IconHandle(System::UnicodeString DeviceClass = System::UnicodeString());
	virtual unsigned __fastcall Get_ReplyTimeout(void);
	virtual bool __fastcall Get_SyncMode(void);
	virtual void __fastcall Set_PermanentDeviceID(unsigned Value);
	ThbTapiSystemLocation* __fastcall Get_Location(void);
	unsigned __fastcall Get_Handle(void);
	unsigned __fastcall Get_LineApp(void);
	Hbtapiapi::PLineDevStatus __fastcall Get_DevStatus(void);
	Hbtapiapi::PLineDevCaps __fastcall Get_DevCaps(void);
	virtual unsigned __fastcall Get_LineStateMessages(void);
	void __fastcall Set_LineStateMessages(unsigned Messages);
	virtual unsigned __fastcall Get_AddressStateMessages(void);
	void __fastcall Set_AddressStateMessages(unsigned Messages);
	unsigned __fastcall OpenLine(unsigned CallbackInstance, Hbtapiapi::PLineCallParams CallParams = (Hbtapiapi::PLineCallParams)(0x0))/* overload */;
	ThbTapiCall* __fastcall FindProperCall(unsigned CallStates, unsigned CallFeatures, int AddressID, ThbTapiCall* ExcludeCall);
	ThbTapiCall* __fastcall GetCallByHandle(unsigned Call, bool AllowCreation = true);
	bool __fastcall IsCallAlive(unsigned Call);
	bool __fastcall IsCallValid(unsigned Call)/* overload */;
	bool __fastcall ProveCall(ThbTapiCall* Call);
	void __fastcall AddCall(ThbTapiCall* Call);
	void __fastcall DeallocateIdleCall(ThbTapiCall* Call);
	void __fastcall DropDiscCall(ThbTapiCall* Call);
	void __fastcall FreeBadCall(ThbTapiCall* Call);
	void __fastcall RemoveCall(ThbTapiCall* Call);
	void __fastcall RemoveCallLinks(ThbTapiCall* Call);
	bool __fastcall ValidateCall(ThbTapiCall* Call, System::UnicodeString ExceptionText = System::UnicodeString());
	
public:
	__fastcall virtual ThbCustomTapiLine(System::Classes::TComponent* AOwner);
	__fastcall virtual ~ThbCustomTapiLine(void);
	virtual void __fastcall Open(void);
	virtual void __fastcall Close(void);
	virtual unsigned __fastcall Init(int DeviceID);
	virtual void __fastcall Done(void);
	bool __fastcall IsCallValid(ThbTapiCall* Call)/* overload */;
	virtual void __fastcall Accept(ThbTapiCall* Call, System::UnicodeString UserUserInfo = System::UnicodeString());
	virtual void __fastcall Answer(ThbTapiCall* Call, System::UnicodeString UserUserInfo = System::UnicodeString());
	virtual void __fastcall Drop(ThbTapiCall* Call, System::UnicodeString UserUserInfo = System::UnicodeString());
	virtual ThbTapiCall* __fastcall MakeCall(System::UnicodeString DestAddr)/* overload */;
	virtual ThbTapiCall* __fastcall MakeCall(System::UnicodeString DestAddr, unsigned CountryCode, Hbtapiapi::PLineCallParams CallParams)/* overload */;
	virtual void __fastcall Dial(ThbTapiCall* Call, System::UnicodeString DestAddr, unsigned CountryCode);
	virtual System::UnicodeString __fastcall TranslateAddress(System::UnicodeString Address, unsigned Options = (unsigned)(0x0));
	__property ThbTapiAddress* Address[System::UnicodeString index] = {read=Get_AddressByName};
	__property ThbTapiAddressList* Addresses = {read=FAddresses, write=FAddresses};
	__property System::Classes::TStringList* AddressList = {read=FAddressList};
	__property Available;
	__property ThbTapiLineCaps* Caps = {read=FDeviceCaps};
	__property ThbTapiCallClass CallClass = {read=FCallClass, write=FCallClass};
	__property ThbTapiCallList* Calls = {read=FCalls};
	__property Icon;
	__property DeviceID = {default=-1};
	__property DeviceList;
	__property ThbTapiLinePhoneDevices* Phones = {read=FPhoneDevs};
	__property ThbTapiLineStatus* Status = {read=FDeviceStatus};
	__property WaveIn;
	__property WaveOut;
	__property Active = {default=0};
	__property DeviceName = {default=0};
	__property ThbTapiLineCallParams* CallParams = {read=FCallParams, write=FCallParams};
	__property ThbTapiCallOptions* CallOptions = {read=FCallOptions, write=FCallOptions};
	__property unsigned MediaModes = {read=FMediaModes, write=FMediaModes, default=0};
	__property ThbTapiLineOptions* Options = {read=FOptions, write=FOptions};
	__property ThbTapiLinePrivileges* Privileges = {read=FPrivileges, write=FPrivileges};
	virtual ThbTapiCall* __fastcall CompleteTransfer(ThbTapiCall* Call, ThbTapiCall* ConsultCall, unsigned TransferMode);
	virtual ThbTapiCall* __fastcall SetupTransfer(ThbTapiCall* Call, Hbtapiapi::PLineCallParams CallParams);
	virtual ThbTapiCall* __fastcall Unpark(unsigned AddressID, System::UnicodeString DestAddress);
	virtual void __fastcall BlindTransfer(ThbTapiCall* Call, System::UnicodeString DestAddr, unsigned CountryCode);
	virtual void __fastcall CompleteCall(ThbTapiCall* Call, unsigned &CompletionID, unsigned CompletionMode, unsigned MessageID);
	virtual void __fastcall ConfigDialog(HWND OwnerWnd = (HWND)(0x0));
	virtual void __fastcall ForwardAddress(ThbTapiAddress* Address, Hbtapiapi::PLineForwardList ForwardList, unsigned NumRingsNoAnswer, unsigned &ConsultCallHandle, Hbtapiapi::PLineCallParams CallParams);
	virtual void __fastcall GenerateDigits(ThbTapiCall* Call, System::UnicodeString Digits, unsigned DigitMode, unsigned Duration);
	virtual void __fastcall GetForwardList(ThbTapiAddress* Address, ThbTapiForwardList* ForwardList);
	virtual void __fastcall HandOff(ThbTapiCall* Call, System::UnicodeString FileName, unsigned MediaMode);
	virtual void __fastcall Hold(ThbTapiCall* Call);
	virtual void __fastcall Park(ThbTapiCall* Call, unsigned ParkMode, System::UnicodeString DirAddress, Hbtapiapi::PVarString NonDirAddress);
	virtual void __fastcall SwapHold(ThbTapiCall* Call, ThbTapiCall* HeldCall);
	virtual void __fastcall TranslateDialog(System::UnicodeString Address, HWND OwnerWnd = (HWND)(0x0));
	virtual void __fastcall UncompleteCall(unsigned CompletionID);
	virtual void __fastcall UnHold(ThbTapiCall* Call);
	virtual ThbTapiCall* __fastcall Pickup(unsigned AddressID, System::UnicodeString DestAddress, System::UnicodeString GroupID);
	__property ThbTapiSystemLocation* Location = {read=Get_Location};
	virtual bool __fastcall GetConfRelatedCalls(ThbTapiCall* Call, ThbTapiCallList* ConfCalls);
	virtual ThbTapiCall* __fastcall PrepareAddToConference(ThbTapiCall* ConfCall, Hbtapiapi::PLineCallParams CallParams);
	virtual void __fastcall AddToConference(ThbTapiCall* ConfCall, ThbTapiCall* ConsultCall);
	virtual void __fastcall DevSpecific(void * Params, unsigned Size, ThbTapiAddress* Address = (ThbTapiAddress*)(0x0), ThbTapiCall* Call = (ThbTapiCall*)(0x0));
	virtual void __fastcall DevSpecificFeature(unsigned Feature, void * Params, unsigned Size);
	virtual void __fastcall GenerateTone(ThbTapiCall* Call, unsigned ToneMode, unsigned Duration, unsigned NumTones, Hbtapiapi::PLineGenerateTone Tones);
	virtual void __fastcall MonitorMedia(ThbTapiCall* Call, unsigned MediaModes);
	virtual void __fastcall MonitorTones(ThbTapiCall* Call, Hbtapiapi::PLineMonitorTone ToneList, unsigned NumEntries);
	virtual void __fastcall Redirect(ThbTapiCall* Call, System::UnicodeString DestAddr, unsigned CountryCode);
	virtual void __fastcall RemoveFromConference(ThbTapiCall* Call);
	virtual void __fastcall SetCallData(ThbTapiCall* Call, void * Data, unsigned DataSize);
	virtual void __fastcall SetupConference(ThbTapiCall* Call, ThbTapiCall* &ConfCall, ThbTapiCall* &ConsultCall, unsigned NumParties, Hbtapiapi::PLineCallParams CallParams);
	__property unsigned Handle = {read=Get_Handle, nodefault};
	__property CallbackInstance;
	__property unsigned LineApp = {read=Get_LineApp, nodefault};
	__property Hbtapiapi::PLineDevStatus LINEDEVSTATUS = {read=Get_DevStatus};
	__property Hbtapiapi::PLineDevCaps LINEDEVCAPS = {read=Get_DevCaps};
	__property unsigned LineStateMessages = {read=Get_LineStateMessages, write=Set_LineStateMessages, nodefault};
	__property unsigned AddressStateMessages = {read=Get_AddressStateMessages, write=Set_AddressStateMessages, nodefault};
};


class PASCALIMPLEMENTATION ThbTapiLine : public ThbCustomTapiLine
{
	typedef ThbCustomTapiLine inherited;
	
private:
	ThbTapiAddressStateEvent FOnAddressState;
	ThbTapiCallEvent FOnNewCall;
	ThbTapiCallEvent FOnDeallocateCall;
	ThbTapiCallEvent FOnCallBegin;
	ThbTapiCallEvent FOnCallEnd;
	ThbTapiCallInfoEvent FOnCallInfo;
	ThbTapiCallEvent FOnCallInfo_CallerID;
	ThbTapiCallEvent FOnCallInfo_CalledID;
	ThbTapiCallEvent FOnCallInfo_ConnectedID;
	ThbTapiCallEvent FOnCallInfo_RedirectionID;
	ThbTapiCallEvent FOnCallInfo_RedirectingID;
	ThbTapiCallPrivilegeEvent FOnCallPrivilege;
	ThbTapiCallStateEvent FOnCallState;
	ThbTapiCallEvent FOnCallState_Accepted;
	ThbTapiCallEvent FOnCallState_Busy;
	ThbTapiCallEvent FOnCallState_Conferenced;
	ThbTapiCallEvent FOnCallState_Connected;
	ThbTapiCallEvent FOnCallState_Dialing;
	ThbTapiCallEvent FOnCallState_Dialtone;
	ThbTapiCallEvent FOnCallState_Disconnected;
	ThbTapiCallEvent FOnCallState_Idle;
	ThbTapiCallEvent FOnCallState_Offering;
	ThbTapiCallEvent FOnCallState_OnHold;
	ThbTapiCallEvent FOnCallState_OnHoldPendConf;
	ThbTapiCallEvent FOnCallState_PendTransfer;
	ThbTapiCallEvent FOnCallState_Proceeding;
	ThbTapiCallEvent FOnCallState_Ringback;
	ThbTapiCallEvent FOnCallState_SpecialInfo;
	ThbTapiCallEvent FOnCallState_Unknown;
	ThbTapiLineRingEvent FOnRing;
	ThbTapiLineDevSpecificEvent FOnDevSpecific;
	ThbTapiLineDevSpecReplyEvent FOnDevSpecificReply;
	ThbTapiLineDevSpecTimeoutEvent FOnDevSpecificTimeout;
	ThbTapiLineDevSpecificEvent FOnDevSpecificFeature;
	ThbTapiCallGatherDigitsEvent FOnGatherDigitsTerm;
	ThbTapiCallDigitEvent FOnDigit;
	ThbTapiCallEvent FOnMediaMode;
	ThbTapiCallGenerateEvent FOnGenerate;
	ThbTapiCallToneEvent FOnTone;
	ThbTapiCallEvent FOnSilence;
	
protected:
	virtual void __fastcall Trigger_AddressState(ThbTapiAddress* Address, unsigned AddressState);
	virtual void __fastcall Trigger_CallBegin(ThbTapiCall* Call);
	virtual void __fastcall Trigger_CallEnd(ThbTapiCall* Call);
	virtual void __fastcall Trigger_CallInfo(ThbTapiCall* Call, unsigned InfoState);
	virtual void __fastcall Trigger_CallPrivilege(ThbTapiCall* Call, unsigned Privilege);
	virtual void __fastcall Trigger_CallState(ThbTapiCall* Call, unsigned State, unsigned StateDetail, unsigned Privilege);
	virtual void __fastcall Trigger_DeallocateCall(ThbTapiCall* Call);
	virtual void __fastcall Trigger_DeviceState(unsigned DeviceState, unsigned DeviceStateDetail1, unsigned DeviceStateDetail2);
	virtual void __fastcall Trigger_DevSpecific(ThbTapiCall* Call, unsigned DeviceSpecific1, unsigned DeviceSpecific2, unsigned DeviceSpecific3);
	virtual void __fastcall Trigger_DevSpecificFeature(ThbTapiCall* Call, unsigned DeviceSpecific1, unsigned DeviceSpecific2, unsigned DeviceSpecific3);
	virtual void __fastcall Trigger_DevSpecificReply(unsigned RequestID, ThbTapiDevSpecificData* DevSpecData, unsigned ReplyCode);
	virtual void __fastcall Trigger_DevSpecificTimeout(unsigned RequestID, ThbTapiDevSpecificData* DevSpecData, unsigned ElapsedTime);
	virtual void __fastcall Trigger_Digit(ThbTapiCall* Call, unsigned Digit, unsigned DigitMode);
	virtual void __fastcall Trigger_GatherTerm(ThbTapiCall* Call, unsigned Termination);
	virtual void __fastcall Trigger_Generate(ThbTapiCall* Call, unsigned Termination);
	virtual void __fastcall Trigger_MonitorMedia(ThbTapiCall* Call, unsigned MediaMode, unsigned TickCount);
	virtual void __fastcall Trigger_MonitorTone(ThbTapiCall* Call, unsigned AppSpecific);
	virtual void __fastcall Trigger_MonitorSilence(ThbTapiCall* Call);
	virtual void __fastcall Trigger_NewCall(ThbTapiCall* Call);
	
public:
	__property Address;
	__property Addresses;
	__property AddressList;
	__property Available;
	__property Caps;
	__property Calls;
	__property Icon;
	__property DeviceID = {default=-1};
	__property DeviceList;
	__property Phones;
	__property PermanentDeviceID;
	__property Status;
	__property WaveIn;
	__property WaveOut;
	__property Location;
	
__published:
	__property Active = {default=0};
	__property DeviceName = {default=0};
	__property CallOptions;
	__property CallParams;
	__property MediaModes = {default=0};
	__property Options;
	__property Privileges;
	__property ThbTapiLineRingEvent OnRing = {read=FOnRing, write=FOnRing};
	__property ThbTapiAddressStateEvent OnAddressState = {read=FOnAddressState, write=FOnAddressState};
	__property ThbTapiCallStateEvent OnCallState = {read=FOnCallState, write=FOnCallState};
	__property ThbTapiCallPrivilegeEvent OnCallPrivilege = {read=FOnCallPrivilege, write=FOnCallPrivilege};
	__property ThbTapiCallEvent OnAccepted = {read=FOnCallState_Accepted, write=FOnCallState_Accepted};
	__property ThbTapiCallEvent OnBusy = {read=FOnCallState_Busy, write=FOnCallState_Busy};
	__property ThbTapiCallEvent OnConnected = {read=FOnCallState_Connected, write=FOnCallState_Connected};
	__property ThbTapiCallEvent OnDialing = {read=FOnCallState_Dialing, write=FOnCallState_Dialing};
	__property ThbTapiCallEvent OnDialtone = {read=FOnCallState_Dialtone, write=FOnCallState_Dialtone};
	__property ThbTapiCallEvent OnDisconnected = {read=FOnCallState_Disconnected, write=FOnCallState_Disconnected};
	__property ThbTapiCallEvent OnIdle = {read=FOnCallState_Idle, write=FOnCallState_Idle};
	__property ThbTapiCallEvent OnOffering = {read=FOnCallState_Offering, write=FOnCallState_Offering};
	__property ThbTapiCallEvent OnProceeding = {read=FOnCallState_Proceeding, write=FOnCallState_Proceeding};
	__property ThbTapiCallEvent OnRingback = {read=FOnCallState_Ringback, write=FOnCallState_Ringback};
	__property ThbTapiCallEvent OnSpecialInfo = {read=FOnCallState_SpecialInfo, write=FOnCallState_SpecialInfo};
	__property ThbTapiCallInfoEvent OnCallInfo = {read=FOnCallInfo, write=FOnCallInfo};
	__property ThbTapiCallEvent OnCallerID = {read=FOnCallInfo_CallerID, write=FOnCallInfo_CallerID};
	__property ThbTapiCallEvent OnNewCall = {read=FOnNewCall, write=FOnNewCall};
	__property ThbTapiCallEvent OnCallDeallocate = {read=FOnDeallocateCall, write=FOnDeallocateCall};
	__property ThbTapiCallEvent OnCallBegin = {read=FOnCallBegin, write=FOnCallBegin};
	__property ThbTapiCallEvent OnCallEnd = {read=FOnCallEnd, write=FOnCallEnd};
	__property OnDeviceClose;
	__property OnDeviceRemove;
	__property OnError;
	__property OnDeviceState;
	__property OnTapiReply;
	__property OnTapiTimeout;
	__property ThbTapiCallDigitEvent OnDigit = {read=FOnDigit, write=FOnDigit};
	__property ThbTapiCallGatherDigitsEvent OnDigits = {read=FOnGatherDigitsTerm, write=FOnGatherDigitsTerm};
	__property ThbTapiCallGenerateEvent OnGenerate = {read=FOnGenerate, write=FOnGenerate};
	__property ThbTapiCallToneEvent OnTone = {read=FOnTone, write=FOnTone};
	__property ThbTapiCallEvent OnSilence = {read=FOnSilence, write=FOnSilence};
	__property ThbTapiCallEvent OnCalledID = {read=FOnCallInfo_CalledID, write=FOnCallInfo_CalledID};
	__property ThbTapiCallEvent OnConnectedID = {read=FOnCallInfo_ConnectedID, write=FOnCallInfo_ConnectedID};
	__property ThbTapiCallEvent OnHold = {read=FOnCallState_OnHold, write=FOnCallState_OnHold};
	__property ThbTapiCallEvent OnHoldPendTrans = {read=FOnCallState_PendTransfer, write=FOnCallState_PendTransfer};
	__property OnTapiTranslateChange;
	__property TSP;
	__property ThbTapiCallEvent OnMediaMode = {read=FOnMediaMode, write=FOnMediaMode};
	__property ThbTapiCallEvent OnRedirectionID = {read=FOnCallInfo_RedirectionID, write=FOnCallInfo_RedirectionID};
	__property ThbTapiCallEvent OnRedirectingID = {read=FOnCallInfo_RedirectingID, write=FOnCallInfo_RedirectingID};
	__property ThbTapiCallEvent OnConferenced = {read=FOnCallState_Conferenced, write=FOnCallState_Conferenced};
	__property ThbTapiCallEvent OnHoldPendConf = {read=FOnCallState_OnHoldPendConf, write=FOnCallState_OnHoldPendConf};
	__property ThbTapiLineDevSpecificEvent OnDevSpecific = {read=FOnDevSpecific, write=FOnDevSpecific};
	__property ThbTapiLineDevSpecificEvent OnDevSpecificFeature = {read=FOnDevSpecificFeature, write=FOnDevSpecificFeature};
	__property ThbTapiLineDevSpecReplyEvent OnDevSpecificReply = {read=FOnDevSpecificReply, write=FOnDevSpecificReply};
	__property ThbTapiLineDevSpecTimeoutEvent OnDevSpecificTimeout = {read=FOnDevSpecificTimeout, write=FOnDevSpecificTimeout};
	__property OnTapiMessage;
public:
	/* ThbCustomTapiLine.Create */ inline __fastcall virtual ThbTapiLine(System::Classes::TComponent* AOwner) : ThbCustomTapiLine(AOwner) { }
	/* ThbCustomTapiLine.Destroy */ inline __fastcall virtual ~ThbTapiLine(void) { }
	
};


class DELPHICLASS ThbTapiPhoneStatus;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiPhoneStatus : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	ThbCustomTapiPhone* FPhone;
	phonestatus_tag *FStatus;
	
protected:
	bool __fastcall Get_Available(void);
	unsigned __fastcall Get_DWORD(int index);
	System::UnicodeString __fastcall Get_String(int index);
	unsigned __fastcall Get_LampMode(unsigned Index);
	void __fastcall Set_LampMode(unsigned Index, unsigned Value);
	Hbtapiapi::PPhoneStatus __fastcall Get_PHONESTATUS(void);
	
public:
	__fastcall ThbTapiPhoneStatus(ThbCustomTapiPhone* AOwner);
	__fastcall virtual ~ThbTapiPhoneStatus(void);
	void __fastcall Invalidate(void);
	void __fastcall Update(void);
	unsigned __fastcall UpdateData(void);
	__property bool Available = {read=Get_Available, nodefault};
	__property unsigned StatusFlags = {read=Get_DWORD, index=3, nodefault};
	__property unsigned NumOwners = {read=Get_DWORD, index=4, nodefault};
	__property unsigned NumMonitors = {read=Get_DWORD, index=5, nodefault};
	__property unsigned RingMode = {read=Get_DWORD, index=6, nodefault};
	__property unsigned RingVolume = {read=Get_DWORD, index=7, nodefault};
	__property unsigned HandsetHookSwitchMode = {read=Get_DWORD, index=8, nodefault};
	__property unsigned HandsetVolume = {read=Get_DWORD, index=9, nodefault};
	__property unsigned HandsetGain = {read=Get_DWORD, index=10, nodefault};
	__property unsigned SpeakerHookSwitchMode = {read=Get_DWORD, index=11, nodefault};
	__property unsigned SpeakerVolume = {read=Get_DWORD, index=12, nodefault};
	__property unsigned SpeakerGain = {read=Get_DWORD, index=13, nodefault};
	__property unsigned HeadsetHookSwitchMode = {read=Get_DWORD, index=14, nodefault};
	__property unsigned HeadsetVolume = {read=Get_DWORD, index=15, nodefault};
	__property unsigned HeadsetGain = {read=Get_DWORD, index=16, nodefault};
	__property unsigned DisplaySize = {read=Get_DWORD, index=17, nodefault};
	__property unsigned DisplayOffset = {read=Get_DWORD, index=18, nodefault};
	__property unsigned LampModesSize = {read=Get_DWORD, index=19, nodefault};
	__property unsigned LampModesOffset = {read=Get_DWORD, index=20, nodefault};
	__property unsigned OwnerNameSize = {read=Get_DWORD, index=21, nodefault};
	__property unsigned OwnerNameOffset = {read=Get_DWORD, index=22, nodefault};
	__property unsigned DevSpecificSize = {read=Get_DWORD, index=23, nodefault};
	__property unsigned DevSpecificOffset = {read=Get_DWORD, index=24, nodefault};
	__property System::UnicodeString Display = {read=Get_String, index=0};
	__property System::UnicodeString OwnerName = {read=Get_String, index=2};
	__property System::UnicodeString DevSpecific = {read=Get_String, index=3};
	__property unsigned LampModes[unsigned Index] = {read=Get_LampMode};
	__property unsigned PhoneFeatures = {read=Get_DWORD, index=25, nodefault};
	__property Hbtapiapi::PPhoneStatus PHONESTATUS = {read=Get_PHONESTATUS};
};

#pragma pack(pop)

class DELPHICLASS ThbTapiPhoneHookSwitch;
class PASCALIMPLEMENTATION ThbCustomTapiPhone : public ThbTapiDevice
{
	typedef ThbTapiDevice inherited;
	
private:
	ThbTapiPhoneCaps* FDeviceCaps;
	ThbTapiPhoneStatus* FDeviceStatus;
	ThbTapiPhoneHookSwitch* FHandSet;
	ThbTapiPhoneHookSwitch* FHeadSet;
	ThbTapiPhoneHookSwitch* FSpeakerphone;
	ThbTapiPhoneOptions* FOptions;
	ThbTapiPhonePrivileges* FPrivileges;
	ThbTapiPhoneControlList* FControls;
	ThbTapiPhoneDisplay* FDisplay;
	ThbTapiPhoneRinger* FRinger;
	ThbTapiPhoneLineDevice* FLineDev;
	ThbTapiDevSpecificDataList* FDevSpecificList;
	
protected:
	virtual void __fastcall Update_Controls(void);
	virtual unsigned __fastcall Update_StatusMessages(void);
	virtual void __fastcall Handle_TapiMessage(unsigned Device, unsigned Msg, unsigned Param1, unsigned Param2, unsigned Param3);
	virtual void __fastcall Handle_DeviceState(unsigned DeviceState, unsigned DeviceStateDetail1, unsigned DeviceStateDetail2);
	virtual void __fastcall Handle_Button(unsigned ButtonID, unsigned ButtonMode, unsigned ButtonState);
	virtual void __fastcall Handle_DevSpecific(unsigned DeviceSpecific1, unsigned DeviceSpecific2, unsigned DeviceSpecific3);
	virtual void __fastcall Handle_Reply(unsigned RequestID, unsigned ReplyCode, ThbTapiRequest* Request);
	virtual void __fastcall Handle_Timeout(unsigned RequestID, ThbTapiRequest* Request);
	virtual void __fastcall Handle_Timer(unsigned RequestID, ThbTapiRequest* Request);
	void __fastcall Handle_DeviceRename(System::UnicodeString NewDeviceName);
	virtual void __fastcall Trigger_OnLamp(unsigned ButtonLampID);
	virtual void __fastcall Trigger_Button(unsigned ButtonID, unsigned ButtonMode, unsigned ButtonState);
	virtual void __fastcall Trigger_DigitPressed(System::WideChar Digit);
	virtual void __fastcall Trigger_DigitReleased(System::WideChar Digit);
	virtual void __fastcall Trigger_DevSpecific(unsigned DeviceSpecific1, unsigned DeviceSpecific2, unsigned DeviceSpecific3);
	virtual void __fastcall Trigger_DevSpecificReply(unsigned RequestID, ThbTapiDevSpecificData* DevSpecData, unsigned ReplyCode);
	virtual void __fastcall Trigger_DevSpecificTimeout(unsigned RequestID, ThbTapiDevSpecificData* DevSpecData, unsigned ElapsedTime);
	virtual unsigned __fastcall Get_Display(System::UnicodeString &Value);
	virtual System::UnicodeString __fastcall Get_DeviceName(void);
	virtual System::Classes::TStrings* __fastcall Get_DeviceList(void);
	virtual HICON __fastcall Get_IconHandle(System::UnicodeString DeviceClass = System::UnicodeString());
	virtual unsigned __fastcall Get_StatusDWORD(int Index);
	virtual unsigned __fastcall Get_ReplyTimeout(void);
	virtual bool __fastcall Get_SyncMode(void);
	virtual void __fastcall Set_Display(ThbTapiPhoneDisplay* Display, System::UnicodeString Value);
	virtual void __fastcall Set_Lamp(ThbTapiPhoneControl* Lamp, unsigned LampMode);
	virtual void __fastcall Set_Ring(ThbTapiPhoneRinger* Ringer, unsigned RingMode, unsigned Volume);
	virtual void __fastcall Set_PermanentDeviceID(unsigned Value);
	unsigned __fastcall Get_Handle(void);
	unsigned __fastcall Get_PhoneApp(void);
	Hbtapiapi::PPhoneCaps __fastcall Get_DeviceCaps(void);
	Hbtapiapi::PPhoneStatus __fastcall Get_DeviceStatus(void);
	unsigned __fastcall Get_PhoneStateMessages(void);
	void __fastcall Set_PhoneStateMessages(unsigned Messages);
	unsigned __fastcall Get_ButtonModeMessages(void);
	void __fastcall Set_ButtonModeMessages(unsigned Messages);
	unsigned __fastcall Get_ButtonStateMessages(void);
	void __fastcall Set_ButtonStateMessages(unsigned Messages);
	virtual unsigned __fastcall OpenPhone(unsigned CallbackInstance);
	__property ThbTapiPhoneCaps* Caps = {read=FDeviceCaps};
	__property ThbTapiPhoneDisplay* Display = {read=FDisplay, write=FDisplay};
	__property ThbTapiPhoneOptions* Options = {read=FOptions, write=FOptions};
	__property ThbTapiPhonePrivileges* Privileges = {read=FPrivileges, write=FPrivileges};
	__property ThbTapiPhoneStatus* Status = {read=FDeviceStatus};
	__property ThbTapiPhoneHookSwitch* HandSet = {read=FHandSet, write=FHandSet};
	__property ThbTapiPhoneHookSwitch* HeadSet = {read=FHeadSet, write=FHeadSet};
	__property ThbTapiPhoneHookSwitch* Speakerphone = {read=FSpeakerphone, write=FSpeakerphone};
	__property unsigned Handle = {read=Get_Handle, nodefault};
	__property CallbackInstance;
	__property ThbTapiPhoneControlList* Controls = {read=FControls};
	__property unsigned PhoneApp = {read=Get_PhoneApp, nodefault};
	__property Hbtapiapi::PPhoneCaps PHONECAPS = {read=Get_DeviceCaps};
	__property Hbtapiapi::PPhoneStatus PHONESTATUS = {read=Get_DeviceStatus};
	__property ThbTapiPhoneRinger* Ringer = {read=FRinger, write=FRinger};
	
public:
	__fastcall virtual ThbCustomTapiPhone(System::Classes::TComponent* AOwner);
	__fastcall virtual ~ThbCustomTapiPhone(void);
	virtual void __fastcall Open(void);
	virtual void __fastcall Close(void);
	virtual unsigned __fastcall Init(int DeviceID);
	virtual void __fastcall Done(void);
	virtual void __fastcall SetDisplay(int Row, int Col, System::UnicodeString Value);
	virtual void __fastcall ConfigDialog(HWND OwnerWnd);
	virtual void __fastcall DevSpecific(void * Params, unsigned Size);
	__property unsigned PhoneStateMessages = {read=Get_PhoneStateMessages, write=Set_PhoneStateMessages, nodefault};
	__property unsigned ButtonStateMessages = {read=Get_ButtonStateMessages, write=Set_ButtonStateMessages, nodefault};
	__property unsigned ButtonModeMessages = {read=Get_ButtonModeMessages, write=Set_ButtonModeMessages, nodefault};
};


class PASCALIMPLEMENTATION ThbTapiPhone : public ThbCustomTapiPhone
{
	typedef ThbCustomTapiPhone inherited;
	
private:
	ThbTapiPhoneButtonEvent FOnButton;
	ThbTapiPhoneDigitEvent FOnDigitPressed;
	ThbTapiPhoneDigitEvent FOnDigitReleased;
	System::Classes::TNotifyEvent FOnDisplay;
	System::Classes::TNotifyEvent FOnState_HandsetGain;
	System::Classes::TNotifyEvent FOnState_HandsetHookSwitch;
	System::Classes::TNotifyEvent FOnState_HandsetVolume;
	System::Classes::TNotifyEvent FOnState_HeadsetGain;
	System::Classes::TNotifyEvent FOnState_HeadsetHookSwitch;
	System::Classes::TNotifyEvent FOnState_HeadsetVolume;
	System::Classes::TNotifyEvent FOnState_SpeakerGain;
	System::Classes::TNotifyEvent FOnState_SpeakerHookSwitch;
	System::Classes::TNotifyEvent FOnState_SpeakerVolume;
	System::Classes::TNotifyEvent FOnState_RingMode;
	System::Classes::TNotifyEvent FOnState_RingVolume;
	ThbTapiPhoneButtonLampEvent FOnState_Lamp;
	ThbTapiPhoneDevSpecificEvent FOnDevSpecific;
	ThbTapiDevSpecReplyEvent FOnDevSpecificReply;
	ThbTapiDevSpecTimeoutEvent FOnDevSpecificTimeout;
	
protected:
	virtual void __fastcall Trigger_Button(unsigned ButtonID, unsigned ButtonMode, unsigned ButtonState);
	virtual void __fastcall Trigger_DigitPressed(System::WideChar Digit);
	virtual void __fastcall Trigger_DigitReleased(System::WideChar Digit);
	virtual void __fastcall Trigger_DeviceState(unsigned DeviceState, unsigned DeviceStateDetail1, unsigned DeviceStateDetail2);
	virtual void __fastcall Trigger_DevSpecific(unsigned DeviceSpecific1, unsigned DeviceSpecific2, unsigned DeviceSpecific3);
	virtual void __fastcall Trigger_DevSpecificReply(unsigned RequestID, ThbTapiDevSpecificData* DevSpecData, unsigned ReplyCode);
	virtual void __fastcall Trigger_DevSpecificTimeout(unsigned RequestID, ThbTapiDevSpecificData* DevSpecData, unsigned ElapsedTime);
	virtual void __fastcall Trigger_OnLamp(unsigned ButtonLampID);
	
public:
	__property Available;
	__property DeviceID = {default=-1};
	__property Caps;
	__property Status;
	__property Display;
	__property DeviceList;
	__property Icon;
	__property PermanentDeviceID;
	__property WaveIn;
	__property WaveOut;
	
__published:
	__property Active = {default=0};
	__property DeviceName = {default=0};
	__property Options;
	__property Privileges;
	__property OnDeviceClose;
	__property OnDeviceRemove;
	__property OnDeviceState;
	__property System::Classes::TNotifyEvent OnDisplay = {read=FOnDisplay, write=FOnDisplay};
	__property OnError;
	__property OnTapiReply;
	__property OnTapiTimeout;
	
public:
	__property HandSet;
	__property HeadSet;
	__property Speakerphone;
	
__published:
	__property System::Classes::TNotifyEvent OnHandsetGain = {read=FOnState_HandsetGain, write=FOnState_HandsetGain};
	__property System::Classes::TNotifyEvent OnHandsetHookSwitch = {read=FOnState_HandsetHookSwitch, write=FOnState_HandsetHookSwitch};
	__property System::Classes::TNotifyEvent OnHandsetVolume = {read=FOnState_HandsetVolume, write=FOnState_HandsetVolume};
	__property System::Classes::TNotifyEvent OnHeadsetGain = {read=FOnState_HeadsetGain, write=FOnState_HeadsetGain};
	__property System::Classes::TNotifyEvent OnHeadsetHookSwitch = {read=FOnState_HeadsetHookSwitch, write=FOnState_HeadsetHookSwitch};
	__property System::Classes::TNotifyEvent OnHeadsetVolume = {read=FOnState_HeadsetVolume, write=FOnState_HeadsetVolume};
	__property System::Classes::TNotifyEvent OnSpeakerphoneGain = {read=FOnState_SpeakerGain, write=FOnState_SpeakerGain};
	__property System::Classes::TNotifyEvent OnSpeakerphoneHookSwitch = {read=FOnState_SpeakerHookSwitch, write=FOnState_SpeakerHookSwitch};
	__property System::Classes::TNotifyEvent OnSpeakerphoneVolume = {read=FOnState_SpeakerVolume, write=FOnState_SpeakerVolume};
	
public:
	__property Handle;
	__property PHONECAPS;
	__property PHONESTATUS;
	__property Controls;
	__property Ringer;
	__property TSP;
	
__published:
	__property ThbTapiPhoneButtonEvent OnButton = {read=FOnButton, write=FOnButton};
	__property ThbTapiPhoneDigitEvent OnDigitPressed = {read=FOnDigitPressed, write=FOnDigitPressed};
	__property ThbTapiPhoneDigitEvent OnDigitReleased = {read=FOnDigitReleased, write=FOnDigitReleased};
	__property ThbTapiPhoneButtonLampEvent OnLamp = {read=FOnState_Lamp, write=FOnState_Lamp};
	__property System::Classes::TNotifyEvent OnRingVolume = {read=FOnState_RingVolume, write=FOnState_RingVolume};
	__property System::Classes::TNotifyEvent OnRingMode = {read=FOnState_RingMode, write=FOnState_RingMode};
	__property ThbTapiPhoneDevSpecificEvent OnDevSpecific = {read=FOnDevSpecific, write=FOnDevSpecific};
	__property ThbTapiDevSpecReplyEvent OnDevSpecReply = {read=FOnDevSpecificReply, write=FOnDevSpecificReply};
	__property ThbTapiDevSpecTimeoutEvent OnDevSpecTimeout = {read=FOnDevSpecificTimeout, write=FOnDevSpecificTimeout};
	__property OnTapiMessage;
public:
	/* ThbCustomTapiPhone.Create */ inline __fastcall virtual ThbTapiPhone(System::Classes::TComponent* AOwner) : ThbCustomTapiPhone(AOwner) { }
	/* ThbCustomTapiPhone.Destroy */ inline __fastcall virtual ~ThbTapiPhone(void) { }
	
};


#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiAddress : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	int FAddressID;
	ThbTapiAddressCaps* FCaps;
	ThbTapiCallParams* FForwardCallParams;
	unsigned FForwardCallHandle;
	ThbCustomTapiLine* FLine;
	ThbTapiAddressStatus* FStatus;
	int FTag;
	
protected:
	void __fastcall Handle_AddressState(unsigned AddressState);
	void __fastcall Handle_Reply(unsigned RequestID, unsigned ReplyCode, ThbTapiRequest* Request);
	System::UnicodeString __fastcall Get_Address(void);
	unsigned __fastcall Get_StatusDWORD(int index);
	Hbtapiapi::PLineAddressCaps __fastcall Get_LINEADDRESSCAPS(void);
	Hbtapiapi::PLineAddressStatus __fastcall Get_LINEADDRESSSTATUS(void);
	ThbTapiForwardList* __fastcall Get_ForwardList(void);
	
public:
	__fastcall ThbTapiAddress(ThbCustomTapiLine* Line, unsigned AddressID);
	__fastcall virtual ~ThbTapiAddress(void);
	unsigned __fastcall Init(void);
	ThbTapiCall* __fastcall MakeCall(System::UnicodeString DestAddr);
	__property unsigned AddressFeatures = {read=Get_StatusDWORD, index=4, nodefault};
	__property int AddressID = {read=FAddressID, nodefault};
	__property System::UnicodeString AddressName = {read=Get_Address};
	__property ThbTapiAddressCaps* Caps = {read=FCaps};
	__property unsigned ForwardNumEntries = {read=Get_StatusDWORD, index=6, nodefault};
	__property ThbCustomTapiLine* Line = {read=FLine};
	__property unsigned NumActiveCalls = {read=Get_StatusDWORD, index=1, nodefault};
	__property unsigned NumInUse = {read=Get_StatusDWORD, index=0, nodefault};
	__property unsigned NumOnHoldCalls = {read=Get_StatusDWORD, index=2, nodefault};
	__property unsigned NumOnHoldPendCalls = {read=Get_StatusDWORD, index=3, nodefault};
	__property unsigned NumRingsNoAnswer = {read=Get_StatusDWORD, index=5, nodefault};
	__property ThbTapiAddressStatus* Status = {read=FStatus};
	__property int Tag = {read=FTag, write=FTag, nodefault};
	void __fastcall ChangeForwardList(ThbTapiForwardList* ForwardList, unsigned NumRingsNoAnswer, ThbTapiCallParams* CallParams);
	void __fastcall ForwardTo(System::UnicodeString DestAddress);
	__property ThbTapiForwardList* ForwardList = {read=Get_ForwardList};
	__property Hbtapiapi::PLineAddressCaps LINEADDRESSCAPS = {read=Get_LINEADDRESSCAPS};
	__property Hbtapiapi::PLineAddressStatus LINEADDRESSSTATUS = {read=Get_LINEADDRESSSTATUS};
};

#pragma pack(pop)

class DELPHICLASS ThbTapiDialParams;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiDialParams : public System::Classes::TPersistent
{
	typedef System::Classes::TPersistent inherited;
	
private:
	linedialparams_tag *FPARAMS;
	unsigned FDialPause;
	unsigned FDialSpeed;
	unsigned FDigitDuration;
	unsigned FWaitForDialtone;
	
protected:
	Hbtapiapi::PLineDialParams __fastcall GetParams(void);
	
public:
	__fastcall ThbTapiDialParams(void);
	__fastcall virtual ~ThbTapiDialParams(void);
	virtual void __fastcall Assign(System::Classes::TPersistent* Source);
	__property Hbtapiapi::PLineDialParams TapiData = {read=GetParams};
	
__published:
	__property unsigned DialPause = {read=FDialPause, write=FDialPause, nodefault};
	__property unsigned DialSpeed = {read=FDialSpeed, write=FDialSpeed, nodefault};
	__property unsigned DigitDuration = {read=FDigitDuration, write=FDigitDuration, nodefault};
	__property unsigned WaitForDialtone = {read=FWaitForDialtone, write=FWaitForDialtone, nodefault};
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiCallOptions : public System::Classes::TPersistent
{
	typedef System::Classes::TPersistent inherited;
	
private:
	bool FAutoOwner;
	ThbTapiCallGatherDigitsOptions* FGatherDigits;
	ThbTapiCallMonitorDigitsOptions* FMonitorDigits;
	ThbTapiCallMonitorMediaOptions* FMonitorMedia;
	ThbTapiCallMonitorSilenceOptions* FMonitorSilence;
	
public:
	__fastcall ThbTapiCallOptions(void);
	__fastcall virtual ~ThbTapiCallOptions(void);
	
__published:
	__property bool AutoOwner = {read=FAutoOwner, write=FAutoOwner, default=1};
	__property ThbTapiCallGatherDigitsOptions* GatherDigits = {read=FGatherDigits, write=FGatherDigits};
	__property ThbTapiCallMonitorDigitsOptions* MonitorDigits = {read=FMonitorDigits, write=FMonitorDigits};
	__property ThbTapiCallMonitorSilenceOptions* MonitorSilence = {read=FMonitorSilence, write=FMonitorSilence};
	__property ThbTapiCallMonitorMediaOptions* MonitorMedia = {read=FMonitorMedia, write=FMonitorMedia};
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiCallParams : public System::Classes::TPersistent
{
	typedef System::Classes::TPersistent inherited;
	
private:
	unsigned FAddressID;
	unsigned FAddressMode;
	unsigned FBearerMode;
	System::UnicodeString FCalledParty;
	System::UnicodeString FCallingPartyID;
	unsigned FCallParamFlags;
	System::UnicodeString FComment;
	ThbTapiDialParams* FDialParams;
	System::UnicodeString FDisplayableAddress;
	unsigned FMaxRate;
	unsigned FMediaMode;
	unsigned FMinRate;
	unsigned FNoAnswerTimeout;
	System::UnicodeString FOrigAddress;
	linecallparams_tag *FPARAMS;
	System::UnicodeString FTargetAddress;
	System::UnicodeString FUserUserInfo;
	
protected:
	Hbtapiapi::PLineCallParams __fastcall Get_LINECALLPARAMS(void);
	void __fastcall Set_Flag(int Index, bool Value);
	bool __fastcall Get_Flag(int Index);
	
public:
	__fastcall ThbTapiCallParams(void);
	__fastcall virtual ~ThbTapiCallParams(void);
	void __fastcall Default(void);
	virtual void __fastcall Assign(System::Classes::TPersistent* Source);
	__property Hbtapiapi::PLineCallParams TapiData = {read=Get_LINECALLPARAMS};
	__property unsigned AddressID = {read=FAddressID, write=FAddressID, default=0};
	__property unsigned AddressMode = {read=FAddressMode, write=FAddressMode, default=1};
	__property unsigned BearerMode = {read=FBearerMode, write=FBearerMode, default=1};
	__property bool BlockID = {read=Get_Flag, write=Set_Flag, index=2, default=0};
	__property System::UnicodeString CalledParty = {read=FCalledParty, write=FCalledParty};
	__property System::UnicodeString CallingPartyID = {read=FCallingPartyID, write=FCallingPartyID};
	__property System::UnicodeString Comment = {read=FComment, write=FComment};
	__property ThbTapiDialParams* DialParams = {read=FDialParams, write=FDialParams};
	__property System::UnicodeString DisplayableAddress = {read=FDisplayableAddress, write=FDisplayableAddress};
	__property unsigned Flags = {read=FCallParamFlags, write=FCallParamFlags, nodefault};
	__property unsigned MaxRate = {read=FMaxRate, write=FMaxRate, default=0};
	__property unsigned MediaMode = {read=FMediaMode, write=FMediaMode, default=4};
	__property unsigned MinRate = {read=FMinRate, write=FMinRate, default=0};
	__property unsigned NoAnswerTimeout = {read=FNoAnswerTimeout, write=FNoAnswerTimeout, default=0};
	__property System::UnicodeString OrigAddress = {read=FOrigAddress, write=FOrigAddress};
	__property System::UnicodeString TargetAddress = {read=FTargetAddress, write=FTargetAddress};
	__property System::UnicodeString UserUserInfo = {read=FUserUserInfo, write=FUserUserInfo};
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiLineCallParams : public ThbTapiCallParams
{
	typedef ThbTapiCallParams inherited;
	
__published:
	__property AddressID = {default=0};
	__property BearerMode = {default=1};
	__property BlockID = {index=2, default=0};
	__property Flags;
	__property MediaMode = {default=4};
	__property NoAnswerTimeout = {default=0};
public:
	/* ThbTapiCallParams.Create */ inline __fastcall ThbTapiLineCallParams(void) : ThbTapiCallParams() { }
	/* ThbTapiCallParams.Destroy */ inline __fastcall virtual ~ThbTapiLineCallParams(void) { }
	
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiPhoneHookSwitch : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	ThbCustomTapiPhone* FPhone;
	unsigned FHookSwitchDevice;
	
protected:
	bool __fastcall Get_Available(void);
	bool __fastcall Get_Enabled(void);
	virtual unsigned __fastcall Get_Gain(void);
	virtual bool __fastcall Get_GainAvailable(void);
	virtual unsigned __fastcall Get_Modes(void);
	virtual bool __fastcall Get_Unknown(void);
	virtual bool __fastcall Get_OnHook(void);
	virtual bool __fastcall Get_Speaker(void);
	virtual bool __fastcall Get_Micro(void);
	virtual unsigned __fastcall Get_Volume(void);
	virtual bool __fastcall Get_VolumeAvailable(void);
	void __fastcall Set_Gain(unsigned Value);
	void __fastcall Set_Volume(unsigned Value);
	void __fastcall Set_OnHook(bool Value);
	void __fastcall Set_Speaker(bool Value);
	void __fastcall Set_Micro(bool Value);
	
public:
	__fastcall ThbTapiPhoneHookSwitch(ThbCustomTapiPhone* AOwner, unsigned AHookSwitchDevice);
	__property bool Available = {read=Get_Available, nodefault};
	__property bool Enabled = {read=Get_Enabled, nodefault};
	__property ThbCustomTapiPhone* Phone = {read=FPhone};
	__property bool Unknown = {read=Get_Unknown, nodefault};
	__property unsigned Gain = {read=Get_Gain, write=Set_Gain, nodefault};
	__property bool GainAvailable = {read=Get_GainAvailable, nodefault};
	__property unsigned Modes = {read=Get_Modes, nodefault};
	__property bool OnHook = {read=Get_OnHook, write=Set_OnHook, nodefault};
	__property bool SpeakerActive = {read=Get_Speaker, write=Set_Speaker, nodefault};
	__property bool MicroActive = {read=Get_Micro, write=Set_Micro, nodefault};
	__property unsigned Volume = {read=Get_Volume, write=Set_Volume, nodefault};
	__property bool VolumeAvailable = {read=Get_VolumeAvailable, nodefault};
public:
	/* TObject.Destroy */ inline __fastcall virtual ~ThbTapiPhoneHookSwitch(void) { }
	
};

#pragma pack(pop)

class DELPHICLASS ThbTapiLocation;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiLocation : public System::TObject
{
	typedef System::TObject inherited;
	
protected:
	bool FAvailable;
	unsigned FInitError;
	unsigned FCountryID;
	System::UnicodeString FLocationName;
	System::UnicodeString FCountryCode;
	System::UnicodeString FCityCode;
	System::UnicodeString FLocalAccessCode;
	System::UnicodeString FLongDistanceAccessCode;
	System::UnicodeString FCountryName;
	System::UnicodeString FSameAreaRule;
	System::UnicodeString FLongDistanceRule;
	System::UnicodeString FInternationalRule;
	unsigned FLocationID;
	bool __fastcall Init(unsigned LocationID);
	virtual unsigned __fastcall UpdateData(void);
	virtual unsigned __fastcall UpdateCountry(void);
	void __fastcall Assign(ThbTapiLocation* Location);
	void __fastcall AssignLINELOCATIONENTRY(Hbtapiapi::PLineTranslateCaps TranslateCaps, unsigned Index);
	
public:
	__fastcall ThbTapiLocation(void);
	void __fastcall GetValues(System::Classes::TStrings* ValueList);
	void __fastcall Clear(void);
	virtual void __fastcall Update(void);
	__property bool Available = {read=FAvailable, nodefault};
	__property unsigned InitError = {read=FInitError, nodefault};
	__property unsigned LocationID = {read=FLocationID, nodefault};
	__property unsigned CountryID = {read=FCountryID, nodefault};
	__property System::UnicodeString LocationName = {read=FLocationName};
	__property System::UnicodeString CountryCode = {read=FCountryCode};
	__property System::UnicodeString CityCode = {read=FCityCode};
	__property System::UnicodeString LocalAccessCode = {read=FLocalAccessCode};
	__property System::UnicodeString LongDistanceAccessCode = {read=FLongDistanceAccessCode};
	__property System::UnicodeString CountryName = {read=FCountryName};
	__property System::UnicodeString SameAreaRule = {read=FSameAreaRule};
	__property System::UnicodeString LongDistanceRule = {read=FLongDistanceRule};
	__property System::UnicodeString InternationalRule = {read=FInternationalRule};
public:
	/* TObject.Destroy */ inline __fastcall virtual ~ThbTapiLocation(void) { }
	
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiSystemLocation : public ThbTapiLocation
{
	typedef ThbTapiLocation inherited;
	
protected:
	unsigned __fastcall GetCurrentLocationID(unsigned &LocationID);
	void __fastcall SetCurrentLocationID(unsigned value);
	HIDESBASE bool __fastcall Init(void);
	virtual unsigned __fastcall UpdateData(void);
	
public:
	__property unsigned LocationID = {read=FLocationID, write=SetCurrentLocationID, nodefault};
public:
	/* ThbTapiLocation.Create */ inline __fastcall ThbTapiSystemLocation(void) : ThbTapiLocation() { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~ThbTapiSystemLocation(void) { }
	
};

#pragma pack(pop)

class DELPHICLASS ThbTapiLocationList;
#pragma pack(push,4)
class PASCALIMPLEMENTATION ThbTapiLocationList : public System::Contnrs::TObjectList
{
	typedef System::Contnrs::TObjectList inherited;
	
public:
	ThbTapiLocation* operator[](int Index) { return Items[Index]; }
	
private:
	linetranslatecaps_tag *FTRANSLATECAPS;
	NativeUInt FLineAppl;
	unsigned FAPIVersion;
	bool FAvailable;
	unsigned FInitError;
	
protected:
	HIDESBASE ThbTapiLocation* __fastcall Get(int Index);
	HIDESBASE void __fastcall Put(int Index, ThbTapiLocation* Item);
	unsigned __fastcall Init(void)/* overload */;
	virtual unsigned __fastcall UpdateData(void);
	unsigned __fastcall Get_SystemLocationID(void);
	ThbTapiLocation* __fastcall Get_SystemLocation(void);
	
public:
	__fastcall ThbTapiLocationList(void);
	__fastcall virtual ~ThbTapiLocationList(void);
	unsigned __fastcall Init(NativeUInt LineAppl, unsigned APIVersion)/* overload */;
	void __fastcall Update(void);
	HIDESBASE int __fastcall IndexOf(const System::UnicodeString Value);
	int __fastcall IndexOfID(const unsigned Value);
	void __fastcall ShowDialog(HWND Wnd);
	virtual void __fastcall Clear(void);
	HIDESBASE int __fastcall Add(ThbTapiLocation* Item);
	__property bool Available = {read=FAvailable, nodefault};
	__property ThbTapiLocation* CurrentLocation = {read=Get_SystemLocation};
	__property unsigned CurrentLocationID = {read=Get_SystemLocationID, nodefault};
	__property unsigned InitError = {read=FInitError, nodefault};
	__property ThbTapiLocation* Items[int Index] = {read=Get, write=Put/*, default*/};
};

#pragma pack(pop)

//-- var, const, procedure ---------------------------------------------------
static const System::Word DEFAULT_REPLYTIMEOUT = System::Word(0xea60);
static const int LINEDEVSTATE_ALL = int(0x1ffffff);
static const System::Word LINEADDRESSSTATE_ALL = System::Word(0x1ff);
static const int PHONESTATE_ALL = int(0x8fffff);
static const System::Int8 PHONEBUTTONMODE_ALL = System::Int8(0x2f);
static const System::Int8 PHONEBUTTONSTATE_ALL = System::Int8(0xf);
static const System::Int8 TAPIREQUEST_UNKNOWN = System::Int8(0x0);
static const int TAPIREQUEST_LINE = int(0x1000000);
static const int TAPIREQUEST_PHONE = int(0x2000000);
static const int TAPIREQUEST_LINEACCEPT = int(0x1000001);
static const int TAPIREQUEST_LINEADDTOCONFERENCE = int(0x1000002);
static const int TAPIREQUEST_LINEANSWER = int(0x1000003);
static const int TAPIREQUEST_LINEBLINDTRANSFER = int(0x1000004);
static const int TAPIREQUEST_LINECOMPLETECALL = int(0x1000005);
static const int TAPIREQUEST_LINECOMPLETETRANSFER = int(0x1000006);
static const int TAPIREQUEST_LINEDEVSPECIFIC = int(0x1000007);
static const int TAPIREQUEST_LINEDEVSPECIFICFEATURE = int(0x1000008);
static const int TAPIREQUEST_LINEDIAL = int(0x1000009);
static const int TAPIREQUEST_LINEDROP = int(0x100000a);
static const int TAPIREQUEST_LINEFORWARD = int(0x100000b);
static const int TAPIREQUEST_LINEHANDOFF = int(0x100000c);
static const int TAPIREQUEST_LINEHOLD = int(0x100000d);
static const int TAPIREQUEST_LINEMAKECALL = int(0x100000e);
static const int TAPIREQUEST_LINEMONITORMEDIA = int(0x100000f);
static const int TAPIREQUEST_LINEPARK = int(0x1000010);
static const int TAPIREQUEST_LINEPREPAREADDTOCONFERENCE = int(0x1000011);
static const int TAPIREQUEST_LINEREDIRECT = int(0x1000012);
static const int TAPIREQUEST_LINEREMOVEFROMCONFERENCE = int(0x1000013);
static const int TAPIREQUEST_LINESETCALLDATA = int(0x1000014);
static const int TAPIREQUEST_LINESETUPCONFERENCE = int(0x1000015);
static const int TAPIREQUEST_LINESETUPTRANSFER = int(0x1000016);
static const int TAPIREQUEST_LINESWAPHOLD = int(0x1000017);
static const int TAPIREQUEST_LINEUNCOMPLETECALL = int(0x1000018);
static const int TAPIREQUEST_LINEUNHOLD = int(0x1000019);
static const int TAPIREQUEST_LINEUNPARK = int(0x100001a);
static const int TAPIREQUEST_LINEPICKUP = int(0x100001b);
static const int TAPIREQUEST_PHONESETDISPLAY = int(0x2000001);
static const int TAPIREQUEST_PHONESETGAIN = int(0x2000002);
static const int TAPIREQUEST_PHONESETHOOKSWITCH = int(0x2000003);
static const int TAPIREQUEST_PHONESETLAMP = int(0x2000004);
static const int TAPIREQUEST_PHONESETMICRO = int(0x2000005);
static const int TAPIREQUEST_PHONESETRING = int(0x2000006);
static const int TAPIREQUEST_PHONESETVOLUME = int(0x2000007);
static const int TAPIREQUEST_PHONEDEVSPECIFIC = int(0x2000008);
static const System::Int8 REQUEST_SHUTDOWN = System::Int8(0x1);
static const System::Int8 REQUEST_LINEDEALLOCATE = System::Int8(0x2);
static const System::Int8 REQUEST_LINEDROP = System::Int8(0x3);
extern DELPHI_PACKAGE ThbTapiApplication* hbTapiApplication;
extern DELPHI_PACKAGE bool __fastcall IsTapiError(unsigned ResultCode);
extern DELPHI_PACKAGE unsigned __fastcall CheckTapiResult(unsigned ResultCode);
extern DELPHI_PACKAGE System::UnicodeString __fastcall GetTapiBlockStr(void * Block, void * Fields, unsigned StringFormat = (unsigned)(0x0));
extern DELPHI_PACKAGE System::UnicodeString __fastcall TapiStrToAnsi(System::UnicodeString Value, unsigned Len, unsigned StringFormat);
extern DELPHI_PACKAGE System::UnicodeString __fastcall GetTapiErrorMessage(unsigned ErrorCode);
}	/* namespace Hbtapi */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_HBTAPI)
using namespace Hbtapi;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// HbtapiHPP
