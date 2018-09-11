// CodeGear C++Builder
// Copyright (c) 1995, 2015 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'hbTapiApi.pas' rev: 29.00 (Windows)

#ifndef HbtapiapiHPP
#define HbtapiapiHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>
#include <SysInit.hpp>
#include <Winapi.Windows.hpp>
#include <Winapi.Messages.hpp>

//-- user supplied -----------------------------------------------------------
//  -- TAPI VERSION INFO -- TAPI VERSION INFO --
//  -- TAPI VERSION INFO -- TAPI VERSION INFO --
//  -- TAPI VERSION INFO -- TAPI VERSION INFO --
//
// To build  a TAPI 1.4 application put a define as below in your
// source file before you include hbTapiApi.h:
//
// #define TAPI_CURRENT_VERSION 0x00010004
//
//
#ifndef TAPI_CURRENT_VERSION
#define TAPI_CURRENT_VERSION 0x00020002
#endif
#include <windows.h>
#include <tapi.h>
#pragma pack(1)

namespace Hbtapiapi
{
//-- forward type declarations -----------------------------------------------
//-- type declarations -------------------------------------------------------
typedef unsigned *PHCALL;

typedef unsigned *PHLINE;

typedef unsigned *PHPHONE;

typedef unsigned *PHLINEAPP;

typedef unsigned *PHPHONEAPP;

typedef unsigned *PHAGENTSESSION;

typedef unsigned *PHAGENT;

typedef LPHICON PHICON;

typedef void __stdcall (*TLineCallback)(unsigned hDevice, unsigned dwMessage, unsigned dwInstance, unsigned dwParam1, unsigned dwParam2, unsigned dwParam3);

typedef void __stdcall (*TPhoneCallback)(unsigned hDevice, unsigned dwMessage, unsigned dwInstance, unsigned dwParam1, unsigned dwParam2, unsigned dwParam3);

typedef lineaddresscaps_tag *PLineAddressCaps;

typedef lineaddresscaps_tag TLineAddressCaps;

typedef lineaddressstatus_tag *PLineAddressStatus;

typedef lineaddressstatus_tag TLineAddressStatus;

typedef lineagentactivityentry_tag *PLineAgentActivityEntry;

typedef lineagentactivityentry_tag TLineAgentActivityEntry;

typedef lineagentactivitylist_tag *PLineAgentActivityList;

typedef lineagentactivitylist_tag TLineAgentActivityList;

typedef lineagentcaps_tag *PLineAgentCaps;

typedef lineagentcaps_tag TLineAgentCaps;

typedef lineagentgroupentry_tag *PLineAgentGroupEntry;

typedef lineagentgroupentry_tag TLineAgentGroupEntry;

typedef lineagentgrouplist_tag *PLineAgentGroupList;

typedef lineagentgrouplist_tag TLineAgentGroupList;

typedef lineagentstatus_tag *PLineAgentStatus;

typedef lineagentstatus_tag TLineAgentStatus;

typedef lineappinfo_tag *PLineAppInfo;

typedef lineappinfo_tag TLineAppInfo;

typedef lineagententry_tag *PLineAgentEntry;

typedef lineagententry_tag TLineAgentEntry;

typedef lineagentlist_tag *PLineAgentList;

typedef lineagentlist_tag TLineAgentList;

typedef lineagentinfo_tag *PLineAgentInfo;

typedef lineagentinfo_tag TLineAgentInfo;

typedef lineagentsession_tag *PLineAgentSession;

typedef lineagentsession_tag TLineAgentSession;

typedef lineagentsessionlist_tag *PLineAgentSessionList;

typedef lineagentsessionlist_tag TLineAgentSessionList;

typedef lineagentsessioninfo_tag *PLineAgentSessionInfo;

typedef lineagentsessioninfo_tag TLineAgentSessionInfo;

typedef linequeueentry_tag *PLineQueueEntry;

typedef linequeueentry_tag TLineQueueEntry;

typedef linequeuelist_tag *PLineQueueList;

typedef linequeuelist_tag TLineQueueList;

typedef linequeueinfo_tag *PLineQueueInfo;

typedef linequeueinfo_tag TLineQueueInfo;

typedef lineproxyrequestlist_tag *PLineProxyRequestList;

typedef lineproxyrequestlist_tag TLineProxyRequestList;

typedef linedialparams_tag *PLineDialParams;

typedef linedialparams_tag TLineDialParams;

typedef linecallinfo_tag *PLineCallInfo;

typedef linecallinfo_tag TLineCallInfo;

typedef linecalllist_tag *PLineCallList;

typedef linecalllist_tag TLineCallList;

typedef linecallparams_tag *PLineCallParams;

typedef linecallparams_tag TLineCallParams;

typedef linecallstatus_tag *PLineCallStatus;

typedef linecallstatus_tag TLineCallStatus;

typedef linecalltreatmententry_tag *PLineCallTreatmentEntry;

typedef linecalltreatmententry_tag TLineCallTreatmentEntry;

typedef linecardentry_tag *PLineCardEntry;

typedef linecardentry_tag TLineCardEntry;

typedef linecountryentry_tag *PLineCountryEntry;

typedef linecountryentry_tag TLineCountryEntry;

typedef linecountrylist_tag *PLineCountryList;

typedef linecountrylist_tag TLineCountryList;

typedef linedevcaps_tag *PLineDevCaps;

typedef linedevcaps_tag TLineDevCaps;

typedef linedevstatus_tag *PLineDevStatus;

typedef linedevstatus_tag TLineDevStatus;

typedef lineextensionid_tag *PLineExtensionId;

typedef lineextensionid_tag TLineExtensionId;

typedef lineforward_tag *PLineForward;

typedef lineforward_tag TLineForward;

typedef lineforwardlist_tag *PLineForwardList;

typedef lineforwardlist_tag TLineForwardList;

typedef linegeneratetone_tag *PLineGenerateTone;

typedef linegeneratetone_tag TLineGenerateTone;

typedef lineinitializeexparams_tag *PLineInitializeExParams;

typedef lineinitializeexparams_tag TLineInitializeExParams;

typedef linelocationentry_tag *PLineLocationEntry;

typedef linelocationentry_tag TLineLocationEntry;

typedef linemediacontrolcallstate_tag *PLineMediaControlCallState;

typedef linemediacontrolcallstate_tag TLineMediaControlCallState;

typedef linemediacontroldigit_tag *PLineMediaControlDigit;

typedef linemediacontroldigit_tag TLineMediaControlDigit;

typedef linemediacontrolmedia_tag *PLineMediaControlMedia;

typedef linemediacontrolmedia_tag TLineMediaControlMedia;

typedef linemediacontroltone_tag *PLineMediaControlTone;

typedef linemediacontroltone_tag TLineMediaControlTone;

typedef linemessage_tag *PLineMessage;

typedef linemessage_tag TLineMessage;

typedef linemonitortone_tag *PLineMonitorTone;

typedef linemonitortone_tag TLineMonitorTone;

typedef lineproviderentry_tag *PLineProviderEntry;

typedef lineproviderentry_tag TLineProviderEntry;

typedef lineproviderlist_tag *PLineProviderList;

typedef lineproviderlist_tag TLineProviderList;

typedef lineproxyrequest_tag *PLineProxyRequest;

typedef lineproxyrequest_tag TLineProxyRequest;

typedef linereqmakecall_tag *PLineReqMakeCall;

typedef linereqmakecall_tag TLineReqMakeCall;

typedef linereqmakecallW_tag *PLineReqMakeCallW;

typedef linereqmakecallW_tag TLineReqMakeCallW;

typedef linereqmakecallW_tag LINEREQMAKECALLW;

typedef linereqmediacall_tag *PLineReqMediaCall;

typedef linereqmediacall_tag TLineReqMediaCall;

typedef linereqmediacallW_tag *PLineReqMediaCallW;

typedef linereqmediacallW_tag TLineReqMediaCallW;

typedef linetermcaps_tag *PLineTermCaps;

typedef linetermcaps_tag TLineTermCaps;

typedef linetranslatecaps_tag *PLineTranslateCaps;

typedef linetranslatecaps_tag TLineTranslateCaps;

typedef linetranslateoutput_tag *PLineTranslateOutput;

typedef linetranslateoutput_tag TLineTranslateOutput;

typedef phonebuttoninfo_tag *PPhoneButtonInfo;

typedef phonebuttoninfo_tag TPhoneButtonInfo;

typedef phonecaps_tag *PPhoneCaps;

typedef phonecaps_tag TPhoneCaps;

typedef phoneextensionid_tag *PPhoneExtensionId;

typedef phoneextensionid_tag TPhoneExtensionId;

typedef phoneinitializeexparams_tag *PPhoneInitializeExParams;

typedef phoneinitializeexparams_tag TPhoneInitializeExParams;

typedef linemessage_tag *PPhoneMessage;

typedef linemessage_tag TPhoneMessage;

typedef phonestatus_tag *PPhoneStatus;

typedef phonestatus_tag TPhoneStatus;

typedef varstring_tag *PVarString;

typedef varstring_tag TVarString;

//-- var, const, procedure ---------------------------------------------------
extern DELPHI_PACKAGE int __fastcall TapiErrorFormatMessage(unsigned ErrCode);
}	/* namespace Hbtapiapi */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_HBTAPIAPI)
using namespace Hbtapiapi;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// HbtapiapiHPP
