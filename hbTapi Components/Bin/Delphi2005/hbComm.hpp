// Borland C++ Builder
// Copyright (c) 1995, 2004 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Hbcomm.pas' rev: 6.00

#ifndef HbcommHPP
#define HbcommHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Menus.hpp>	// Pascal unit
#include <Hbtapiver.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Extctrls.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Sysutils.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <Sysinit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Hbcomm
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS EComPortError;
class PASCALIMPLEMENTATION EComPortError : public Sysutils::Exception 
{
	typedef Sysutils::Exception inherited;
	
public:
	int ErrorCode;
public:
	#pragma option push -w-inl
	/* Exception.Create */ inline __fastcall EComPortError(const AnsiString Msg) : Sysutils::Exception(Msg) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateFmt */ inline __fastcall EComPortError(const AnsiString Msg, const System::TVarRec * Args, const int Args_Size) : Sysutils::Exception(Msg, Args, Args_Size) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateRes */ inline __fastcall EComPortError(int Ident)/* overload */ : Sysutils::Exception(Ident) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResFmt */ inline __fastcall EComPortError(int Ident, const System::TVarRec * Args, const int Args_Size)/* overload */ : Sysutils::Exception(Ident, Args, Args_Size) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateHelp */ inline __fastcall EComPortError(const AnsiString Msg, int AHelpContext) : Sysutils::Exception(Msg, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateFmtHelp */ inline __fastcall EComPortError(const AnsiString Msg, const System::TVarRec * Args, const int Args_Size, int AHelpContext) : Sysutils::Exception(Msg, Args, Args_Size, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResHelp */ inline __fastcall EComPortError(int Ident, int AHelpContext)/* overload */ : Sysutils::Exception(Ident, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResFmtHelp */ inline __fastcall EComPortError(System::PResStringRec ResStringRec, const System::TVarRec * Args, const int Args_Size, int AHelpContext)/* overload */ : Sysutils::Exception(ResStringRec, Args, Args_Size, AHelpContext) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~EComPortError(void) { }
	#pragma option pop
	
};


typedef TMetaClass* TComPortErrorClass;

typedef void __fastcall (__closure *TCommErrorEvent)(System::TObject* Sender, unsigned Errors);

typedef void __fastcall (__closure *TCommEvent)(System::TObject* Sender, unsigned Events);

typedef void __fastcall (__closure *TComPortDataEvent)(System::TObject* Sender, char * Buffer, int BufferSize);

typedef void __fastcall (__closure *TComPortCountEvent)(System::TObject* Sender, int Count);

class DELPHICLASS ThbComPortOperation;
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


class DELPHICLASS ThbComPortOperationList;
class DELPHICLASS ThbCustomComPort;
class DELPHICLASS ThbComPortOutputBuffer;
class PASCALIMPLEMENTATION ThbComPortOutputBuffer : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
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


class DELPHICLASS ThbComPortInputBuffer;
class PASCALIMPLEMENTATION ThbComPortInputBuffer : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	ThbCustomComPort* FComPort;
	unsigned FMutex;
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


class DELPHICLASS ThbComPortProperties;
class PASCALIMPLEMENTATION ThbComPortProperties : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	ThbCustomComPort* FComPort;
	_COMMPROP *FProps;
	
protected:
	virtual bool __fastcall Get_Available(void);
	virtual Windows::PCommProp __fastcall Get_COMMPROP(void);
	virtual Word __fastcall Get_WORD(int index);
	virtual unsigned __fastcall Get_DWORD(int index);
	bool __fastcall UpdateData(void);
	
public:
	__property Windows::PCommProp COMMPROP = {read=Get_COMMPROP};
	__fastcall ThbComPortProperties(ThbCustomComPort* AOwner);
	__fastcall virtual ~ThbComPortProperties(void);
	virtual void __fastcall Update(void);
	virtual void __fastcall Invalidate(void);
	__property bool Available = {read=Get_Available, nodefault};
	__property Word PacketLength = {read=Get_WORD, index=0, nodefault};
	__property Word PacketVersion = {read=Get_WORD, index=1, nodefault};
	__property Word SettableData = {read=Get_WORD, index=2, nodefault};
	__property Word SettableStopParity = {read=Get_WORD, index=3, nodefault};
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


class DELPHICLASS ThbComPortStatus;
class PASCALIMPLEMENTATION ThbComPortStatus : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	ThbCustomComPort* FComPort;
	_COMSTAT *FStat;
	unsigned FErrors;
	
protected:
	virtual bool __fastcall Get_Available(void);
	virtual Windows::PComStat __fastcall Get_COMSTAT(void);
	virtual unsigned __fastcall Get_DWORD(int index);
	virtual Windows::TComStateFlags __fastcall Get_Flags(void);
	bool __fastcall UpdateData(void);
	
public:
	__fastcall ThbComPortStatus(ThbCustomComPort* AOwner);
	__fastcall virtual ~ThbComPortStatus(void);
	virtual void __fastcall Update(void);
	void __fastcall Invalidate(void);
	__property bool Available = {read=Get_Available, nodefault};
	__property Windows::TComStateFlags Flags = {read=Get_Flags, nodefault};
	__property unsigned cbInQue = {read=Get_DWORD, index=0, nodefault};
	__property unsigned cbOutQue = {read=Get_DWORD, index=1, nodefault};
	__property unsigned Errors = {read=FErrors, write=FErrors, nodefault};
};


class DELPHICLASS ThbComPortTimeouts;
class PASCALIMPLEMENTATION ThbComPortTimeouts : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
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
	virtual Windows::PCommTimeouts __fastcall Get_COMMTIMEOUTS(void);
	virtual unsigned __fastcall Get_DWORD(int Index);
	virtual void __fastcall Set_DWORD(int Index, unsigned Value);
	bool __fastcall UpdateData(void);
	void __fastcall Apply(void);
	
public:
	__fastcall ThbComPortTimeouts(ThbCustomComPort* AOwner);
	virtual void __fastcall Invalidate(void);
	__property Windows::PCommTimeouts COMMTIMEOUTS = {read=Get_COMMTIMEOUTS};
	
__published:
	__property bool Enabled = {read=FEnabled, write=Set_Enabled, nodefault};
	__property unsigned ReadIntervalTimeout = {read=Get_DWORD, write=Set_DWORD, index=0, nodefault};
	__property unsigned ReadTotalTimeoutMultiplier = {read=Get_DWORD, write=Set_DWORD, index=1, nodefault};
	__property unsigned ReadTotalTimeoutConstant = {read=Get_DWORD, write=Set_DWORD, index=2, nodefault};
	__property unsigned WriteTotalTimeoutMultiplier = {read=Get_DWORD, write=Set_DWORD, index=3, nodefault};
	__property unsigned WriteTotalTimeoutConstant = {read=Get_DWORD, write=Set_DWORD, index=4, nodefault};
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~ThbComPortTimeouts(void) { }
	#pragma option pop
	
};


class DELPHICLASS ThbComPortFlowControl;
class PASCALIMPLEMENTATION ThbComPortFlowControl : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
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
	virtual void __fastcall AssignTo(Classes::TPersistent* Dest);
	
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
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~ThbComPortFlowControl(void) { }
	#pragma option pop
	
};


class DELPHICLASS ThbComPortReadThread;
class PASCALIMPLEMENTATION ThbComPortReadThread : public Classes::TThread 
{
	typedef Classes::TThread inherited;
	
private:
	unsigned FStopEvent;
	unsigned FWindowHandle;
	unsigned FPortHandle;
	
protected:
	virtual void __fastcall Execute(void);
	HIDESBASE void __fastcall Terminate(void);
	void __fastcall ProcessCommEvent(unsigned EventMask);
	
public:
	__fastcall ThbComPortReadThread(unsigned WindowHandle, unsigned PortHandle, unsigned Events);
public:
	#pragma option push -w-inl
	/* TThread.Destroy */ inline __fastcall virtual ~ThbComPortReadThread(void) { }
	#pragma option pop
	
};


class DELPHICLASS ThbComPortWriteThread;
class PASCALIMPLEMENTATION ThbComPortWriteThread : public Classes::TThread 
{
	typedef Classes::TThread inherited;
	
private:
	unsigned FStopEvent;
	unsigned FWakeupEvent;
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


class DELPHICLASS ThbComPortOptions;
class PASCALIMPLEMENTATION ThbComPortOptions : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	ThbCustomComPort* FComPort;
	char FErrorChar;
	bool FErrorReplace;
	bool FNullStrip;
	char FEofChar;
	char FEvtChar;
	bool FSyncMode;
	
protected:
	virtual void __fastcall AssignTo(Classes::TPersistent* Dest);
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
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~ThbComPortOptions(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION ThbCustomComPort : public Classes::TComponent 
{
	typedef Classes::TComponent inherited;
	
private:
	Hbtapiver::ThbTapiComponentsAbout FAbout;
	unsigned FHandle;
	unsigned FWindowHandle;
	#pragma pack(push, 1)
	_DCB FDCB;
	#pragma pack(pop)
	
	unsigned FComEvents;
	unsigned FBaudrate;
	Word FParity;
	Byte FStopbits;
	Byte FDatabits;
	Classes::TList* FTriggerList;
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
	Classes::TStringList* FPortList;
	ThbComPortOperationList* FWriteOpList;
	AnsiString FPortName;
	bool FDTR;
	bool FRTS;
	bool FBreakSet;
	bool FBreakRcvd;
	bool FDirectMode;
	Classes::TNotifyEvent FOnActivate;
	Classes::TNotifyEvent FOnDeactivate;
	TCommEvent FOnCommEvent;
	Classes::TNotifyEvent FOnBreak;
	Classes::TNotifyEvent FOnCts;
	Classes::TNotifyEvent FOnDsr;
	TCommErrorEvent FOnCommError;
	Classes::TNotifyEvent FOnRing;
	Classes::TNotifyEvent FOnDCD;
	TComPortDataEvent FOnData;
	TComPortCountEvent FOnReceive;
	TComPortCountEvent FOnSendTimeout;
	Classes::TNotifyEvent FOnTxEmpty;
	
protected:
	virtual void __fastcall ApplyActivate(void);
	void __fastcall ApplyBuffer(void);
	void __fastcall CheckNotOpen(void);
	void __fastcall CheckOpen(void);
	void __fastcall CheckDirectMode(void);
	virtual unsigned __fastcall CreateHandle(void);
	void __fastcall DestroyHandle(void);
	void __fastcall PurgeInQueue(void);
	void __fastcall PurgeOutQueue(void);
	void __fastcall EscapeComm(int Flag);
	bool __fastcall Get_Active(void);
	bool __fastcall Get_Break(void);
	bool __fastcall Get_ModemState(int Index);
	bool __fastcall Get_ComState(int Index);
	virtual Windows::PCommProp __fastcall Get_COMMPROP(void);
	virtual Windows::PComStat __fastcall Get_COMSTAT(void);
	virtual Classes::TStrings* __fastcall Get_Ports(void);
	void __fastcall HandleCommEvents(unsigned Events);
	bool __fastcall QueryDCB(_DCB &aDCB);
	void __fastcall InitDCB(_DCB &aDCB);
	bool __fastcall IsActive(void);
	bool __fastcall IsDestroying(void);
	void __fastcall Set_Active(bool value);
	void __fastcall Set_Baud(unsigned Value);
	void __fastcall Set_CommEvents(unsigned Value);
	void __fastcall Set_Databits(Byte Value);
	virtual void __fastcall Set_Handle(const unsigned Value);
	void __fastcall Set_ModemState(int Index, bool value);
	void __fastcall Set_Options(ThbComPortOptions* Value);
	void __fastcall Set_Parity(Word Value);
	virtual void __fastcall Set_PortName(AnsiString Value);
	void __fastcall Set_Stopbits(Byte Value);
	void __fastcall Set_DTRState(bool State);
	void __fastcall Set_RTSState(bool State);
	void __fastcall Set_BREAKState(bool State);
	void __fastcall Set_XONState(bool State);
	AnsiString __fastcall Get_Settings();
	void __fastcall Set_Settings(const AnsiString value);
	void __fastcall ApplySettings(void);
	void __fastcall RetrieveSettings(void);
	virtual void __fastcall UpdatePorts(void);
	void __fastcall WindowProc(Messages::TMessage &Message);
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
	__property Byte Databits = {read=FDatabits, write=Set_Databits, default=8};
	__property unsigned CommEvents = {read=FComEvents, write=Set_CommEvents, default=511};
	__property Windows::PCommProp COMMPROP = {read=Get_COMMPROP};
	__property Windows::PComStat COMSTAT = {read=Get_COMSTAT};
	__property ThbComPortOptions* Options = {read=FOptions, write=Set_Options};
	__property Word Parity = {read=FParity, write=Set_Parity, nodefault};
	__property AnsiString PortName = {read=FPortName, write=Set_PortName};
	__property Classes::TStrings* PortList = {read=Get_Ports};
	__property Byte Stopbits = {read=FStopbits, write=Set_Stopbits, default=0};
	__property AnsiString Settings = {read=Get_Settings, write=Set_Settings};
	__property Classes::TNotifyEvent OnActivate = {read=FOnActivate, write=FOnActivate};
	__property Classes::TNotifyEvent OnDeactivate = {read=FOnDeactivate, write=FOnDeactivate};
	__property TCommEvent OnEvent = {read=FOnCommEvent, write=FOnCommEvent};
	__property TCommErrorEvent OnError = {read=FOnCommError, write=FOnCommError};
	__property Classes::TNotifyEvent OnBreak = {read=FOnBreak, write=FOnBreak};
	__property Classes::TNotifyEvent OnCts = {read=FOnCts, write=FOnCts};
	__property Classes::TNotifyEvent OnDsr = {read=FOnDsr, write=FOnDsr};
	__property Classes::TNotifyEvent OnRing = {read=FOnRing, write=FOnRing};
	__property Classes::TNotifyEvent OnDcd = {read=FOnDCD, write=FOnDCD};
	__property TComPortDataEvent OnData = {read=FOnData, write=FOnData};
	__property TComPortCountEvent OnReceive = {read=FOnReceive, write=FOnReceive};
	__property TComPortCountEvent OnTimeout = {read=FOnSendTimeout, write=FOnSendTimeout};
	__property Classes::TNotifyEvent OnTxEmpty = {read=FOnTxEmpty, write=FOnTxEmpty};
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
	__property unsigned Handle = {read=FHandle, write=Set_Handle, nodefault};
	
public:
	__fastcall virtual ThbCustomComPort(Classes::TComponent* AOwner);
	__fastcall virtual ~ThbCustomComPort(void);
	virtual void __fastcall Loaded(void);
	virtual void __fastcall Open(void);
	virtual void __fastcall Close(void);
	void __fastcall AddTrigger(System::TObject* Receiver, TCommEvent EventProc, unsigned EventMask);
	void __fastcall RemoveTrigger(System::TObject* Receiver);
	unsigned __fastcall InCount(void);
	unsigned __fastcall OutCount(void);
	void __fastcall Write(const void *Buffer, int BufferSize);
	void __fastcall WriteStr(const AnsiString Value);
	void __fastcall WriteAnsiStr(const AnsiString Value);
	void __fastcall SendBreak(int Duration);
	int __fastcall Read(void *Buffer, int BufferSize);
	AnsiString __fastcall ReadStr()/* overload */;
	AnsiString __fastcall ReadStr(int Count)/* overload */;
	AnsiString __fastcall ReadAnsiStr()/* overload */;
	AnsiString __fastcall ReadAnsiStr(int Count)/* overload */;
	
__published:
	__property Hbtapiver::ThbTapiComponentsAbout About = {read=FAbout, write=FAbout, stored=false, nodefault};
};


class PASCALIMPLEMENTATION ThbComPortOperationList : public Classes::TList 
{
	typedef Classes::TList inherited;
	
public:
	ThbComPortOperation* operator[](int Index) { return Items[Index]; }
	
private:
	ThbCustomComPort* FComPort;
	unsigned FMutex;
	
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


class DELPHICLASS ThbComPortEventChars;
class PASCALIMPLEMENTATION ThbComPortEventChars : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	ThbCustomComPort* FOwner;
	char FXonChar;
	char FXoffChar;
	char FErrorChar;
	char FEofChar;
	char FEvtChar;
	void __fastcall SetEventChar(int Index, char Value);
	
public:
	__fastcall ThbComPortEventChars(ThbCustomComPort* Owner);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	
__published:
	__property char XonChar = {read=FXonChar, write=SetEventChar, index=1, default=17};
	__property char XoffChar = {read=FXoffChar, write=SetEventChar, index=2, default=19};
	__property char ErrorChar = {read=FErrorChar, write=SetEventChar, index=3, default=0};
	__property char EofChar = {read=FEofChar, write=SetEventChar, index=4, default=0};
	__property char EvtChar = {read=FEvtChar, write=SetEventChar, index=5, default=0};
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~ThbComPortEventChars(void) { }
	#pragma option pop
	
};


class DELPHICLASS ThbComPort;
class PASCALIMPLEMENTATION ThbComPort : public ThbCustomComPort 
{
	typedef ThbCustomComPort inherited;
	
public:
	__property CommEvents  = {default=511};
	__property Handle ;
	__property PortList ;
	__property Props ;
	__property Settings ;
	__property Status ;
	__property COMMPROP ;
	__property COMSTAT ;
	
__published:
	__property Active ;
	__property Baudrate  = {default=9600};
	__property Break ;
	__property CTS ;
	__property Databits  = {default=8};
	__property DCD ;
	__property DSR ;
	__property DTR ;
	__property FlowCtrl ;
	__property Options ;
	__property OutBuffer ;
	__property InBuffer ;
	__property Parity ;
	__property PortName ;
	__property RING ;
	__property RTS ;
	__property Stopbits  = {default=0};
	__property Timeouts ;
	__property OnActivate ;
	__property OnDeactivate ;
	__property OnEvent ;
	__property OnError ;
	__property OnBreak ;
	__property OnCts ;
	__property OnDsr ;
	__property OnRing ;
	__property OnDcd ;
	__property OnData ;
	__property OnReceive ;
	__property OnTxEmpty ;
	__property OnTimeout ;
public:
	#pragma option push -w-inl
	/* ThbCustomComPort.Create */ inline __fastcall virtual ThbComPort(Classes::TComponent* AOwner) : ThbCustomComPort(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* ThbCustomComPort.Destroy */ inline __fastcall virtual ~ThbComPort(void) { }
	#pragma option pop
	
};


class DELPHICLASS ThbComPortStatusLED;
class PASCALIMPLEMENTATION ThbComPortStatusLED : public Controls::TGraphicControl 
{
	typedef Controls::TGraphicControl inherited;
	
private:
	Hbtapiver::ThbTapiComponentsAbout FAbout;
	bool FActive;
	ThbComPort* FComPort;
	unsigned FSignal;
	Extctrls::TTimer* FTimer;
	Graphics::TPicture* FPictureOff;
	Graphics::TPicture* FPictureOn;
	bool FStretch;
	bool FCenter;
	bool FTransparent;
	bool FDrawing;
	Classes::TNotifyEvent FOnChange;
	
protected:
	Graphics::TCanvas* __fastcall GetCanvas(void);
	Graphics::TPicture* __fastcall Picture(void);
	void __fastcall PictureChanged(System::TObject* Sender);
	void __fastcall SetActive(bool Value);
	void __fastcall SetCenter(bool Value);
	void __fastcall SetStretch(bool Value);
	void __fastcall SetTransparent(bool Value);
	void __fastcall SetPictureOff(Graphics::TPicture* Value);
	void __fastcall SetPictureOn(Graphics::TPicture* Value);
	void __fastcall SetPicture(bool Index, const Graphics::TPicture* Value);
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
	Types::TRect __fastcall DestRect();
	bool __fastcall DoPaletteChange(void);
	DYNAMIC HPALETTE __fastcall GetPalette(void);
	virtual void __fastcall Paint(void);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	
public:
	__fastcall virtual ThbComPortStatusLED(Classes::TComponent* AOwner);
	__fastcall virtual ~ThbComPortStatusLED(void);
	__property Graphics::TCanvas* Canvas = {read=GetCanvas};
	__property bool Active = {read=FActive, nodefault};
	
__published:
	__property Hbtapiver::ThbTapiComponentsAbout About = {read=FAbout, write=FAbout, stored=false, nodefault};
	__property Align  = {default=0};
	__property Anchors  = {default=3};
	__property AutoSize  = {default=0};
	__property bool Center = {read=FCenter, write=SetCenter, default=0};
	__property ThbComPort* ComPort = {read=FComPort, write=SetPort};
	__property Constraints ;
	__property DragCursor  = {default=-12};
	__property DragKind  = {default=0};
	__property DragMode  = {default=0};
	__property Enabled  = {default=1};
	__property ParentShowHint  = {default=1};
	__property Graphics::TPicture* PictureOff = {read=FPictureOff, write=SetPictureOff};
	__property Graphics::TPicture* PictureOn = {read=FPictureOn, write=SetPictureOn};
	__property PopupMenu ;
	__property ShowHint ;
	__property unsigned Signal = {read=FSignal, write=SetSignal, nodefault};
	__property bool Stretch = {read=FStretch, write=SetStretch, default=0};
	__property bool Transparent = {read=FTransparent, write=SetTransparent, default=0};
	__property Visible  = {default=1};
	__property Classes::TNotifyEvent OnChange = {read=FOnChange, write=FOnChange};
	__property OnClick ;
	__property OnDblClick ;
	__property OnDragDrop ;
	__property OnDragOver ;
	__property OnEndDock ;
	__property OnEndDrag ;
	__property OnMouseDown ;
	__property OnMouseMove ;
	__property OnMouseUp ;
	__property OnStartDock ;
	__property OnStartDrag ;
};


//-- var, const, procedure ---------------------------------------------------
static const int EV_TXCHAR = 0x10000000;
static const int EV_DTR = 0x20000000;
static const int EV_RTS = 0x40000000;
static const Shortint COMPORTHANDSHAKE_NONE = 0x0;
static const Shortint COMPORTHANDSHAKE_XONXOFF = 0x1;
static const Shortint COMPORTHANDSHAKE_RTSCTS = 0x2;
static const Shortint COMPORTHANDSHAKE_RTSCTS_TOGGLE = 0x4;
static const Shortint COMPORTHANDSHAKE_DTRDSR = 0x8;
static const Shortint COMPORTSIGNAL_NONE = 0x0;
static const Shortint COMPORTSIGNAL_DTR = 0x1;
static const Shortint COMPORTSIGNAL_DSR = 0x2;
static const Shortint COMPORTSIGNAL_RTS = 0x4;
static const Shortint COMPORTSIGNAL_CTS = 0x8;
static const Shortint COMPORTSIGNAL_RING = 0x10;
static const Shortint COMPORTSIGNAL_DCD = 0x20;
static const Shortint COMPORTSIGNAL_TXD = 0x40;
static const Byte COMPORTSIGNAL_RXD = 0x80;
static const Word COMEVENTS_ALL = 0x1ff;
static const Word DEFAULT_READBUFFERSIZE = 0x1000;
static const Word DEFAULT_WRITEBUFFERSIZE = 0x1000;
static const int DEFAULT_READTIMEOUT = 0xffffffff;
static const int DEFAULT_WRITETIMEOUT = 0xffffffff;

}	/* namespace Hbcomm */
using namespace Hbcomm;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// Hbcomm
