{-------------------------------------------------------------------------
   Copyright by Haeger + Busch, Germany                / >>>>>>>>> /-----
   Ingenieurbuero fuer Kommunikationsloesungen         / <<<<<<<<< /
 ----------------------------------------------------/ >>>>>>>>> /
   Homepage  : http://www.hbTapi.com
   EMail     : info@hbTapi.com
   Package   : hbTapi Components
   Version   : 10.2
 -------------------------------------------------------------------------}

unit hbTapiUtils;

interface
uses Windows, Classes, hbTapiApi;

function  LineAddressModeToStr      (AddressMode : DWORD): String;
procedure LineAddressModesToStrList (AddressModes: DWORD; List: TStrings );
function  LineAddressFeaturesToStr  (AddressFeatures: DWORD; Spacer: String = ' '): String;
function  LineBearerModesToStr      (BearerModes: DWORD ): String;
function  LineBearerModeToStr       (BearerMode : DWORD ): String;
function  LineCallFeaturesToStr     (CallFeatures: DWORD; Spacer: String = ''): String;
function  LineCallInfoStateToStr    (CallInfo: DWORD): String;
function  LineCallOriginToStr       (CallOrigin: DWORD) : String;
function  LineCallParamFlagsToStr   (CallParamFlags: DWORD; Spacer: String = ' '): String;
function  LineCallPrivilegesToStr   (CallPrivileges: DWORD; Spacer: String = ' ') : string;
function  LineCallReasonToStr       (CallReason: DWORD): String;
function  LineCallStateModeToStr    (CallState, StateMode: DWORD): string;
function  LineCallStateToStr        (CallState : DWORD) : string;
function  StrToLineCallState        (CallState: String) : DWORD;
function  LineCallStateToStrDE      (CallState : DWORD) : string;
function  LineDevStateToStr         (DeviceState: DWORD) : string;
function  LineDevStatesToStr        (DeviceState: DWORD; Spacer: String = ' '): String;
function  LineDigitModeToStr        (DigitMode: DWORD) : String;
function  LineDiscModeToStr         (DiscMode  : DWORD ) : String;
function  LineErrToStr              (LineError: DWORD) : String;
function  LineForwardModesToStr     (ForwardModes: DWORD; Spacer: String = ' '): String;
function  LineForwardModeToStr      (ForwardMode: DWORD): String;
function  LineMediaModesToStr       (MediaModes: DWORD; Spacer: String= ' ') : String;
function  LineMediaModeToStr        (MediaMode : DWORD): String;
function  MessageIDToStr            (MessageID: DWORD ) : String;
function  PhoneButtonFunctionToStr  (ButtonFunction: DWORD): String;
function  PhoneButtonModeToStr      (ButtonMode: DWORD): String;
function  PhoneButtonStateToStr     (ButtonState: DWORD): String;
function  PhoneLampModeToStr        (LampMode: DWORD): String;
function  PhonePrivilegesToStr      (Value : DWORD; Spacer: String) : string;
function  PhoneStateToStr           (PhoneState: DWORD): String;
function  PhoneErrToStr             (PhoneError: DWORD) : String;
function  StrToLineAddressMode      (AddressMode : String): DWORD;
function  StrToLineBearerMode       (BearerMode : String): DWORD;
function  StrToLineCallPrivilege    (CallPrivilege: String) : DWORD;
function  StrToLineDigitMode        (DigitMode: String; Default: DWORD=0): DWORD;
function  StrToLineMediaMode        (MediaMode : String; Default: DWORD=0) : DWORD;
function  LineAddrStateToStr        (AddressState: DWORD) : string;
function  LineAddrStatesToStr       (AddressState: DWORD; Spacer: String = ' ') : String;
procedure LineBearerModesToStrList  (BearerModes: DWORD; List: TStrings );
procedure LineCallStatesToStrList   (CallStates: DWORD; List: TStrings);
procedure LineDigitModesToStrList   (DigitMode: DWORD; List : TStrings );
procedure LineDiscModesToStrList    (DiscModes : DWORD; List : TStrings );
procedure LineMediaModesToStrList   (MediaModes: DWORD; List: TStrings);

implementation
uses SysUtils;

function OrStr( s1, s2 : String; Spacer: String = ' ') : String;
begin
  if s1 <> '' then
    result := s1 + Spacer + s2
  else
    result := s2;
end;

{*****************************************************************************}
function LineAddressFeaturesToStr(AddressFeatures: DWORD; Spacer: String = ' '): String;
{*****************************************************************************}
begin
  result := '';
  if AddressFeatures and LINEADDRFEATURE_FORWARD         > 0 then result := OrStr(result, 'FORWARD', Spacer);
  if AddressFeatures and LINEADDRFEATURE_MAKECALL        > 0 then result := OrStr(result, 'MAKECALL', Spacer);
  if AddressFeatures and LINEADDRFEATURE_PICKUP          > 0 then result := OrStr(result, 'PICKUP', Spacer);
  if AddressFeatures and LINEADDRFEATURE_SETMEDIACONTROL > 0 then result := OrStr(result, 'SETMEDIACONTROL', Spacer);
  if AddressFeatures and LINEADDRFEATURE_SETTERMINAL     > 0 then result := OrStr(result, 'SETTERMINAL', Spacer);
  if AddressFeatures and LINEADDRFEATURE_SETUPCONF       > 0 then result := OrStr(result, 'SETUPCONF', Spacer);
  if AddressFeatures and LINEADDRFEATURE_UNCOMPLETECALL  > 0 then result := OrStr(result, 'UNCOMPLETECALL', Spacer);
  if AddressFeatures and LINEADDRFEATURE_UNPARK          > 0 then result := OrStr(result, 'UNPARK', Spacer);
  if AddressFeatures and LINEADDRFEATURE_PICKUPHELD      > 0 then result := OrStr(result, 'PICKUPHELD', Spacer);
  if AddressFeatures and LINEADDRFEATURE_PICKUPGROUP     > 0 then result := OrStr(result, 'PICKUPGROUP', Spacer);
  if AddressFeatures and LINEADDRFEATURE_PICKUPDIRECT    > 0 then result := OrStr(result, 'PICKUPDIRECT', Spacer);
  if AddressFeatures and LINEADDRFEATURE_PICKUPWAITING   > 0 then result := OrStr(result, 'PICKUPWAITING', Spacer);
  if AddressFeatures and LINEADDRFEATURE_FORWARDFWD      > 0 then result := OrStr(result, 'FORWARDFWD', Spacer);
  if AddressFeatures and LINEADDRFEATURE_FORWARDDND      > 0 then result := OrStr(result, 'FORWARDDND', Spacer);

  if (result = '') and (AddressFeatures > 0) then
    result := Format('LINEADDRFEATURE_$%x', [AddressFeatures]);
end;

{ ============================================================================ }
{ L I N E C A L L S T A T E }
{ ============================================================================ }

{*****************************************************************************}
function LineCallStateToStr(CallState: DWORD) : string;
{*****************************************************************************}
begin
  result := '';
  case CallState of
    LINECALLSTATE_IDLE                 : Result:='IDLE';
    LINECALLSTATE_OFFERING             : Result:='OFFERING';
    LINECALLSTATE_ACCEPTED             : Result:='ACCEPTED';
    LINECALLSTATE_DIALTONE             : Result:='DIALTONE';
    LINECALLSTATE_DIALING              : Result:='DIALING';
    LINECALLSTATE_RINGBACK             : Result:='RINGBACK';
    LINECALLSTATE_BUSY                 : Result:='BUSY';
    LINECALLSTATE_SPECIALINFO          : Result:='SPECIALINFO';
    LINECALLSTATE_CONNECTED            : Result:='CONNECTED';
    LINECALLSTATE_PROCEEDING           : Result:='PROCEEDING';
    LINECALLSTATE_ONHOLD               : Result:='ONHOLD';
    LINECALLSTATE_CONFERENCED          : Result:='CONFERENCED';
    LINECALLSTATE_ONHOLDPENDCONF       : Result:='ONHOLDPENDCONF';
    LINECALLSTATE_ONHOLDPENDTRANSFER   : Result:='ONHOLDPENDTRANSFER';
    LINECALLSTATE_DISCONNECTED         : Result:='DISCONNECTED';
    LINECALLSTATE_UNKNOWN              : Result:='UNKNOWN'
  else
    if result = '' then
      result:= Format('LINECALLSTATE_$%x', [CallState]);
  end;
end;

{*****************************************************************************}
function StrToLineCallState(CallState: String) : DWORD;
{*****************************************************************************}
begin
  if      CallState = 'OFFERING'            then result := LINECALLSTATE_OFFERING
  else if CallState = 'ACCEPTED'            then result := LINECALLSTATE_ACCEPTED
  else if CallState = 'DIALTONE'            then result := LINECALLSTATE_DIALTONE
  else if CallState = 'DIALING'             then result := LINECALLSTATE_DIALING
  else if CallState = 'RINGBACK'            then result := LINECALLSTATE_RINGBACK
  else if CallState = 'BUSY'                then result := LINECALLSTATE_BUSY
  else if CallState = 'SPECIALINFO'         then result := LINECALLSTATE_SPECIALINFO
  else if CallState = 'CONNECTED'           then result := LINECALLSTATE_CONNECTED
  else if CallState = 'PROCEEDING'          then result := LINECALLSTATE_PROCEEDING
  else if CallState = 'ONHOLD'              then result := LINECALLSTATE_ONHOLD
  else if CallState = 'CONFERENCED'         then result := LINECALLSTATE_CONFERENCED
  else if CallState = 'ONHOLDPENDCONF'      then result := LINECALLSTATE_ONHOLDPENDCONF
  else if CallState = 'ONHOLDPENDTRANSFER'  then result := LINECALLSTATE_ONHOLDPENDTRANSFER
  else if CallState = 'DISCONNECTED'        then result := LINECALLSTATE_DISCONNECTED
  else if CallState = 'UNKNOWN'             then result := LINECALLSTATE_UNKNOWN
  else if CallState = 'IDLE'                then result := LINECALLSTATE_IDLE
  else result := 0;
end;

{*****************************************************************************}
function LineCallStateToStrDE(CallState : DWORD) : string;
{*****************************************************************************}
begin
  result := '';
  case CallState of
    LINECALLSTATE_IDLE                 : Result:='Ruhe';
    LINECALLSTATE_OFFERING             : Result:='Anruf';
    LINECALLSTATE_ACCEPTED             : Result:='Angenommen';
    LINECALLSTATE_DIALTONE             : Result:='Wählton';
    LINECALLSTATE_DIALING              : Result:='Wahl';
    LINECALLSTATE_RINGBACK             : Result:='Rufton';
    LINECALLSTATE_BUSY                 : Result:='Besetzt';
    LINECALLSTATE_SPECIALINFO          : Result:='Spezialmeldung';
    LINECALLSTATE_CONNECTED            : Result:='Gespräch';
    LINECALLSTATE_PROCEEDING           : Result:='Rufton';
    LINECALLSTATE_ONHOLD               : Result:='Gehalten';
    LINECALLSTATE_CONFERENCED          : Result:='Konferenz';
    LINECALLSTATE_ONHOLDPENDCONF       : Result:='Warten auf Konferenz';
    LINECALLSTATE_ONHOLDPENDTRANSFER   : Result:='Warten auf Transfer';
    LINECALLSTATE_DISCONNECTED         : Result:='Getrennt';
    LINECALLSTATE_UNKNOWN              : Result:='Unbekannt'
  else
    if result = '' then
      result:= Format('LINECALLSTATE_$%x', [CallState]);
  end;
end;

{*****************************************************************************}
procedure LineCallStatesToStrList(CallStates: DWORD; List: TStrings);
{*****************************************************************************}
begin
  List.clear;
  if (LINECALLSTATE_IDLE               and CallStates) > 0 then List.add('IDLE');
  if (LINECALLSTATE_OFFERING           and CallStates) > 0 then List.add('OFFERING');
  if (LINECALLSTATE_ACCEPTED           and CallStates) > 0 then List.add('ACCEPTED');
  if (LINECALLSTATE_DIALTONE           and CallStates) > 0 then List.add('DIALTONE');
  if (LINECALLSTATE_DIALING            and CallStates) > 0 then List.add('DIALING');
  if (LINECALLSTATE_RINGBACK           and CallStates) > 0 then List.add('RINGBACK');
  if (LINECALLSTATE_BUSY               and CallStates) > 0 then List.add('BUSY');
  if (LINECALLSTATE_SPECIALINFO        and CallStates) > 0 then List.add('SPECIALINFO');
  if (LINECALLSTATE_CONNECTED          and CallStates) > 0 then List.add('CONNECTED');
  if (LINECALLSTATE_PROCEEDING         and CallStates) > 0 then List.add('PROCEEDING');
  if (LINECALLSTATE_ONHOLD             and CallStates) > 0 then List.add('ONHOLD');
  if (LINECALLSTATE_CONFERENCED        and CallStates) > 0 then List.add('CONFERENCED');
  if (LINECALLSTATE_ONHOLDPENDCONF     and CallStates) > 0 then List.add('ONHOLDPENDCONF');
  if (LINECALLSTATE_ONHOLDPENDTRANSFER and CallStates) > 0 then List.add('ONHOLDPENDTRANSFER');
  if (LINECALLSTATE_DISCONNECTED       and CallStates) > 0 then List.add('DISCONNECTED');
end;

{*****************************************************************************}
function LineCallStateModeToStr(CallState, StateMode: DWORD) : string;
{*****************************************************************************}
begin
  Result:='';
  case CallState of
    LINECALLSTATE_BUSY :
      case StateMode of
        LINEBUSYMODE_STATION :
          Result:='STATION';
        LINEBUSYMODE_TRUNK :
          Result:='TRUNK';
        LINEBUSYMODE_UNKNOWN :
          Result:='UNKNOWN';
        LINEBUSYMODE_UNAVAIL :
          Result:='UNAVAIL';
      end;
    LINECALLSTATE_CONNECTED :
      case StateMode of
        LINECONNECTEDMODE_ACTIVE :
          Result := 'ACTIVE';
        LINECONNECTEDMODE_ACTIVEHELD :
          Result := 'ACTIVEHELD';
        LINECONNECTEDMODE_CONFIRMED :
          Result := 'CONFIRMED';
        LINECONNECTEDMODE_INACTIVE :
          Result := 'INACTIVE';
        LINECONNECTEDMODE_INACTIVEHELD :
          Result := 'INACTIVEHELD';
      end;
    LINECALLSTATE_DIALTONE :
      case StateMode of
        LINEDIALTONEMODE_NORMAL :
          Result:='NORMAL';
        LINEDIALTONEMODE_SPECIAL :
          Result:='SPECIAL';
        LINEDIALTONEMODE_INTERNAL :
          Result:='INTERNAL';
        LINEDIALTONEMODE_EXTERNAL :
          Result:='EXTERNAL';
        LINEDIALTONEMODE_UNKNOWN :
          Result:='UNKNOWN';
        LINEDIALTONEMODE_UNAVAIL :
          Result:='UNAVAIL';
      end;
    LINECALLSTATE_OFFERING :
      case StateMode of
        LINEOFFERINGMODE_ACTIVE :
          Result := 'ACTIVE';
        LINEOFFERINGMODE_INACTIVE :
          Result := 'INACTIVE';
      end;
    LINECALLSTATE_SPECIALINFO :
      case StateMode of
        LINESPECIALINFO_CUSTIRREG :
          Result := 'CUSTIRREG';
        LINESPECIALINFO_NOCIRCUIT :
          Result := 'NOCIRCUIT';
        LINESPECIALINFO_REORDER :
          Result := 'REORDER';
        LINESPECIALINFO_UNAVAIL :
          Result := 'UNAVAIL';
        LINESPECIALINFO_UNKNOWN :
          Result := 'UNKNOWN';
      end;
    LINECALLSTATE_DISCONNECTED :
      case StateMode of
        LINEDISCONNECTMODE_NORMAL :
          Result:='NORMAL';
        LINEDISCONNECTMODE_UNKNOWN :
          Result:='UNKNOWN';
        LINEDISCONNECTMODE_REJECT :
          Result:='REJECT';
        LINEDISCONNECTMODE_PICKUP :
          Result:='PICKUP';
        LINEDISCONNECTMODE_FORWARDED :
          Result:='FORWARDED';
        LINEDISCONNECTMODE_BUSY :
          Result:='BUSY';
        LINEDISCONNECTMODE_NOANSWER :
          Result:='NOANSWER';
        LINEDISCONNECTMODE_BADADDRESS :
          Result:='BADADDRESS';
        LINEDISCONNECTMODE_UNREACHABLE :
          Result:='UNREACHABLE';
        LINEDISCONNECTMODE_CONGESTION :
          Result:='CONGESTION';
        LINEDISCONNECTMODE_INCOMPATIBLE :
          Result:='INCOMPATIBLE';
        LINEDISCONNECTMODE_UNAVAIL :
          Result:='UNAVAIL'
      end;
  end;
end;

{ ============================================================================ }
{ L I N E C A L L O R I G I N }
{ ============================================================================ }

{*****************************************************************************}
function LineCallOriginToStr(CallOrigin : DWORD) : String;
{*****************************************************************************}
begin
  result := '';
  if CallOrigin and LINECALLORIGIN_OUTBOUND   > 0 then result := OrStr(result, 'OUTBOUND');
  if CallOrigin and LINECALLORIGIN_INTERNAL   > 0 then result := OrStr(result, 'INTERNAL');
  if CallOrigin and LINECALLORIGIN_EXTERNAL   > 0 then result := OrStr(result, 'EXTERNAL');
  if CallOrigin and LINECALLORIGIN_UNKNOWN    > 0 then result := OrStr(result, 'UNKNOWN');
  if CallOrigin and LINECALLORIGIN_UNAVAIL    > 0 then result := OrStr(result, 'UNAVAIL');
  if CallOrigin and LINECALLORIGIN_CONFERENCE > 0 then result := OrStr(result, 'CONFERENCE');
  if CallOrigin and LINECALLORIGIN_INBOUND    > 0 then result := OrStr(result, 'INBOUND');

  if (result = '') and (CallOrigin > 0) then
    result := Format('LINECALLORIGIN_$%x', [CallOrigin]);
end;

{*****************************************************************************}
function LineCallFeaturesToStr(CallFeatures: DWORD; Spacer: String): String;
{*****************************************************************************}
begin
  result := '';
  if CallFeatures and LINECALLFEATURE_ACCEPT               > 0 then result := OrStr(result,'ACCEPT', Spacer);
  if CallFeatures and LINECALLFEATURE_ADDTOCONF            > 0 then result := OrStr(result,'ADDTOCONF', Spacer);
  if CallFeatures and LINECALLFEATURE_ANSWER               > 0 then result := OrStr(result,'ANSWER', Spacer);
  if CallFeatures and LINECALLFEATURE_BLINDTRANSFER        > 0 then result := OrStr(result,'BLINDTRANSFER', Spacer);
  if CallFeatures and LINECALLFEATURE_COMPLETECALL         > 0 then result := OrStr(result,'COMPLETECALL', Spacer);
  if CallFeatures and LINECALLFEATURE_COMPLETETRANSF       > 0 then result := OrStr(result,'COMPLETETRANSF', Spacer);
  if CallFeatures and LINECALLFEATURE_DIAL                 > 0 then result := OrStr(result,'DIAL', Spacer);
  if CallFeatures and LINECALLFEATURE_DROP                 > 0 then result := OrStr(result,'DROP', Spacer);
  if CallFeatures and LINECALLFEATURE_GATHERDIGITS         > 0 then result := OrStr(result,'GATHERDIGITS', Spacer);
  if CallFeatures and LINECALLFEATURE_GENERATEDIGITS       > 0 then result := OrStr(result,'GENERATEDIGITS', Spacer);
  if CallFeatures and LINECALLFEATURE_GENERATETONE         > 0 then result := OrStr(result,'GENERATETONE', Spacer);
  if CallFeatures and LINECALLFEATURE_HOLD                 > 0 then result := OrStr(result,'HOLD', Spacer);
  if CallFeatures and LINECALLFEATURE_MONITORDIGITS        > 0 then result := OrStr(result,'MONITORDIGITS', Spacer);
  if CallFeatures and LINECALLFEATURE_MONITORMEDIA         > 0 then result := OrStr(result,'MONITORMEDIA', Spacer);
  if CallFeatures and LINECALLFEATURE_MONITORTONES         > 0 then result := OrStr(result,'MONITORTONES', Spacer);
  if CallFeatures and LINECALLFEATURE_PARK                 > 0 then result := OrStr(result,'PARK', Spacer);
  if CallFeatures and LINECALLFEATURE_PREPAREADDCONF       > 0 then result := OrStr(result,'PREPAREADDCONF', Spacer);
  if CallFeatures and LINECALLFEATURE_REDIRECT             > 0 then result := OrStr(result,'REDIRECT', Spacer);
  if CallFeatures and LINECALLFEATURE_REMOVEFROMCONF       > 0 then result := OrStr(result,'REMOVEFROMCONF', Spacer);
  if CallFeatures and LINECALLFEATURE_SECURECALL           > 0 then result := OrStr(result,'SECURECALL', Spacer);
  if CallFeatures and LINECALLFEATURE_SENDUSERUSER         > 0 then result := OrStr(result,'SENDUSERUSER', Spacer);
  if CallFeatures and LINECALLFEATURE_SETCALLPARAMS        > 0 then result := OrStr(result,'SETCALLPARAMS', Spacer);
  if CallFeatures and LINECALLFEATURE_SETMEDIACONTROL      > 0 then result := OrStr(result,'SETMEDIACONTROL', Spacer);
  if CallFeatures and LINECALLFEATURE_SETTERMINAL          > 0 then result := OrStr(result,'SETTERMINAL', Spacer);
  if CallFeatures and LINECALLFEATURE_SETUPCONF            > 0 then result := OrStr(result,'SETUPCONF', Spacer);
  if CallFeatures and LINECALLFEATURE_SETUPTRANSFER        > 0 then result := OrStr(result,'SETUPTRANSFER', Spacer);
  if CallFeatures and LINECALLFEATURE_SWAPHOLD             > 0 then result := OrStr(result,'SWAPHOLD', Spacer);
  if CallFeatures and LINECALLFEATURE_UNHOLD               > 0 then result := OrStr(result,'UNHOLD', Spacer);
  if CallFeatures and LINECALLFEATURE_RELEASEUSERUSERINFO  > 0 then result := OrStr(result,'RELEASEUSERUSERINFO', Spacer);
  if CallFeatures and LINECALLFEATURE_SETTREATMENT         > 0 then result := OrStr(result,'SETTREATMENT', Spacer);
  if CallFeatures and LINECALLFEATURE_SETQOS               > 0 then result := OrStr(result,'SETQOS', Spacer);
  if CallFeatures and LINECALLFEATURE_SETCALLDATA          > 0 then result := OrStr(result,'SETCALLDATA', Spacer);

  if (result = '') and (CallFeatures > 0) then
    result := Format('LINEFEATURE_$%x', [CallFeatures]);
end;

{ ============================================================================ }
{ L I N E C A L L I N F O }
{ ============================================================================ }

{*****************************************************************************}
function LineCallInfoStateToStr(CallInfo: DWORD): String;
{*****************************************************************************}
begin
  result := '';
  if CallInfo and LINECALLINFOSTATE_OTHER         > 0 then result := OrStr(result, 'OTHER');
  if CallInfo and LINECALLINFOSTATE_DEVSPECIFIC   > 0 then result := OrStr(result, 'DEVSPECIFIC');
  if CallInfo and LINECALLINFOSTATE_BEARERMODE    > 0 then result := OrStr(result, 'BEARERMODE');
  if CallInfo and LINECALLINFOSTATE_RATE          > 0 then result := OrStr(result, 'RATE');
  if CallInfo and LINECALLINFOSTATE_MEDIAMODE     > 0 then result := OrStr(result, 'MEDIAMODE');
  if CallInfo and LINECALLINFOSTATE_APPSPECIFIC   > 0 then result := OrStr(result, 'APPSPECIFIC');
  if CallInfo and LINECALLINFOSTATE_CALLID        > 0 then result := OrStr(result, 'CALLID');
  if CallInfo and LINECALLINFOSTATE_RELATEDCALLID > 0 then result := OrStr(result, 'RELATEDCALLID');
  if CallInfo and LINECALLINFOSTATE_ORIGIN        > 0 then result := OrStr(result, 'ORIGIN');
  if CallInfo and LINECALLINFOSTATE_REASON        > 0 then result := OrStr(result, 'REASON');
  if CallInfo and LINECALLINFOSTATE_COMPLETIONID  > 0 then result := OrStr(result, 'COMPLETIONID');
  if CallInfo and LINECALLINFOSTATE_NUMOWNERINCR  > 0 then result := OrStr(result, 'NUMOWNERINCR');
  if CallInfo and LINECALLINFOSTATE_NUMOWNERDECR  > 0 then result := OrStr(result, 'NUMOWNERDECR');
  if CallInfo and LINECALLINFOSTATE_NUMMONITORS   > 0 then result := OrStr(result, 'NUMMONITORS');
  if CallInfo and LINECALLINFOSTATE_TRUNK         > 0 then result := OrStr(result, 'TRUNK');
  if CallInfo and LINECALLINFOSTATE_CALLERID      > 0 then result := OrStr(result, 'CALLERID');
  if CallInfo and LINECALLINFOSTATE_CALLEDID      > 0 then result := OrStr(result, 'CALLEDID');
  if CallInfo and LINECALLINFOSTATE_CONNECTEDID   > 0 then result := OrStr(result, 'CONNECTEDID');
  if CallInfo and LINECALLINFOSTATE_REDIRECTIONID > 0 then result := OrStr(result, 'REDIRECTIONID');
  if CallInfo and LINECALLINFOSTATE_REDIRECTINGID > 0 then result := OrStr(result, 'REDIRECTINGID');
  if CallInfo and LINECALLINFOSTATE_DISPLAY       > 0 then result := OrStr(result, 'DISPLAY');
  if CallInfo and LINECALLINFOSTATE_USERUSERINFO  > 0 then result := OrStr(result, 'USERUSERINFO');
  if CallInfo and LINECALLINFOSTATE_HIGHLEVELCOMP > 0 then result := OrStr(result, 'HIGHLEVELCOMP');
  if CallInfo and LINECALLINFOSTATE_LOWLEVELCOMP  > 0 then result := OrStr(result, 'LOWLEVELCOMP');
  if CallInfo and LINECALLINFOSTATE_CHARGINGINFO  > 0 then result := OrStr(result, 'CHARGINGINFO');
  if CallInfo and LINECALLINFOSTATE_TERMINAL      > 0 then result := OrStr(result, 'TERMINAL');
  if CallInfo and LINECALLINFOSTATE_DIALPARAMS    > 0 then result := OrStr(result, 'DIALPARAMS');
  if CallInfo and LINECALLINFOSTATE_MONITORMODES  > 0 then result := OrStr(result, 'MONITORMODES');
  if CallInfo and LINECALLINFOSTATE_TREATMENT     > 0 then result := OrStr(result, 'TREATMENT');     // TAPI v2.0
  if CallInfo and LINECALLINFOSTATE_QOS           > 0 then result := OrStr(result, 'QOS');     // TAPI v2.0
  if CallInfo and LINECALLINFOSTATE_CALLDATA      > 0 then result := OrStr(result, 'CALLDATA');     // TAPI v2.0

  if (result = '') and (CallInfo > 0) then
    result := Format('LINECALLINFOSTATE_$%x', [CallInfo]);
end;

{ ============================================================================ }
{ L I N E C A L L R E A S O N }
{ ============================================================================ }

{*****************************************************************************}
function LineCallReasonToStr(CallReason: DWORD): String;
{*****************************************************************************}
begin
  result := '';
  case CallReason of
    LINECALLREASON_DIRECT                   : result := 'DIRECT';
    LINECALLREASON_FWDBUSY                  : result := 'FWDBUSY';
    LINECALLREASON_FWDNOANSWER              : result := 'FWDNOANSWER';
    LINECALLREASON_FWDUNCOND                : result := 'FWDUNCOND';
    LINECALLREASON_PICKUP                   : result := 'PICKUP';
    LINECALLREASON_UNPARK                   : result := 'UNPARK';
    LINECALLREASON_REDIRECT                 : result := 'REDIRECT';
    LINECALLREASON_CALLCOMPLETION           : result := 'CALLCOMPLETION';
    LINECALLREASON_TRANSFER                 : result := 'TRANSFER';
    LINECALLREASON_REMINDER                 : result := 'REMINDER';
    LINECALLREASON_UNKNOWN                  : result := 'UNKNOWN';
    LINECALLREASON_UNAVAIL                  : result := 'UNAVAIL';
    LINECALLREASON_INTRUDE                  : result := 'INTRUDE';      // TAPI v1.4
    LINECALLREASON_PARKED                   : result := 'PARKED';       // TAPI v1.4
    LINECALLREASON_CAMPEDON                 : result := 'CAMPEDON';     // TAPI v2.0
    LINECALLREASON_ROUTEREQUEST             : result := 'ROUTEREQUEST'; // TAPI v2.0
  else
    if CallReason > 0 then
      result := Format('LINECALLREASON_$%x', [CallReason]);
  end;
end;

{ ============================================================================ }
{ L I N E C A L L P R I V I L E G E }
{ ============================================================================ }

{*****************************************************************************}
function StrToLineCallPrivilege(CallPrivilege: String): DWORD;
{*****************************************************************************}
begin
  if      CallPrivilege = 'NONE'     then result := LINECALLPRIVILEGE_NONE
  else if CallPrivilege = 'MONITOR'  then result := LINECALLPRIVILEGE_MONITOR
  else if CallPrivilege = 'OWNER'    then result := LINECALLPRIVILEGE_OWNER
  else result := LINECALLPRIVILEGE_NONE;
end;

{*****************************************************************************}
function LineCallParamFlagsToStr(CallParamFlags: DWORD; Spacer: String): String;
{*****************************************************************************}
begin
  result := '';
  if (CallParamFlags and LINECALLPARAMFLAGS_SECURE)          > 0 then result := OrStr(result, 'SECURE',            Spacer);
  if (CallParamFlags and LINECALLPARAMFLAGS_IDLE)            > 0 then result := OrStr(result, 'IDLE',              Spacer);
  if (CallParamFlags and LINECALLPARAMFLAGS_BLOCKID)         > 0 then result := OrStr(result, 'BLOCKID',           Spacer);
  if (CallParamFlags and LINECALLPARAMFLAGS_ORIGOFFHOOK)     > 0 then result := OrStr(result, 'ORIGOFFHOOK',       Spacer);
  if (CallParamFlags and LINECALLPARAMFLAGS_DESTOFFHOOK)     > 0 then result := OrStr(result, 'DESTOFFHOOK',       Spacer);
  if (CallParamFlags and LINECALLPARAMFLAGS_NOHOLDCONFERENCE)> 0 then result := OrStr(result, 'NOHOLDCONFERENCE',  Spacer);
  if (CallParamFlags and LINECALLPARAMFLAGS_PREDICTIVEDIAL)  > 0 then result := OrStr(result, 'PREDICTIVEDIAL',    Spacer);
  if (CallParamFlags and LINECALLPARAMFLAGS_ONESTEPTRANSFER) > 0 then result := OrStr(result, 'ONESTEPTRANSFER',   Spacer);
end;

{*****************************************************************************}
function LineCallPrivilegesToStr(CallPrivileges: DWORD; Spacer: String) : string;
{*****************************************************************************}
begin
  result := '';
  if (CallPrivileges and LINECALLPRIVILEGE_OWNER)   > 0 then result := OrStr(result, 'OWNER',   Spacer);
  if (CallPrivileges and LINECALLPRIVILEGE_MONITOR) > 0 then result := Orstr(result, 'MONITOR', Spacer);
  if (CallPrivileges and LINECALLPRIVILEGE_NONE)    > 0 then result := Orstr(result, 'NONE',    Spacer);
end;

{ ============================================================================ }
{ L I N E A D D R E S S S T A T E }
{ ============================================================================ }

{*****************************************************************************}
function LineAddrStateToStr(AddressState: DWORD) : string;
{*****************************************************************************}
begin
  Result:='';
  case AddressState of
    LINEADDRESSSTATE_CAPSCHANGE   : result := 'CAPSCHANGE';
    LINEADDRESSSTATE_DEVSPECIFIC  : result := 'DEVSPECIFIC';
    LINEADDRESSSTATE_FORWARD      : result := 'FORWARD';
    LINEADDRESSSTATE_INUSEMANY    : result := 'INUSEMANY';
    LINEADDRESSSTATE_INUSEONE     : result := 'INUSEONE';
    LINEADDRESSSTATE_INUSEZERO    : result := 'INUSEZERO';
    LINEADDRESSSTATE_NUMCALLS     : result := 'NUMCALLS';
    LINEADDRESSSTATE_OTHER        : result := 'OTHER';
    LINEADDRESSSTATE_TERMINALS    : result := 'TERMINALS';
  else
    if AddressState > 0 then
      result := Format('LINEADDRESSSTATE_$%x', [AddressState]);
  end;
end;

{*****************************************************************************}
function LineAddrStatesToStr(AddressState: DWORD; Spacer: String) : String;
{*****************************************************************************}
begin
  result := '';
  if (AddressState and LINEADDRESSSTATE_CAPSCHANGE) > 0 then result := OrStr(result, 'CAPSCHANGE',  Spacer);
  if (AddressState and LINEADDRESSSTATE_DEVSPECIFIC)> 0 then result := OrStr(result, 'DEVSPECIFIC', Spacer);
  if (AddressState and LINEADDRESSSTATE_FORWARD)    > 0 then result := OrStr(result, 'FORWARD',     Spacer);
  if (AddressState and LINEADDRESSSTATE_INUSEMANY)  > 0 then result := OrStr(result, 'INUSEMANY',   Spacer);
  if (AddressState and LINEADDRESSSTATE_INUSEONE)   > 0 then result := OrStr(result, 'INUSEONE',    Spacer);
  if (AddressState and LINEADDRESSSTATE_INUSEZERO)  > 0 then result := OrStr(result, 'INUSEZERO',   Spacer);
  if (AddressState and LINEADDRESSSTATE_NUMCALLS)   > 0 then result := OrStr(result, 'NUMCALLS',    Spacer);
  if (AddressState and LINEADDRESSSTATE_OTHER)      > 0 then result := OrStr(result, 'OTHER',       Spacer);
  if (AddressState and LINEADDRESSSTATE_TERMINALS)  > 0 then result := OrStr(result, 'TERMINALS',   Spacer);
end;

{ ============================================================================ }
{ L I N E M E D I A M O D E }
{ ============================================================================ }

{*****************************************************************************}
function LineMediaModeToStr(MediaMode: DWORD): String;
{*****************************************************************************}
begin
  result := '';
  case MediaMode of
    LINEMEDIAMODE_UNKNOWN          : result := 'UNKNOWN';
    LINEMEDIAMODE_INTERACTIVEVOICE : result := 'INTERACTIVEVOICE';
    LINEMEDIAMODE_AUTOMATEDVOICE   : result := 'AUTOMATEDVOICE';
    LINEMEDIAMODE_DATAMODEM        : result := 'DATAMODEM';
    LINEMEDIAMODE_G3FAX            : result := 'G3FAX';
    LINEMEDIAMODE_TDD              : result := 'TDD';
    LINEMEDIAMODE_G4FAX            : result := 'G4FAX';
    LINEMEDIAMODE_DIGITALDATA      : result := 'DIGITALDATA';
    LINEMEDIAMODE_TELETEX          : result := 'TELETEX';
    LINEMEDIAMODE_VIDEOTEX         : result := 'VIDEOTEX';
    LINEMEDIAMODE_TELEX            : result := 'TELEX';
    LINEMEDIAMODE_MIXED            : result := 'MIXED';
    LINEMEDIAMODE_ADSI             : result := 'ADSI';
    LINEMEDIAMODE_VOICEVIEW        : result := 'VOICEVIEW';
  else
    if MediaMode > 0 then
      result := Format('LINEMEDIAMODE_$%x', [MediaMode]);
  end;
end;

{*****************************************************************************}
function LineMediaModesToStr(MediaModes: DWORD; Spacer: String) : String;
{*****************************************************************************}
begin
  result := '';
  if (MediaModes and LINEMEDIAMODE_INTERACTIVEVOICE) > 0 then result := OrStr(result, 'INTERACTIVEVOICE', Spacer);
  if (MediaModes and LINEMEDIAMODE_AUTOMATEDVOICE)   > 0 then result := OrStr(result, 'AUTOMATEDVOICE', Spacer);
  if (MediaModes and LINEMEDIAMODE_DATAMODEM)        > 0 then result := OrStr(result, 'DATAMODEM', Spacer);
  if (MediaModes and LINEMEDIAMODE_G3FAX)            > 0 then result := OrStr(result, 'G3FAX', Spacer);
  if (MediaModes and LINEMEDIAMODE_TDD)              > 0 then result := OrStr(result, 'TDD', Spacer);
  if (MediaModes and LINEMEDIAMODE_G4FAX)            > 0 then result := OrStr(result, 'G4FAX', Spacer);
  if (MediaModes and LINEMEDIAMODE_DIGITALDATA)      > 0 then result := OrStr(result, 'DIGITALDATA', Spacer);
  if (MediaModes and LINEMEDIAMODE_TELETEX)          > 0 then result := OrStr(result, 'TELETEX', Spacer);
  if (MediaModes and LINEMEDIAMODE_VIDEOTEX)         > 0 then result := OrStr(result, 'VIDEOTEX', Spacer);
  if (MediaModes and LINEMEDIAMODE_TELEX)            > 0 then result := OrStr(result, 'TELEX', Spacer);
  if (MediaModes and LINEMEDIAMODE_MIXED)            > 0 then result := OrStr(result, 'MIXED', Spacer);
  if (MediaModes and LINEMEDIAMODE_ADSI)             > 0 then result := OrStr(result, 'ADSI', Spacer);
  if (MediaModes and LINEMEDIAMODE_VOICEVIEW)        > 0 then result := OrStr(result, 'VOICEVIEW', Spacer);
  if (MediaModes and LINEMEDIAMODE_UNKNOWN)          > 0 then result := OrStr(result, 'UNKNOWN', Spacer);
  if (MediaModes and LINEMEDIAMODE_VIDEO)            > 0 then result := OrStr(result, 'VIDEO', Spacer);   // TAPI v2.1
end;

{*****************************************************************************}
procedure LineMediaModesToStrList (MediaModes : DWORD; List : TStrings );
{*****************************************************************************}
begin
  List.clear;
  if (LINEMEDIAMODE_UNKNOWN          and MediaModes) > 0 then List.add( 'UNKNOWN');
  if (LINEMEDIAMODE_INTERACTIVEVOICE and MediaModes) > 0 then List.add( 'INTERACTIVEVOICE');
  if (LINEMEDIAMODE_AUTOMATEDVOICE   and MediaModes) > 0 then List.add( 'AUTOMATEDVOICE');
  if (LINEMEDIAMODE_DATAMODEM        and MediaModes) > 0 then List.add( 'DATAMODEM');
  if (LINEMEDIAMODE_G3FAX            and MediaModes) > 0 then List.add( 'G3FAX');
  if (LINEMEDIAMODE_TDD              and MediaModes) > 0 then List.add( 'TDD');
  if (LINEMEDIAMODE_G4FAX            and MediaModes) > 0 then List.add( 'G4FAX');
  if (LINEMEDIAMODE_DIGITALDATA      and MediaModes) > 0 then List.add( 'DIGITALDATA');
  if (LINEMEDIAMODE_TELETEX          and MediaModes) > 0 then List.add( 'TELETEX');
  if (LINEMEDIAMODE_VIDEOTEX         and MediaModes) > 0 then List.add( 'VIDEOTEX');
  if (LINEMEDIAMODE_TELEX            and MediaModes) > 0 then List.add( 'TELEX');
  if (LINEMEDIAMODE_MIXED            and MediaModes) > 0 then List.add( 'MIXED');
  if (LINEMEDIAMODE_ADSI             and MediaModes) > 0 then List.add( 'ADSI');
  if (LINEMEDIAMODE_VOICEVIEW        and MediaModes) > 0 then List.add( 'VOICEVIEW');
end;

{*****************************************************************************}
function StrToLineMediaMode(MediaMode: String; Default: DWORD): DWORD;
{*****************************************************************************}
begin
  if      MediaMode = 'UNKNOWN'           then result  := LINEMEDIAMODE_UNKNOWN
  else if MediaMode = 'INTERACTIVEVOICE'  then result  := LINEMEDIAMODE_INTERACTIVEVOICE
  else if MediaMode = 'AUTOMATEDVOICE'    then result  := LINEMEDIAMODE_AUTOMATEDVOICE
  else if MediaMode = 'DATAMODEM'         then result  := LINEMEDIAMODE_DATAMODEM
  else if MediaMode = 'G3FAX'             then result  := LINEMEDIAMODE_G3FAX
  else if MediaMode = 'TDD'               then result  := LINEMEDIAMODE_TDD
  else if MediaMode = 'G4FAX'             then result  := LINEMEDIAMODE_G4FAX
  else if MediaMode = 'DIGITALDATA'       then result  := LINEMEDIAMODE_DIGITALDATA
  else if MediaMode = 'TELETEX'           then result  := LINEMEDIAMODE_TELETEX
  else if MediaMode = 'VIDEOTEX'          then result  := LINEMEDIAMODE_VIDEOTEX
  else if MediaMode = 'TELEX'             then result  := LINEMEDIAMODE_TELEX
  else if MediaMode = 'MIXED'             then result  := LINEMEDIAMODE_MIXED
  else if MediaMode = 'ADSI'              then result  := LINEMEDIAMODE_ADSI
  else if MediaMode = 'VOICEVIEW'         then result  := LINEMEDIAMODE_VOICEVIEW
  else if MediaMode = 'VIDEO'             then result  := LINEMEDIAMODE_VIDEO
  else
    result := Default;
end;

{ ============================================================================ }
{ L I N E B E A R E R M O D E }
{ ============================================================================ }

{*****************************************************************************}
function StrToLineBearerMode(BearerMode: string) : DWORD;
{*****************************************************************************}
begin
  if      BearerMode = 'VOICE'              then result  := LINEBEARERMODE_VOICE
  else if BearerMode = 'SPEECH'             then result  := LINEBEARERMODE_SPEECH
  else if BearerMode = 'MULTIUSE'           then result  := LINEBEARERMODE_MULTIUSE
  else if BearerMode = 'DATA'               then result  := LINEBEARERMODE_DATA
  else if BearerMode = 'ALTSPEECHDATA'      then result  := LINEBEARERMODE_ALTSPEECHDATA
  else if BearerMode = 'NONCALLSIGNALING'   then result  := LINEBEARERMODE_NONCALLSIGNALING
  else if BearerMode = 'PASSTHROUGH'        then result  := LINEBEARERMODE_PASSTHROUGH
  else result := 0;
end;

{*****************************************************************************}
function LineBearerModeToStr(BearerMode: DWORD) : String;
{*****************************************************************************}
begin
  case BearerMode of
    LINEBEARERMODE_VOICE              : result := 'VOICE';
    LINEBEARERMODE_SPEECH             : result := 'SPEECH';
    LINEBEARERMODE_MULTIUSE           : result := 'MULTIUSE';
    LINEBEARERMODE_DATA               : result := 'DATA';
    LINEBEARERMODE_ALTSPEECHDATA      : result := 'ALTSPEECHDATA';
    LINEBEARERMODE_NONCALLSIGNALING   : result := 'NONCALLSIGNALING';
    LINEBEARERMODE_PASSTHROUGH        : result := 'PASSTHROUGH';
  else
    result := Format('$%x', [BearerMode]);
  end;
end;

{*****************************************************************************}
procedure LineBearerModesToStrList(BearerModes: DWORD; List: TStrings );
{*****************************************************************************}
begin
  List.clear;
  if (LINEBEARERMODE_VOICE            and BearerModes) > 0 then List.add('VOICE');
  if (LINEBEARERMODE_SPEECH           and BearerModes) > 0 then List.add('SPEECH');
  if (LINEBEARERMODE_MULTIUSE         and BearerModes) > 0 then List.add('MULTIUSE');
  if (LINEBEARERMODE_DATA             and BearerModes) > 0 then List.add('DATA');
  if (LINEBEARERMODE_ALTSPEECHDATA    and BearerModes) > 0 then List.add('ALTSPEECHDATA');
  if (LINEBEARERMODE_NONCALLSIGNALING and BearerModes) > 0 then List.add('NONCALLSIGNALING');
  if (LINEBEARERMODE_PASSTHROUGH      and BearerModes) > 0 then List.add('PASSTHROUGH');
end;

{*****************************************************************************}
function LineBearerModesToStr(BearerModes: DWORD) : String;
{*****************************************************************************}
begin
  Result := '';
  if (LINEBEARERMODE_VOICE            and BearerModes) > 0 then Result := OrStr(Result, 'VOICE');
  if (LINEBEARERMODE_SPEECH           and BearerModes) > 0 then Result := OrStr(Result, 'SPEECH');
  if (LINEBEARERMODE_MULTIUSE         and BearerModes) > 0 then Result := OrStr(Result, 'MULTIUSE');
  if (LINEBEARERMODE_DATA             and BearerModes) > 0 then Result := OrStr(Result, 'DATA');
  if (LINEBEARERMODE_ALTSPEECHDATA    and BearerModes) > 0 then Result := OrStr(Result, 'ALTSPEECHDATA');
  if (LINEBEARERMODE_NONCALLSIGNALING and BearerModes) > 0 then Result := OrStr(Result, 'NONCALLSIGNALING');
  if (LINEBEARERMODE_PASSTHROUGH      and BearerModes) > 0 then Result := OrStr(Result, 'PASSTHROUGH');
end;

{ ============================================================================ }
{ L I N E A D D R E S S M O D E }
{ ============================================================================ }

{*****************************************************************************}
procedure LineAddressModesToStrList(AddressModes: DWORD; List : TStrings );
{*****************************************************************************}
begin
  List.clear;
  if (LINEADDRESSMODE_ADDRESSID       and AddressModes) > 0 then List.add('ADDRESSID');
  if (LINEADDRESSMODE_DIALABLEADDR    and AddressModes) > 0 then List.add('DIALABLEADDR');
end;

{*****************************************************************************}
function StrToLineAddressMode(AddressMode: String) : DWORD;
{*****************************************************************************}
begin
  if      AddressMode = 'ADDRESSID'    then result  := LINEADDRESSMODE_ADDRESSID
  else if AddressMode = 'DIALABLEADDR' then result  := LINEADDRESSMODE_DIALABLEADDR
  else result := 0;
end;

{*****************************************************************************}
function LineAddressModeToStr(AddressMode: DWORD): String;
{*****************************************************************************}
begin
  result := '';
  case AddressMode of
    LINEADDRESSMODE_ADDRESSID         : result := 'ADDRESSID';
    LINEADDRESSMODE_DIALABLEADDR      : result := 'DIALABLEADDR';
  else
    if AddressMode > 0 then
      result := Format('LINEADDRESSMODE_$%x', [AddressMode]);
  end;
end;

{ ============================================================================ }
{ L I N E D E V S T A T E }
{ ============================================================================ }

{*****************************************************************************}
function LineDevStateToStr(DeviceState: DWORD) : string;
{*****************************************************************************}
begin
  Result:='';
  case DeviceState of
    LINEDEVSTATE_OTHER            : result := 'OTHER';
    LINEDEVSTATE_RINGING          : result := 'RINGING';
    LINEDEVSTATE_CONNECTED        : result := 'CONNECTED';
    LINEDEVSTATE_DISCONNECTED     : result := 'DISCONNECTED';
    LINEDEVSTATE_MSGWAITON        : result := 'MSGWAITON';
    LINEDEVSTATE_MSGWAITOFF       : result := 'MSGWAITOFF';
    LINEDEVSTATE_INSERVICE        : result := 'INSERVICE';
    LINEDEVSTATE_OUTOFSERVICE     : result := 'OUTOFSERVICE';
    LINEDEVSTATE_MAINTENANCE      : result := 'MAINTENANCE';
    LINEDEVSTATE_OPEN             : result := 'OPEN';
    LINEDEVSTATE_CLOSE            : result := 'CLOSE';
    LINEDEVSTATE_NUMCALLS         : result := 'NUMCALLS';
    LINEDEVSTATE_NUMCOMPLETIONS   : result := 'NUMCOMPLETIONS';
    LINEDEVSTATE_TERMINALS        : result := 'TERMINALS';
    LINEDEVSTATE_ROAMMODE         : result := 'ROAMMODE';
    LINEDEVSTATE_BATTERY          : result := 'BATTERY';
    LINEDEVSTATE_SIGNAL           : result := 'SIGNAL';
    LINEDEVSTATE_DEVSPECIFIC      : result := 'DEVSPECIFIC';
    LINEDEVSTATE_REINIT           : result := 'REINIT';
    LINEDEVSTATE_LOCK             : result := 'LOCK';
    LINEDEVSTATE_CAPSCHANGE       : result := 'CAPSCHANGE';      // TAPI v1.4
    LINEDEVSTATE_CONFIGCHANGE     : result := 'CONFIGCHANGE';    // TAPI v1.4
    LINEDEVSTATE_TRANSLATECHANGE  : result := 'TRANSLATECHANGE'; // TAPI v1.4
    LINEDEVSTATE_COMPLCANCEL      : result := 'COMPLCANCEL';     // TAPI v1.4
    LINEDEVSTATE_REMOVED          : result := 'REMOVED';         // TAPI v1.4
  else
    if DeviceState > 0 then
      result := Format('LINEDEVSTATE_$%x', [DeviceState]);
  end;
end;

{*****************************************************************************}
function LineDevStatesToStr(DeviceState: DWORD; Spacer: String): String;
{*****************************************************************************}
begin
  Result:='';
  if (DeviceState and LINEDEVSTATE_OTHER)           > 0 then result := OrStr(result, 'OTHER',         Spacer);
  if (DeviceState and LINEDEVSTATE_RINGING)         > 0 then result := OrStr(result, 'RINGING',       Spacer);
  if (DeviceState and LINEDEVSTATE_CONNECTED)       > 0 then result := OrStr(result, 'CONNECTED',     Spacer);
  if (DeviceState and LINEDEVSTATE_DISCONNECTED)    > 0 then result := OrStr(result, 'DISCONNECTED',  Spacer);
  if (DeviceState and LINEDEVSTATE_MSGWAITON)       > 0 then result := OrStr(result, 'MSGWAITON',     Spacer);
  if (DeviceState and LINEDEVSTATE_MSGWAITOFF)      > 0 then result := OrStr(result, 'MSGWAITOFF',    Spacer);
  if (DeviceState and LINEDEVSTATE_INSERVICE)       > 0 then result := OrStr(result, 'INSERVICE',     Spacer);
  if (DeviceState and LINEDEVSTATE_OUTOFSERVICE)    > 0 then result := OrStr(result, 'OUTOFSERVICE',  Spacer);
  if (DeviceState and LINEDEVSTATE_MAINTENANCE)     > 0 then result := OrStr(result, 'MAINTENANCE',   Spacer);
  if (DeviceState and LINEDEVSTATE_OPEN)            > 0 then result := OrStr(result, 'OPEN',          Spacer);
  if (DeviceState and LINEDEVSTATE_CLOSE)           > 0 then result := OrStr(result, 'CLOSE',         Spacer);
  if (DeviceState and LINEDEVSTATE_NUMCALLS)        > 0 then result := OrStr(result, 'NUMCALLS',      Spacer);
  if (DeviceState and LINEDEVSTATE_NUMCOMPLETIONS)  > 0 then result := OrStr(result, 'NUMCOMPLETIONS',Spacer);
  if (DeviceState and LINEDEVSTATE_TERMINALS)       > 0 then result := OrStr(result, 'TERMINALS',     Spacer);
  if (DeviceState and LINEDEVSTATE_ROAMMODE)        > 0 then result := OrStr(result, 'ROAMMODE',      Spacer);
  if (DeviceState and LINEDEVSTATE_BATTERY)         > 0 then result := OrStr(result, 'BATTERY',       Spacer);
  if (DeviceState and LINEDEVSTATE_SIGNAL)          > 0 then result := OrStr(result, 'SIGNAL',        Spacer);
  if (DeviceState and LINEDEVSTATE_DEVSPECIFIC)     > 0 then result := OrStr(result, 'DEVSPECIFIC',   Spacer);
  if (DeviceState and LINEDEVSTATE_REINIT)          > 0 then result := OrStr(result, 'REINIT',        Spacer);
  if (DeviceState and LINEDEVSTATE_LOCK)            > 0 then result := OrStr(result, 'LOCK',          Spacer);
  if (DeviceState and LINEDEVSTATE_CAPSCHANGE)      > 0 then result := OrStr(result, 'CAPSCHANGE',    Spacer);  // TAPI v1.4
  if (DeviceState and LINEDEVSTATE_CONFIGCHANGE)    > 0 then result := OrStr(result, 'CONFIGCHANGE',  Spacer);  // TAPI v1.4
  if (DeviceState and LINEDEVSTATE_TRANSLATECHANGE) > 0 then result := OrStr(result, 'TRANSLATECHANGE',Spacer); // TAPI v1.4
  if (DeviceState and LINEDEVSTATE_COMPLCANCEL)     > 0 then result := OrStr(result, 'COMPLCANCEL',   Spacer);  // TAPI v1.4
  if (DeviceState and LINEDEVSTATE_REMOVED)         > 0 then result := OrStr(result, 'REMOVED',       Spacer);  // TAPI v1.4
end;

{ ============================================================================ }
{ L I N E D I S C O N N E C T M O D E }
{ ============================================================================ }

{*****************************************************************************}
function LineDiscModeToStr(DiscMode: DWORD) : String;
{*****************************************************************************}
begin
  result := '';
  case DiscMode of
    LINEDISCONNECTMODE_NORMAL           :      Result := 'NORMAL';
    LINEDISCONNECTMODE_UNKNOWN          :      Result := 'UNKNOWN';
    LINEDISCONNECTMODE_REJECT           :      Result := 'REJECT';
    LINEDISCONNECTMODE_PICKUP           :      Result := 'PICKUP';
    LINEDISCONNECTMODE_FORWARDED        :      Result := 'FORWARDED';
    LINEDISCONNECTMODE_BUSY             :      Result := 'BUSY';
    LINEDISCONNECTMODE_NOANSWER         :      Result := 'NOANSWER';
    LINEDISCONNECTMODE_BADADDRESS       :      Result := 'BADADDRESS';
    LINEDISCONNECTMODE_UNREACHABLE      :      Result := 'UNREACHABLE';
    LINEDISCONNECTMODE_CONGESTION       :      Result := 'CONGESTION';
    LINEDISCONNECTMODE_INCOMPATIBLE     :      Result := 'INCOMPATIBLE';
    LINEDISCONNECTMODE_UNAVAIL          :      Result := 'UNAVAIL';
    LINEDISCONNECTMODE_NODIALTONE       :      Result := 'NODIALTONE';
    LINEDISCONNECTMODE_NUMBERCHANGED    :      Result := 'NUMBERCHANGED';
    LINEDISCONNECTMODE_OUTOFORDER       :      Result := 'OUTOFORDER';
    LINEDISCONNECTMODE_TEMPFAILURE      :      Result := 'TEMPFAILURE';
    LINEDISCONNECTMODE_QOSUNAVAIL       :      Result := 'QOSUNAVAIL';
    LINEDISCONNECTMODE_BLOCKED          :      Result := 'BLOCKED';
    LINEDISCONNECTMODE_DONOTDISTURB     :      Result := 'DONOTDISTURB';
    LINEDISCONNECTMODE_CANCELLED        :      Result := 'CANCELLED';
  else
    if DiscMode > 0 then
      result := Format('LINEDISCONNECTMODE_$%x', [DiscMode]);
  end;
end;

{*****************************************************************************}
procedure LineDiscModesToStrList(DiscModes : DWORD; List: TStrings );
{*****************************************************************************}
begin
  List.clear;
  if (LINEDISCONNECTMODE_NORMAL        and DiscModes)  > 0 then List.add('NORMAL');
  if (LINEDISCONNECTMODE_UNKNOWN       and DiscModes)  > 0 then List.add('UNKNOWN');
  if (LINEDISCONNECTMODE_REJECT        and DiscModes)  > 0 then List.add('REJECT');
  if (LINEDISCONNECTMODE_PICKUP        and DiscModes)  > 0 then List.add('PICKUP');
  if (LINEDISCONNECTMODE_FORWARDED     and DiscModes)  > 0 then List.add('FORWARDED');
  if (LINEDISCONNECTMODE_BUSY          and DiscModes)  > 0 then List.add('BUSY');
  if (LINEDISCONNECTMODE_NOANSWER      and DiscModes)  > 0 then List.add('NOANSWER');
  if (LINEDISCONNECTMODE_BADADDRESS    and DiscModes)  > 0 then List.add('BADADDRESS');
  if (LINEDISCONNECTMODE_UNREACHABLE   and DiscModes)  > 0 then List.add('UNREACHABLE');
  if (LINEDISCONNECTMODE_CONGESTION    and DiscModes)  > 0 then List.add('CONGESTION');
  if (LINEDISCONNECTMODE_INCOMPATIBLE  and DiscModes)  > 0 then List.add('INCOMPATIBLE');
  if (LINEDISCONNECTMODE_UNAVAIL       and DiscModes)  > 0 then List.add('UNAVAIL');
  if (LINEDISCONNECTMODE_NODIALTONE    and DiscModes)  > 0 then List.add('NODIALTONE');
  if (LINEDISCONNECTMODE_NUMBERCHANGED and DiscModes)  > 0 then List.add('NUMBERCHANGED');
  if (LINEDISCONNECTMODE_OUTOFORDER    and DiscModes)  > 0 then List.add('OUTOFORDER');
  if (LINEDISCONNECTMODE_TEMPFAILURE   and DiscModes)  > 0 then List.add('TEMPFAILURE');
  if (LINEDISCONNECTMODE_QOSUNAVAIL    and DiscModes)  > 0 then List.add('QOSUNAVAIL');
  if (LINEDISCONNECTMODE_BLOCKED       and DiscModes)  > 0 then List.add('BLOCKED');
  if (LINEDISCONNECTMODE_DONOTDISTURB  and DiscModes)  > 0 then List.add('DONOTDISTURB');
  if (LINEDISCONNECTMODE_CANCELLED     and DiscModes)  > 0 then List.add('CANCELLED');
end;

{ ============================================================================ }
{ L i n e D i g i t M o d e }
{ ============================================================================ }

{*****************************************************************************}
function LineDigitModeToStr(DigitMode: DWORD): String;
{*****************************************************************************}
begin
  result := '0';
  case DigitMode of
    LINEDIGITMODE_DTMF    : result := 'DTMF';
    LINEDIGITMODE_DTMFEND : result := 'DTMFEND';
    LINEDIGITMODE_PULSE   : result := 'PULSE';
  else
    if DigitMode > 0 then
      result := Format('LINEDIGITMODE_$%x',[DigitMode])
  end;
end;

{*****************************************************************************}
procedure LineDigitModesToStrList(DigitMode: DWORD; List: TStrings);
{*****************************************************************************}
begin
  List.Clear;
  if (DigitMode and LINEDIGITMODE_DTMF   ) > 0 then List.Add('DTMF');
  if (DigitMode and LINEDIGITMODE_DTMFEND) > 0 then List.Add('DTMFEND');
  if (DigitMode and LINEDIGITMODE_PULSE  ) > 0 then List.Add('PULSE');
end;

{*****************************************************************************}
function StrToLineDigitMode(DigitMode: String; Default: DWORD=0): DWORD;
{*****************************************************************************}
begin
  if      DigitMode = 'DTMF'    then result  := LINEDIGITMODE_DTMF
  else if DigitMode = 'DTMFEND' then result  := LINEDIGITMODE_DTMFEND
  else if DigitMode = 'PULSE'   then result  := LINEDIGITMODE_PULSE
  else result := Default;
end;

{ ============================================================================ }
{ P H O N E P R I V I L E G E S }
{ ============================================================================ }

{*****************************************************************************}
function PhonePrivilegesToStr(Value: DWORD; Spacer: String) : string;
{*****************************************************************************}
begin
  result := '';
  if (value and PHONEPRIVILEGE_OWNER)   > 0 then result := OrStr(result, 'OWNER',   Spacer);
  if (value and PHONEPRIVILEGE_MONITOR) > 0 then result := Orstr(result, 'MONITOR', Spacer);
end;

{ ============================================================================ }
{ P H O N E L A M P M O D E }
{ ============================================================================ }

{*****************************************************************************}
function PhoneLampModeToStr(LampMode: DWORD): String;
{*****************************************************************************}
begin
  result := '';
  case LampMode of
    PHONELAMPMODE_DUMMY         : result := 'DUMMY';
    PHONELAMPMODE_OFF           : result := 'OFF';
    PHONELAMPMODE_STEADY        : result := 'STEADY';
    PHONELAMPMODE_WINK          : result := 'WINK';
    PHONELAMPMODE_FLASH         : result := 'FLASH';
    PHONELAMPMODE_FLUTTER       : result := 'FLUTTER';
    PHONELAMPMODE_BROKENFLUTTER : result := 'BROKENFLUTTER';
    PHONELAMPMODE_UNKNOWN       : result := 'UNKNOWN';
  else
    if LampMode > 0 then
      result := Format('PHONELAMPMODE_$%x', [LampMode]);
  end;
end;

{ ============================================================================ }
{ P H O N E B U T T O N S T A T E }
{ ============================================================================ }

{*****************************************************************************}
function PhoneButtonStateToStr(ButtonState: DWORD): String;
{*****************************************************************************}
begin
  result := '';
  case ButtonState of
    PHONEBUTTONSTATE_UP                     : result := 'UP';
    PHONEBUTTONSTATE_DOWN                   : result := 'DOWN';
    PHONEBUTTONSTATE_UNKNOWN                : result := 'UNKNOWN';
    PHONEBUTTONSTATE_UNAVAIL                : result := 'UNAVAIL';
  else
    if ButtonState > 0 then
      result := Format('PHONEBUTTONSTATE_$%x', [ButtonState]);
  end;
end;

{ ============================================================================ }
{ P H O N E B U T T O N M O D E }
{ ============================================================================ }

{*****************************************************************************}
function PhoneButtonModeToStr(ButtonMode: DWORD): String;
{*****************************************************************************}
begin
  result := '';
  case ButtonMode of
    PHONEBUTTONMODE_DUMMY                   : result := 'DUMMY';
    PHONEBUTTONMODE_CALL                    : result := 'CALL';
    PHONEBUTTONMODE_FEATURE                 : result := 'FEATURE';
    PHONEBUTTONMODE_KEYPAD                  : result := 'KEYPAD';
    PHONEBUTTONMODE_LOCAL                   : result := 'LOCAL';
    PHONEBUTTONMODE_DISPLAY                 : result := 'DISPLAY';
  else
    if ButtonMode > 0 then
      result := Format('PHONEBUTTONMODE_$%x', [ButtonMode]);
  end;
end;

{ ============================================================================ }
{ P H O N E B U T T O N F U N C T I O N }
{ ============================================================================ }

{*****************************************************************************}
function PhoneButtonFunctionToStr(ButtonFunction: DWORD): String;
{*****************************************************************************}
begin
  result := '';
  case ButtonFunction of
    PHONEBUTTONFUNCTION_UNKNOWN             : result := 'UNKNOWN';
    PHONEBUTTONFUNCTION_CONFERENCE          : result := 'CONFERENCE';
    PHONEBUTTONFUNCTION_TRANSFER            : result := 'TRANSFER';
    PHONEBUTTONFUNCTION_DROP                : result := 'DROP';
    PHONEBUTTONFUNCTION_HOLD                : result := 'HOLD';
    PHONEBUTTONFUNCTION_RECALL              : result := 'RECALL';
    PHONEBUTTONFUNCTION_DISCONNECT          : result := 'DISCONNECT';
    PHONEBUTTONFUNCTION_CONNECT             : result := 'CONNECT';
    PHONEBUTTONFUNCTION_MSGWAITON           : result := 'MSGWAITON';
    PHONEBUTTONFUNCTION_MSGWAITOFF          : result := 'MSGWAITOFF';
    PHONEBUTTONFUNCTION_SELECTRING          : result := 'SELECTRING';
    PHONEBUTTONFUNCTION_ABBREVDIAL          : result := 'ABBREVDIAL';
    PHONEBUTTONFUNCTION_FORWARD             : result := 'FORWARD';
    PHONEBUTTONFUNCTION_PICKUP              : result := 'PICKUP';
    PHONEBUTTONFUNCTION_RINGAGAIN           : result := 'RINGAGAIN';
    PHONEBUTTONFUNCTION_PARK                : result := 'PARK';
    PHONEBUTTONFUNCTION_REJECT              : result := 'REJECT';
    PHONEBUTTONFUNCTION_REDIRECT            : result := 'REDIRECT';
    PHONEBUTTONFUNCTION_MUTE                : result := 'MUTE';
    PHONEBUTTONFUNCTION_VOLUMEUP            : result := 'VOLUMEUP';
    PHONEBUTTONFUNCTION_VOLUMEDOWN          : result := 'VOLUMEDOWN';
    PHONEBUTTONFUNCTION_SPEAKERON           : result := 'SPEAKERON';
    PHONEBUTTONFUNCTION_SPEAKEROFF          : result := 'SPEAKEROFF';
    PHONEBUTTONFUNCTION_FLASH               : result := 'FLASH';
    PHONEBUTTONFUNCTION_DATAON              : result := 'DATAON';
    PHONEBUTTONFUNCTION_DATAOFF             : result := 'DATAOFF';
    PHONEBUTTONFUNCTION_DONOTDISTURB        : result := 'DONOTDISTURB';
    PHONEBUTTONFUNCTION_INTERCOM            : result := 'INTERCOM';
    PHONEBUTTONFUNCTION_BRIDGEDAPP          : result := 'BRIDGEDAPP';
    PHONEBUTTONFUNCTION_BUSY                : result := 'BUSY';
    PHONEBUTTONFUNCTION_CALLAPP             : result := 'CALLAPP';
    PHONEBUTTONFUNCTION_DATETIME            : result := 'DATETIME';
    PHONEBUTTONFUNCTION_DIRECTORY           : result := 'DIRECTORY';
    PHONEBUTTONFUNCTION_COVER               : result := 'COVER';
    PHONEBUTTONFUNCTION_CALLID              : result := 'CALLID';
    PHONEBUTTONFUNCTION_LASTNUM             : result := 'LASTNUM';
    PHONEBUTTONFUNCTION_NIGHTSRV            : result := 'NIGHTSRV';
    PHONEBUTTONFUNCTION_SENDCALLS           : result := 'SENDCALLS';
    PHONEBUTTONFUNCTION_MSGINDICATOR        : result := 'MSGINDICATOR';
    PHONEBUTTONFUNCTION_REPDIAL             : result := 'REPDIAL';
    PHONEBUTTONFUNCTION_SETREPDIAL          : result := 'SETREPDIAL';
    PHONEBUTTONFUNCTION_SYSTEMSPEED         : result := 'SYSTEMSPEED';
    PHONEBUTTONFUNCTION_STATIONSPEED        : result := 'STATIONSPEED';
    PHONEBUTTONFUNCTION_CAMPON              : result := 'CAMPON';
    PHONEBUTTONFUNCTION_SAVEREPEAT          : result := 'SAVEREPEAT';
    PHONEBUTTONFUNCTION_QUEUECALL           : result := 'QUEUECALL';
    PHONEBUTTONFUNCTION_NONE                : result := 'NONE';
  else
    if ButtonFunction > 0 then
      result := Format('PHONEBUTTONFUNCTION_$%x', [ButtonFunction]);
  end;
end;

{ ============================================================================ }
{ P H O N E S T A T E _ }
{ ============================================================================ }

{*****************************************************************************}
function PhoneStateToStr(PhoneState: DWORD): String;
{*****************************************************************************}
begin
  result := '';
  case PhoneState of
    PHONESTATE_OTHER                        : result :='OTHER';
    PHONESTATE_CONNECTED                    : result :='CONNECTED';
    PHONESTATE_DISCONNECTED                 : result :='DISCONNECTED';
    PHONESTATE_OWNER                        : result :='OWNER';
    PHONESTATE_MONITORS                     : result :='MONITORS ';
    PHONESTATE_DISPLAY                      : result :='DISPLAY';
    PHONESTATE_LAMP                         : result :='LAMP';
    PHONESTATE_RINGMODE                     : result :='RINGMODE ';
    PHONESTATE_RINGVOLUME                   : result :='RINGVOLUME';
    PHONESTATE_HANDSETHOOKSWITCH            : result :='HANDSETHOOKSWITCH';
    PHONESTATE_HANDSETVOLUME                : result :='HANDSETVOLUME ';
    PHONESTATE_HANDSETGAIN                  : result :='HANDSETGAIN';
    PHONESTATE_SPEAKERHOOKSWITCH            : result :='SPEAKERHOOKSWITCH';
    PHONESTATE_SPEAKERVOLUME                : result :='SPEAKERVOLUME ';
    PHONESTATE_SPEAKERGAIN                  : result :='SPEAKERGAIN';
    PHONESTATE_HEADSETHOOKSWITCH            : result :='HEADSETHOOKSWITCH';
    PHONESTATE_HEADSETVOLUME                : result :='HEADSETVOLUME ';
    PHONESTATE_HEADSETGAIN                  : result :='HEADSETGAIN';
    PHONESTATE_SUSPEND                      : result :='SUSPEND';
    PHONESTATE_RESUME                       : result :='RESUME';
    PHONESTATE_DEVSPECIFIC                  : result :='DEVSPECIFIC';
    PHONESTATE_REINIT                       : result :='REINIT';
    PHONESTATE_CAPSCHANGE                   : result :='CAPSCHANGE';     // TAPI v1.4
    PHONESTATE_REMOVED                      : result :='REMOVED';     // TAPI v1.4
  else
    if PhoneState > 0 then
      result := Format('PHONESTATE_ 0x%4.4X', [PhoneState]);
  end;
end;

{*****************************************************************************}
function PhoneErrToStr(PhoneError: DWORD) : String;
{*****************************************************************************}
begin
  result := '';
  case PhoneError of
    PHONEERR_ALLOCATED                      : result := 'ALLOCATED';
    PHONEERR_BADDEVICEID                    : result := 'BADDEVICEID';
    PHONEERR_INCOMPATIBLEAPIVERSION         : result := 'INCOMPATIBLEAPIVERSION';
    PHONEERR_INCOMPATIBLEEXTVERSION         : result := 'INCOMPATIBLEEXTVERSION';
    PHONEERR_INIFILECORRUPT                 : result := 'INIFILECORRUPT';
    PHONEERR_INUSE                          : result := 'INUSE';
    PHONEERR_INVALAPPHANDLE                 : result := 'INVALAPPHANDLE';
    PHONEERR_INVALAPPNAME                   : result := 'INVALAPPNAME';
    PHONEERR_INVALBUTTONLAMPID              : result := 'INVALBUTTONLAMPID';
    PHONEERR_INVALBUTTONMODE                : result := 'INVALBUTTONMODE';
    PHONEERR_INVALBUTTONSTATE               : result := 'INVALBUTTONSTATE';
    PHONEERR_INVALDATAID                    : result := 'INVALDATAID';
    PHONEERR_INVALDEVICECLASS               : result := 'INVALDEVICECLASS';
    PHONEERR_INVALEXTVERSION                : result := 'INVALEXTVERSION';
    PHONEERR_INVALHOOKSWITCHDEV             : result := 'INVALHOOKSWITCHDEV';
    PHONEERR_INVALHOOKSWITCHMODE            : result := 'INVALHOOKSWITCHMODE';
    PHONEERR_INVALLAMPMODE                  : result := 'INVALLAMPMODE';
    PHONEERR_INVALPARAM                     : result := 'INVALPARAM';
    PHONEERR_INVALPHONEHANDLE               : result := 'INVALPHONEHANDLE';
    PHONEERR_INVALPHONESTATE                : result := 'INVALPHONESTATE';
    PHONEERR_INVALPOINTER                   : result := 'INVALPOINTER';
    PHONEERR_INVALPRIVILEGE                 : result := 'INVALPRIVILEGE';
    PHONEERR_INVALRINGMODE                  : result := 'INVALRINGMODE';
    PHONEERR_NODEVICE                       : result := 'NODEVICE';
    PHONEERR_NODRIVER                       : result := 'NODRIVER';
    PHONEERR_NOMEM                          : result := 'NOMEM';
    PHONEERR_NOTOWNER                       : result := 'NOTOWNER';
    PHONEERR_OPERATIONFAILED                : result := 'OPERATIONFAILED';
    PHONEERR_OPERATIONUNAVAIL               : result := 'OPERATIONUNAVAIL';
    PHONEERR_RESOURCEUNAVAIL                : result := 'RESOURCEUNAVAIL';
    PHONEERR_REQUESTOVERRUN                 : result := 'REQUESTOVERRUN';
    PHONEERR_STRUCTURETOOSMALL              : result := 'STRUCTURETOOSMALL';
    PHONEERR_UNINITIALIZED                  : result := 'UNINITIALIZED';
    PHONEERR_REINIT                         : result := 'REINIT';
    PHONEERR_DISCONNECTED                   : result := 'DISCONNECTED';
  else
    if PhoneError > 0 then
      result := Format('PHONEERR_$%x', [PhoneError])
  end;
end;

{ ============================================================================ }
{ L I N E _ M E S S A G E S                                                    }
{ ============================================================================ }

{*****************************************************************************}
function MessageIDToStr(MessageID: DWORD) : String;
{*****************************************************************************}
begin
  result := '';
  case MessageID of
    LINE_ADDRESSSTATE        : result := 'LINE_ADDRESSSTATE';
    LINE_CALLINFO            : result := 'LINE_CALLINFO';
    LINE_CALLSTATE           : result := 'LINE_CALLSTATE';
    LINE_CLOSE               : result := 'LINE_CLOSE';
    LINE_DEVSPECIFIC         : result := 'LINE_DEVSPECIFIC';
    LINE_DEVSPECIFICFEATURE  : result := 'LINE_DEVSPECIFICFEATURE';
    LINE_GATHERDIGITS        : result := 'LINE_GATHERDIGITS';
    LINE_GENERATE            : result := 'LINE_GENERATE';
    LINE_LINEDEVSTATE        : result := 'LINE_LINEDEVSTATE';
    LINE_MONITORDIGITS       : result := 'LINE_MONITORDIGITS';
    LINE_MONITORMEDIA        : result := 'LINE_MONITORMEDIA';
    LINE_MONITORTONE         : result := 'LINE_MONITORTONE';
    LINE_REPLY               : result := 'LINE_REPLY';
    LINE_REQUEST             : result := 'LINE_REQUEST';
    PHONE_BUTTON             : result := 'PHONE_BUTTON';
    PHONE_CLOSE              : result := 'PHONE_CLOSE';
    PHONE_DEVSPECIFIC        : result := 'PHONE_DEVSPECIFIC';
    PHONE_REPLY              : result := 'PHONE_REPLY';
    PHONE_STATE              : result := 'PHONE_STATE';
    LINE_CREATE              : result := 'LINE_CREATE';
    PHONE_CREATE             : result := 'PHONE_CREATE';

    LINE_AGENTSPECIFIC       : result := 'LINE_AGENTSPECIFIC';
    LINE_AGENTSTATUS         : result := 'LINE_AGENTSTATUS';
    LINE_APPNEWCALL          : result := 'LINE_APPNEWCALL';
    LINE_PROXYREQUEST        : result := 'LINE_PROXYREQUEST';
    LINE_REMOVE              : result := 'LINE_REMOVE';
    PHONE_REMOVE             : result := 'PHONE_REMOVE';
  else
    if MessageID > 0 then
      result := Format('LINE_/PHONE_$%x', [MessageID]);
  end;
end;

{ ============================================================================ }
{ L I N E E R R _                                                              }
{ ============================================================================ }

{*****************************************************************************}
function LineErrToStr(LineError: DWORD) : String;
{*****************************************************************************}
begin
  result := '';
  case LineError of
    LINEERR_ALLOCATED                   : result := 'ALLOCATED';
    LINEERR_BADDEVICEID                 : result := 'BADDEVICEID';
    LINEERR_BEARERMODEUNAVAIL           : result := 'BEARERMODEUNAVAIL';
    LINEERR_CALLUNAVAIL                 : result := 'CALLUNAVAIL';
    LINEERR_COMPLETIONOVERRUN           : result := 'COMPLETIONOVERRUN';
    LINEERR_CONFERENCEFULL              : result := 'CONFERENCEFULL';
    LINEERR_DIALBILLING                 : result := 'DIALBILLING';
    LINEERR_DIALDIALTONE                : result := 'DIALDIALTONE';
    LINEERR_DIALPROMPT                  : result := 'DIALPROMPT';
    LINEERR_DIALQUIET                   : result := 'DIALQUIET';
    LINEERR_INCOMPATIBLEAPIVERSION      : result := 'INCOMPATIBLEAPIVERSION';
    LINEERR_INCOMPATIBLEEXTVERSION      : result := 'INCOMPATIBLEEXTVERSION';
    LINEERR_INIFILECORRUPT              : result := 'INIFILECORRUPT';
    LINEERR_INUSE                       : result := 'INUSE';
    LINEERR_INVALADDRESS                : result := 'INVALADDRESS';
    LINEERR_INVALADDRESSID              : result := 'INVALADDRESSID';
    LINEERR_INVALADDRESSMODE            : result := 'INVALADDRESSMODE';
    LINEERR_INVALADDRESSSTATE           : result := 'INVALADDRESSSTATE';
    LINEERR_INVALAPPHANDLE              : result := 'INVALAPPHANDLE';
    LINEERR_INVALAPPNAME                : result := 'INVALAPPNAME';
    LINEERR_INVALBEARERMODE             : result := 'INVALBEARERMODE';
    LINEERR_INVALCALLCOMPLMODE          : result := 'INVALCALLCOMPLMODE';
    LINEERR_INVALCALLHANDLE             : result := 'INVALCALLHANDLE';
    LINEERR_INVALCALLPARAMS             : result := 'INVALCALLPARAMS';
    LINEERR_INVALCALLPRIVILEGE          : result := 'INVALCALLPRIVILEGE';
    LINEERR_INVALCALLSELECT             : result := 'INVALCALLSELECT';
    LINEERR_INVALCALLSTATE              : result := 'INVALCALLSTATE';
    LINEERR_INVALCALLSTATELIST          : result := 'INVALCALLSTATELIST';
    LINEERR_INVALCARD                   : result := 'INVALCARD';
    LINEERR_INVALCOMPLETIONID           : result := 'INVALCOMPLETIONID';
    LINEERR_INVALCONFCALLHANDLE         : result := 'INVALCONFCALLHANDLE';
    LINEERR_INVALCONSULTCALLHANDLE      : result := 'INVALCONSULTCALLHANDLE';
    LINEERR_INVALCOUNTRYCODE            : result := 'INVALCOUNTRYCODE';
    LINEERR_INVALDEVICECLASS            : result := 'INVALDEVICECLASS';
    LINEERR_INVALDEVICEHANDLE           : result := 'INVALDEVICEHANDLE';
    LINEERR_INVALDIALPARAMS             : result := 'INVALDIALPARAMS';
    LINEERR_INVALDIGITLIST              : result := 'INVALDIGITLIST';
    LINEERR_INVALDIGITMODE              : result := 'INVALDIGITMODE';
    LINEERR_INVALDIGITS                 : result := 'INVALDIGITS';
    LINEERR_INVALEXTVERSION             : result := 'INVALEXTVERSION';
    LINEERR_INVALGROUPID                : result := 'INVALGROUPID';
    LINEERR_INVALLINEHANDLE             : result := 'INVALLINEHANDLE';
    LINEERR_INVALLINESTATE              : result := 'INVALLINESTATE';
    LINEERR_INVALLOCATION               : result := 'INVALLOCATION';
    LINEERR_INVALMEDIALIST              : result := 'INVALMEDIALIST';
    LINEERR_INVALMEDIAMODE              : result := 'INVALMEDIAMODE';
    LINEERR_INVALMESSAGEID              : result := 'INVALMESSAGEID';
    LINEERR_INVALPARAM                  : result := 'INVALPARAM';
    LINEERR_INVALPARKID                 : result := 'INVALPARKID';
    LINEERR_INVALPARKMODE               : result := 'INVALPARKMODE';
    LINEERR_INVALPOINTER                : result := 'INVALPOINTER';
    LINEERR_INVALPRIVSELECT             : result := 'INVALPRIVSELECT';
    LINEERR_INVALRATE                   : result := 'INVALRATE';
    LINEERR_INVALREQUESTMODE            : result := 'INVALREQUESTMODE';
    LINEERR_INVALTERMINALID             : result := 'INVALTERMINALID';
    LINEERR_INVALTERMINALMODE           : result := 'INVALTERMINALMODE';
    LINEERR_INVALTIMEOUT                : result := 'INVALTIMEOUT';
    LINEERR_INVALTONE                   : result := 'INVALTONE';
    LINEERR_INVALTONELIST               : result := 'INVALTONELIST';
    LINEERR_INVALTONEMODE               : result := 'INVALTONEMODE';
    LINEERR_INVALTRANSFERMODE           : result := 'INVALTRANSFERMODE';
    LINEERR_LINEMAPPERFAILED            : result := 'LINEMAPPERFAILED';
    LINEERR_NOCONFERENCE                : result := 'NOCONFERENCE';
    LINEERR_NODEVICE                    : result := 'NODEVICE';
    LINEERR_NODRIVER                    : result := 'NODRIVER';
    LINEERR_NOMEM                       : result := 'NOMEM';
    LINEERR_NOREQUEST                   : result := 'NOREQUEST';
    LINEERR_NOTOWNER                    : result := 'NOTOWNER';
    LINEERR_NOTREGISTERED               : result := 'NOTREGISTERED';
    LINEERR_OPERATIONFAILED             : result := 'OPERATIONFAILED';
    LINEERR_OPERATIONUNAVAIL            : result := 'OPERATIONUNAVAIL';
    LINEERR_RATEUNAVAIL                 : result := 'RATEUNAVAIL';
    LINEERR_RESOURCEUNAVAIL             : result := 'RESOURCEUNAVAIL';
    LINEERR_REQUESTOVERRUN              : result := 'REQUESTOVERRUN';
    LINEERR_STRUCTURETOOSMALL           : result := 'STRUCTURETOOSMALL';
    LINEERR_TARGETNOTFOUND              : result := 'TARGETNOTFOUND';
    LINEERR_TARGETSELF                  : result := 'TARGETSELF';
    LINEERR_UNINITIALIZED               : result := 'UNINITIALIZED';
    LINEERR_USERUSERINFOTOOBIG          : result := 'USERUSERINFOTOOBIG';
    LINEERR_REINIT                      : result := 'REINIT';
    LINEERR_ADDRESSBLOCKED              : result := 'ADDRESSBLOCKED';
    LINEERR_BILLINGREJECTED             : result := 'BILLINGREJECTED';
    LINEERR_INVALFEATURE                : result := 'INVALFEATURE';
    LINEERR_NOMULTIPLEINSTANCE          : result := 'NOMULTIPLEINSTANCE';
  else
    if LineError > 0 then
      result := Format('LINEERR_$%x', [LineError])
  end;
end;

{*****************************************************************************}
function LineForwardModeToStr(ForwardMode: DWORD): String;
{*****************************************************************************}
begin
  result := '';
  case ForwardMode of
    LINEFORWARDMODE_UNCOND           : result := 'UNCOND';
    LINEFORWARDMODE_UNCONDINTERNAL   : result := 'UNCONDINTERNAL';
    LINEFORWARDMODE_UNCONDEXTERNAL   : result := 'UNCONDEXTERNAL';
    LINEFORWARDMODE_UNCONDSPECIFIC   : result := 'UNCONDSPECIFIC';
    LINEFORWARDMODE_BUSY             : result := 'BUSY';
    LINEFORWARDMODE_BUSYINTERNAL     : result := 'BUSYINTERNAL';
    LINEFORWARDMODE_BUSYEXTERNAL     : result := 'BUSYEXTERNAL';
    LINEFORWARDMODE_BUSYSPECIFIC     : result := 'BUSYSPECIFIC';
    LINEFORWARDMODE_NOANSW           : result := 'NOANSW';
    LINEFORWARDMODE_NOANSWINTERNAL   : result := 'NOANSWINTERNAL';
    LINEFORWARDMODE_NOANSWEXTERNAL   : result := 'NOANSWEXTERNAL';
    LINEFORWARDMODE_NOANSWSPECIFIC   : result := 'NOANSWSPECIFIC';
    LINEFORWARDMODE_BUSYNA           : result := 'BUSYNA';
    LINEFORWARDMODE_BUSYNAINTERNAL   : result := 'BUSYNAINTERNAL';
    LINEFORWARDMODE_BUSYNAEXTERNAL   : result := 'BUSYNAEXTERNAL';
    LINEFORWARDMODE_BUSYNASPECIFIC   : result := 'BUSYNASPECIFIC';
    LINEFORWARDMODE_UNKNOWN          : result := 'UNKNOWN'; // TAPI v1.4
    LINEFORWARDMODE_UNAVAIL          : result := 'UNAVAIL'; // TAPI v1.4
  else
    if ForwardMode > 0 then
      result := Format('LINEFORWARDMODE_$%x', [ForwardMode]);
  end;
end;

{*****************************************************************************}
function LineForwardModesToStr(ForwardModes: DWORD; Spacer: String = ' '): String;
{*****************************************************************************}
begin
  result := '';
  if ForwardModes and LINEFORWARDMODE_UNCOND           > 0 then result := OrStr(result, 'UNCOND', Spacer);
  if ForwardModes and LINEFORWARDMODE_UNCONDINTERNAL   > 0 then result := OrStr(result, 'UNCONDINTERNAL', Spacer);
  if ForwardModes and LINEFORWARDMODE_UNCONDEXTERNAL   > 0 then result := OrStr(result, 'UNCONDEXTERNAL', Spacer);
  if ForwardModes and LINEFORWARDMODE_UNCONDSPECIFIC   > 0 then result := OrStr(result, 'UNCONDSPECIFIC', Spacer);
  if ForwardModes and LINEFORWARDMODE_BUSY             > 0 then result := OrStr(result, 'BUSY', Spacer);
  if ForwardModes and LINEFORWARDMODE_BUSYINTERNAL     > 0 then result := OrStr(result, 'BUSYINTERNAL', Spacer);
  if ForwardModes and LINEFORWARDMODE_BUSYEXTERNAL     > 0 then result := OrStr(result, 'BUSYEXTERNAL', Spacer);
  if ForwardModes and LINEFORWARDMODE_BUSYSPECIFIC     > 0 then result := OrStr(result, 'BUSYSPECIFIC', Spacer);
  if ForwardModes and LINEFORWARDMODE_NOANSW           > 0 then result := OrStr(result, 'NOANSW', Spacer);
  if ForwardModes and LINEFORWARDMODE_NOANSWINTERNAL   > 0 then result := OrStr(result, 'NOANSWINTERNAL', Spacer);
  if ForwardModes and LINEFORWARDMODE_NOANSWEXTERNAL   > 0 then result := OrStr(result, 'NOANSWEXTERNAL', Spacer);
  if ForwardModes and LINEFORWARDMODE_NOANSWSPECIFIC   > 0 then result := OrStr(result, 'NOANSWSPECIFIC', Spacer);
  if ForwardModes and LINEFORWARDMODE_BUSYNA           > 0 then result := OrStr(result, 'BUSYNA', Spacer);
  if ForwardModes and LINEFORWARDMODE_BUSYNAINTERNAL   > 0 then result := OrStr(result, 'BUSYNAINTERNAL', Spacer);
  if ForwardModes and LINEFORWARDMODE_BUSYNAEXTERNAL   > 0 then result := OrStr(result, 'BUSYNAEXTERNAL', Spacer);
  if ForwardModes and LINEFORWARDMODE_BUSYNASPECIFIC   > 0 then result := OrStr(result, 'BUSYNASPECIFIC', Spacer);
  if ForwardModes and LINEFORWARDMODE_UNKNOWN          > 0 then result := OrStr(result, 'UNKNOWN', Spacer); // TAPI v1.4
  if ForwardModes and LINEFORWARDMODE_UNAVAIL          > 0 then result := OrStr(result, 'UNAVAIL', Spacer); // TAPI v1.4
  if (result = '') and (ForwardModes > 0) then
    result := Format('LINEFORWARDMODE_$%x', [ForwardModes]);
end;

end.

