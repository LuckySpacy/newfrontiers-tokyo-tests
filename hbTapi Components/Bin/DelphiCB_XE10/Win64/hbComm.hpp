// CodeGear C++Builder
// Copyright (c) 1995, 2015 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'hbComm.pas' rev: 30.00 (Windows)

#ifndef HbcommHPP
#define HbcommHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>
#include <SysInit.hpp>
#include <Winapi.Windows.hpp>
#include <Winapi.Messages.hpp>
#include <System.SysUtils.hpp>
#include <System.Classes.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Graphics.hpp>
#include <Vcl.Dialogs.hpp>
#include <hbTapiVer.hpp>
#include <System.UITypes.hpp>
#include <Vcl.Menus.hpp>

//-- user supplied -----------------------------------------------------------

namespace Hbcomm
{
//-- forward type declarations -----------------------------------------------
class DELPHICLASS EComPortError;
class DELPHICLASS ThbComPortOperation;
class DELPHICLASS ThbComPortOperationList;
class DELPHICLASS ThbComPortInputBuffer;
class DELPHICLASS ThbComPortOutputBuffer;
class DELPHICLASS ThbComPortProperties;
class DELPHICLASS ThbComPortStatus;
class DELPHICLASS ThbComPortTimeouts;
class DELPHICLASS ThbComPortReadThread;
class DELPHICLASS ThbComPortWriteThread;
class DELPHICLASS ThbComPortEventChars;
class DELPHICLASS ThbComPortFlowControl;
class DELPHICLASS ThbComPortOptions;
class DELPHICLASS ThbCustomComPort;
class DELPHICLASS ThbComPort;
class DELPHICLASS ThbComPortStatusLED;
//-- type declarations -------------------------------------------------------
class PASCALIMPLEMENTATION EComPortError : public System::Sysutils::Exception
{
	typedef System::Sysutils::Exception inherited;
	
public:
	int ErrorCode;
public:
	/* Exception.Create */ inline __fastcall EComPortError(const System::UnicodeString Msg) : System::Sysutils::Exception(Msg) { }
	/* Exception.CreateFmt */ inline __fastcall EComPortError(const System::UnicodeString Msg, System::TVarRec const *Args, const int Args_High) : System::Sysutils::Exception(Msg, Args, Args_High) { }
	/* Exception.CreateRes */ inline __fastcall EComPortError(NativeUInt Ident)/* overload */ : System::Sysutils::Exception(Ident) { }
	/* Exception.CreateRes */ inline __fastcall EComPortError(System::PResStringRec ResStringRec)/* overload */ : System::Sysutils::Exception(ResStringRec) { }
	/* Exception.CreateResFmt */ inline __fastcall EComPortError(NativeUInt Ident, System::TVarRec const *Args, const int Args_High)/* overload */ : System::Sysutils::Exception(Ident, Args, Args_High) { }
	/* Exception.CreateResFmt */ inline __fastcall EComPortError(System::PResStringRec ResStringRec, System::TVarRec const *Args, const int Args_High)/* overload */ : System::Sysutils::Exception(ResStringRec, Args, Args_High) { }
	/* Exception.CreateHelp */ inline __fastcall EComPortError(const System::UnicodeString Msg, int AHelpContext) : System::Sysutils::Exception(Msg, AHelpContext) { }
	/* Exception.CreateFmtHelp */ inline __fastcall EComPortError(const System::UnicodeString Msg, System::TVarRec const *Args, const int Args_High, int AHelpContext) : System::Sysutils::Exception(Msg, Args, Args_High, AHelpContext) { }
	/* Exception.CreateResHelp */ inline __fastcall EComPortError(NativeUInt Ident, int AHelpContext)/* overload */ : System::Sysutils::Exception(Ident, AHelpContext) { }
	/* Exception.CreateResHelp */ inline __fastcall EComPortError(System::PResStringRec ResStringRec, int AHelpContext)/* overload */ : System::Sysutils::Exception(ResStringRec, AHelpContext) { }
	/* Exception.CreateResFmtHelp */ inline __fastcall EComPortError(System::PResStringRec ResStringRec, System::TVarRec const *Args, const int Args_High, int AHelpContext)/* overload */ : System::Sysutils::Exception(ResStringRec, Args, Args_High, AHelpContext) { }
	/* Exception.CreateResFmtHelp */ inline __fastcall EComPortError(NativeUInt Ident, System::TVarRec const *Args, const int Args_High, int AHelpContext)/* overload */ : System::Sysutils::Exception(Ident, Args, Args_High, AHelpContext) { }
	/* Exception.Destroy */ inline __fastcall virtual ~EComPortError(void) { }
	
};


_DECLARE_METACLASS(System::TMetaClass, TComPortErrorClass);

typedef void __fastcall (__closure *TCommErrorEvent)(System::TObject* Sender, unsigned Errors);

typedef void __fastcall (__closure *TCommEvent)(System::TObject* Sender, unsigned Events);

typedef void __fastcall (__closure *TComPortDataEvent)(System::TObject* Sender, System::WideChar * Buffer, int BufferSize);

typedef void __fastcall (__closure *TComPortCountEvent)(System::TObject* Sender, int Count);

class PASCALIMPLEMENTATION ThbComPortOperation : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	_OVERLAPPED FOverlapped;
	unsigned FCount;
	void *FBuffer;
	
public:
	__fastcall ThbComPortOperation(void);
	__fastcall virtual ~ThbComPortOperation(void);
	__property _OVERLAPPED Overlapped = {read=FOverlapped, write=FOverlapped};
	__property unsigned Count = {read=FCount, write=FCount, nodefault};
};


class PASCALIMPLEMENTATION ThbComPortOperationList : public System::Classes::TList
{
	typedef System::Classes::TList inherited;
	
public:
	ThbComPortOperation* operator[](int Index) { return Items[Index]; }
	
private:
	ThbCustomComPort* FComPort;
	NativeUInt FMutex;
	
protected:
	HIDESBASE ThbComPortOperation* __fastcall Get(int Index);
	HIDESBASE void __fastcall Put(int Index, ThbComPortOperation* Item);
	
public:
	__fastcall ThbComPortOperationList(ThbCustomComPort* AOwner);
	__fastcall virtual ~ThbComPortOperationList(void);
	bool __fastcall Acquire(unsigned Timeout = (unsigned)(0xffffffff));
	virtual void __fastcall Clear(void);
	HIDESBASE void __fastcall Delete(int Index);
	void __fastcall Release(void);
	__property ThbComPortOperation* Items[int Index] = {read=Get, write=Put/*, default*/};
};


class PASCALIMPLEMENTATION ThbComPortInputBuffer : public System::Classes::TPersistent
{
	typedef System::Classes::TPersistent inherited;
	
private:
	ThbCustomComPort* FComPort;
	NativeUInt FMutex;
	unsigned FSize;
	unsigned FSuspendLimit;
	unsigned FResumeLimit;
	
protected:
	unsigned __fastcall Get_Count(void);
	unsigned __fastcall Get_Size(void);
	void __fastcall Set_Size(unsigned Value);
	unsigned __fastcall Get_SuspendCount(void);
	void __fastcall Set_SuspendCount(unsigned Value);
	unsigned __fastcall Get_ResumeCount(void);
	void __fastcall Set_ResumeCount(unsigned Value);
	
public:
	__fastcall ThbComPortInputBuffer(ThbCustomComPort* AOwner);
	__fastcall virtual ~ThbComPortInputBuffer(void);
	void __fastcall Clear(void);
	__property unsigned Count = {read=Get_Count, nodefault};
	
__published:
	__property unsigned Size = {read=Get_Size, write=Set_Size, default=4096};
	__property unsigned SuspendCount = {read=Get_SuspendCount, write=Set_SuspendCount, default=3072};
	__property unsigned ResumeCount = {read=Get_ResumeCount, write=Set_ResumeCount, default=1024};
};


class PASCALIMPLEMENTATION ThbComPortOutputBuffer : public System::Classes::TPersistent
{
	typedef System::Classes::TPersistent inherited;
	
private:
	ThbCustomComPort* FComPort;
	unsigned FSize;
	
protected:
	unsigned __fastcall Get_Count(void);
	unsigned __fastcall Get_Size(void);
	void __fastcall Set_Size(unsigned Value);
	
public:
	__fastcall ThbComPortOutputBuffer(ThbCustomComPort* AOwner);
	__fastcall virtual ~ThbComPortOutputBuffer(void);
	void __fastcall Clear(void);
	__property unsigned Count = {read=Get_Count, nodefault};
	
__published:
	__property unsigned Size = {read=Get_Size, write=Set_Size, default=4096};
};


class PASCALIMPLEMENTATION ThbComPortProperties : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	ThbCustomComPort* FComPort;
	_COMMPROP *FProps;
	
protected:
	virtual bool __fastcall Get_Available(void);
	virtual Winapi::Windows::PCommProp __fastcall Get_COMMPROP(void);
	virtual System::Word __fastcall Get_WORD(int index);
	virtual unsigned __fastcall Get_DWORD(int index);
	bool __fastcall UpdateData(void);
	
public:
	__property Winapi::Windows::PCommProp COMMPROP = {read=Get_COMMPROP};
	__fastcall ThbComPortProperties(ThbCustomComPort* AOwner);
	__fastcall virtual ~ThbComPortProperties(void);
	virtual void __fastcall Update(void);
	virtual void __fastcall Invalidate(void);
	__property bool Available = {read=Get_Available, nodefault};
	__property System::Word PacketLength = {read=Get_WORD, index=0, nodefault};
	__property System::Word PacketVersion = {read=Get_WORD, index=1, nodefault};
	__property System::Word SettableData = {read=Get_WORD, index=2, nodefault};
	__property System::Word SettableStopParity = {read=Get_WORD, index=3, nodefault};
	__property unsigned ServiceMask = {read=Get_DWORD, index=0, nodefault};
	__property unsigned Reserved1 = {read=Get_DWORD, index=1, nodefault};
	__property unsigned MaxTxQueue = {read=Get_DWORD, index=2, nodefault};
	__property unsigned MaxRxQueue = {read=Get_DWORD, index=3, nodefault};
	__property unsigned MaxBaud = {read=Get_DWORD, index=4, nodefault};
	__property unsigned ProvSubType = {read=Get_DWORD, index=5, nodefault};
	__property unsigned ProvCapabilities = {read=Get_DWORD, index=6, nodefault};
	__property unsigned SettableParams = {read=Get_DWORD, index=7, nodefault};
	__property unsigned SettableBaud = {read=Get_DWORD, index=8, nodefault};
	__property unsigned CurrentTxQueue = {read=Get_DWORD, index=9, nodefault};
	__property unsigned CurrentRxQueue = {read=Get_DWORD, index=10, nodefault};
	__property unsigned ProvSpec1 = {read=Get_DWORD, index=11, nodefault};
	__property unsigned ProvSpec2 = {read=Get_DWORD, index=12, nodefault};
};


class PASCALIMPLEMENTATION ThbComPortStatus : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	ThbCustomComPort* FComPort;
	_COMSTAT *FStat;
	unsigned FErrors;
	
protected:
	virtual bool __fastcall Get_Available(void);
	virtual Winapi::Windows::PComStat __fastcall Get_COMSTAT(void);
	virtual unsigned __fastcall Get_DWORD(int index);
	virtual Winapi::Windows::TComStateFlags __fastcall Get_Flags(void);
	bool __fastcall UpdateData(void);
	
public:
	__fastcall ThbComPortStatus(ThbCustomComPort* AOwner);
	__fastcall virtual ~ThbComPortStatus(void);
	virtual void __fastcall Update(void);
	void __fastcall Invalidate(void);
	__property bool Available = {read=Get_Available, nodefault};
	__property Winapi::Windows::TComStateFlags Flags = {read=Get_Flags, nodefault};
	__property unsigned cbInQue = {read=Get_DWORD, index=0, nodefault};
	__property unsigned cbOutQue = {read=Get_DWORD, index=1, nodefault};
	__property unsigned Errors = {read=FErrors, write=FErrors, nodefault};
};


class PASCALIMPLEMENTATION ThbComPortTimeouts : public System::Classes::TPersistent
{
	typedef System::Classes::TPersistent inherited;
	
private:
	ThbCustomComPort* FComPort;
	_COMMTIMEOUTS *FTimeouts;
	bool FEnabled;
	unsigned FReadIntervalTimeout;
	unsigned FReadTotalTimeoutMultiplier;
	unsigned FReadTotalTimeoutConstant;
	unsigned FWriteTotalTimeoutMultiplier;
	unsigned FWriteTotalTimeoutConstant;
	
protected:
	virtual bool __fastcall Get_Available(void);
	void __fastcall Set_Enabled(bool value);
	virtual Winapi::Windows::PCommTimeouts __fastcall Get_COMMTIMEOUTS(void);
	virtual unsigned __fastcall Get_DWORD(int Index);
	virtual void __fastcall Set_DWORD(int Index, unsigned Value);
	bool __fastcall UpdateData(void);
	void __fastcall Apply(void);
	
public:
	__fastcall ThbComPortTimeouts(ThbCustomComPort* AOwner);
	virtual void __fastcall Invalidate(void);
	__property Winapi::Windows::PCommTimeouts COMMTIMEOUTS = {read=Get_COMMTIMEOUTS};
	
__published:
	__property bool Enabled = {read=FEnabled, write=Set_Enabled, nodefault};
	__property unsigned ReadIntervalTimeout = {read=Get_DWORD, write=Set_DWORD, index=0, nodefault};
	__property unsigned ReadTotalTimeoutMultiplier = {read=Get_DWORD, write=Set_DWORD, index=1, nodefault};
	__property unsigned ReadTotalTimeoutConstant = {read=Get_DWORD, write=Set_DWORD, index=2, nodefault};
	__property unsigned WriteTotalTimeoutMultiplier = {read=Get_DWORD, write=Set_DWORD, index=3, nodefault};
	__property unsigned WriteTotalTimeoutConstant = {read=Get_DWORD, write=Set_DWORD, index=4, nodefault};
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~ThbComPortTimeouts(void) { }
	
};


class PASCALIMPLEMENTATION ThbComPortReadThread : public System::Classes::TThread
{
	typedef System::Classes::TThread inherited;
	
private:
	NativeUInt FStopEvent;
	NativeUInt FWindowHandle;
	NativeUInt FPortHandle;
	
protected:
	virtual void __fastcall Execute(void);
	HIDESBASE void __fastcall Terminate(void);
	void __fastcall ProcessCommEvent(unsigned EventMask);
	
public:
	__fastcall ThbComPortReadThread(NativeUInt WindowHandle, NativeUInt PortHandle, unsigned Events);
public:
	/* TThread.Destroy */ inline __fastcall virtual ~ThbComPortReadThread(void) { }
	
};


class PASCALIMPLEMENTATION ThbComPortWriteThread : public System::Classes::TThread
{
	typedef System::Classes::TThread inherited;
	
private:
	NativeUInt FStopEvent;
	NativeUInt FWakeupEvent;
	ThbCustomComPort* FComPort;
	
protected:
	virtual void __fastcall Execute(void);
	HIDESBASE void __fastcall Terminate(void);
	void __fastcall Trigger_Timeout(int Value);
	
public:
	__fastcall ThbComPortWriteThread(ThbCustomComPort* AOwner);
	__fastcall virtual ~ThbComPortWriteThread(void);
	void __fastcall WakeUp(void);
};


class PASCALIMPLEMENTATION ThbComPortEventChars : public System::Classes::TPersistent
{
	typedef System::Classes::TPersistent inherited;
	
private:
	ThbCustomComPort* FOwner;
	System::WideChar FXonChar;
	System::WideChar FXoffChar;
	System::WideChar FErrorChar;
	System::WideChar FEofChar;
	System::WideChar FEvtChar;
	void __fastcall SetEventChar(int Index, System::WideChar Value);
	
public:
	__fastcall ThbComPortEventChars(ThbCustomComPort* Owner);
	virtual void __fastcall Assign(System::Classes::TPersistent* Source);
	
__published:
	__property System::WideChar XonChar = {read=FXonChar, write=SetEventChar, index=1, default=17};
	__property System::WideChar XoffChar = {read=FXoffChar, write=SetEventChar, index=2, default=19};
	__property System::WideChar ErrorChar = {read=FErrorChar, write=SetEventChar, index=3, default=0};
	__property System::WideChar EofChar = {read=FEofChar, write=SetEventChar, index=4, default=0};
	__property System::WideChar EvtChar = {read=FEvtChar, write=SetEventChar, index=5, default=0};
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~ThbComPortEventChars(void) { }
	
};


class PASCALIMPLEMENTATION ThbComPortFlowControl : public System::Classes::TPersistent
{
	typedef System::Classes::TPersistent inherited;
	
private:
	ThbCustomComPort* FComPort;
	unsigned FHandshake;
	bool FDSRSensitivity;
	bool FTxContinueOnXoff;
	char FXonChar;
	char FXoffChar;
	void __fastcall SetDSRSensitivity(const bool Value);
	void __fastcall SetTxContinueOnXoff(const bool Value);
	void __fastcall SetXonChar(const char Value);
	void __fastcall SetXoffChar(const char Value);
	void __fastcall Set_Handshake(unsigned Value);
	
protected:
	virtual void __fastcall AssignTo(System::Classes::TPersistent* Dest);
	
public:
	__fastcall ThbComPortFlowControl(ThbCustomComPort* AOwner);
	__property ThbCustomComPort* ComPort = {read=FComPort};
	
__published:
	__property unsigned Handshake = {read=FHandshake, write=Set_Handshake, default=0};
	__property bool DSRSensitivity = {read=FDSRSensitivity, write=SetDSRSensitivity, default=0};
	__property bool TxContinueOnXoff = {read=FTxContinueOnXoff, write=SetTxContinueOnXoff, default=0};
	__property char XonChar = {read=FXonChar, write=SetXonChar, default=17};
	__property char XoffChar = {read=FXoffChar, write=SetXoffChar, default=19};
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~ThbComPortFlowControl(void) { }
	
};


class PASCALIMPLEMENTATION ThbComPortOptions : public System::Classes::TPersistent
{
	typedef System::Classes::TPersistent inherited;
	
private:
	ThbCustomComPort* FComPort;
	char FErrorChar;
	bool FErrorReplace;
	bool FNullStrip;
	char FEofChar;
	char FEvtChar;
	bool FSyncMode;
	
protected:
	virtual void __fastcall AssignTo(System::Classes::TPersistent* Dest);
	void __fastcall Set_ErrorChar(char Value);
	void __fastcall Set_EofChar(char Value);
	void __fastcall Set_EvtChar(char Value);
	void __fastcall Set_ErrorReplace(bool Value);
	void __fastcall Set_NullStrip(bool Value);
	
public:
	__fastcall ThbComPortOptions(ThbCustomComPort* AOwner);
	
__published:
	__property char ErrorChar = {read=FErrorChar, write=Set_ErrorChar, default=0};
	__property bool ErrorReplace = {read=FErrorReplace, write=Set_ErrorReplace, default=0};
	__property char EofChar = {read=FEofChar, write=Set_EofChar, default=0};
	__property char EvtChar = {read=FEvtChar, write=Set_EvtChar, default=0};
	__property bool NullStrip = {read=FNullStrip, write=Set_NullStrip, default=0};
	__property bool SyncMode = {read=FSyncMode, write=FSyncMode, default=0};
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~ThbComPortOptions(void) { }
	
};


class PASCALIMPLEMENTATION ThbCustomComPort : public System::Classes::TComponent
{
	typedef System::Classes::TComponent inherited;
	
private:
	Hbtapiver::ThbTapiComponentsAbout FAbout;
	NativeUInt FHandle;
	NativeUInt FWindowHandle;
	_DCB FDCB;
	unsigned FComEvents;
	unsigned FBaudrate;
	System::Word FParity;
	System::Byte FStopbits;
	System::Byte FDatabits;
	System::Classes::TList* FTriggerList;
	ThbComPortOutputBuffer* FOutBuffer;
	ThbComPortInputBuffer* FInBuffer;
	ThbComPortProperties* FProperties;
	ThbComPortStatus* FStatus;
	ThbComPortTimeouts* FTimeouts;
	ThbComPortFlowControl* FFlowControl;
	ThbComPortReadThread* FReadThread;
	ThbComPortWriteThread* FWriteThread;
	ThbComPortOptions* FOptions;
	bool FActive;
	bool FIsActive;
	System::Classes::TStringList* FPortList;
	ThbComPortOperationList* FWriteOpList;
	System::UnicodeString FPortName;
	bool FDTR;
	bool FRTS;
	bool FBreakSet;
	bool FBreakRcvd;
	bool FDirectMode;
	System::Classes::TNotifyEvent FOnActivate;
	System::Classes::TNotifyEvent FOnDeactivate;
	TCommEvent FOnCommEvent;
	System::Classes::TNotifyEvent FOnBreak;
	System::Classes::TNotifyEvent FOnCts;
	System::Classes::TNotifyEvent FOnDsr;
	TCommErrorEvent FOnCommError;
	System::Classes::TNotifyEvent FOnRing;
	System::Classes::TNotifyEvent FOnDCD;
	TComPortDataEvent FOnData;
	TComPortCountEvent FOnReceive;
	TComPortCountEvent FOnSendTimeout;
	System::Classes::TNotifyEvent FOnTxEmpty;
	
protected:
	virtual void __fastcall ApplyActivate(void);
	void __fastcall ApplyBuffer(void);
	void __fastcall CheckNotOpen(void);
	void __fastcall CheckOpen(void);
	void __fastcall CheckDirectMode(void);
	virtual NativeUInt __fastcall CreateHandle(void);
	void __fastcall DestroyHandle(void);
	void __fastcall PurgeInQueue(void);
	void __fastcall PurgeOutQueue(void);
	void __fastcall EscapeComm(int Flag);
	bool __fastcall Get_Active(void);
	bool __fastcall Get_Break(void);
	bool __fastcall Get_ModemState(int Index);
	bool __fastcall Get_ComState(int Index);
	virtual Winapi::Windows::PCommProp __fastcall Get_COMMPROP(void);
	virtual Winapi::Windows::PComStat __fastcall Get_COMSTAT(void);
	virtual System::Classes::TStrings* __fastcall Get_Ports(void);
	void __fastcall HandleCommEvents(unsigned Events);
	bool __fastcall QueryDCB(_DCB &aDCB);
	void __fastcall InitDCB(_DCB &aDCB);
	bool __fastcall IsActive(void);
	bool __fastcall IsDestroying(void);
	void __fastcall Set_Active(bool value);
	void __fastcall Set_Baud(unsigned Value);
	void __fastcall Set_CommEvents(unsigned Value);
	void __fastcall Set_Databits(System::Byte Value);
	virtual void __fastcall Set_Handle(const NativeUInt Value);
	void __fastcall Set_ModemState(int Index, bool value);
	void __fastcall Set_Options(ThbComPortOptions* Value);
	void __fastcall Set_Parity(System::Word Value);
	virtual void __fastcall Set_PortName(System::UnicodeString Value);
	void __fastcall Set_Stopbits(System::Byte Value);
	void __fastcall Set_DTRState(bool State);
	void __fastcall Set_RTSState(bool State);
	void __fastcall Set_BREAKState(bool State);
	void __fastcall Set_XONState(bool State);
	System::UnicodeString __fastcall Get_Settings(void);
	void __fastcall Set_Settings(const System::UnicodeString value);
	void __fastcall ApplySettings(void);
	void __fastcall RetrieveSettings(void);
	virtual void __fastcall UpdatePorts(void);
	void __fastcall WindowProc(Winapi::Messages::TMessage &Message);
	void __fastcall TriggerLinks(unsigned EventMask);
	void __fastcall Trigger_TxEmpty(void);
	virtual void __fastcall Trigger_SendTimeout(int Value);
	virtual void __fastcall Trigger_Active(bool Value);
	virtual void __fastcall Trigger_Break(bool Value);
	virtual void __fastcall Trigger_CTS(bool Value);
	virtual void __fastcall Trigger_DCD(bool Value);
	virtual void __fastcall Trigger_DSR(bool Value);
	virtual void __fastcall Trigger_Ring(bool Value);
	virtual void __fastcall Trigger_CommEvent(unsigned Event);
	virtual void __fastcall Trigger_Receive(int Count);
	virtual void __fastcall Trigger_Errors(unsigned Errors);
	__property bool Active = {read=Get_Active, write=Set_Active, nodefault};
	__property unsigned Baudrate = {read=FBaudrate, write=Set_Baud, default=9600};
	__property ThbComPortOutputBuffer* OutBuffer = {read=FOutBuffer, write=FOutBuffer};
	__property ThbComPortInputBuffer* InBuffer = {read=FInBuffer, write=FInBuffer};
	__property System::Byte Databits = {read=FDatabits, write=Set_Databits, default=8};
	__property unsigned CommEvents = {read=FComEvents, write=Set_CommEvents, default=511};
	__property Winapi::Windows::PCommProp COMMPROP = {read=Get_COMMPROP};
	__property Winapi::Windows::PComStat COMSTAT = {read=Get_COMSTAT};
	__property ThbComPortOptions* Options = {read=FOptions, write=Set_Options};
	__property System::Word Parity = {read=FParity, write=Set_Parity, nodefault};
	__property System::UnicodeString PortName = {read=FPortName, write=Set_PortName};
	__property System::Classes::TStrings* PortList = {read=Get_Ports};
	__property System::Byte Stopbits = {read=FStopbits, write=Set_Stopbits, default=0};
	__property System::UnicodeString Settings = {read=Get_Settings, write=Set_Settings};
	__property System::Classes::TNotifyEvent OnActivate = {read=FOnActivate, write=FOnActivate};
	__property System::Classes::TNotifyEvent OnDeactivate = {read=FOnDeactivate, write=FOnDeactivate};
	__property TCommEvent OnEvent = {read=FOnCommEvent, write=FOnCommEvent};
	__property TCommErrorEvent OnError = {read=FOnCommError, write=FOnCommError};
	__property System::Classes::TNotifyEvent OnBreak = {read=FOnBreak, write=FOnBreak};
	__property System::Classes::TNotifyEvent OnCts = {read=FOnCts, write=FOnCts};
	__property System::Classes::TNotifyEvent OnDsr = {read=FOnDsr, write=FOnDsr};
	__property System::Classes::TNotifyEvent OnRing = {read=FOnRing, write=FOnRing};
	__property System::Classes::TNotifyEvent OnDcd = {read=FOnDCD, write=FOnDCD};
	__property TComPortDataEvent OnData = {read=FOnData, write=FOnData};
	__property TComPortCountEvent OnReceive = {read=FOnReceive, write=FOnReceive};
	__property TComPortCountEvent OnTimeout = {read=FOnSendTimeout, write=FOnSendTimeout};
	__property System::Classes::TNotifyEvent OnTxEmpty = {read=FOnTxEmpty, write=FOnTxEmpty};
	__property ThbComPortProperties* Props = {read=FProperties};
	__property ThbComPortStatus* Status = {read=FStatus};
	__property ThbComPortTimeouts* Timeouts = {read=FTimeouts, write=FTimeouts};
	__property ThbComPortFlowControl* FlowCtrl = {read=FFlowControl, write=FFlowControl};
	__property bool CTS = {read=Get_ModemState, index=1, nodefault};
	__property bool DSR = {read=Get_ModemState, index=2, nodefault};
	__property bool RING = {read=Get_ModemState, index=3, nodefault};
	__property bool DCD = {read=Get_ModemState, index=4, nodefault};
	__property bool Break = {read=Get_Break, nodefault};
	__property bool DTR = {read=Get_ModemState, write=Set_ModemState, index=5, nodefault};
	__property bool RTS = {read=Get_ModemState, write=Set_ModemState, index=6, nodefault};
	__property bool CtsHold = {read=Get_ComState, index=1, nodefault};
	__property bool DsrHold = {read=Get_ComState, index=2, nodefault};
	__property bool RlsdHold = {read=Get_ComState, index=3, nodefault};
	__property bool XoffHold = {read=Get_ComState, index=4, nodefault};
	__property bool XOffSent = {read=Get_ComState, index=5, nodefault};
	__property NativeUInt Handle = {read=FHandle, write=Set_Handle};
	
public:
	__fastcall virtual ThbCustomComPort(System::Classes::TComponent* AOwner);
	__fastcall virtual ~ThbCustomComPort(void);
	virtual void __fastcall Loaded(void);
	virtual void __fastcall Open(void);
	virtual void __fastcall Close(void);
	void __fastcall AddTrigger(System::TObject* Receiver, TCommEvent EventProc, unsigned EventMask);
	void __fastcall RemoveTrigger(System::TObject* Receiver);
	unsigned __fastcall InCount(void);
	unsigned __fastcall OutCount(void);
	void __fastcall Write(const void *Buffer, int BufferSize);
	void __fastcall WriteStr(const System::UnicodeString Value);
	void __fastcall WriteAnsiStr(const System::AnsiString Value);
	void __fastcall SendBreak(int Duration);
	int __fastcall Read(void *Buffer, int BufferSize);
	System::UnicodeString __fastcall ReadStr(void)/* overload */;
	System::UnicodeString __fastcall ReadStr(int Count)/* overload */;
	System::AnsiString __fastcall ReadAnsiStr(void)/* overload */;
	System::AnsiString __fastcall ReadAnsiStr(int Count)/* overload */;
	
__published:
	__property Hbtapiver::ThbTapiComponentsAbout About = {read=FAbout, write=FAbout, stored=false, nodefault};
};


class PASCALIMPLEMENTATION ThbComPort : public ThbCustomComPort
{
	typedef ThbCustomComPort inherited;
	
public:
	__property CommEvents = {default=511};
	__property Handle;
	__property PortList;
	__property Props;
	__property Settings = {default=0};
	__property Status;
	__property COMMPROP;
	__property COMSTAT;
	
__published:
	__property Active;
	__property Baudrate = {default=9600};
	__property Break;
	__property CTS;
	__property Databits = {default=8};
	__property DCD;
	__property DSR;
	__property DTR;
	__property FlowCtrl;
	__property Options;
	__property OutBuffer;
	__property InBuffer;
	__property Parity;
	__property PortName = {default=0};
	__property RING;
	__property RTS;
	__property Stopbits = {default=0};
	__property Timeouts;
	__property OnActivate;
	__property OnDeactivate;
	__property OnEvent;
	__property OnError;
	__property OnBreak;
	__property OnCts;
	__property OnDsr;
	__property OnRing;
	__property OnDcd;
	__property OnData;
	__property OnReceive;
	__property OnTxEmpty;
	__property OnTimeout;
public:
	/* ThbCustomComPort.Create */ inline __fastcall virtual ThbComPort(System::Classes::TComponent* AOwner) : ThbCustomComPort(AOwner) { }
	/* ThbCustomComPort.Destroy */ inline __fastcall virtual ~ThbComPort(void) { }
	
};


class PASCALIMPLEMENTATION ThbComPortStatusLED : public Vcl::Controls::TGraphicControl
{
	typedef Vcl::Controls::TGraphicControl inherited;
	
private:
	Hbtapiver::ThbTapiComponentsAbout FAbout;
	bool FActive;
	ThbComPort* FComPort;
	unsigned FSignal;
	Vcl::Extctrls::TTimer* FTimer;
	Vcl::Graphics::TPicture* FPictureOff;
	Vcl::Graphics::TPicture* FPictureOn;
	bool FStretch;
	bool FCenter;
	bool FTransparent;
	bool FDrawing;
	System::Classes::TNotifyEvent FOnChange;
	
protected:
	Vcl::Graphics::TCanvas* __fastcall GetCanvas(void);
	Vcl::Graphics::TPicture* __fastcall Picture(void);
	void __fastcall PictureChanged(System::TObject* Sender);
	void __fastcall SetActive(bool Value);
	void __fastcall SetCenter(bool Value);
	void __fastcall SetStretch(bool Value);
	void __fastcall SetTransparent(bool Value);
	void __fastcall SetPictureOff(Vcl::Graphics::TPicture* Value);
	void __fastcall SetPictureOn(Vcl::Graphics::TPicture* Value);
	void __fastcall SetPicture(bool Index, Vcl::Graphics::TPicture* const Value);
	void __fastcall SetPort(ThbComPort* Value);
	void __fastcall SetSignal(unsigned Value);
	void __fastcall InitStatus(void);
	void __fastcall UpdateStatus(unsigned EventMask);
	void __fastcall Trigger_Change(void);
	void __fastcall RemoveTrigger(void);
	void __fastcall SetTrigger(void);
	void __fastcall OnComEvent(System::TObject* Sender, unsigned Event);
	void __fastcall OnTimer(System::TObject* Sender);
	virtual void __fastcall Loaded(void);
	void __fastcall Init(void);
	virtual bool __fastcall CanAutoSize(int &NewWidth, int &NewHeight);
	System::Types::TRect __fastcall DestRect(void);
	bool __fastcall DoPaletteChange(void);
	DYNAMIC HPALETTE __fastcall GetPalette(void);
	virtual void __fastcall Paint(void);
	virtual void __fastcall Notification(System::Classes::TComponent* AComponent, System::Classes::TOperation Operation);
	
public:
	__fastcall virtual ThbComPortStatusLED(System::Classes::TComponent* AOwner);
	__fastcall virtual ~ThbComPortStatusLED(void);
	__property Vcl::Graphics::TCanvas* Canvas = {read=GetCanvas};
	__property bool Active = {read=FActive, nodefault};
	
__published:
	__property Hbtapiver::ThbTapiComponentsAbout About = {read=FAbout, write=FAbout, stored=false, nodefault};
	__property Align = {default=0};
	__property Anchors = {default=3};
	__property AutoSize = {default=0};
	__property bool Center = {read=FCenter, write=SetCenter, default=0};
	__property ThbComPort* ComPort = {read=FComPort, write=SetPort};
	__property Constraints;
	__property DragCursor = {default=-12};
	__property DragKind = {default=0};
	__property DragMode = {default=0};
	__property Enabled = {default=1};
	__property ParentShowHint = {default=1};
	__property Vcl::Graphics::TPicture* PictureOff = {read=FPictureOff, write=SetPictureOff};
	__property Vcl::Graphics::TPicture* PictureOn = {read=FPictureOn, write=SetPictureOn};
	__property PopupMenu;
	__property ShowHint;
	__property unsigned Signal = {read=FSignal, write=SetSignal, nodefault};
	__property bool Stretch = {read=FStretch, write=SetStretch, default=0};
	__property bool Transparent = {read=FTransparent, write=SetTransparent, default=0};
	__property Visible = {default=1};
	__property System::Classes::TNotifyEvent OnChange = {read=FOnChange, write=FOnChange};
	__property OnClick;
	__property OnDblClick;
	__property OnDragDrop;
	__property OnDragOver;
	__property OnEndDock;
	__property OnEndDrag;
	__property OnMouseDown;
	__property OnMouseMove;
	__property OnMouseUp;
	__property OnStartDock;
	__property OnStartDrag;
};


//-- var, const, procedure ---------------------------------------------------
static const int EV_TXCHAR = int(0x10000000);
static const int EV_DTR = int(0x20000000);
static const int EV_RTS = int(0x40000000);
static const System::Int8 COMPORTHANDSHAKE_NONE = System::Int8(0x0);
static const System::Int8 COMPORTHANDSHAKE_XONXOFF = System::Int8(0x1);
static const System::Int8 COMPORTHANDSHAKE_RTSCTS = System::Int8(0x2);
static const System::Int8 COMPORTHANDSHAKE_RTSCTS_TOGGLE = System::Int8(0x4);
static const System::Int8 COMPORTHANDSHAKE_DTRDSR = System::Int8(0x8);
static const System::Int8 COMPORTSIGNAL_NONE = System::Int8(0x0);
static const System::Int8 COMPORTSIGNAL_DTR = System::Int8(0x1);
static const System::Int8 COMPORTSIGNAL_DSR = System::Int8(0x2);
static const System::Int8 COMPORTSIGNAL_RTS = System::Int8(0x4);
static const System::Int8 COMPORTSIGNAL_CTS = System::Int8(0x8);
static const System::Int8 COMPORTSIGNAL_RING = System::Int8(0x10);
static const System::Int8 COMPORTSIGNAL_DCD = System::Int8(0x20);
static const System::Int8 COMPORTSIGNAL_TXD = System::Int8(0x40);
static const System::Byte COMPORTSIGNAL_RXD = System::Byte(0x80);
static const System::Word COMEVENTS_ALL = System::Word(0x1ff);
static const System::Word DEFAULT_READBUFFERSIZE = System::Word(0x1000);
static const System::Word DEFAULT_WRITEBUFFERSIZE = System::Word(0x1000);
static const int DEFAULT_READTIMEOUT = int(-1);
static const int DEFAULT_WRITETIMEOUT = int(-1);
}	/* namespace Hbcomm */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_HBCOMM)
using namespace Hbcomm;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// HbcommHPP
