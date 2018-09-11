// Borland C++ Builder
// Copyright (c) 1995, 1999 by Borland International
// All rights reserved

// (DO NOT EDIT: machine generated header) 'hbTapiUtils.pas' rev: 5.00

#ifndef hbTapiUtilsHPP
#define hbTapiUtilsHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <hbTapiApi.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Hbtapiutils
{
//-- type declarations -------------------------------------------------------
//-- var, const, procedure ---------------------------------------------------
extern PACKAGE AnsiString __fastcall LineAddressFeaturesToStr(unsigned AddressFeatures, AnsiString Spacer
	);
extern PACKAGE AnsiString __fastcall LineCallStateToStr(unsigned CallState);
extern PACKAGE unsigned __fastcall StrToLineCallState(AnsiString CallState);
extern PACKAGE AnsiString __fastcall LineCallStateToStrDE(unsigned CallState);
extern PACKAGE void __fastcall LineCallStatesToStrList(unsigned CallStates, Classes::TStrings* List)
	;
extern PACKAGE AnsiString __fastcall LineCallStateModeToStr(unsigned CallState, unsigned StateMode);
	
extern PACKAGE AnsiString __fastcall LineCallOriginToStr(unsigned CallOrigin);
extern PACKAGE AnsiString __fastcall LineCallFeaturesToStr(unsigned CallFeatures, AnsiString Spacer)
	;
extern PACKAGE AnsiString __fastcall LineCallInfoStateToStr(unsigned CallInfo);
extern PACKAGE AnsiString __fastcall LineCallReasonToStr(unsigned CallReason);
extern PACKAGE unsigned __fastcall StrToLineCallPrivilege(AnsiString CallPrivilege);
extern PACKAGE AnsiString __fastcall LineCallParamFlagsToStr(unsigned CallParamFlags, AnsiString Spacer
	);
extern PACKAGE AnsiString __fastcall LineCallPrivilegesToStr(unsigned CallPrivileges, AnsiString Spacer
	);
extern PACKAGE AnsiString __fastcall LineAddrStateToStr(unsigned AddressState);
extern PACKAGE AnsiString __fastcall LineAddrStatesToStr(unsigned AddressState, AnsiString Spacer);
extern PACKAGE AnsiString __fastcall LineMediaModeToStr(unsigned MediaMode);
extern PACKAGE AnsiString __fastcall LineMediaModesToStr(unsigned MediaModes, AnsiString Spacer);
extern PACKAGE void __fastcall LineMediaModesToStrList(unsigned MediaModes, Classes::TStrings* List)
	;
extern PACKAGE unsigned __fastcall StrToLineMediaMode(AnsiString MediaMode, unsigned Default);
extern PACKAGE unsigned __fastcall StrToLineBearerMode(AnsiString BearerMode);
extern PACKAGE AnsiString __fastcall LineBearerModeToStr(unsigned BearerMode);
extern PACKAGE void __fastcall LineBearerModesToStrList(unsigned BearerModes, Classes::TStrings* List
	);
extern PACKAGE AnsiString __fastcall LineBearerModesToStr(unsigned BearerModes);
extern PACKAGE void __fastcall LineAddressModesToStrList(unsigned AddressModes, Classes::TStrings* List
	);
extern PACKAGE unsigned __fastcall StrToLineAddressMode(AnsiString AddressMode);
extern PACKAGE AnsiString __fastcall LineAddressModeToStr(unsigned AddressMode);
extern PACKAGE AnsiString __fastcall LineDevStateToStr(unsigned DeviceState);
extern PACKAGE AnsiString __fastcall LineDevStatesToStr(unsigned DeviceState, AnsiString Spacer);
extern PACKAGE AnsiString __fastcall LineDiscModeToStr(unsigned DiscMode);
extern PACKAGE void __fastcall LineDiscModesToStrList(unsigned DiscModes, Classes::TStrings* List);
extern PACKAGE AnsiString __fastcall LineDigitModeToStr(unsigned DigitMode);
extern PACKAGE void __fastcall LineDigitModesToStrList(unsigned DigitMode, Classes::TStrings* List);
	
extern PACKAGE unsigned __fastcall StrToLineDigitMode(AnsiString DigitMode, unsigned Default);
extern PACKAGE AnsiString __fastcall PhonePrivilegesToStr(unsigned Value, AnsiString Spacer);
extern PACKAGE AnsiString __fastcall PhoneLampModeToStr(unsigned LampMode);
extern PACKAGE AnsiString __fastcall PhoneButtonStateToStr(unsigned ButtonState);
extern PACKAGE AnsiString __fastcall PhoneButtonModeToStr(unsigned ButtonMode);
extern PACKAGE AnsiString __fastcall PhoneButtonFunctionToStr(unsigned ButtonFunction);
extern PACKAGE AnsiString __fastcall PhoneStateToStr(unsigned PhoneState);
extern PACKAGE AnsiString __fastcall PhoneErrToStr(unsigned PhoneError);
extern PACKAGE AnsiString __fastcall MessageIDToStr(unsigned MessageID);
extern PACKAGE AnsiString __fastcall LineErrToStr(unsigned LineError);
extern PACKAGE AnsiString __fastcall LineForwardModeToStr(unsigned ForwardMode);
extern PACKAGE AnsiString __fastcall LineForwardModesToStr(unsigned ForwardModes, AnsiString Spacer)
	;

}	/* namespace Hbtapiutils */
#if !defined(NO_IMPLICIT_NAMESPACE_USE)
using namespace Hbtapiutils;
#endif
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// hbTapiUtils
