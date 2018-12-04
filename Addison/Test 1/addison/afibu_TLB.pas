unit afibu_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// $Rev: 8291 $
// File generated on 17.04.2009 15:47:32 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Program Files\ADDISON\Connect\AFibu.dll (1)
// LIBID: {75E42B94-697E-11D2-ADED-000083F3B333}
// LCID: 0
// Helpfile: 
// HelpString: Addison BO Library 1.0 (Rechnungswesen)
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\system32\stdole2.tlb)
// Errors:
//   Error creating palette bitmap of (TAddFibuProjectImp) : Server C:\Program Files\ADDISON\Connect\AFibu.dll contains no icons
//   Error creating palette bitmap of (TRwFibuWJ) : Server C:\Program Files\ADDISON\Connect\AFibu.dll contains no icons
//   Error creating palette bitmap of (TRwBilanzInfo) : Server C:\Program Files\ADDISON\Connect\AFibu.dll contains no icons
//   Error creating palette bitmap of (TRwBilanzItem) : Server C:\Program Files\ADDISON\Connect\AFibu.dll contains no icons
//   Error creating palette bitmap of (TRwSachkonten) : Server C:\Program Files\ADDISON\Connect\AFibu.dll contains no icons
//   Error creating palette bitmap of (TRwDebitorkonten) : Server C:\Program Files\ADDISON\Connect\AFibu.dll contains no icons
//   Error creating palette bitmap of (TRwKreditorkonten) : Server C:\Program Files\ADDISON\Connect\AFibu.dll contains no icons
//   Error creating palette bitmap of (TRwBuchungsstapel) : Server C:\Program Files\ADDISON\Connect\AFibu.dll contains no icons
//   Error creating palette bitmap of (TRwBuchungsstapelWJ) : Server C:\Program Files\ADDISON\Connect\AFibu.dll contains no icons
//   Error creating palette bitmap of (TRwFibuKonto) : Server C:\Program Files\ADDISON\Connect\AFibu.dll contains no icons
//   Error creating palette bitmap of (TRwOPSuche) : Server C:\Program Files\ADDISON\Connect\AFibu.dll contains no icons
//   Error creating palette bitmap of (TRwOP) : Server C:\Program Files\ADDISON\Connect\AFibu.dll contains no icons
//   Error creating palette bitmap of (TRwBuchungsImport) : Registry key CLSID\{1BB5D6CD-F4AF-11D2-AEE7-000083F3B333}\ToolboxBitmap32 not found
//   Error creating palette bitmap of (TRwKontenblatt) : Server C:\Program Files\ADDISON\Connect\AFibu.dll contains no icons
//   Error creating palette bitmap of (TRwBuchung) : Server C:\Program Files\ADDISON\Connect\AFibu.dll contains no icons
//   Error creating palette bitmap of (TRwBuchungsabgleich) : Server C:\Program Files\ADDISON\Connect\AFibu.dll contains no icons
//   Error creating palette bitmap of (TRWKontoAuflistung) : Server C:\Program Files\ADDISON\Connect\AFibu.dll contains no icons
//   Error creating palette bitmap of (TRwPersKontoData) : Server C:\Program Files\ADDISON\Connect\AFibu.dll contains no icons
//   Error creating palette bitmap of (TRwBuchungskreisTool) : Server C:\Program Files\ADDISON\Connect\AFibu.dll contains no icons
// ************************************************************************ //
// *************************************************************************//
// NOTE:                                                                      
// Items guarded by $IFDEF_LIVE_SERVER_AT_DESIGN_TIME are used by properties  
// which return objects that may need to be explicitly created via a function 
// call prior to any access via the property. These items have been disabled  
// in order to prevent accidental use from within the object inspector. You   
// may enable them by defining LIVE_SERVER_AT_DESIGN_TIME or by selectively   
// removing them from the $IFDEF blocks. However, such items must still be    
// programmatically created via a method of the appropriate CoClass before    
// they can be used.                                                          
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, OleCtrls, OleServer, StdVCL, Variants;
  


// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  afibuMajorVersion = 1;
  afibuMinorVersion = 0;

  LIBID_afibu: TGUID = '{75E42B94-697E-11D2-ADED-000083F3B333}';

  DIID_DReweAppEvents: TGUID = '{5E9AB180-FE24-11D2-AEFB-000083F3B333}';
  IID_IAddFibuProjectImp: TGUID = '{75E42BA0-697E-11D2-ADED-000083F3B333}';
  CLASS_AddFibuProjectImp: TGUID = '{75E42BA1-697E-11D2-ADED-000083F3B333}';
  IID_IAddProject: TGUID = '{29EA9B9B-68F8-11D2-ADEB-000083F3B333}';
  IID_IRwFibuWJ: TGUID = '{BDF5FC63-6AB5-11D2-ADF1-000083F3B333}';
  IID_IRwDebitorkonten: TGUID = '{0B537770-6C38-11D2-ADF1-000083F3B333}';
  IID_IRwFibuKonto: TGUID = '{5A938D23-EE56-11D2-AED9-000083F3B333}';
  IID_IAddGeschaeftspartner: TGUID = '{29EA9B95-68F8-11D2-ADEB-000083F3B333}';
  IID_IAddZusatzAdressen: TGUID = '{CC12C96B-A021-47B7-96A6-83B37AD21FCB}';
  IID_IAddZusatzAdresse: TGUID = '{934E6095-A66B-42CB-9DEE-7BF6CCF6416B}';
  IID_IRwPersKontoData: TGUID = '{549B0C2F-9053-4EFF-8541-15F883508924}';
  IID_IRwBuchungskreisTool: TGUID = '{14C62BEB-81D2-4D25-832C-5B3DCA7B0355}';
  IID_IRwKreditorkonten: TGUID = '{0B537773-6C38-11D2-ADF1-000083F3B333}';
  IID_IRwSachkonten: TGUID = '{0B53776D-6C38-11D2-ADF1-000083F3B333}';
  IID_IRwOPSuche: TGUID = '{1BB5D6C6-F4AF-11D2-AEE7-000083F3B333}';
  IID_IRwOP: TGUID = '{1BB5D6C9-F4AF-11D2-AEE7-000083F3B333}';
  IID_IRwBuchung: TGUID = '{F838BBE8-576A-4AC3-9358-C1CBD53F791E}';
  IID_IRwBuchungsstapelWJ: TGUID = '{0B53777F-6C38-11D2-ADF1-000083F3B333}';
  IID_IRwBuchungsstapel: TGUID = '{0B53777C-6C38-11D2-ADF1-000083F3B333}';
  IID_IRwBilanzInfo: TGUID = '{0B537764-6C38-11D2-ADF1-000083F3B333}';
  IID_IRWKontoAuflistung: TGUID = '{3E27DCAB-04C8-4B32-BEFE-BAB17E4380C1}';
  IID_IRwBilanzItem: TGUID = '{0B537767-6C38-11D2-ADF1-000083F3B333}';
  CLASS_RwFibuWJ: TGUID = '{BDF5FC64-6AB5-11D2-ADF1-000083F3B333}';
  CLASS_RwBilanzInfo: TGUID = '{0B537765-6C38-11D2-ADF1-000083F3B333}';
  CLASS_RwBilanzItem: TGUID = '{0B537768-6C38-11D2-ADF1-000083F3B333}';
  CLASS_RwSachkonten: TGUID = '{0B53776E-6C38-11D2-ADF1-000083F3B333}';
  CLASS_RwDebitorkonten: TGUID = '{0B537771-6C38-11D2-ADF1-000083F3B333}';
  CLASS_RwKreditorkonten: TGUID = '{0B537774-6C38-11D2-ADF1-000083F3B333}';
  CLASS_RwBuchungsstapel: TGUID = '{0B53777D-6C38-11D2-ADF1-000083F3B333}';
  CLASS_RwBuchungsstapelWJ: TGUID = '{0B537780-6C38-11D2-ADF1-000083F3B333}';
  CLASS_RwFibuKonto: TGUID = '{5A938D24-EE56-11D2-AED9-000083F3B333}';
  CLASS_RwOPSuche: TGUID = '{1BB5D6C7-F4AF-11D2-AEE7-000083F3B333}';
  CLASS_RwOP: TGUID = '{1BB5D6CA-F4AF-11D2-AEE7-000083F3B333}';
  IID_IRwBuchungsImport: TGUID = '{1BB5D6CC-F4AF-11D2-AEE7-000083F3B333}';
  CLASS_RwBuchungsImport: TGUID = '{1BB5D6CD-F4AF-11D2-AEE7-000083F3B333}';
  IID_IRwKontenblatt: TGUID = '{BA0AFD76-60F7-4C8B-B2C8-083E39D6BFF6}';
  CLASS_RwKontenblatt: TGUID = '{4732F80D-4C21-45EF-982F-FC56376C73E3}';
  CLASS_RwBuchung: TGUID = '{36C1465A-9875-452A-8D9A-23E24EBE0930}';
  IID_IRwBuchungsabgleich: TGUID = '{68755C09-3A6C-4274-9242-2E4B10CFFAC4}';
  CLASS_RwBuchungsabgleich: TGUID = '{D0772C74-ACF4-4858-84DF-6FCD55581034}';
  CLASS_RWKontoAuflistung: TGUID = '{0098B1BF-E28F-4158-A444-3885AAEF4912}';
  CLASS_RwPersKontoData: TGUID = '{AC936EC2-8322-40D9-8828-B385ECBA262D}';
  CLASS_RwBuchungskreisTool: TGUID = '{EB7EFACE-4BD0-49F8-BB5B-93B30BF6DA76}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  DReweAppEvents = dispinterface;
  IAddFibuProjectImp = interface;
  IAddFibuProjectImpDisp = dispinterface;
  IAddProject = interface;
  IAddProjectDisp = dispinterface;
  IRwFibuWJ = interface;
  IRwFibuWJDisp = dispinterface;
  IRwDebitorkonten = interface;
  IRwDebitorkontenDisp = dispinterface;
  IRwFibuKonto = interface;
  IRwFibuKontoDisp = dispinterface;
  IAddGeschaeftspartner = interface;
  IAddGeschaeftspartnerDisp = dispinterface;
  IAddZusatzAdressen = interface;
  IAddZusatzAdressenDisp = dispinterface;
  IAddZusatzAdresse = interface;
  IAddZusatzAdresseDisp = dispinterface;
  IRwPersKontoData = interface;
  IRwPersKontoDataDisp = dispinterface;
  IRwBuchungskreisTool = interface;
  IRwBuchungskreisToolDisp = dispinterface;
  IRwKreditorkonten = interface;
  IRwKreditorkontenDisp = dispinterface;
  IRwSachkonten = interface;
  IRwSachkontenDisp = dispinterface;
  IRwOPSuche = interface;
  IRwOPSucheDisp = dispinterface;
  IRwOP = interface;
  IRwOPDisp = dispinterface;
  IRwBuchung = interface;
  IRwBuchungDisp = dispinterface;
  IRwBuchungsstapelWJ = interface;
  IRwBuchungsstapelWJDisp = dispinterface;
  IRwBuchungsstapel = interface;
  IRwBuchungsstapelDisp = dispinterface;
  IRwBilanzInfo = interface;
  IRwBilanzInfoDisp = dispinterface;
  IRWKontoAuflistung = interface;
  IRWKontoAuflistungDisp = dispinterface;
  IRwBilanzItem = interface;
  IRwBilanzItemDisp = dispinterface;
  IRwBuchungsImport = interface;
  IRwBuchungsImportDisp = dispinterface;
  IRwKontenblatt = interface;
  IRwKontenblattDisp = dispinterface;
  IRwBuchungsabgleich = interface;
  IRwBuchungsabgleichDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  AddFibuProjectImp = IAddFibuProjectImp;
  RwFibuWJ = IRwFibuWJ;
  RwBilanzInfo = IRwBilanzInfo;
  RwBilanzItem = IRwBilanzItem;
  RwSachkonten = IRwSachkonten;
  RwDebitorkonten = IRwDebitorkonten;
  RwKreditorkonten = IRwKreditorkonten;
  RwBuchungsstapel = IRwBuchungsstapel;
  RwBuchungsstapelWJ = IRwBuchungsstapelWJ;
  RwFibuKonto = IRwFibuKonto;
  RwOPSuche = IRwOPSuche;
  RwOP = IRwOP;
  RwBuchungsImport = IRwBuchungsImport;
  RwKontenblatt = IRwKontenblatt;
  RwBuchung = IRwBuchung;
  RwBuchungsabgleich = IRwBuchungsabgleich;
  RWKontoAuflistung = IRWKontoAuflistung;
  RwPersKontoData = IRwPersKontoData;
  RwBuchungskreisTool = IRwBuchungskreisTool;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  PInteger1 = ^Integer; {*}
  PDouble1 = ^Double; {*}
  PWideString1 = ^WideString; {*}
  PCurrency1 = ^Currency; {*}


// *********************************************************************//
// DispIntf:  DReweAppEvents
// Flags:     (4096) Dispatchable
// GUID:      {5E9AB180-FE24-11D2-AEFB-000083F3B333}
// *********************************************************************//
  DReweAppEvents = dispinterface
    ['{5E9AB180-FE24-11D2-AEFB-000083F3B333}']
    procedure NotifyProgress(const text: WideString; percent: SYSINT); dispid 1;
  end;

// *********************************************************************//
// Interface: IAddFibuProjectImp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {75E42BA0-697E-11D2-ADED-000083F3B333}
// *********************************************************************//
  IAddFibuProjectImp = interface(IDispatch)
    ['{75E42BA0-697E-11D2-ADED-000083F3B333}']
    procedure Attach(const __MIDL_0029: IAddProject); safecall;
    function Get_GetWJPos(position: Integer): IRwFibuWJ; safecall;
    function Get_GetWJDate(__MIDL_0030: TDateTime): IRwFibuWJ; safecall;
    procedure LockProject(exklusive: Integer); safecall;
    procedure UnLockProject(exklusive: Integer; deep: Integer); safecall;
    function Get_IsLocked: Integer; safecall;
    procedure AttachMandantenNr(mnr: Integer); safecall;
    function Get_GetLastWJ: IRwFibuWJ; safecall;
    function Get_SearchFibuWJ(monat: SYSINT; jahr: SYSINT): IRwFibuWJ; safecall;
    procedure RefreshFibuObjects; safecall;
    property GetWJPos[position: Integer]: IRwFibuWJ read Get_GetWJPos;
    property GetWJDate[__MIDL_0030: TDateTime]: IRwFibuWJ read Get_GetWJDate;
    property IsLocked: Integer read Get_IsLocked;
    property GetLastWJ: IRwFibuWJ read Get_GetLastWJ;
    property SearchFibuWJ[monat: SYSINT; jahr: SYSINT]: IRwFibuWJ read Get_SearchFibuWJ;
  end;

// *********************************************************************//
// DispIntf:  IAddFibuProjectImpDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {75E42BA0-697E-11D2-ADED-000083F3B333}
// *********************************************************************//
  IAddFibuProjectImpDisp = dispinterface
    ['{75E42BA0-697E-11D2-ADED-000083F3B333}']
    procedure Attach(const __MIDL_0029: IAddProject); dispid 1;
    property GetWJPos[position: Integer]: IRwFibuWJ readonly dispid 2;
    property GetWJDate[__MIDL_0030: TDateTime]: IRwFibuWJ readonly dispid 3;
    procedure LockProject(exklusive: Integer); dispid 4;
    procedure UnLockProject(exklusive: Integer; deep: Integer); dispid 5;
    property IsLocked: Integer readonly dispid 6;
    procedure AttachMandantenNr(mnr: Integer); dispid 7;
    property GetLastWJ: IRwFibuWJ readonly dispid 8;
    property SearchFibuWJ[monat: SYSINT; jahr: SYSINT]: IRwFibuWJ readonly dispid 9;
    procedure RefreshFibuObjects; dispid 10;
  end;

// *********************************************************************//
// Interface: IAddProject
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {29EA9B9B-68F8-11D2-ADEB-000083F3B333}
// *********************************************************************//
  IAddProject = interface(IDispatch)
    ['{29EA9B9B-68F8-11D2-ADEB-000083F3B333}']
    function Get_GetMandantNr: Integer; safecall;
    property GetMandantNr: Integer read Get_GetMandantNr;
  end;

// *********************************************************************//
// DispIntf:  IAddProjectDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {29EA9B9B-68F8-11D2-ADEB-000083F3B333}
// *********************************************************************//
  IAddProjectDisp = dispinterface
    ['{29EA9B9B-68F8-11D2-ADEB-000083F3B333}']
    property GetMandantNr: Integer readonly dispid 1;
  end;

// *********************************************************************//
// Interface: IRwFibuWJ
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {BDF5FC63-6AB5-11D2-ADF1-000083F3B333}
// *********************************************************************//
  IRwFibuWJ = interface(IDispatch)
    ['{BDF5FC63-6AB5-11D2-ADF1-000083F3B333}']
    function Get_m_Beginn: TDateTime; safecall;
    function Get_m_Ende: TDateTime; safecall;
    function Get_m_VerdichtForderungen(index: Integer): WideString; safecall;
    function Get_m_VerdichtVerbindlichkeiten(index: Integer): WideString; safecall;
    function Get_IsVerdichtKonto(const __MIDL_0027: WideString): Integer; safecall;
    function Get_m_DifferenzenKonto: WideString; safecall;
    function Get_m_DifferenzenKreditorKonto: WideString; safecall;
    function Get_m_DifferenzenDebitorKonto: WideString; safecall;
    function Get_m_BilanzEroeffnungsKonto: WideString; safecall;
    function Get_m_BilanzEroeffnungDebitorKonto: WideString; safecall;
    function Get_m_BilanzEroeffnungKreditorKonto: WideString; safecall;
    function Get_m_UmstellungsDifferenzKonto: WideString; safecall;
    function Get_m_Hauswaehrung: Smallint; safecall;
    function Get_IsSachkonto(const kontoNr: WideString): Integer; safecall;
    function Get_IsDebitor(const kontoNr: WideString): Integer; safecall;
    function Get_IsKreditor(const kontoNr: WideString): Integer; safecall;
    function Get_m_Debitorkonten: IRwDebitorkonten; safecall;
    function Get_m_Kreditorkonten: IRwKreditorkonten; safecall;
    function Get_m_Sachkonten: IRwSachkonten; safecall;
    function Get_m_Istversteuerer: Integer; safecall;
    function Get_m_HasOPVerwaltung: Integer; safecall;
    procedure Refresh; safecall;
    function Get_CreateOPSuche: IRwOPSuche; safecall;
    function Get_m_BuchungsDatum: TDateTime; safecall;
    function Get_getBuchungsstapelWJ: IRwBuchungsstapelWJ; safecall;
    function Get_GetStandardBilanzSchema(var isMandantSchema: Integer): Integer; safecall;
    function Get_IsInWJ(__MIDL_0028: TDateTime): Integer; safecall;
    function Get_GetBInfo(const infoString: WideString): IRwBilanzInfo; safecall;
    function Get_GetBItem(const infoString: WideString): IRwBilanzItem; safecall;
    function IsSteuerSchluesselValid(const steuerSchluessel: WideString): Integer; safecall;
    function Get_m_Kontenrahmen: Integer; safecall;
    property m_Beginn: TDateTime read Get_m_Beginn;
    property m_Ende: TDateTime read Get_m_Ende;
    property m_VerdichtForderungen[index: Integer]: WideString read Get_m_VerdichtForderungen;
    property m_VerdichtVerbindlichkeiten[index: Integer]: WideString read Get_m_VerdichtVerbindlichkeiten;
    property IsVerdichtKonto[const __MIDL_0027: WideString]: Integer read Get_IsVerdichtKonto;
    property m_DifferenzenKonto: WideString read Get_m_DifferenzenKonto;
    property m_DifferenzenKreditorKonto: WideString read Get_m_DifferenzenKreditorKonto;
    property m_DifferenzenDebitorKonto: WideString read Get_m_DifferenzenDebitorKonto;
    property m_BilanzEroeffnungsKonto: WideString read Get_m_BilanzEroeffnungsKonto;
    property m_BilanzEroeffnungDebitorKonto: WideString read Get_m_BilanzEroeffnungDebitorKonto;
    property m_BilanzEroeffnungKreditorKonto: WideString read Get_m_BilanzEroeffnungKreditorKonto;
    property m_UmstellungsDifferenzKonto: WideString read Get_m_UmstellungsDifferenzKonto;
    property m_Hauswaehrung: Smallint read Get_m_Hauswaehrung;
    property IsSachkonto[const kontoNr: WideString]: Integer read Get_IsSachkonto;
    property IsDebitor[const kontoNr: WideString]: Integer read Get_IsDebitor;
    property IsKreditor[const kontoNr: WideString]: Integer read Get_IsKreditor;
    property m_Debitorkonten: IRwDebitorkonten read Get_m_Debitorkonten;
    property m_Kreditorkonten: IRwKreditorkonten read Get_m_Kreditorkonten;
    property m_Sachkonten: IRwSachkonten read Get_m_Sachkonten;
    property m_Istversteuerer: Integer read Get_m_Istversteuerer;
    property m_HasOPVerwaltung: Integer read Get_m_HasOPVerwaltung;
    property CreateOPSuche: IRwOPSuche read Get_CreateOPSuche;
    property m_BuchungsDatum: TDateTime read Get_m_BuchungsDatum;
    property getBuchungsstapelWJ: IRwBuchungsstapelWJ read Get_getBuchungsstapelWJ;
    property GetStandardBilanzSchema[var isMandantSchema: Integer]: Integer read Get_GetStandardBilanzSchema;
    property IsInWJ[__MIDL_0028: TDateTime]: Integer read Get_IsInWJ;
    property GetBInfo[const infoString: WideString]: IRwBilanzInfo read Get_GetBInfo;
    property GetBItem[const infoString: WideString]: IRwBilanzItem read Get_GetBItem;
    property m_Kontenrahmen: Integer read Get_m_Kontenrahmen;
  end;

// *********************************************************************//
// DispIntf:  IRwFibuWJDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {BDF5FC63-6AB5-11D2-ADF1-000083F3B333}
// *********************************************************************//
  IRwFibuWJDisp = dispinterface
    ['{BDF5FC63-6AB5-11D2-ADF1-000083F3B333}']
    property m_Beginn: TDateTime readonly dispid 1;
    property m_Ende: TDateTime readonly dispid 2;
    property m_VerdichtForderungen[index: Integer]: WideString readonly dispid 3;
    property m_VerdichtVerbindlichkeiten[index: Integer]: WideString readonly dispid 4;
    property IsVerdichtKonto[const __MIDL_0027: WideString]: Integer readonly dispid 5;
    property m_DifferenzenKonto: WideString readonly dispid 6;
    property m_DifferenzenKreditorKonto: WideString readonly dispid 7;
    property m_DifferenzenDebitorKonto: WideString readonly dispid 8;
    property m_BilanzEroeffnungsKonto: WideString readonly dispid 9;
    property m_BilanzEroeffnungDebitorKonto: WideString readonly dispid 10;
    property m_BilanzEroeffnungKreditorKonto: WideString readonly dispid 11;
    property m_UmstellungsDifferenzKonto: WideString readonly dispid 12;
    property m_Hauswaehrung: Smallint readonly dispid 13;
    property IsSachkonto[const kontoNr: WideString]: Integer readonly dispid 14;
    property IsDebitor[const kontoNr: WideString]: Integer readonly dispid 15;
    property IsKreditor[const kontoNr: WideString]: Integer readonly dispid 16;
    property m_Debitorkonten: IRwDebitorkonten readonly dispid 17;
    property m_Kreditorkonten: IRwKreditorkonten readonly dispid 18;
    property m_Sachkonten: IRwSachkonten readonly dispid 19;
    property m_Istversteuerer: Integer readonly dispid 20;
    property m_HasOPVerwaltung: Integer readonly dispid 21;
    procedure Refresh; dispid 22;
    property CreateOPSuche: IRwOPSuche readonly dispid 23;
    property m_BuchungsDatum: TDateTime readonly dispid 24;
    property getBuchungsstapelWJ: IRwBuchungsstapelWJ readonly dispid 25;
    property GetStandardBilanzSchema[var isMandantSchema: Integer]: Integer readonly dispid 26;
    property IsInWJ[__MIDL_0028: TDateTime]: Integer readonly dispid 1610743834;
    property GetBInfo[const infoString: WideString]: IRwBilanzInfo readonly dispid 1610743835;
    property GetBItem[const infoString: WideString]: IRwBilanzItem readonly dispid 1610743836;
    function IsSteuerSchluesselValid(const steuerSchluessel: WideString): Integer; dispid 27;
    property m_Kontenrahmen: Integer readonly dispid 28;
  end;

// *********************************************************************//
// Interface: IRwDebitorkonten
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0B537770-6C38-11D2-ADF1-000083F3B333}
// *********************************************************************//
  IRwDebitorkonten = interface(IDispatch)
    ['{0B537770-6C38-11D2-ADF1-000083F3B333}']
    function Get_SearchFibuKonto(const __MIDL_0023: WideString): IRwFibuKonto; safecall;
    function Get_GetFirst: IRwFibuKonto; safecall;
    function Get_GetNext: IRwFibuKonto; safecall;
    function Get_GetPrev: IRwFibuKonto; safecall;
    function Get_GetLast: IRwFibuKonto; safecall;
    function Get_ExistsFibuKonto(const __MIDL_0024: WideString): Integer; safecall;
    function Get_CreateKontoNummer(const nr: WideString; const Name: WideString): WideString; safecall;
    property SearchFibuKonto[const __MIDL_0023: WideString]: IRwFibuKonto read Get_SearchFibuKonto;
    property GetFirst: IRwFibuKonto read Get_GetFirst;
    property GetNext: IRwFibuKonto read Get_GetNext;
    property GetPrev: IRwFibuKonto read Get_GetPrev;
    property GetLast: IRwFibuKonto read Get_GetLast;
    property ExistsFibuKonto[const __MIDL_0024: WideString]: Integer read Get_ExistsFibuKonto;
    property CreateKontoNummer[const nr: WideString; const Name: WideString]: WideString read Get_CreateKontoNummer;
  end;

// *********************************************************************//
// DispIntf:  IRwDebitorkontenDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0B537770-6C38-11D2-ADF1-000083F3B333}
// *********************************************************************//
  IRwDebitorkontenDisp = dispinterface
    ['{0B537770-6C38-11D2-ADF1-000083F3B333}']
    property SearchFibuKonto[const __MIDL_0023: WideString]: IRwFibuKonto readonly dispid 1;
    property GetFirst: IRwFibuKonto readonly dispid 2;
    property GetNext: IRwFibuKonto readonly dispid 3;
    property GetPrev: IRwFibuKonto readonly dispid 4;
    property GetLast: IRwFibuKonto readonly dispid 5;
    property ExistsFibuKonto[const __MIDL_0024: WideString]: Integer readonly dispid 6;
    property CreateKontoNummer[const nr: WideString; const Name: WideString]: WideString readonly dispid 7;
  end;

// *********************************************************************//
// Interface: IRwFibuKonto
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5A938D23-EE56-11D2-AED9-000083F3B333}
// *********************************************************************//
  IRwFibuKonto = interface(IDispatch)
    ['{5A938D23-EE56-11D2-AED9-000083F3B333}']
    function Get_m_KontoNr: WideString; safecall;
    function Get_m_Name: WideString; safecall;
    function Get_IsSachkonto: Integer; safecall;
    function Get_IsDebitor: Integer; safecall;
    function Get_IsKreditor: Integer; safecall;
    function Get_GetGP: IAddGeschaeftspartner; safecall;
    function Get_m_Kreditlimit: Currency; safecall;
    procedure Set_m_Kreditlimit(pVal: Currency); safecall;
    function Get_m_Saldo(periodeBis: Integer): Currency; safecall;
    function Get_m_AB(periodeBis: Integer): Currency; safecall;
    function Get_m_SaldoSoll(periodeBis: Integer): Currency; safecall;
    function Get_m_SaldoHaben(periodeBis: Integer): Currency; safecall;
    procedure Refresh; safecall;
    function Get_m_KreditlimitVersichert: Currency; safecall;
    function Get_HasOPVerwaltung: Integer; safecall;
    function Get_IsCPDKonto: Integer; safecall;
    function Get_m_FreiesFeld(idx: SYSINT): WideString; safecall;
    function Get_m_NameVersicherer: WideString; safecall;
    function Get_m_VersicherungsNr: WideString; safecall;
    function Get_m_WarenUmsatz(periodeBis: Integer): Currency; safecall;
    function Get_m_VerbandsNr: WideString; safecall;
    function Get_m_Verband: WideString; safecall;
    function Get_m_MitgliedsNr: WideString; safecall;
    function Get_m_AZVDaten(const data: WideString): WideString; safecall;
    function Get_m_ExternZV: Integer; safecall;
    function Get_m_pPersonenKontoData: IRwPersKontoData; safecall;
    function Get_m_Gesperrt: Byte; safecall;
    function Get_m_Kontenart: WideString; safecall;
    procedure SetBuchungskreisSaldoAbfrage(buchungskreise: LongWord); safecall;
    procedure SetBuchungskreis(const bukreis: IRwBuchungskreisTool); safecall;
    property m_KontoNr: WideString read Get_m_KontoNr;
    property m_Name: WideString read Get_m_Name;
    property IsSachkonto: Integer read Get_IsSachkonto;
    property IsDebitor: Integer read Get_IsDebitor;
    property IsKreditor: Integer read Get_IsKreditor;
    property GetGP: IAddGeschaeftspartner read Get_GetGP;
    property m_Kreditlimit: Currency read Get_m_Kreditlimit write Set_m_Kreditlimit;
    property m_Saldo[periodeBis: Integer]: Currency read Get_m_Saldo;
    property m_AB[periodeBis: Integer]: Currency read Get_m_AB;
    property m_SaldoSoll[periodeBis: Integer]: Currency read Get_m_SaldoSoll;
    property m_SaldoHaben[periodeBis: Integer]: Currency read Get_m_SaldoHaben;
    property m_KreditlimitVersichert: Currency read Get_m_KreditlimitVersichert;
    property HasOPVerwaltung: Integer read Get_HasOPVerwaltung;
    property IsCPDKonto: Integer read Get_IsCPDKonto;
    property m_FreiesFeld[idx: SYSINT]: WideString read Get_m_FreiesFeld;
    property m_NameVersicherer: WideString read Get_m_NameVersicherer;
    property m_VersicherungsNr: WideString read Get_m_VersicherungsNr;
    property m_WarenUmsatz[periodeBis: Integer]: Currency read Get_m_WarenUmsatz;
    property m_VerbandsNr: WideString read Get_m_VerbandsNr;
    property m_Verband: WideString read Get_m_Verband;
    property m_MitgliedsNr: WideString read Get_m_MitgliedsNr;
    property m_AZVDaten[const data: WideString]: WideString read Get_m_AZVDaten;
    property m_ExternZV: Integer read Get_m_ExternZV;
    property m_pPersonenKontoData: IRwPersKontoData read Get_m_pPersonenKontoData;
    property m_Gesperrt: Byte read Get_m_Gesperrt;
    property m_Kontenart: WideString read Get_m_Kontenart;
  end;

// *********************************************************************//
// DispIntf:  IRwFibuKontoDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5A938D23-EE56-11D2-AED9-000083F3B333}
// *********************************************************************//
  IRwFibuKontoDisp = dispinterface
    ['{5A938D23-EE56-11D2-AED9-000083F3B333}']
    property m_KontoNr: WideString readonly dispid 1;
    property m_Name: WideString readonly dispid 2;
    property IsSachkonto: Integer readonly dispid 3;
    property IsDebitor: Integer readonly dispid 4;
    property IsKreditor: Integer readonly dispid 5;
    property GetGP: IAddGeschaeftspartner readonly dispid 6;
    property m_Kreditlimit: Currency dispid 7;
    property m_Saldo[periodeBis: Integer]: Currency readonly dispid 8;
    property m_AB[periodeBis: Integer]: Currency readonly dispid 9;
    property m_SaldoSoll[periodeBis: Integer]: Currency readonly dispid 10;
    property m_SaldoHaben[periodeBis: Integer]: Currency readonly dispid 11;
    procedure Refresh; dispid 12;
    property m_KreditlimitVersichert: Currency readonly dispid 13;
    property HasOPVerwaltung: Integer readonly dispid 14;
    property IsCPDKonto: Integer readonly dispid 15;
    property m_FreiesFeld[idx: SYSINT]: WideString readonly dispid 16;
    property m_NameVersicherer: WideString readonly dispid 17;
    property m_VersicherungsNr: WideString readonly dispid 18;
    property m_WarenUmsatz[periodeBis: Integer]: Currency readonly dispid 19;
    property m_VerbandsNr: WideString readonly dispid 20;
    property m_Verband: WideString readonly dispid 21;
    property m_MitgliedsNr: WideString readonly dispid 22;
    property m_AZVDaten[const data: WideString]: WideString readonly dispid 23;
    property m_ExternZV: Integer readonly dispid 24;
    property m_pPersonenKontoData: IRwPersKontoData readonly dispid 25;
    property m_Gesperrt: Byte readonly dispid 26;
    property m_Kontenart: WideString readonly dispid 27;
    procedure SetBuchungskreisSaldoAbfrage(buchungskreise: LongWord); dispid 28;
    procedure SetBuchungskreis(const bukreis: IRwBuchungskreisTool); dispid 29;
  end;

// *********************************************************************//
// Interface: IAddGeschaeftspartner
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {29EA9B95-68F8-11D2-ADEB-000083F3B333}
// *********************************************************************//
  IAddGeschaeftspartner = interface(IDispatch)
    ['{29EA9B95-68F8-11D2-ADEB-000083F3B333}']
    function Get_m_Name1: WideString; safecall;
    procedure Set_m_Name1(const pVal: WideString); safecall;
    function Get_m_Name2: WideString; safecall;
    procedure Set_m_Name2(const pVal: WideString); safecall;
    function Get_m_Name3: WideString; safecall;
    procedure Set_m_Name3(const pVal: WideString); safecall;
    function Get_m_Name4: WideString; safecall;
    procedure Set_m_Name4(const pVal: WideString); safecall;
    function Get_m_Strasse: WideString; safecall;
    procedure Set_m_Strasse(const pVal: WideString); safecall;
    function Get_m_PLZ: WideString; safecall;
    procedure Set_m_PLZ(const pVal: WideString); safecall;
    function Get_m_Ort: WideString; safecall;
    procedure Set_m_Ort(const pVal: WideString); safecall;
    function Get_m_Bundesland: WideString; safecall;
    procedure Set_m_Bundesland(const pVal: WideString); safecall;
    function Get_m_Staat: WideString; safecall;
    procedure Set_m_Staat(const pVal: WideString); safecall;
    function Get_m_Fax: WideString; safecall;
    procedure Set_m_Fax(const pVal: WideString); safecall;
    procedure BeginAdressupdate; safecall;
    procedure EndAdressupdate(commit: Integer); safecall;
    function Get_m_Tel1: WideString; safecall;
    procedure Set_m_Tel1(const pVal: WideString); safecall;
    function Get_m_Tel2: WideString; safecall;
    procedure Set_m_Tel2(const pVal: WideString); safecall;
    function Get_m_KWahl: WideString; safecall;
    procedure Set_m_KWahl(const pVal: WideString); safecall;
    function Get_m_Mobil: WideString; safecall;
    procedure Set_m_Mobil(const pVal: WideString); safecall;
    function Get_m_Email: WideString; safecall;
    procedure Set_m_Email(const pVal: WideString); safecall;
    function Get_m_URL: WideString; safecall;
    procedure Set_m_URL(const pVal: WideString); safecall;
    function Get_m_Titel: WideString; safecall;
    procedure Set_m_Titel(const pVal: WideString); safecall;
    function Get_m_AkadGrad: WideString; safecall;
    procedure Set_m_AkadGrad(const pVal: WideString); safecall;
    function Get_m_Postfach: WideString; safecall;
    procedure Set_m_Postfach(const pVal: WideString); safecall;
    function Get_m_PLZGrossempf: WideString; safecall;
    procedure Set_m_PLZGrossempf(const pVal: WideString); safecall;
    function Get_m_PLZPostfach: WideString; safecall;
    procedure Set_m_PLZPostfach(const pVal: WideString); safecall;
    function Get_m_Anrede: WideString; safecall;
    procedure Set_m_Anrede(const pVal: WideString); safecall;
    function Get_m_Briefanrede: WideString; safecall;
    procedure Set_m_Briefanrede(const pVal: WideString); safecall;
    function Get_m_Grussformel: WideString; safecall;
    procedure Set_m_Grussformel(const pVal: WideString); safecall;
    function Get_m_AnschriftPriv: WideString; safecall;
    procedure Set_m_AnschriftPriv(const pVal: WideString); safecall;
    function Get_m_AnschriftForm: WideString; safecall;
    procedure Set_m_AnschriftForm(const pVal: WideString); safecall;
    function Get_m_AnschriftBezPrivat: WideString; safecall;
    procedure Set_m_AnschriftBezPrivat(const pVal: WideString); safecall;
    function Get_m_AnschriftPrivBriefanrede: WideString; safecall;
    procedure Set_m_AnschriftPrivBriefanrede(const pVal: WideString); safecall;
    function Get_m_AnschriftBezFormell: WideString; safecall;
    procedure Set_m_AnschriftBezFormell(const pVal: WideString); safecall;
    function Get_m_AnschriftFormBriefanrede: WideString; safecall;
    procedure Set_m_AnschriftFormBriefanrede(const pVal: WideString); safecall;
    function Get_m_Geburtsdatum: TDateTime; safecall;
    procedure Set_m_Geburtsdatum(pVal: TDateTime); safecall;
    function Get_m_Teletex: WideString; safecall;
    procedure Set_m_Teletex(const pVal: WideString); safecall;
    function Get_m_BTX: WideString; safecall;
    procedure Set_m_BTX(const pVal: WideString); safecall;
    function Get_Zusatzadressen: IAddZusatzAdressen; safecall;
    property m_Name1: WideString read Get_m_Name1 write Set_m_Name1;
    property m_Name2: WideString read Get_m_Name2 write Set_m_Name2;
    property m_Name3: WideString read Get_m_Name3 write Set_m_Name3;
    property m_Name4: WideString read Get_m_Name4 write Set_m_Name4;
    property m_Strasse: WideString read Get_m_Strasse write Set_m_Strasse;
    property m_PLZ: WideString read Get_m_PLZ write Set_m_PLZ;
    property m_Ort: WideString read Get_m_Ort write Set_m_Ort;
    property m_Bundesland: WideString read Get_m_Bundesland write Set_m_Bundesland;
    property m_Staat: WideString read Get_m_Staat write Set_m_Staat;
    property m_Fax: WideString read Get_m_Fax write Set_m_Fax;
    property m_Tel1: WideString read Get_m_Tel1 write Set_m_Tel1;
    property m_Tel2: WideString read Get_m_Tel2 write Set_m_Tel2;
    property m_KWahl: WideString read Get_m_KWahl write Set_m_KWahl;
    property m_Mobil: WideString read Get_m_Mobil write Set_m_Mobil;
    property m_Email: WideString read Get_m_Email write Set_m_Email;
    property m_URL: WideString read Get_m_URL write Set_m_URL;
    property m_Titel: WideString read Get_m_Titel write Set_m_Titel;
    property m_AkadGrad: WideString read Get_m_AkadGrad write Set_m_AkadGrad;
    property m_Postfach: WideString read Get_m_Postfach write Set_m_Postfach;
    property m_PLZGrossempf: WideString read Get_m_PLZGrossempf write Set_m_PLZGrossempf;
    property m_PLZPostfach: WideString read Get_m_PLZPostfach write Set_m_PLZPostfach;
    property m_Anrede: WideString read Get_m_Anrede write Set_m_Anrede;
    property m_Briefanrede: WideString read Get_m_Briefanrede write Set_m_Briefanrede;
    property m_Grussformel: WideString read Get_m_Grussformel write Set_m_Grussformel;
    property m_AnschriftPriv: WideString read Get_m_AnschriftPriv write Set_m_AnschriftPriv;
    property m_AnschriftForm: WideString read Get_m_AnschriftForm write Set_m_AnschriftForm;
    property m_AnschriftBezPrivat: WideString read Get_m_AnschriftBezPrivat write Set_m_AnschriftBezPrivat;
    property m_AnschriftPrivBriefanrede: WideString read Get_m_AnschriftPrivBriefanrede write Set_m_AnschriftPrivBriefanrede;
    property m_AnschriftBezFormell: WideString read Get_m_AnschriftBezFormell write Set_m_AnschriftBezFormell;
    property m_AnschriftFormBriefanrede: WideString read Get_m_AnschriftFormBriefanrede write Set_m_AnschriftFormBriefanrede;
    property m_Geburtsdatum: TDateTime read Get_m_Geburtsdatum write Set_m_Geburtsdatum;
    property m_Teletex: WideString read Get_m_Teletex write Set_m_Teletex;
    property m_BTX: WideString read Get_m_BTX write Set_m_BTX;
    property Zusatzadressen: IAddZusatzAdressen read Get_Zusatzadressen;
  end;

// *********************************************************************//
// DispIntf:  IAddGeschaeftspartnerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {29EA9B95-68F8-11D2-ADEB-000083F3B333}
// *********************************************************************//
  IAddGeschaeftspartnerDisp = dispinterface
    ['{29EA9B95-68F8-11D2-ADEB-000083F3B333}']
    property m_Name1: WideString dispid 1;
    property m_Name2: WideString dispid 2;
    property m_Name3: WideString dispid 3;
    property m_Name4: WideString dispid 4;
    property m_Strasse: WideString dispid 5;
    property m_PLZ: WideString dispid 6;
    property m_Ort: WideString dispid 7;
    property m_Bundesland: WideString dispid 8;
    property m_Staat: WideString dispid 9;
    property m_Fax: WideString dispid 10;
    procedure BeginAdressupdate; dispid 11;
    procedure EndAdressupdate(commit: Integer); dispid 12;
    property m_Tel1: WideString dispid 13;
    property m_Tel2: WideString dispid 14;
    property m_KWahl: WideString dispid 15;
    property m_Mobil: WideString dispid 16;
    property m_Email: WideString dispid 17;
    property m_URL: WideString dispid 18;
    property m_Titel: WideString dispid 19;
    property m_AkadGrad: WideString dispid 20;
    property m_Postfach: WideString dispid 21;
    property m_PLZGrossempf: WideString dispid 22;
    property m_PLZPostfach: WideString dispid 23;
    property m_Anrede: WideString dispid 24;
    property m_Briefanrede: WideString dispid 25;
    property m_Grussformel: WideString dispid 26;
    property m_AnschriftPriv: WideString dispid 27;
    property m_AnschriftForm: WideString dispid 28;
    property m_AnschriftBezPrivat: WideString dispid 29;
    property m_AnschriftPrivBriefanrede: WideString dispid 30;
    property m_AnschriftBezFormell: WideString dispid 31;
    property m_AnschriftFormBriefanrede: WideString dispid 32;
    property m_Geburtsdatum: TDateTime dispid 33;
    property m_Teletex: WideString dispid 34;
    property m_BTX: WideString dispid 35;
    property Zusatzadressen: IAddZusatzAdressen readonly dispid 36;
  end;

// *********************************************************************//
// Interface: IAddZusatzAdressen
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {CC12C96B-A021-47B7-96A6-83B37AD21FCB}
// *********************************************************************//
  IAddZusatzAdressen = interface(IDispatch)
    ['{CC12C96B-A021-47B7-96A6-83B37AD21FCB}']
    function Get_Count: Integer; safecall;
    function Get_Item(pos: Integer): IAddZusatzAdresse; safecall;
    property Count: Integer read Get_Count;
    property Item[pos: Integer]: IAddZusatzAdresse read Get_Item;
  end;

// *********************************************************************//
// DispIntf:  IAddZusatzAdressenDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {CC12C96B-A021-47B7-96A6-83B37AD21FCB}
// *********************************************************************//
  IAddZusatzAdressenDisp = dispinterface
    ['{CC12C96B-A021-47B7-96A6-83B37AD21FCB}']
    property Count: Integer readonly dispid 1;
    property Item[pos: Integer]: IAddZusatzAdresse readonly dispid 2;
  end;

// *********************************************************************//
// Interface: IAddZusatzAdresse
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {934E6095-A66B-42CB-9DEE-7BF6CCF6416B}
// *********************************************************************//
  IAddZusatzAdresse = interface(IDispatch)
    ['{934E6095-A66B-42CB-9DEE-7BF6CCF6416B}']
    function Get_Typ: WideString; safecall;
    function Get_Name: WideString; safecall;
    function Get_Kurzname: WideString; safecall;
    function Get_Name2: WideString; safecall;
    function Get_Name3: WideString; safecall;
    procedure Adresse(out strasse: WideString; out land: WideString; out plz: WideString; 
                      out ort: WideString); safecall;
    function Get_Ansprechpartner: WideString; safecall;
    function Get_Telefon1: WideString; safecall;
    function Get_Telefon2: WideString; safecall;
    function Get_Mobil: WideString; safecall;
    function Get_Fax: WideString; safecall;
    function Get_Mail: WideString; safecall;
    function Get_Web: WideString; safecall;
    function Get_USTID: WideString; safecall;
    procedure Bankdaten(out blz: WideString; out konto: WideString); safecall;
    procedure Postfach(out Postfach: WideString; out plzPostfach: WideString); safecall;
    function Get_PLZGrossempf: WideString; safecall;
    function Get_Titel: WideString; safecall;
    function Get_AkadGrad: WideString; safecall;
    function Get_Geburtstag: WideString; safecall;
    function Get_Anrede: WideString; safecall;
    function Get_Briefanrede: WideString; safecall;
    function Get_Grussformel: WideString; safecall;
    function Get_Versandzusatz: WideString; safecall;
    function Get_Zustellzusatz: WideString; safecall;
    property Typ: WideString read Get_Typ;
    property Name: WideString read Get_Name;
    property Kurzname: WideString read Get_Kurzname;
    property Name2: WideString read Get_Name2;
    property Name3: WideString read Get_Name3;
    property Ansprechpartner: WideString read Get_Ansprechpartner;
    property Telefon1: WideString read Get_Telefon1;
    property Telefon2: WideString read Get_Telefon2;
    property Mobil: WideString read Get_Mobil;
    property Fax: WideString read Get_Fax;
    property Mail: WideString read Get_Mail;
    property Web: WideString read Get_Web;
    property USTID: WideString read Get_USTID;
    property PLZGrossempf: WideString read Get_PLZGrossempf;
    property Titel: WideString read Get_Titel;
    property AkadGrad: WideString read Get_AkadGrad;
    property Geburtstag: WideString read Get_Geburtstag;
    property Anrede: WideString read Get_Anrede;
    property Briefanrede: WideString read Get_Briefanrede;
    property Grussformel: WideString read Get_Grussformel;
    property Versandzusatz: WideString read Get_Versandzusatz;
    property Zustellzusatz: WideString read Get_Zustellzusatz;
  end;

// *********************************************************************//
// DispIntf:  IAddZusatzAdresseDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {934E6095-A66B-42CB-9DEE-7BF6CCF6416B}
// *********************************************************************//
  IAddZusatzAdresseDisp = dispinterface
    ['{934E6095-A66B-42CB-9DEE-7BF6CCF6416B}']
    property Typ: WideString readonly dispid 1;
    property Name: WideString readonly dispid 2;
    property Kurzname: WideString readonly dispid 3;
    property Name2: WideString readonly dispid 4;
    property Name3: WideString readonly dispid 5;
    procedure Adresse(out strasse: WideString; out land: WideString; out plz: WideString; 
                      out ort: WideString); dispid 6;
    property Ansprechpartner: WideString readonly dispid 7;
    property Telefon1: WideString readonly dispid 8;
    property Telefon2: WideString readonly dispid 9;
    property Mobil: WideString readonly dispid 10;
    property Fax: WideString readonly dispid 11;
    property Mail: WideString readonly dispid 12;
    property Web: WideString readonly dispid 13;
    property USTID: WideString readonly dispid 14;
    procedure Bankdaten(out blz: WideString; out konto: WideString); dispid 15;
    procedure Postfach(out Postfach: WideString; out plzPostfach: WideString); dispid 16;
    property PLZGrossempf: WideString readonly dispid 17;
    property Titel: WideString readonly dispid 18;
    property AkadGrad: WideString readonly dispid 19;
    property Geburtstag: WideString readonly dispid 20;
    property Anrede: WideString readonly dispid 21;
    property Briefanrede: WideString readonly dispid 22;
    property Grussformel: WideString readonly dispid 23;
    property Versandzusatz: WideString readonly dispid 24;
    property Zustellzusatz: WideString readonly dispid 25;
  end;

// *********************************************************************//
// Interface: IRwPersKontoData
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {549B0C2F-9053-4EFF-8541-15F883508924}
// *********************************************************************//
  IRwPersKontoData = interface(IDispatch)
    ['{549B0C2F-9053-4EFF-8541-15F883508924}']
    function Get_m_BLZ(nummer: SYSINT): WideString; safecall;
    procedure Set_m_BLZ(nummer: SYSINT; const pVal: WideString); safecall;
    function Get_m_BankKonto(nummer: SYSINT): WideString; safecall;
    procedure Set_m_BankKonto(nummer: SYSINT; const pVal: WideString); safecall;
    function Get_m_Zahlungsart: WideString; safecall;
    procedure Set_m_Zahlungsart(const pVal: WideString); safecall;
    function Get_m_Zahlungskondition: Integer; safecall;
    procedure Set_m_Zahlungskondition(pVal: Integer); safecall;
    function Get_m_Sortierschluessel(index: SYSINT): Integer; safecall;
    procedure Set_m_Sortierschluessel(index: SYSINT; pVal: Integer); safecall;
    function Get_m_Webadresse: WideString; safecall;
    procedure Set_m_Webadresse(const pVal: WideString); safecall;
    function Get_m_DFUE: WideString; safecall;
    function Get_m_Autotelefon: WideString; safecall;
    procedure Set_m_Autotelefon(const pVal: WideString); safecall;
    function Get_m_USTID: WideString; safecall;
    procedure Set_m_USTID(const pVal: WideString); safecall;
    function Get_m_Ansprechpartner: WideString; safecall;
    procedure Set_m_Ansprechpartner(const pVal: WideString); safecall;
    function Get_m_Kurzbezeichnung: WideString; safecall;
    procedure Set_m_Kurzbezeichnung(const pVal: WideString); safecall;
    function Get_m_VerdichtungsKontp: WideString; safecall;
    procedure Set_m_VerdichtungsKontp(const pVal: WideString); safecall;
    function Get_m_BuchungstextVorschlag: WideString; safecall;
    procedure Set_m_BuchungstextVorschlag(const pVal: WideString); safecall;
    procedure UpdateData; safecall;
    function Get_m_Strasse: WideString; safecall;
    procedure Set_m_Strasse(const pVal: WideString); safecall;
    function Get_m_PLZ: WideString; safecall;
    procedure Set_m_PLZ(const pVal: WideString); safecall;
    function Get_m_Ort: WideString; safecall;
    procedure Set_m_Ort(const pVal: WideString); safecall;
    function Get_m_Fax: WideString; safecall;
    procedure Set_m_Fax(const pVal: WideString); safecall;
    function Get_m_Email: WideString; safecall;
    procedure Set_m_Email(const pVal: WideString); safecall;
    function Get_m_Telefon(nummer: SYSINT): WideString; safecall;
    procedure Set_m_Telefon(nummer: SYSINT; const pVal: WideString); safecall;
    property m_BLZ[nummer: SYSINT]: WideString read Get_m_BLZ write Set_m_BLZ;
    property m_BankKonto[nummer: SYSINT]: WideString read Get_m_BankKonto write Set_m_BankKonto;
    property m_Zahlungsart: WideString read Get_m_Zahlungsart write Set_m_Zahlungsart;
    property m_Zahlungskondition: Integer read Get_m_Zahlungskondition write Set_m_Zahlungskondition;
    property m_Sortierschluessel[index: SYSINT]: Integer read Get_m_Sortierschluessel write Set_m_Sortierschluessel;
    property m_Webadresse: WideString read Get_m_Webadresse write Set_m_Webadresse;
    property m_DFUE: WideString read Get_m_DFUE;
    property m_Autotelefon: WideString read Get_m_Autotelefon write Set_m_Autotelefon;
    property m_USTID: WideString read Get_m_USTID write Set_m_USTID;
    property m_Ansprechpartner: WideString read Get_m_Ansprechpartner write Set_m_Ansprechpartner;
    property m_Kurzbezeichnung: WideString read Get_m_Kurzbezeichnung write Set_m_Kurzbezeichnung;
    property m_VerdichtungsKontp: WideString read Get_m_VerdichtungsKontp write Set_m_VerdichtungsKontp;
    property m_BuchungstextVorschlag: WideString read Get_m_BuchungstextVorschlag write Set_m_BuchungstextVorschlag;
    property m_Strasse: WideString read Get_m_Strasse write Set_m_Strasse;
    property m_PLZ: WideString read Get_m_PLZ write Set_m_PLZ;
    property m_Ort: WideString read Get_m_Ort write Set_m_Ort;
    property m_Fax: WideString read Get_m_Fax write Set_m_Fax;
    property m_Email: WideString read Get_m_Email write Set_m_Email;
    property m_Telefon[nummer: SYSINT]: WideString read Get_m_Telefon write Set_m_Telefon;
  end;

// *********************************************************************//
// DispIntf:  IRwPersKontoDataDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {549B0C2F-9053-4EFF-8541-15F883508924}
// *********************************************************************//
  IRwPersKontoDataDisp = dispinterface
    ['{549B0C2F-9053-4EFF-8541-15F883508924}']
    property m_BLZ[nummer: SYSINT]: WideString dispid 1;
    property m_BankKonto[nummer: SYSINT]: WideString dispid 2;
    property m_Zahlungsart: WideString dispid 3;
    property m_Zahlungskondition: Integer dispid 4;
    property m_Sortierschluessel[index: SYSINT]: Integer dispid 5;
    property m_Webadresse: WideString dispid 6;
    property m_DFUE: WideString readonly dispid 7;
    property m_Autotelefon: WideString dispid 8;
    property m_USTID: WideString dispid 9;
    property m_Ansprechpartner: WideString dispid 10;
    property m_Kurzbezeichnung: WideString dispid 11;
    property m_VerdichtungsKontp: WideString dispid 12;
    property m_BuchungstextVorschlag: WideString dispid 13;
    procedure UpdateData; dispid 14;
    property m_Strasse: WideString dispid 15;
    property m_PLZ: WideString dispid 16;
    property m_Ort: WideString dispid 17;
    property m_Fax: WideString dispid 18;
    property m_Email: WideString dispid 19;
    property m_Telefon[nummer: SYSINT]: WideString dispid 20;
  end;

// *********************************************************************//
// Interface: IRwBuchungskreisTool
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {14C62BEB-81D2-4D25-832C-5B3DCA7B0355}
// *********************************************************************//
  IRwBuchungskreisTool = interface(IDispatch)
    ['{14C62BEB-81D2-4D25-832C-5B3DCA7B0355}']
    procedure SetBuchungskreis(bukreis: Integer; check: Byte); safecall;
    function Get_m_Buchungskreis: LongWord; safecall;
    property m_Buchungskreis: LongWord read Get_m_Buchungskreis;
  end;

// *********************************************************************//
// DispIntf:  IRwBuchungskreisToolDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {14C62BEB-81D2-4D25-832C-5B3DCA7B0355}
// *********************************************************************//
  IRwBuchungskreisToolDisp = dispinterface
    ['{14C62BEB-81D2-4D25-832C-5B3DCA7B0355}']
    procedure SetBuchungskreis(bukreis: Integer; check: Byte); dispid 1;
    property m_Buchungskreis: LongWord readonly dispid 2;
  end;

// *********************************************************************//
// Interface: IRwKreditorkonten
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0B537773-6C38-11D2-ADF1-000083F3B333}
// *********************************************************************//
  IRwKreditorkonten = interface(IDispatch)
    ['{0B537773-6C38-11D2-ADF1-000083F3B333}']
    function Get_SearchFibuKonto(const __MIDL_0026: WideString): IRwFibuKonto; safecall;
    function Get_GetFirst: IRwFibuKonto; safecall;
    function Get_GetNext: IRwFibuKonto; safecall;
    function Get_GetPrev: IRwFibuKonto; safecall;
    function Get_GetLast: IRwFibuKonto; safecall;
    function Get_CreateKontoNummer(const nr: WideString; const Name: WideString): WideString; safecall;
    property SearchFibuKonto[const __MIDL_0026: WideString]: IRwFibuKonto read Get_SearchFibuKonto;
    property GetFirst: IRwFibuKonto read Get_GetFirst;
    property GetNext: IRwFibuKonto read Get_GetNext;
    property GetPrev: IRwFibuKonto read Get_GetPrev;
    property GetLast: IRwFibuKonto read Get_GetLast;
    property CreateKontoNummer[const nr: WideString; const Name: WideString]: WideString read Get_CreateKontoNummer;
  end;

// *********************************************************************//
// DispIntf:  IRwKreditorkontenDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0B537773-6C38-11D2-ADF1-000083F3B333}
// *********************************************************************//
  IRwKreditorkontenDisp = dispinterface
    ['{0B537773-6C38-11D2-ADF1-000083F3B333}']
    property SearchFibuKonto[const __MIDL_0026: WideString]: IRwFibuKonto readonly dispid 1;
    property GetFirst: IRwFibuKonto readonly dispid 2;
    property GetNext: IRwFibuKonto readonly dispid 3;
    property GetPrev: IRwFibuKonto readonly dispid 4;
    property GetLast: IRwFibuKonto readonly dispid 5;
    property CreateKontoNummer[const nr: WideString; const Name: WideString]: WideString readonly dispid 6;
  end;

// *********************************************************************//
// Interface: IRwSachkonten
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0B53776D-6C38-11D2-ADF1-000083F3B333}
// *********************************************************************//
  IRwSachkonten = interface(IDispatch)
    ['{0B53776D-6C38-11D2-ADF1-000083F3B333}']
    function Get_SearchFibuKonto(const __MIDL_0022: WideString): IRwFibuKonto; safecall;
    function Get_GetFirst: IRwFibuKonto; safecall;
    function Get_GetNext: IRwFibuKonto; safecall;
    function Get_GetPrev: IRwFibuKonto; safecall;
    function Get_GetLast: IRwFibuKonto; safecall;
    property SearchFibuKonto[const __MIDL_0022: WideString]: IRwFibuKonto read Get_SearchFibuKonto;
    property GetFirst: IRwFibuKonto read Get_GetFirst;
    property GetNext: IRwFibuKonto read Get_GetNext;
    property GetPrev: IRwFibuKonto read Get_GetPrev;
    property GetLast: IRwFibuKonto read Get_GetLast;
  end;

// *********************************************************************//
// DispIntf:  IRwSachkontenDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0B53776D-6C38-11D2-ADF1-000083F3B333}
// *********************************************************************//
  IRwSachkontenDisp = dispinterface
    ['{0B53776D-6C38-11D2-ADF1-000083F3B333}']
    property SearchFibuKonto[const __MIDL_0022: WideString]: IRwFibuKonto readonly dispid 1;
    property GetFirst: IRwFibuKonto readonly dispid 2;
    property GetNext: IRwFibuKonto readonly dispid 3;
    property GetPrev: IRwFibuKonto readonly dispid 4;
    property GetLast: IRwFibuKonto readonly dispid 5;
  end;

// *********************************************************************//
// Interface: IRwOPSuche
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {1BB5D6C6-F4AF-11D2-AEE7-000083F3B333}
// *********************************************************************//
  IRwOPSuche = interface(IDispatch)
    ['{1BB5D6C6-F4AF-11D2-AEE7-000083F3B333}']
    function Get_Count: Smallint; safecall;
    function _NewEnum: IUnknown; safecall;
    procedure Refresh; safecall;
    function Get_Item(lIndex: Integer): OleVariant; safecall;
    procedure SearchBelegNr(const kontonummer: WideString; const bnr: WideString); safecall;
    procedure SearchBetrag(betrag: Currency); safecall;
    function Get_GetAt(pos: Integer): IRwOP; safecall;
    function Get_m_AusgezifferterBereich: Integer; safecall;
    procedure Set_m_AusgezifferterBereich(pVal: Integer); safecall;
    procedure SearchBelegNrAndDatum(const kontonummer: WideString; const bnr: WideString; 
                                    ausziffDatumVon: TDateTime; ausziffDatumBis: TDateTime); safecall;
    procedure SearchBelegNr2(const kontonummer: WideString; const belegnr: WideString); safecall;
    property Count: Smallint read Get_Count;
    property Item[lIndex: Integer]: OleVariant read Get_Item; default;
    property GetAt[pos: Integer]: IRwOP read Get_GetAt;
    property m_AusgezifferterBereich: Integer read Get_m_AusgezifferterBereich write Set_m_AusgezifferterBereich;
  end;

// *********************************************************************//
// DispIntf:  IRwOPSucheDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {1BB5D6C6-F4AF-11D2-AEE7-000083F3B333}
// *********************************************************************//
  IRwOPSucheDisp = dispinterface
    ['{1BB5D6C6-F4AF-11D2-AEE7-000083F3B333}']
    property Count: Smallint readonly dispid 1610743808;
    function _NewEnum: IUnknown; dispid -4;
    procedure Refresh; dispid 1610743810;
    property Item[lIndex: Integer]: OleVariant readonly dispid 0; default;
    procedure SearchBelegNr(const kontonummer: WideString; const bnr: WideString); dispid 1;
    procedure SearchBetrag(betrag: Currency); dispid 2;
    property GetAt[pos: Integer]: IRwOP readonly dispid 3;
    property m_AusgezifferterBereich: Integer dispid 4;
    procedure SearchBelegNrAndDatum(const kontonummer: WideString; const bnr: WideString; 
                                    ausziffDatumVon: TDateTime; ausziffDatumBis: TDateTime); dispid 5;
    procedure SearchBelegNr2(const kontonummer: WideString; const belegnr: WideString); dispid 6;
  end;

// *********************************************************************//
// Interface: IRwOP
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {1BB5D6C9-F4AF-11D2-AEE7-000083F3B333}
// *********************************************************************//
  IRwOP = interface(IDispatch)
    ['{1BB5D6C9-F4AF-11D2-AEE7-000083F3B333}']
    function Get_m_BelegNr: WideString; safecall;
    function Get_m_BelegDatum: TDateTime; safecall;
    function Get_m_BelegNr2: WideString; safecall;
    function Get_m_Betrag: Currency; safecall;
    function Get_m_NettoFaelligkeit: TDateTime; safecall;
    function Get_m_NettoFaelligkeitEingabe: TDateTime; safecall;
    function Get_m_WaehrungsID: Smallint; safecall;
    function Get_m_TransaktionsBetrag: Currency; safecall;
    function Get_m_SkontoFaelligkeitStufe(stufe: Integer): TDateTime; safecall;
    function Get_m_SkontoProzentSatzStufe(__MIDL_0019: Integer): Currency; safecall;
    function Get_m_BuchungsDatum: TDateTime; safecall;
    function Get_m_Buchungstext: WideString; safecall;
    function Get_m_IsAbgestimmt: Integer; safecall;
    function Get_m_Konto: WideString; safecall;
    function Get_m_Gegenkonto: WideString; safecall;
    function Get_m_WaehrungsKurs: Currency; safecall;
    function Get_m_AbwSortierschluessel: Integer; safecall;
    function Get_m_ZusatzAdresse: WideString; safecall;
    function Get_m_Mahnstufe: Integer; safecall;
    function Get_m_Auszifferungsdatum: TDateTime; safecall;
    function Get_m_MahnStatus: WideString; safecall;
    function Get_m_TageUeberfaellig(vglDatum: TDateTime): Integer; safecall;
    function Get_m_Kost1: WideString; safecall;
    function Get_m_Kost2: WideString; safecall;
    function Get_m_MahnStufeDatumPos(pos: Integer): TDateTime; safecall;
    function Get_m_MahnStufePos(pos: Integer): Integer; safecall;
    function Get_m_HighestBelegdatumAuszifferung: TDateTime; safecall;
    function Get_m_IsMahnungGesperrt: Integer; safecall;
    procedure SetCPDDaten(const Name: WideString; const branche: WideString; 
                          const strasse: WideString; const land: WideString; const plz: WideString; 
                          const ort: WideString; const blz: WideString; const konto: WideString); safecall;
    function Get_m_BezahltKennzeichen: Smallint; safecall;
    procedure Set_m_BezahltKennzeichen(pVal: Smallint); safecall;
    function Get_m_IsZahlung: Integer; safecall;
    function Get_m_SkontoBetrag: Currency; safecall;
    function Get_m_VerarbeitungsHinweis: WideString; safecall;
    procedure Set_m_VerarbeitungsHinweis(const pVal: WideString); safecall;
    function Get_m_ValutaDatum: TDateTime; safecall;
    procedure Set_m_ValutaDatum(pVal: TDateTime); safecall;
    function Get_m_FixeNettoFaelligkeit: TDateTime; safecall;
    procedure Set_m_FixeNettoFaelligkeit(pVal: TDateTime); safecall;
    function Get_m_BelegLink: WideString; safecall;
    procedure Set_m_BelegLink(const pVal: WideString); safecall;
    function Get_m_NettoTage: Integer; safecall;
    function Get_m_SkontoTage(stufe: Integer): Integer; safecall;
    function Get_m_SteuerProzentsatz: Double; safecall;
    function Get_m_Steuerart: WideString; safecall;
    function Get_GetBuchung: IRwBuchung; safecall;
    function Get_m_ObjectID: WideString; safecall;
    function Get_GetZahldauer(out pVal2: TDateTime): Integer; safecall;
    function Get_m_FreigabeMahnung: Integer; safecall;
    property m_BelegNr: WideString read Get_m_BelegNr;
    property m_BelegDatum: TDateTime read Get_m_BelegDatum;
    property m_BelegNr2: WideString read Get_m_BelegNr2;
    property m_Betrag: Currency read Get_m_Betrag;
    property m_NettoFaelligkeit: TDateTime read Get_m_NettoFaelligkeit;
    property m_NettoFaelligkeitEingabe: TDateTime read Get_m_NettoFaelligkeitEingabe;
    property m_WaehrungsID: Smallint read Get_m_WaehrungsID;
    property m_TransaktionsBetrag: Currency read Get_m_TransaktionsBetrag;
    property m_SkontoFaelligkeitStufe[stufe: Integer]: TDateTime read Get_m_SkontoFaelligkeitStufe;
    property m_SkontoProzentSatzStufe[__MIDL_0019: Integer]: Currency read Get_m_SkontoProzentSatzStufe;
    property m_BuchungsDatum: TDateTime read Get_m_BuchungsDatum;
    property m_Buchungstext: WideString read Get_m_Buchungstext;
    property m_IsAbgestimmt: Integer read Get_m_IsAbgestimmt;
    property m_Konto: WideString read Get_m_Konto;
    property m_Gegenkonto: WideString read Get_m_Gegenkonto;
    property m_WaehrungsKurs: Currency read Get_m_WaehrungsKurs;
    property m_AbwSortierschluessel: Integer read Get_m_AbwSortierschluessel;
    property m_ZusatzAdresse: WideString read Get_m_ZusatzAdresse;
    property m_Mahnstufe: Integer read Get_m_Mahnstufe;
    property m_Auszifferungsdatum: TDateTime read Get_m_Auszifferungsdatum;
    property m_MahnStatus: WideString read Get_m_MahnStatus;
    property m_TageUeberfaellig[vglDatum: TDateTime]: Integer read Get_m_TageUeberfaellig;
    property m_Kost1: WideString read Get_m_Kost1;
    property m_Kost2: WideString read Get_m_Kost2;
    property m_MahnStufeDatumPos[pos: Integer]: TDateTime read Get_m_MahnStufeDatumPos;
    property m_MahnStufePos[pos: Integer]: Integer read Get_m_MahnStufePos;
    property m_HighestBelegdatumAuszifferung: TDateTime read Get_m_HighestBelegdatumAuszifferung;
    property m_IsMahnungGesperrt: Integer read Get_m_IsMahnungGesperrt;
    property m_BezahltKennzeichen: Smallint read Get_m_BezahltKennzeichen write Set_m_BezahltKennzeichen;
    property m_IsZahlung: Integer read Get_m_IsZahlung;
    property m_SkontoBetrag: Currency read Get_m_SkontoBetrag;
    property m_VerarbeitungsHinweis: WideString read Get_m_VerarbeitungsHinweis write Set_m_VerarbeitungsHinweis;
    property m_ValutaDatum: TDateTime read Get_m_ValutaDatum write Set_m_ValutaDatum;
    property m_FixeNettoFaelligkeit: TDateTime read Get_m_FixeNettoFaelligkeit write Set_m_FixeNettoFaelligkeit;
    property m_BelegLink: WideString read Get_m_BelegLink write Set_m_BelegLink;
    property m_NettoTage: Integer read Get_m_NettoTage;
    property m_SkontoTage[stufe: Integer]: Integer read Get_m_SkontoTage;
    property m_SteuerProzentsatz: Double read Get_m_SteuerProzentsatz;
    property m_Steuerart: WideString read Get_m_Steuerart;
    property GetBuchung: IRwBuchung read Get_GetBuchung;
    property m_ObjectID: WideString read Get_m_ObjectID;
    property GetZahldauer[out pVal2: TDateTime]: Integer read Get_GetZahldauer;
    property m_FreigabeMahnung: Integer read Get_m_FreigabeMahnung;
  end;

// *********************************************************************//
// DispIntf:  IRwOPDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {1BB5D6C9-F4AF-11D2-AEE7-000083F3B333}
// *********************************************************************//
  IRwOPDisp = dispinterface
    ['{1BB5D6C9-F4AF-11D2-AEE7-000083F3B333}']
    property m_BelegNr: WideString readonly dispid 1;
    property m_BelegDatum: TDateTime readonly dispid 2;
    property m_BelegNr2: WideString readonly dispid 3;
    property m_Betrag: Currency readonly dispid 4;
    property m_NettoFaelligkeit: TDateTime readonly dispid 5;
    property m_NettoFaelligkeitEingabe: TDateTime readonly dispid 6;
    property m_WaehrungsID: Smallint readonly dispid 7;
    property m_TransaktionsBetrag: Currency readonly dispid 8;
    property m_SkontoFaelligkeitStufe[stufe: Integer]: TDateTime readonly dispid 10;
    property m_SkontoProzentSatzStufe[__MIDL_0019: Integer]: Currency readonly dispid 11;
    property m_BuchungsDatum: TDateTime readonly dispid 12;
    property m_Buchungstext: WideString readonly dispid 13;
    property m_IsAbgestimmt: Integer readonly dispid 14;
    property m_Konto: WideString readonly dispid 15;
    property m_Gegenkonto: WideString readonly dispid 16;
    property m_WaehrungsKurs: Currency readonly dispid 17;
    property m_AbwSortierschluessel: Integer readonly dispid 18;
    property m_ZusatzAdresse: WideString readonly dispid 19;
    property m_Mahnstufe: Integer readonly dispid 20;
    property m_Auszifferungsdatum: TDateTime readonly dispid 21;
    property m_MahnStatus: WideString readonly dispid 22;
    property m_TageUeberfaellig[vglDatum: TDateTime]: Integer readonly dispid 23;
    property m_Kost1: WideString readonly dispid 24;
    property m_Kost2: WideString readonly dispid 25;
    property m_MahnStufeDatumPos[pos: Integer]: TDateTime readonly dispid 26;
    property m_MahnStufePos[pos: Integer]: Integer readonly dispid 27;
    property m_HighestBelegdatumAuszifferung: TDateTime readonly dispid 28;
    property m_IsMahnungGesperrt: Integer readonly dispid 29;
    procedure SetCPDDaten(const Name: WideString; const branche: WideString; 
                          const strasse: WideString; const land: WideString; const plz: WideString; 
                          const ort: WideString; const blz: WideString; const konto: WideString); dispid 30;
    property m_BezahltKennzeichen: Smallint dispid 31;
    property m_IsZahlung: Integer readonly dispid 32;
    property m_SkontoBetrag: Currency readonly dispid 33;
    property m_VerarbeitungsHinweis: WideString dispid 34;
    property m_ValutaDatum: TDateTime dispid 35;
    property m_FixeNettoFaelligkeit: TDateTime dispid 36;
    property m_BelegLink: WideString dispid 37;
    property m_NettoTage: Integer readonly dispid 38;
    property m_SkontoTage[stufe: Integer]: Integer readonly dispid 39;
    property m_SteuerProzentsatz: Double readonly dispid 40;
    property m_Steuerart: WideString readonly dispid 41;
    property GetBuchung: IRwBuchung readonly dispid 42;
    property m_ObjectID: WideString readonly dispid 43;
    property GetZahldauer[out pVal2: TDateTime]: Integer readonly dispid 44;
    property m_FreigabeMahnung: Integer readonly dispid 45;
  end;

// *********************************************************************//
// Interface: IRwBuchung
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F838BBE8-576A-4AC3-9358-C1CBD53F791E}
// *********************************************************************//
  IRwBuchung = interface(IDispatch)
    ['{F838BBE8-576A-4AC3-9358-C1CBD53F791E}']
    procedure SeekKontierZeile(pos: Integer); safecall;
    function Get_m_isAutomatik: Integer; safecall;
    function Get_m_IsEingabe: Integer; safecall;
    function Get_m_Konto: WideString; safecall;
    function Get_m_Gegenkonto: WideString; safecall;
    function Get_m_Betrag: Currency; safecall;
    function Get_m_Steuerbetrag: Currency; safecall;
    function Get_m_Steuerschluessel: WideString; safecall;
    function Get_m_SteuerProzentsatz: Double; safecall;
    function Get_m_Buchungstext: WideString; safecall;
    function Get_m_Belegnummer1: WideString; safecall;
    function Get_m_Belegnummer2: WideString; safecall;
    function Get_m_Belegnummer2Eingabe: WideString; safecall;
    procedure Set_m_Belegnummer2Eingabe(const pVal: WideString); safecall;
    function Get_m_Buchungsnr: Integer; safecall;
    function Get_m_Kost1: WideString; safecall;
    function Get_m_Kost2: WideString; safecall;
    function Get_m_BelegDatum: TDateTime; safecall;
    function Get_m_IsValidPos: Integer; safecall;
    procedure SplitBetraege(const waehrung: WideString; var bruttobetrag: Double; 
                            var stsl1: WideString; var betrag1: Currency; var stsl2: WideString; 
                            var betrag2: Currency; var stsl3: WideString; var betrag3: Currency); safecall;
    function Get_IsWaehrung(const waehrungsKuerzel: WideString): Integer; safecall;
    function Get_m_Waehrung: WideString; safecall;
    function Get_m_TransaktionsBetrag: Currency; safecall;
    function Get_m_FreiesFeld(nummer: Integer): WideString; safecall;
    function Get_m_Erfassungsdatum: TDateTime; safecall;
    procedure Refresh; safecall;
    property m_isAutomatik: Integer read Get_m_isAutomatik;
    property m_IsEingabe: Integer read Get_m_IsEingabe;
    property m_Konto: WideString read Get_m_Konto;
    property m_Gegenkonto: WideString read Get_m_Gegenkonto;
    property m_Betrag: Currency read Get_m_Betrag;
    property m_Steuerbetrag: Currency read Get_m_Steuerbetrag;
    property m_Steuerschluessel: WideString read Get_m_Steuerschluessel;
    property m_SteuerProzentsatz: Double read Get_m_SteuerProzentsatz;
    property m_Buchungstext: WideString read Get_m_Buchungstext;
    property m_Belegnummer1: WideString read Get_m_Belegnummer1;
    property m_Belegnummer2: WideString read Get_m_Belegnummer2;
    property m_Belegnummer2Eingabe: WideString read Get_m_Belegnummer2Eingabe write Set_m_Belegnummer2Eingabe;
    property m_Buchungsnr: Integer read Get_m_Buchungsnr;
    property m_Kost1: WideString read Get_m_Kost1;
    property m_Kost2: WideString read Get_m_Kost2;
    property m_BelegDatum: TDateTime read Get_m_BelegDatum;
    property m_IsValidPos: Integer read Get_m_IsValidPos;
    property IsWaehrung[const waehrungsKuerzel: WideString]: Integer read Get_IsWaehrung;
    property m_Waehrung: WideString read Get_m_Waehrung;
    property m_TransaktionsBetrag: Currency read Get_m_TransaktionsBetrag;
    property m_FreiesFeld[nummer: Integer]: WideString read Get_m_FreiesFeld;
    property m_Erfassungsdatum: TDateTime read Get_m_Erfassungsdatum;
  end;

// *********************************************************************//
// DispIntf:  IRwBuchungDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F838BBE8-576A-4AC3-9358-C1CBD53F791E}
// *********************************************************************//
  IRwBuchungDisp = dispinterface
    ['{F838BBE8-576A-4AC3-9358-C1CBD53F791E}']
    procedure SeekKontierZeile(pos: Integer); dispid 1;
    property m_isAutomatik: Integer readonly dispid 2;
    property m_IsEingabe: Integer readonly dispid 3;
    property m_Konto: WideString readonly dispid 4;
    property m_Gegenkonto: WideString readonly dispid 5;
    property m_Betrag: Currency readonly dispid 6;
    property m_Steuerbetrag: Currency readonly dispid 7;
    property m_Steuerschluessel: WideString readonly dispid 8;
    property m_SteuerProzentsatz: Double readonly dispid 9;
    property m_Buchungstext: WideString readonly dispid 10;
    property m_Belegnummer1: WideString readonly dispid 11;
    property m_Belegnummer2: WideString readonly dispid 12;
    property m_Belegnummer2Eingabe: WideString dispid 13;
    property m_Buchungsnr: Integer readonly dispid 14;
    property m_Kost1: WideString readonly dispid 15;
    property m_Kost2: WideString readonly dispid 16;
    property m_BelegDatum: TDateTime readonly dispid 17;
    property m_IsValidPos: Integer readonly dispid 18;
    procedure SplitBetraege(const waehrung: WideString; var bruttobetrag: Double; 
                            var stsl1: WideString; var betrag1: Currency; var stsl2: WideString; 
                            var betrag2: Currency; var stsl3: WideString; var betrag3: Currency); dispid 19;
    property IsWaehrung[const waehrungsKuerzel: WideString]: Integer readonly dispid 20;
    property m_Waehrung: WideString readonly dispid 21;
    property m_TransaktionsBetrag: Currency readonly dispid 22;
    property m_FreiesFeld[nummer: Integer]: WideString readonly dispid 23;
    property m_Erfassungsdatum: TDateTime readonly dispid 24;
    procedure Refresh; dispid 25;
  end;

// *********************************************************************//
// Interface: IRwBuchungsstapelWJ
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0B53777F-6C38-11D2-ADF1-000083F3B333}
// *********************************************************************//
  IRwBuchungsstapelWJ = interface(IDispatch)
    ['{0B53777F-6C38-11D2-ADF1-000083F3B333}']
    function Get_Get(pos: Integer): IRwBuchungsstapel; safecall;
    function Get_m_Journalisiert: Integer; safecall;
    procedure Set_m_Journalisiert(pVal: Integer); safecall;
    procedure AddBuchungsstapel(buchungsdatum: TDateTime; const stapelname: WideString); safecall;
    property Get[pos: Integer]: IRwBuchungsstapel read Get_Get;
    property m_Journalisiert: Integer read Get_m_Journalisiert write Set_m_Journalisiert;
  end;

// *********************************************************************//
// DispIntf:  IRwBuchungsstapelWJDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0B53777F-6C38-11D2-ADF1-000083F3B333}
// *********************************************************************//
  IRwBuchungsstapelWJDisp = dispinterface
    ['{0B53777F-6C38-11D2-ADF1-000083F3B333}']
    property Get[pos: Integer]: IRwBuchungsstapel readonly dispid 1;
    property m_Journalisiert: Integer dispid 2;
    procedure AddBuchungsstapel(buchungsdatum: TDateTime; const stapelname: WideString); dispid 3;
  end;

// *********************************************************************//
// Interface: IRwBuchungsstapel
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0B53777C-6C38-11D2-ADF1-000083F3B333}
// *********************************************************************//
  IRwBuchungsstapel = interface(IDispatch)
    ['{0B53777C-6C38-11D2-ADF1-000083F3B333}']
    function Get_m_Name: WideString; safecall;
    function Get_m_BuchungsDatum: TDateTime; safecall;
    function Get_GetBuchung(pos: Integer): IRwBuchung; safecall;
    function Get_IsInPeriode(monat: SYSINT; jahr: SYSINT): Integer; safecall;
    function Get_m_Erstellungsdatum: TDateTime; safecall;
    function Get_m_ObjectID: Integer; safecall;
    procedure Refresh; safecall;
    property m_Name: WideString read Get_m_Name;
    property m_BuchungsDatum: TDateTime read Get_m_BuchungsDatum;
    property GetBuchung[pos: Integer]: IRwBuchung read Get_GetBuchung;
    property IsInPeriode[monat: SYSINT; jahr: SYSINT]: Integer read Get_IsInPeriode;
    property m_Erstellungsdatum: TDateTime read Get_m_Erstellungsdatum;
    property m_ObjectID: Integer read Get_m_ObjectID;
  end;

// *********************************************************************//
// DispIntf:  IRwBuchungsstapelDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0B53777C-6C38-11D2-ADF1-000083F3B333}
// *********************************************************************//
  IRwBuchungsstapelDisp = dispinterface
    ['{0B53777C-6C38-11D2-ADF1-000083F3B333}']
    property m_Name: WideString readonly dispid 1;
    property m_BuchungsDatum: TDateTime readonly dispid 2;
    property GetBuchung[pos: Integer]: IRwBuchung readonly dispid 3;
    property IsInPeriode[monat: SYSINT; jahr: SYSINT]: Integer readonly dispid 4;
    property m_Erstellungsdatum: TDateTime readonly dispid 5;
    property m_ObjectID: Integer readonly dispid 6;
    procedure Refresh; dispid 7;
  end;

// *********************************************************************//
// Interface: IRwBilanzInfo
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0B537764-6C38-11D2-ADF1-000083F3B333}
// *********************************************************************//
  IRwBilanzInfo = interface(IDispatch)
    ['{0B537764-6C38-11D2-ADF1-000083F3B333}']
    procedure LoadBilanz(mandant: Integer; mandantSchema: Integer; bilanzSchema: Integer; 
                         wjDatum: TDateTime; periodeBis: Integer; bilanzArt: Smallint; 
                         anzahlJahre: SYSINT; konsolidierung: Integer; Auswertungskreis: SYSINT); safecall;
    procedure ReloadAll; safecall;
    function Get_HasVorjahr: Integer; safecall;
    function Get_GetAuflistung(bilanzPosition: Integer; nurKonten: Integer): IRWKontoAuflistung; safecall;
    procedure GetFirstBilanzPosition(var pos: Integer; jahreZuBeachten: SYSINT); safecall;
    procedure GetNextBilanzPosition(curPos: Integer; var nextpos: Integer; jahreZuBeachten: SYSINT); safecall;
    procedure GetPos(bpos: Integer; var format: WideString; var gliederung: WideString; 
                     var bezeichnung: WideString; var wert: Currency; var vjwert: Currency); safecall;
    procedure GetPos5Jahre(bpos: Integer; var format: WideString; var gliederung: WideString; 
                           var bezeichnung: WideString; var wert: Currency; var wert1: Currency; 
                           var wert2: Currency; var wert3: Currency; var wert4: Currency); safecall;
    function Get_m_Bereich(bilanzPosition: Integer): WideString; safecall;
    property HasVorjahr: Integer read Get_HasVorjahr;
    property GetAuflistung[bilanzPosition: Integer; nurKonten: Integer]: IRWKontoAuflistung read Get_GetAuflistung;
    property m_Bereich[bilanzPosition: Integer]: WideString read Get_m_Bereich;
  end;

// *********************************************************************//
// DispIntf:  IRwBilanzInfoDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0B537764-6C38-11D2-ADF1-000083F3B333}
// *********************************************************************//
  IRwBilanzInfoDisp = dispinterface
    ['{0B537764-6C38-11D2-ADF1-000083F3B333}']
    procedure LoadBilanz(mandant: Integer; mandantSchema: Integer; bilanzSchema: Integer; 
                         wjDatum: TDateTime; periodeBis: Integer; bilanzArt: Smallint; 
                         anzahlJahre: SYSINT; konsolidierung: Integer; Auswertungskreis: SYSINT); dispid 1;
    procedure ReloadAll; dispid 2;
    property HasVorjahr: Integer readonly dispid 3;
    property GetAuflistung[bilanzPosition: Integer; nurKonten: Integer]: IRWKontoAuflistung readonly dispid 4;
    procedure GetFirstBilanzPosition(var pos: Integer; jahreZuBeachten: SYSINT); dispid 5;
    procedure GetNextBilanzPosition(curPos: Integer; var nextpos: Integer; jahreZuBeachten: SYSINT); dispid 6;
    procedure GetPos(bpos: Integer; var format: WideString; var gliederung: WideString; 
                     var bezeichnung: WideString; var wert: Currency; var vjwert: Currency); dispid 7;
    procedure GetPos5Jahre(bpos: Integer; var format: WideString; var gliederung: WideString; 
                           var bezeichnung: WideString; var wert: Currency; var wert1: Currency; 
                           var wert2: Currency; var wert3: Currency; var wert4: Currency); dispid 8;
    property m_Bereich[bilanzPosition: Integer]: WideString readonly dispid 9;
  end;

// *********************************************************************//
// Interface: IRWKontoAuflistung
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {3E27DCAB-04C8-4B32-BEFE-BAB17E4380C1}
// *********************************************************************//
  IRWKontoAuflistung = interface(IDispatch)
    ['{3E27DCAB-04C8-4B32-BEFE-BAB17E4380C1}']
    function Get_m_Position: Integer; safecall;
    procedure Set_m_Position(pVal: Integer); safecall;
    function Get_m_Konto: WideString; safecall;
    function Get_m_Bezeichnung: WideString; safecall;
    function Get_m_Saldo(jahr: SYSINT): Currency; safecall;
    function Get_m_AB(jahr: SYSINT): Currency; safecall;
    function Get_m_Soll(jahr: SYSINT): Currency; safecall;
    function Get_m_Haben(jahr: SYSINT): Currency; safecall;
    function Get_m_Umbuchung(jahr: SYSINT): Currency; safecall;
    function Get_m_Typ: Smallint; safecall;
    function Get_GetCount: Integer; safecall;
    property m_Position: Integer read Get_m_Position write Set_m_Position;
    property m_Konto: WideString read Get_m_Konto;
    property m_Bezeichnung: WideString read Get_m_Bezeichnung;
    property m_Saldo[jahr: SYSINT]: Currency read Get_m_Saldo;
    property m_AB[jahr: SYSINT]: Currency read Get_m_AB;
    property m_Soll[jahr: SYSINT]: Currency read Get_m_Soll;
    property m_Haben[jahr: SYSINT]: Currency read Get_m_Haben;
    property m_Umbuchung[jahr: SYSINT]: Currency read Get_m_Umbuchung;
    property m_Typ: Smallint read Get_m_Typ;
    property GetCount: Integer read Get_GetCount;
  end;

// *********************************************************************//
// DispIntf:  IRWKontoAuflistungDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {3E27DCAB-04C8-4B32-BEFE-BAB17E4380C1}
// *********************************************************************//
  IRWKontoAuflistungDisp = dispinterface
    ['{3E27DCAB-04C8-4B32-BEFE-BAB17E4380C1}']
    property m_Position: Integer dispid 1;
    property m_Konto: WideString readonly dispid 2;
    property m_Bezeichnung: WideString readonly dispid 3;
    property m_Saldo[jahr: SYSINT]: Currency readonly dispid 4;
    property m_AB[jahr: SYSINT]: Currency readonly dispid 5;
    property m_Soll[jahr: SYSINT]: Currency readonly dispid 6;
    property m_Haben[jahr: SYSINT]: Currency readonly dispid 7;
    property m_Umbuchung[jahr: SYSINT]: Currency readonly dispid 8;
    property m_Typ: Smallint readonly dispid 9;
    property GetCount: Integer readonly dispid 10;
  end;

// *********************************************************************//
// Interface: IRwBilanzItem
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0B537767-6C38-11D2-ADF1-000083F3B333}
// *********************************************************************//
  IRwBilanzItem = interface(IDispatch)
    ['{0B537767-6C38-11D2-ADF1-000083F3B333}']
    function Get_Request(const __MIDL_0021: WideString): WideString; safecall;
    property Request[const __MIDL_0021: WideString]: WideString read Get_Request;
  end;

// *********************************************************************//
// DispIntf:  IRwBilanzItemDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0B537767-6C38-11D2-ADF1-000083F3B333}
// *********************************************************************//
  IRwBilanzItemDisp = dispinterface
    ['{0B537767-6C38-11D2-ADF1-000083F3B333}']
    property Request[const __MIDL_0021: WideString]: WideString readonly dispid 1;
  end;

// *********************************************************************//
// Interface: IRwBuchungsImport
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {1BB5D6CC-F4AF-11D2-AEE7-000083F3B333}
// *********************************************************************//
  IRwBuchungsImport = interface(IDispatch)
    ['{1BB5D6CC-F4AF-11D2-AEE7-000083F3B333}']
    function Get_StartImport(MandantNr: Integer; const strDateiname: WideString): Integer; safecall;
    function Get_FirstErrorDescription(out str_Format: WideString; out l_SG: Integer): WideString; safecall;
    function Get_NextErrorDescription(out str_Format: WideString; out l_SG: Integer): WideString; safecall;
    function Get_strImportDatei: WideString; safecall;
    procedure Set_strImportDatei(const pVal: WideString); safecall;
    function Get_b_DosFormat: Integer; safecall;
    procedure Set_b_DosFormat(pVal: Integer); safecall;
    function Get_b_KontenModus: Integer; safecall;
    procedure Set_b_KontenModus(pVal: Integer); safecall;
    function Get_str_ImportVariante: WideString; safecall;
    procedure Set_str_ImportVariante(const pVal: WideString); safecall;
    function Get_str_BuchungsText: WideString; safecall;
    procedure Set_str_BuchungsText(const pVal: WideString); safecall;
    function Get_b_AktSumme: Integer; safecall;
    procedure Set_b_AktSumme(pVal: Integer); safecall;
    function Get_b_SperrGrund: Integer; safecall;
    procedure Set_b_SperrGrund(pVal: Integer); safecall;
    function Get_str_ConfigDatei: WideString; safecall;
    procedure Set_str_ConfigDatei(const pVal: WideString); safecall;
    function Get_strTreiberName: WideString; safecall;
    procedure Set_strTreiberName(const pVal: WideString); safecall;
    function Get_m_Abbruchposition: Integer; safecall;
    property StartImport[MandantNr: Integer; const strDateiname: WideString]: Integer read Get_StartImport;
    property FirstErrorDescription[out str_Format: WideString; out l_SG: Integer]: WideString read Get_FirstErrorDescription;
    property NextErrorDescription[out str_Format: WideString; out l_SG: Integer]: WideString read Get_NextErrorDescription;
    property strImportDatei: WideString read Get_strImportDatei write Set_strImportDatei;
    property b_DosFormat: Integer read Get_b_DosFormat write Set_b_DosFormat;
    property b_KontenModus: Integer read Get_b_KontenModus write Set_b_KontenModus;
    property str_ImportVariante: WideString read Get_str_ImportVariante write Set_str_ImportVariante;
    property str_BuchungsText: WideString read Get_str_BuchungsText write Set_str_BuchungsText;
    property b_AktSumme: Integer read Get_b_AktSumme write Set_b_AktSumme;
    property b_SperrGrund: Integer read Get_b_SperrGrund write Set_b_SperrGrund;
    property str_ConfigDatei: WideString read Get_str_ConfigDatei write Set_str_ConfigDatei;
    property strTreiberName: WideString read Get_strTreiberName write Set_strTreiberName;
    property m_Abbruchposition: Integer read Get_m_Abbruchposition;
  end;

// *********************************************************************//
// DispIntf:  IRwBuchungsImportDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {1BB5D6CC-F4AF-11D2-AEE7-000083F3B333}
// *********************************************************************//
  IRwBuchungsImportDisp = dispinterface
    ['{1BB5D6CC-F4AF-11D2-AEE7-000083F3B333}']
    property StartImport[MandantNr: Integer; const strDateiname: WideString]: Integer readonly dispid 1;
    property FirstErrorDescription[out str_Format: WideString; out l_SG: Integer]: WideString readonly dispid 2;
    property NextErrorDescription[out str_Format: WideString; out l_SG: Integer]: WideString readonly dispid 3;
    property strImportDatei: WideString dispid 4;
    property b_DosFormat: Integer dispid 5;
    property b_KontenModus: Integer dispid 6;
    property str_ImportVariante: WideString dispid 7;
    property str_BuchungsText: WideString dispid 8;
    property b_AktSumme: Integer dispid 9;
    property b_SperrGrund: Integer dispid 10;
    property str_ConfigDatei: WideString dispid 11;
    property strTreiberName: WideString dispid 12;
    property m_Abbruchposition: Integer readonly dispid 13;
  end;

// *********************************************************************//
// Interface: IRwKontenblatt
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {BA0AFD76-60F7-4C8B-B2C8-083E39D6BFF6}
// *********************************************************************//
  IRwKontenblatt = interface(IDispatch)
    ['{BA0AFD76-60F7-4C8B-B2C8-083E39D6BFF6}']
    procedure LoadBuchungen(mandant: Integer; const konto: WideString; wj: TDateTime; 
                            periodevon: SYSINT; periodeBis: SYSINT); safecall;
    function Get_Seek(pos: Integer): Integer; safecall;
    function Get_IsCPD: Integer; safecall;
    function Get_m_CPDName: WideString; safecall;
    function Get_m_CPDBranche: WideString; safecall;
    function Get_m_CPDStrasse: WideString; safecall;
    function Get_m_CPDPLZ: WideString; safecall;
    function Get_m_CPDOrt: WideString; safecall;
    function Get_m_CPDLand: WideString; safecall;
    function Get_m_CPDKonto: WideString; safecall;
    function Get_m_CPDBLZ: WideString; safecall;
    function Get_m_BankName: WideString; safecall;
    function Get_m_BuchungsSchluessel: WideString; safecall;
    function Get_m_BuchungsDatum: TDateTime; safecall;
    function Get_m_BelegDatum: TDateTime; safecall;
    function Get_m_BelegNr: WideString; safecall;
    function Get_m_BelegNr2: WideString; safecall;
    function Get_m_Konto: WideString; safecall;
    function Get_m_Gegenkonto: WideString; safecall;
    function Get_m_Betrag: Currency; safecall;
    function Get_m_TransaktionsBetrag: Currency; safecall;
    function Get_m_Kurs: Double; safecall;
    function Get_WaehrungISO: WideString; safecall;
    function Get_m_WaehrungKuerzel: WideString; safecall;
    function Get_m_WaehrungID: WideString; safecall;
    function Get_m_AbwSortierschluessel: WideString; safecall;
    function Get_m_FilialNr: WideString; safecall;
    function Get_m_Steuerschluessel: WideString; safecall;
    function Get_m_Buchungstext: WideString; safecall;
    function Get_m_Kost1: WideString; safecall;
    function Get_m_Kost2: WideString; safecall;
    function Get_m_Menge: Currency; safecall;
    function Get_m_Zahlungskondition: WideString; safecall;
    function Get_m_Zahlungsart: WideString; safecall;
    function Get_m_IsJournalisiert: Integer; safecall;
    function Get_m_JournalSeite: Integer; safecall;
    function Get_m_IsVerdichtet: Integer; safecall;
    function Get_m_IsAbgestimmt: Integer; safecall;
    procedure Set_m_IsAbgestimmt(pVal: Integer); safecall;
    function Get_m_IsABBuchung: Integer; safecall;
    function Get_IsStornoBuchung: Integer; safecall;
    function Get_m_KontierzeileBelegNr2: WideString; safecall;
    procedure Setm_KontierzeileBelegNr2(const bnr: WideString); safecall;
    function Get_ExpandVerdichtung: Integer; safecall;
    procedure Set_ExpandVerdichtung(pVal: Integer); safecall;
    function Get_GetBuchung: IRwBuchung; safecall;
    function Get_m_Buchungsmonat: Smallint; safecall;
    function Get_m_Buchungsjahr: Smallint; safecall;
    function Get_KontierzInfo(const sKey: WideString): WideString; safecall;
    procedure SetBuchungskreis(buchungskreis: LongWord); safecall;
    procedure SetBuchungskreisTool(const bukreis: IRwBuchungskreisTool); safecall;
    function Get_m_Buchungskreis: Integer; safecall;
    property Seek[pos: Integer]: Integer read Get_Seek;
    property IsCPD: Integer read Get_IsCPD;
    property m_CPDName: WideString read Get_m_CPDName;
    property m_CPDBranche: WideString read Get_m_CPDBranche;
    property m_CPDStrasse: WideString read Get_m_CPDStrasse;
    property m_CPDPLZ: WideString read Get_m_CPDPLZ;
    property m_CPDOrt: WideString read Get_m_CPDOrt;
    property m_CPDLand: WideString read Get_m_CPDLand;
    property m_CPDKonto: WideString read Get_m_CPDKonto;
    property m_CPDBLZ: WideString read Get_m_CPDBLZ;
    property m_BankName: WideString read Get_m_BankName;
    property m_BuchungsSchluessel: WideString read Get_m_BuchungsSchluessel;
    property m_BuchungsDatum: TDateTime read Get_m_BuchungsDatum;
    property m_BelegDatum: TDateTime read Get_m_BelegDatum;
    property m_BelegNr: WideString read Get_m_BelegNr;
    property m_BelegNr2: WideString read Get_m_BelegNr2;
    property m_Konto: WideString read Get_m_Konto;
    property m_Gegenkonto: WideString read Get_m_Gegenkonto;
    property m_Betrag: Currency read Get_m_Betrag;
    property m_TransaktionsBetrag: Currency read Get_m_TransaktionsBetrag;
    property m_Kurs: Double read Get_m_Kurs;
    property WaehrungISO: WideString read Get_WaehrungISO;
    property m_WaehrungKuerzel: WideString read Get_m_WaehrungKuerzel;
    property m_WaehrungID: WideString read Get_m_WaehrungID;
    property m_AbwSortierschluessel: WideString read Get_m_AbwSortierschluessel;
    property m_FilialNr: WideString read Get_m_FilialNr;
    property m_Steuerschluessel: WideString read Get_m_Steuerschluessel;
    property m_Buchungstext: WideString read Get_m_Buchungstext;
    property m_Kost1: WideString read Get_m_Kost1;
    property m_Kost2: WideString read Get_m_Kost2;
    property m_Menge: Currency read Get_m_Menge;
    property m_Zahlungskondition: WideString read Get_m_Zahlungskondition;
    property m_Zahlungsart: WideString read Get_m_Zahlungsart;
    property m_IsJournalisiert: Integer read Get_m_IsJournalisiert;
    property m_JournalSeite: Integer read Get_m_JournalSeite;
    property m_IsVerdichtet: Integer read Get_m_IsVerdichtet;
    property m_IsAbgestimmt: Integer read Get_m_IsAbgestimmt write Set_m_IsAbgestimmt;
    property m_IsABBuchung: Integer read Get_m_IsABBuchung;
    property IsStornoBuchung: Integer read Get_IsStornoBuchung;
    property m_KontierzeileBelegNr2: WideString read Get_m_KontierzeileBelegNr2;
    property ExpandVerdichtung: Integer read Get_ExpandVerdichtung write Set_ExpandVerdichtung;
    property GetBuchung: IRwBuchung read Get_GetBuchung;
    property m_Buchungsmonat: Smallint read Get_m_Buchungsmonat;
    property m_Buchungsjahr: Smallint read Get_m_Buchungsjahr;
    property KontierzInfo[const sKey: WideString]: WideString read Get_KontierzInfo;
    property m_Buchungskreis: Integer read Get_m_Buchungskreis;
  end;

// *********************************************************************//
// DispIntf:  IRwKontenblattDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {BA0AFD76-60F7-4C8B-B2C8-083E39D6BFF6}
// *********************************************************************//
  IRwKontenblattDisp = dispinterface
    ['{BA0AFD76-60F7-4C8B-B2C8-083E39D6BFF6}']
    procedure LoadBuchungen(mandant: Integer; const konto: WideString; wj: TDateTime; 
                            periodevon: SYSINT; periodeBis: SYSINT); dispid 1;
    property Seek[pos: Integer]: Integer readonly dispid 2;
    property IsCPD: Integer readonly dispid 3;
    property m_CPDName: WideString readonly dispid 4;
    property m_CPDBranche: WideString readonly dispid 5;
    property m_CPDStrasse: WideString readonly dispid 6;
    property m_CPDPLZ: WideString readonly dispid 7;
    property m_CPDOrt: WideString readonly dispid 8;
    property m_CPDLand: WideString readonly dispid 9;
    property m_CPDKonto: WideString readonly dispid 10;
    property m_CPDBLZ: WideString readonly dispid 11;
    property m_BankName: WideString readonly dispid 12;
    property m_BuchungsSchluessel: WideString readonly dispid 13;
    property m_BuchungsDatum: TDateTime readonly dispid 14;
    property m_BelegDatum: TDateTime readonly dispid 15;
    property m_BelegNr: WideString readonly dispid 16;
    property m_BelegNr2: WideString readonly dispid 17;
    property m_Konto: WideString readonly dispid 18;
    property m_Gegenkonto: WideString readonly dispid 19;
    property m_Betrag: Currency readonly dispid 20;
    property m_TransaktionsBetrag: Currency readonly dispid 21;
    property m_Kurs: Double readonly dispid 22;
    property WaehrungISO: WideString readonly dispid 23;
    property m_WaehrungKuerzel: WideString readonly dispid 24;
    property m_WaehrungID: WideString readonly dispid 25;
    property m_AbwSortierschluessel: WideString readonly dispid 26;
    property m_FilialNr: WideString readonly dispid 27;
    property m_Steuerschluessel: WideString readonly dispid 28;
    property m_Buchungstext: WideString readonly dispid 29;
    property m_Kost1: WideString readonly dispid 30;
    property m_Kost2: WideString readonly dispid 31;
    property m_Menge: Currency readonly dispid 32;
    property m_Zahlungskondition: WideString readonly dispid 33;
    property m_Zahlungsart: WideString readonly dispid 34;
    property m_IsJournalisiert: Integer readonly dispid 35;
    property m_JournalSeite: Integer readonly dispid 36;
    property m_IsVerdichtet: Integer readonly dispid 37;
    property m_IsAbgestimmt: Integer dispid 38;
    property m_IsABBuchung: Integer readonly dispid 39;
    property IsStornoBuchung: Integer readonly dispid 40;
    property m_KontierzeileBelegNr2: WideString readonly dispid 41;
    procedure Setm_KontierzeileBelegNr2(const bnr: WideString); dispid 42;
    property ExpandVerdichtung: Integer dispid 43;
    property GetBuchung: IRwBuchung readonly dispid 44;
    property m_Buchungsmonat: Smallint readonly dispid 45;
    property m_Buchungsjahr: Smallint readonly dispid 46;
    property KontierzInfo[const sKey: WideString]: WideString readonly dispid 47;
    procedure SetBuchungskreis(buchungskreis: LongWord); dispid 48;
    procedure SetBuchungskreisTool(const bukreis: IRwBuchungskreisTool); dispid 49;
    property m_Buchungskreis: Integer readonly dispid 50;
  end;

// *********************************************************************//
// Interface: IRwBuchungsabgleich
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {68755C09-3A6C-4274-9242-2E4B10CFFAC4}
// *********************************************************************//
  IRwBuchungsabgleich = interface(IDispatch)
    ['{68755C09-3A6C-4274-9242-2E4B10CFFAC4}']
    procedure DoAbgleich(mandnr: Integer; wjDatum: TDateTime; periodeBis: TDateTime; 
                         const fileName: WideString); safecall;
  end;

// *********************************************************************//
// DispIntf:  IRwBuchungsabgleichDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {68755C09-3A6C-4274-9242-2E4B10CFFAC4}
// *********************************************************************//
  IRwBuchungsabgleichDisp = dispinterface
    ['{68755C09-3A6C-4274-9242-2E4B10CFFAC4}']
    procedure DoAbgleich(mandnr: Integer; wjDatum: TDateTime; periodeBis: TDateTime; 
                         const fileName: WideString); dispid 1;
  end;

// *********************************************************************//
// The Class CoAddFibuProjectImp provides a Create and CreateRemote method to          
// create instances of the default interface IAddFibuProjectImp exposed by              
// the CoClass AddFibuProjectImp. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAddFibuProjectImp = class
    class function Create: IAddFibuProjectImp;
    class function CreateRemote(const MachineName: string): IAddFibuProjectImp;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TAddFibuProjectImp
// Help String      : AddFibuProjectImp Class
// Default Interface: IAddFibuProjectImp
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TAddFibuProjectImpProperties= class;
{$ENDIF}
  TAddFibuProjectImp = class(TOleServer)
  private
    FIntf: IAddFibuProjectImp;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TAddFibuProjectImpProperties;
    function GetServerProperties: TAddFibuProjectImpProperties;
{$ENDIF}
    function GetDefaultInterface: IAddFibuProjectImp;
  protected
    procedure InitServerData; override;
    function Get_GetWJPos(position: Integer): IRwFibuWJ;
    function Get_GetWJDate(__MIDL_0030: TDateTime): IRwFibuWJ;
    function Get_IsLocked: Integer;
    function Get_GetLastWJ: IRwFibuWJ;
    function Get_SearchFibuWJ(monat: SYSINT; jahr: SYSINT): IRwFibuWJ;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IAddFibuProjectImp);
    procedure Disconnect; override;
    procedure Attach(const __MIDL_0029: IAddProject);
    procedure LockProject(exklusive: Integer);
    procedure UnLockProject(exklusive: Integer; deep: Integer);
    procedure AttachMandantenNr(mnr: Integer);
    procedure RefreshFibuObjects;
    property DefaultInterface: IAddFibuProjectImp read GetDefaultInterface;
    property GetWJPos[position: Integer]: IRwFibuWJ read Get_GetWJPos;
    property GetWJDate[__MIDL_0030: TDateTime]: IRwFibuWJ read Get_GetWJDate;
    property IsLocked: Integer read Get_IsLocked;
    property GetLastWJ: IRwFibuWJ read Get_GetLastWJ;
    property SearchFibuWJ[monat: SYSINT; jahr: SYSINT]: IRwFibuWJ read Get_SearchFibuWJ;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TAddFibuProjectImpProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TAddFibuProjectImp
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TAddFibuProjectImpProperties = class(TPersistent)
  private
    FServer:    TAddFibuProjectImp;
    function    GetDefaultInterface: IAddFibuProjectImp;
    constructor Create(AServer: TAddFibuProjectImp);
  protected
    function Get_GetWJPos(position: Integer): IRwFibuWJ;
    function Get_GetWJDate(__MIDL_0030: TDateTime): IRwFibuWJ;
    function Get_IsLocked: Integer;
    function Get_GetLastWJ: IRwFibuWJ;
    function Get_SearchFibuWJ(monat: SYSINT; jahr: SYSINT): IRwFibuWJ;
  public
    property DefaultInterface: IAddFibuProjectImp read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoRwFibuWJ provides a Create and CreateRemote method to          
// create instances of the default interface IRwFibuWJ exposed by              
// the CoClass RwFibuWJ. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRwFibuWJ = class
    class function Create: IRwFibuWJ;
    class function CreateRemote(const MachineName: string): IRwFibuWJ;
  end;

  TRwFibuWJNotifyProgress = procedure(ASender: TObject; const text: WideString; percent: SYSINT) of object;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TRwFibuWJ
// Help String      : RwFibuWJ Class
// Default Interface: IRwFibuWJ
// Def. Intf. DISP? : No
// Event   Interface: DReweAppEvents
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TRwFibuWJProperties= class;
{$ENDIF}
  TRwFibuWJ = class(TOleServer)
  private
    FOnNotifyProgress: TRwFibuWJNotifyProgress;
    FIntf: IRwFibuWJ;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TRwFibuWJProperties;
    function GetServerProperties: TRwFibuWJProperties;
{$ENDIF}
    function GetDefaultInterface: IRwFibuWJ;
  protected
    procedure InitServerData; override;
    procedure InvokeEvent(DispID: TDispID; var Params: TVariantArray); override;
    function Get_m_Beginn: TDateTime;
    function Get_m_Ende: TDateTime;
    function Get_m_VerdichtForderungen(index: Integer): WideString;
    function Get_m_VerdichtVerbindlichkeiten(index: Integer): WideString;
    function Get_IsVerdichtKonto(const __MIDL_0027: WideString): Integer;
    function Get_m_DifferenzenKonto: WideString;
    function Get_m_DifferenzenKreditorKonto: WideString;
    function Get_m_DifferenzenDebitorKonto: WideString;
    function Get_m_BilanzEroeffnungsKonto: WideString;
    function Get_m_BilanzEroeffnungDebitorKonto: WideString;
    function Get_m_BilanzEroeffnungKreditorKonto: WideString;
    function Get_m_UmstellungsDifferenzKonto: WideString;
    function Get_m_Hauswaehrung: Smallint;
    function Get_IsSachkonto(const kontoNr: WideString): Integer;
    function Get_IsDebitor(const kontoNr: WideString): Integer;
    function Get_IsKreditor(const kontoNr: WideString): Integer;
    function Get_m_Debitorkonten: IRwDebitorkonten;
    function Get_m_Kreditorkonten: IRwKreditorkonten;
    function Get_m_Sachkonten: IRwSachkonten;
    function Get_m_Istversteuerer: Integer;
    function Get_m_HasOPVerwaltung: Integer;
    function Get_CreateOPSuche: IRwOPSuche;
    function Get_m_BuchungsDatum: TDateTime;
    function Get_getBuchungsstapelWJ: IRwBuchungsstapelWJ;
    function Get_GetStandardBilanzSchema(var isMandantSchema: Integer): Integer;
    function Get_IsInWJ(__MIDL_0028: TDateTime): Integer;
    function Get_GetBInfo(const infoString: WideString): IRwBilanzInfo;
    function Get_GetBItem(const infoString: WideString): IRwBilanzItem;
    function Get_m_Kontenrahmen: Integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IRwFibuWJ);
    procedure Disconnect; override;
    procedure Refresh;
    function IsSteuerSchluesselValid(const steuerSchluessel: WideString): Integer;
    property DefaultInterface: IRwFibuWJ read GetDefaultInterface;
    property m_Beginn: TDateTime read Get_m_Beginn;
    property m_Ende: TDateTime read Get_m_Ende;
    property m_VerdichtForderungen[index: Integer]: WideString read Get_m_VerdichtForderungen;
    property m_VerdichtVerbindlichkeiten[index: Integer]: WideString read Get_m_VerdichtVerbindlichkeiten;
    property IsVerdichtKonto[const __MIDL_0027: WideString]: Integer read Get_IsVerdichtKonto;
    property m_DifferenzenKonto: WideString read Get_m_DifferenzenKonto;
    property m_DifferenzenKreditorKonto: WideString read Get_m_DifferenzenKreditorKonto;
    property m_DifferenzenDebitorKonto: WideString read Get_m_DifferenzenDebitorKonto;
    property m_BilanzEroeffnungsKonto: WideString read Get_m_BilanzEroeffnungsKonto;
    property m_BilanzEroeffnungDebitorKonto: WideString read Get_m_BilanzEroeffnungDebitorKonto;
    property m_BilanzEroeffnungKreditorKonto: WideString read Get_m_BilanzEroeffnungKreditorKonto;
    property m_UmstellungsDifferenzKonto: WideString read Get_m_UmstellungsDifferenzKonto;
    property m_Hauswaehrung: Smallint read Get_m_Hauswaehrung;
    property IsSachkonto[const kontoNr: WideString]: Integer read Get_IsSachkonto;
    property IsDebitor[const kontoNr: WideString]: Integer read Get_IsDebitor;
    property IsKreditor[const kontoNr: WideString]: Integer read Get_IsKreditor;
    property m_Debitorkonten: IRwDebitorkonten read Get_m_Debitorkonten;
    property m_Kreditorkonten: IRwKreditorkonten read Get_m_Kreditorkonten;
    property m_Sachkonten: IRwSachkonten read Get_m_Sachkonten;
    property m_Istversteuerer: Integer read Get_m_Istversteuerer;
    property m_HasOPVerwaltung: Integer read Get_m_HasOPVerwaltung;
    property CreateOPSuche: IRwOPSuche read Get_CreateOPSuche;
    property m_BuchungsDatum: TDateTime read Get_m_BuchungsDatum;
    property getBuchungsstapelWJ: IRwBuchungsstapelWJ read Get_getBuchungsstapelWJ;
    property GetStandardBilanzSchema[var isMandantSchema: Integer]: Integer read Get_GetStandardBilanzSchema;
    property IsInWJ[__MIDL_0028: TDateTime]: Integer read Get_IsInWJ;
    property GetBInfo[const infoString: WideString]: IRwBilanzInfo read Get_GetBInfo;
    property GetBItem[const infoString: WideString]: IRwBilanzItem read Get_GetBItem;
    property m_Kontenrahmen: Integer read Get_m_Kontenrahmen;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TRwFibuWJProperties read GetServerProperties;
{$ENDIF}
    property OnNotifyProgress: TRwFibuWJNotifyProgress read FOnNotifyProgress write FOnNotifyProgress;
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TRwFibuWJ
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TRwFibuWJProperties = class(TPersistent)
  private
    FServer:    TRwFibuWJ;
    function    GetDefaultInterface: IRwFibuWJ;
    constructor Create(AServer: TRwFibuWJ);
  protected
    function Get_m_Beginn: TDateTime;
    function Get_m_Ende: TDateTime;
    function Get_m_VerdichtForderungen(index: Integer): WideString;
    function Get_m_VerdichtVerbindlichkeiten(index: Integer): WideString;
    function Get_IsVerdichtKonto(const __MIDL_0027: WideString): Integer;
    function Get_m_DifferenzenKonto: WideString;
    function Get_m_DifferenzenKreditorKonto: WideString;
    function Get_m_DifferenzenDebitorKonto: WideString;
    function Get_m_BilanzEroeffnungsKonto: WideString;
    function Get_m_BilanzEroeffnungDebitorKonto: WideString;
    function Get_m_BilanzEroeffnungKreditorKonto: WideString;
    function Get_m_UmstellungsDifferenzKonto: WideString;
    function Get_m_Hauswaehrung: Smallint;
    function Get_IsSachkonto(const kontoNr: WideString): Integer;
    function Get_IsDebitor(const kontoNr: WideString): Integer;
    function Get_IsKreditor(const kontoNr: WideString): Integer;
    function Get_m_Debitorkonten: IRwDebitorkonten;
    function Get_m_Kreditorkonten: IRwKreditorkonten;
    function Get_m_Sachkonten: IRwSachkonten;
    function Get_m_Istversteuerer: Integer;
    function Get_m_HasOPVerwaltung: Integer;
    function Get_CreateOPSuche: IRwOPSuche;
    function Get_m_BuchungsDatum: TDateTime;
    function Get_getBuchungsstapelWJ: IRwBuchungsstapelWJ;
    function Get_GetStandardBilanzSchema(var isMandantSchema: Integer): Integer;
    function Get_IsInWJ(__MIDL_0028: TDateTime): Integer;
    function Get_GetBInfo(const infoString: WideString): IRwBilanzInfo;
    function Get_GetBItem(const infoString: WideString): IRwBilanzItem;
    function Get_m_Kontenrahmen: Integer;
  public
    property DefaultInterface: IRwFibuWJ read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoRwBilanzInfo provides a Create and CreateRemote method to          
// create instances of the default interface IRwBilanzInfo exposed by              
// the CoClass RwBilanzInfo. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRwBilanzInfo = class
    class function Create: IRwBilanzInfo;
    class function CreateRemote(const MachineName: string): IRwBilanzInfo;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TRwBilanzInfo
// Help String      : RwBilanzInfo Class
// Default Interface: IRwBilanzInfo
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TRwBilanzInfoProperties= class;
{$ENDIF}
  TRwBilanzInfo = class(TOleServer)
  private
    FIntf: IRwBilanzInfo;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TRwBilanzInfoProperties;
    function GetServerProperties: TRwBilanzInfoProperties;
{$ENDIF}
    function GetDefaultInterface: IRwBilanzInfo;
  protected
    procedure InitServerData; override;
    function Get_HasVorjahr: Integer;
    function Get_GetAuflistung(bilanzPosition: Integer; nurKonten: Integer): IRWKontoAuflistung;
    function Get_m_Bereich(bilanzPosition: Integer): WideString;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IRwBilanzInfo);
    procedure Disconnect; override;
    procedure LoadBilanz(mandant: Integer; mandantSchema: Integer; bilanzSchema: Integer; 
                         wjDatum: TDateTime; periodeBis: Integer; bilanzArt: Smallint; 
                         anzahlJahre: SYSINT; konsolidierung: Integer; Auswertungskreis: SYSINT);
    procedure ReloadAll;
    procedure GetFirstBilanzPosition(var pos: Integer; jahreZuBeachten: SYSINT);
    procedure GetNextBilanzPosition(curPos: Integer; var nextpos: Integer; jahreZuBeachten: SYSINT);
    procedure GetPos(bpos: Integer; var format: WideString; var gliederung: WideString; 
                     var bezeichnung: WideString; var wert: Currency; var vjwert: Currency);
    procedure GetPos5Jahre(bpos: Integer; var format: WideString; var gliederung: WideString; 
                           var bezeichnung: WideString; var wert: Currency; var wert1: Currency; 
                           var wert2: Currency; var wert3: Currency; var wert4: Currency);
    property DefaultInterface: IRwBilanzInfo read GetDefaultInterface;
    property HasVorjahr: Integer read Get_HasVorjahr;
    property GetAuflistung[bilanzPosition: Integer; nurKonten: Integer]: IRWKontoAuflistung read Get_GetAuflistung;
    property m_Bereich[bilanzPosition: Integer]: WideString read Get_m_Bereich;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TRwBilanzInfoProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TRwBilanzInfo
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TRwBilanzInfoProperties = class(TPersistent)
  private
    FServer:    TRwBilanzInfo;
    function    GetDefaultInterface: IRwBilanzInfo;
    constructor Create(AServer: TRwBilanzInfo);
  protected
    function Get_HasVorjahr: Integer;
    function Get_GetAuflistung(bilanzPosition: Integer; nurKonten: Integer): IRWKontoAuflistung;
    function Get_m_Bereich(bilanzPosition: Integer): WideString;
  public
    property DefaultInterface: IRwBilanzInfo read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoRwBilanzItem provides a Create and CreateRemote method to          
// create instances of the default interface IRwBilanzItem exposed by              
// the CoClass RwBilanzItem. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRwBilanzItem = class
    class function Create: IRwBilanzItem;
    class function CreateRemote(const MachineName: string): IRwBilanzItem;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TRwBilanzItem
// Help String      : RwBilanzItem (Replacement for DDE-Access)
// Default Interface: IRwBilanzItem
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TRwBilanzItemProperties= class;
{$ENDIF}
  TRwBilanzItem = class(TOleServer)
  private
    FIntf: IRwBilanzItem;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TRwBilanzItemProperties;
    function GetServerProperties: TRwBilanzItemProperties;
{$ENDIF}
    function GetDefaultInterface: IRwBilanzItem;
  protected
    procedure InitServerData; override;
    function Get_Request(const __MIDL_0021: WideString): WideString;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IRwBilanzItem);
    procedure Disconnect; override;
    property DefaultInterface: IRwBilanzItem read GetDefaultInterface;
    property Request[const __MIDL_0021: WideString]: WideString read Get_Request;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TRwBilanzItemProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TRwBilanzItem
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TRwBilanzItemProperties = class(TPersistent)
  private
    FServer:    TRwBilanzItem;
    function    GetDefaultInterface: IRwBilanzItem;
    constructor Create(AServer: TRwBilanzItem);
  protected
    function Get_Request(const __MIDL_0021: WideString): WideString;
  public
    property DefaultInterface: IRwBilanzItem read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoRwSachkonten provides a Create and CreateRemote method to          
// create instances of the default interface IRwSachkonten exposed by              
// the CoClass RwSachkonten. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRwSachkonten = class
    class function Create: IRwSachkonten;
    class function CreateRemote(const MachineName: string): IRwSachkonten;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TRwSachkonten
// Help String      : RwSachkonten Class
// Default Interface: IRwSachkonten
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TRwSachkontenProperties= class;
{$ENDIF}
  TRwSachkonten = class(TOleServer)
  private
    FIntf: IRwSachkonten;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TRwSachkontenProperties;
    function GetServerProperties: TRwSachkontenProperties;
{$ENDIF}
    function GetDefaultInterface: IRwSachkonten;
  protected
    procedure InitServerData; override;
    function Get_SearchFibuKonto(const __MIDL_0022: WideString): IRwFibuKonto;
    function Get_GetFirst: IRwFibuKonto;
    function Get_GetNext: IRwFibuKonto;
    function Get_GetPrev: IRwFibuKonto;
    function Get_GetLast: IRwFibuKonto;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IRwSachkonten);
    procedure Disconnect; override;
    property DefaultInterface: IRwSachkonten read GetDefaultInterface;
    property SearchFibuKonto[const __MIDL_0022: WideString]: IRwFibuKonto read Get_SearchFibuKonto;
    property GetFirst: IRwFibuKonto read Get_GetFirst;
    property GetNext: IRwFibuKonto read Get_GetNext;
    property GetPrev: IRwFibuKonto read Get_GetPrev;
    property GetLast: IRwFibuKonto read Get_GetLast;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TRwSachkontenProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TRwSachkonten
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TRwSachkontenProperties = class(TPersistent)
  private
    FServer:    TRwSachkonten;
    function    GetDefaultInterface: IRwSachkonten;
    constructor Create(AServer: TRwSachkonten);
  protected
    function Get_SearchFibuKonto(const __MIDL_0022: WideString): IRwFibuKonto;
    function Get_GetFirst: IRwFibuKonto;
    function Get_GetNext: IRwFibuKonto;
    function Get_GetPrev: IRwFibuKonto;
    function Get_GetLast: IRwFibuKonto;
  public
    property DefaultInterface: IRwSachkonten read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoRwDebitorkonten provides a Create and CreateRemote method to          
// create instances of the default interface IRwDebitorkonten exposed by              
// the CoClass RwDebitorkonten. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRwDebitorkonten = class
    class function Create: IRwDebitorkonten;
    class function CreateRemote(const MachineName: string): IRwDebitorkonten;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TRwDebitorkonten
// Help String      : RwDebitorkonten Class
// Default Interface: IRwDebitorkonten
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TRwDebitorkontenProperties= class;
{$ENDIF}
  TRwDebitorkonten = class(TOleServer)
  private
    FIntf: IRwDebitorkonten;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TRwDebitorkontenProperties;
    function GetServerProperties: TRwDebitorkontenProperties;
{$ENDIF}
    function GetDefaultInterface: IRwDebitorkonten;
  protected
    procedure InitServerData; override;
    function Get_SearchFibuKonto(const __MIDL_0023: WideString): IRwFibuKonto;
    function Get_GetFirst: IRwFibuKonto;
    function Get_GetNext: IRwFibuKonto;
    function Get_GetPrev: IRwFibuKonto;
    function Get_GetLast: IRwFibuKonto;
    function Get_ExistsFibuKonto(const __MIDL_0024: WideString): Integer;
    function Get_CreateKontoNummer(const nr: WideString; const Name: WideString): WideString;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IRwDebitorkonten);
    procedure Disconnect; override;
    property DefaultInterface: IRwDebitorkonten read GetDefaultInterface;
    property SearchFibuKonto[const __MIDL_0023: WideString]: IRwFibuKonto read Get_SearchFibuKonto;
    property GetFirst: IRwFibuKonto read Get_GetFirst;
    property GetNext: IRwFibuKonto read Get_GetNext;
    property GetPrev: IRwFibuKonto read Get_GetPrev;
    property GetLast: IRwFibuKonto read Get_GetLast;
    property ExistsFibuKonto[const __MIDL_0024: WideString]: Integer read Get_ExistsFibuKonto;
    property CreateKontoNummer[const nr: WideString; const Name: WideString]: WideString read Get_CreateKontoNummer;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TRwDebitorkontenProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TRwDebitorkonten
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TRwDebitorkontenProperties = class(TPersistent)
  private
    FServer:    TRwDebitorkonten;
    function    GetDefaultInterface: IRwDebitorkonten;
    constructor Create(AServer: TRwDebitorkonten);
  protected
    function Get_SearchFibuKonto(const __MIDL_0023: WideString): IRwFibuKonto;
    function Get_GetFirst: IRwFibuKonto;
    function Get_GetNext: IRwFibuKonto;
    function Get_GetPrev: IRwFibuKonto;
    function Get_GetLast: IRwFibuKonto;
    function Get_ExistsFibuKonto(const __MIDL_0024: WideString): Integer;
    function Get_CreateKontoNummer(const nr: WideString; const Name: WideString): WideString;
  public
    property DefaultInterface: IRwDebitorkonten read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoRwKreditorkonten provides a Create and CreateRemote method to          
// create instances of the default interface IRwKreditorkonten exposed by              
// the CoClass RwKreditorkonten. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRwKreditorkonten = class
    class function Create: IRwKreditorkonten;
    class function CreateRemote(const MachineName: string): IRwKreditorkonten;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TRwKreditorkonten
// Help String      : RwKreditorkonten Class
// Default Interface: IRwKreditorkonten
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TRwKreditorkontenProperties= class;
{$ENDIF}
  TRwKreditorkonten = class(TOleServer)
  private
    FIntf: IRwKreditorkonten;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TRwKreditorkontenProperties;
    function GetServerProperties: TRwKreditorkontenProperties;
{$ENDIF}
    function GetDefaultInterface: IRwKreditorkonten;
  protected
    procedure InitServerData; override;
    function Get_SearchFibuKonto(const __MIDL_0026: WideString): IRwFibuKonto;
    function Get_GetFirst: IRwFibuKonto;
    function Get_GetNext: IRwFibuKonto;
    function Get_GetPrev: IRwFibuKonto;
    function Get_GetLast: IRwFibuKonto;
    function Get_CreateKontoNummer(const nr: WideString; const Name: WideString): WideString;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IRwKreditorkonten);
    procedure Disconnect; override;
    property DefaultInterface: IRwKreditorkonten read GetDefaultInterface;
    property SearchFibuKonto[const __MIDL_0026: WideString]: IRwFibuKonto read Get_SearchFibuKonto;
    property GetFirst: IRwFibuKonto read Get_GetFirst;
    property GetNext: IRwFibuKonto read Get_GetNext;
    property GetPrev: IRwFibuKonto read Get_GetPrev;
    property GetLast: IRwFibuKonto read Get_GetLast;
    property CreateKontoNummer[const nr: WideString; const Name: WideString]: WideString read Get_CreateKontoNummer;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TRwKreditorkontenProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TRwKreditorkonten
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TRwKreditorkontenProperties = class(TPersistent)
  private
    FServer:    TRwKreditorkonten;
    function    GetDefaultInterface: IRwKreditorkonten;
    constructor Create(AServer: TRwKreditorkonten);
  protected
    function Get_SearchFibuKonto(const __MIDL_0026: WideString): IRwFibuKonto;
    function Get_GetFirst: IRwFibuKonto;
    function Get_GetNext: IRwFibuKonto;
    function Get_GetPrev: IRwFibuKonto;
    function Get_GetLast: IRwFibuKonto;
    function Get_CreateKontoNummer(const nr: WideString; const Name: WideString): WideString;
  public
    property DefaultInterface: IRwKreditorkonten read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoRwBuchungsstapel provides a Create and CreateRemote method to          
// create instances of the default interface IRwBuchungsstapel exposed by              
// the CoClass RwBuchungsstapel. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRwBuchungsstapel = class
    class function Create: IRwBuchungsstapel;
    class function CreateRemote(const MachineName: string): IRwBuchungsstapel;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TRwBuchungsstapel
// Help String      : RwBuchungsstapel Class
// Default Interface: IRwBuchungsstapel
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TRwBuchungsstapelProperties= class;
{$ENDIF}
  TRwBuchungsstapel = class(TOleServer)
  private
    FIntf: IRwBuchungsstapel;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TRwBuchungsstapelProperties;
    function GetServerProperties: TRwBuchungsstapelProperties;
{$ENDIF}
    function GetDefaultInterface: IRwBuchungsstapel;
  protected
    procedure InitServerData; override;
    function Get_m_Name: WideString;
    function Get_m_BuchungsDatum: TDateTime;
    function Get_GetBuchung(pos: Integer): IRwBuchung;
    function Get_IsInPeriode(monat: SYSINT; jahr: SYSINT): Integer;
    function Get_m_Erstellungsdatum: TDateTime;
    function Get_m_ObjectID: Integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IRwBuchungsstapel);
    procedure Disconnect; override;
    procedure Refresh;
    property DefaultInterface: IRwBuchungsstapel read GetDefaultInterface;
    property m_Name: WideString read Get_m_Name;
    property m_BuchungsDatum: TDateTime read Get_m_BuchungsDatum;
    property GetBuchung[pos: Integer]: IRwBuchung read Get_GetBuchung;
    property IsInPeriode[monat: SYSINT; jahr: SYSINT]: Integer read Get_IsInPeriode;
    property m_Erstellungsdatum: TDateTime read Get_m_Erstellungsdatum;
    property m_ObjectID: Integer read Get_m_ObjectID;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TRwBuchungsstapelProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TRwBuchungsstapel
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TRwBuchungsstapelProperties = class(TPersistent)
  private
    FServer:    TRwBuchungsstapel;
    function    GetDefaultInterface: IRwBuchungsstapel;
    constructor Create(AServer: TRwBuchungsstapel);
  protected
    function Get_m_Name: WideString;
    function Get_m_BuchungsDatum: TDateTime;
    function Get_GetBuchung(pos: Integer): IRwBuchung;
    function Get_IsInPeriode(monat: SYSINT; jahr: SYSINT): Integer;
    function Get_m_Erstellungsdatum: TDateTime;
    function Get_m_ObjectID: Integer;
  public
    property DefaultInterface: IRwBuchungsstapel read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoRwBuchungsstapelWJ provides a Create and CreateRemote method to          
// create instances of the default interface IRwBuchungsstapelWJ exposed by              
// the CoClass RwBuchungsstapelWJ. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRwBuchungsstapelWJ = class
    class function Create: IRwBuchungsstapelWJ;
    class function CreateRemote(const MachineName: string): IRwBuchungsstapelWJ;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TRwBuchungsstapelWJ
// Help String      : RwBuchungsstapelWJ Class
// Default Interface: IRwBuchungsstapelWJ
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TRwBuchungsstapelWJProperties= class;
{$ENDIF}
  TRwBuchungsstapelWJ = class(TOleServer)
  private
    FIntf: IRwBuchungsstapelWJ;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TRwBuchungsstapelWJProperties;
    function GetServerProperties: TRwBuchungsstapelWJProperties;
{$ENDIF}
    function GetDefaultInterface: IRwBuchungsstapelWJ;
  protected
    procedure InitServerData; override;
    function Get_Get(pos: Integer): IRwBuchungsstapel;
    function Get_m_Journalisiert: Integer;
    procedure Set_m_Journalisiert(pVal: Integer);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IRwBuchungsstapelWJ);
    procedure Disconnect; override;
    procedure AddBuchungsstapel(buchungsdatum: TDateTime; const stapelname: WideString);
    property DefaultInterface: IRwBuchungsstapelWJ read GetDefaultInterface;
    property Get[pos: Integer]: IRwBuchungsstapel read Get_Get;
    property m_Journalisiert: Integer read Get_m_Journalisiert write Set_m_Journalisiert;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TRwBuchungsstapelWJProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TRwBuchungsstapelWJ
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TRwBuchungsstapelWJProperties = class(TPersistent)
  private
    FServer:    TRwBuchungsstapelWJ;
    function    GetDefaultInterface: IRwBuchungsstapelWJ;
    constructor Create(AServer: TRwBuchungsstapelWJ);
  protected
    function Get_Get(pos: Integer): IRwBuchungsstapel;
    function Get_m_Journalisiert: Integer;
    procedure Set_m_Journalisiert(pVal: Integer);
  public
    property DefaultInterface: IRwBuchungsstapelWJ read GetDefaultInterface;
  published
    property m_Journalisiert: Integer read Get_m_Journalisiert write Set_m_Journalisiert;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoRwFibuKonto provides a Create and CreateRemote method to          
// create instances of the default interface IRwFibuKonto exposed by              
// the CoClass RwFibuKonto. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRwFibuKonto = class
    class function Create: IRwFibuKonto;
    class function CreateRemote(const MachineName: string): IRwFibuKonto;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TRwFibuKonto
// Help String      : RwFibuKonto Class
// Default Interface: IRwFibuKonto
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TRwFibuKontoProperties= class;
{$ENDIF}
  TRwFibuKonto = class(TOleServer)
  private
    FIntf: IRwFibuKonto;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TRwFibuKontoProperties;
    function GetServerProperties: TRwFibuKontoProperties;
{$ENDIF}
    function GetDefaultInterface: IRwFibuKonto;
  protected
    procedure InitServerData; override;
    function Get_m_KontoNr: WideString;
    function Get_m_Name: WideString;
    function Get_IsSachkonto: Integer;
    function Get_IsDebitor: Integer;
    function Get_IsKreditor: Integer;
    function Get_GetGP: IAddGeschaeftspartner;
    function Get_m_Kreditlimit: Currency;
    procedure Set_m_Kreditlimit(pVal: Currency);
    function Get_m_Saldo(periodeBis: Integer): Currency;
    function Get_m_AB(periodeBis: Integer): Currency;
    function Get_m_SaldoSoll(periodeBis: Integer): Currency;
    function Get_m_SaldoHaben(periodeBis: Integer): Currency;
    function Get_m_KreditlimitVersichert: Currency;
    function Get_HasOPVerwaltung: Integer;
    function Get_IsCPDKonto: Integer;
    function Get_m_FreiesFeld(idx: SYSINT): WideString;
    function Get_m_NameVersicherer: WideString;
    function Get_m_VersicherungsNr: WideString;
    function Get_m_WarenUmsatz(periodeBis: Integer): Currency;
    function Get_m_VerbandsNr: WideString;
    function Get_m_Verband: WideString;
    function Get_m_MitgliedsNr: WideString;
    function Get_m_AZVDaten(const data: WideString): WideString;
    function Get_m_ExternZV: Integer;
    function Get_m_pPersonenKontoData: IRwPersKontoData;
    function Get_m_Gesperrt: Byte;
    function Get_m_Kontenart: WideString;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IRwFibuKonto);
    procedure Disconnect; override;
    procedure Refresh;
    procedure SetBuchungskreisSaldoAbfrage(buchungskreise: LongWord);
    procedure SetBuchungskreis(const bukreis: IRwBuchungskreisTool);
    property DefaultInterface: IRwFibuKonto read GetDefaultInterface;
    property m_KontoNr: WideString read Get_m_KontoNr;
    property m_Name: WideString read Get_m_Name;
    property IsSachkonto: Integer read Get_IsSachkonto;
    property IsDebitor: Integer read Get_IsDebitor;
    property IsKreditor: Integer read Get_IsKreditor;
    property GetGP: IAddGeschaeftspartner read Get_GetGP;
    property m_Saldo[periodeBis: Integer]: Currency read Get_m_Saldo;
    property m_AB[periodeBis: Integer]: Currency read Get_m_AB;
    property m_SaldoSoll[periodeBis: Integer]: Currency read Get_m_SaldoSoll;
    property m_SaldoHaben[periodeBis: Integer]: Currency read Get_m_SaldoHaben;
    property m_KreditlimitVersichert: Currency read Get_m_KreditlimitVersichert;
    property HasOPVerwaltung: Integer read Get_HasOPVerwaltung;
    property IsCPDKonto: Integer read Get_IsCPDKonto;
    property m_FreiesFeld[idx: SYSINT]: WideString read Get_m_FreiesFeld;
    property m_NameVersicherer: WideString read Get_m_NameVersicherer;
    property m_VersicherungsNr: WideString read Get_m_VersicherungsNr;
    property m_WarenUmsatz[periodeBis: Integer]: Currency read Get_m_WarenUmsatz;
    property m_VerbandsNr: WideString read Get_m_VerbandsNr;
    property m_Verband: WideString read Get_m_Verband;
    property m_MitgliedsNr: WideString read Get_m_MitgliedsNr;
    property m_AZVDaten[const data: WideString]: WideString read Get_m_AZVDaten;
    property m_ExternZV: Integer read Get_m_ExternZV;
    property m_pPersonenKontoData: IRwPersKontoData read Get_m_pPersonenKontoData;
    property m_Gesperrt: Byte read Get_m_Gesperrt;
    property m_Kontenart: WideString read Get_m_Kontenart;
    property m_Kreditlimit: Currency read Get_m_Kreditlimit write Set_m_Kreditlimit;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TRwFibuKontoProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TRwFibuKonto
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TRwFibuKontoProperties = class(TPersistent)
  private
    FServer:    TRwFibuKonto;
    function    GetDefaultInterface: IRwFibuKonto;
    constructor Create(AServer: TRwFibuKonto);
  protected
    function Get_m_KontoNr: WideString;
    function Get_m_Name: WideString;
    function Get_IsSachkonto: Integer;
    function Get_IsDebitor: Integer;
    function Get_IsKreditor: Integer;
    function Get_GetGP: IAddGeschaeftspartner;
    function Get_m_Kreditlimit: Currency;
    procedure Set_m_Kreditlimit(pVal: Currency);
    function Get_m_Saldo(periodeBis: Integer): Currency;
    function Get_m_AB(periodeBis: Integer): Currency;
    function Get_m_SaldoSoll(periodeBis: Integer): Currency;
    function Get_m_SaldoHaben(periodeBis: Integer): Currency;
    function Get_m_KreditlimitVersichert: Currency;
    function Get_HasOPVerwaltung: Integer;
    function Get_IsCPDKonto: Integer;
    function Get_m_FreiesFeld(idx: SYSINT): WideString;
    function Get_m_NameVersicherer: WideString;
    function Get_m_VersicherungsNr: WideString;
    function Get_m_WarenUmsatz(periodeBis: Integer): Currency;
    function Get_m_VerbandsNr: WideString;
    function Get_m_Verband: WideString;
    function Get_m_MitgliedsNr: WideString;
    function Get_m_AZVDaten(const data: WideString): WideString;
    function Get_m_ExternZV: Integer;
    function Get_m_pPersonenKontoData: IRwPersKontoData;
    function Get_m_Gesperrt: Byte;
    function Get_m_Kontenart: WideString;
  public
    property DefaultInterface: IRwFibuKonto read GetDefaultInterface;
  published
    property m_Kreditlimit: Currency read Get_m_Kreditlimit write Set_m_Kreditlimit;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoRwOPSuche provides a Create and CreateRemote method to          
// create instances of the default interface IRwOPSuche exposed by              
// the CoClass RwOPSuche. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRwOPSuche = class
    class function Create: IRwOPSuche;
    class function CreateRemote(const MachineName: string): IRwOPSuche;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TRwOPSuche
// Help String      : RwOPSuche Class
// Default Interface: IRwOPSuche
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TRwOPSucheProperties= class;
{$ENDIF}
  TRwOPSuche = class(TOleServer)
  private
    FIntf: IRwOPSuche;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TRwOPSucheProperties;
    function GetServerProperties: TRwOPSucheProperties;
{$ENDIF}
    function GetDefaultInterface: IRwOPSuche;
  protected
    procedure InitServerData; override;
    function Get_Count: Smallint;
    function Get_Item(lIndex: Integer): OleVariant;
    function Get_GetAt(pos: Integer): IRwOP;
    function Get_m_AusgezifferterBereich: Integer;
    procedure Set_m_AusgezifferterBereich(pVal: Integer);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IRwOPSuche);
    procedure Disconnect; override;
    procedure Refresh;
    procedure SearchBelegNr(const kontonummer: WideString; const bnr: WideString);
    procedure SearchBetrag(betrag: Currency);
    procedure SearchBelegNrAndDatum(const kontonummer: WideString; const bnr: WideString; 
                                    ausziffDatumVon: TDateTime; ausziffDatumBis: TDateTime);
    procedure SearchBelegNr2(const kontonummer: WideString; const belegnr: WideString);
    property DefaultInterface: IRwOPSuche read GetDefaultInterface;
    property Count: Smallint read Get_Count;
    property Item[lIndex: Integer]: OleVariant read Get_Item; default;
    property GetAt[pos: Integer]: IRwOP read Get_GetAt;
    property m_AusgezifferterBereich: Integer read Get_m_AusgezifferterBereich write Set_m_AusgezifferterBereich;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TRwOPSucheProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TRwOPSuche
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TRwOPSucheProperties = class(TPersistent)
  private
    FServer:    TRwOPSuche;
    function    GetDefaultInterface: IRwOPSuche;
    constructor Create(AServer: TRwOPSuche);
  protected
    function Get_Count: Smallint;
    function Get_Item(lIndex: Integer): OleVariant;
    function Get_GetAt(pos: Integer): IRwOP;
    function Get_m_AusgezifferterBereich: Integer;
    procedure Set_m_AusgezifferterBereich(pVal: Integer);
  public
    property DefaultInterface: IRwOPSuche read GetDefaultInterface;
  published
    property m_AusgezifferterBereich: Integer read Get_m_AusgezifferterBereich write Set_m_AusgezifferterBereich;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoRwOP provides a Create and CreateRemote method to          
// create instances of the default interface IRwOP exposed by              
// the CoClass RwOP. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRwOP = class
    class function Create: IRwOP;
    class function CreateRemote(const MachineName: string): IRwOP;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TRwOP
// Help String      : RwOP Class
// Default Interface: IRwOP
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TRwOPProperties= class;
{$ENDIF}
  TRwOP = class(TOleServer)
  private
    FIntf: IRwOP;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TRwOPProperties;
    function GetServerProperties: TRwOPProperties;
{$ENDIF}
    function GetDefaultInterface: IRwOP;
  protected
    procedure InitServerData; override;
    function Get_m_BelegNr: WideString;
    function Get_m_BelegDatum: TDateTime;
    function Get_m_BelegNr2: WideString;
    function Get_m_Betrag: Currency;
    function Get_m_NettoFaelligkeit: TDateTime;
    function Get_m_NettoFaelligkeitEingabe: TDateTime;
    function Get_m_WaehrungsID: Smallint;
    function Get_m_TransaktionsBetrag: Currency;
    function Get_m_SkontoFaelligkeitStufe(stufe: Integer): TDateTime;
    function Get_m_SkontoProzentSatzStufe(__MIDL_0019: Integer): Currency;
    function Get_m_BuchungsDatum: TDateTime;
    function Get_m_Buchungstext: WideString;
    function Get_m_IsAbgestimmt: Integer;
    function Get_m_Konto: WideString;
    function Get_m_Gegenkonto: WideString;
    function Get_m_WaehrungsKurs: Currency;
    function Get_m_AbwSortierschluessel: Integer;
    function Get_m_ZusatzAdresse: WideString;
    function Get_m_Mahnstufe: Integer;
    function Get_m_Auszifferungsdatum: TDateTime;
    function Get_m_MahnStatus: WideString;
    function Get_m_TageUeberfaellig(vglDatum: TDateTime): Integer;
    function Get_m_Kost1: WideString;
    function Get_m_Kost2: WideString;
    function Get_m_MahnStufeDatumPos(pos: Integer): TDateTime;
    function Get_m_MahnStufePos(pos: Integer): Integer;
    function Get_m_HighestBelegdatumAuszifferung: TDateTime;
    function Get_m_IsMahnungGesperrt: Integer;
    function Get_m_BezahltKennzeichen: Smallint;
    procedure Set_m_BezahltKennzeichen(pVal: Smallint);
    function Get_m_IsZahlung: Integer;
    function Get_m_SkontoBetrag: Currency;
    function Get_m_VerarbeitungsHinweis: WideString;
    procedure Set_m_VerarbeitungsHinweis(const pVal: WideString);
    function Get_m_ValutaDatum: TDateTime;
    procedure Set_m_ValutaDatum(pVal: TDateTime);
    function Get_m_FixeNettoFaelligkeit: TDateTime;
    procedure Set_m_FixeNettoFaelligkeit(pVal: TDateTime);
    function Get_m_BelegLink: WideString;
    procedure Set_m_BelegLink(const pVal: WideString);
    function Get_m_NettoTage: Integer;
    function Get_m_SkontoTage(stufe: Integer): Integer;
    function Get_m_SteuerProzentsatz: Double;
    function Get_m_Steuerart: WideString;
    function Get_GetBuchung: IRwBuchung;
    function Get_m_ObjectID: WideString;
    function Get_GetZahldauer(out pVal2: TDateTime): Integer;
    function Get_m_FreigabeMahnung: Integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IRwOP);
    procedure Disconnect; override;
    procedure SetCPDDaten(const Name: WideString; const branche: WideString; 
                          const strasse: WideString; const land: WideString; const plz: WideString; 
                          const ort: WideString; const blz: WideString; const konto: WideString);
    property DefaultInterface: IRwOP read GetDefaultInterface;
    property m_BelegNr: WideString read Get_m_BelegNr;
    property m_BelegDatum: TDateTime read Get_m_BelegDatum;
    property m_BelegNr2: WideString read Get_m_BelegNr2;
    property m_Betrag: Currency read Get_m_Betrag;
    property m_NettoFaelligkeit: TDateTime read Get_m_NettoFaelligkeit;
    property m_NettoFaelligkeitEingabe: TDateTime read Get_m_NettoFaelligkeitEingabe;
    property m_WaehrungsID: Smallint read Get_m_WaehrungsID;
    property m_TransaktionsBetrag: Currency read Get_m_TransaktionsBetrag;
    property m_SkontoFaelligkeitStufe[stufe: Integer]: TDateTime read Get_m_SkontoFaelligkeitStufe;
    property m_SkontoProzentSatzStufe[__MIDL_0019: Integer]: Currency read Get_m_SkontoProzentSatzStufe;
    property m_BuchungsDatum: TDateTime read Get_m_BuchungsDatum;
    property m_Buchungstext: WideString read Get_m_Buchungstext;
    property m_IsAbgestimmt: Integer read Get_m_IsAbgestimmt;
    property m_Konto: WideString read Get_m_Konto;
    property m_Gegenkonto: WideString read Get_m_Gegenkonto;
    property m_WaehrungsKurs: Currency read Get_m_WaehrungsKurs;
    property m_AbwSortierschluessel: Integer read Get_m_AbwSortierschluessel;
    property m_ZusatzAdresse: WideString read Get_m_ZusatzAdresse;
    property m_Mahnstufe: Integer read Get_m_Mahnstufe;
    property m_Auszifferungsdatum: TDateTime read Get_m_Auszifferungsdatum;
    property m_MahnStatus: WideString read Get_m_MahnStatus;
    property m_TageUeberfaellig[vglDatum: TDateTime]: Integer read Get_m_TageUeberfaellig;
    property m_Kost1: WideString read Get_m_Kost1;
    property m_Kost2: WideString read Get_m_Kost2;
    property m_MahnStufeDatumPos[pos: Integer]: TDateTime read Get_m_MahnStufeDatumPos;
    property m_MahnStufePos[pos: Integer]: Integer read Get_m_MahnStufePos;
    property m_HighestBelegdatumAuszifferung: TDateTime read Get_m_HighestBelegdatumAuszifferung;
    property m_IsMahnungGesperrt: Integer read Get_m_IsMahnungGesperrt;
    property m_IsZahlung: Integer read Get_m_IsZahlung;
    property m_SkontoBetrag: Currency read Get_m_SkontoBetrag;
    property m_NettoTage: Integer read Get_m_NettoTage;
    property m_SkontoTage[stufe: Integer]: Integer read Get_m_SkontoTage;
    property m_SteuerProzentsatz: Double read Get_m_SteuerProzentsatz;
    property m_Steuerart: WideString read Get_m_Steuerart;
    property GetBuchung: IRwBuchung read Get_GetBuchung;
    property m_ObjectID: WideString read Get_m_ObjectID;
    property GetZahldauer[out pVal2: TDateTime]: Integer read Get_GetZahldauer;
    property m_FreigabeMahnung: Integer read Get_m_FreigabeMahnung;
    property m_BezahltKennzeichen: Smallint read Get_m_BezahltKennzeichen write Set_m_BezahltKennzeichen;
    property m_VerarbeitungsHinweis: WideString read Get_m_VerarbeitungsHinweis write Set_m_VerarbeitungsHinweis;
    property m_ValutaDatum: TDateTime read Get_m_ValutaDatum write Set_m_ValutaDatum;
    property m_FixeNettoFaelligkeit: TDateTime read Get_m_FixeNettoFaelligkeit write Set_m_FixeNettoFaelligkeit;
    property m_BelegLink: WideString read Get_m_BelegLink write Set_m_BelegLink;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TRwOPProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TRwOP
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TRwOPProperties = class(TPersistent)
  private
    FServer:    TRwOP;
    function    GetDefaultInterface: IRwOP;
    constructor Create(AServer: TRwOP);
  protected
    function Get_m_BelegNr: WideString;
    function Get_m_BelegDatum: TDateTime;
    function Get_m_BelegNr2: WideString;
    function Get_m_Betrag: Currency;
    function Get_m_NettoFaelligkeit: TDateTime;
    function Get_m_NettoFaelligkeitEingabe: TDateTime;
    function Get_m_WaehrungsID: Smallint;
    function Get_m_TransaktionsBetrag: Currency;
    function Get_m_SkontoFaelligkeitStufe(stufe: Integer): TDateTime;
    function Get_m_SkontoProzentSatzStufe(__MIDL_0019: Integer): Currency;
    function Get_m_BuchungsDatum: TDateTime;
    function Get_m_Buchungstext: WideString;
    function Get_m_IsAbgestimmt: Integer;
    function Get_m_Konto: WideString;
    function Get_m_Gegenkonto: WideString;
    function Get_m_WaehrungsKurs: Currency;
    function Get_m_AbwSortierschluessel: Integer;
    function Get_m_ZusatzAdresse: WideString;
    function Get_m_Mahnstufe: Integer;
    function Get_m_Auszifferungsdatum: TDateTime;
    function Get_m_MahnStatus: WideString;
    function Get_m_TageUeberfaellig(vglDatum: TDateTime): Integer;
    function Get_m_Kost1: WideString;
    function Get_m_Kost2: WideString;
    function Get_m_MahnStufeDatumPos(pos: Integer): TDateTime;
    function Get_m_MahnStufePos(pos: Integer): Integer;
    function Get_m_HighestBelegdatumAuszifferung: TDateTime;
    function Get_m_IsMahnungGesperrt: Integer;
    function Get_m_BezahltKennzeichen: Smallint;
    procedure Set_m_BezahltKennzeichen(pVal: Smallint);
    function Get_m_IsZahlung: Integer;
    function Get_m_SkontoBetrag: Currency;
    function Get_m_VerarbeitungsHinweis: WideString;
    procedure Set_m_VerarbeitungsHinweis(const pVal: WideString);
    function Get_m_ValutaDatum: TDateTime;
    procedure Set_m_ValutaDatum(pVal: TDateTime);
    function Get_m_FixeNettoFaelligkeit: TDateTime;
    procedure Set_m_FixeNettoFaelligkeit(pVal: TDateTime);
    function Get_m_BelegLink: WideString;
    procedure Set_m_BelegLink(const pVal: WideString);
    function Get_m_NettoTage: Integer;
    function Get_m_SkontoTage(stufe: Integer): Integer;
    function Get_m_SteuerProzentsatz: Double;
    function Get_m_Steuerart: WideString;
    function Get_GetBuchung: IRwBuchung;
    function Get_m_ObjectID: WideString;
    function Get_GetZahldauer(out pVal2: TDateTime): Integer;
    function Get_m_FreigabeMahnung: Integer;
  public
    property DefaultInterface: IRwOP read GetDefaultInterface;
  published
    property m_BezahltKennzeichen: Smallint read Get_m_BezahltKennzeichen write Set_m_BezahltKennzeichen;
    property m_VerarbeitungsHinweis: WideString read Get_m_VerarbeitungsHinweis write Set_m_VerarbeitungsHinweis;
    property m_ValutaDatum: TDateTime read Get_m_ValutaDatum write Set_m_ValutaDatum;
    property m_FixeNettoFaelligkeit: TDateTime read Get_m_FixeNettoFaelligkeit write Set_m_FixeNettoFaelligkeit;
    property m_BelegLink: WideString read Get_m_BelegLink write Set_m_BelegLink;
  end;
{$ENDIF}



// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TRwBuchungsImport
// Help String      : RwBuchungsImport Class
// Default Interface: IRwBuchungsImport
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TRwBuchungsImport = class(TOleControl)
  private
    FIntf: IRwBuchungsImport;
    function  GetControlInterface: IRwBuchungsImport;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_StartImport(MandantNr: Integer; const strDateiname: WideString): Integer;
    function Get_FirstErrorDescription(out str_Format: WideString; out l_SG: Integer): WideString;
    function Get_NextErrorDescription(out str_Format: WideString; out l_SG: Integer): WideString;
  public
    property  ControlInterface: IRwBuchungsImport read GetControlInterface;
    property  DefaultInterface: IRwBuchungsImport read GetControlInterface;
    property StartImport[MandantNr: Integer; const strDateiname: WideString]: Integer read Get_StartImport;
    property FirstErrorDescription[out str_Format: WideString; out l_SG: Integer]: WideString read Get_FirstErrorDescription;
    property NextErrorDescription[out str_Format: WideString; out l_SG: Integer]: WideString read Get_NextErrorDescription;
    property m_Abbruchposition: Integer index 13 read GetIntegerProp;
  published
    property Anchors;
    property strImportDatei: WideString index 4 read GetWideStringProp write SetWideStringProp stored False;
    property b_DosFormat: Integer index 5 read GetIntegerProp write SetIntegerProp stored False;
    property b_KontenModus: Integer index 6 read GetIntegerProp write SetIntegerProp stored False;
    property str_ImportVariante: WideString index 7 read GetWideStringProp write SetWideStringProp stored False;
    property str_BuchungsText: WideString index 8 read GetWideStringProp write SetWideStringProp stored False;
    property b_AktSumme: Integer index 9 read GetIntegerProp write SetIntegerProp stored False;
    property b_SperrGrund: Integer index 10 read GetIntegerProp write SetIntegerProp stored False;
    property str_ConfigDatei: WideString index 11 read GetWideStringProp write SetWideStringProp stored False;
    property strTreiberName: WideString index 12 read GetWideStringProp write SetWideStringProp stored False;
  end;

// *********************************************************************//
// The Class CoRwKontenblatt provides a Create and CreateRemote method to          
// create instances of the default interface IRwKontenblatt exposed by              
// the CoClass RwKontenblatt. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRwKontenblatt = class
    class function Create: IRwKontenblatt;
    class function CreateRemote(const MachineName: string): IRwKontenblatt;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TRwKontenblatt
// Help String      : RwKontenblatt Class
// Default Interface: IRwKontenblatt
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TRwKontenblattProperties= class;
{$ENDIF}
  TRwKontenblatt = class(TOleServer)
  private
    FIntf: IRwKontenblatt;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TRwKontenblattProperties;
    function GetServerProperties: TRwKontenblattProperties;
{$ENDIF}
    function GetDefaultInterface: IRwKontenblatt;
  protected
    procedure InitServerData; override;
    function Get_Seek(pos: Integer): Integer;
    function Get_IsCPD: Integer;
    function Get_m_CPDName: WideString;
    function Get_m_CPDBranche: WideString;
    function Get_m_CPDStrasse: WideString;
    function Get_m_CPDPLZ: WideString;
    function Get_m_CPDOrt: WideString;
    function Get_m_CPDLand: WideString;
    function Get_m_CPDKonto: WideString;
    function Get_m_CPDBLZ: WideString;
    function Get_m_BankName: WideString;
    function Get_m_BuchungsSchluessel: WideString;
    function Get_m_BuchungsDatum: TDateTime;
    function Get_m_BelegDatum: TDateTime;
    function Get_m_BelegNr: WideString;
    function Get_m_BelegNr2: WideString;
    function Get_m_Konto: WideString;
    function Get_m_Gegenkonto: WideString;
    function Get_m_Betrag: Currency;
    function Get_m_TransaktionsBetrag: Currency;
    function Get_m_Kurs: Double;
    function Get_WaehrungISO: WideString;
    function Get_m_WaehrungKuerzel: WideString;
    function Get_m_WaehrungID: WideString;
    function Get_m_AbwSortierschluessel: WideString;
    function Get_m_FilialNr: WideString;
    function Get_m_Steuerschluessel: WideString;
    function Get_m_Buchungstext: WideString;
    function Get_m_Kost1: WideString;
    function Get_m_Kost2: WideString;
    function Get_m_Menge: Currency;
    function Get_m_Zahlungskondition: WideString;
    function Get_m_Zahlungsart: WideString;
    function Get_m_IsJournalisiert: Integer;
    function Get_m_JournalSeite: Integer;
    function Get_m_IsVerdichtet: Integer;
    function Get_m_IsAbgestimmt: Integer;
    procedure Set_m_IsAbgestimmt(pVal: Integer);
    function Get_m_IsABBuchung: Integer;
    function Get_IsStornoBuchung: Integer;
    function Get_m_KontierzeileBelegNr2: WideString;
    function Get_ExpandVerdichtung: Integer;
    procedure Set_ExpandVerdichtung(pVal: Integer);
    function Get_GetBuchung: IRwBuchung;
    function Get_m_Buchungsmonat: Smallint;
    function Get_m_Buchungsjahr: Smallint;
    function Get_KontierzInfo(const sKey: WideString): WideString;
    function Get_m_Buchungskreis: Integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IRwKontenblatt);
    procedure Disconnect; override;
    procedure LoadBuchungen(mandant: Integer; const konto: WideString; wj: TDateTime; 
                            periodevon: SYSINT; periodeBis: SYSINT);
    procedure Setm_KontierzeileBelegNr2(const bnr: WideString);
    procedure SetBuchungskreis(buchungskreis: LongWord);
    procedure SetBuchungskreisTool(const bukreis: IRwBuchungskreisTool);
    property DefaultInterface: IRwKontenblatt read GetDefaultInterface;
    property Seek[pos: Integer]: Integer read Get_Seek;
    property IsCPD: Integer read Get_IsCPD;
    property m_CPDName: WideString read Get_m_CPDName;
    property m_CPDBranche: WideString read Get_m_CPDBranche;
    property m_CPDStrasse: WideString read Get_m_CPDStrasse;
    property m_CPDPLZ: WideString read Get_m_CPDPLZ;
    property m_CPDOrt: WideString read Get_m_CPDOrt;
    property m_CPDLand: WideString read Get_m_CPDLand;
    property m_CPDKonto: WideString read Get_m_CPDKonto;
    property m_CPDBLZ: WideString read Get_m_CPDBLZ;
    property m_BankName: WideString read Get_m_BankName;
    property m_BuchungsSchluessel: WideString read Get_m_BuchungsSchluessel;
    property m_BuchungsDatum: TDateTime read Get_m_BuchungsDatum;
    property m_BelegDatum: TDateTime read Get_m_BelegDatum;
    property m_BelegNr: WideString read Get_m_BelegNr;
    property m_BelegNr2: WideString read Get_m_BelegNr2;
    property m_Konto: WideString read Get_m_Konto;
    property m_Gegenkonto: WideString read Get_m_Gegenkonto;
    property m_Betrag: Currency read Get_m_Betrag;
    property m_TransaktionsBetrag: Currency read Get_m_TransaktionsBetrag;
    property m_Kurs: Double read Get_m_Kurs;
    property WaehrungISO: WideString read Get_WaehrungISO;
    property m_WaehrungKuerzel: WideString read Get_m_WaehrungKuerzel;
    property m_WaehrungID: WideString read Get_m_WaehrungID;
    property m_AbwSortierschluessel: WideString read Get_m_AbwSortierschluessel;
    property m_FilialNr: WideString read Get_m_FilialNr;
    property m_Steuerschluessel: WideString read Get_m_Steuerschluessel;
    property m_Buchungstext: WideString read Get_m_Buchungstext;
    property m_Kost1: WideString read Get_m_Kost1;
    property m_Kost2: WideString read Get_m_Kost2;
    property m_Menge: Currency read Get_m_Menge;
    property m_Zahlungskondition: WideString read Get_m_Zahlungskondition;
    property m_Zahlungsart: WideString read Get_m_Zahlungsart;
    property m_IsJournalisiert: Integer read Get_m_IsJournalisiert;
    property m_JournalSeite: Integer read Get_m_JournalSeite;
    property m_IsVerdichtet: Integer read Get_m_IsVerdichtet;
    property m_IsABBuchung: Integer read Get_m_IsABBuchung;
    property IsStornoBuchung: Integer read Get_IsStornoBuchung;
    property m_KontierzeileBelegNr2: WideString read Get_m_KontierzeileBelegNr2;
    property GetBuchung: IRwBuchung read Get_GetBuchung;
    property m_Buchungsmonat: Smallint read Get_m_Buchungsmonat;
    property m_Buchungsjahr: Smallint read Get_m_Buchungsjahr;
    property KontierzInfo[const sKey: WideString]: WideString read Get_KontierzInfo;
    property m_Buchungskreis: Integer read Get_m_Buchungskreis;
    property m_IsAbgestimmt: Integer read Get_m_IsAbgestimmt write Set_m_IsAbgestimmt;
    property ExpandVerdichtung: Integer read Get_ExpandVerdichtung write Set_ExpandVerdichtung;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TRwKontenblattProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TRwKontenblatt
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TRwKontenblattProperties = class(TPersistent)
  private
    FServer:    TRwKontenblatt;
    function    GetDefaultInterface: IRwKontenblatt;
    constructor Create(AServer: TRwKontenblatt);
  protected
    function Get_Seek(pos: Integer): Integer;
    function Get_IsCPD: Integer;
    function Get_m_CPDName: WideString;
    function Get_m_CPDBranche: WideString;
    function Get_m_CPDStrasse: WideString;
    function Get_m_CPDPLZ: WideString;
    function Get_m_CPDOrt: WideString;
    function Get_m_CPDLand: WideString;
    function Get_m_CPDKonto: WideString;
    function Get_m_CPDBLZ: WideString;
    function Get_m_BankName: WideString;
    function Get_m_BuchungsSchluessel: WideString;
    function Get_m_BuchungsDatum: TDateTime;
    function Get_m_BelegDatum: TDateTime;
    function Get_m_BelegNr: WideString;
    function Get_m_BelegNr2: WideString;
    function Get_m_Konto: WideString;
    function Get_m_Gegenkonto: WideString;
    function Get_m_Betrag: Currency;
    function Get_m_TransaktionsBetrag: Currency;
    function Get_m_Kurs: Double;
    function Get_WaehrungISO: WideString;
    function Get_m_WaehrungKuerzel: WideString;
    function Get_m_WaehrungID: WideString;
    function Get_m_AbwSortierschluessel: WideString;
    function Get_m_FilialNr: WideString;
    function Get_m_Steuerschluessel: WideString;
    function Get_m_Buchungstext: WideString;
    function Get_m_Kost1: WideString;
    function Get_m_Kost2: WideString;
    function Get_m_Menge: Currency;
    function Get_m_Zahlungskondition: WideString;
    function Get_m_Zahlungsart: WideString;
    function Get_m_IsJournalisiert: Integer;
    function Get_m_JournalSeite: Integer;
    function Get_m_IsVerdichtet: Integer;
    function Get_m_IsAbgestimmt: Integer;
    procedure Set_m_IsAbgestimmt(pVal: Integer);
    function Get_m_IsABBuchung: Integer;
    function Get_IsStornoBuchung: Integer;
    function Get_m_KontierzeileBelegNr2: WideString;
    function Get_ExpandVerdichtung: Integer;
    procedure Set_ExpandVerdichtung(pVal: Integer);
    function Get_GetBuchung: IRwBuchung;
    function Get_m_Buchungsmonat: Smallint;
    function Get_m_Buchungsjahr: Smallint;
    function Get_KontierzInfo(const sKey: WideString): WideString;
    function Get_m_Buchungskreis: Integer;
  public
    property DefaultInterface: IRwKontenblatt read GetDefaultInterface;
  published
    property m_IsAbgestimmt: Integer read Get_m_IsAbgestimmt write Set_m_IsAbgestimmt;
    property ExpandVerdichtung: Integer read Get_ExpandVerdichtung write Set_ExpandVerdichtung;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoRwBuchung provides a Create and CreateRemote method to          
// create instances of the default interface IRwBuchung exposed by              
// the CoClass RwBuchung. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRwBuchung = class
    class function Create: IRwBuchung;
    class function CreateRemote(const MachineName: string): IRwBuchung;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TRwBuchung
// Help String      : RwBuchung Class
// Default Interface: IRwBuchung
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TRwBuchungProperties= class;
{$ENDIF}
  TRwBuchung = class(TOleServer)
  private
    FIntf: IRwBuchung;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TRwBuchungProperties;
    function GetServerProperties: TRwBuchungProperties;
{$ENDIF}
    function GetDefaultInterface: IRwBuchung;
  protected
    procedure InitServerData; override;
    function Get_m_isAutomatik: Integer;
    function Get_m_IsEingabe: Integer;
    function Get_m_Konto: WideString;
    function Get_m_Gegenkonto: WideString;
    function Get_m_Betrag: Currency;
    function Get_m_Steuerbetrag: Currency;
    function Get_m_Steuerschluessel: WideString;
    function Get_m_SteuerProzentsatz: Double;
    function Get_m_Buchungstext: WideString;
    function Get_m_Belegnummer1: WideString;
    function Get_m_Belegnummer2: WideString;
    function Get_m_Belegnummer2Eingabe: WideString;
    procedure Set_m_Belegnummer2Eingabe(const pVal: WideString);
    function Get_m_Buchungsnr: Integer;
    function Get_m_Kost1: WideString;
    function Get_m_Kost2: WideString;
    function Get_m_BelegDatum: TDateTime;
    function Get_m_IsValidPos: Integer;
    function Get_IsWaehrung(const waehrungsKuerzel: WideString): Integer;
    function Get_m_Waehrung: WideString;
    function Get_m_TransaktionsBetrag: Currency;
    function Get_m_FreiesFeld(nummer: Integer): WideString;
    function Get_m_Erfassungsdatum: TDateTime;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IRwBuchung);
    procedure Disconnect; override;
    procedure SeekKontierZeile(pos: Integer);
    procedure SplitBetraege(const waehrung: WideString; var bruttobetrag: Double; 
                            var stsl1: WideString; var betrag1: Currency; var stsl2: WideString; 
                            var betrag2: Currency; var stsl3: WideString; var betrag3: Currency);
    procedure Refresh;
    property DefaultInterface: IRwBuchung read GetDefaultInterface;
    property m_isAutomatik: Integer read Get_m_isAutomatik;
    property m_IsEingabe: Integer read Get_m_IsEingabe;
    property m_Konto: WideString read Get_m_Konto;
    property m_Gegenkonto: WideString read Get_m_Gegenkonto;
    property m_Betrag: Currency read Get_m_Betrag;
    property m_Steuerbetrag: Currency read Get_m_Steuerbetrag;
    property m_Steuerschluessel: WideString read Get_m_Steuerschluessel;
    property m_SteuerProzentsatz: Double read Get_m_SteuerProzentsatz;
    property m_Buchungstext: WideString read Get_m_Buchungstext;
    property m_Belegnummer1: WideString read Get_m_Belegnummer1;
    property m_Belegnummer2: WideString read Get_m_Belegnummer2;
    property m_Buchungsnr: Integer read Get_m_Buchungsnr;
    property m_Kost1: WideString read Get_m_Kost1;
    property m_Kost2: WideString read Get_m_Kost2;
    property m_BelegDatum: TDateTime read Get_m_BelegDatum;
    property m_IsValidPos: Integer read Get_m_IsValidPos;
    property IsWaehrung[const waehrungsKuerzel: WideString]: Integer read Get_IsWaehrung;
    property m_Waehrung: WideString read Get_m_Waehrung;
    property m_TransaktionsBetrag: Currency read Get_m_TransaktionsBetrag;
    property m_FreiesFeld[nummer: Integer]: WideString read Get_m_FreiesFeld;
    property m_Erfassungsdatum: TDateTime read Get_m_Erfassungsdatum;
    property m_Belegnummer2Eingabe: WideString read Get_m_Belegnummer2Eingabe write Set_m_Belegnummer2Eingabe;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TRwBuchungProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TRwBuchung
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TRwBuchungProperties = class(TPersistent)
  private
    FServer:    TRwBuchung;
    function    GetDefaultInterface: IRwBuchung;
    constructor Create(AServer: TRwBuchung);
  protected
    function Get_m_isAutomatik: Integer;
    function Get_m_IsEingabe: Integer;
    function Get_m_Konto: WideString;
    function Get_m_Gegenkonto: WideString;
    function Get_m_Betrag: Currency;
    function Get_m_Steuerbetrag: Currency;
    function Get_m_Steuerschluessel: WideString;
    function Get_m_SteuerProzentsatz: Double;
    function Get_m_Buchungstext: WideString;
    function Get_m_Belegnummer1: WideString;
    function Get_m_Belegnummer2: WideString;
    function Get_m_Belegnummer2Eingabe: WideString;
    procedure Set_m_Belegnummer2Eingabe(const pVal: WideString);
    function Get_m_Buchungsnr: Integer;
    function Get_m_Kost1: WideString;
    function Get_m_Kost2: WideString;
    function Get_m_BelegDatum: TDateTime;
    function Get_m_IsValidPos: Integer;
    function Get_IsWaehrung(const waehrungsKuerzel: WideString): Integer;
    function Get_m_Waehrung: WideString;
    function Get_m_TransaktionsBetrag: Currency;
    function Get_m_FreiesFeld(nummer: Integer): WideString;
    function Get_m_Erfassungsdatum: TDateTime;
  public
    property DefaultInterface: IRwBuchung read GetDefaultInterface;
  published
    property m_Belegnummer2Eingabe: WideString read Get_m_Belegnummer2Eingabe write Set_m_Belegnummer2Eingabe;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoRwBuchungsabgleich provides a Create and CreateRemote method to          
// create instances of the default interface IRwBuchungsabgleich exposed by              
// the CoClass RwBuchungsabgleich. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRwBuchungsabgleich = class
    class function Create: IRwBuchungsabgleich;
    class function CreateRemote(const MachineName: string): IRwBuchungsabgleich;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TRwBuchungsabgleich
// Help String      : RwBuchungsabgleich Class
// Default Interface: IRwBuchungsabgleich
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TRwBuchungsabgleichProperties= class;
{$ENDIF}
  TRwBuchungsabgleich = class(TOleServer)
  private
    FIntf: IRwBuchungsabgleich;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TRwBuchungsabgleichProperties;
    function GetServerProperties: TRwBuchungsabgleichProperties;
{$ENDIF}
    function GetDefaultInterface: IRwBuchungsabgleich;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IRwBuchungsabgleich);
    procedure Disconnect; override;
    procedure DoAbgleich(mandnr: Integer; wjDatum: TDateTime; periodeBis: TDateTime; 
                         const fileName: WideString);
    property DefaultInterface: IRwBuchungsabgleich read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TRwBuchungsabgleichProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TRwBuchungsabgleich
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TRwBuchungsabgleichProperties = class(TPersistent)
  private
    FServer:    TRwBuchungsabgleich;
    function    GetDefaultInterface: IRwBuchungsabgleich;
    constructor Create(AServer: TRwBuchungsabgleich);
  protected
  public
    property DefaultInterface: IRwBuchungsabgleich read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoRWKontoAuflistung provides a Create and CreateRemote method to          
// create instances of the default interface IRWKontoAuflistung exposed by              
// the CoClass RWKontoAuflistung. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRWKontoAuflistung = class
    class function Create: IRWKontoAuflistung;
    class function CreateRemote(const MachineName: string): IRWKontoAuflistung;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TRWKontoAuflistung
// Help String      : RWKontoAuflistung Class
// Default Interface: IRWKontoAuflistung
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TRWKontoAuflistungProperties= class;
{$ENDIF}
  TRWKontoAuflistung = class(TOleServer)
  private
    FIntf: IRWKontoAuflistung;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TRWKontoAuflistungProperties;
    function GetServerProperties: TRWKontoAuflistungProperties;
{$ENDIF}
    function GetDefaultInterface: IRWKontoAuflistung;
  protected
    procedure InitServerData; override;
    function Get_m_Position: Integer;
    procedure Set_m_Position(pVal: Integer);
    function Get_m_Konto: WideString;
    function Get_m_Bezeichnung: WideString;
    function Get_m_Saldo(jahr: SYSINT): Currency;
    function Get_m_AB(jahr: SYSINT): Currency;
    function Get_m_Soll(jahr: SYSINT): Currency;
    function Get_m_Haben(jahr: SYSINT): Currency;
    function Get_m_Umbuchung(jahr: SYSINT): Currency;
    function Get_m_Typ: Smallint;
    function Get_GetCount: Integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IRWKontoAuflistung);
    procedure Disconnect; override;
    property DefaultInterface: IRWKontoAuflistung read GetDefaultInterface;
    property m_Konto: WideString read Get_m_Konto;
    property m_Bezeichnung: WideString read Get_m_Bezeichnung;
    property m_Saldo[jahr: SYSINT]: Currency read Get_m_Saldo;
    property m_AB[jahr: SYSINT]: Currency read Get_m_AB;
    property m_Soll[jahr: SYSINT]: Currency read Get_m_Soll;
    property m_Haben[jahr: SYSINT]: Currency read Get_m_Haben;
    property m_Umbuchung[jahr: SYSINT]: Currency read Get_m_Umbuchung;
    property m_Typ: Smallint read Get_m_Typ;
    property GetCount: Integer read Get_GetCount;
    property m_Position: Integer read Get_m_Position write Set_m_Position;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TRWKontoAuflistungProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TRWKontoAuflistung
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TRWKontoAuflistungProperties = class(TPersistent)
  private
    FServer:    TRWKontoAuflistung;
    function    GetDefaultInterface: IRWKontoAuflistung;
    constructor Create(AServer: TRWKontoAuflistung);
  protected
    function Get_m_Position: Integer;
    procedure Set_m_Position(pVal: Integer);
    function Get_m_Konto: WideString;
    function Get_m_Bezeichnung: WideString;
    function Get_m_Saldo(jahr: SYSINT): Currency;
    function Get_m_AB(jahr: SYSINT): Currency;
    function Get_m_Soll(jahr: SYSINT): Currency;
    function Get_m_Haben(jahr: SYSINT): Currency;
    function Get_m_Umbuchung(jahr: SYSINT): Currency;
    function Get_m_Typ: Smallint;
    function Get_GetCount: Integer;
  public
    property DefaultInterface: IRWKontoAuflistung read GetDefaultInterface;
  published
    property m_Position: Integer read Get_m_Position write Set_m_Position;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoRwPersKontoData provides a Create and CreateRemote method to          
// create instances of the default interface IRwPersKontoData exposed by              
// the CoClass RwPersKontoData. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRwPersKontoData = class
    class function Create: IRwPersKontoData;
    class function CreateRemote(const MachineName: string): IRwPersKontoData;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TRwPersKontoData
// Help String      : RwPersKontoData Class
// Default Interface: IRwPersKontoData
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TRwPersKontoDataProperties= class;
{$ENDIF}
  TRwPersKontoData = class(TOleServer)
  private
    FIntf: IRwPersKontoData;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TRwPersKontoDataProperties;
    function GetServerProperties: TRwPersKontoDataProperties;
{$ENDIF}
    function GetDefaultInterface: IRwPersKontoData;
  protected
    procedure InitServerData; override;
    function Get_m_BLZ(nummer: SYSINT): WideString;
    procedure Set_m_BLZ(nummer: SYSINT; const pVal: WideString);
    function Get_m_BankKonto(nummer: SYSINT): WideString;
    procedure Set_m_BankKonto(nummer: SYSINT; const pVal: WideString);
    function Get_m_Zahlungsart: WideString;
    procedure Set_m_Zahlungsart(const pVal: WideString);
    function Get_m_Zahlungskondition: Integer;
    procedure Set_m_Zahlungskondition(pVal: Integer);
    function Get_m_Sortierschluessel(index: SYSINT): Integer;
    procedure Set_m_Sortierschluessel(index: SYSINT; pVal: Integer);
    function Get_m_Webadresse: WideString;
    procedure Set_m_Webadresse(const pVal: WideString);
    function Get_m_DFUE: WideString;
    function Get_m_Autotelefon: WideString;
    procedure Set_m_Autotelefon(const pVal: WideString);
    function Get_m_USTID: WideString;
    procedure Set_m_USTID(const pVal: WideString);
    function Get_m_Ansprechpartner: WideString;
    procedure Set_m_Ansprechpartner(const pVal: WideString);
    function Get_m_Kurzbezeichnung: WideString;
    procedure Set_m_Kurzbezeichnung(const pVal: WideString);
    function Get_m_VerdichtungsKontp: WideString;
    procedure Set_m_VerdichtungsKontp(const pVal: WideString);
    function Get_m_BuchungstextVorschlag: WideString;
    procedure Set_m_BuchungstextVorschlag(const pVal: WideString);
    function Get_m_Strasse: WideString;
    procedure Set_m_Strasse(const pVal: WideString);
    function Get_m_PLZ: WideString;
    procedure Set_m_PLZ(const pVal: WideString);
    function Get_m_Ort: WideString;
    procedure Set_m_Ort(const pVal: WideString);
    function Get_m_Fax: WideString;
    procedure Set_m_Fax(const pVal: WideString);
    function Get_m_Email: WideString;
    procedure Set_m_Email(const pVal: WideString);
    function Get_m_Telefon(nummer: SYSINT): WideString;
    procedure Set_m_Telefon(nummer: SYSINT; const pVal: WideString);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IRwPersKontoData);
    procedure Disconnect; override;
    procedure UpdateData;
    property DefaultInterface: IRwPersKontoData read GetDefaultInterface;
    property m_BLZ[nummer: SYSINT]: WideString read Get_m_BLZ write Set_m_BLZ;
    property m_BankKonto[nummer: SYSINT]: WideString read Get_m_BankKonto write Set_m_BankKonto;
    property m_Sortierschluessel[index: SYSINT]: Integer read Get_m_Sortierschluessel write Set_m_Sortierschluessel;
    property m_DFUE: WideString read Get_m_DFUE;
    property m_Telefon[nummer: SYSINT]: WideString read Get_m_Telefon write Set_m_Telefon;
    property m_Zahlungsart: WideString read Get_m_Zahlungsart write Set_m_Zahlungsart;
    property m_Zahlungskondition: Integer read Get_m_Zahlungskondition write Set_m_Zahlungskondition;
    property m_Webadresse: WideString read Get_m_Webadresse write Set_m_Webadresse;
    property m_Autotelefon: WideString read Get_m_Autotelefon write Set_m_Autotelefon;
    property m_USTID: WideString read Get_m_USTID write Set_m_USTID;
    property m_Ansprechpartner: WideString read Get_m_Ansprechpartner write Set_m_Ansprechpartner;
    property m_Kurzbezeichnung: WideString read Get_m_Kurzbezeichnung write Set_m_Kurzbezeichnung;
    property m_VerdichtungsKontp: WideString read Get_m_VerdichtungsKontp write Set_m_VerdichtungsKontp;
    property m_BuchungstextVorschlag: WideString read Get_m_BuchungstextVorschlag write Set_m_BuchungstextVorschlag;
    property m_Strasse: WideString read Get_m_Strasse write Set_m_Strasse;
    property m_PLZ: WideString read Get_m_PLZ write Set_m_PLZ;
    property m_Ort: WideString read Get_m_Ort write Set_m_Ort;
    property m_Fax: WideString read Get_m_Fax write Set_m_Fax;
    property m_Email: WideString read Get_m_Email write Set_m_Email;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TRwPersKontoDataProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TRwPersKontoData
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TRwPersKontoDataProperties = class(TPersistent)
  private
    FServer:    TRwPersKontoData;
    function    GetDefaultInterface: IRwPersKontoData;
    constructor Create(AServer: TRwPersKontoData);
  protected
    function Get_m_BLZ(nummer: SYSINT): WideString;
    procedure Set_m_BLZ(nummer: SYSINT; const pVal: WideString);
    function Get_m_BankKonto(nummer: SYSINT): WideString;
    procedure Set_m_BankKonto(nummer: SYSINT; const pVal: WideString);
    function Get_m_Zahlungsart: WideString;
    procedure Set_m_Zahlungsart(const pVal: WideString);
    function Get_m_Zahlungskondition: Integer;
    procedure Set_m_Zahlungskondition(pVal: Integer);
    function Get_m_Sortierschluessel(index: SYSINT): Integer;
    procedure Set_m_Sortierschluessel(index: SYSINT; pVal: Integer);
    function Get_m_Webadresse: WideString;
    procedure Set_m_Webadresse(const pVal: WideString);
    function Get_m_DFUE: WideString;
    function Get_m_Autotelefon: WideString;
    procedure Set_m_Autotelefon(const pVal: WideString);
    function Get_m_USTID: WideString;
    procedure Set_m_USTID(const pVal: WideString);
    function Get_m_Ansprechpartner: WideString;
    procedure Set_m_Ansprechpartner(const pVal: WideString);
    function Get_m_Kurzbezeichnung: WideString;
    procedure Set_m_Kurzbezeichnung(const pVal: WideString);
    function Get_m_VerdichtungsKontp: WideString;
    procedure Set_m_VerdichtungsKontp(const pVal: WideString);
    function Get_m_BuchungstextVorschlag: WideString;
    procedure Set_m_BuchungstextVorschlag(const pVal: WideString);
    function Get_m_Strasse: WideString;
    procedure Set_m_Strasse(const pVal: WideString);
    function Get_m_PLZ: WideString;
    procedure Set_m_PLZ(const pVal: WideString);
    function Get_m_Ort: WideString;
    procedure Set_m_Ort(const pVal: WideString);
    function Get_m_Fax: WideString;
    procedure Set_m_Fax(const pVal: WideString);
    function Get_m_Email: WideString;
    procedure Set_m_Email(const pVal: WideString);
    function Get_m_Telefon(nummer: SYSINT): WideString;
    procedure Set_m_Telefon(nummer: SYSINT; const pVal: WideString);
  public
    property DefaultInterface: IRwPersKontoData read GetDefaultInterface;
  published
    property m_Zahlungsart: WideString read Get_m_Zahlungsart write Set_m_Zahlungsart;
    property m_Zahlungskondition: Integer read Get_m_Zahlungskondition write Set_m_Zahlungskondition;
    property m_Webadresse: WideString read Get_m_Webadresse write Set_m_Webadresse;
    property m_Autotelefon: WideString read Get_m_Autotelefon write Set_m_Autotelefon;
    property m_USTID: WideString read Get_m_USTID write Set_m_USTID;
    property m_Ansprechpartner: WideString read Get_m_Ansprechpartner write Set_m_Ansprechpartner;
    property m_Kurzbezeichnung: WideString read Get_m_Kurzbezeichnung write Set_m_Kurzbezeichnung;
    property m_VerdichtungsKontp: WideString read Get_m_VerdichtungsKontp write Set_m_VerdichtungsKontp;
    property m_BuchungstextVorschlag: WideString read Get_m_BuchungstextVorschlag write Set_m_BuchungstextVorschlag;
    property m_Strasse: WideString read Get_m_Strasse write Set_m_Strasse;
    property m_PLZ: WideString read Get_m_PLZ write Set_m_PLZ;
    property m_Ort: WideString read Get_m_Ort write Set_m_Ort;
    property m_Fax: WideString read Get_m_Fax write Set_m_Fax;
    property m_Email: WideString read Get_m_Email write Set_m_Email;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoRwBuchungskreisTool provides a Create and CreateRemote method to          
// create instances of the default interface IRwBuchungskreisTool exposed by              
// the CoClass RwBuchungskreisTool. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRwBuchungskreisTool = class
    class function Create: IRwBuchungskreisTool;
    class function CreateRemote(const MachineName: string): IRwBuchungskreisTool;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TRwBuchungskreisTool
// Help String      : RwBuchungskreisTool Class
// Default Interface: IRwBuchungskreisTool
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TRwBuchungskreisToolProperties= class;
{$ENDIF}
  TRwBuchungskreisTool = class(TOleServer)
  private
    FIntf: IRwBuchungskreisTool;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TRwBuchungskreisToolProperties;
    function GetServerProperties: TRwBuchungskreisToolProperties;
{$ENDIF}
    function GetDefaultInterface: IRwBuchungskreisTool;
  protected
    procedure InitServerData; override;
    function Get_m_Buchungskreis: LongWord;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IRwBuchungskreisTool);
    procedure Disconnect; override;
    procedure SetBuchungskreis(bukreis: Integer; check: Byte);
    property DefaultInterface: IRwBuchungskreisTool read GetDefaultInterface;
    property m_Buchungskreis: LongWord read Get_m_Buchungskreis;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TRwBuchungskreisToolProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TRwBuchungskreisTool
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TRwBuchungskreisToolProperties = class(TPersistent)
  private
    FServer:    TRwBuchungskreisTool;
    function    GetDefaultInterface: IRwBuchungskreisTool;
    constructor Create(AServer: TRwBuchungskreisTool);
  protected
    function Get_m_Buchungskreis: LongWord;
  public
    property DefaultInterface: IRwBuchungskreisTool read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

resourcestring
  dtlServerPage = '(none)';

  dtlOcxPage = '(none)';

implementation

uses ComObj;

class function CoAddFibuProjectImp.Create: IAddFibuProjectImp;
begin
  Result := CreateComObject(CLASS_AddFibuProjectImp) as IAddFibuProjectImp;
end;

class function CoAddFibuProjectImp.CreateRemote(const MachineName: string): IAddFibuProjectImp;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AddFibuProjectImp) as IAddFibuProjectImp;
end;

procedure TAddFibuProjectImp.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{75E42BA1-697E-11D2-ADED-000083F3B333}';
    IntfIID:   '{75E42BA0-697E-11D2-ADED-000083F3B333}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TAddFibuProjectImp.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IAddFibuProjectImp;
  end;
end;

procedure TAddFibuProjectImp.ConnectTo(svrIntf: IAddFibuProjectImp);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TAddFibuProjectImp.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TAddFibuProjectImp.GetDefaultInterface: IAddFibuProjectImp;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TAddFibuProjectImp.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TAddFibuProjectImpProperties.Create(Self);
{$ENDIF}
end;

destructor TAddFibuProjectImp.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TAddFibuProjectImp.GetServerProperties: TAddFibuProjectImpProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TAddFibuProjectImp.Get_GetWJPos(position: Integer): IRwFibuWJ;
begin
    Result := DefaultInterface.GetWJPos[position];
end;

function TAddFibuProjectImp.Get_GetWJDate(__MIDL_0030: TDateTime): IRwFibuWJ;
begin
    Result := DefaultInterface.GetWJDate[__MIDL_0030];
end;

function TAddFibuProjectImp.Get_IsLocked: Integer;
begin
    Result := DefaultInterface.IsLocked;
end;

function TAddFibuProjectImp.Get_GetLastWJ: IRwFibuWJ;
begin
    Result := DefaultInterface.GetLastWJ;
end;

function TAddFibuProjectImp.Get_SearchFibuWJ(monat: SYSINT; jahr: SYSINT): IRwFibuWJ;
begin
    Result := DefaultInterface.SearchFibuWJ[monat, jahr];
end;

procedure TAddFibuProjectImp.Attach(const __MIDL_0029: IAddProject);
begin
  DefaultInterface.Attach(__MIDL_0029);
end;

procedure TAddFibuProjectImp.LockProject(exklusive: Integer);
begin
  DefaultInterface.LockProject(exklusive);
end;

procedure TAddFibuProjectImp.UnLockProject(exklusive: Integer; deep: Integer);
begin
  DefaultInterface.UnLockProject(exklusive, deep);
end;

procedure TAddFibuProjectImp.AttachMandantenNr(mnr: Integer);
begin
  DefaultInterface.AttachMandantenNr(mnr);
end;

procedure TAddFibuProjectImp.RefreshFibuObjects;
begin
  DefaultInterface.RefreshFibuObjects;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TAddFibuProjectImpProperties.Create(AServer: TAddFibuProjectImp);
begin
  inherited Create;
  FServer := AServer;
end;

function TAddFibuProjectImpProperties.GetDefaultInterface: IAddFibuProjectImp;
begin
  Result := FServer.DefaultInterface;
end;

function TAddFibuProjectImpProperties.Get_GetWJPos(position: Integer): IRwFibuWJ;
begin
    Result := DefaultInterface.GetWJPos[position];
end;

function TAddFibuProjectImpProperties.Get_GetWJDate(__MIDL_0030: TDateTime): IRwFibuWJ;
begin
    Result := DefaultInterface.GetWJDate[__MIDL_0030];
end;

function TAddFibuProjectImpProperties.Get_IsLocked: Integer;
begin
    Result := DefaultInterface.IsLocked;
end;

function TAddFibuProjectImpProperties.Get_GetLastWJ: IRwFibuWJ;
begin
    Result := DefaultInterface.GetLastWJ;
end;

function TAddFibuProjectImpProperties.Get_SearchFibuWJ(monat: SYSINT; jahr: SYSINT): IRwFibuWJ;
begin
    Result := DefaultInterface.SearchFibuWJ[monat, jahr];
end;

{$ENDIF}

class function CoRwFibuWJ.Create: IRwFibuWJ;
begin
  Result := CreateComObject(CLASS_RwFibuWJ) as IRwFibuWJ;
end;

class function CoRwFibuWJ.CreateRemote(const MachineName: string): IRwFibuWJ;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_RwFibuWJ) as IRwFibuWJ;
end;

procedure TRwFibuWJ.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{BDF5FC64-6AB5-11D2-ADF1-000083F3B333}';
    IntfIID:   '{BDF5FC63-6AB5-11D2-ADF1-000083F3B333}';
    EventIID:  '{5E9AB180-FE24-11D2-AEFB-000083F3B333}';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TRwFibuWJ.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    ConnectEvents(punk);
    Fintf:= punk as IRwFibuWJ;
  end;
end;

procedure TRwFibuWJ.ConnectTo(svrIntf: IRwFibuWJ);
begin
  Disconnect;
  FIntf := svrIntf;
  ConnectEvents(FIntf);
end;

procedure TRwFibuWJ.DisConnect;
begin
  if Fintf <> nil then
  begin
    DisconnectEvents(FIntf);
    FIntf := nil;
  end;
end;

function TRwFibuWJ.GetDefaultInterface: IRwFibuWJ;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TRwFibuWJ.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TRwFibuWJProperties.Create(Self);
{$ENDIF}
end;

destructor TRwFibuWJ.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TRwFibuWJ.GetServerProperties: TRwFibuWJProperties;
begin
  Result := FProps;
end;
{$ENDIF}

procedure TRwFibuWJ.InvokeEvent(DispID: TDispID; var Params: TVariantArray);
begin
  case DispID of
    -1: Exit;  // DISPID_UNKNOWN
    1: if Assigned(FOnNotifyProgress) then
         FOnNotifyProgress(Self,
                           Params[0] {const WideString},
                           Params[1] {SYSINT});
  end; {case DispID}
end;

function TRwFibuWJ.Get_m_Beginn: TDateTime;
begin
    Result := DefaultInterface.m_Beginn;
end;

function TRwFibuWJ.Get_m_Ende: TDateTime;
begin
    Result := DefaultInterface.m_Ende;
end;

function TRwFibuWJ.Get_m_VerdichtForderungen(index: Integer): WideString;
begin
    Result := DefaultInterface.m_VerdichtForderungen[index];
end;

function TRwFibuWJ.Get_m_VerdichtVerbindlichkeiten(index: Integer): WideString;
begin
    Result := DefaultInterface.m_VerdichtVerbindlichkeiten[index];
end;

function TRwFibuWJ.Get_IsVerdichtKonto(const __MIDL_0027: WideString): Integer;
begin
    Result := DefaultInterface.IsVerdichtKonto[__MIDL_0027];
end;

function TRwFibuWJ.Get_m_DifferenzenKonto: WideString;
begin
    Result := DefaultInterface.m_DifferenzenKonto;
end;

function TRwFibuWJ.Get_m_DifferenzenKreditorKonto: WideString;
begin
    Result := DefaultInterface.m_DifferenzenKreditorKonto;
end;

function TRwFibuWJ.Get_m_DifferenzenDebitorKonto: WideString;
begin
    Result := DefaultInterface.m_DifferenzenDebitorKonto;
end;

function TRwFibuWJ.Get_m_BilanzEroeffnungsKonto: WideString;
begin
    Result := DefaultInterface.m_BilanzEroeffnungsKonto;
end;

function TRwFibuWJ.Get_m_BilanzEroeffnungDebitorKonto: WideString;
begin
    Result := DefaultInterface.m_BilanzEroeffnungDebitorKonto;
end;

function TRwFibuWJ.Get_m_BilanzEroeffnungKreditorKonto: WideString;
begin
    Result := DefaultInterface.m_BilanzEroeffnungKreditorKonto;
end;

function TRwFibuWJ.Get_m_UmstellungsDifferenzKonto: WideString;
begin
    Result := DefaultInterface.m_UmstellungsDifferenzKonto;
end;

function TRwFibuWJ.Get_m_Hauswaehrung: Smallint;
begin
    Result := DefaultInterface.m_Hauswaehrung;
end;

function TRwFibuWJ.Get_IsSachkonto(const kontoNr: WideString): Integer;
begin
    Result := DefaultInterface.IsSachkonto[kontoNr];
end;

function TRwFibuWJ.Get_IsDebitor(const kontoNr: WideString): Integer;
begin
    Result := DefaultInterface.IsDebitor[kontoNr];
end;

function TRwFibuWJ.Get_IsKreditor(const kontoNr: WideString): Integer;
begin
    Result := DefaultInterface.IsKreditor[kontoNr];
end;

function TRwFibuWJ.Get_m_Debitorkonten: IRwDebitorkonten;
begin
    Result := DefaultInterface.m_Debitorkonten;
end;

function TRwFibuWJ.Get_m_Kreditorkonten: IRwKreditorkonten;
begin
    Result := DefaultInterface.m_Kreditorkonten;
end;

function TRwFibuWJ.Get_m_Sachkonten: IRwSachkonten;
begin
    Result := DefaultInterface.m_Sachkonten;
end;

function TRwFibuWJ.Get_m_Istversteuerer: Integer;
begin
    Result := DefaultInterface.m_Istversteuerer;
end;

function TRwFibuWJ.Get_m_HasOPVerwaltung: Integer;
begin
    Result := DefaultInterface.m_HasOPVerwaltung;
end;

function TRwFibuWJ.Get_CreateOPSuche: IRwOPSuche;
begin
    Result := DefaultInterface.CreateOPSuche;
end;

function TRwFibuWJ.Get_m_BuchungsDatum: TDateTime;
begin
    Result := DefaultInterface.m_BuchungsDatum;
end;

function TRwFibuWJ.Get_getBuchungsstapelWJ: IRwBuchungsstapelWJ;
begin
    Result := DefaultInterface.getBuchungsstapelWJ;
end;

function TRwFibuWJ.Get_GetStandardBilanzSchema(var isMandantSchema: Integer): Integer;
begin
    Result := DefaultInterface.GetStandardBilanzSchema[isMandantSchema];
end;

function TRwFibuWJ.Get_IsInWJ(__MIDL_0028: TDateTime): Integer;
begin
    Result := DefaultInterface.IsInWJ[__MIDL_0028];
end;

function TRwFibuWJ.Get_GetBInfo(const infoString: WideString): IRwBilanzInfo;
begin
    Result := DefaultInterface.GetBInfo[infoString];
end;

function TRwFibuWJ.Get_GetBItem(const infoString: WideString): IRwBilanzItem;
begin
    Result := DefaultInterface.GetBItem[infoString];
end;

function TRwFibuWJ.Get_m_Kontenrahmen: Integer;
begin
    Result := DefaultInterface.m_Kontenrahmen;
end;

procedure TRwFibuWJ.Refresh;
begin
  DefaultInterface.Refresh;
end;

function TRwFibuWJ.IsSteuerSchluesselValid(const steuerSchluessel: WideString): Integer;
begin
  Result := DefaultInterface.IsSteuerSchluesselValid(steuerSchluessel);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TRwFibuWJProperties.Create(AServer: TRwFibuWJ);
begin
  inherited Create;
  FServer := AServer;
end;

function TRwFibuWJProperties.GetDefaultInterface: IRwFibuWJ;
begin
  Result := FServer.DefaultInterface;
end;

function TRwFibuWJProperties.Get_m_Beginn: TDateTime;
begin
    Result := DefaultInterface.m_Beginn;
end;

function TRwFibuWJProperties.Get_m_Ende: TDateTime;
begin
    Result := DefaultInterface.m_Ende;
end;

function TRwFibuWJProperties.Get_m_VerdichtForderungen(index: Integer): WideString;
begin
    Result := DefaultInterface.m_VerdichtForderungen[index];
end;

function TRwFibuWJProperties.Get_m_VerdichtVerbindlichkeiten(index: Integer): WideString;
begin
    Result := DefaultInterface.m_VerdichtVerbindlichkeiten[index];
end;

function TRwFibuWJProperties.Get_IsVerdichtKonto(const __MIDL_0027: WideString): Integer;
begin
    Result := DefaultInterface.IsVerdichtKonto[__MIDL_0027];
end;

function TRwFibuWJProperties.Get_m_DifferenzenKonto: WideString;
begin
    Result := DefaultInterface.m_DifferenzenKonto;
end;

function TRwFibuWJProperties.Get_m_DifferenzenKreditorKonto: WideString;
begin
    Result := DefaultInterface.m_DifferenzenKreditorKonto;
end;

function TRwFibuWJProperties.Get_m_DifferenzenDebitorKonto: WideString;
begin
    Result := DefaultInterface.m_DifferenzenDebitorKonto;
end;

function TRwFibuWJProperties.Get_m_BilanzEroeffnungsKonto: WideString;
begin
    Result := DefaultInterface.m_BilanzEroeffnungsKonto;
end;

function TRwFibuWJProperties.Get_m_BilanzEroeffnungDebitorKonto: WideString;
begin
    Result := DefaultInterface.m_BilanzEroeffnungDebitorKonto;
end;

function TRwFibuWJProperties.Get_m_BilanzEroeffnungKreditorKonto: WideString;
begin
    Result := DefaultInterface.m_BilanzEroeffnungKreditorKonto;
end;

function TRwFibuWJProperties.Get_m_UmstellungsDifferenzKonto: WideString;
begin
    Result := DefaultInterface.m_UmstellungsDifferenzKonto;
end;

function TRwFibuWJProperties.Get_m_Hauswaehrung: Smallint;
begin
    Result := DefaultInterface.m_Hauswaehrung;
end;

function TRwFibuWJProperties.Get_IsSachkonto(const kontoNr: WideString): Integer;
begin
    Result := DefaultInterface.IsSachkonto[kontoNr];
end;

function TRwFibuWJProperties.Get_IsDebitor(const kontoNr: WideString): Integer;
begin
    Result := DefaultInterface.IsDebitor[kontoNr];
end;

function TRwFibuWJProperties.Get_IsKreditor(const kontoNr: WideString): Integer;
begin
    Result := DefaultInterface.IsKreditor[kontoNr];
end;

function TRwFibuWJProperties.Get_m_Debitorkonten: IRwDebitorkonten;
begin
    Result := DefaultInterface.m_Debitorkonten;
end;

function TRwFibuWJProperties.Get_m_Kreditorkonten: IRwKreditorkonten;
begin
    Result := DefaultInterface.m_Kreditorkonten;
end;

function TRwFibuWJProperties.Get_m_Sachkonten: IRwSachkonten;
begin
    Result := DefaultInterface.m_Sachkonten;
end;

function TRwFibuWJProperties.Get_m_Istversteuerer: Integer;
begin
    Result := DefaultInterface.m_Istversteuerer;
end;

function TRwFibuWJProperties.Get_m_HasOPVerwaltung: Integer;
begin
    Result := DefaultInterface.m_HasOPVerwaltung;
end;

function TRwFibuWJProperties.Get_CreateOPSuche: IRwOPSuche;
begin
    Result := DefaultInterface.CreateOPSuche;
end;

function TRwFibuWJProperties.Get_m_BuchungsDatum: TDateTime;
begin
    Result := DefaultInterface.m_BuchungsDatum;
end;

function TRwFibuWJProperties.Get_getBuchungsstapelWJ: IRwBuchungsstapelWJ;
begin
    Result := DefaultInterface.getBuchungsstapelWJ;
end;

function TRwFibuWJProperties.Get_GetStandardBilanzSchema(var isMandantSchema: Integer): Integer;
begin
    Result := DefaultInterface.GetStandardBilanzSchema[isMandantSchema];
end;

function TRwFibuWJProperties.Get_IsInWJ(__MIDL_0028: TDateTime): Integer;
begin
    Result := DefaultInterface.IsInWJ[__MIDL_0028];
end;

function TRwFibuWJProperties.Get_GetBInfo(const infoString: WideString): IRwBilanzInfo;
begin
    Result := DefaultInterface.GetBInfo[infoString];
end;

function TRwFibuWJProperties.Get_GetBItem(const infoString: WideString): IRwBilanzItem;
begin
    Result := DefaultInterface.GetBItem[infoString];
end;

function TRwFibuWJProperties.Get_m_Kontenrahmen: Integer;
begin
    Result := DefaultInterface.m_Kontenrahmen;
end;

{$ENDIF}

class function CoRwBilanzInfo.Create: IRwBilanzInfo;
begin
  Result := CreateComObject(CLASS_RwBilanzInfo) as IRwBilanzInfo;
end;

class function CoRwBilanzInfo.CreateRemote(const MachineName: string): IRwBilanzInfo;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_RwBilanzInfo) as IRwBilanzInfo;
end;

procedure TRwBilanzInfo.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{0B537765-6C38-11D2-ADF1-000083F3B333}';
    IntfIID:   '{0B537764-6C38-11D2-ADF1-000083F3B333}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TRwBilanzInfo.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IRwBilanzInfo;
  end;
end;

procedure TRwBilanzInfo.ConnectTo(svrIntf: IRwBilanzInfo);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TRwBilanzInfo.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TRwBilanzInfo.GetDefaultInterface: IRwBilanzInfo;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TRwBilanzInfo.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TRwBilanzInfoProperties.Create(Self);
{$ENDIF}
end;

destructor TRwBilanzInfo.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TRwBilanzInfo.GetServerProperties: TRwBilanzInfoProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TRwBilanzInfo.Get_HasVorjahr: Integer;
begin
    Result := DefaultInterface.HasVorjahr;
end;

function TRwBilanzInfo.Get_GetAuflistung(bilanzPosition: Integer; nurKonten: Integer): IRWKontoAuflistung;
begin
    Result := DefaultInterface.GetAuflistung[bilanzPosition, nurKonten];
end;

function TRwBilanzInfo.Get_m_Bereich(bilanzPosition: Integer): WideString;
begin
    Result := DefaultInterface.m_Bereich[bilanzPosition];
end;

procedure TRwBilanzInfo.LoadBilanz(mandant: Integer; mandantSchema: Integer; bilanzSchema: Integer; 
                                   wjDatum: TDateTime; periodeBis: Integer; bilanzArt: Smallint; 
                                   anzahlJahre: SYSINT; konsolidierung: Integer; 
                                   Auswertungskreis: SYSINT);
begin
  DefaultInterface.LoadBilanz(mandant, mandantSchema, bilanzSchema, wjDatum, periodeBis, bilanzArt, 
                              anzahlJahre, konsolidierung, Auswertungskreis);
end;

procedure TRwBilanzInfo.ReloadAll;
begin
  DefaultInterface.ReloadAll;
end;

procedure TRwBilanzInfo.GetFirstBilanzPosition(var pos: Integer; jahreZuBeachten: SYSINT);
begin
  DefaultInterface.GetFirstBilanzPosition(pos, jahreZuBeachten);
end;

procedure TRwBilanzInfo.GetNextBilanzPosition(curPos: Integer; var nextpos: Integer; 
                                              jahreZuBeachten: SYSINT);
begin
  DefaultInterface.GetNextBilanzPosition(curPos, nextpos, jahreZuBeachten);
end;

procedure TRwBilanzInfo.GetPos(bpos: Integer; var format: WideString; var gliederung: WideString; 
                               var bezeichnung: WideString; var wert: Currency; var vjwert: Currency);
begin
  DefaultInterface.GetPos(bpos, format, gliederung, bezeichnung, wert, vjwert);
end;

procedure TRwBilanzInfo.GetPos5Jahre(bpos: Integer; var format: WideString; 
                                     var gliederung: WideString; var bezeichnung: WideString; 
                                     var wert: Currency; var wert1: Currency; var wert2: Currency; 
                                     var wert3: Currency; var wert4: Currency);
begin
  DefaultInterface.GetPos5Jahre(bpos, format, gliederung, bezeichnung, wert, wert1, wert2, wert3, 
                                wert4);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TRwBilanzInfoProperties.Create(AServer: TRwBilanzInfo);
begin
  inherited Create;
  FServer := AServer;
end;

function TRwBilanzInfoProperties.GetDefaultInterface: IRwBilanzInfo;
begin
  Result := FServer.DefaultInterface;
end;

function TRwBilanzInfoProperties.Get_HasVorjahr: Integer;
begin
    Result := DefaultInterface.HasVorjahr;
end;

function TRwBilanzInfoProperties.Get_GetAuflistung(bilanzPosition: Integer; nurKonten: Integer): IRWKontoAuflistung;
begin
    Result := DefaultInterface.GetAuflistung[bilanzPosition, nurKonten];
end;

function TRwBilanzInfoProperties.Get_m_Bereich(bilanzPosition: Integer): WideString;
begin
    Result := DefaultInterface.m_Bereich[bilanzPosition];
end;

{$ENDIF}

class function CoRwBilanzItem.Create: IRwBilanzItem;
begin
  Result := CreateComObject(CLASS_RwBilanzItem) as IRwBilanzItem;
end;

class function CoRwBilanzItem.CreateRemote(const MachineName: string): IRwBilanzItem;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_RwBilanzItem) as IRwBilanzItem;
end;

procedure TRwBilanzItem.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{0B537768-6C38-11D2-ADF1-000083F3B333}';
    IntfIID:   '{0B537767-6C38-11D2-ADF1-000083F3B333}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TRwBilanzItem.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IRwBilanzItem;
  end;
end;

procedure TRwBilanzItem.ConnectTo(svrIntf: IRwBilanzItem);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TRwBilanzItem.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TRwBilanzItem.GetDefaultInterface: IRwBilanzItem;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TRwBilanzItem.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TRwBilanzItemProperties.Create(Self);
{$ENDIF}
end;

destructor TRwBilanzItem.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TRwBilanzItem.GetServerProperties: TRwBilanzItemProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TRwBilanzItem.Get_Request(const __MIDL_0021: WideString): WideString;
begin
    Result := DefaultInterface.Request[__MIDL_0021];
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TRwBilanzItemProperties.Create(AServer: TRwBilanzItem);
begin
  inherited Create;
  FServer := AServer;
end;

function TRwBilanzItemProperties.GetDefaultInterface: IRwBilanzItem;
begin
  Result := FServer.DefaultInterface;
end;

function TRwBilanzItemProperties.Get_Request(const __MIDL_0021: WideString): WideString;
begin
    Result := DefaultInterface.Request[__MIDL_0021];
end;

{$ENDIF}

class function CoRwSachkonten.Create: IRwSachkonten;
begin
  Result := CreateComObject(CLASS_RwSachkonten) as IRwSachkonten;
end;

class function CoRwSachkonten.CreateRemote(const MachineName: string): IRwSachkonten;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_RwSachkonten) as IRwSachkonten;
end;

procedure TRwSachkonten.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{0B53776E-6C38-11D2-ADF1-000083F3B333}';
    IntfIID:   '{0B53776D-6C38-11D2-ADF1-000083F3B333}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TRwSachkonten.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IRwSachkonten;
  end;
end;

procedure TRwSachkonten.ConnectTo(svrIntf: IRwSachkonten);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TRwSachkonten.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TRwSachkonten.GetDefaultInterface: IRwSachkonten;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TRwSachkonten.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TRwSachkontenProperties.Create(Self);
{$ENDIF}
end;

destructor TRwSachkonten.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TRwSachkonten.GetServerProperties: TRwSachkontenProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TRwSachkonten.Get_SearchFibuKonto(const __MIDL_0022: WideString): IRwFibuKonto;
begin
    Result := DefaultInterface.SearchFibuKonto[__MIDL_0022];
end;

function TRwSachkonten.Get_GetFirst: IRwFibuKonto;
begin
    Result := DefaultInterface.GetFirst;
end;

function TRwSachkonten.Get_GetNext: IRwFibuKonto;
begin
    Result := DefaultInterface.GetNext;
end;

function TRwSachkonten.Get_GetPrev: IRwFibuKonto;
begin
    Result := DefaultInterface.GetPrev;
end;

function TRwSachkonten.Get_GetLast: IRwFibuKonto;
begin
    Result := DefaultInterface.GetLast;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TRwSachkontenProperties.Create(AServer: TRwSachkonten);
begin
  inherited Create;
  FServer := AServer;
end;

function TRwSachkontenProperties.GetDefaultInterface: IRwSachkonten;
begin
  Result := FServer.DefaultInterface;
end;

function TRwSachkontenProperties.Get_SearchFibuKonto(const __MIDL_0022: WideString): IRwFibuKonto;
begin
    Result := DefaultInterface.SearchFibuKonto[__MIDL_0022];
end;

function TRwSachkontenProperties.Get_GetFirst: IRwFibuKonto;
begin
    Result := DefaultInterface.GetFirst;
end;

function TRwSachkontenProperties.Get_GetNext: IRwFibuKonto;
begin
    Result := DefaultInterface.GetNext;
end;

function TRwSachkontenProperties.Get_GetPrev: IRwFibuKonto;
begin
    Result := DefaultInterface.GetPrev;
end;

function TRwSachkontenProperties.Get_GetLast: IRwFibuKonto;
begin
    Result := DefaultInterface.GetLast;
end;

{$ENDIF}

class function CoRwDebitorkonten.Create: IRwDebitorkonten;
begin
  Result := CreateComObject(CLASS_RwDebitorkonten) as IRwDebitorkonten;
end;

class function CoRwDebitorkonten.CreateRemote(const MachineName: string): IRwDebitorkonten;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_RwDebitorkonten) as IRwDebitorkonten;
end;

procedure TRwDebitorkonten.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{0B537771-6C38-11D2-ADF1-000083F3B333}';
    IntfIID:   '{0B537770-6C38-11D2-ADF1-000083F3B333}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TRwDebitorkonten.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IRwDebitorkonten;
  end;
end;

procedure TRwDebitorkonten.ConnectTo(svrIntf: IRwDebitorkonten);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TRwDebitorkonten.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TRwDebitorkonten.GetDefaultInterface: IRwDebitorkonten;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TRwDebitorkonten.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TRwDebitorkontenProperties.Create(Self);
{$ENDIF}
end;

destructor TRwDebitorkonten.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TRwDebitorkonten.GetServerProperties: TRwDebitorkontenProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TRwDebitorkonten.Get_SearchFibuKonto(const __MIDL_0023: WideString): IRwFibuKonto;
begin
    Result := DefaultInterface.SearchFibuKonto[__MIDL_0023];
end;

function TRwDebitorkonten.Get_GetFirst: IRwFibuKonto;
begin
    Result := DefaultInterface.GetFirst;
end;

function TRwDebitorkonten.Get_GetNext: IRwFibuKonto;
begin
    Result := DefaultInterface.GetNext;
end;

function TRwDebitorkonten.Get_GetPrev: IRwFibuKonto;
begin
    Result := DefaultInterface.GetPrev;
end;

function TRwDebitorkonten.Get_GetLast: IRwFibuKonto;
begin
    Result := DefaultInterface.GetLast;
end;

function TRwDebitorkonten.Get_ExistsFibuKonto(const __MIDL_0024: WideString): Integer;
begin
    Result := DefaultInterface.ExistsFibuKonto[__MIDL_0024];
end;

function TRwDebitorkonten.Get_CreateKontoNummer(const nr: WideString; const Name: WideString): WideString;
begin
    Result := DefaultInterface.CreateKontoNummer[nr, Name];
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TRwDebitorkontenProperties.Create(AServer: TRwDebitorkonten);
begin
  inherited Create;
  FServer := AServer;
end;

function TRwDebitorkontenProperties.GetDefaultInterface: IRwDebitorkonten;
begin
  Result := FServer.DefaultInterface;
end;

function TRwDebitorkontenProperties.Get_SearchFibuKonto(const __MIDL_0023: WideString): IRwFibuKonto;
begin
    Result := DefaultInterface.SearchFibuKonto[__MIDL_0023];
end;

function TRwDebitorkontenProperties.Get_GetFirst: IRwFibuKonto;
begin
    Result := DefaultInterface.GetFirst;
end;

function TRwDebitorkontenProperties.Get_GetNext: IRwFibuKonto;
begin
    Result := DefaultInterface.GetNext;
end;

function TRwDebitorkontenProperties.Get_GetPrev: IRwFibuKonto;
begin
    Result := DefaultInterface.GetPrev;
end;

function TRwDebitorkontenProperties.Get_GetLast: IRwFibuKonto;
begin
    Result := DefaultInterface.GetLast;
end;

function TRwDebitorkontenProperties.Get_ExistsFibuKonto(const __MIDL_0024: WideString): Integer;
begin
    Result := DefaultInterface.ExistsFibuKonto[__MIDL_0024];
end;

function TRwDebitorkontenProperties.Get_CreateKontoNummer(const nr: WideString; 
                                                          const Name: WideString): WideString;
begin
    Result := DefaultInterface.CreateKontoNummer[nr, Name];
end;

{$ENDIF}

class function CoRwKreditorkonten.Create: IRwKreditorkonten;
begin
  Result := CreateComObject(CLASS_RwKreditorkonten) as IRwKreditorkonten;
end;

class function CoRwKreditorkonten.CreateRemote(const MachineName: string): IRwKreditorkonten;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_RwKreditorkonten) as IRwKreditorkonten;
end;

procedure TRwKreditorkonten.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{0B537774-6C38-11D2-ADF1-000083F3B333}';
    IntfIID:   '{0B537773-6C38-11D2-ADF1-000083F3B333}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TRwKreditorkonten.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IRwKreditorkonten;
  end;
end;

procedure TRwKreditorkonten.ConnectTo(svrIntf: IRwKreditorkonten);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TRwKreditorkonten.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TRwKreditorkonten.GetDefaultInterface: IRwKreditorkonten;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TRwKreditorkonten.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TRwKreditorkontenProperties.Create(Self);
{$ENDIF}
end;

destructor TRwKreditorkonten.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TRwKreditorkonten.GetServerProperties: TRwKreditorkontenProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TRwKreditorkonten.Get_SearchFibuKonto(const __MIDL_0026: WideString): IRwFibuKonto;
begin
    Result := DefaultInterface.SearchFibuKonto[__MIDL_0026];
end;

function TRwKreditorkonten.Get_GetFirst: IRwFibuKonto;
begin
    Result := DefaultInterface.GetFirst;
end;

function TRwKreditorkonten.Get_GetNext: IRwFibuKonto;
begin
    Result := DefaultInterface.GetNext;
end;

function TRwKreditorkonten.Get_GetPrev: IRwFibuKonto;
begin
    Result := DefaultInterface.GetPrev;
end;

function TRwKreditorkonten.Get_GetLast: IRwFibuKonto;
begin
    Result := DefaultInterface.GetLast;
end;

function TRwKreditorkonten.Get_CreateKontoNummer(const nr: WideString; const Name: WideString): WideString;
begin
    Result := DefaultInterface.CreateKontoNummer[nr, Name];
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TRwKreditorkontenProperties.Create(AServer: TRwKreditorkonten);
begin
  inherited Create;
  FServer := AServer;
end;

function TRwKreditorkontenProperties.GetDefaultInterface: IRwKreditorkonten;
begin
  Result := FServer.DefaultInterface;
end;

function TRwKreditorkontenProperties.Get_SearchFibuKonto(const __MIDL_0026: WideString): IRwFibuKonto;
begin
    Result := DefaultInterface.SearchFibuKonto[__MIDL_0026];
end;

function TRwKreditorkontenProperties.Get_GetFirst: IRwFibuKonto;
begin
    Result := DefaultInterface.GetFirst;
end;

function TRwKreditorkontenProperties.Get_GetNext: IRwFibuKonto;
begin
    Result := DefaultInterface.GetNext;
end;

function TRwKreditorkontenProperties.Get_GetPrev: IRwFibuKonto;
begin
    Result := DefaultInterface.GetPrev;
end;

function TRwKreditorkontenProperties.Get_GetLast: IRwFibuKonto;
begin
    Result := DefaultInterface.GetLast;
end;

function TRwKreditorkontenProperties.Get_CreateKontoNummer(const nr: WideString; 
                                                           const Name: WideString): WideString;
begin
    Result := DefaultInterface.CreateKontoNummer[nr, Name];
end;

{$ENDIF}

class function CoRwBuchungsstapel.Create: IRwBuchungsstapel;
begin
  Result := CreateComObject(CLASS_RwBuchungsstapel) as IRwBuchungsstapel;
end;

class function CoRwBuchungsstapel.CreateRemote(const MachineName: string): IRwBuchungsstapel;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_RwBuchungsstapel) as IRwBuchungsstapel;
end;

procedure TRwBuchungsstapel.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{0B53777D-6C38-11D2-ADF1-000083F3B333}';
    IntfIID:   '{0B53777C-6C38-11D2-ADF1-000083F3B333}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TRwBuchungsstapel.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IRwBuchungsstapel;
  end;
end;

procedure TRwBuchungsstapel.ConnectTo(svrIntf: IRwBuchungsstapel);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TRwBuchungsstapel.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TRwBuchungsstapel.GetDefaultInterface: IRwBuchungsstapel;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TRwBuchungsstapel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TRwBuchungsstapelProperties.Create(Self);
{$ENDIF}
end;

destructor TRwBuchungsstapel.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TRwBuchungsstapel.GetServerProperties: TRwBuchungsstapelProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TRwBuchungsstapel.Get_m_Name: WideString;
begin
    Result := DefaultInterface.m_Name;
end;

function TRwBuchungsstapel.Get_m_BuchungsDatum: TDateTime;
begin
    Result := DefaultInterface.m_BuchungsDatum;
end;

function TRwBuchungsstapel.Get_GetBuchung(pos: Integer): IRwBuchung;
begin
    Result := DefaultInterface.GetBuchung[pos];
end;

function TRwBuchungsstapel.Get_IsInPeriode(monat: SYSINT; jahr: SYSINT): Integer;
begin
    Result := DefaultInterface.IsInPeriode[monat, jahr];
end;

function TRwBuchungsstapel.Get_m_Erstellungsdatum: TDateTime;
begin
    Result := DefaultInterface.m_Erstellungsdatum;
end;

function TRwBuchungsstapel.Get_m_ObjectID: Integer;
begin
    Result := DefaultInterface.m_ObjectID;
end;

procedure TRwBuchungsstapel.Refresh;
begin
  DefaultInterface.Refresh;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TRwBuchungsstapelProperties.Create(AServer: TRwBuchungsstapel);
begin
  inherited Create;
  FServer := AServer;
end;

function TRwBuchungsstapelProperties.GetDefaultInterface: IRwBuchungsstapel;
begin
  Result := FServer.DefaultInterface;
end;

function TRwBuchungsstapelProperties.Get_m_Name: WideString;
begin
    Result := DefaultInterface.m_Name;
end;

function TRwBuchungsstapelProperties.Get_m_BuchungsDatum: TDateTime;
begin
    Result := DefaultInterface.m_BuchungsDatum;
end;

function TRwBuchungsstapelProperties.Get_GetBuchung(pos: Integer): IRwBuchung;
begin
    Result := DefaultInterface.GetBuchung[pos];
end;

function TRwBuchungsstapelProperties.Get_IsInPeriode(monat: SYSINT; jahr: SYSINT): Integer;
begin
    Result := DefaultInterface.IsInPeriode[monat, jahr];
end;

function TRwBuchungsstapelProperties.Get_m_Erstellungsdatum: TDateTime;
begin
    Result := DefaultInterface.m_Erstellungsdatum;
end;

function TRwBuchungsstapelProperties.Get_m_ObjectID: Integer;
begin
    Result := DefaultInterface.m_ObjectID;
end;

{$ENDIF}

class function CoRwBuchungsstapelWJ.Create: IRwBuchungsstapelWJ;
begin
  Result := CreateComObject(CLASS_RwBuchungsstapelWJ) as IRwBuchungsstapelWJ;
end;

class function CoRwBuchungsstapelWJ.CreateRemote(const MachineName: string): IRwBuchungsstapelWJ;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_RwBuchungsstapelWJ) as IRwBuchungsstapelWJ;
end;

procedure TRwBuchungsstapelWJ.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{0B537780-6C38-11D2-ADF1-000083F3B333}';
    IntfIID:   '{0B53777F-6C38-11D2-ADF1-000083F3B333}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TRwBuchungsstapelWJ.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IRwBuchungsstapelWJ;
  end;
end;

procedure TRwBuchungsstapelWJ.ConnectTo(svrIntf: IRwBuchungsstapelWJ);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TRwBuchungsstapelWJ.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TRwBuchungsstapelWJ.GetDefaultInterface: IRwBuchungsstapelWJ;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TRwBuchungsstapelWJ.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TRwBuchungsstapelWJProperties.Create(Self);
{$ENDIF}
end;

destructor TRwBuchungsstapelWJ.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TRwBuchungsstapelWJ.GetServerProperties: TRwBuchungsstapelWJProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TRwBuchungsstapelWJ.Get_Get(pos: Integer): IRwBuchungsstapel;
begin
    Result := DefaultInterface.Get[pos];
end;

function TRwBuchungsstapelWJ.Get_m_Journalisiert: Integer;
begin
    Result := DefaultInterface.m_Journalisiert;
end;

procedure TRwBuchungsstapelWJ.Set_m_Journalisiert(pVal: Integer);
begin
  DefaultInterface.Set_m_Journalisiert(pVal);
end;

procedure TRwBuchungsstapelWJ.AddBuchungsstapel(buchungsdatum: TDateTime; 
                                                const stapelname: WideString);
begin
  DefaultInterface.AddBuchungsstapel(buchungsdatum, stapelname);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TRwBuchungsstapelWJProperties.Create(AServer: TRwBuchungsstapelWJ);
begin
  inherited Create;
  FServer := AServer;
end;

function TRwBuchungsstapelWJProperties.GetDefaultInterface: IRwBuchungsstapelWJ;
begin
  Result := FServer.DefaultInterface;
end;

function TRwBuchungsstapelWJProperties.Get_Get(pos: Integer): IRwBuchungsstapel;
begin
    Result := DefaultInterface.Get[pos];
end;

function TRwBuchungsstapelWJProperties.Get_m_Journalisiert: Integer;
begin
    Result := DefaultInterface.m_Journalisiert;
end;

procedure TRwBuchungsstapelWJProperties.Set_m_Journalisiert(pVal: Integer);
begin
  DefaultInterface.Set_m_Journalisiert(pVal);
end;

{$ENDIF}

class function CoRwFibuKonto.Create: IRwFibuKonto;
begin
  Result := CreateComObject(CLASS_RwFibuKonto) as IRwFibuKonto;
end;

class function CoRwFibuKonto.CreateRemote(const MachineName: string): IRwFibuKonto;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_RwFibuKonto) as IRwFibuKonto;
end;

procedure TRwFibuKonto.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{5A938D24-EE56-11D2-AED9-000083F3B333}';
    IntfIID:   '{5A938D23-EE56-11D2-AED9-000083F3B333}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TRwFibuKonto.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IRwFibuKonto;
  end;
end;

procedure TRwFibuKonto.ConnectTo(svrIntf: IRwFibuKonto);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TRwFibuKonto.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TRwFibuKonto.GetDefaultInterface: IRwFibuKonto;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TRwFibuKonto.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TRwFibuKontoProperties.Create(Self);
{$ENDIF}
end;

destructor TRwFibuKonto.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TRwFibuKonto.GetServerProperties: TRwFibuKontoProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TRwFibuKonto.Get_m_KontoNr: WideString;
begin
    Result := DefaultInterface.m_KontoNr;
end;

function TRwFibuKonto.Get_m_Name: WideString;
begin
    Result := DefaultInterface.m_Name;
end;

function TRwFibuKonto.Get_IsSachkonto: Integer;
begin
    Result := DefaultInterface.IsSachkonto;
end;

function TRwFibuKonto.Get_IsDebitor: Integer;
begin
    Result := DefaultInterface.IsDebitor;
end;

function TRwFibuKonto.Get_IsKreditor: Integer;
begin
    Result := DefaultInterface.IsKreditor;
end;

function TRwFibuKonto.Get_GetGP: IAddGeschaeftspartner;
begin
    Result := DefaultInterface.GetGP;
end;

function TRwFibuKonto.Get_m_Kreditlimit: Currency;
begin
    Result := DefaultInterface.m_Kreditlimit;
end;

procedure TRwFibuKonto.Set_m_Kreditlimit(pVal: Currency);
begin
  DefaultInterface.Set_m_Kreditlimit(pVal);
end;

function TRwFibuKonto.Get_m_Saldo(periodeBis: Integer): Currency;
begin
    Result := DefaultInterface.m_Saldo[periodeBis];
end;

function TRwFibuKonto.Get_m_AB(periodeBis: Integer): Currency;
begin
    Result := DefaultInterface.m_AB[periodeBis];
end;

function TRwFibuKonto.Get_m_SaldoSoll(periodeBis: Integer): Currency;
begin
    Result := DefaultInterface.m_SaldoSoll[periodeBis];
end;

function TRwFibuKonto.Get_m_SaldoHaben(periodeBis: Integer): Currency;
begin
    Result := DefaultInterface.m_SaldoHaben[periodeBis];
end;

function TRwFibuKonto.Get_m_KreditlimitVersichert: Currency;
begin
    Result := DefaultInterface.m_KreditlimitVersichert;
end;

function TRwFibuKonto.Get_HasOPVerwaltung: Integer;
begin
    Result := DefaultInterface.HasOPVerwaltung;
end;

function TRwFibuKonto.Get_IsCPDKonto: Integer;
begin
    Result := DefaultInterface.IsCPDKonto;
end;

function TRwFibuKonto.Get_m_FreiesFeld(idx: SYSINT): WideString;
begin
    Result := DefaultInterface.m_FreiesFeld[idx];
end;

function TRwFibuKonto.Get_m_NameVersicherer: WideString;
begin
    Result := DefaultInterface.m_NameVersicherer;
end;

function TRwFibuKonto.Get_m_VersicherungsNr: WideString;
begin
    Result := DefaultInterface.m_VersicherungsNr;
end;

function TRwFibuKonto.Get_m_WarenUmsatz(periodeBis: Integer): Currency;
begin
    Result := DefaultInterface.m_WarenUmsatz[periodeBis];
end;

function TRwFibuKonto.Get_m_VerbandsNr: WideString;
begin
    Result := DefaultInterface.m_VerbandsNr;
end;

function TRwFibuKonto.Get_m_Verband: WideString;
begin
    Result := DefaultInterface.m_Verband;
end;

function TRwFibuKonto.Get_m_MitgliedsNr: WideString;
begin
    Result := DefaultInterface.m_MitgliedsNr;
end;

function TRwFibuKonto.Get_m_AZVDaten(const data: WideString): WideString;
begin
    Result := DefaultInterface.m_AZVDaten[data];
end;

function TRwFibuKonto.Get_m_ExternZV: Integer;
begin
    Result := DefaultInterface.m_ExternZV;
end;

function TRwFibuKonto.Get_m_pPersonenKontoData: IRwPersKontoData;
begin
    Result := DefaultInterface.m_pPersonenKontoData;
end;

function TRwFibuKonto.Get_m_Gesperrt: Byte;
begin
    Result := DefaultInterface.m_Gesperrt;
end;

function TRwFibuKonto.Get_m_Kontenart: WideString;
begin
    Result := DefaultInterface.m_Kontenart;
end;

procedure TRwFibuKonto.Refresh;
begin
  DefaultInterface.Refresh;
end;

procedure TRwFibuKonto.SetBuchungskreisSaldoAbfrage(buchungskreise: LongWord);
begin
  DefaultInterface.SetBuchungskreisSaldoAbfrage(buchungskreise);
end;

procedure TRwFibuKonto.SetBuchungskreis(const bukreis: IRwBuchungskreisTool);
begin
  DefaultInterface.SetBuchungskreis(bukreis);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TRwFibuKontoProperties.Create(AServer: TRwFibuKonto);
begin
  inherited Create;
  FServer := AServer;
end;

function TRwFibuKontoProperties.GetDefaultInterface: IRwFibuKonto;
begin
  Result := FServer.DefaultInterface;
end;

function TRwFibuKontoProperties.Get_m_KontoNr: WideString;
begin
    Result := DefaultInterface.m_KontoNr;
end;

function TRwFibuKontoProperties.Get_m_Name: WideString;
begin
    Result := DefaultInterface.m_Name;
end;

function TRwFibuKontoProperties.Get_IsSachkonto: Integer;
begin
    Result := DefaultInterface.IsSachkonto;
end;

function TRwFibuKontoProperties.Get_IsDebitor: Integer;
begin
    Result := DefaultInterface.IsDebitor;
end;

function TRwFibuKontoProperties.Get_IsKreditor: Integer;
begin
    Result := DefaultInterface.IsKreditor;
end;

function TRwFibuKontoProperties.Get_GetGP: IAddGeschaeftspartner;
begin
    Result := DefaultInterface.GetGP;
end;

function TRwFibuKontoProperties.Get_m_Kreditlimit: Currency;
begin
    Result := DefaultInterface.m_Kreditlimit;
end;

procedure TRwFibuKontoProperties.Set_m_Kreditlimit(pVal: Currency);
begin
  DefaultInterface.Set_m_Kreditlimit(pVal);
end;

function TRwFibuKontoProperties.Get_m_Saldo(periodeBis: Integer): Currency;
begin
    Result := DefaultInterface.m_Saldo[periodeBis];
end;

function TRwFibuKontoProperties.Get_m_AB(periodeBis: Integer): Currency;
begin
    Result := DefaultInterface.m_AB[periodeBis];
end;

function TRwFibuKontoProperties.Get_m_SaldoSoll(periodeBis: Integer): Currency;
begin
    Result := DefaultInterface.m_SaldoSoll[periodeBis];
end;

function TRwFibuKontoProperties.Get_m_SaldoHaben(periodeBis: Integer): Currency;
begin
    Result := DefaultInterface.m_SaldoHaben[periodeBis];
end;

function TRwFibuKontoProperties.Get_m_KreditlimitVersichert: Currency;
begin
    Result := DefaultInterface.m_KreditlimitVersichert;
end;

function TRwFibuKontoProperties.Get_HasOPVerwaltung: Integer;
begin
    Result := DefaultInterface.HasOPVerwaltung;
end;

function TRwFibuKontoProperties.Get_IsCPDKonto: Integer;
begin
    Result := DefaultInterface.IsCPDKonto;
end;

function TRwFibuKontoProperties.Get_m_FreiesFeld(idx: SYSINT): WideString;
begin
    Result := DefaultInterface.m_FreiesFeld[idx];
end;

function TRwFibuKontoProperties.Get_m_NameVersicherer: WideString;
begin
    Result := DefaultInterface.m_NameVersicherer;
end;

function TRwFibuKontoProperties.Get_m_VersicherungsNr: WideString;
begin
    Result := DefaultInterface.m_VersicherungsNr;
end;

function TRwFibuKontoProperties.Get_m_WarenUmsatz(periodeBis: Integer): Currency;
begin
    Result := DefaultInterface.m_WarenUmsatz[periodeBis];
end;

function TRwFibuKontoProperties.Get_m_VerbandsNr: WideString;
begin
    Result := DefaultInterface.m_VerbandsNr;
end;

function TRwFibuKontoProperties.Get_m_Verband: WideString;
begin
    Result := DefaultInterface.m_Verband;
end;

function TRwFibuKontoProperties.Get_m_MitgliedsNr: WideString;
begin
    Result := DefaultInterface.m_MitgliedsNr;
end;

function TRwFibuKontoProperties.Get_m_AZVDaten(const data: WideString): WideString;
begin
    Result := DefaultInterface.m_AZVDaten[data];
end;

function TRwFibuKontoProperties.Get_m_ExternZV: Integer;
begin
    Result := DefaultInterface.m_ExternZV;
end;

function TRwFibuKontoProperties.Get_m_pPersonenKontoData: IRwPersKontoData;
begin
    Result := DefaultInterface.m_pPersonenKontoData;
end;

function TRwFibuKontoProperties.Get_m_Gesperrt: Byte;
begin
    Result := DefaultInterface.m_Gesperrt;
end;

function TRwFibuKontoProperties.Get_m_Kontenart: WideString;
begin
    Result := DefaultInterface.m_Kontenart;
end;

{$ENDIF}

class function CoRwOPSuche.Create: IRwOPSuche;
begin
  Result := CreateComObject(CLASS_RwOPSuche) as IRwOPSuche;
end;

class function CoRwOPSuche.CreateRemote(const MachineName: string): IRwOPSuche;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_RwOPSuche) as IRwOPSuche;
end;

procedure TRwOPSuche.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{1BB5D6C7-F4AF-11D2-AEE7-000083F3B333}';
    IntfIID:   '{1BB5D6C6-F4AF-11D2-AEE7-000083F3B333}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TRwOPSuche.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IRwOPSuche;
  end;
end;

procedure TRwOPSuche.ConnectTo(svrIntf: IRwOPSuche);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TRwOPSuche.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TRwOPSuche.GetDefaultInterface: IRwOPSuche;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TRwOPSuche.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TRwOPSucheProperties.Create(Self);
{$ENDIF}
end;

destructor TRwOPSuche.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TRwOPSuche.GetServerProperties: TRwOPSucheProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TRwOPSuche.Get_Count: Smallint;
begin
    Result := DefaultInterface.Count;
end;

function TRwOPSuche.Get_Item(lIndex: Integer): OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Item[lIndex];
end;

function TRwOPSuche.Get_GetAt(pos: Integer): IRwOP;
begin
    Result := DefaultInterface.GetAt[pos];
end;

function TRwOPSuche.Get_m_AusgezifferterBereich: Integer;
begin
    Result := DefaultInterface.m_AusgezifferterBereich;
end;

procedure TRwOPSuche.Set_m_AusgezifferterBereich(pVal: Integer);
begin
  DefaultInterface.Set_m_AusgezifferterBereich(pVal);
end;

procedure TRwOPSuche.Refresh;
begin
  DefaultInterface.Refresh;
end;

procedure TRwOPSuche.SearchBelegNr(const kontonummer: WideString; const bnr: WideString);
begin
  DefaultInterface.SearchBelegNr(kontonummer, bnr);
end;

procedure TRwOPSuche.SearchBetrag(betrag: Currency);
begin
  DefaultInterface.SearchBetrag(betrag);
end;

procedure TRwOPSuche.SearchBelegNrAndDatum(const kontonummer: WideString; const bnr: WideString; 
                                           ausziffDatumVon: TDateTime; ausziffDatumBis: TDateTime);
begin
  DefaultInterface.SearchBelegNrAndDatum(kontonummer, bnr, ausziffDatumVon, ausziffDatumBis);
end;

procedure TRwOPSuche.SearchBelegNr2(const kontonummer: WideString; const belegnr: WideString);
begin
  DefaultInterface.SearchBelegNr2(kontonummer, belegnr);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TRwOPSucheProperties.Create(AServer: TRwOPSuche);
begin
  inherited Create;
  FServer := AServer;
end;

function TRwOPSucheProperties.GetDefaultInterface: IRwOPSuche;
begin
  Result := FServer.DefaultInterface;
end;

function TRwOPSucheProperties.Get_Count: Smallint;
begin
    Result := DefaultInterface.Count;
end;

function TRwOPSucheProperties.Get_Item(lIndex: Integer): OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Item[lIndex];
end;

function TRwOPSucheProperties.Get_GetAt(pos: Integer): IRwOP;
begin
    Result := DefaultInterface.GetAt[pos];
end;

function TRwOPSucheProperties.Get_m_AusgezifferterBereich: Integer;
begin
    Result := DefaultInterface.m_AusgezifferterBereich;
end;

procedure TRwOPSucheProperties.Set_m_AusgezifferterBereich(pVal: Integer);
begin
  DefaultInterface.Set_m_AusgezifferterBereich(pVal);
end;

{$ENDIF}

class function CoRwOP.Create: IRwOP;
begin
  Result := CreateComObject(CLASS_RwOP) as IRwOP;
end;

class function CoRwOP.CreateRemote(const MachineName: string): IRwOP;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_RwOP) as IRwOP;
end;

procedure TRwOP.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{1BB5D6CA-F4AF-11D2-AEE7-000083F3B333}';
    IntfIID:   '{1BB5D6C9-F4AF-11D2-AEE7-000083F3B333}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TRwOP.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IRwOP;
  end;
end;

procedure TRwOP.ConnectTo(svrIntf: IRwOP);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TRwOP.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TRwOP.GetDefaultInterface: IRwOP;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TRwOP.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TRwOPProperties.Create(Self);
{$ENDIF}
end;

destructor TRwOP.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TRwOP.GetServerProperties: TRwOPProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TRwOP.Get_m_BelegNr: WideString;
begin
    Result := DefaultInterface.m_BelegNr;
end;

function TRwOP.Get_m_BelegDatum: TDateTime;
begin
    Result := DefaultInterface.m_BelegDatum;
end;

function TRwOP.Get_m_BelegNr2: WideString;
begin
    Result := DefaultInterface.m_BelegNr2;
end;

function TRwOP.Get_m_Betrag: Currency;
begin
    Result := DefaultInterface.m_Betrag;
end;

function TRwOP.Get_m_NettoFaelligkeit: TDateTime;
begin
    Result := DefaultInterface.m_NettoFaelligkeit;
end;

function TRwOP.Get_m_NettoFaelligkeitEingabe: TDateTime;
begin
    Result := DefaultInterface.m_NettoFaelligkeitEingabe;
end;

function TRwOP.Get_m_WaehrungsID: Smallint;
begin
    Result := DefaultInterface.m_WaehrungsID;
end;

function TRwOP.Get_m_TransaktionsBetrag: Currency;
begin
    Result := DefaultInterface.m_TransaktionsBetrag;
end;

function TRwOP.Get_m_SkontoFaelligkeitStufe(stufe: Integer): TDateTime;
begin
    Result := DefaultInterface.m_SkontoFaelligkeitStufe[stufe];
end;

function TRwOP.Get_m_SkontoProzentSatzStufe(__MIDL_0019: Integer): Currency;
begin
    Result := DefaultInterface.m_SkontoProzentSatzStufe[__MIDL_0019];
end;

function TRwOP.Get_m_BuchungsDatum: TDateTime;
begin
    Result := DefaultInterface.m_BuchungsDatum;
end;

function TRwOP.Get_m_Buchungstext: WideString;
begin
    Result := DefaultInterface.m_Buchungstext;
end;

function TRwOP.Get_m_IsAbgestimmt: Integer;
begin
    Result := DefaultInterface.m_IsAbgestimmt;
end;

function TRwOP.Get_m_Konto: WideString;
begin
    Result := DefaultInterface.m_Konto;
end;

function TRwOP.Get_m_Gegenkonto: WideString;
begin
    Result := DefaultInterface.m_Gegenkonto;
end;

function TRwOP.Get_m_WaehrungsKurs: Currency;
begin
    Result := DefaultInterface.m_WaehrungsKurs;
end;

function TRwOP.Get_m_AbwSortierschluessel: Integer;
begin
    Result := DefaultInterface.m_AbwSortierschluessel;
end;

function TRwOP.Get_m_ZusatzAdresse: WideString;
begin
    Result := DefaultInterface.m_ZusatzAdresse;
end;

function TRwOP.Get_m_Mahnstufe: Integer;
begin
    Result := DefaultInterface.m_Mahnstufe;
end;

function TRwOP.Get_m_Auszifferungsdatum: TDateTime;
begin
    Result := DefaultInterface.m_Auszifferungsdatum;
end;

function TRwOP.Get_m_MahnStatus: WideString;
begin
    Result := DefaultInterface.m_MahnStatus;
end;

function TRwOP.Get_m_TageUeberfaellig(vglDatum: TDateTime): Integer;
begin
    Result := DefaultInterface.m_TageUeberfaellig[vglDatum];
end;

function TRwOP.Get_m_Kost1: WideString;
begin
    Result := DefaultInterface.m_Kost1;
end;

function TRwOP.Get_m_Kost2: WideString;
begin
    Result := DefaultInterface.m_Kost2;
end;

function TRwOP.Get_m_MahnStufeDatumPos(pos: Integer): TDateTime;
begin
    Result := DefaultInterface.m_MahnStufeDatumPos[pos];
end;

function TRwOP.Get_m_MahnStufePos(pos: Integer): Integer;
begin
    Result := DefaultInterface.m_MahnStufePos[pos];
end;

function TRwOP.Get_m_HighestBelegdatumAuszifferung: TDateTime;
begin
    Result := DefaultInterface.m_HighestBelegdatumAuszifferung;
end;

function TRwOP.Get_m_IsMahnungGesperrt: Integer;
begin
    Result := DefaultInterface.m_IsMahnungGesperrt;
end;

function TRwOP.Get_m_BezahltKennzeichen: Smallint;
begin
    Result := DefaultInterface.m_BezahltKennzeichen;
end;

procedure TRwOP.Set_m_BezahltKennzeichen(pVal: Smallint);
begin
  DefaultInterface.Set_m_BezahltKennzeichen(pVal);
end;

function TRwOP.Get_m_IsZahlung: Integer;
begin
    Result := DefaultInterface.m_IsZahlung;
end;

function TRwOP.Get_m_SkontoBetrag: Currency;
begin
    Result := DefaultInterface.m_SkontoBetrag;
end;

function TRwOP.Get_m_VerarbeitungsHinweis: WideString;
begin
    Result := DefaultInterface.m_VerarbeitungsHinweis;
end;

procedure TRwOP.Set_m_VerarbeitungsHinweis(const pVal: WideString);
  { Warning: The property m_VerarbeitungsHinweis has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.m_VerarbeitungsHinweis := pVal;
end;

function TRwOP.Get_m_ValutaDatum: TDateTime;
begin
    Result := DefaultInterface.m_ValutaDatum;
end;

procedure TRwOP.Set_m_ValutaDatum(pVal: TDateTime);
begin
  DefaultInterface.Set_m_ValutaDatum(pVal);
end;

function TRwOP.Get_m_FixeNettoFaelligkeit: TDateTime;
begin
    Result := DefaultInterface.m_FixeNettoFaelligkeit;
end;

procedure TRwOP.Set_m_FixeNettoFaelligkeit(pVal: TDateTime);
begin
  DefaultInterface.Set_m_FixeNettoFaelligkeit(pVal);
end;

function TRwOP.Get_m_BelegLink: WideString;
begin
    Result := DefaultInterface.m_BelegLink;
end;

procedure TRwOP.Set_m_BelegLink(const pVal: WideString);
  { Warning: The property m_BelegLink has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.m_BelegLink := pVal;
end;

function TRwOP.Get_m_NettoTage: Integer;
begin
    Result := DefaultInterface.m_NettoTage;
end;

function TRwOP.Get_m_SkontoTage(stufe: Integer): Integer;
begin
    Result := DefaultInterface.m_SkontoTage[stufe];
end;

function TRwOP.Get_m_SteuerProzentsatz: Double;
begin
    Result := DefaultInterface.m_SteuerProzentsatz;
end;

function TRwOP.Get_m_Steuerart: WideString;
begin
    Result := DefaultInterface.m_Steuerart;
end;

function TRwOP.Get_GetBuchung: IRwBuchung;
begin
    Result := DefaultInterface.GetBuchung;
end;

function TRwOP.Get_m_ObjectID: WideString;
begin
    Result := DefaultInterface.m_ObjectID;
end;

function TRwOP.Get_GetZahldauer(out pVal2: TDateTime): Integer;
begin
    Result := DefaultInterface.GetZahldauer[pVal2];
end;

function TRwOP.Get_m_FreigabeMahnung: Integer;
begin
    Result := DefaultInterface.m_FreigabeMahnung;
end;

procedure TRwOP.SetCPDDaten(const Name: WideString; const branche: WideString; 
                            const strasse: WideString; const land: WideString; 
                            const plz: WideString; const ort: WideString; const blz: WideString; 
                            const konto: WideString);
begin
  DefaultInterface.SetCPDDaten(Name, branche, strasse, land, plz, ort, blz, konto);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TRwOPProperties.Create(AServer: TRwOP);
begin
  inherited Create;
  FServer := AServer;
end;

function TRwOPProperties.GetDefaultInterface: IRwOP;
begin
  Result := FServer.DefaultInterface;
end;

function TRwOPProperties.Get_m_BelegNr: WideString;
begin
    Result := DefaultInterface.m_BelegNr;
end;

function TRwOPProperties.Get_m_BelegDatum: TDateTime;
begin
    Result := DefaultInterface.m_BelegDatum;
end;

function TRwOPProperties.Get_m_BelegNr2: WideString;
begin
    Result := DefaultInterface.m_BelegNr2;
end;

function TRwOPProperties.Get_m_Betrag: Currency;
begin
    Result := DefaultInterface.m_Betrag;
end;

function TRwOPProperties.Get_m_NettoFaelligkeit: TDateTime;
begin
    Result := DefaultInterface.m_NettoFaelligkeit;
end;

function TRwOPProperties.Get_m_NettoFaelligkeitEingabe: TDateTime;
begin
    Result := DefaultInterface.m_NettoFaelligkeitEingabe;
end;

function TRwOPProperties.Get_m_WaehrungsID: Smallint;
begin
    Result := DefaultInterface.m_WaehrungsID;
end;

function TRwOPProperties.Get_m_TransaktionsBetrag: Currency;
begin
    Result := DefaultInterface.m_TransaktionsBetrag;
end;

function TRwOPProperties.Get_m_SkontoFaelligkeitStufe(stufe: Integer): TDateTime;
begin
    Result := DefaultInterface.m_SkontoFaelligkeitStufe[stufe];
end;

function TRwOPProperties.Get_m_SkontoProzentSatzStufe(__MIDL_0019: Integer): Currency;
begin
    Result := DefaultInterface.m_SkontoProzentSatzStufe[__MIDL_0019];
end;

function TRwOPProperties.Get_m_BuchungsDatum: TDateTime;
begin
    Result := DefaultInterface.m_BuchungsDatum;
end;

function TRwOPProperties.Get_m_Buchungstext: WideString;
begin
    Result := DefaultInterface.m_Buchungstext;
end;

function TRwOPProperties.Get_m_IsAbgestimmt: Integer;
begin
    Result := DefaultInterface.m_IsAbgestimmt;
end;

function TRwOPProperties.Get_m_Konto: WideString;
begin
    Result := DefaultInterface.m_Konto;
end;

function TRwOPProperties.Get_m_Gegenkonto: WideString;
begin
    Result := DefaultInterface.m_Gegenkonto;
end;

function TRwOPProperties.Get_m_WaehrungsKurs: Currency;
begin
    Result := DefaultInterface.m_WaehrungsKurs;
end;

function TRwOPProperties.Get_m_AbwSortierschluessel: Integer;
begin
    Result := DefaultInterface.m_AbwSortierschluessel;
end;

function TRwOPProperties.Get_m_ZusatzAdresse: WideString;
begin
    Result := DefaultInterface.m_ZusatzAdresse;
end;

function TRwOPProperties.Get_m_Mahnstufe: Integer;
begin
    Result := DefaultInterface.m_Mahnstufe;
end;

function TRwOPProperties.Get_m_Auszifferungsdatum: TDateTime;
begin
    Result := DefaultInterface.m_Auszifferungsdatum;
end;

function TRwOPProperties.Get_m_MahnStatus: WideString;
begin
    Result := DefaultInterface.m_MahnStatus;
end;

function TRwOPProperties.Get_m_TageUeberfaellig(vglDatum: TDateTime): Integer;
begin
    Result := DefaultInterface.m_TageUeberfaellig[vglDatum];
end;

function TRwOPProperties.Get_m_Kost1: WideString;
begin
    Result := DefaultInterface.m_Kost1;
end;

function TRwOPProperties.Get_m_Kost2: WideString;
begin
    Result := DefaultInterface.m_Kost2;
end;

function TRwOPProperties.Get_m_MahnStufeDatumPos(pos: Integer): TDateTime;
begin
    Result := DefaultInterface.m_MahnStufeDatumPos[pos];
end;

function TRwOPProperties.Get_m_MahnStufePos(pos: Integer): Integer;
begin
    Result := DefaultInterface.m_MahnStufePos[pos];
end;

function TRwOPProperties.Get_m_HighestBelegdatumAuszifferung: TDateTime;
begin
    Result := DefaultInterface.m_HighestBelegdatumAuszifferung;
end;

function TRwOPProperties.Get_m_IsMahnungGesperrt: Integer;
begin
    Result := DefaultInterface.m_IsMahnungGesperrt;
end;

function TRwOPProperties.Get_m_BezahltKennzeichen: Smallint;
begin
    Result := DefaultInterface.m_BezahltKennzeichen;
end;

procedure TRwOPProperties.Set_m_BezahltKennzeichen(pVal: Smallint);
begin
  DefaultInterface.Set_m_BezahltKennzeichen(pVal);
end;

function TRwOPProperties.Get_m_IsZahlung: Integer;
begin
    Result := DefaultInterface.m_IsZahlung;
end;

function TRwOPProperties.Get_m_SkontoBetrag: Currency;
begin
    Result := DefaultInterface.m_SkontoBetrag;
end;

function TRwOPProperties.Get_m_VerarbeitungsHinweis: WideString;
begin
    Result := DefaultInterface.m_VerarbeitungsHinweis;
end;

procedure TRwOPProperties.Set_m_VerarbeitungsHinweis(const pVal: WideString);
  { Warning: The property m_VerarbeitungsHinweis has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.m_VerarbeitungsHinweis := pVal;
end;

function TRwOPProperties.Get_m_ValutaDatum: TDateTime;
begin
    Result := DefaultInterface.m_ValutaDatum;
end;

procedure TRwOPProperties.Set_m_ValutaDatum(pVal: TDateTime);
begin
  DefaultInterface.Set_m_ValutaDatum(pVal);
end;

function TRwOPProperties.Get_m_FixeNettoFaelligkeit: TDateTime;
begin
    Result := DefaultInterface.m_FixeNettoFaelligkeit;
end;

procedure TRwOPProperties.Set_m_FixeNettoFaelligkeit(pVal: TDateTime);
begin
  DefaultInterface.Set_m_FixeNettoFaelligkeit(pVal);
end;

function TRwOPProperties.Get_m_BelegLink: WideString;
begin
    Result := DefaultInterface.m_BelegLink;
end;

procedure TRwOPProperties.Set_m_BelegLink(const pVal: WideString);
  { Warning: The property m_BelegLink has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.m_BelegLink := pVal;
end;

function TRwOPProperties.Get_m_NettoTage: Integer;
begin
    Result := DefaultInterface.m_NettoTage;
end;

function TRwOPProperties.Get_m_SkontoTage(stufe: Integer): Integer;
begin
    Result := DefaultInterface.m_SkontoTage[stufe];
end;

function TRwOPProperties.Get_m_SteuerProzentsatz: Double;
begin
    Result := DefaultInterface.m_SteuerProzentsatz;
end;

function TRwOPProperties.Get_m_Steuerart: WideString;
begin
    Result := DefaultInterface.m_Steuerart;
end;

function TRwOPProperties.Get_GetBuchung: IRwBuchung;
begin
    Result := DefaultInterface.GetBuchung;
end;

function TRwOPProperties.Get_m_ObjectID: WideString;
begin
    Result := DefaultInterface.m_ObjectID;
end;

function TRwOPProperties.Get_GetZahldauer(out pVal2: TDateTime): Integer;
begin
    Result := DefaultInterface.GetZahldauer[pVal2];
end;

function TRwOPProperties.Get_m_FreigabeMahnung: Integer;
begin
    Result := DefaultInterface.m_FreigabeMahnung;
end;

{$ENDIF}

procedure TRwBuchungsImport.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{1BB5D6CD-F4AF-11D2-AEE7-000083F3B333}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80004002*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TRwBuchungsImport.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IRwBuchungsImport;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TRwBuchungsImport.GetControlInterface: IRwBuchungsImport;
begin
  CreateControl;
  Result := FIntf;
end;

function TRwBuchungsImport.Get_StartImport(MandantNr: Integer; const strDateiname: WideString): Integer;
begin
    Result := DefaultInterface.StartImport[MandantNr, strDateiname];
end;

function TRwBuchungsImport.Get_FirstErrorDescription(out str_Format: WideString; out l_SG: Integer): WideString;
begin
    Result := DefaultInterface.FirstErrorDescription[str_Format, l_SG];
end;

function TRwBuchungsImport.Get_NextErrorDescription(out str_Format: WideString; out l_SG: Integer): WideString;
begin
    Result := DefaultInterface.NextErrorDescription[str_Format, l_SG];
end;

class function CoRwKontenblatt.Create: IRwKontenblatt;
begin
  Result := CreateComObject(CLASS_RwKontenblatt) as IRwKontenblatt;
end;

class function CoRwKontenblatt.CreateRemote(const MachineName: string): IRwKontenblatt;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_RwKontenblatt) as IRwKontenblatt;
end;

procedure TRwKontenblatt.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{4732F80D-4C21-45EF-982F-FC56376C73E3}';
    IntfIID:   '{BA0AFD76-60F7-4C8B-B2C8-083E39D6BFF6}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TRwKontenblatt.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IRwKontenblatt;
  end;
end;

procedure TRwKontenblatt.ConnectTo(svrIntf: IRwKontenblatt);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TRwKontenblatt.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TRwKontenblatt.GetDefaultInterface: IRwKontenblatt;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TRwKontenblatt.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TRwKontenblattProperties.Create(Self);
{$ENDIF}
end;

destructor TRwKontenblatt.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TRwKontenblatt.GetServerProperties: TRwKontenblattProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TRwKontenblatt.Get_Seek(pos: Integer): Integer;
begin
    Result := DefaultInterface.Seek[pos];
end;

function TRwKontenblatt.Get_IsCPD: Integer;
begin
    Result := DefaultInterface.IsCPD;
end;

function TRwKontenblatt.Get_m_CPDName: WideString;
begin
    Result := DefaultInterface.m_CPDName;
end;

function TRwKontenblatt.Get_m_CPDBranche: WideString;
begin
    Result := DefaultInterface.m_CPDBranche;
end;

function TRwKontenblatt.Get_m_CPDStrasse: WideString;
begin
    Result := DefaultInterface.m_CPDStrasse;
end;

function TRwKontenblatt.Get_m_CPDPLZ: WideString;
begin
    Result := DefaultInterface.m_CPDPLZ;
end;

function TRwKontenblatt.Get_m_CPDOrt: WideString;
begin
    Result := DefaultInterface.m_CPDOrt;
end;

function TRwKontenblatt.Get_m_CPDLand: WideString;
begin
    Result := DefaultInterface.m_CPDLand;
end;

function TRwKontenblatt.Get_m_CPDKonto: WideString;
begin
    Result := DefaultInterface.m_CPDKonto;
end;

function TRwKontenblatt.Get_m_CPDBLZ: WideString;
begin
    Result := DefaultInterface.m_CPDBLZ;
end;

function TRwKontenblatt.Get_m_BankName: WideString;
begin
    Result := DefaultInterface.m_BankName;
end;

function TRwKontenblatt.Get_m_BuchungsSchluessel: WideString;
begin
    Result := DefaultInterface.m_BuchungsSchluessel;
end;

function TRwKontenblatt.Get_m_BuchungsDatum: TDateTime;
begin
    Result := DefaultInterface.m_BuchungsDatum;
end;

function TRwKontenblatt.Get_m_BelegDatum: TDateTime;
begin
    Result := DefaultInterface.m_BelegDatum;
end;

function TRwKontenblatt.Get_m_BelegNr: WideString;
begin
    Result := DefaultInterface.m_BelegNr;
end;

function TRwKontenblatt.Get_m_BelegNr2: WideString;
begin
    Result := DefaultInterface.m_BelegNr2;
end;

function TRwKontenblatt.Get_m_Konto: WideString;
begin
    Result := DefaultInterface.m_Konto;
end;

function TRwKontenblatt.Get_m_Gegenkonto: WideString;
begin
    Result := DefaultInterface.m_Gegenkonto;
end;

function TRwKontenblatt.Get_m_Betrag: Currency;
begin
    Result := DefaultInterface.m_Betrag;
end;

function TRwKontenblatt.Get_m_TransaktionsBetrag: Currency;
begin
    Result := DefaultInterface.m_TransaktionsBetrag;
end;

function TRwKontenblatt.Get_m_Kurs: Double;
begin
    Result := DefaultInterface.m_Kurs;
end;

function TRwKontenblatt.Get_WaehrungISO: WideString;
begin
    Result := DefaultInterface.WaehrungISO;
end;

function TRwKontenblatt.Get_m_WaehrungKuerzel: WideString;
begin
    Result := DefaultInterface.m_WaehrungKuerzel;
end;

function TRwKontenblatt.Get_m_WaehrungID: WideString;
begin
    Result := DefaultInterface.m_WaehrungID;
end;

function TRwKontenblatt.Get_m_AbwSortierschluessel: WideString;
begin
    Result := DefaultInterface.m_AbwSortierschluessel;
end;

function TRwKontenblatt.Get_m_FilialNr: WideString;
begin
    Result := DefaultInterface.m_FilialNr;
end;

function TRwKontenblatt.Get_m_Steuerschluessel: WideString;
begin
    Result := DefaultInterface.m_Steuerschluessel;
end;

function TRwKontenblatt.Get_m_Buchungstext: WideString;
begin
    Result := DefaultInterface.m_Buchungstext;
end;

function TRwKontenblatt.Get_m_Kost1: WideString;
begin
    Result := DefaultInterface.m_Kost1;
end;

function TRwKontenblatt.Get_m_Kost2: WideString;
begin
    Result := DefaultInterface.m_Kost2;
end;

function TRwKontenblatt.Get_m_Menge: Currency;
begin
    Result := DefaultInterface.m_Menge;
end;

function TRwKontenblatt.Get_m_Zahlungskondition: WideString;
begin
    Result := DefaultInterface.m_Zahlungskondition;
end;

function TRwKontenblatt.Get_m_Zahlungsart: WideString;
begin
    Result := DefaultInterface.m_Zahlungsart;
end;

function TRwKontenblatt.Get_m_IsJournalisiert: Integer;
begin
    Result := DefaultInterface.m_IsJournalisiert;
end;

function TRwKontenblatt.Get_m_JournalSeite: Integer;
begin
    Result := DefaultInterface.m_JournalSeite;
end;

function TRwKontenblatt.Get_m_IsVerdichtet: Integer;
begin
    Result := DefaultInterface.m_IsVerdichtet;
end;

function TRwKontenblatt.Get_m_IsAbgestimmt: Integer;
begin
    Result := DefaultInterface.m_IsAbgestimmt;
end;

procedure TRwKontenblatt.Set_m_IsAbgestimmt(pVal: Integer);
begin
  DefaultInterface.Set_m_IsAbgestimmt(pVal);
end;

function TRwKontenblatt.Get_m_IsABBuchung: Integer;
begin
    Result := DefaultInterface.m_IsABBuchung;
end;

function TRwKontenblatt.Get_IsStornoBuchung: Integer;
begin
    Result := DefaultInterface.IsStornoBuchung;
end;

function TRwKontenblatt.Get_m_KontierzeileBelegNr2: WideString;
begin
    Result := DefaultInterface.m_KontierzeileBelegNr2;
end;

function TRwKontenblatt.Get_ExpandVerdichtung: Integer;
begin
    Result := DefaultInterface.ExpandVerdichtung;
end;

procedure TRwKontenblatt.Set_ExpandVerdichtung(pVal: Integer);
begin
  DefaultInterface.Set_ExpandVerdichtung(pVal);
end;

function TRwKontenblatt.Get_GetBuchung: IRwBuchung;
begin
    Result := DefaultInterface.GetBuchung;
end;

function TRwKontenblatt.Get_m_Buchungsmonat: Smallint;
begin
    Result := DefaultInterface.m_Buchungsmonat;
end;

function TRwKontenblatt.Get_m_Buchungsjahr: Smallint;
begin
    Result := DefaultInterface.m_Buchungsjahr;
end;

function TRwKontenblatt.Get_KontierzInfo(const sKey: WideString): WideString;
begin
    Result := DefaultInterface.KontierzInfo[sKey];
end;

function TRwKontenblatt.Get_m_Buchungskreis: Integer;
begin
    Result := DefaultInterface.m_Buchungskreis;
end;

procedure TRwKontenblatt.LoadBuchungen(mandant: Integer; const konto: WideString; wj: TDateTime; 
                                       periodevon: SYSINT; periodeBis: SYSINT);
begin
  DefaultInterface.LoadBuchungen(mandant, konto, wj, periodevon, periodeBis);
end;

procedure TRwKontenblatt.Setm_KontierzeileBelegNr2(const bnr: WideString);
begin
  DefaultInterface.Setm_KontierzeileBelegNr2(bnr);
end;

procedure TRwKontenblatt.SetBuchungskreis(buchungskreis: LongWord);
begin
  DefaultInterface.SetBuchungskreis(buchungskreis);
end;

procedure TRwKontenblatt.SetBuchungskreisTool(const bukreis: IRwBuchungskreisTool);
begin
  DefaultInterface.SetBuchungskreisTool(bukreis);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TRwKontenblattProperties.Create(AServer: TRwKontenblatt);
begin
  inherited Create;
  FServer := AServer;
end;

function TRwKontenblattProperties.GetDefaultInterface: IRwKontenblatt;
begin
  Result := FServer.DefaultInterface;
end;

function TRwKontenblattProperties.Get_Seek(pos: Integer): Integer;
begin
    Result := DefaultInterface.Seek[pos];
end;

function TRwKontenblattProperties.Get_IsCPD: Integer;
begin
    Result := DefaultInterface.IsCPD;
end;

function TRwKontenblattProperties.Get_m_CPDName: WideString;
begin
    Result := DefaultInterface.m_CPDName;
end;

function TRwKontenblattProperties.Get_m_CPDBranche: WideString;
begin
    Result := DefaultInterface.m_CPDBranche;
end;

function TRwKontenblattProperties.Get_m_CPDStrasse: WideString;
begin
    Result := DefaultInterface.m_CPDStrasse;
end;

function TRwKontenblattProperties.Get_m_CPDPLZ: WideString;
begin
    Result := DefaultInterface.m_CPDPLZ;
end;

function TRwKontenblattProperties.Get_m_CPDOrt: WideString;
begin
    Result := DefaultInterface.m_CPDOrt;
end;

function TRwKontenblattProperties.Get_m_CPDLand: WideString;
begin
    Result := DefaultInterface.m_CPDLand;
end;

function TRwKontenblattProperties.Get_m_CPDKonto: WideString;
begin
    Result := DefaultInterface.m_CPDKonto;
end;

function TRwKontenblattProperties.Get_m_CPDBLZ: WideString;
begin
    Result := DefaultInterface.m_CPDBLZ;
end;

function TRwKontenblattProperties.Get_m_BankName: WideString;
begin
    Result := DefaultInterface.m_BankName;
end;

function TRwKontenblattProperties.Get_m_BuchungsSchluessel: WideString;
begin
    Result := DefaultInterface.m_BuchungsSchluessel;
end;

function TRwKontenblattProperties.Get_m_BuchungsDatum: TDateTime;
begin
    Result := DefaultInterface.m_BuchungsDatum;
end;

function TRwKontenblattProperties.Get_m_BelegDatum: TDateTime;
begin
    Result := DefaultInterface.m_BelegDatum;
end;

function TRwKontenblattProperties.Get_m_BelegNr: WideString;
begin
    Result := DefaultInterface.m_BelegNr;
end;

function TRwKontenblattProperties.Get_m_BelegNr2: WideString;
begin
    Result := DefaultInterface.m_BelegNr2;
end;

function TRwKontenblattProperties.Get_m_Konto: WideString;
begin
    Result := DefaultInterface.m_Konto;
end;

function TRwKontenblattProperties.Get_m_Gegenkonto: WideString;
begin
    Result := DefaultInterface.m_Gegenkonto;
end;

function TRwKontenblattProperties.Get_m_Betrag: Currency;
begin
    Result := DefaultInterface.m_Betrag;
end;

function TRwKontenblattProperties.Get_m_TransaktionsBetrag: Currency;
begin
    Result := DefaultInterface.m_TransaktionsBetrag;
end;

function TRwKontenblattProperties.Get_m_Kurs: Double;
begin
    Result := DefaultInterface.m_Kurs;
end;

function TRwKontenblattProperties.Get_WaehrungISO: WideString;
begin
    Result := DefaultInterface.WaehrungISO;
end;

function TRwKontenblattProperties.Get_m_WaehrungKuerzel: WideString;
begin
    Result := DefaultInterface.m_WaehrungKuerzel;
end;

function TRwKontenblattProperties.Get_m_WaehrungID: WideString;
begin
    Result := DefaultInterface.m_WaehrungID;
end;

function TRwKontenblattProperties.Get_m_AbwSortierschluessel: WideString;
begin
    Result := DefaultInterface.m_AbwSortierschluessel;
end;

function TRwKontenblattProperties.Get_m_FilialNr: WideString;
begin
    Result := DefaultInterface.m_FilialNr;
end;

function TRwKontenblattProperties.Get_m_Steuerschluessel: WideString;
begin
    Result := DefaultInterface.m_Steuerschluessel;
end;

function TRwKontenblattProperties.Get_m_Buchungstext: WideString;
begin
    Result := DefaultInterface.m_Buchungstext;
end;

function TRwKontenblattProperties.Get_m_Kost1: WideString;
begin
    Result := DefaultInterface.m_Kost1;
end;

function TRwKontenblattProperties.Get_m_Kost2: WideString;
begin
    Result := DefaultInterface.m_Kost2;
end;

function TRwKontenblattProperties.Get_m_Menge: Currency;
begin
    Result := DefaultInterface.m_Menge;
end;

function TRwKontenblattProperties.Get_m_Zahlungskondition: WideString;
begin
    Result := DefaultInterface.m_Zahlungskondition;
end;

function TRwKontenblattProperties.Get_m_Zahlungsart: WideString;
begin
    Result := DefaultInterface.m_Zahlungsart;
end;

function TRwKontenblattProperties.Get_m_IsJournalisiert: Integer;
begin
    Result := DefaultInterface.m_IsJournalisiert;
end;

function TRwKontenblattProperties.Get_m_JournalSeite: Integer;
begin
    Result := DefaultInterface.m_JournalSeite;
end;

function TRwKontenblattProperties.Get_m_IsVerdichtet: Integer;
begin
    Result := DefaultInterface.m_IsVerdichtet;
end;

function TRwKontenblattProperties.Get_m_IsAbgestimmt: Integer;
begin
    Result := DefaultInterface.m_IsAbgestimmt;
end;

procedure TRwKontenblattProperties.Set_m_IsAbgestimmt(pVal: Integer);
begin
  DefaultInterface.Set_m_IsAbgestimmt(pVal);
end;

function TRwKontenblattProperties.Get_m_IsABBuchung: Integer;
begin
    Result := DefaultInterface.m_IsABBuchung;
end;

function TRwKontenblattProperties.Get_IsStornoBuchung: Integer;
begin
    Result := DefaultInterface.IsStornoBuchung;
end;

function TRwKontenblattProperties.Get_m_KontierzeileBelegNr2: WideString;
begin
    Result := DefaultInterface.m_KontierzeileBelegNr2;
end;

function TRwKontenblattProperties.Get_ExpandVerdichtung: Integer;
begin
    Result := DefaultInterface.ExpandVerdichtung;
end;

procedure TRwKontenblattProperties.Set_ExpandVerdichtung(pVal: Integer);
begin
  DefaultInterface.Set_ExpandVerdichtung(pVal);
end;

function TRwKontenblattProperties.Get_GetBuchung: IRwBuchung;
begin
    Result := DefaultInterface.GetBuchung;
end;

function TRwKontenblattProperties.Get_m_Buchungsmonat: Smallint;
begin
    Result := DefaultInterface.m_Buchungsmonat;
end;

function TRwKontenblattProperties.Get_m_Buchungsjahr: Smallint;
begin
    Result := DefaultInterface.m_Buchungsjahr;
end;

function TRwKontenblattProperties.Get_KontierzInfo(const sKey: WideString): WideString;
begin
    Result := DefaultInterface.KontierzInfo[sKey];
end;

function TRwKontenblattProperties.Get_m_Buchungskreis: Integer;
begin
    Result := DefaultInterface.m_Buchungskreis;
end;

{$ENDIF}

class function CoRwBuchung.Create: IRwBuchung;
begin
  Result := CreateComObject(CLASS_RwBuchung) as IRwBuchung;
end;

class function CoRwBuchung.CreateRemote(const MachineName: string): IRwBuchung;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_RwBuchung) as IRwBuchung;
end;

procedure TRwBuchung.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{36C1465A-9875-452A-8D9A-23E24EBE0930}';
    IntfIID:   '{F838BBE8-576A-4AC3-9358-C1CBD53F791E}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TRwBuchung.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IRwBuchung;
  end;
end;

procedure TRwBuchung.ConnectTo(svrIntf: IRwBuchung);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TRwBuchung.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TRwBuchung.GetDefaultInterface: IRwBuchung;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TRwBuchung.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TRwBuchungProperties.Create(Self);
{$ENDIF}
end;

destructor TRwBuchung.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TRwBuchung.GetServerProperties: TRwBuchungProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TRwBuchung.Get_m_isAutomatik: Integer;
begin
    Result := DefaultInterface.m_isAutomatik;
end;

function TRwBuchung.Get_m_IsEingabe: Integer;
begin
    Result := DefaultInterface.m_IsEingabe;
end;

function TRwBuchung.Get_m_Konto: WideString;
begin
    Result := DefaultInterface.m_Konto;
end;

function TRwBuchung.Get_m_Gegenkonto: WideString;
begin
    Result := DefaultInterface.m_Gegenkonto;
end;

function TRwBuchung.Get_m_Betrag: Currency;
begin
    Result := DefaultInterface.m_Betrag;
end;

function TRwBuchung.Get_m_Steuerbetrag: Currency;
begin
    Result := DefaultInterface.m_Steuerbetrag;
end;

function TRwBuchung.Get_m_Steuerschluessel: WideString;
begin
    Result := DefaultInterface.m_Steuerschluessel;
end;

function TRwBuchung.Get_m_SteuerProzentsatz: Double;
begin
    Result := DefaultInterface.m_SteuerProzentsatz;
end;

function TRwBuchung.Get_m_Buchungstext: WideString;
begin
    Result := DefaultInterface.m_Buchungstext;
end;

function TRwBuchung.Get_m_Belegnummer1: WideString;
begin
    Result := DefaultInterface.m_Belegnummer1;
end;

function TRwBuchung.Get_m_Belegnummer2: WideString;
begin
    Result := DefaultInterface.m_Belegnummer2;
end;

function TRwBuchung.Get_m_Belegnummer2Eingabe: WideString;
begin
    Result := DefaultInterface.m_Belegnummer2Eingabe;
end;

procedure TRwBuchung.Set_m_Belegnummer2Eingabe(const pVal: WideString);
  { Warning: The property m_Belegnummer2Eingabe has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.m_Belegnummer2Eingabe := pVal;
end;

function TRwBuchung.Get_m_Buchungsnr: Integer;
begin
    Result := DefaultInterface.m_Buchungsnr;
end;

function TRwBuchung.Get_m_Kost1: WideString;
begin
    Result := DefaultInterface.m_Kost1;
end;

function TRwBuchung.Get_m_Kost2: WideString;
begin
    Result := DefaultInterface.m_Kost2;
end;

function TRwBuchung.Get_m_BelegDatum: TDateTime;
begin
    Result := DefaultInterface.m_BelegDatum;
end;

function TRwBuchung.Get_m_IsValidPos: Integer;
begin
    Result := DefaultInterface.m_IsValidPos;
end;

function TRwBuchung.Get_IsWaehrung(const waehrungsKuerzel: WideString): Integer;
begin
    Result := DefaultInterface.IsWaehrung[waehrungsKuerzel];
end;

function TRwBuchung.Get_m_Waehrung: WideString;
begin
    Result := DefaultInterface.m_Waehrung;
end;

function TRwBuchung.Get_m_TransaktionsBetrag: Currency;
begin
    Result := DefaultInterface.m_TransaktionsBetrag;
end;

function TRwBuchung.Get_m_FreiesFeld(nummer: Integer): WideString;
begin
    Result := DefaultInterface.m_FreiesFeld[nummer];
end;

function TRwBuchung.Get_m_Erfassungsdatum: TDateTime;
begin
    Result := DefaultInterface.m_Erfassungsdatum;
end;

procedure TRwBuchung.SeekKontierZeile(pos: Integer);
begin
  DefaultInterface.SeekKontierZeile(pos);
end;

procedure TRwBuchung.SplitBetraege(const waehrung: WideString; var bruttobetrag: Double; 
                                   var stsl1: WideString; var betrag1: Currency; 
                                   var stsl2: WideString; var betrag2: Currency; 
                                   var stsl3: WideString; var betrag3: Currency);
begin
  DefaultInterface.SplitBetraege(waehrung, bruttobetrag, stsl1, betrag1, stsl2, betrag2, stsl3, 
                                 betrag3);
end;

procedure TRwBuchung.Refresh;
begin
  DefaultInterface.Refresh;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TRwBuchungProperties.Create(AServer: TRwBuchung);
begin
  inherited Create;
  FServer := AServer;
end;

function TRwBuchungProperties.GetDefaultInterface: IRwBuchung;
begin
  Result := FServer.DefaultInterface;
end;

function TRwBuchungProperties.Get_m_isAutomatik: Integer;
begin
    Result := DefaultInterface.m_isAutomatik;
end;

function TRwBuchungProperties.Get_m_IsEingabe: Integer;
begin
    Result := DefaultInterface.m_IsEingabe;
end;

function TRwBuchungProperties.Get_m_Konto: WideString;
begin
    Result := DefaultInterface.m_Konto;
end;

function TRwBuchungProperties.Get_m_Gegenkonto: WideString;
begin
    Result := DefaultInterface.m_Gegenkonto;
end;

function TRwBuchungProperties.Get_m_Betrag: Currency;
begin
    Result := DefaultInterface.m_Betrag;
end;

function TRwBuchungProperties.Get_m_Steuerbetrag: Currency;
begin
    Result := DefaultInterface.m_Steuerbetrag;
end;

function TRwBuchungProperties.Get_m_Steuerschluessel: WideString;
begin
    Result := DefaultInterface.m_Steuerschluessel;
end;

function TRwBuchungProperties.Get_m_SteuerProzentsatz: Double;
begin
    Result := DefaultInterface.m_SteuerProzentsatz;
end;

function TRwBuchungProperties.Get_m_Buchungstext: WideString;
begin
    Result := DefaultInterface.m_Buchungstext;
end;

function TRwBuchungProperties.Get_m_Belegnummer1: WideString;
begin
    Result := DefaultInterface.m_Belegnummer1;
end;

function TRwBuchungProperties.Get_m_Belegnummer2: WideString;
begin
    Result := DefaultInterface.m_Belegnummer2;
end;

function TRwBuchungProperties.Get_m_Belegnummer2Eingabe: WideString;
begin
    Result := DefaultInterface.m_Belegnummer2Eingabe;
end;

procedure TRwBuchungProperties.Set_m_Belegnummer2Eingabe(const pVal: WideString);
  { Warning: The property m_Belegnummer2Eingabe has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.m_Belegnummer2Eingabe := pVal;
end;

function TRwBuchungProperties.Get_m_Buchungsnr: Integer;
begin
    Result := DefaultInterface.m_Buchungsnr;
end;

function TRwBuchungProperties.Get_m_Kost1: WideString;
begin
    Result := DefaultInterface.m_Kost1;
end;

function TRwBuchungProperties.Get_m_Kost2: WideString;
begin
    Result := DefaultInterface.m_Kost2;
end;

function TRwBuchungProperties.Get_m_BelegDatum: TDateTime;
begin
    Result := DefaultInterface.m_BelegDatum;
end;

function TRwBuchungProperties.Get_m_IsValidPos: Integer;
begin
    Result := DefaultInterface.m_IsValidPos;
end;

function TRwBuchungProperties.Get_IsWaehrung(const waehrungsKuerzel: WideString): Integer;
begin
    Result := DefaultInterface.IsWaehrung[waehrungsKuerzel];
end;

function TRwBuchungProperties.Get_m_Waehrung: WideString;
begin
    Result := DefaultInterface.m_Waehrung;
end;

function TRwBuchungProperties.Get_m_TransaktionsBetrag: Currency;
begin
    Result := DefaultInterface.m_TransaktionsBetrag;
end;

function TRwBuchungProperties.Get_m_FreiesFeld(nummer: Integer): WideString;
begin
    Result := DefaultInterface.m_FreiesFeld[nummer];
end;

function TRwBuchungProperties.Get_m_Erfassungsdatum: TDateTime;
begin
    Result := DefaultInterface.m_Erfassungsdatum;
end;

{$ENDIF}

class function CoRwBuchungsabgleich.Create: IRwBuchungsabgleich;
begin
  Result := CreateComObject(CLASS_RwBuchungsabgleich) as IRwBuchungsabgleich;
end;

class function CoRwBuchungsabgleich.CreateRemote(const MachineName: string): IRwBuchungsabgleich;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_RwBuchungsabgleich) as IRwBuchungsabgleich;
end;

procedure TRwBuchungsabgleich.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{D0772C74-ACF4-4858-84DF-6FCD55581034}';
    IntfIID:   '{68755C09-3A6C-4274-9242-2E4B10CFFAC4}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TRwBuchungsabgleich.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IRwBuchungsabgleich;
  end;
end;

procedure TRwBuchungsabgleich.ConnectTo(svrIntf: IRwBuchungsabgleich);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TRwBuchungsabgleich.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TRwBuchungsabgleich.GetDefaultInterface: IRwBuchungsabgleich;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TRwBuchungsabgleich.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TRwBuchungsabgleichProperties.Create(Self);
{$ENDIF}
end;

destructor TRwBuchungsabgleich.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TRwBuchungsabgleich.GetServerProperties: TRwBuchungsabgleichProperties;
begin
  Result := FProps;
end;
{$ENDIF}

procedure TRwBuchungsabgleich.DoAbgleich(mandnr: Integer; wjDatum: TDateTime; 
                                         periodeBis: TDateTime; const fileName: WideString);
begin
  DefaultInterface.DoAbgleich(mandnr, wjDatum, periodeBis, fileName);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TRwBuchungsabgleichProperties.Create(AServer: TRwBuchungsabgleich);
begin
  inherited Create;
  FServer := AServer;
end;

function TRwBuchungsabgleichProperties.GetDefaultInterface: IRwBuchungsabgleich;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoRWKontoAuflistung.Create: IRWKontoAuflistung;
begin
  Result := CreateComObject(CLASS_RWKontoAuflistung) as IRWKontoAuflistung;
end;

class function CoRWKontoAuflistung.CreateRemote(const MachineName: string): IRWKontoAuflistung;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_RWKontoAuflistung) as IRWKontoAuflistung;
end;

procedure TRWKontoAuflistung.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{0098B1BF-E28F-4158-A444-3885AAEF4912}';
    IntfIID:   '{3E27DCAB-04C8-4B32-BEFE-BAB17E4380C1}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TRWKontoAuflistung.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IRWKontoAuflistung;
  end;
end;

procedure TRWKontoAuflistung.ConnectTo(svrIntf: IRWKontoAuflistung);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TRWKontoAuflistung.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TRWKontoAuflistung.GetDefaultInterface: IRWKontoAuflistung;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TRWKontoAuflistung.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TRWKontoAuflistungProperties.Create(Self);
{$ENDIF}
end;

destructor TRWKontoAuflistung.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TRWKontoAuflistung.GetServerProperties: TRWKontoAuflistungProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TRWKontoAuflistung.Get_m_Position: Integer;
begin
    Result := DefaultInterface.m_Position;
end;

procedure TRWKontoAuflistung.Set_m_Position(pVal: Integer);
begin
  DefaultInterface.Set_m_Position(pVal);
end;

function TRWKontoAuflistung.Get_m_Konto: WideString;
begin
    Result := DefaultInterface.m_Konto;
end;

function TRWKontoAuflistung.Get_m_Bezeichnung: WideString;
begin
    Result := DefaultInterface.m_Bezeichnung;
end;

function TRWKontoAuflistung.Get_m_Saldo(jahr: SYSINT): Currency;
begin
    Result := DefaultInterface.m_Saldo[jahr];
end;

function TRWKontoAuflistung.Get_m_AB(jahr: SYSINT): Currency;
begin
    Result := DefaultInterface.m_AB[jahr];
end;

function TRWKontoAuflistung.Get_m_Soll(jahr: SYSINT): Currency;
begin
    Result := DefaultInterface.m_Soll[jahr];
end;

function TRWKontoAuflistung.Get_m_Haben(jahr: SYSINT): Currency;
begin
    Result := DefaultInterface.m_Haben[jahr];
end;

function TRWKontoAuflistung.Get_m_Umbuchung(jahr: SYSINT): Currency;
begin
    Result := DefaultInterface.m_Umbuchung[jahr];
end;

function TRWKontoAuflistung.Get_m_Typ: Smallint;
begin
    Result := DefaultInterface.m_Typ;
end;

function TRWKontoAuflistung.Get_GetCount: Integer;
begin
    Result := DefaultInterface.GetCount;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TRWKontoAuflistungProperties.Create(AServer: TRWKontoAuflistung);
begin
  inherited Create;
  FServer := AServer;
end;

function TRWKontoAuflistungProperties.GetDefaultInterface: IRWKontoAuflistung;
begin
  Result := FServer.DefaultInterface;
end;

function TRWKontoAuflistungProperties.Get_m_Position: Integer;
begin
    Result := DefaultInterface.m_Position;
end;

procedure TRWKontoAuflistungProperties.Set_m_Position(pVal: Integer);
begin
  DefaultInterface.Set_m_Position(pVal);
end;

function TRWKontoAuflistungProperties.Get_m_Konto: WideString;
begin
    Result := DefaultInterface.m_Konto;
end;

function TRWKontoAuflistungProperties.Get_m_Bezeichnung: WideString;
begin
    Result := DefaultInterface.m_Bezeichnung;
end;

function TRWKontoAuflistungProperties.Get_m_Saldo(jahr: SYSINT): Currency;
begin
    Result := DefaultInterface.m_Saldo[jahr];
end;

function TRWKontoAuflistungProperties.Get_m_AB(jahr: SYSINT): Currency;
begin
    Result := DefaultInterface.m_AB[jahr];
end;

function TRWKontoAuflistungProperties.Get_m_Soll(jahr: SYSINT): Currency;
begin
    Result := DefaultInterface.m_Soll[jahr];
end;

function TRWKontoAuflistungProperties.Get_m_Haben(jahr: SYSINT): Currency;
begin
    Result := DefaultInterface.m_Haben[jahr];
end;

function TRWKontoAuflistungProperties.Get_m_Umbuchung(jahr: SYSINT): Currency;
begin
    Result := DefaultInterface.m_Umbuchung[jahr];
end;

function TRWKontoAuflistungProperties.Get_m_Typ: Smallint;
begin
    Result := DefaultInterface.m_Typ;
end;

function TRWKontoAuflistungProperties.Get_GetCount: Integer;
begin
    Result := DefaultInterface.GetCount;
end;

{$ENDIF}

class function CoRwPersKontoData.Create: IRwPersKontoData;
begin
  Result := CreateComObject(CLASS_RwPersKontoData) as IRwPersKontoData;
end;

class function CoRwPersKontoData.CreateRemote(const MachineName: string): IRwPersKontoData;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_RwPersKontoData) as IRwPersKontoData;
end;

procedure TRwPersKontoData.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{AC936EC2-8322-40D9-8828-B385ECBA262D}';
    IntfIID:   '{549B0C2F-9053-4EFF-8541-15F883508924}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TRwPersKontoData.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IRwPersKontoData;
  end;
end;

procedure TRwPersKontoData.ConnectTo(svrIntf: IRwPersKontoData);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TRwPersKontoData.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TRwPersKontoData.GetDefaultInterface: IRwPersKontoData;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TRwPersKontoData.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TRwPersKontoDataProperties.Create(Self);
{$ENDIF}
end;

destructor TRwPersKontoData.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TRwPersKontoData.GetServerProperties: TRwPersKontoDataProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TRwPersKontoData.Get_m_BLZ(nummer: SYSINT): WideString;
begin
    Result := DefaultInterface.m_BLZ[nummer];
end;

procedure TRwPersKontoData.Set_m_BLZ(nummer: SYSINT; const pVal: WideString);
  { Warning: The property m_BLZ has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.m_BLZ := pVal;
end;

function TRwPersKontoData.Get_m_BankKonto(nummer: SYSINT): WideString;
begin
    Result := DefaultInterface.m_BankKonto[nummer];
end;

procedure TRwPersKontoData.Set_m_BankKonto(nummer: SYSINT; const pVal: WideString);
  { Warning: The property m_BankKonto has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.m_BankKonto := pVal;
end;

function TRwPersKontoData.Get_m_Zahlungsart: WideString;
begin
    Result := DefaultInterface.m_Zahlungsart;
end;

procedure TRwPersKontoData.Set_m_Zahlungsart(const pVal: WideString);
  { Warning: The property m_Zahlungsart has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.m_Zahlungsart := pVal;
end;

function TRwPersKontoData.Get_m_Zahlungskondition: Integer;
begin
    Result := DefaultInterface.m_Zahlungskondition;
end;

procedure TRwPersKontoData.Set_m_Zahlungskondition(pVal: Integer);
begin
  DefaultInterface.Set_m_Zahlungskondition(pVal);
end;

function TRwPersKontoData.Get_m_Sortierschluessel(index: SYSINT): Integer;
begin
    Result := DefaultInterface.m_Sortierschluessel[index];
end;

procedure TRwPersKontoData.Set_m_Sortierschluessel(index: SYSINT; pVal: Integer);
begin
  DefaultInterface.m_Sortierschluessel[index] := pVal;
end;

function TRwPersKontoData.Get_m_Webadresse: WideString;
begin
    Result := DefaultInterface.m_Webadresse;
end;

procedure TRwPersKontoData.Set_m_Webadresse(const pVal: WideString);
  { Warning: The property m_Webadresse has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.m_Webadresse := pVal;
end;

function TRwPersKontoData.Get_m_DFUE: WideString;
begin
    Result := DefaultInterface.m_DFUE;
end;

function TRwPersKontoData.Get_m_Autotelefon: WideString;
begin
    Result := DefaultInterface.m_Autotelefon;
end;

procedure TRwPersKontoData.Set_m_Autotelefon(const pVal: WideString);
  { Warning: The property m_Autotelefon has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.m_Autotelefon := pVal;
end;

function TRwPersKontoData.Get_m_USTID: WideString;
begin
    Result := DefaultInterface.m_USTID;
end;

procedure TRwPersKontoData.Set_m_USTID(const pVal: WideString);
  { Warning: The property m_USTID has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.m_USTID := pVal;
end;

function TRwPersKontoData.Get_m_Ansprechpartner: WideString;
begin
    Result := DefaultInterface.m_Ansprechpartner;
end;

procedure TRwPersKontoData.Set_m_Ansprechpartner(const pVal: WideString);
  { Warning: The property m_Ansprechpartner has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.m_Ansprechpartner := pVal;
end;

function TRwPersKontoData.Get_m_Kurzbezeichnung: WideString;
begin
    Result := DefaultInterface.m_Kurzbezeichnung;
end;

procedure TRwPersKontoData.Set_m_Kurzbezeichnung(const pVal: WideString);
  { Warning: The property m_Kurzbezeichnung has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.m_Kurzbezeichnung := pVal;
end;

function TRwPersKontoData.Get_m_VerdichtungsKontp: WideString;
begin
    Result := DefaultInterface.m_VerdichtungsKontp;
end;

procedure TRwPersKontoData.Set_m_VerdichtungsKontp(const pVal: WideString);
  { Warning: The property m_VerdichtungsKontp has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.m_VerdichtungsKontp := pVal;
end;

function TRwPersKontoData.Get_m_BuchungstextVorschlag: WideString;
begin
    Result := DefaultInterface.m_BuchungstextVorschlag;
end;

procedure TRwPersKontoData.Set_m_BuchungstextVorschlag(const pVal: WideString);
  { Warning: The property m_BuchungstextVorschlag has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.m_BuchungstextVorschlag := pVal;
end;

function TRwPersKontoData.Get_m_Strasse: WideString;
begin
    Result := DefaultInterface.m_Strasse;
end;

procedure TRwPersKontoData.Set_m_Strasse(const pVal: WideString);
  { Warning: The property m_Strasse has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.m_Strasse := pVal;
end;

function TRwPersKontoData.Get_m_PLZ: WideString;
begin
    Result := DefaultInterface.m_PLZ;
end;

procedure TRwPersKontoData.Set_m_PLZ(const pVal: WideString);
  { Warning: The property m_PLZ has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.m_PLZ := pVal;
end;

function TRwPersKontoData.Get_m_Ort: WideString;
begin
    Result := DefaultInterface.m_Ort;
end;

procedure TRwPersKontoData.Set_m_Ort(const pVal: WideString);
  { Warning: The property m_Ort has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.m_Ort := pVal;
end;

function TRwPersKontoData.Get_m_Fax: WideString;
begin
    Result := DefaultInterface.m_Fax;
end;

procedure TRwPersKontoData.Set_m_Fax(const pVal: WideString);
  { Warning: The property m_Fax has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.m_Fax := pVal;
end;

function TRwPersKontoData.Get_m_Email: WideString;
begin
    Result := DefaultInterface.m_Email;
end;

procedure TRwPersKontoData.Set_m_Email(const pVal: WideString);
  { Warning: The property m_Email has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.m_Email := pVal;
end;

function TRwPersKontoData.Get_m_Telefon(nummer: SYSINT): WideString;
begin
    Result := DefaultInterface.m_Telefon[nummer];
end;

procedure TRwPersKontoData.Set_m_Telefon(nummer: SYSINT; const pVal: WideString);
  { Warning: The property m_Telefon has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.m_Telefon := pVal;
end;

procedure TRwPersKontoData.UpdateData;
begin
  DefaultInterface.UpdateData;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TRwPersKontoDataProperties.Create(AServer: TRwPersKontoData);
begin
  inherited Create;
  FServer := AServer;
end;

function TRwPersKontoDataProperties.GetDefaultInterface: IRwPersKontoData;
begin
  Result := FServer.DefaultInterface;
end;

function TRwPersKontoDataProperties.Get_m_BLZ(nummer: SYSINT): WideString;
begin
    Result := DefaultInterface.m_BLZ[nummer];
end;

procedure TRwPersKontoDataProperties.Set_m_BLZ(nummer: SYSINT; const pVal: WideString);
  { Warning: The property m_BLZ has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.m_BLZ := pVal;
end;

function TRwPersKontoDataProperties.Get_m_BankKonto(nummer: SYSINT): WideString;
begin
    Result := DefaultInterface.m_BankKonto[nummer];
end;

procedure TRwPersKontoDataProperties.Set_m_BankKonto(nummer: SYSINT; const pVal: WideString);
  { Warning: The property m_BankKonto has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.m_BankKonto := pVal;
end;

function TRwPersKontoDataProperties.Get_m_Zahlungsart: WideString;
begin
    Result := DefaultInterface.m_Zahlungsart;
end;

procedure TRwPersKontoDataProperties.Set_m_Zahlungsart(const pVal: WideString);
  { Warning: The property m_Zahlungsart has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.m_Zahlungsart := pVal;
end;

function TRwPersKontoDataProperties.Get_m_Zahlungskondition: Integer;
begin
    Result := DefaultInterface.m_Zahlungskondition;
end;

procedure TRwPersKontoDataProperties.Set_m_Zahlungskondition(pVal: Integer);
begin
  DefaultInterface.Set_m_Zahlungskondition(pVal);
end;

function TRwPersKontoDataProperties.Get_m_Sortierschluessel(index: SYSINT): Integer;
begin
    Result := DefaultInterface.m_Sortierschluessel[index];
end;

procedure TRwPersKontoDataProperties.Set_m_Sortierschluessel(index: SYSINT; pVal: Integer);
begin
  DefaultInterface.m_Sortierschluessel[index] := pVal;
end;

function TRwPersKontoDataProperties.Get_m_Webadresse: WideString;
begin
    Result := DefaultInterface.m_Webadresse;
end;

procedure TRwPersKontoDataProperties.Set_m_Webadresse(const pVal: WideString);
  { Warning: The property m_Webadresse has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.m_Webadresse := pVal;
end;

function TRwPersKontoDataProperties.Get_m_DFUE: WideString;
begin
    Result := DefaultInterface.m_DFUE;
end;

function TRwPersKontoDataProperties.Get_m_Autotelefon: WideString;
begin
    Result := DefaultInterface.m_Autotelefon;
end;

procedure TRwPersKontoDataProperties.Set_m_Autotelefon(const pVal: WideString);
  { Warning: The property m_Autotelefon has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.m_Autotelefon := pVal;
end;

function TRwPersKontoDataProperties.Get_m_USTID: WideString;
begin
    Result := DefaultInterface.m_USTID;
end;

procedure TRwPersKontoDataProperties.Set_m_USTID(const pVal: WideString);
  { Warning: The property m_USTID has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.m_USTID := pVal;
end;

function TRwPersKontoDataProperties.Get_m_Ansprechpartner: WideString;
begin
    Result := DefaultInterface.m_Ansprechpartner;
end;

procedure TRwPersKontoDataProperties.Set_m_Ansprechpartner(const pVal: WideString);
  { Warning: The property m_Ansprechpartner has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.m_Ansprechpartner := pVal;
end;

function TRwPersKontoDataProperties.Get_m_Kurzbezeichnung: WideString;
begin
    Result := DefaultInterface.m_Kurzbezeichnung;
end;

procedure TRwPersKontoDataProperties.Set_m_Kurzbezeichnung(const pVal: WideString);
  { Warning: The property m_Kurzbezeichnung has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.m_Kurzbezeichnung := pVal;
end;

function TRwPersKontoDataProperties.Get_m_VerdichtungsKontp: WideString;
begin
    Result := DefaultInterface.m_VerdichtungsKontp;
end;

procedure TRwPersKontoDataProperties.Set_m_VerdichtungsKontp(const pVal: WideString);
  { Warning: The property m_VerdichtungsKontp has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.m_VerdichtungsKontp := pVal;
end;

function TRwPersKontoDataProperties.Get_m_BuchungstextVorschlag: WideString;
begin
    Result := DefaultInterface.m_BuchungstextVorschlag;
end;

procedure TRwPersKontoDataProperties.Set_m_BuchungstextVorschlag(const pVal: WideString);
  { Warning: The property m_BuchungstextVorschlag has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.m_BuchungstextVorschlag := pVal;
end;

function TRwPersKontoDataProperties.Get_m_Strasse: WideString;
begin
    Result := DefaultInterface.m_Strasse;
end;

procedure TRwPersKontoDataProperties.Set_m_Strasse(const pVal: WideString);
  { Warning: The property m_Strasse has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.m_Strasse := pVal;
end;

function TRwPersKontoDataProperties.Get_m_PLZ: WideString;
begin
    Result := DefaultInterface.m_PLZ;
end;

procedure TRwPersKontoDataProperties.Set_m_PLZ(const pVal: WideString);
  { Warning: The property m_PLZ has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.m_PLZ := pVal;
end;

function TRwPersKontoDataProperties.Get_m_Ort: WideString;
begin
    Result := DefaultInterface.m_Ort;
end;

procedure TRwPersKontoDataProperties.Set_m_Ort(const pVal: WideString);
  { Warning: The property m_Ort has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.m_Ort := pVal;
end;

function TRwPersKontoDataProperties.Get_m_Fax: WideString;
begin
    Result := DefaultInterface.m_Fax;
end;

procedure TRwPersKontoDataProperties.Set_m_Fax(const pVal: WideString);
  { Warning: The property m_Fax has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.m_Fax := pVal;
end;

function TRwPersKontoDataProperties.Get_m_Email: WideString;
begin
    Result := DefaultInterface.m_Email;
end;

procedure TRwPersKontoDataProperties.Set_m_Email(const pVal: WideString);
  { Warning: The property m_Email has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.m_Email := pVal;
end;

function TRwPersKontoDataProperties.Get_m_Telefon(nummer: SYSINT): WideString;
begin
    Result := DefaultInterface.m_Telefon[nummer];
end;

procedure TRwPersKontoDataProperties.Set_m_Telefon(nummer: SYSINT; const pVal: WideString);
  { Warning: The property m_Telefon has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.m_Telefon := pVal;
end;

{$ENDIF}

class function CoRwBuchungskreisTool.Create: IRwBuchungskreisTool;
begin
  Result := CreateComObject(CLASS_RwBuchungskreisTool) as IRwBuchungskreisTool;
end;

class function CoRwBuchungskreisTool.CreateRemote(const MachineName: string): IRwBuchungskreisTool;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_RwBuchungskreisTool) as IRwBuchungskreisTool;
end;

procedure TRwBuchungskreisTool.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{EB7EFACE-4BD0-49F8-BB5B-93B30BF6DA76}';
    IntfIID:   '{14C62BEB-81D2-4D25-832C-5B3DCA7B0355}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TRwBuchungskreisTool.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IRwBuchungskreisTool;
  end;
end;

procedure TRwBuchungskreisTool.ConnectTo(svrIntf: IRwBuchungskreisTool);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TRwBuchungskreisTool.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TRwBuchungskreisTool.GetDefaultInterface: IRwBuchungskreisTool;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TRwBuchungskreisTool.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TRwBuchungskreisToolProperties.Create(Self);
{$ENDIF}
end;

destructor TRwBuchungskreisTool.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TRwBuchungskreisTool.GetServerProperties: TRwBuchungskreisToolProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TRwBuchungskreisTool.Get_m_Buchungskreis: LongWord;
begin
    Result := DefaultInterface.m_Buchungskreis;
end;

procedure TRwBuchungskreisTool.SetBuchungskreis(bukreis: Integer; check: Byte);
begin
  DefaultInterface.SetBuchungskreis(bukreis, check);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TRwBuchungskreisToolProperties.Create(AServer: TRwBuchungskreisTool);
begin
  inherited Create;
  FServer := AServer;
end;

function TRwBuchungskreisToolProperties.GetDefaultInterface: IRwBuchungskreisTool;
begin
  Result := FServer.DefaultInterface;
end;

function TRwBuchungskreisToolProperties.Get_m_Buchungskreis: LongWord;
begin
    Result := DefaultInterface.m_Buchungskreis;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents(dtlOcxPage, [TRwBuchungsImport]);
  RegisterComponents(dtlServerPage, [TAddFibuProjectImp, TRwFibuWJ, TRwBilanzInfo, TRwBilanzItem, 
    TRwSachkonten, TRwDebitorkonten, TRwKreditorkonten, TRwBuchungsstapel, TRwBuchungsstapelWJ, 
    TRwFibuKonto, TRwOPSuche, TRwOP, TRwKontenblatt, TRwBuchung, 
    TRwBuchungsabgleich, TRWKontoAuflistung, TRwPersKontoData, TRwBuchungskreisTool]);
end;

end.
