unit addisonbasics_TLB;

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
// File generated on 17.04.2009 15:47:59 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Program Files\ADDISON\Connect\ABasic.dll (1)
// LIBID: {29EA9B83-68F8-11D2-ADEB-000083F3B333}
// LCID: 0
// Helpfile: 
// HelpString: Addison BO Library 1.0 (Basics)
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\system32\stdole2.tlb)
// Errors:
//   Hint: Parameter 'file' of IAddBOManager.CheckForeignConnection changed to 'file_'
//   Hint: Parameter 'Object' of IDynamicCollection.Append changed to 'Object_'
//   Hint: Parameter 'Object' of IDynamicCollection.DeleteByObject changed to 'Object_'
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
  addisonbasicsMajorVersion = 1;
  addisonbasicsMinorVersion = 0;

  LIBID_addisonbasics: TGUID = '{29EA9B83-68F8-11D2-ADEB-000083F3B333}';

  IID_IAddBOManager: TGUID = '{29EA9B8F-68F8-11D2-ADEB-000083F3B333}';
  CLASS_AddBOManager: TGUID = '{29EA9B90-68F8-11D2-ADEB-000083F3B333}';
  IID_IAddMandant: TGUID = '{29EA9B92-68F8-11D2-ADEB-000083F3B333}';
  IID_IAddGeschaeftspartner: TGUID = '{29EA9B95-68F8-11D2-ADEB-000083F3B333}';
  IID_IAddZusatzAdressen: TGUID = '{CC12C96B-A021-47B7-96A6-83B37AD21FCB}';
  IID_IAddZusatzAdresse: TGUID = '{934E6095-A66B-42CB-9DEE-7BF6CCF6416B}';
  IID_IAddProject: TGUID = '{29EA9B9B-68F8-11D2-ADEB-000083F3B333}';
  IID_IAddFreieFelder: TGUID = '{74F31677-5B9A-11D3-9CD8-0000F6E74B7E}';
  IID_IAddKinder: TGUID = '{7040F873-6518-11D3-9CE6-0000F6E74B7E}';
  IID_IAddAnsprPartnerFachbereich: TGUID = '{4C46B923-69E4-11D3-9CEB-0000F6E74B7E}';
  IID_IAddAnsprPartner: TGUID = '{4C46B926-69E4-11D3-9CEB-0000F6E74B7E}';
  IID_IAddFinanzamt: TGUID = '{512E4971-F416-11D3-9DB5-005004510B61}';
  IID_IAddWuerfel: TGUID = '{744EA0F0-745F-4475-9712-C82BD5FDBBDD}';
  IID_IAddWaehrung: TGUID = '{29EA9B98-68F8-11D2-ADEB-000083F3B333}';
  IID_IAddAdressVerwaltungMandant: TGUID = '{35D382DA-914A-11D2-AE46-000083F3B333}';
  IID_IStaticCollection: TGUID = '{D3162C97-DE97-11D1-B6C8-204C4F4F5020}';
  IID_IDynamicCollection: TGUID = '{D3162C98-DE97-11D1-B6C8-204C4F4F5020}';
  CLASS_AddMandant: TGUID = '{29EA9B93-68F8-11D2-ADEB-000083F3B333}';
  CLASS_AddGeschaeftspartner: TGUID = '{29EA9B96-68F8-11D2-ADEB-000083F3B333}';
  CLASS_AddWaehrung: TGUID = '{29EA9B99-68F8-11D2-ADEB-000083F3B333}';
  CLASS_AddProject: TGUID = '{29EA9B9C-68F8-11D2-ADEB-000083F3B333}';
  IID_IAddKanzlei: TGUID = '{29EA9B9E-68F8-11D2-ADEB-000083F3B333}';
  CLASS_AddKanzlei: TGUID = '{29EA9B9F-68F8-11D2-ADEB-000083F3B333}';
  IID_IAddProtokoll: TGUID = '{35D382D7-914A-11D2-AE46-000083F3B333}';
  CLASS_AddProtokoll: TGUID = '{35D382D8-914A-11D2-AE46-000083F3B333}';
  CLASS_AddAdressVerwaltungMandant: TGUID = '{35D382DB-914A-11D2-AE46-000083F3B333}';
  CLASS_AddFreieFelder: TGUID = '{74F31678-5B9A-11D3-9CD8-0000F6E74B7E}';
  CLASS_AddKinder: TGUID = '{7040F874-6518-11D3-9CE6-0000F6E74B7E}';
  CLASS_AddAnsprPartnerFachbereich: TGUID = '{4C46B924-69E4-11D3-9CEB-0000F6E74B7E}';
  CLASS_AddAnsprPartner: TGUID = '{4C46B927-69E4-11D3-9CEB-0000F6E74B7E}';
  CLASS_AddFinanzamt: TGUID = '{512E4972-F416-11D3-9DB5-005004510B61}';
  IID_IAddWorkflowManager: TGUID = '{C6159836-813F-46B3-9B06-EDB45E664382}';
  CLASS_AddWorkflowManager: TGUID = '{5B633B93-3515-4D0B-ADD5-215A5DCE53B0}';
  IID_IAddWorkflowItem: TGUID = '{A3E4B889-E025-4CD8-B8E4-AAB7B6865831}';
  CLASS_AddWorkflowItem: TGUID = '{B017F789-D3B2-4EEA-975D-57EE443D78E4}';
  IID_IAddTools: TGUID = '{C71FF228-4FF1-4075-A43A-F529A380CEDA}';
  CLASS_AddTools: TGUID = '{3809CCB3-241B-4A4A-921B-F564D2A26B41}';
  CLASS_AddWuerfel: TGUID = '{41CBAB3E-3F73-45CA-9B22-F9CAC4620B08}';
  IID_IAddServerItem: TGUID = '{96901834-3735-4A8E-9373-038579424BE3}';
  CLASS_AddServerItem: TGUID = '{5D712AA2-7274-4528-8CA4-9218F5512139}';
  IID_IAddWuerfelAnsicht: TGUID = '{C880579F-1018-497E-B5CB-2AD4A62D378D}';
  CLASS_AddWuerfelAnsicht: TGUID = '{C513FE4F-CDAF-4072-9D93-9953A5D42806}';
  CLASS_AddZusatzAdressen: TGUID = '{3AC2F9F7-928A-4FC1-AF95-1E3DB7F5F76C}';
  CLASS_AddZusatzAdresse: TGUID = '{911397FF-B0DC-492B-AE77-2435B7F8E14C}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum AddZeitraum
type
  AddZeitraum = TOleEnum;
const
  zeitraumPeriode = $00000000;
  zeitraumQuartal = $00000001;
  zeitraumKumuliert = $00000002;
  zeitraumDefault = $00000003;
  zeitraumBilanz = $00000004;

// Constants for enum AddWertart
type
  AddWertart = TOleEnum;
const
  wertIst = $00000000;
  wertPlan = $00000001;
  wertPrognoseNeg = $00000002;
  wertPrognosePos = $00000003;
  wertPrognoseTrend = $00000004;
  wertDefault = $00000005;
  wertSoll = $00000006;
  wertPlanFortschreibung = $00000007;
  wertPrognoseNegIsoliert = $00000008;
  wertPrognosePosIsoliert = $00000009;
  wertBWASpalte = $0000000A;

// Constants for enum AddWertabgriff
type
  AddWertabgriff = TOleEnum;
const
  abgriffGESAMT = $00000000;
  abgriffAB = $00000001;
  abgriffSOLL = $00000002;
  abgriffHABEN = $00000003;
  abgriffVERKEHRSZAHL = $00000004;
  abgriffDEFAULT = $00000005;
  abgriffLIQUID = $00000006;
  abgriffAFA = $00000007;
  abgriffUMBUCHUNG = $00000008;
  abgriffZUSCHREIBUNG = $00000009;
  abgriffSAFA = $0000000A;
  abgriffWARENUMSATZ = $0000000B;
  abgriffZUGANG = $0000000C;
  abgriffABGANG = $0000000D;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IAddBOManager = interface;
  IAddBOManagerDisp = dispinterface;
  IAddMandant = interface;
  IAddMandantDisp = dispinterface;
  IAddGeschaeftspartner = interface;
  IAddGeschaeftspartnerDisp = dispinterface;
  IAddZusatzAdressen = interface;
  IAddZusatzAdressenDisp = dispinterface;
  IAddZusatzAdresse = interface;
  IAddZusatzAdresseDisp = dispinterface;
  IAddProject = interface;
  IAddProjectDisp = dispinterface;
  IAddFreieFelder = interface;
  IAddFreieFelderDisp = dispinterface;
  IAddKinder = interface;
  IAddKinderDisp = dispinterface;
  IAddAnsprPartnerFachbereich = interface;
  IAddAnsprPartnerFachbereichDisp = dispinterface;
  IAddAnsprPartner = interface;
  IAddAnsprPartnerDisp = dispinterface;
  IAddFinanzamt = interface;
  IAddFinanzamtDisp = dispinterface;
  IAddWuerfel = interface;
  IAddWuerfelDisp = dispinterface;
  IAddWaehrung = interface;
  IAddWaehrungDisp = dispinterface;
  IAddAdressVerwaltungMandant = interface;
  IAddAdressVerwaltungMandantDisp = dispinterface;
  IStaticCollection = interface;
  IStaticCollectionDisp = dispinterface;
  IDynamicCollection = interface;
  IDynamicCollectionDisp = dispinterface;
  IAddKanzlei = interface;
  IAddKanzleiDisp = dispinterface;
  IAddProtokoll = interface;
  IAddProtokollDisp = dispinterface;
  IAddWorkflowManager = interface;
  IAddWorkflowManagerDisp = dispinterface;
  IAddWorkflowItem = interface;
  IAddWorkflowItemDisp = dispinterface;
  IAddTools = interface;
  IAddToolsDisp = dispinterface;
  IAddServerItem = interface;
  IAddServerItemDisp = dispinterface;
  IAddWuerfelAnsicht = interface;
  IAddWuerfelAnsichtDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  AddBOManager = IAddBOManager;
  AddMandant = IAddMandant;
  AddGeschaeftspartner = IAddGeschaeftspartner;
  AddWaehrung = IAddWaehrung;
  AddProject = IAddProject;
  AddKanzlei = IAddKanzlei;
  AddProtokoll = IAddProtokoll;
  AddAdressVerwaltungMandant = IAddAdressVerwaltungMandant;
  AddFreieFelder = IAddFreieFelder;
  AddKinder = IAddKinder;
  AddAnsprPartnerFachbereich = IAddAnsprPartnerFachbereich;
  AddAnsprPartner = IAddAnsprPartner;
  AddFinanzamt = IAddFinanzamt;
  AddWorkflowManager = IAddWorkflowManager;
  AddWorkflowItem = IAddWorkflowItem;
  AddTools = IAddTools;
  AddWuerfel = IAddWuerfel;
  AddServerItem = IAddServerItem;
  AddWuerfelAnsicht = IAddWuerfelAnsicht;
  AddZusatzAdressen = IAddZusatzAdressen;
  AddZusatzAdresse = IAddZusatzAdresse;


// *********************************************************************//
// Interface: IAddBOManager
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {29EA9B8F-68F8-11D2-ADEB-000083F3B333}
// *********************************************************************//
  IAddBOManager = interface(IDispatch)
    ['{29EA9B8F-68F8-11D2-ADEB-000083F3B333}']
    procedure Connect; safecall;
    procedure ConnectEx(const username: WideString; const password: WideString); safecall;
    procedure Close; safecall;
    procedure SetCurrentMandant(mandnr: Integer); safecall;
    function Get_GetMandant(mandnr: Integer): IAddMandant; safecall;
    function Get_GetCurrentMandant: IAddMandant; safecall;
    function Get_IsOpen: Integer; safecall;
    function Get_GetWaehrung(hausWaehrung: Smallint): IAddWaehrung; safecall;
    function Get_GetAdressVerwaltung: IAddAdressVerwaltungMandant; safecall;
    function Get_GetMandanten: IDynamicCollection; safecall;
    function Get_GlobalRefreshObjects: Integer; safecall;
    procedure SetDefaultUserID(const loginName: WideString; const pwd: WideString); safecall;
    function Get_m_CurrentUserName: WideString; safecall;
    procedure SetDefaultDB(const connectString: WideString; const dbName: WideString); safecall;
    function Get_CheckForeignConnection(const file_: WideString): Integer; safecall;
    function Get_StartAddison(mandant: Integer; const projekt: WideString; const user: WideString; 
                              const password: WideString): Integer; safecall;
    property GetMandant[mandnr: Integer]: IAddMandant read Get_GetMandant;
    property GetCurrentMandant: IAddMandant read Get_GetCurrentMandant;
    property IsOpen: Integer read Get_IsOpen;
    property GetWaehrung[hausWaehrung: Smallint]: IAddWaehrung read Get_GetWaehrung;
    property GetAdressVerwaltung: IAddAdressVerwaltungMandant read Get_GetAdressVerwaltung;
    property GetMandanten: IDynamicCollection read Get_GetMandanten;
    property GlobalRefreshObjects: Integer read Get_GlobalRefreshObjects;
    property m_CurrentUserName: WideString read Get_m_CurrentUserName;
    property CheckForeignConnection[const file_: WideString]: Integer read Get_CheckForeignConnection;
    property StartAddison[mandant: Integer; const projekt: WideString; const user: WideString; 
                          const password: WideString]: Integer read Get_StartAddison;
  end;

// *********************************************************************//
// DispIntf:  IAddBOManagerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {29EA9B8F-68F8-11D2-ADEB-000083F3B333}
// *********************************************************************//
  IAddBOManagerDisp = dispinterface
    ['{29EA9B8F-68F8-11D2-ADEB-000083F3B333}']
    procedure Connect; dispid 1;
    procedure ConnectEx(const username: WideString; const password: WideString); dispid 2;
    procedure Close; dispid 3;
    procedure SetCurrentMandant(mandnr: Integer); dispid 4;
    property GetMandant[mandnr: Integer]: IAddMandant readonly dispid 5;
    property GetCurrentMandant: IAddMandant readonly dispid 6;
    property IsOpen: Integer readonly dispid 7;
    property GetWaehrung[hausWaehrung: Smallint]: IAddWaehrung readonly dispid 8;
    property GetAdressVerwaltung: IAddAdressVerwaltungMandant readonly dispid 9;
    property GetMandanten: IDynamicCollection readonly dispid 10;
    property GlobalRefreshObjects: Integer readonly dispid 11;
    procedure SetDefaultUserID(const loginName: WideString; const pwd: WideString); dispid 12;
    property m_CurrentUserName: WideString readonly dispid 13;
    procedure SetDefaultDB(const connectString: WideString; const dbName: WideString); dispid 14;
    property CheckForeignConnection[const file_: WideString]: Integer readonly dispid 15;
    property StartAddison[mandant: Integer; const projekt: WideString; const user: WideString; 
                          const password: WideString]: Integer readonly dispid 16;
  end;

// *********************************************************************//
// Interface: IAddMandant
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {29EA9B92-68F8-11D2-ADEB-000083F3B333}
// *********************************************************************//
  IAddMandant = interface(IDispatch)
    ['{29EA9B92-68F8-11D2-ADEB-000083F3B333}']
    function Get_m_pPrivatMandant: IAddGeschaeftspartner; safecall;
    function Get_m_pFirmenMandant: IAddGeschaeftspartner; safecall;
    function Get_m_MandantenNr: Integer; safecall;
    procedure LockObject(exklusive: Integer); safecall;
    procedure UnLockObject(exklusiv: Integer); safecall;
    function Get_m_Name: WideString; safecall;
    function Get_GetFibuProject: IAddProject; safecall;
    function Get_GetLohnProject: IAddProject; safecall;
    function Get_GetANLProject: IAddProject; safecall;
    function Get_m_Name2: WideString; safecall;
    function Get_m_Kurzname: WideString; safecall;
    function Get_m_DebitorenKonto: WideString; safecall;
    function Get_m_KurzBezeichnung: Integer; safecall;
    function Get_m_Steuernummer: WideString; safecall;
    function Get_m_FirmaSteuernummer: WideString; safecall;
    function Get_m_SteuernummerLST: WideString; safecall;
    function Get_m_FirmaSteuernummerLST: WideString; safecall;
    function Get_IsTypPrivat: Integer; safecall;
    function Get_IsTypFirma: Integer; safecall;
    function Get_IsTypPrivatFirma: Integer; safecall;
    function Get_m_LaenderKennzeichen: Integer; safecall;
    function Get_m_ErloeskontenSchluessel: Integer; safecall;
    function Get_m_GruppenSchluessel: WideString; safecall;
    function Get_m_Unternehmensgegenstand: WideString; safecall;
    procedure Set_m_Unternehmensgegenstand(const pVal: WideString); safecall;
    function Get_m_pFreieFelder: IAddFreieFelder; safecall;
    function Get_m_Geburtsort: WideString; safecall;
    procedure Set_m_Geburtsort(const pVal: WideString); safecall;
    function Get_m_GeburtsName: WideString; safecall;
    procedure Set_m_GeburtsName(const pVal: WideString); safecall;
    function Get_m_Konfession: WideString; safecall;
    procedure Set_m_Konfession(const pVal: WideString); safecall;
    function Get_m_Familienstand: WideString; safecall;
    procedure Set_m_Familienstand(const pVal: WideString); safecall;
    function Get_m_FamilienstandAb: TDateTime; safecall;
    procedure Set_m_FamilienstandAb(pVal: TDateTime); safecall;
    function Get_m_GetrenntSeit: TDateTime; safecall;
    procedure Set_m_GetrenntSeit(pVal: TDateTime); safecall;
    function Get_m_Beruf: WideString; safecall;
    procedure Set_m_Beruf(const pVal: WideString); safecall;
    function Get_m_Arbeitgeber: WideString; safecall;
    procedure Set_m_Arbeitgeber(const pVal: WideString); safecall;
    function Get_m_RentenVersNr: WideString; safecall;
    procedure Set_m_RentenVersNr(const pVal: WideString); safecall;
    function Get_m_SozialVersNr: WideString; safecall;
    procedure Set_m_SozialVersNr(const pVal: WideString); safecall;
    function Get_m_Anrede: WideString; safecall;
    procedure Set_m_Anrede(const pVal: WideString); safecall;
    function Get_m_Briefanrede: WideString; safecall;
    procedure Set_m_Briefanrede(const pVal: WideString); safecall;
    function Get_m_Grussformel: WideString; safecall;
    procedure Set_m_Grussformel(const pVal: WideString); safecall;
    function Get_m_Korrespondenzadresse: WideString; safecall;
    procedure Set_m_Korrespondenzadresse(const pVal: WideString); safecall;
    function Get_m_pEhegatte: IAddGeschaeftspartner; safecall;
    function Get_m_pGesetzlicherVertreterFirma: IAddGeschaeftspartner; safecall;
    function Get_m_pGesetzlicherVertreterPerson: IAddGeschaeftspartner; safecall;
    function Get_m_pEmpfangsBVFirma: IAddGeschaeftspartner; safecall;
    function Get_m_pEmpfangsBVPerson: IAddGeschaeftspartner; safecall;
    function Get_m_GeburtsortEhepartner: WideString; safecall;
    procedure Set_m_GeburtsortEhepartner(const pVal: WideString); safecall;
    function Get_m_GeburtsnameEhepartner: WideString; safecall;
    procedure Set_m_GeburtsnameEhepartner(const pVal: WideString); safecall;
    function Get_m_KonfessionEhepartner: WideString; safecall;
    procedure Set_m_KonfessionEhepartner(const pVal: WideString); safecall;
    function Get_m_Guetergemeinschaft: Integer; safecall;
    procedure Set_m_Guetergemeinschaft(pVal: Integer); safecall;
    function Get_m_BerufEhepartner: WideString; safecall;
    procedure Set_m_BerufEhepartner(const pVal: WideString); safecall;
    function Get_m_ArbeitgeberEhepartner: WideString; safecall;
    procedure Set_m_ArbeitgeberEhepartner(const pVal: WideString); safecall;
    function Get_m_RentenversNrEhepartner: WideString; safecall;
    procedure Set_m_RentenversNrEhepartner(const pVal: WideString); safecall;
    function Get_m_SozialversNrEhepartner: WideString; safecall;
    procedure Set_m_SozialversNrEhepartner(const pVal: WideString); safecall;
    function Get_m_AnredeEheleute: WideString; safecall;
    procedure Set_m_AnredeEheleute(const pVal: WideString); safecall;
    function Get_m_BriefanredeEheleute: WideString; safecall;
    procedure Set_m_BriefanredeEheleute(const pVal: WideString); safecall;
    function Get_m_GrussformelEheleute: WideString; safecall;
    procedure Set_m_GrussformelEheleute(const pVal: WideString); safecall;
    function Get_m_GesetzlVertreterArt: WideString; safecall;
    procedure Set_m_GesetzlVertreterArt(const pVal: WideString); safecall;
    function Get_m_GesetzlVertreterVermerke: WideString; safecall;
    procedure Set_m_GesetzlVertreterVermerke(const pVal: WideString); safecall;
    function Get_m_pKinder: IAddKinder; safecall;
    function Get_m_pAnsprPartnerFachbereich: IAddAnsprPartnerFachbereich; safecall;
    function Get_MemberByName(const MemberName: WideString): WideString; safecall;
    function Get_m_GesetzlVertreterArtFirma: WideString; safecall;
    procedure Set_m_GesetzlVertreterArtFirma(const pVal: WideString); safecall;
    function Get_m_GesetzlVertreterVermerkeFirma: WideString; safecall;
    procedure Set_m_GesetzlVertreterVermerkeFirma(const pVal: WideString); safecall;
    function Get_m_pFinanzamt: IAddFinanzamt; safecall;
    function Get_m_Wuerfel(const bereich: WideString; wj: TDateTime; tochter: Integer): IAddWuerfel; safecall;
    function Get_m_Wirtschaftsjahr(index: Integer): WideString; safecall;
    function Get_m_AnzahlBFWFormulare(formularid: SYSINT; jahr: SYSINT): Integer; safecall;
    function Get_m_AnzahlBFWFormulareMonat(formularid: SYSINT; jahr: SYSINT; monat: SYSINT): Integer; safecall;
    function Get_FreiesFeld(const feldname: WideString): WideString; safecall;
    procedure Set_FreiesFeld(const feldname: WideString; const pVal: WideString); safecall;
    function Get_Betriebsstaetten(pos: Integer): IAddGeschaeftspartner; safecall;
    function Get_GGW(Formel: SYSINT; monat: SYSINT; jahr: SYSINT): Double; safecall;
    procedure Set_GGW(Formel: SYSINT; monat: SYSINT; jahr: SYSINT; pVal: Double); safecall;
    function Get_m_MandatBeginnAm: TDateTime; safecall;
    function Get_m_MandatEndetAm: TDateTime; safecall;
    function Get_m_IsAktiv: Byte; safecall;
    property m_pPrivatMandant: IAddGeschaeftspartner read Get_m_pPrivatMandant;
    property m_pFirmenMandant: IAddGeschaeftspartner read Get_m_pFirmenMandant;
    property m_MandantenNr: Integer read Get_m_MandantenNr;
    property m_Name: WideString read Get_m_Name;
    property GetFibuProject: IAddProject read Get_GetFibuProject;
    property GetLohnProject: IAddProject read Get_GetLohnProject;
    property GetANLProject: IAddProject read Get_GetANLProject;
    property m_Name2: WideString read Get_m_Name2;
    property m_Kurzname: WideString read Get_m_Kurzname;
    property m_DebitorenKonto: WideString read Get_m_DebitorenKonto;
    property m_KurzBezeichnung: Integer read Get_m_KurzBezeichnung;
    property m_Steuernummer: WideString read Get_m_Steuernummer;
    property m_FirmaSteuernummer: WideString read Get_m_FirmaSteuernummer;
    property m_SteuernummerLST: WideString read Get_m_SteuernummerLST;
    property m_FirmaSteuernummerLST: WideString read Get_m_FirmaSteuernummerLST;
    property IsTypPrivat: Integer read Get_IsTypPrivat;
    property IsTypFirma: Integer read Get_IsTypFirma;
    property IsTypPrivatFirma: Integer read Get_IsTypPrivatFirma;
    property m_LaenderKennzeichen: Integer read Get_m_LaenderKennzeichen;
    property m_ErloeskontenSchluessel: Integer read Get_m_ErloeskontenSchluessel;
    property m_GruppenSchluessel: WideString read Get_m_GruppenSchluessel;
    property m_Unternehmensgegenstand: WideString read Get_m_Unternehmensgegenstand write Set_m_Unternehmensgegenstand;
    property m_pFreieFelder: IAddFreieFelder read Get_m_pFreieFelder;
    property m_Geburtsort: WideString read Get_m_Geburtsort write Set_m_Geburtsort;
    property m_GeburtsName: WideString read Get_m_GeburtsName write Set_m_GeburtsName;
    property m_Konfession: WideString read Get_m_Konfession write Set_m_Konfession;
    property m_Familienstand: WideString read Get_m_Familienstand write Set_m_Familienstand;
    property m_FamilienstandAb: TDateTime read Get_m_FamilienstandAb write Set_m_FamilienstandAb;
    property m_GetrenntSeit: TDateTime read Get_m_GetrenntSeit write Set_m_GetrenntSeit;
    property m_Beruf: WideString read Get_m_Beruf write Set_m_Beruf;
    property m_Arbeitgeber: WideString read Get_m_Arbeitgeber write Set_m_Arbeitgeber;
    property m_RentenVersNr: WideString read Get_m_RentenVersNr write Set_m_RentenVersNr;
    property m_SozialVersNr: WideString read Get_m_SozialVersNr write Set_m_SozialVersNr;
    property m_Anrede: WideString read Get_m_Anrede write Set_m_Anrede;
    property m_Briefanrede: WideString read Get_m_Briefanrede write Set_m_Briefanrede;
    property m_Grussformel: WideString read Get_m_Grussformel write Set_m_Grussformel;
    property m_Korrespondenzadresse: WideString read Get_m_Korrespondenzadresse write Set_m_Korrespondenzadresse;
    property m_pEhegatte: IAddGeschaeftspartner read Get_m_pEhegatte;
    property m_pGesetzlicherVertreterFirma: IAddGeschaeftspartner read Get_m_pGesetzlicherVertreterFirma;
    property m_pGesetzlicherVertreterPerson: IAddGeschaeftspartner read Get_m_pGesetzlicherVertreterPerson;
    property m_pEmpfangsBVFirma: IAddGeschaeftspartner read Get_m_pEmpfangsBVFirma;
    property m_pEmpfangsBVPerson: IAddGeschaeftspartner read Get_m_pEmpfangsBVPerson;
    property m_GeburtsortEhepartner: WideString read Get_m_GeburtsortEhepartner write Set_m_GeburtsortEhepartner;
    property m_GeburtsnameEhepartner: WideString read Get_m_GeburtsnameEhepartner write Set_m_GeburtsnameEhepartner;
    property m_KonfessionEhepartner: WideString read Get_m_KonfessionEhepartner write Set_m_KonfessionEhepartner;
    property m_Guetergemeinschaft: Integer read Get_m_Guetergemeinschaft write Set_m_Guetergemeinschaft;
    property m_BerufEhepartner: WideString read Get_m_BerufEhepartner write Set_m_BerufEhepartner;
    property m_ArbeitgeberEhepartner: WideString read Get_m_ArbeitgeberEhepartner write Set_m_ArbeitgeberEhepartner;
    property m_RentenversNrEhepartner: WideString read Get_m_RentenversNrEhepartner write Set_m_RentenversNrEhepartner;
    property m_SozialversNrEhepartner: WideString read Get_m_SozialversNrEhepartner write Set_m_SozialversNrEhepartner;
    property m_AnredeEheleute: WideString read Get_m_AnredeEheleute write Set_m_AnredeEheleute;
    property m_BriefanredeEheleute: WideString read Get_m_BriefanredeEheleute write Set_m_BriefanredeEheleute;
    property m_GrussformelEheleute: WideString read Get_m_GrussformelEheleute write Set_m_GrussformelEheleute;
    property m_GesetzlVertreterArt: WideString read Get_m_GesetzlVertreterArt write Set_m_GesetzlVertreterArt;
    property m_GesetzlVertreterVermerke: WideString read Get_m_GesetzlVertreterVermerke write Set_m_GesetzlVertreterVermerke;
    property m_pKinder: IAddKinder read Get_m_pKinder;
    property m_pAnsprPartnerFachbereich: IAddAnsprPartnerFachbereich read Get_m_pAnsprPartnerFachbereich;
    property MemberByName[const MemberName: WideString]: WideString read Get_MemberByName;
    property m_GesetzlVertreterArtFirma: WideString read Get_m_GesetzlVertreterArtFirma write Set_m_GesetzlVertreterArtFirma;
    property m_GesetzlVertreterVermerkeFirma: WideString read Get_m_GesetzlVertreterVermerkeFirma write Set_m_GesetzlVertreterVermerkeFirma;
    property m_pFinanzamt: IAddFinanzamt read Get_m_pFinanzamt;
    property m_Wuerfel[const bereich: WideString; wj: TDateTime; tochter: Integer]: IAddWuerfel read Get_m_Wuerfel;
    property m_Wirtschaftsjahr[index: Integer]: WideString read Get_m_Wirtschaftsjahr;
    property m_AnzahlBFWFormulare[formularid: SYSINT; jahr: SYSINT]: Integer read Get_m_AnzahlBFWFormulare;
    property m_AnzahlBFWFormulareMonat[formularid: SYSINT; jahr: SYSINT; monat: SYSINT]: Integer read Get_m_AnzahlBFWFormulareMonat;
    property FreiesFeld[const feldname: WideString]: WideString read Get_FreiesFeld write Set_FreiesFeld;
    property Betriebsstaetten[pos: Integer]: IAddGeschaeftspartner read Get_Betriebsstaetten;
    property GGW[Formel: SYSINT; monat: SYSINT; jahr: SYSINT]: Double read Get_GGW write Set_GGW;
    property m_MandatBeginnAm: TDateTime read Get_m_MandatBeginnAm;
    property m_MandatEndetAm: TDateTime read Get_m_MandatEndetAm;
    property m_IsAktiv: Byte read Get_m_IsAktiv;
  end;

// *********************************************************************//
// DispIntf:  IAddMandantDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {29EA9B92-68F8-11D2-ADEB-000083F3B333}
// *********************************************************************//
  IAddMandantDisp = dispinterface
    ['{29EA9B92-68F8-11D2-ADEB-000083F3B333}']
    property m_pPrivatMandant: IAddGeschaeftspartner readonly dispid 1;
    property m_pFirmenMandant: IAddGeschaeftspartner readonly dispid 2;
    property m_MandantenNr: Integer readonly dispid 3;
    procedure LockObject(exklusive: Integer); dispid 4;
    procedure UnLockObject(exklusiv: Integer); dispid 5;
    property m_Name: WideString readonly dispid 6;
    property GetFibuProject: IAddProject readonly dispid 7;
    property GetLohnProject: IAddProject readonly dispid 8;
    property GetANLProject: IAddProject readonly dispid 9;
    property m_Name2: WideString readonly dispid 10;
    property m_Kurzname: WideString readonly dispid 11;
    property m_DebitorenKonto: WideString readonly dispid 12;
    property m_KurzBezeichnung: Integer readonly dispid 13;
    property m_Steuernummer: WideString readonly dispid 14;
    property m_FirmaSteuernummer: WideString readonly dispid 15;
    property m_SteuernummerLST: WideString readonly dispid 16;
    property m_FirmaSteuernummerLST: WideString readonly dispid 17;
    property IsTypPrivat: Integer readonly dispid 18;
    property IsTypFirma: Integer readonly dispid 19;
    property IsTypPrivatFirma: Integer readonly dispid 20;
    property m_LaenderKennzeichen: Integer readonly dispid 21;
    property m_ErloeskontenSchluessel: Integer readonly dispid 22;
    property m_GruppenSchluessel: WideString readonly dispid 23;
    property m_Unternehmensgegenstand: WideString dispid 24;
    property m_pFreieFelder: IAddFreieFelder readonly dispid 25;
    property m_Geburtsort: WideString dispid 26;
    property m_GeburtsName: WideString dispid 27;
    property m_Konfession: WideString dispid 28;
    property m_Familienstand: WideString dispid 29;
    property m_FamilienstandAb: TDateTime dispid 30;
    property m_GetrenntSeit: TDateTime dispid 31;
    property m_Beruf: WideString dispid 32;
    property m_Arbeitgeber: WideString dispid 33;
    property m_RentenVersNr: WideString dispid 34;
    property m_SozialVersNr: WideString dispid 35;
    property m_Anrede: WideString dispid 36;
    property m_Briefanrede: WideString dispid 37;
    property m_Grussformel: WideString dispid 38;
    property m_Korrespondenzadresse: WideString dispid 39;
    property m_pEhegatte: IAddGeschaeftspartner readonly dispid 40;
    property m_pGesetzlicherVertreterFirma: IAddGeschaeftspartner readonly dispid 41;
    property m_pGesetzlicherVertreterPerson: IAddGeschaeftspartner readonly dispid 42;
    property m_pEmpfangsBVFirma: IAddGeschaeftspartner readonly dispid 43;
    property m_pEmpfangsBVPerson: IAddGeschaeftspartner readonly dispid 44;
    property m_GeburtsortEhepartner: WideString dispid 45;
    property m_GeburtsnameEhepartner: WideString dispid 46;
    property m_KonfessionEhepartner: WideString dispid 47;
    property m_Guetergemeinschaft: Integer dispid 48;
    property m_BerufEhepartner: WideString dispid 49;
    property m_ArbeitgeberEhepartner: WideString dispid 50;
    property m_RentenversNrEhepartner: WideString dispid 51;
    property m_SozialversNrEhepartner: WideString dispid 52;
    property m_AnredeEheleute: WideString dispid 53;
    property m_BriefanredeEheleute: WideString dispid 54;
    property m_GrussformelEheleute: WideString dispid 55;
    property m_GesetzlVertreterArt: WideString dispid 56;
    property m_GesetzlVertreterVermerke: WideString dispid 57;
    property m_pKinder: IAddKinder readonly dispid 58;
    property m_pAnsprPartnerFachbereich: IAddAnsprPartnerFachbereich readonly dispid 59;
    property MemberByName[const MemberName: WideString]: WideString readonly dispid 60;
    property m_GesetzlVertreterArtFirma: WideString dispid 61;
    property m_GesetzlVertreterVermerkeFirma: WideString dispid 62;
    property m_pFinanzamt: IAddFinanzamt readonly dispid 63;
    property m_Wuerfel[const bereich: WideString; wj: TDateTime; tochter: Integer]: IAddWuerfel readonly dispid 64;
    property m_Wirtschaftsjahr[index: Integer]: WideString readonly dispid 65;
    property m_AnzahlBFWFormulare[formularid: SYSINT; jahr: SYSINT]: Integer readonly dispid 66;
    property m_AnzahlBFWFormulareMonat[formularid: SYSINT; jahr: SYSINT; monat: SYSINT]: Integer readonly dispid 67;
    property FreiesFeld[const feldname: WideString]: WideString dispid 68;
    property Betriebsstaetten[pos: Integer]: IAddGeschaeftspartner readonly dispid 69;
    property GGW[Formel: SYSINT; monat: SYSINT; jahr: SYSINT]: Double dispid 70;
    property m_MandatBeginnAm: TDateTime readonly dispid 71;
    property m_MandatEndetAm: TDateTime readonly dispid 72;
    property m_IsAktiv: Byte readonly dispid 73;
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
// Interface: IAddFreieFelder
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {74F31677-5B9A-11D3-9CD8-0000F6E74B7E}
// *********************************************************************//
  IAddFreieFelder = interface(IDispatch)
    ['{74F31677-5B9A-11D3-9CD8-0000F6E74B7E}']
    procedure FreiesFeldLabelLaden; safecall;
    procedure FreiesFeldLabelSpeichern; safecall;
    function Get_FreiesFeld1: WideString; safecall;
    procedure Set_FreiesFeld1(const pVal: WideString); safecall;
    function Get_FreiesFeld2: WideString; safecall;
    procedure Set_FreiesFeld2(const pVal: WideString); safecall;
    function Get_FreiesFeld3: WideString; safecall;
    procedure Set_FreiesFeld3(const pVal: WideString); safecall;
    function Get_FreiesFeld4: WideString; safecall;
    procedure Set_FreiesFeld4(const pVal: WideString); safecall;
    function Get_FreiesFeld5: WideString; safecall;
    procedure Set_FreiesFeld5(const pVal: WideString); safecall;
    function Get_FreiesFeld6: WideString; safecall;
    procedure Set_FreiesFeld6(const pVal: WideString); safecall;
    function Get_FreiesFeld7: WideString; safecall;
    procedure Set_FreiesFeld7(const pVal: WideString); safecall;
    function Get_FreiesFeld8: WideString; safecall;
    procedure Set_FreiesFeld8(const pVal: WideString); safecall;
    function Get_FreiesFeld9: WideString; safecall;
    procedure Set_FreiesFeld9(const pVal: WideString); safecall;
    function Get_FreiesFeld10: WideString; safecall;
    procedure Set_FreiesFeld10(const pVal: WideString); safecall;
    function Get_FreiesFeld11: WideString; safecall;
    procedure Set_FreiesFeld11(const pVal: WideString); safecall;
    function Get_FreiesFeld12: WideString; safecall;
    procedure Set_FreiesFeld12(const pVal: WideString); safecall;
    function Get_FreiesFeld13: WideString; safecall;
    procedure Set_FreiesFeld13(const pVal: WideString); safecall;
    function Get_FreiesFeld14: WideString; safecall;
    procedure Set_FreiesFeld14(const pVal: WideString); safecall;
    function Get_FreiesFeld15: WideString; safecall;
    procedure Set_FreiesFeld15(const pVal: WideString); safecall;
    function Get_FreiesFeld16: WideString; safecall;
    procedure Set_FreiesFeld16(const pVal: WideString); safecall;
    function Get_FreiesFeld17: WideString; safecall;
    procedure Set_FreiesFeld17(const pVal: WideString); safecall;
    function Get_FreiesFeld18: WideString; safecall;
    procedure Set_FreiesFeld18(const pVal: WideString); safecall;
    function Get_FreiesFeld19: WideString; safecall;
    procedure Set_FreiesFeld19(const pVal: WideString); safecall;
    function Get_FreiesFeld20: WideString; safecall;
    procedure Set_FreiesFeld20(const pVal: WideString); safecall;
    function Get_FreiesFeld1_Label: WideString; safecall;
    procedure Set_FreiesFeld1_Label(const pVal: WideString); safecall;
    function Get_FreiesFeld2_Label: WideString; safecall;
    procedure Set_FreiesFeld2_Label(const pVal: WideString); safecall;
    function Get_FreiesFeld3_Label: WideString; safecall;
    procedure Set_FreiesFeld3_Label(const pVal: WideString); safecall;
    function Get_FreiesFeld4_Label: WideString; safecall;
    procedure Set_FreiesFeld4_Label(const pVal: WideString); safecall;
    function Get_FreiesFeld5_Label: WideString; safecall;
    procedure Set_FreiesFeld5_Label(const pVal: WideString); safecall;
    function Get_FreiesFeld6_Label: WideString; safecall;
    procedure Set_FreiesFeld6_Label(const pVal: WideString); safecall;
    function Get_FreiesFeld7_Label: WideString; safecall;
    procedure Set_FreiesFeld7_Label(const pVal: WideString); safecall;
    function Get_FreiesFeld8_Label: WideString; safecall;
    procedure Set_FreiesFeld8_Label(const pVal: WideString); safecall;
    function Get_FreiesFeld9_Label: WideString; safecall;
    procedure Set_FreiesFeld9_Label(const pVal: WideString); safecall;
    function Get_FreiesFeld10_Label: WideString; safecall;
    procedure Set_FreiesFeld10_Label(const pVal: WideString); safecall;
    function Get_FreiesFeld11_Label: WideString; safecall;
    procedure Set_FreiesFeld11_Label(const pVal: WideString); safecall;
    function Get_FreiesFeld12_Label: WideString; safecall;
    procedure Set_FreiesFeld12_Label(const pVal: WideString); safecall;
    function Get_FreiesFeld13_Label: WideString; safecall;
    procedure Set_FreiesFeld13_Label(const pVal: WideString); safecall;
    function Get_FreiesFeld14_Label: WideString; safecall;
    procedure Set_FreiesFeld14_Label(const pVal: WideString); safecall;
    function Get_FreiesFeld15_Label: WideString; safecall;
    procedure Set_FreiesFeld15_Label(const pVal: WideString); safecall;
    function Get_FreiesFeld16_Label: WideString; safecall;
    procedure Set_FreiesFeld16_Label(const pVal: WideString); safecall;
    function Get_FreiesFeld17_Label: WideString; safecall;
    procedure Set_FreiesFeld17_Label(const pVal: WideString); safecall;
    function Get_FreiesFeld18_Label: WideString; safecall;
    procedure Set_FreiesFeld18_Label(const pVal: WideString); safecall;
    function Get_FreiesFeld19_Label: WideString; safecall;
    procedure Set_FreiesFeld19_Label(const pVal: WideString); safecall;
    function Get_FreiesFeld20_Label: WideString; safecall;
    procedure Set_FreiesFeld20_Label(const pVal: WideString); safecall;
    property FreiesFeld1: WideString read Get_FreiesFeld1 write Set_FreiesFeld1;
    property FreiesFeld2: WideString read Get_FreiesFeld2 write Set_FreiesFeld2;
    property FreiesFeld3: WideString read Get_FreiesFeld3 write Set_FreiesFeld3;
    property FreiesFeld4: WideString read Get_FreiesFeld4 write Set_FreiesFeld4;
    property FreiesFeld5: WideString read Get_FreiesFeld5 write Set_FreiesFeld5;
    property FreiesFeld6: WideString read Get_FreiesFeld6 write Set_FreiesFeld6;
    property FreiesFeld7: WideString read Get_FreiesFeld7 write Set_FreiesFeld7;
    property FreiesFeld8: WideString read Get_FreiesFeld8 write Set_FreiesFeld8;
    property FreiesFeld9: WideString read Get_FreiesFeld9 write Set_FreiesFeld9;
    property FreiesFeld10: WideString read Get_FreiesFeld10 write Set_FreiesFeld10;
    property FreiesFeld11: WideString read Get_FreiesFeld11 write Set_FreiesFeld11;
    property FreiesFeld12: WideString read Get_FreiesFeld12 write Set_FreiesFeld12;
    property FreiesFeld13: WideString read Get_FreiesFeld13 write Set_FreiesFeld13;
    property FreiesFeld14: WideString read Get_FreiesFeld14 write Set_FreiesFeld14;
    property FreiesFeld15: WideString read Get_FreiesFeld15 write Set_FreiesFeld15;
    property FreiesFeld16: WideString read Get_FreiesFeld16 write Set_FreiesFeld16;
    property FreiesFeld17: WideString read Get_FreiesFeld17 write Set_FreiesFeld17;
    property FreiesFeld18: WideString read Get_FreiesFeld18 write Set_FreiesFeld18;
    property FreiesFeld19: WideString read Get_FreiesFeld19 write Set_FreiesFeld19;
    property FreiesFeld20: WideString read Get_FreiesFeld20 write Set_FreiesFeld20;
    property FreiesFeld1_Label: WideString read Get_FreiesFeld1_Label write Set_FreiesFeld1_Label;
    property FreiesFeld2_Label: WideString read Get_FreiesFeld2_Label write Set_FreiesFeld2_Label;
    property FreiesFeld3_Label: WideString read Get_FreiesFeld3_Label write Set_FreiesFeld3_Label;
    property FreiesFeld4_Label: WideString read Get_FreiesFeld4_Label write Set_FreiesFeld4_Label;
    property FreiesFeld5_Label: WideString read Get_FreiesFeld5_Label write Set_FreiesFeld5_Label;
    property FreiesFeld6_Label: WideString read Get_FreiesFeld6_Label write Set_FreiesFeld6_Label;
    property FreiesFeld7_Label: WideString read Get_FreiesFeld7_Label write Set_FreiesFeld7_Label;
    property FreiesFeld8_Label: WideString read Get_FreiesFeld8_Label write Set_FreiesFeld8_Label;
    property FreiesFeld9_Label: WideString read Get_FreiesFeld9_Label write Set_FreiesFeld9_Label;
    property FreiesFeld10_Label: WideString read Get_FreiesFeld10_Label write Set_FreiesFeld10_Label;
    property FreiesFeld11_Label: WideString read Get_FreiesFeld11_Label write Set_FreiesFeld11_Label;
    property FreiesFeld12_Label: WideString read Get_FreiesFeld12_Label write Set_FreiesFeld12_Label;
    property FreiesFeld13_Label: WideString read Get_FreiesFeld13_Label write Set_FreiesFeld13_Label;
    property FreiesFeld14_Label: WideString read Get_FreiesFeld14_Label write Set_FreiesFeld14_Label;
    property FreiesFeld15_Label: WideString read Get_FreiesFeld15_Label write Set_FreiesFeld15_Label;
    property FreiesFeld16_Label: WideString read Get_FreiesFeld16_Label write Set_FreiesFeld16_Label;
    property FreiesFeld17_Label: WideString read Get_FreiesFeld17_Label write Set_FreiesFeld17_Label;
    property FreiesFeld18_Label: WideString read Get_FreiesFeld18_Label write Set_FreiesFeld18_Label;
    property FreiesFeld19_Label: WideString read Get_FreiesFeld19_Label write Set_FreiesFeld19_Label;
    property FreiesFeld20_Label: WideString read Get_FreiesFeld20_Label write Set_FreiesFeld20_Label;
  end;

// *********************************************************************//
// DispIntf:  IAddFreieFelderDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {74F31677-5B9A-11D3-9CD8-0000F6E74B7E}
// *********************************************************************//
  IAddFreieFelderDisp = dispinterface
    ['{74F31677-5B9A-11D3-9CD8-0000F6E74B7E}']
    procedure FreiesFeldLabelLaden; dispid 1;
    procedure FreiesFeldLabelSpeichern; dispid 2;
    property FreiesFeld1: WideString dispid 3;
    property FreiesFeld2: WideString dispid 4;
    property FreiesFeld3: WideString dispid 5;
    property FreiesFeld4: WideString dispid 6;
    property FreiesFeld5: WideString dispid 7;
    property FreiesFeld6: WideString dispid 8;
    property FreiesFeld7: WideString dispid 9;
    property FreiesFeld8: WideString dispid 10;
    property FreiesFeld9: WideString dispid 11;
    property FreiesFeld10: WideString dispid 12;
    property FreiesFeld11: WideString dispid 13;
    property FreiesFeld12: WideString dispid 14;
    property FreiesFeld13: WideString dispid 15;
    property FreiesFeld14: WideString dispid 16;
    property FreiesFeld15: WideString dispid 17;
    property FreiesFeld16: WideString dispid 18;
    property FreiesFeld17: WideString dispid 19;
    property FreiesFeld18: WideString dispid 20;
    property FreiesFeld19: WideString dispid 21;
    property FreiesFeld20: WideString dispid 22;
    property FreiesFeld1_Label: WideString dispid 23;
    property FreiesFeld2_Label: WideString dispid 24;
    property FreiesFeld3_Label: WideString dispid 25;
    property FreiesFeld4_Label: WideString dispid 26;
    property FreiesFeld5_Label: WideString dispid 27;
    property FreiesFeld6_Label: WideString dispid 28;
    property FreiesFeld7_Label: WideString dispid 29;
    property FreiesFeld8_Label: WideString dispid 30;
    property FreiesFeld9_Label: WideString dispid 31;
    property FreiesFeld10_Label: WideString dispid 32;
    property FreiesFeld11_Label: WideString dispid 33;
    property FreiesFeld12_Label: WideString dispid 34;
    property FreiesFeld13_Label: WideString dispid 35;
    property FreiesFeld14_Label: WideString dispid 36;
    property FreiesFeld15_Label: WideString dispid 37;
    property FreiesFeld16_Label: WideString dispid 38;
    property FreiesFeld17_Label: WideString dispid 39;
    property FreiesFeld18_Label: WideString dispid 40;
    property FreiesFeld19_Label: WideString dispid 41;
    property FreiesFeld20_Label: WideString dispid 42;
  end;

// *********************************************************************//
// Interface: IAddKinder
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {7040F873-6518-11D3-9CE6-0000F6E74B7E}
// *********************************************************************//
  IAddKinder = interface(IDispatch)
    ['{7040F873-6518-11D3-9CE6-0000F6E74B7E}']
    function Get_FirstKind: Integer; safecall;
    function Get_NextKind: Integer; safecall;
    function Get_KindVorname: WideString; safecall;
    procedure Set_KindVorname(const pVal: WideString); safecall;
    function Get_KindFamilienname: WideString; safecall;
    procedure Set_KindFamilienname(const pVal: WideString); safecall;
    function Get_KindGeburtstag: TDateTime; safecall;
    procedure Set_KindGeburtstag(pVal: TDateTime); safecall;
    function Get_KindVHName: WideString; safecall;
    procedure Set_KindVHName(const pVal: WideString); safecall;
    function Get_KindVHAnschrift: WideString; safecall;
    procedure Set_KindVHAnschrift(const pVal: WideString); safecall;
    function Get_KindVHGeburtstag: TDateTime; safecall;
    procedure Set_KindVHGeburtstag(pVal: TDateTime); safecall;
    function Get_KindAusbildung: WideString; safecall;
    procedure Set_KindAusbildung(const pVal: WideString); safecall;
    function Get_KindAusbildungVon: TDateTime; safecall;
    procedure Set_KindAusbildungVon(pVal: TDateTime); safecall;
    function Get_KindAusbildungBis: TDateTime; safecall;
    procedure Set_KindAusbildungBis(pVal: TDateTime); safecall;
    procedure Set_SetKind(Param1: Integer); safecall;
    property FirstKind: Integer read Get_FirstKind;
    property NextKind: Integer read Get_NextKind;
    property KindVorname: WideString read Get_KindVorname write Set_KindVorname;
    property KindFamilienname: WideString read Get_KindFamilienname write Set_KindFamilienname;
    property KindGeburtstag: TDateTime read Get_KindGeburtstag write Set_KindGeburtstag;
    property KindVHName: WideString read Get_KindVHName write Set_KindVHName;
    property KindVHAnschrift: WideString read Get_KindVHAnschrift write Set_KindVHAnschrift;
    property KindVHGeburtstag: TDateTime read Get_KindVHGeburtstag write Set_KindVHGeburtstag;
    property KindAusbildung: WideString read Get_KindAusbildung write Set_KindAusbildung;
    property KindAusbildungVon: TDateTime read Get_KindAusbildungVon write Set_KindAusbildungVon;
    property KindAusbildungBis: TDateTime read Get_KindAusbildungBis write Set_KindAusbildungBis;
    property SetKind: Integer write Set_SetKind;
  end;

// *********************************************************************//
// DispIntf:  IAddKinderDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {7040F873-6518-11D3-9CE6-0000F6E74B7E}
// *********************************************************************//
  IAddKinderDisp = dispinterface
    ['{7040F873-6518-11D3-9CE6-0000F6E74B7E}']
    property FirstKind: Integer readonly dispid 1;
    property NextKind: Integer readonly dispid 2;
    property KindVorname: WideString dispid 3;
    property KindFamilienname: WideString dispid 4;
    property KindGeburtstag: TDateTime dispid 5;
    property KindVHName: WideString dispid 6;
    property KindVHAnschrift: WideString dispid 7;
    property KindVHGeburtstag: TDateTime dispid 8;
    property KindAusbildung: WideString dispid 9;
    property KindAusbildungVon: TDateTime dispid 10;
    property KindAusbildungBis: TDateTime dispid 11;
    property SetKind: Integer writeonly dispid 12;
  end;

// *********************************************************************//
// Interface: IAddAnsprPartnerFachbereich
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4C46B923-69E4-11D3-9CEB-0000F6E74B7E}
// *********************************************************************//
  IAddAnsprPartnerFachbereich = interface(IDispatch)
    ['{4C46B923-69E4-11D3-9CEB-0000F6E74B7E}']
    function Get_m_pHauptAnsprechPartner: IAddAnsprPartner; safecall;
    function Get_m_pFibuAnsprechPartner: IAddAnsprPartner; safecall;
    function Get_m_pLohnAnsprechPartner: IAddAnsprPartner; safecall;
    function Get_m_pBilanzAnsprechPartner: IAddAnsprPartner; safecall;
    function Get_m_pBSTAnsprechPartner: IAddAnsprPartner; safecall;
    function Get_m_pPrivStAnsprechPartner: IAddAnsprPartner; safecall;
    function Get_m_pSTBAnsprechPartner: IAddAnsprPartner; safecall;
    function Get_m_pSonstigeAnsprechPartner: IAddAnsprPartner; safecall;
    property m_pHauptAnsprechPartner: IAddAnsprPartner read Get_m_pHauptAnsprechPartner;
    property m_pFibuAnsprechPartner: IAddAnsprPartner read Get_m_pFibuAnsprechPartner;
    property m_pLohnAnsprechPartner: IAddAnsprPartner read Get_m_pLohnAnsprechPartner;
    property m_pBilanzAnsprechPartner: IAddAnsprPartner read Get_m_pBilanzAnsprechPartner;
    property m_pBSTAnsprechPartner: IAddAnsprPartner read Get_m_pBSTAnsprechPartner;
    property m_pPrivStAnsprechPartner: IAddAnsprPartner read Get_m_pPrivStAnsprechPartner;
    property m_pSTBAnsprechPartner: IAddAnsprPartner read Get_m_pSTBAnsprechPartner;
    property m_pSonstigeAnsprechPartner: IAddAnsprPartner read Get_m_pSonstigeAnsprechPartner;
  end;

// *********************************************************************//
// DispIntf:  IAddAnsprPartnerFachbereichDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4C46B923-69E4-11D3-9CEB-0000F6E74B7E}
// *********************************************************************//
  IAddAnsprPartnerFachbereichDisp = dispinterface
    ['{4C46B923-69E4-11D3-9CEB-0000F6E74B7E}']
    property m_pHauptAnsprechPartner: IAddAnsprPartner readonly dispid 1;
    property m_pFibuAnsprechPartner: IAddAnsprPartner readonly dispid 2;
    property m_pLohnAnsprechPartner: IAddAnsprPartner readonly dispid 3;
    property m_pBilanzAnsprechPartner: IAddAnsprPartner readonly dispid 4;
    property m_pBSTAnsprechPartner: IAddAnsprPartner readonly dispid 5;
    property m_pPrivStAnsprechPartner: IAddAnsprPartner readonly dispid 6;
    property m_pSTBAnsprechPartner: IAddAnsprPartner readonly dispid 7;
    property m_pSonstigeAnsprechPartner: IAddAnsprPartner readonly dispid 8;
  end;

// *********************************************************************//
// Interface: IAddAnsprPartner
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4C46B926-69E4-11D3-9CEB-0000F6E74B7E}
// *********************************************************************//
  IAddAnsprPartner = interface(IDispatch)
    ['{4C46B926-69E4-11D3-9CEB-0000F6E74B7E}']
    function Get_m_Anrede: WideString; safecall;
    procedure Set_m_Anrede(const pVal: WideString); safecall;
    function Get_m_Name: WideString; safecall;
    procedure Set_m_Name(const pVal: WideString); safecall;
    function Get_m_Vorname: WideString; safecall;
    procedure Set_m_Vorname(const pVal: WideString); safecall;
    function Get_m_Funktion: WideString; safecall;
    procedure Set_m_Funktion(const pVal: WideString); safecall;
    function Get_m_Telefon: WideString; safecall;
    procedure Set_m_Telefon(const pVal: WideString); safecall;
    function Get_m_Kurzwahl: WideString; safecall;
    procedure Set_m_Kurzwahl(const pVal: WideString); safecall;
    function Get_m_Fax: WideString; safecall;
    procedure Set_m_Fax(const pVal: WideString); safecall;
    function Get_m_Telefon2: WideString; safecall;
    procedure Set_m_Telefon2(const pVal: WideString); safecall;
    property m_Anrede: WideString read Get_m_Anrede write Set_m_Anrede;
    property m_Name: WideString read Get_m_Name write Set_m_Name;
    property m_Vorname: WideString read Get_m_Vorname write Set_m_Vorname;
    property m_Funktion: WideString read Get_m_Funktion write Set_m_Funktion;
    property m_Telefon: WideString read Get_m_Telefon write Set_m_Telefon;
    property m_Kurzwahl: WideString read Get_m_Kurzwahl write Set_m_Kurzwahl;
    property m_Fax: WideString read Get_m_Fax write Set_m_Fax;
    property m_Telefon2: WideString read Get_m_Telefon2 write Set_m_Telefon2;
  end;

// *********************************************************************//
// DispIntf:  IAddAnsprPartnerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4C46B926-69E4-11D3-9CEB-0000F6E74B7E}
// *********************************************************************//
  IAddAnsprPartnerDisp = dispinterface
    ['{4C46B926-69E4-11D3-9CEB-0000F6E74B7E}']
    property m_Anrede: WideString dispid 1;
    property m_Name: WideString dispid 2;
    property m_Vorname: WideString dispid 3;
    property m_Funktion: WideString dispid 4;
    property m_Telefon: WideString dispid 5;
    property m_Kurzwahl: WideString dispid 6;
    property m_Fax: WideString dispid 7;
    property m_Telefon2: WideString dispid 8;
  end;

// *********************************************************************//
// Interface: IAddFinanzamt
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {512E4971-F416-11D3-9DB5-005004510B61}
// *********************************************************************//
  IAddFinanzamt = interface(IDispatch)
    ['{512E4971-F416-11D3-9DB5-005004510B61}']
    function Get_m_Name: WideString; safecall;
    procedure Set_m_Name(const pVal: WideString); safecall;
    function Get_m_FAnr: WideString; safecall;
    procedure Set_m_FAnr(const pVal: WideString); safecall;
    function Get_m_Kurzname: WideString; safecall;
    procedure Set_m_Kurzname(const pVal: WideString); safecall;
    function Get_m_Strasse: WideString; safecall;
    procedure Set_m_Strasse(const pVal: WideString); safecall;
    function Get_m_PLZ: WideString; safecall;
    procedure Set_m_PLZ(const pVal: WideString); safecall;
    function Get_m_Ort: WideString; safecall;
    procedure Set_m_Ort(const pVal: WideString); safecall;
    function Get_m_Bundesland: WideString; safecall;
    procedure Set_m_Bundesland(const pVal: WideString); safecall;
    function Get_m_Land: WideString; safecall;
    procedure Set_m_Land(const pVal: WideString); safecall;
    function Get_m_BLZ: WideString; safecall;
    procedure Set_m_BLZ(const pVal: WideString); safecall;
    function Get_m_Bank: WideString; safecall;
    procedure Set_m_Bank(const pVal: WideString); safecall;
    function Get_m_Kontonummer: WideString; safecall;
    procedure Set_m_Kontonummer(const pVal: WideString); safecall;
    property m_Name: WideString read Get_m_Name write Set_m_Name;
    property m_FAnr: WideString read Get_m_FAnr write Set_m_FAnr;
    property m_Kurzname: WideString read Get_m_Kurzname write Set_m_Kurzname;
    property m_Strasse: WideString read Get_m_Strasse write Set_m_Strasse;
    property m_PLZ: WideString read Get_m_PLZ write Set_m_PLZ;
    property m_Ort: WideString read Get_m_Ort write Set_m_Ort;
    property m_Bundesland: WideString read Get_m_Bundesland write Set_m_Bundesland;
    property m_Land: WideString read Get_m_Land write Set_m_Land;
    property m_BLZ: WideString read Get_m_BLZ write Set_m_BLZ;
    property m_Bank: WideString read Get_m_Bank write Set_m_Bank;
    property m_Kontonummer: WideString read Get_m_Kontonummer write Set_m_Kontonummer;
  end;

// *********************************************************************//
// DispIntf:  IAddFinanzamtDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {512E4971-F416-11D3-9DB5-005004510B61}
// *********************************************************************//
  IAddFinanzamtDisp = dispinterface
    ['{512E4971-F416-11D3-9DB5-005004510B61}']
    property m_Name: WideString dispid 1;
    property m_FAnr: WideString dispid 2;
    property m_Kurzname: WideString dispid 3;
    property m_Strasse: WideString dispid 4;
    property m_PLZ: WideString dispid 5;
    property m_Ort: WideString dispid 6;
    property m_Bundesland: WideString dispid 7;
    property m_Land: WideString dispid 8;
    property m_BLZ: WideString dispid 9;
    property m_Bank: WideString dispid 10;
    property m_Kontonummer: WideString dispid 11;
  end;

// *********************************************************************//
// Interface: IAddWuerfel
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {744EA0F0-745F-4475-9712-C82BD5FDBBDD}
// *********************************************************************//
  IAddWuerfel = interface(IDispatch)
    ['{744EA0F0-745F-4475-9712-C82BD5FDBBDD}']
    function Get_GetWert(const art: WideString; const Id: WideString; const kost: WideString): Currency; safecall;
    function Get_GetFirstID: WideString; safecall;
    function Get_GetNextID: WideString; safecall;
    function Get_GetWertFromID(const __MIDL_0013: WideString): Currency; safecall;
    function Get_GetArt(const Id: WideString): WideString; safecall;
    function Get_GetKonto(const Id: WideString): WideString; safecall;
    function Get_GetKost(const Id: WideString): WideString; safecall;
    function Get_GetWertArtFromId(const Id: WideString; const art: WideString; periode: Integer; 
                                  kumuliert: Integer): Currency; safecall;
    function Get_GetWertX(const IdentType: WideString; Zeitraum: AddZeitraum; Wertart: AddWertart; 
                          Wertabgriff: AddWertabgriff; periode: Integer): Currency; safecall;
    property GetWert[const art: WideString; const Id: WideString; const kost: WideString]: Currency read Get_GetWert;
    property GetFirstID: WideString read Get_GetFirstID;
    property GetNextID: WideString read Get_GetNextID;
    property GetWertFromID[const __MIDL_0013: WideString]: Currency read Get_GetWertFromID;
    property GetArt[const Id: WideString]: WideString read Get_GetArt;
    property GetKonto[const Id: WideString]: WideString read Get_GetKonto;
    property GetKost[const Id: WideString]: WideString read Get_GetKost;
    property GetWertArtFromId[const Id: WideString; const art: WideString; periode: Integer; 
                              kumuliert: Integer]: Currency read Get_GetWertArtFromId;
    property GetWertX[const IdentType: WideString; Zeitraum: AddZeitraum; Wertart: AddWertart; 
                      Wertabgriff: AddWertabgriff; periode: Integer]: Currency read Get_GetWertX;
  end;

// *********************************************************************//
// DispIntf:  IAddWuerfelDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {744EA0F0-745F-4475-9712-C82BD5FDBBDD}
// *********************************************************************//
  IAddWuerfelDisp = dispinterface
    ['{744EA0F0-745F-4475-9712-C82BD5FDBBDD}']
    property GetWert[const art: WideString; const Id: WideString; const kost: WideString]: Currency readonly dispid 1;
    property GetFirstID: WideString readonly dispid 2;
    property GetNextID: WideString readonly dispid 3;
    property GetWertFromID[const __MIDL_0013: WideString]: Currency readonly dispid 4;
    property GetArt[const Id: WideString]: WideString readonly dispid 5;
    property GetKonto[const Id: WideString]: WideString readonly dispid 6;
    property GetKost[const Id: WideString]: WideString readonly dispid 7;
    property GetWertArtFromId[const Id: WideString; const art: WideString; periode: Integer; 
                              kumuliert: Integer]: Currency readonly dispid 8;
    property GetWertX[const IdentType: WideString; Zeitraum: AddZeitraum; Wertart: AddWertart; 
                      Wertabgriff: AddWertabgriff; periode: Integer]: Currency readonly dispid 9;
  end;

// *********************************************************************//
// Interface: IAddWaehrung
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {29EA9B98-68F8-11D2-ADEB-000083F3B333}
// *********************************************************************//
  IAddWaehrung = interface(IDispatch)
    ['{29EA9B98-68F8-11D2-ADEB-000083F3B333}']
    function Get_m_Hauswaehrung: Smallint; safecall;
    function Get_CalcFromTo(fromWID: Smallint; toWID: Smallint; betrag: Currency): Currency; safecall;
    function Get_GetKuerzel(__MIDL_0011: Smallint): WideString; safecall;
    function Get_GetWaehrungsID(const __MIDL_0012: WideString): Smallint; safecall;
    procedure WriteWaehrungstabelle(const odbsStr: WideString); safecall;
    property m_Hauswaehrung: Smallint read Get_m_Hauswaehrung;
    property CalcFromTo[fromWID: Smallint; toWID: Smallint; betrag: Currency]: Currency read Get_CalcFromTo;
    property GetKuerzel[__MIDL_0011: Smallint]: WideString read Get_GetKuerzel;
    property GetWaehrungsID[const __MIDL_0012: WideString]: Smallint read Get_GetWaehrungsID;
  end;

// *********************************************************************//
// DispIntf:  IAddWaehrungDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {29EA9B98-68F8-11D2-ADEB-000083F3B333}
// *********************************************************************//
  IAddWaehrungDisp = dispinterface
    ['{29EA9B98-68F8-11D2-ADEB-000083F3B333}']
    property m_Hauswaehrung: Smallint readonly dispid 1;
    property CalcFromTo[fromWID: Smallint; toWID: Smallint; betrag: Currency]: Currency readonly dispid 2;
    property GetKuerzel[__MIDL_0011: Smallint]: WideString readonly dispid 3;
    property GetWaehrungsID[const __MIDL_0012: WideString]: Smallint readonly dispid 4;
    procedure WriteWaehrungstabelle(const odbsStr: WideString); dispid 5;
  end;

// *********************************************************************//
// Interface: IAddAdressVerwaltungMandant
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {35D382DA-914A-11D2-AE46-000083F3B333}
// *********************************************************************//
  IAddAdressVerwaltungMandant = interface(IDispatch)
    ['{35D382DA-914A-11D2-AE46-000083F3B333}']
    function Get_GetFirst: IAddMandant; safecall;
    function Get_GetNext: IAddMandant; safecall;
    function Get_GetPrev: IAddMandant; safecall;
    function Get_GetLast: IAddMandant; safecall;
    procedure SetFilterKurzname(const __MIDL_0014: WideString); safecall;
    property GetFirst: IAddMandant read Get_GetFirst;
    property GetNext: IAddMandant read Get_GetNext;
    property GetPrev: IAddMandant read Get_GetPrev;
    property GetLast: IAddMandant read Get_GetLast;
  end;

// *********************************************************************//
// DispIntf:  IAddAdressVerwaltungMandantDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {35D382DA-914A-11D2-AE46-000083F3B333}
// *********************************************************************//
  IAddAdressVerwaltungMandantDisp = dispinterface
    ['{35D382DA-914A-11D2-AE46-000083F3B333}']
    property GetFirst: IAddMandant readonly dispid 1;
    property GetNext: IAddMandant readonly dispid 2;
    property GetPrev: IAddMandant readonly dispid 3;
    property GetLast: IAddMandant readonly dispid 4;
    procedure SetFilterKurzname(const __MIDL_0014: WideString); dispid 5;
  end;

// *********************************************************************//
// Interface: IStaticCollection
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {D3162C97-DE97-11D1-B6C8-204C4F4F5020}
// *********************************************************************//
  IStaticCollection = interface(IDispatch)
    ['{D3162C97-DE97-11D1-B6C8-204C4F4F5020}']
    function Get_Count: Smallint; safecall;
    function _NewEnum: IUnknown; safecall;
    procedure Refresh; safecall;
    function Get_Item(index: Integer): OleVariant; safecall;
    function Get_AskFor(Key: OleVariant): OleVariant; safecall;
    property Count: Smallint read Get_Count;
    property Item[index: Integer]: OleVariant read Get_Item; default;
    property AskFor[Key: OleVariant]: OleVariant read Get_AskFor;
  end;

// *********************************************************************//
// DispIntf:  IStaticCollectionDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {D3162C97-DE97-11D1-B6C8-204C4F4F5020}
// *********************************************************************//
  IStaticCollectionDisp = dispinterface
    ['{D3162C97-DE97-11D1-B6C8-204C4F4F5020}']
    property Count: Smallint readonly dispid 1610743808;
    function _NewEnum: IUnknown; dispid -4;
    procedure Refresh; dispid 1610743810;
    property Item[index: Integer]: OleVariant readonly dispid 0; default;
    property AskFor[Key: OleVariant]: OleVariant readonly dispid 1;
  end;

// *********************************************************************//
// Interface: IDynamicCollection
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {D3162C98-DE97-11D1-B6C8-204C4F4F5020}
// *********************************************************************//
  IDynamicCollection = interface(IStaticCollection)
    ['{D3162C98-DE97-11D1-B6C8-204C4F4F5020}']
    procedure Append(const Object_: IDispatch); safecall;
    procedure DeleteByIndex(index: Smallint); safecall;
    procedure DeleteByObject(const Object_: IDispatch); safecall;
  end;

// *********************************************************************//
// DispIntf:  IDynamicCollectionDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {D3162C98-DE97-11D1-B6C8-204C4F4F5020}
// *********************************************************************//
  IDynamicCollectionDisp = dispinterface
    ['{D3162C98-DE97-11D1-B6C8-204C4F4F5020}']
    procedure Append(const Object_: IDispatch); dispid 1610809344;
    procedure DeleteByIndex(index: Smallint); dispid 1610809346;
    procedure DeleteByObject(const Object_: IDispatch); dispid 1610809347;
    property Count: Smallint readonly dispid 1610743808;
    function _NewEnum: IUnknown; dispid -4;
    procedure Refresh; dispid 1610743810;
    property Item[index: Integer]: OleVariant readonly dispid 0; default;
    property AskFor[Key: OleVariant]: OleVariant readonly dispid 1;
  end;

// *********************************************************************//
// Interface: IAddKanzlei
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {29EA9B9E-68F8-11D2-ADEB-000083F3B333}
// *********************************************************************//
  IAddKanzlei = interface(IDispatch)
    ['{29EA9B9E-68F8-11D2-ADEB-000083F3B333}']
  end;

// *********************************************************************//
// DispIntf:  IAddKanzleiDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {29EA9B9E-68F8-11D2-ADEB-000083F3B333}
// *********************************************************************//
  IAddKanzleiDisp = dispinterface
    ['{29EA9B9E-68F8-11D2-ADEB-000083F3B333}']
  end;

// *********************************************************************//
// Interface: IAddProtokoll
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {35D382D7-914A-11D2-AE46-000083F3B333}
// *********************************************************************//
  IAddProtokoll = interface(IDispatch)
    ['{35D382D7-914A-11D2-AE46-000083F3B333}']
    procedure AddLine(const text: WideString); safecall;
    function Get_GetNextLine: WideString; safecall;
    property GetNextLine: WideString read Get_GetNextLine;
  end;

// *********************************************************************//
// DispIntf:  IAddProtokollDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {35D382D7-914A-11D2-AE46-000083F3B333}
// *********************************************************************//
  IAddProtokollDisp = dispinterface
    ['{35D382D7-914A-11D2-AE46-000083F3B333}']
    procedure AddLine(const text: WideString); dispid 1;
    property GetNextLine: WideString readonly dispid 2;
  end;

// *********************************************************************//
// Interface: IAddWorkflowManager
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C6159836-813F-46B3-9B06-EDB45E664382}
// *********************************************************************//
  IAddWorkflowManager = interface(IDispatch)
    ['{C6159836-813F-46B3-9B06-EDB45E664382}']
    procedure ChDir(const __MIDL_0015: WideString); safecall;
    function Get_m_CurrentDir: WideString; safecall;
    function Get_m_SubDir(__MIDL_0016: Integer): WideString; safecall;
    procedure ChRootUser; safecall;
    procedure ChRootKanzlei; safecall;
    procedure ChRootAddison; safecall;
    function Get_m_CurrentPath: WideString; safecall;
    function Get_m_WorkflowItem(pos: Integer): IAddWorkflowItem; safecall;
    procedure AddDocument(const __MIDL_0017: IAddWorkflowItem); safecall;
    procedure ChangeToStandardExterneDokumente; safecall;
    function Get_CreateDocument: IAddWorkflowItem; safecall;
    property m_CurrentDir: WideString read Get_m_CurrentDir;
    property m_SubDir[__MIDL_0016: Integer]: WideString read Get_m_SubDir;
    property m_CurrentPath: WideString read Get_m_CurrentPath;
    property m_WorkflowItem[pos: Integer]: IAddWorkflowItem read Get_m_WorkflowItem;
    property CreateDocument: IAddWorkflowItem read Get_CreateDocument;
  end;

// *********************************************************************//
// DispIntf:  IAddWorkflowManagerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C6159836-813F-46B3-9B06-EDB45E664382}
// *********************************************************************//
  IAddWorkflowManagerDisp = dispinterface
    ['{C6159836-813F-46B3-9B06-EDB45E664382}']
    procedure ChDir(const __MIDL_0015: WideString); dispid 1;
    property m_CurrentDir: WideString readonly dispid 2;
    property m_SubDir[__MIDL_0016: Integer]: WideString readonly dispid 3;
    procedure ChRootUser; dispid 4;
    procedure ChRootKanzlei; dispid 5;
    procedure ChRootAddison; dispid 6;
    property m_CurrentPath: WideString readonly dispid 7;
    property m_WorkflowItem[pos: Integer]: IAddWorkflowItem readonly dispid 8;
    procedure AddDocument(const __MIDL_0017: IAddWorkflowItem); dispid 9;
    procedure ChangeToStandardExterneDokumente; dispid 10;
    property CreateDocument: IAddWorkflowItem readonly dispid 11;
  end;

// *********************************************************************//
// Interface: IAddWorkflowItem
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A3E4B889-E025-4CD8-B8E4-AAB7B6865831}
// *********************************************************************//
  IAddWorkflowItem = interface(IDispatch)
    ['{A3E4B889-E025-4CD8-B8E4-AAB7B6865831}']
    procedure Store; safecall;
    procedure Delete; safecall;
    function Get_m_Eigenschaft(const Name: WideString): WideString; safecall;
    procedure Set_m_Eigenschaft(const Name: WideString; const pVal: WideString); safecall;
    property m_Eigenschaft[const Name: WideString]: WideString read Get_m_Eigenschaft write Set_m_Eigenschaft;
  end;

// *********************************************************************//
// DispIntf:  IAddWorkflowItemDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A3E4B889-E025-4CD8-B8E4-AAB7B6865831}
// *********************************************************************//
  IAddWorkflowItemDisp = dispinterface
    ['{A3E4B889-E025-4CD8-B8E4-AAB7B6865831}']
    procedure Store; dispid 1;
    procedure Delete; dispid 2;
    property m_Eigenschaft[const Name: WideString]: WideString dispid 3;
  end;

// *********************************************************************//
// Interface: IAddTools
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C71FF228-4FF1-4075-A43A-F529A380CEDA}
// *********************************************************************//
  IAddTools = interface(IDispatch)
    ['{C71FF228-4FF1-4075-A43A-F529A380CEDA}']
    function Get_NetGetUniversalName(const localPath: WideString): WideString; safecall;
    function Get_UniqueFilename(const vorlage: WideString): WideString; safecall;
    property NetGetUniversalName[const localPath: WideString]: WideString read Get_NetGetUniversalName;
    property UniqueFilename[const vorlage: WideString]: WideString read Get_UniqueFilename;
  end;

// *********************************************************************//
// DispIntf:  IAddToolsDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C71FF228-4FF1-4075-A43A-F529A380CEDA}
// *********************************************************************//
  IAddToolsDisp = dispinterface
    ['{C71FF228-4FF1-4075-A43A-F529A380CEDA}']
    property NetGetUniversalName[const localPath: WideString]: WideString readonly dispid 1;
    property UniqueFilename[const vorlage: WideString]: WideString readonly dispid 2;
  end;

// *********************************************************************//
// Interface: IAddServerItem
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {96901834-3735-4A8E-9373-038579424BE3}
// *********************************************************************//
  IAddServerItem = interface(IDispatch)
    ['{96901834-3735-4A8E-9373-038579424BE3}']
    procedure Init(const szProject: WideString; nVJahr: SYSINT); safecall;
    procedure Open(const szConnect: WideString; nVersion: SYSINT); safecall;
    function Get_Close: WideString; safecall;
    procedure AppendFile(const szRTFFile: WideString; lIndex: Integer); safecall;
    procedure AppendText(const szRTFText: WideString; lIndex: Integer); safecall;
    function Get_Request(const __MIDL_0018: WideString): OleVariant; safecall;
    procedure Execute(const sCmd: WideString; aParam: OleVariant); safecall;
    property Close: WideString read Get_Close;
    property Request[const __MIDL_0018: WideString]: OleVariant read Get_Request;
  end;

// *********************************************************************//
// DispIntf:  IAddServerItemDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {96901834-3735-4A8E-9373-038579424BE3}
// *********************************************************************//
  IAddServerItemDisp = dispinterface
    ['{96901834-3735-4A8E-9373-038579424BE3}']
    procedure Init(const szProject: WideString; nVJahr: SYSINT); dispid 1;
    procedure Open(const szConnect: WideString; nVersion: SYSINT); dispid 2;
    property Close: WideString readonly dispid 3;
    procedure AppendFile(const szRTFFile: WideString; lIndex: Integer); dispid 4;
    procedure AppendText(const szRTFText: WideString; lIndex: Integer); dispid 5;
    property Request[const __MIDL_0018: WideString]: OleVariant readonly dispid 6;
    procedure Execute(const sCmd: WideString; aParam: OleVariant); dispid 7;
  end;

// *********************************************************************//
// Interface: IAddWuerfelAnsicht
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C880579F-1018-497E-B5CB-2AD4A62D378D}
// *********************************************************************//
  IAddWuerfelAnsicht = interface(IDispatch)
    ['{C880579F-1018-497E-B5CB-2AD4A62D378D}']
    function Get_GetWert(x: Integer; y: Integer): WideString; safecall;
    function Get_GetFormat(x: Integer; y: Integer): WideString; safecall;
    procedure LoadAnsicht(const bereich: WideString; const ansicht: WideString); safecall;
    procedure ReloadCurrentAnsicht; safecall;
    function Get_m_Mandant: Integer; safecall;
    procedure Set_m_Mandant(pVal: Integer); safecall;
    function Get_m_WJ: TDateTime; safecall;
    procedure Set_m_WJ(pVal: TDateTime); safecall;
    function Get_m_AbgrenzPeriode: TDateTime; safecall;
    procedure Set_m_AbgrenzPeriode(pVal: TDateTime); safecall;
    function Get_EnumBereiche(pos: Integer): WideString; safecall;
    function Get_EnumAnsichten(const bereich: WideString; pos: Integer): WideString; safecall;
    function Get_m_RowCount: Integer; safecall;
    function Get_m_ColCount: Integer; safecall;
    function Get_m_ColBreite(col: Integer): Integer; safecall;
    function Get_m_Title(col: Integer): WideString; safecall;
    function Get_m_ColAlign(col: Integer): WideString; safecall;
    function Get_m_SubTitle(col: Integer): WideString; safecall;
    procedure Set_m_Periode(Param1: Integer); safecall;
    function Get_m_ColFormat(col: Integer): WideString; safecall;
    function Get_m_Title3(col: Integer): WideString; safecall;
    function Get_m_Title4(col: Integer): WideString; safecall;
    property GetWert[x: Integer; y: Integer]: WideString read Get_GetWert;
    property GetFormat[x: Integer; y: Integer]: WideString read Get_GetFormat;
    property m_Mandant: Integer read Get_m_Mandant write Set_m_Mandant;
    property m_WJ: TDateTime read Get_m_WJ write Set_m_WJ;
    property m_AbgrenzPeriode: TDateTime read Get_m_AbgrenzPeriode write Set_m_AbgrenzPeriode;
    property EnumBereiche[pos: Integer]: WideString read Get_EnumBereiche;
    property EnumAnsichten[const bereich: WideString; pos: Integer]: WideString read Get_EnumAnsichten;
    property m_RowCount: Integer read Get_m_RowCount;
    property m_ColCount: Integer read Get_m_ColCount;
    property m_ColBreite[col: Integer]: Integer read Get_m_ColBreite;
    property m_Title[col: Integer]: WideString read Get_m_Title;
    property m_ColAlign[col: Integer]: WideString read Get_m_ColAlign;
    property m_SubTitle[col: Integer]: WideString read Get_m_SubTitle;
    property m_Periode: Integer write Set_m_Periode;
    property m_ColFormat[col: Integer]: WideString read Get_m_ColFormat;
    property m_Title3[col: Integer]: WideString read Get_m_Title3;
    property m_Title4[col: Integer]: WideString read Get_m_Title4;
  end;

// *********************************************************************//
// DispIntf:  IAddWuerfelAnsichtDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C880579F-1018-497E-B5CB-2AD4A62D378D}
// *********************************************************************//
  IAddWuerfelAnsichtDisp = dispinterface
    ['{C880579F-1018-497E-B5CB-2AD4A62D378D}']
    property GetWert[x: Integer; y: Integer]: WideString readonly dispid 1;
    property GetFormat[x: Integer; y: Integer]: WideString readonly dispid 2;
    procedure LoadAnsicht(const bereich: WideString; const ansicht: WideString); dispid 3;
    procedure ReloadCurrentAnsicht; dispid 4;
    property m_Mandant: Integer dispid 5;
    property m_WJ: TDateTime dispid 6;
    property m_AbgrenzPeriode: TDateTime dispid 7;
    property EnumBereiche[pos: Integer]: WideString readonly dispid 8;
    property EnumAnsichten[const bereich: WideString; pos: Integer]: WideString readonly dispid 9;
    property m_RowCount: Integer readonly dispid 10;
    property m_ColCount: Integer readonly dispid 11;
    property m_ColBreite[col: Integer]: Integer readonly dispid 12;
    property m_Title[col: Integer]: WideString readonly dispid 13;
    property m_ColAlign[col: Integer]: WideString readonly dispid 14;
    property m_SubTitle[col: Integer]: WideString readonly dispid 15;
    property m_Periode: Integer writeonly dispid 16;
    property m_ColFormat[col: Integer]: WideString readonly dispid 17;
    property m_Title3[col: Integer]: WideString readonly dispid 18;
    property m_Title4[col: Integer]: WideString readonly dispid 19;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TAddBOManager
// Help String      : AddBOManager Class
// Default Interface: IAddBOManager
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TAddBOManager = class(TOleControl)
  private
    FIntf: IAddBOManager;
    function  GetControlInterface: IAddBOManager;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_GetMandant(mandnr: Integer): IAddMandant;
    function Get_GetCurrentMandant: IAddMandant;
    function Get_GetWaehrung(hausWaehrung: Smallint): IAddWaehrung;
    function Get_GetAdressVerwaltung: IAddAdressVerwaltungMandant;
    function Get_GetMandanten: IDynamicCollection;
    function Get_CheckForeignConnection(const file_: WideString): Integer;
    function Get_StartAddison(mandant: Integer; const projekt: WideString; const user: WideString; 
                              const password: WideString): Integer;
  public
    procedure Connect;
    procedure ConnectEx(const username: WideString; const password: WideString);
    procedure Close;
    procedure SetCurrentMandant(mandnr: Integer);
    procedure SetDefaultUserID(const loginName: WideString; const pwd: WideString);
    procedure SetDefaultDB(const connectString: WideString; const dbName: WideString);
    property  ControlInterface: IAddBOManager read GetControlInterface;
    property  DefaultInterface: IAddBOManager read GetControlInterface;
    property GetMandant[mandnr: Integer]: IAddMandant read Get_GetMandant;
    property GetCurrentMandant: IAddMandant read Get_GetCurrentMandant;
    property IsOpen: Integer index 7 read GetIntegerProp;
    property GetWaehrung[hausWaehrung: Smallint]: IAddWaehrung read Get_GetWaehrung;
    property GetAdressVerwaltung: IAddAdressVerwaltungMandant read Get_GetAdressVerwaltung;
    property GetMandanten: IDynamicCollection read Get_GetMandanten;
    property GlobalRefreshObjects: Integer index 11 read GetIntegerProp;
    property m_CurrentUserName: WideString index 13 read GetWideStringProp;
    property CheckForeignConnection[const file_: WideString]: Integer read Get_CheckForeignConnection;
    property StartAddison[mandant: Integer; const projekt: WideString; const user: WideString; 
                          const password: WideString]: Integer read Get_StartAddison;
  published
    property Anchors;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TAddMandant
// Help String      : AddMandant Class
// Default Interface: IAddMandant
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TAddMandant = class(TOleControl)
  private
    FIntf: IAddMandant;
    function  GetControlInterface: IAddMandant;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_m_pPrivatMandant: IAddGeschaeftspartner;
    function Get_m_pFirmenMandant: IAddGeschaeftspartner;
    function Get_GetFibuProject: IAddProject;
    function Get_GetLohnProject: IAddProject;
    function Get_GetANLProject: IAddProject;
    function Get_m_pFreieFelder: IAddFreieFelder;
    function Get_m_pEhegatte: IAddGeschaeftspartner;
    function Get_m_pGesetzlicherVertreterFirma: IAddGeschaeftspartner;
    function Get_m_pGesetzlicherVertreterPerson: IAddGeschaeftspartner;
    function Get_m_pEmpfangsBVFirma: IAddGeschaeftspartner;
    function Get_m_pEmpfangsBVPerson: IAddGeschaeftspartner;
    function Get_m_pKinder: IAddKinder;
    function Get_m_pAnsprPartnerFachbereich: IAddAnsprPartnerFachbereich;
    function Get_MemberByName(const MemberName: WideString): WideString;
    function Get_m_pFinanzamt: IAddFinanzamt;
    function Get_m_Wuerfel(const bereich: WideString; wj: TDateTime; tochter: Integer): IAddWuerfel;
    function Get_m_Wirtschaftsjahr(index: Integer): WideString;
    function Get_m_AnzahlBFWFormulare(formularid: SYSINT; jahr: SYSINT): Integer;
    function Get_m_AnzahlBFWFormulareMonat(formularid: SYSINT; jahr: SYSINT; monat: SYSINT): Integer;
    function Get_FreiesFeld(const feldname: WideString): WideString;
    procedure Set_FreiesFeld(const feldname: WideString; const pVal: WideString);
    function Get_Betriebsstaetten(pos: Integer): IAddGeschaeftspartner;
    function Get_GGW(Formel: SYSINT; monat: SYSINT; jahr: SYSINT): Double;
    procedure Set_GGW(Formel: SYSINT; monat: SYSINT; jahr: SYSINT; pVal: Double);
  public
    procedure LockObject(exklusive: Integer);
    procedure UnLockObject(exklusiv: Integer);
    property  ControlInterface: IAddMandant read GetControlInterface;
    property  DefaultInterface: IAddMandant read GetControlInterface;
    property m_pPrivatMandant: IAddGeschaeftspartner read Get_m_pPrivatMandant;
    property m_pFirmenMandant: IAddGeschaeftspartner read Get_m_pFirmenMandant;
    property m_MandantenNr: Integer index 3 read GetIntegerProp;
    property m_Name: WideString index 6 read GetWideStringProp;
    property GetFibuProject: IAddProject read Get_GetFibuProject;
    property GetLohnProject: IAddProject read Get_GetLohnProject;
    property GetANLProject: IAddProject read Get_GetANLProject;
    property m_Name2: WideString index 10 read GetWideStringProp;
    property m_Kurzname: WideString index 11 read GetWideStringProp;
    property m_DebitorenKonto: WideString index 12 read GetWideStringProp;
    property m_KurzBezeichnung: Integer index 13 read GetIntegerProp;
    property m_Steuernummer: WideString index 14 read GetWideStringProp;
    property m_FirmaSteuernummer: WideString index 15 read GetWideStringProp;
    property m_SteuernummerLST: WideString index 16 read GetWideStringProp;
    property m_FirmaSteuernummerLST: WideString index 17 read GetWideStringProp;
    property IsTypPrivat: Integer index 18 read GetIntegerProp;
    property IsTypFirma: Integer index 19 read GetIntegerProp;
    property IsTypPrivatFirma: Integer index 20 read GetIntegerProp;
    property m_LaenderKennzeichen: Integer index 21 read GetIntegerProp;
    property m_ErloeskontenSchluessel: Integer index 22 read GetIntegerProp;
    property m_GruppenSchluessel: WideString index 23 read GetWideStringProp;
    property m_pFreieFelder: IAddFreieFelder read Get_m_pFreieFelder;
    property m_pEhegatte: IAddGeschaeftspartner read Get_m_pEhegatte;
    property m_pGesetzlicherVertreterFirma: IAddGeschaeftspartner read Get_m_pGesetzlicherVertreterFirma;
    property m_pGesetzlicherVertreterPerson: IAddGeschaeftspartner read Get_m_pGesetzlicherVertreterPerson;
    property m_pEmpfangsBVFirma: IAddGeschaeftspartner read Get_m_pEmpfangsBVFirma;
    property m_pEmpfangsBVPerson: IAddGeschaeftspartner read Get_m_pEmpfangsBVPerson;
    property m_pKinder: IAddKinder read Get_m_pKinder;
    property m_pAnsprPartnerFachbereich: IAddAnsprPartnerFachbereich read Get_m_pAnsprPartnerFachbereich;
    property MemberByName[const MemberName: WideString]: WideString read Get_MemberByName;
    property m_pFinanzamt: IAddFinanzamt read Get_m_pFinanzamt;
    property m_Wuerfel[const bereich: WideString; wj: TDateTime; tochter: Integer]: IAddWuerfel read Get_m_Wuerfel;
    property m_Wirtschaftsjahr[index: Integer]: WideString read Get_m_Wirtschaftsjahr;
    property m_AnzahlBFWFormulare[formularid: SYSINT; jahr: SYSINT]: Integer read Get_m_AnzahlBFWFormulare;
    property m_AnzahlBFWFormulareMonat[formularid: SYSINT; jahr: SYSINT; monat: SYSINT]: Integer read Get_m_AnzahlBFWFormulareMonat;
    property FreiesFeld[const feldname: WideString]: WideString read Get_FreiesFeld write Set_FreiesFeld;
    property Betriebsstaetten[pos: Integer]: IAddGeschaeftspartner read Get_Betriebsstaetten;
    property GGW[Formel: SYSINT; monat: SYSINT; jahr: SYSINT]: Double read Get_GGW write Set_GGW;
    property m_MandatBeginnAm: TDateTime index 71 read GetTDateTimeProp;
    property m_MandatEndetAm: TDateTime index 72 read GetTDateTimeProp;
    property m_IsAktiv: Byte index 73 read GetByteProp;
  published
    property Anchors;
    property m_Unternehmensgegenstand: WideString index 24 read GetWideStringProp write SetWideStringProp stored False;
    property m_Geburtsort: WideString index 26 read GetWideStringProp write SetWideStringProp stored False;
    property m_GeburtsName: WideString index 27 read GetWideStringProp write SetWideStringProp stored False;
    property m_Konfession: WideString index 28 read GetWideStringProp write SetWideStringProp stored False;
    property m_Familienstand: WideString index 29 read GetWideStringProp write SetWideStringProp stored False;
    property m_FamilienstandAb: TDateTime index 30 read GetTDateTimeProp write SetTDateTimeProp stored False;
    property m_GetrenntSeit: TDateTime index 31 read GetTDateTimeProp write SetTDateTimeProp stored False;
    property m_Beruf: WideString index 32 read GetWideStringProp write SetWideStringProp stored False;
    property m_Arbeitgeber: WideString index 33 read GetWideStringProp write SetWideStringProp stored False;
    property m_RentenVersNr: WideString index 34 read GetWideStringProp write SetWideStringProp stored False;
    property m_SozialVersNr: WideString index 35 read GetWideStringProp write SetWideStringProp stored False;
    property m_Anrede: WideString index 36 read GetWideStringProp write SetWideStringProp stored False;
    property m_Briefanrede: WideString index 37 read GetWideStringProp write SetWideStringProp stored False;
    property m_Grussformel: WideString index 38 read GetWideStringProp write SetWideStringProp stored False;
    property m_Korrespondenzadresse: WideString index 39 read GetWideStringProp write SetWideStringProp stored False;
    property m_GeburtsortEhepartner: WideString index 45 read GetWideStringProp write SetWideStringProp stored False;
    property m_GeburtsnameEhepartner: WideString index 46 read GetWideStringProp write SetWideStringProp stored False;
    property m_KonfessionEhepartner: WideString index 47 read GetWideStringProp write SetWideStringProp stored False;
    property m_Guetergemeinschaft: Integer index 48 read GetIntegerProp write SetIntegerProp stored False;
    property m_BerufEhepartner: WideString index 49 read GetWideStringProp write SetWideStringProp stored False;
    property m_ArbeitgeberEhepartner: WideString index 50 read GetWideStringProp write SetWideStringProp stored False;
    property m_RentenversNrEhepartner: WideString index 51 read GetWideStringProp write SetWideStringProp stored False;
    property m_SozialversNrEhepartner: WideString index 52 read GetWideStringProp write SetWideStringProp stored False;
    property m_AnredeEheleute: WideString index 53 read GetWideStringProp write SetWideStringProp stored False;
    property m_BriefanredeEheleute: WideString index 54 read GetWideStringProp write SetWideStringProp stored False;
    property m_GrussformelEheleute: WideString index 55 read GetWideStringProp write SetWideStringProp stored False;
    property m_GesetzlVertreterArt: WideString index 56 read GetWideStringProp write SetWideStringProp stored False;
    property m_GesetzlVertreterVermerke: WideString index 57 read GetWideStringProp write SetWideStringProp stored False;
    property m_GesetzlVertreterArtFirma: WideString index 61 read GetWideStringProp write SetWideStringProp stored False;
    property m_GesetzlVertreterVermerkeFirma: WideString index 62 read GetWideStringProp write SetWideStringProp stored False;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TAddGeschaeftspartner
// Help String      : AddGeschaeftspartner Class
// Default Interface: IAddGeschaeftspartner
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TAddGeschaeftspartner = class(TOleControl)
  private
    FIntf: IAddGeschaeftspartner;
    function  GetControlInterface: IAddGeschaeftspartner;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_Zusatzadressen: IAddZusatzAdressen;
  public
    procedure BeginAdressupdate;
    procedure EndAdressupdate(commit: Integer);
    property  ControlInterface: IAddGeschaeftspartner read GetControlInterface;
    property  DefaultInterface: IAddGeschaeftspartner read GetControlInterface;
    property Zusatzadressen: IAddZusatzAdressen read Get_Zusatzadressen;
  published
    property Anchors;
    property m_Name1: WideString index 1 read GetWideStringProp write SetWideStringProp stored False;
    property m_Name2: WideString index 2 read GetWideStringProp write SetWideStringProp stored False;
    property m_Name3: WideString index 3 read GetWideStringProp write SetWideStringProp stored False;
    property m_Name4: WideString index 4 read GetWideStringProp write SetWideStringProp stored False;
    property m_Strasse: WideString index 5 read GetWideStringProp write SetWideStringProp stored False;
    property m_PLZ: WideString index 6 read GetWideStringProp write SetWideStringProp stored False;
    property m_Ort: WideString index 7 read GetWideStringProp write SetWideStringProp stored False;
    property m_Bundesland: WideString index 8 read GetWideStringProp write SetWideStringProp stored False;
    property m_Staat: WideString index 9 read GetWideStringProp write SetWideStringProp stored False;
    property m_Fax: WideString index 10 read GetWideStringProp write SetWideStringProp stored False;
    property m_Tel1: WideString index 13 read GetWideStringProp write SetWideStringProp stored False;
    property m_Tel2: WideString index 14 read GetWideStringProp write SetWideStringProp stored False;
    property m_KWahl: WideString index 15 read GetWideStringProp write SetWideStringProp stored False;
    property m_Mobil: WideString index 16 read GetWideStringProp write SetWideStringProp stored False;
    property m_Email: WideString index 17 read GetWideStringProp write SetWideStringProp stored False;
    property m_URL: WideString index 18 read GetWideStringProp write SetWideStringProp stored False;
    property m_Titel: WideString index 19 read GetWideStringProp write SetWideStringProp stored False;
    property m_AkadGrad: WideString index 20 read GetWideStringProp write SetWideStringProp stored False;
    property m_Postfach: WideString index 21 read GetWideStringProp write SetWideStringProp stored False;
    property m_PLZGrossempf: WideString index 22 read GetWideStringProp write SetWideStringProp stored False;
    property m_PLZPostfach: WideString index 23 read GetWideStringProp write SetWideStringProp stored False;
    property m_Anrede: WideString index 24 read GetWideStringProp write SetWideStringProp stored False;
    property m_Briefanrede: WideString index 25 read GetWideStringProp write SetWideStringProp stored False;
    property m_Grussformel: WideString index 26 read GetWideStringProp write SetWideStringProp stored False;
    property m_AnschriftPriv: WideString index 27 read GetWideStringProp write SetWideStringProp stored False;
    property m_AnschriftForm: WideString index 28 read GetWideStringProp write SetWideStringProp stored False;
    property m_AnschriftBezPrivat: WideString index 29 read GetWideStringProp write SetWideStringProp stored False;
    property m_AnschriftPrivBriefanrede: WideString index 30 read GetWideStringProp write SetWideStringProp stored False;
    property m_AnschriftBezFormell: WideString index 31 read GetWideStringProp write SetWideStringProp stored False;
    property m_AnschriftFormBriefanrede: WideString index 32 read GetWideStringProp write SetWideStringProp stored False;
    property m_Geburtsdatum: TDateTime index 33 read GetTDateTimeProp write SetTDateTimeProp stored False;
    property m_Teletex: WideString index 34 read GetWideStringProp write SetWideStringProp stored False;
    property m_BTX: WideString index 35 read GetWideStringProp write SetWideStringProp stored False;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TAddWaehrung
// Help String      : AddWaehrung Class
// Default Interface: IAddWaehrung
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TAddWaehrung = class(TOleControl)
  private
    FIntf: IAddWaehrung;
    function  GetControlInterface: IAddWaehrung;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_CalcFromTo(fromWID: Smallint; toWID: Smallint; betrag: Currency): Currency;
    function Get_GetKuerzel(__MIDL_0011: Smallint): WideString;
    function Get_GetWaehrungsID(const __MIDL_0012: WideString): Smallint;
  public
    procedure WriteWaehrungstabelle(const odbsStr: WideString);
    property  ControlInterface: IAddWaehrung read GetControlInterface;
    property  DefaultInterface: IAddWaehrung read GetControlInterface;
    property m_Hauswaehrung: Smallint index 1 read GetSmallintProp;
    property CalcFromTo[fromWID: Smallint; toWID: Smallint; betrag: Currency]: Currency read Get_CalcFromTo;
    property GetKuerzel[__MIDL_0011: Smallint]: WideString read Get_GetKuerzel;
    property GetWaehrungsID[const __MIDL_0012: WideString]: Smallint read Get_GetWaehrungsID;
  published
    property Anchors;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TAddProject
// Help String      : AddProject Class
// Default Interface: IAddProject
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TAddProject = class(TOleControl)
  private
    FIntf: IAddProject;
    function  GetControlInterface: IAddProject;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    property  ControlInterface: IAddProject read GetControlInterface;
    property  DefaultInterface: IAddProject read GetControlInterface;
    property GetMandantNr: Integer index 1 read GetIntegerProp;
  published
    property Anchors;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TAddKanzlei
// Help String      : AddKanzlei Class
// Default Interface: IAddKanzlei
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TAddKanzlei = class(TOleControl)
  private
    FIntf: IAddKanzlei;
    function  GetControlInterface: IAddKanzlei;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    property  ControlInterface: IAddKanzlei read GetControlInterface;
    property  DefaultInterface: IAddKanzlei read GetControlInterface;
  published
    property Anchors;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TAddProtokoll
// Help String      : AddProtokoll Class
// Default Interface: IAddProtokoll
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TAddProtokoll = class(TOleControl)
  private
    FIntf: IAddProtokoll;
    function  GetControlInterface: IAddProtokoll;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    procedure AddLine(const text: WideString);
    property  ControlInterface: IAddProtokoll read GetControlInterface;
    property  DefaultInterface: IAddProtokoll read GetControlInterface;
    property GetNextLine: WideString index 2 read GetWideStringProp;
  published
    property Anchors;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TAddAdressVerwaltungMandant
// Help String      : AddAdressVerwaltungMandant Class
// Default Interface: IAddAdressVerwaltungMandant
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TAddAdressVerwaltungMandant = class(TOleControl)
  private
    FIntf: IAddAdressVerwaltungMandant;
    function  GetControlInterface: IAddAdressVerwaltungMandant;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_GetFirst: IAddMandant;
    function Get_GetNext: IAddMandant;
    function Get_GetPrev: IAddMandant;
    function Get_GetLast: IAddMandant;
  public
    procedure SetFilterKurzname(const __MIDL_0014: WideString);
    property  ControlInterface: IAddAdressVerwaltungMandant read GetControlInterface;
    property  DefaultInterface: IAddAdressVerwaltungMandant read GetControlInterface;
    property GetFirst: IAddMandant read Get_GetFirst;
    property GetNext: IAddMandant read Get_GetNext;
    property GetPrev: IAddMandant read Get_GetPrev;
    property GetLast: IAddMandant read Get_GetLast;
  published
    property Anchors;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TAddFreieFelder
// Help String      : AddFreieFelder Class
// Default Interface: IAddFreieFelder
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TAddFreieFelder = class(TOleControl)
  private
    FIntf: IAddFreieFelder;
    function  GetControlInterface: IAddFreieFelder;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    procedure FreiesFeldLabelLaden;
    procedure FreiesFeldLabelSpeichern;
    property  ControlInterface: IAddFreieFelder read GetControlInterface;
    property  DefaultInterface: IAddFreieFelder read GetControlInterface;
  published
    property Anchors;
    property FreiesFeld1: WideString index 3 read GetWideStringProp write SetWideStringProp stored False;
    property FreiesFeld2: WideString index 4 read GetWideStringProp write SetWideStringProp stored False;
    property FreiesFeld3: WideString index 5 read GetWideStringProp write SetWideStringProp stored False;
    property FreiesFeld4: WideString index 6 read GetWideStringProp write SetWideStringProp stored False;
    property FreiesFeld5: WideString index 7 read GetWideStringProp write SetWideStringProp stored False;
    property FreiesFeld6: WideString index 8 read GetWideStringProp write SetWideStringProp stored False;
    property FreiesFeld7: WideString index 9 read GetWideStringProp write SetWideStringProp stored False;
    property FreiesFeld8: WideString index 10 read GetWideStringProp write SetWideStringProp stored False;
    property FreiesFeld9: WideString index 11 read GetWideStringProp write SetWideStringProp stored False;
    property FreiesFeld10: WideString index 12 read GetWideStringProp write SetWideStringProp stored False;
    property FreiesFeld11: WideString index 13 read GetWideStringProp write SetWideStringProp stored False;
    property FreiesFeld12: WideString index 14 read GetWideStringProp write SetWideStringProp stored False;
    property FreiesFeld13: WideString index 15 read GetWideStringProp write SetWideStringProp stored False;
    property FreiesFeld14: WideString index 16 read GetWideStringProp write SetWideStringProp stored False;
    property FreiesFeld15: WideString index 17 read GetWideStringProp write SetWideStringProp stored False;
    property FreiesFeld16: WideString index 18 read GetWideStringProp write SetWideStringProp stored False;
    property FreiesFeld17: WideString index 19 read GetWideStringProp write SetWideStringProp stored False;
    property FreiesFeld18: WideString index 20 read GetWideStringProp write SetWideStringProp stored False;
    property FreiesFeld19: WideString index 21 read GetWideStringProp write SetWideStringProp stored False;
    property FreiesFeld20: WideString index 22 read GetWideStringProp write SetWideStringProp stored False;
    property FreiesFeld1_Label: WideString index 23 read GetWideStringProp write SetWideStringProp stored False;
    property FreiesFeld2_Label: WideString index 24 read GetWideStringProp write SetWideStringProp stored False;
    property FreiesFeld3_Label: WideString index 25 read GetWideStringProp write SetWideStringProp stored False;
    property FreiesFeld4_Label: WideString index 26 read GetWideStringProp write SetWideStringProp stored False;
    property FreiesFeld5_Label: WideString index 27 read GetWideStringProp write SetWideStringProp stored False;
    property FreiesFeld6_Label: WideString index 28 read GetWideStringProp write SetWideStringProp stored False;
    property FreiesFeld7_Label: WideString index 29 read GetWideStringProp write SetWideStringProp stored False;
    property FreiesFeld8_Label: WideString index 30 read GetWideStringProp write SetWideStringProp stored False;
    property FreiesFeld9_Label: WideString index 31 read GetWideStringProp write SetWideStringProp stored False;
    property FreiesFeld10_Label: WideString index 32 read GetWideStringProp write SetWideStringProp stored False;
    property FreiesFeld11_Label: WideString index 33 read GetWideStringProp write SetWideStringProp stored False;
    property FreiesFeld12_Label: WideString index 34 read GetWideStringProp write SetWideStringProp stored False;
    property FreiesFeld13_Label: WideString index 35 read GetWideStringProp write SetWideStringProp stored False;
    property FreiesFeld14_Label: WideString index 36 read GetWideStringProp write SetWideStringProp stored False;
    property FreiesFeld15_Label: WideString index 37 read GetWideStringProp write SetWideStringProp stored False;
    property FreiesFeld16_Label: WideString index 38 read GetWideStringProp write SetWideStringProp stored False;
    property FreiesFeld17_Label: WideString index 39 read GetWideStringProp write SetWideStringProp stored False;
    property FreiesFeld18_Label: WideString index 40 read GetWideStringProp write SetWideStringProp stored False;
    property FreiesFeld19_Label: WideString index 41 read GetWideStringProp write SetWideStringProp stored False;
    property FreiesFeld20_Label: WideString index 42 read GetWideStringProp write SetWideStringProp stored False;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TAddKinder
// Help String      : AddKinder Class
// Default Interface: IAddKinder
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TAddKinder = class(TOleControl)
  private
    FIntf: IAddKinder;
    function  GetControlInterface: IAddKinder;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    property  ControlInterface: IAddKinder read GetControlInterface;
    property  DefaultInterface: IAddKinder read GetControlInterface;
    property FirstKind: Integer index 1 read GetIntegerProp;
    property NextKind: Integer index 2 read GetIntegerProp;
    property SetKind: Integer index 12 write SetIntegerProp;
  published
    property Anchors;
    property KindVorname: WideString index 3 read GetWideStringProp write SetWideStringProp stored False;
    property KindFamilienname: WideString index 4 read GetWideStringProp write SetWideStringProp stored False;
    property KindGeburtstag: TDateTime index 5 read GetTDateTimeProp write SetTDateTimeProp stored False;
    property KindVHName: WideString index 6 read GetWideStringProp write SetWideStringProp stored False;
    property KindVHAnschrift: WideString index 7 read GetWideStringProp write SetWideStringProp stored False;
    property KindVHGeburtstag: TDateTime index 8 read GetTDateTimeProp write SetTDateTimeProp stored False;
    property KindAusbildung: WideString index 9 read GetWideStringProp write SetWideStringProp stored False;
    property KindAusbildungVon: TDateTime index 10 read GetTDateTimeProp write SetTDateTimeProp stored False;
    property KindAusbildungBis: TDateTime index 11 read GetTDateTimeProp write SetTDateTimeProp stored False;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TAddAnsprPartnerFachbereich
// Help String      : AddAnsprPartnerFachbereich Class
// Default Interface: IAddAnsprPartnerFachbereich
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TAddAnsprPartnerFachbereich = class(TOleControl)
  private
    FIntf: IAddAnsprPartnerFachbereich;
    function  GetControlInterface: IAddAnsprPartnerFachbereich;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_m_pHauptAnsprechPartner: IAddAnsprPartner;
    function Get_m_pFibuAnsprechPartner: IAddAnsprPartner;
    function Get_m_pLohnAnsprechPartner: IAddAnsprPartner;
    function Get_m_pBilanzAnsprechPartner: IAddAnsprPartner;
    function Get_m_pBSTAnsprechPartner: IAddAnsprPartner;
    function Get_m_pPrivStAnsprechPartner: IAddAnsprPartner;
    function Get_m_pSTBAnsprechPartner: IAddAnsprPartner;
    function Get_m_pSonstigeAnsprechPartner: IAddAnsprPartner;
  public
    property  ControlInterface: IAddAnsprPartnerFachbereich read GetControlInterface;
    property  DefaultInterface: IAddAnsprPartnerFachbereich read GetControlInterface;
    property m_pHauptAnsprechPartner: IAddAnsprPartner read Get_m_pHauptAnsprechPartner;
    property m_pFibuAnsprechPartner: IAddAnsprPartner read Get_m_pFibuAnsprechPartner;
    property m_pLohnAnsprechPartner: IAddAnsprPartner read Get_m_pLohnAnsprechPartner;
    property m_pBilanzAnsprechPartner: IAddAnsprPartner read Get_m_pBilanzAnsprechPartner;
    property m_pBSTAnsprechPartner: IAddAnsprPartner read Get_m_pBSTAnsprechPartner;
    property m_pPrivStAnsprechPartner: IAddAnsprPartner read Get_m_pPrivStAnsprechPartner;
    property m_pSTBAnsprechPartner: IAddAnsprPartner read Get_m_pSTBAnsprechPartner;
    property m_pSonstigeAnsprechPartner: IAddAnsprPartner read Get_m_pSonstigeAnsprechPartner;
  published
    property Anchors;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TAddAnsprPartner
// Help String      : AddAnsprPartner Class
// Default Interface: IAddAnsprPartner
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TAddAnsprPartner = class(TOleControl)
  private
    FIntf: IAddAnsprPartner;
    function  GetControlInterface: IAddAnsprPartner;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    property  ControlInterface: IAddAnsprPartner read GetControlInterface;
    property  DefaultInterface: IAddAnsprPartner read GetControlInterface;
  published
    property Anchors;
    property m_Anrede: WideString index 1 read GetWideStringProp write SetWideStringProp stored False;
    property m_Name: WideString index 2 read GetWideStringProp write SetWideStringProp stored False;
    property m_Vorname: WideString index 3 read GetWideStringProp write SetWideStringProp stored False;
    property m_Funktion: WideString index 4 read GetWideStringProp write SetWideStringProp stored False;
    property m_Telefon: WideString index 5 read GetWideStringProp write SetWideStringProp stored False;
    property m_Kurzwahl: WideString index 6 read GetWideStringProp write SetWideStringProp stored False;
    property m_Fax: WideString index 7 read GetWideStringProp write SetWideStringProp stored False;
    property m_Telefon2: WideString index 8 read GetWideStringProp write SetWideStringProp stored False;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TAddFinanzamt
// Help String      : AddFinanzamt Class
// Default Interface: IAddFinanzamt
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TAddFinanzamt = class(TOleControl)
  private
    FIntf: IAddFinanzamt;
    function  GetControlInterface: IAddFinanzamt;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    property  ControlInterface: IAddFinanzamt read GetControlInterface;
    property  DefaultInterface: IAddFinanzamt read GetControlInterface;
  published
    property Anchors;
    property m_Name: WideString index 1 read GetWideStringProp write SetWideStringProp stored False;
    property m_FAnr: WideString index 2 read GetWideStringProp write SetWideStringProp stored False;
    property m_Kurzname: WideString index 3 read GetWideStringProp write SetWideStringProp stored False;
    property m_Strasse: WideString index 4 read GetWideStringProp write SetWideStringProp stored False;
    property m_PLZ: WideString index 5 read GetWideStringProp write SetWideStringProp stored False;
    property m_Ort: WideString index 6 read GetWideStringProp write SetWideStringProp stored False;
    property m_Bundesland: WideString index 7 read GetWideStringProp write SetWideStringProp stored False;
    property m_Land: WideString index 8 read GetWideStringProp write SetWideStringProp stored False;
    property m_BLZ: WideString index 9 read GetWideStringProp write SetWideStringProp stored False;
    property m_Bank: WideString index 10 read GetWideStringProp write SetWideStringProp stored False;
    property m_Kontonummer: WideString index 11 read GetWideStringProp write SetWideStringProp stored False;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TAddWorkflowManager
// Help String      : AddWorkflowManager Class
// Default Interface: IAddWorkflowManager
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TAddWorkflowManager = class(TOleControl)
  private
    FIntf: IAddWorkflowManager;
    function  GetControlInterface: IAddWorkflowManager;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_m_SubDir(__MIDL_0016: Integer): WideString;
    function Get_m_WorkflowItem(pos: Integer): IAddWorkflowItem;
    function Get_CreateDocument: IAddWorkflowItem;
  public
    procedure ChDir(const __MIDL_0015: WideString);
    procedure ChRootUser;
    procedure ChRootKanzlei;
    procedure ChRootAddison;
    procedure AddDocument(const __MIDL_0017: IAddWorkflowItem);
    procedure ChangeToStandardExterneDokumente;
    property  ControlInterface: IAddWorkflowManager read GetControlInterface;
    property  DefaultInterface: IAddWorkflowManager read GetControlInterface;
    property m_CurrentDir: WideString index 2 read GetWideStringProp;
    property m_SubDir[__MIDL_0016: Integer]: WideString read Get_m_SubDir;
    property m_CurrentPath: WideString index 7 read GetWideStringProp;
    property m_WorkflowItem[pos: Integer]: IAddWorkflowItem read Get_m_WorkflowItem;
    property CreateDocument: IAddWorkflowItem read Get_CreateDocument;
  published
    property Anchors;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TAddWorkflowItem
// Help String      : AddWorkflowItem Class
// Default Interface: IAddWorkflowItem
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TAddWorkflowItem = class(TOleControl)
  private
    FIntf: IAddWorkflowItem;
    function  GetControlInterface: IAddWorkflowItem;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_m_Eigenschaft(const Name: WideString): WideString;
    procedure Set_m_Eigenschaft(const Name: WideString; const pVal: WideString);
  public
    procedure Store;
    procedure Delete;
    property  ControlInterface: IAddWorkflowItem read GetControlInterface;
    property  DefaultInterface: IAddWorkflowItem read GetControlInterface;
    property m_Eigenschaft[const Name: WideString]: WideString read Get_m_Eigenschaft write Set_m_Eigenschaft;
  published
    property Anchors;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TAddTools
// Help String      : AddTools Class
// Default Interface: IAddTools
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TAddTools = class(TOleControl)
  private
    FIntf: IAddTools;
    function  GetControlInterface: IAddTools;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_NetGetUniversalName(const localPath: WideString): WideString;
    function Get_UniqueFilename(const vorlage: WideString): WideString;
  public
    property  ControlInterface: IAddTools read GetControlInterface;
    property  DefaultInterface: IAddTools read GetControlInterface;
    property NetGetUniversalName[const localPath: WideString]: WideString read Get_NetGetUniversalName;
    property UniqueFilename[const vorlage: WideString]: WideString read Get_UniqueFilename;
  published
    property Anchors;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TAddWuerfel
// Help String      : AddWuerfel Class
// Default Interface: IAddWuerfel
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TAddWuerfel = class(TOleControl)
  private
    FIntf: IAddWuerfel;
    function  GetControlInterface: IAddWuerfel;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_GetWert(const art: WideString; const Id: WideString; const kost: WideString): Currency;
    function Get_GetWertFromID(const __MIDL_0013: WideString): Currency;
    function Get_GetArt(const Id: WideString): WideString;
    function Get_GetKonto(const Id: WideString): WideString;
    function Get_GetKost(const Id: WideString): WideString;
    function Get_GetWertArtFromId(const Id: WideString; const art: WideString; periode: Integer; 
                                  kumuliert: Integer): Currency;
    function Get_GetWertX(const IdentType: WideString; Zeitraum: AddZeitraum; Wertart: AddWertart; 
                          Wertabgriff: AddWertabgriff; periode: Integer): Currency;
  public
    property  ControlInterface: IAddWuerfel read GetControlInterface;
    property  DefaultInterface: IAddWuerfel read GetControlInterface;
    property GetWert[const art: WideString; const Id: WideString; const kost: WideString]: Currency read Get_GetWert;
    property GetFirstID: WideString index 2 read GetWideStringProp;
    property GetNextID: WideString index 3 read GetWideStringProp;
    property GetWertFromID[const __MIDL_0013: WideString]: Currency read Get_GetWertFromID;
    property GetArt[const Id: WideString]: WideString read Get_GetArt;
    property GetKonto[const Id: WideString]: WideString read Get_GetKonto;
    property GetKost[const Id: WideString]: WideString read Get_GetKost;
    property GetWertArtFromId[const Id: WideString; const art: WideString; periode: Integer; 
                              kumuliert: Integer]: Currency read Get_GetWertArtFromId;
    property GetWertX[const IdentType: WideString; Zeitraum: AddZeitraum; Wertart: AddWertart; 
                      Wertabgriff: AddWertabgriff; periode: Integer]: Currency read Get_GetWertX;
  published
    property Anchors;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TAddServerItem
// Help String      : AddServerItem Class
// Default Interface: IAddServerItem
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TAddServerItem = class(TOleControl)
  private
    FIntf: IAddServerItem;
    function  GetControlInterface: IAddServerItem;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_Request(const __MIDL_0018: WideString): OleVariant;
  public
    procedure Init(const szProject: WideString; nVJahr: SYSINT);
    procedure Open(const szConnect: WideString; nVersion: SYSINT);
    procedure AppendFile(const szRTFFile: WideString; lIndex: Integer);
    procedure AppendText(const szRTFText: WideString; lIndex: Integer);
    procedure Execute(const sCmd: WideString; aParam: OleVariant);
    property  ControlInterface: IAddServerItem read GetControlInterface;
    property  DefaultInterface: IAddServerItem read GetControlInterface;
    property Close: WideString index 3 read GetWideStringProp;
    property Request[const __MIDL_0018: WideString]: OleVariant read Get_Request;
  published
    property Anchors;
  end;

// *********************************************************************//
// The Class CoAddWuerfelAnsicht provides a Create and CreateRemote method to          
// create instances of the default interface IAddWuerfelAnsicht exposed by              
// the CoClass AddWuerfelAnsicht. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAddWuerfelAnsicht = class
    class function Create: IAddWuerfelAnsicht;
    class function CreateRemote(const MachineName: string): IAddWuerfelAnsicht;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TAddWuerfelAnsicht
// Help String      : AddWuerfelAnsicht Class
// Default Interface: IAddWuerfelAnsicht
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TAddWuerfelAnsichtProperties= class;
{$ENDIF}
  TAddWuerfelAnsicht = class(TOleServer)
  private
    FIntf: IAddWuerfelAnsicht;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TAddWuerfelAnsichtProperties;
    function GetServerProperties: TAddWuerfelAnsichtProperties;
{$ENDIF}
    function GetDefaultInterface: IAddWuerfelAnsicht;
  protected
    procedure InitServerData; override;
    function Get_GetWert(x: Integer; y: Integer): WideString;
    function Get_GetFormat(x: Integer; y: Integer): WideString;
    function Get_m_Mandant: Integer;
    procedure Set_m_Mandant(pVal: Integer);
    function Get_m_WJ: TDateTime;
    procedure Set_m_WJ(pVal: TDateTime);
    function Get_m_AbgrenzPeriode: TDateTime;
    procedure Set_m_AbgrenzPeriode(pVal: TDateTime);
    function Get_EnumBereiche(pos: Integer): WideString;
    function Get_EnumAnsichten(const bereich: WideString; pos: Integer): WideString;
    function Get_m_RowCount: Integer;
    function Get_m_ColCount: Integer;
    function Get_m_ColBreite(col: Integer): Integer;
    function Get_m_Title(col: Integer): WideString;
    function Get_m_ColAlign(col: Integer): WideString;
    function Get_m_SubTitle(col: Integer): WideString;
    procedure Set_m_Periode(Param1: Integer);
    function Get_m_ColFormat(col: Integer): WideString;
    function Get_m_Title3(col: Integer): WideString;
    function Get_m_Title4(col: Integer): WideString;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IAddWuerfelAnsicht);
    procedure Disconnect; override;
    procedure LoadAnsicht(const bereich: WideString; const ansicht: WideString);
    procedure ReloadCurrentAnsicht;
    property DefaultInterface: IAddWuerfelAnsicht read GetDefaultInterface;
    property GetWert[x: Integer; y: Integer]: WideString read Get_GetWert;
    property GetFormat[x: Integer; y: Integer]: WideString read Get_GetFormat;
    property EnumBereiche[pos: Integer]: WideString read Get_EnumBereiche;
    property EnumAnsichten[const bereich: WideString; pos: Integer]: WideString read Get_EnumAnsichten;
    property m_RowCount: Integer read Get_m_RowCount;
    property m_ColCount: Integer read Get_m_ColCount;
    property m_ColBreite[col: Integer]: Integer read Get_m_ColBreite;
    property m_Title[col: Integer]: WideString read Get_m_Title;
    property m_ColAlign[col: Integer]: WideString read Get_m_ColAlign;
    property m_SubTitle[col: Integer]: WideString read Get_m_SubTitle;
    property m_Periode: Integer write Set_m_Periode;
    property m_ColFormat[col: Integer]: WideString read Get_m_ColFormat;
    property m_Title3[col: Integer]: WideString read Get_m_Title3;
    property m_Title4[col: Integer]: WideString read Get_m_Title4;
    property m_Mandant: Integer read Get_m_Mandant write Set_m_Mandant;
    property m_WJ: TDateTime read Get_m_WJ write Set_m_WJ;
    property m_AbgrenzPeriode: TDateTime read Get_m_AbgrenzPeriode write Set_m_AbgrenzPeriode;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TAddWuerfelAnsichtProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TAddWuerfelAnsicht
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TAddWuerfelAnsichtProperties = class(TPersistent)
  private
    FServer:    TAddWuerfelAnsicht;
    function    GetDefaultInterface: IAddWuerfelAnsicht;
    constructor Create(AServer: TAddWuerfelAnsicht);
  protected
    function Get_GetWert(x: Integer; y: Integer): WideString;
    function Get_GetFormat(x: Integer; y: Integer): WideString;
    function Get_m_Mandant: Integer;
    procedure Set_m_Mandant(pVal: Integer);
    function Get_m_WJ: TDateTime;
    procedure Set_m_WJ(pVal: TDateTime);
    function Get_m_AbgrenzPeriode: TDateTime;
    procedure Set_m_AbgrenzPeriode(pVal: TDateTime);
    function Get_EnumBereiche(pos: Integer): WideString;
    function Get_EnumAnsichten(const bereich: WideString; pos: Integer): WideString;
    function Get_m_RowCount: Integer;
    function Get_m_ColCount: Integer;
    function Get_m_ColBreite(col: Integer): Integer;
    function Get_m_Title(col: Integer): WideString;
    function Get_m_ColAlign(col: Integer): WideString;
    function Get_m_SubTitle(col: Integer): WideString;
    procedure Set_m_Periode(Param1: Integer);
    function Get_m_ColFormat(col: Integer): WideString;
    function Get_m_Title3(col: Integer): WideString;
    function Get_m_Title4(col: Integer): WideString;
  public
    property DefaultInterface: IAddWuerfelAnsicht read GetDefaultInterface;
  published
    property m_Mandant: Integer read Get_m_Mandant write Set_m_Mandant;
    property m_WJ: TDateTime read Get_m_WJ write Set_m_WJ;
    property m_AbgrenzPeriode: TDateTime read Get_m_AbgrenzPeriode write Set_m_AbgrenzPeriode;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoAddZusatzAdressen provides a Create and CreateRemote method to          
// create instances of the default interface IAddZusatzAdressen exposed by              
// the CoClass AddZusatzAdressen. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAddZusatzAdressen = class
    class function Create: IAddZusatzAdressen;
    class function CreateRemote(const MachineName: string): IAddZusatzAdressen;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TAddZusatzAdressen
// Help String      : AddZusatzAdressen Class
// Default Interface: IAddZusatzAdressen
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TAddZusatzAdressenProperties= class;
{$ENDIF}
  TAddZusatzAdressen = class(TOleServer)
  private
    FIntf: IAddZusatzAdressen;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TAddZusatzAdressenProperties;
    function GetServerProperties: TAddZusatzAdressenProperties;
{$ENDIF}
    function GetDefaultInterface: IAddZusatzAdressen;
  protected
    procedure InitServerData; override;
    function Get_Count: Integer;
    function Get_Item(pos: Integer): IAddZusatzAdresse;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IAddZusatzAdressen);
    procedure Disconnect; override;
    property DefaultInterface: IAddZusatzAdressen read GetDefaultInterface;
    property Count: Integer read Get_Count;
    property Item[pos: Integer]: IAddZusatzAdresse read Get_Item;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TAddZusatzAdressenProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TAddZusatzAdressen
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TAddZusatzAdressenProperties = class(TPersistent)
  private
    FServer:    TAddZusatzAdressen;
    function    GetDefaultInterface: IAddZusatzAdressen;
    constructor Create(AServer: TAddZusatzAdressen);
  protected
    function Get_Count: Integer;
    function Get_Item(pos: Integer): IAddZusatzAdresse;
  public
    property DefaultInterface: IAddZusatzAdressen read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoAddZusatzAdresse provides a Create and CreateRemote method to          
// create instances of the default interface IAddZusatzAdresse exposed by              
// the CoClass AddZusatzAdresse. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAddZusatzAdresse = class
    class function Create: IAddZusatzAdresse;
    class function CreateRemote(const MachineName: string): IAddZusatzAdresse;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TAddZusatzAdresse
// Help String      : AddZusatzAdresse Class
// Default Interface: IAddZusatzAdresse
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TAddZusatzAdresseProperties= class;
{$ENDIF}
  TAddZusatzAdresse = class(TOleServer)
  private
    FIntf: IAddZusatzAdresse;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TAddZusatzAdresseProperties;
    function GetServerProperties: TAddZusatzAdresseProperties;
{$ENDIF}
    function GetDefaultInterface: IAddZusatzAdresse;
  protected
    procedure InitServerData; override;
    function Get_Typ: WideString;
    function Get_Name: WideString;
    function Get_Kurzname: WideString;
    function Get_Name2: WideString;
    function Get_Name3: WideString;
    function Get_Ansprechpartner: WideString;
    function Get_Telefon1: WideString;
    function Get_Telefon2: WideString;
    function Get_Mobil: WideString;
    function Get_Fax: WideString;
    function Get_Mail: WideString;
    function Get_Web: WideString;
    function Get_USTID: WideString;
    function Get_PLZGrossempf: WideString;
    function Get_Titel: WideString;
    function Get_AkadGrad: WideString;
    function Get_Geburtstag: WideString;
    function Get_Anrede: WideString;
    function Get_Briefanrede: WideString;
    function Get_Grussformel: WideString;
    function Get_Versandzusatz: WideString;
    function Get_Zustellzusatz: WideString;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IAddZusatzAdresse);
    procedure Disconnect; override;
    procedure Adresse(out strasse: WideString; out land: WideString; out plz: WideString; 
                      out ort: WideString);
    procedure Bankdaten(out blz: WideString; out konto: WideString);
    procedure Postfach(out Postfach: WideString; out plzPostfach: WideString);
    property DefaultInterface: IAddZusatzAdresse read GetDefaultInterface;
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
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TAddZusatzAdresseProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TAddZusatzAdresse
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TAddZusatzAdresseProperties = class(TPersistent)
  private
    FServer:    TAddZusatzAdresse;
    function    GetDefaultInterface: IAddZusatzAdresse;
    constructor Create(AServer: TAddZusatzAdresse);
  protected
    function Get_Typ: WideString;
    function Get_Name: WideString;
    function Get_Kurzname: WideString;
    function Get_Name2: WideString;
    function Get_Name3: WideString;
    function Get_Ansprechpartner: WideString;
    function Get_Telefon1: WideString;
    function Get_Telefon2: WideString;
    function Get_Mobil: WideString;
    function Get_Fax: WideString;
    function Get_Mail: WideString;
    function Get_Web: WideString;
    function Get_USTID: WideString;
    function Get_PLZGrossempf: WideString;
    function Get_Titel: WideString;
    function Get_AkadGrad: WideString;
    function Get_Geburtstag: WideString;
    function Get_Anrede: WideString;
    function Get_Briefanrede: WideString;
    function Get_Grussformel: WideString;
    function Get_Versandzusatz: WideString;
    function Get_Zustellzusatz: WideString;
  public
    property DefaultInterface: IAddZusatzAdresse read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

resourcestring
  dtlServerPage = '(none)';

  dtlOcxPage = '(none)';

implementation

uses ComObj;

procedure TAddBOManager.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{29EA9B90-68F8-11D2-ADEB-000083F3B333}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80004002*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TAddBOManager.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IAddBOManager;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TAddBOManager.GetControlInterface: IAddBOManager;
begin
  CreateControl;
  Result := FIntf;
end;

function TAddBOManager.Get_GetMandant(mandnr: Integer): IAddMandant;
begin
    Result := DefaultInterface.GetMandant[mandnr];
end;

function TAddBOManager.Get_GetCurrentMandant: IAddMandant;
begin
    Result := DefaultInterface.GetCurrentMandant;
end;

function TAddBOManager.Get_GetWaehrung(hausWaehrung: Smallint): IAddWaehrung;
begin
    Result := DefaultInterface.GetWaehrung[hausWaehrung];
end;

function TAddBOManager.Get_GetAdressVerwaltung: IAddAdressVerwaltungMandant;
begin
    Result := DefaultInterface.GetAdressVerwaltung;
end;

function TAddBOManager.Get_GetMandanten: IDynamicCollection;
begin
    Result := DefaultInterface.GetMandanten;
end;

function TAddBOManager.Get_CheckForeignConnection(const file_: WideString): Integer;
begin
    Result := DefaultInterface.CheckForeignConnection[file_];
end;

function TAddBOManager.Get_StartAddison(mandant: Integer; const projekt: WideString; 
                                        const user: WideString; const password: WideString): Integer;
begin
    Result := DefaultInterface.StartAddison[mandant, projekt, user, password];
end;

procedure TAddBOManager.Connect;
begin
  DefaultInterface.Connect;
end;

procedure TAddBOManager.ConnectEx(const username: WideString; const password: WideString);
begin
  DefaultInterface.ConnectEx(username, password);
end;

procedure TAddBOManager.Close;
begin
  DefaultInterface.Close;
end;

procedure TAddBOManager.SetCurrentMandant(mandnr: Integer);
begin
  DefaultInterface.SetCurrentMandant(mandnr);
end;

procedure TAddBOManager.SetDefaultUserID(const loginName: WideString; const pwd: WideString);
begin
  DefaultInterface.SetDefaultUserID(loginName, pwd);
end;

procedure TAddBOManager.SetDefaultDB(const connectString: WideString; const dbName: WideString);
begin
  DefaultInterface.SetDefaultDB(connectString, dbName);
end;

procedure TAddMandant.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{29EA9B93-68F8-11D2-ADEB-000083F3B333}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80004002*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TAddMandant.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IAddMandant;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TAddMandant.GetControlInterface: IAddMandant;
begin
  CreateControl;
  Result := FIntf;
end;

function TAddMandant.Get_m_pPrivatMandant: IAddGeschaeftspartner;
begin
    Result := DefaultInterface.m_pPrivatMandant;
end;

function TAddMandant.Get_m_pFirmenMandant: IAddGeschaeftspartner;
begin
    Result := DefaultInterface.m_pFirmenMandant;
end;

function TAddMandant.Get_GetFibuProject: IAddProject;
begin
    Result := DefaultInterface.GetFibuProject;
end;

function TAddMandant.Get_GetLohnProject: IAddProject;
begin
    Result := DefaultInterface.GetLohnProject;
end;

function TAddMandant.Get_GetANLProject: IAddProject;
begin
    Result := DefaultInterface.GetANLProject;
end;

function TAddMandant.Get_m_pFreieFelder: IAddFreieFelder;
begin
    Result := DefaultInterface.m_pFreieFelder;
end;

function TAddMandant.Get_m_pEhegatte: IAddGeschaeftspartner;
begin
    Result := DefaultInterface.m_pEhegatte;
end;

function TAddMandant.Get_m_pGesetzlicherVertreterFirma: IAddGeschaeftspartner;
begin
    Result := DefaultInterface.m_pGesetzlicherVertreterFirma;
end;

function TAddMandant.Get_m_pGesetzlicherVertreterPerson: IAddGeschaeftspartner;
begin
    Result := DefaultInterface.m_pGesetzlicherVertreterPerson;
end;

function TAddMandant.Get_m_pEmpfangsBVFirma: IAddGeschaeftspartner;
begin
    Result := DefaultInterface.m_pEmpfangsBVFirma;
end;

function TAddMandant.Get_m_pEmpfangsBVPerson: IAddGeschaeftspartner;
begin
    Result := DefaultInterface.m_pEmpfangsBVPerson;
end;

function TAddMandant.Get_m_pKinder: IAddKinder;
begin
    Result := DefaultInterface.m_pKinder;
end;

function TAddMandant.Get_m_pAnsprPartnerFachbereich: IAddAnsprPartnerFachbereich;
begin
    Result := DefaultInterface.m_pAnsprPartnerFachbereich;
end;

function TAddMandant.Get_MemberByName(const MemberName: WideString): WideString;
begin
    Result := DefaultInterface.MemberByName[MemberName];
end;

function TAddMandant.Get_m_pFinanzamt: IAddFinanzamt;
begin
    Result := DefaultInterface.m_pFinanzamt;
end;

function TAddMandant.Get_m_Wuerfel(const bereich: WideString; wj: TDateTime; tochter: Integer): IAddWuerfel;
begin
    Result := DefaultInterface.m_Wuerfel[bereich, wj, tochter];
end;

function TAddMandant.Get_m_Wirtschaftsjahr(index: Integer): WideString;
begin
    Result := DefaultInterface.m_Wirtschaftsjahr[index];
end;

function TAddMandant.Get_m_AnzahlBFWFormulare(formularid: SYSINT; jahr: SYSINT): Integer;
begin
    Result := DefaultInterface.m_AnzahlBFWFormulare[formularid, jahr];
end;

function TAddMandant.Get_m_AnzahlBFWFormulareMonat(formularid: SYSINT; jahr: SYSINT; monat: SYSINT): Integer;
begin
    Result := DefaultInterface.m_AnzahlBFWFormulareMonat[formularid, jahr, monat];
end;

function TAddMandant.Get_FreiesFeld(const feldname: WideString): WideString;
begin
    Result := DefaultInterface.FreiesFeld[feldname];
end;

procedure TAddMandant.Set_FreiesFeld(const feldname: WideString; const pVal: WideString);
  { Warning: The property FreiesFeld has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.FreiesFeld := pVal;
end;

function TAddMandant.Get_Betriebsstaetten(pos: Integer): IAddGeschaeftspartner;
begin
    Result := DefaultInterface.Betriebsstaetten[pos];
end;

function TAddMandant.Get_GGW(Formel: SYSINT; monat: SYSINT; jahr: SYSINT): Double;
begin
    Result := DefaultInterface.GGW[Formel, monat, jahr];
end;

procedure TAddMandant.Set_GGW(Formel: SYSINT; monat: SYSINT; jahr: SYSINT; pVal: Double);
begin
  DefaultInterface.GGW[Formel, monat, jahr] := pVal;
end;

procedure TAddMandant.LockObject(exklusive: Integer);
begin
  DefaultInterface.LockObject(exklusive);
end;

procedure TAddMandant.UnLockObject(exklusiv: Integer);
begin
  DefaultInterface.UnLockObject(exklusiv);
end;

procedure TAddGeschaeftspartner.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{29EA9B96-68F8-11D2-ADEB-000083F3B333}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80004002*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TAddGeschaeftspartner.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IAddGeschaeftspartner;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TAddGeschaeftspartner.GetControlInterface: IAddGeschaeftspartner;
begin
  CreateControl;
  Result := FIntf;
end;

function TAddGeschaeftspartner.Get_Zusatzadressen: IAddZusatzAdressen;
begin
    Result := DefaultInterface.Zusatzadressen;
end;

procedure TAddGeschaeftspartner.BeginAdressupdate;
begin
  DefaultInterface.BeginAdressupdate;
end;

procedure TAddGeschaeftspartner.EndAdressupdate(commit: Integer);
begin
  DefaultInterface.EndAdressupdate(commit);
end;

procedure TAddWaehrung.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{29EA9B99-68F8-11D2-ADEB-000083F3B333}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80004002*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TAddWaehrung.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IAddWaehrung;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TAddWaehrung.GetControlInterface: IAddWaehrung;
begin
  CreateControl;
  Result := FIntf;
end;

function TAddWaehrung.Get_CalcFromTo(fromWID: Smallint; toWID: Smallint; betrag: Currency): Currency;
begin
    Result := DefaultInterface.CalcFromTo[fromWID, toWID, betrag];
end;

function TAddWaehrung.Get_GetKuerzel(__MIDL_0011: Smallint): WideString;
begin
    Result := DefaultInterface.GetKuerzel[__MIDL_0011];
end;

function TAddWaehrung.Get_GetWaehrungsID(const __MIDL_0012: WideString): Smallint;
begin
    Result := DefaultInterface.GetWaehrungsID[__MIDL_0012];
end;

procedure TAddWaehrung.WriteWaehrungstabelle(const odbsStr: WideString);
begin
  DefaultInterface.WriteWaehrungstabelle(odbsStr);
end;

procedure TAddProject.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{29EA9B9C-68F8-11D2-ADEB-000083F3B333}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80004002*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TAddProject.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IAddProject;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TAddProject.GetControlInterface: IAddProject;
begin
  CreateControl;
  Result := FIntf;
end;

procedure TAddKanzlei.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{29EA9B9F-68F8-11D2-ADEB-000083F3B333}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80004002*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TAddKanzlei.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IAddKanzlei;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TAddKanzlei.GetControlInterface: IAddKanzlei;
begin
  CreateControl;
  Result := FIntf;
end;

procedure TAddProtokoll.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{35D382D8-914A-11D2-AE46-000083F3B333}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80004002*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TAddProtokoll.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IAddProtokoll;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TAddProtokoll.GetControlInterface: IAddProtokoll;
begin
  CreateControl;
  Result := FIntf;
end;

procedure TAddProtokoll.AddLine(const text: WideString);
begin
  DefaultInterface.AddLine(text);
end;

procedure TAddAdressVerwaltungMandant.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{35D382DB-914A-11D2-AE46-000083F3B333}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80004002*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TAddAdressVerwaltungMandant.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IAddAdressVerwaltungMandant;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TAddAdressVerwaltungMandant.GetControlInterface: IAddAdressVerwaltungMandant;
begin
  CreateControl;
  Result := FIntf;
end;

function TAddAdressVerwaltungMandant.Get_GetFirst: IAddMandant;
begin
    Result := DefaultInterface.GetFirst;
end;

function TAddAdressVerwaltungMandant.Get_GetNext: IAddMandant;
begin
    Result := DefaultInterface.GetNext;
end;

function TAddAdressVerwaltungMandant.Get_GetPrev: IAddMandant;
begin
    Result := DefaultInterface.GetPrev;
end;

function TAddAdressVerwaltungMandant.Get_GetLast: IAddMandant;
begin
    Result := DefaultInterface.GetLast;
end;

procedure TAddAdressVerwaltungMandant.SetFilterKurzname(const __MIDL_0014: WideString);
begin
  DefaultInterface.SetFilterKurzname(__MIDL_0014);
end;

procedure TAddFreieFelder.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{74F31678-5B9A-11D3-9CD8-0000F6E74B7E}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80004002*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TAddFreieFelder.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IAddFreieFelder;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TAddFreieFelder.GetControlInterface: IAddFreieFelder;
begin
  CreateControl;
  Result := FIntf;
end;

procedure TAddFreieFelder.FreiesFeldLabelLaden;
begin
  DefaultInterface.FreiesFeldLabelLaden;
end;

procedure TAddFreieFelder.FreiesFeldLabelSpeichern;
begin
  DefaultInterface.FreiesFeldLabelSpeichern;
end;

procedure TAddKinder.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{7040F874-6518-11D3-9CE6-0000F6E74B7E}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80004002*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TAddKinder.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IAddKinder;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TAddKinder.GetControlInterface: IAddKinder;
begin
  CreateControl;
  Result := FIntf;
end;

procedure TAddAnsprPartnerFachbereich.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{4C46B924-69E4-11D3-9CEB-0000F6E74B7E}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80004002*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TAddAnsprPartnerFachbereich.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IAddAnsprPartnerFachbereich;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TAddAnsprPartnerFachbereich.GetControlInterface: IAddAnsprPartnerFachbereich;
begin
  CreateControl;
  Result := FIntf;
end;

function TAddAnsprPartnerFachbereich.Get_m_pHauptAnsprechPartner: IAddAnsprPartner;
begin
    Result := DefaultInterface.m_pHauptAnsprechPartner;
end;

function TAddAnsprPartnerFachbereich.Get_m_pFibuAnsprechPartner: IAddAnsprPartner;
begin
    Result := DefaultInterface.m_pFibuAnsprechPartner;
end;

function TAddAnsprPartnerFachbereich.Get_m_pLohnAnsprechPartner: IAddAnsprPartner;
begin
    Result := DefaultInterface.m_pLohnAnsprechPartner;
end;

function TAddAnsprPartnerFachbereich.Get_m_pBilanzAnsprechPartner: IAddAnsprPartner;
begin
    Result := DefaultInterface.m_pBilanzAnsprechPartner;
end;

function TAddAnsprPartnerFachbereich.Get_m_pBSTAnsprechPartner: IAddAnsprPartner;
begin
    Result := DefaultInterface.m_pBSTAnsprechPartner;
end;

function TAddAnsprPartnerFachbereich.Get_m_pPrivStAnsprechPartner: IAddAnsprPartner;
begin
    Result := DefaultInterface.m_pPrivStAnsprechPartner;
end;

function TAddAnsprPartnerFachbereich.Get_m_pSTBAnsprechPartner: IAddAnsprPartner;
begin
    Result := DefaultInterface.m_pSTBAnsprechPartner;
end;

function TAddAnsprPartnerFachbereich.Get_m_pSonstigeAnsprechPartner: IAddAnsprPartner;
begin
    Result := DefaultInterface.m_pSonstigeAnsprechPartner;
end;

procedure TAddAnsprPartner.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{4C46B927-69E4-11D3-9CEB-0000F6E74B7E}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80004002*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TAddAnsprPartner.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IAddAnsprPartner;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TAddAnsprPartner.GetControlInterface: IAddAnsprPartner;
begin
  CreateControl;
  Result := FIntf;
end;

procedure TAddFinanzamt.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{512E4972-F416-11D3-9DB5-005004510B61}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80004002*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TAddFinanzamt.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IAddFinanzamt;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TAddFinanzamt.GetControlInterface: IAddFinanzamt;
begin
  CreateControl;
  Result := FIntf;
end;

procedure TAddWorkflowManager.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{5B633B93-3515-4D0B-ADD5-215A5DCE53B0}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80004002*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TAddWorkflowManager.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IAddWorkflowManager;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TAddWorkflowManager.GetControlInterface: IAddWorkflowManager;
begin
  CreateControl;
  Result := FIntf;
end;

function TAddWorkflowManager.Get_m_SubDir(__MIDL_0016: Integer): WideString;
begin
    Result := DefaultInterface.m_SubDir[__MIDL_0016];
end;

function TAddWorkflowManager.Get_m_WorkflowItem(pos: Integer): IAddWorkflowItem;
begin
    Result := DefaultInterface.m_WorkflowItem[pos];
end;

function TAddWorkflowManager.Get_CreateDocument: IAddWorkflowItem;
begin
    Result := DefaultInterface.CreateDocument;
end;

procedure TAddWorkflowManager.ChDir(const __MIDL_0015: WideString);
begin
  DefaultInterface.ChDir(__MIDL_0015);
end;

procedure TAddWorkflowManager.ChRootUser;
begin
  DefaultInterface.ChRootUser;
end;

procedure TAddWorkflowManager.ChRootKanzlei;
begin
  DefaultInterface.ChRootKanzlei;
end;

procedure TAddWorkflowManager.ChRootAddison;
begin
  DefaultInterface.ChRootAddison;
end;

procedure TAddWorkflowManager.AddDocument(const __MIDL_0017: IAddWorkflowItem);
begin
  DefaultInterface.AddDocument(__MIDL_0017);
end;

procedure TAddWorkflowManager.ChangeToStandardExterneDokumente;
begin
  DefaultInterface.ChangeToStandardExterneDokumente;
end;

procedure TAddWorkflowItem.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{B017F789-D3B2-4EEA-975D-57EE443D78E4}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80004002*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TAddWorkflowItem.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IAddWorkflowItem;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TAddWorkflowItem.GetControlInterface: IAddWorkflowItem;
begin
  CreateControl;
  Result := FIntf;
end;

function TAddWorkflowItem.Get_m_Eigenschaft(const Name: WideString): WideString;
begin
    Result := DefaultInterface.m_Eigenschaft[Name];
end;

procedure TAddWorkflowItem.Set_m_Eigenschaft(const Name: WideString; const pVal: WideString);
  { Warning: The property m_Eigenschaft has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.m_Eigenschaft := pVal;
end;

procedure TAddWorkflowItem.Store;
begin
  DefaultInterface.Store;
end;

procedure TAddWorkflowItem.Delete;
begin
  DefaultInterface.Delete;
end;

procedure TAddTools.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{3809CCB3-241B-4A4A-921B-F564D2A26B41}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80004002*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TAddTools.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IAddTools;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TAddTools.GetControlInterface: IAddTools;
begin
  CreateControl;
  Result := FIntf;
end;

function TAddTools.Get_NetGetUniversalName(const localPath: WideString): WideString;
begin
    Result := DefaultInterface.NetGetUniversalName[localPath];
end;

function TAddTools.Get_UniqueFilename(const vorlage: WideString): WideString;
begin
    Result := DefaultInterface.UniqueFilename[vorlage];
end;

procedure TAddWuerfel.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{41CBAB3E-3F73-45CA-9B22-F9CAC4620B08}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80004002*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TAddWuerfel.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IAddWuerfel;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TAddWuerfel.GetControlInterface: IAddWuerfel;
begin
  CreateControl;
  Result := FIntf;
end;

function TAddWuerfel.Get_GetWert(const art: WideString; const Id: WideString; const kost: WideString): Currency;
begin
    Result := DefaultInterface.GetWert[art, Id, kost];
end;

function TAddWuerfel.Get_GetWertFromID(const __MIDL_0013: WideString): Currency;
begin
    Result := DefaultInterface.GetWertFromID[__MIDL_0013];
end;

function TAddWuerfel.Get_GetArt(const Id: WideString): WideString;
begin
    Result := DefaultInterface.GetArt[Id];
end;

function TAddWuerfel.Get_GetKonto(const Id: WideString): WideString;
begin
    Result := DefaultInterface.GetKonto[Id];
end;

function TAddWuerfel.Get_GetKost(const Id: WideString): WideString;
begin
    Result := DefaultInterface.GetKost[Id];
end;

function TAddWuerfel.Get_GetWertArtFromId(const Id: WideString; const art: WideString; 
                                          periode: Integer; kumuliert: Integer): Currency;
begin
    Result := DefaultInterface.GetWertArtFromId[Id, art, periode, kumuliert];
end;

function TAddWuerfel.Get_GetWertX(const IdentType: WideString; Zeitraum: AddZeitraum; 
                                  Wertart: AddWertart; Wertabgriff: AddWertabgriff; periode: Integer): Currency;
begin
    Result := DefaultInterface.GetWertX[IdentType, Zeitraum, Wertart, Wertabgriff, periode];
end;

procedure TAddServerItem.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{5D712AA2-7274-4528-8CA4-9218F5512139}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80004002*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TAddServerItem.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IAddServerItem;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TAddServerItem.GetControlInterface: IAddServerItem;
begin
  CreateControl;
  Result := FIntf;
end;

function TAddServerItem.Get_Request(const __MIDL_0018: WideString): OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Request[__MIDL_0018];
end;

procedure TAddServerItem.Init(const szProject: WideString; nVJahr: SYSINT);
begin
  DefaultInterface.Init(szProject, nVJahr);
end;

procedure TAddServerItem.Open(const szConnect: WideString; nVersion: SYSINT);
begin
  DefaultInterface.Open(szConnect, nVersion);
end;

procedure TAddServerItem.AppendFile(const szRTFFile: WideString; lIndex: Integer);
begin
  DefaultInterface.AppendFile(szRTFFile, lIndex);
end;

procedure TAddServerItem.AppendText(const szRTFText: WideString; lIndex: Integer);
begin
  DefaultInterface.AppendText(szRTFText, lIndex);
end;

procedure TAddServerItem.Execute(const sCmd: WideString; aParam: OleVariant);
begin
  DefaultInterface.Execute(sCmd, aParam);
end;

class function CoAddWuerfelAnsicht.Create: IAddWuerfelAnsicht;
begin
  Result := CreateComObject(CLASS_AddWuerfelAnsicht) as IAddWuerfelAnsicht;
end;

class function CoAddWuerfelAnsicht.CreateRemote(const MachineName: string): IAddWuerfelAnsicht;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AddWuerfelAnsicht) as IAddWuerfelAnsicht;
end;

procedure TAddWuerfelAnsicht.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{C513FE4F-CDAF-4072-9D93-9953A5D42806}';
    IntfIID:   '{C880579F-1018-497E-B5CB-2AD4A62D378D}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TAddWuerfelAnsicht.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IAddWuerfelAnsicht;
  end;
end;

procedure TAddWuerfelAnsicht.ConnectTo(svrIntf: IAddWuerfelAnsicht);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TAddWuerfelAnsicht.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TAddWuerfelAnsicht.GetDefaultInterface: IAddWuerfelAnsicht;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TAddWuerfelAnsicht.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TAddWuerfelAnsichtProperties.Create(Self);
{$ENDIF}
end;

destructor TAddWuerfelAnsicht.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TAddWuerfelAnsicht.GetServerProperties: TAddWuerfelAnsichtProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TAddWuerfelAnsicht.Get_GetWert(x: Integer; y: Integer): WideString;
begin
    Result := DefaultInterface.GetWert[x, y];
end;

function TAddWuerfelAnsicht.Get_GetFormat(x: Integer; y: Integer): WideString;
begin
    Result := DefaultInterface.GetFormat[x, y];
end;

function TAddWuerfelAnsicht.Get_m_Mandant: Integer;
begin
    Result := DefaultInterface.m_Mandant;
end;

procedure TAddWuerfelAnsicht.Set_m_Mandant(pVal: Integer);
begin
  DefaultInterface.Set_m_Mandant(pVal);
end;

function TAddWuerfelAnsicht.Get_m_WJ: TDateTime;
begin
    Result := DefaultInterface.m_WJ;
end;

procedure TAddWuerfelAnsicht.Set_m_WJ(pVal: TDateTime);
begin
  DefaultInterface.Set_m_WJ(pVal);
end;

function TAddWuerfelAnsicht.Get_m_AbgrenzPeriode: TDateTime;
begin
    Result := DefaultInterface.m_AbgrenzPeriode;
end;

procedure TAddWuerfelAnsicht.Set_m_AbgrenzPeriode(pVal: TDateTime);
begin
  DefaultInterface.Set_m_AbgrenzPeriode(pVal);
end;

function TAddWuerfelAnsicht.Get_EnumBereiche(pos: Integer): WideString;
begin
    Result := DefaultInterface.EnumBereiche[pos];
end;

function TAddWuerfelAnsicht.Get_EnumAnsichten(const bereich: WideString; pos: Integer): WideString;
begin
    Result := DefaultInterface.EnumAnsichten[bereich, pos];
end;

function TAddWuerfelAnsicht.Get_m_RowCount: Integer;
begin
    Result := DefaultInterface.m_RowCount;
end;

function TAddWuerfelAnsicht.Get_m_ColCount: Integer;
begin
    Result := DefaultInterface.m_ColCount;
end;

function TAddWuerfelAnsicht.Get_m_ColBreite(col: Integer): Integer;
begin
    Result := DefaultInterface.m_ColBreite[col];
end;

function TAddWuerfelAnsicht.Get_m_Title(col: Integer): WideString;
begin
    Result := DefaultInterface.m_Title[col];
end;

function TAddWuerfelAnsicht.Get_m_ColAlign(col: Integer): WideString;
begin
    Result := DefaultInterface.m_ColAlign[col];
end;

function TAddWuerfelAnsicht.Get_m_SubTitle(col: Integer): WideString;
begin
    Result := DefaultInterface.m_SubTitle[col];
end;

procedure TAddWuerfelAnsicht.Set_m_Periode(Param1: Integer);
begin
  DefaultInterface.Set_m_Periode(Param1);
end;

function TAddWuerfelAnsicht.Get_m_ColFormat(col: Integer): WideString;
begin
    Result := DefaultInterface.m_ColFormat[col];
end;

function TAddWuerfelAnsicht.Get_m_Title3(col: Integer): WideString;
begin
    Result := DefaultInterface.m_Title3[col];
end;

function TAddWuerfelAnsicht.Get_m_Title4(col: Integer): WideString;
begin
    Result := DefaultInterface.m_Title4[col];
end;

procedure TAddWuerfelAnsicht.LoadAnsicht(const bereich: WideString; const ansicht: WideString);
begin
  DefaultInterface.LoadAnsicht(bereich, ansicht);
end;

procedure TAddWuerfelAnsicht.ReloadCurrentAnsicht;
begin
  DefaultInterface.ReloadCurrentAnsicht;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TAddWuerfelAnsichtProperties.Create(AServer: TAddWuerfelAnsicht);
begin
  inherited Create;
  FServer := AServer;
end;

function TAddWuerfelAnsichtProperties.GetDefaultInterface: IAddWuerfelAnsicht;
begin
  Result := FServer.DefaultInterface;
end;

function TAddWuerfelAnsichtProperties.Get_GetWert(x: Integer; y: Integer): WideString;
begin
    Result := DefaultInterface.GetWert[x, y];
end;

function TAddWuerfelAnsichtProperties.Get_GetFormat(x: Integer; y: Integer): WideString;
begin
    Result := DefaultInterface.GetFormat[x, y];
end;

function TAddWuerfelAnsichtProperties.Get_m_Mandant: Integer;
begin
    Result := DefaultInterface.m_Mandant;
end;

procedure TAddWuerfelAnsichtProperties.Set_m_Mandant(pVal: Integer);
begin
  DefaultInterface.Set_m_Mandant(pVal);
end;

function TAddWuerfelAnsichtProperties.Get_m_WJ: TDateTime;
begin
    Result := DefaultInterface.m_WJ;
end;

procedure TAddWuerfelAnsichtProperties.Set_m_WJ(pVal: TDateTime);
begin
  DefaultInterface.Set_m_WJ(pVal);
end;

function TAddWuerfelAnsichtProperties.Get_m_AbgrenzPeriode: TDateTime;
begin
    Result := DefaultInterface.m_AbgrenzPeriode;
end;

procedure TAddWuerfelAnsichtProperties.Set_m_AbgrenzPeriode(pVal: TDateTime);
begin
  DefaultInterface.Set_m_AbgrenzPeriode(pVal);
end;

function TAddWuerfelAnsichtProperties.Get_EnumBereiche(pos: Integer): WideString;
begin
    Result := DefaultInterface.EnumBereiche[pos];
end;

function TAddWuerfelAnsichtProperties.Get_EnumAnsichten(const bereich: WideString; pos: Integer): WideString;
begin
    Result := DefaultInterface.EnumAnsichten[bereich, pos];
end;

function TAddWuerfelAnsichtProperties.Get_m_RowCount: Integer;
begin
    Result := DefaultInterface.m_RowCount;
end;

function TAddWuerfelAnsichtProperties.Get_m_ColCount: Integer;
begin
    Result := DefaultInterface.m_ColCount;
end;

function TAddWuerfelAnsichtProperties.Get_m_ColBreite(col: Integer): Integer;
begin
    Result := DefaultInterface.m_ColBreite[col];
end;

function TAddWuerfelAnsichtProperties.Get_m_Title(col: Integer): WideString;
begin
    Result := DefaultInterface.m_Title[col];
end;

function TAddWuerfelAnsichtProperties.Get_m_ColAlign(col: Integer): WideString;
begin
    Result := DefaultInterface.m_ColAlign[col];
end;

function TAddWuerfelAnsichtProperties.Get_m_SubTitle(col: Integer): WideString;
begin
    Result := DefaultInterface.m_SubTitle[col];
end;

procedure TAddWuerfelAnsichtProperties.Set_m_Periode(Param1: Integer);
begin
  DefaultInterface.Set_m_Periode(Param1);
end;

function TAddWuerfelAnsichtProperties.Get_m_ColFormat(col: Integer): WideString;
begin
    Result := DefaultInterface.m_ColFormat[col];
end;

function TAddWuerfelAnsichtProperties.Get_m_Title3(col: Integer): WideString;
begin
    Result := DefaultInterface.m_Title3[col];
end;

function TAddWuerfelAnsichtProperties.Get_m_Title4(col: Integer): WideString;
begin
    Result := DefaultInterface.m_Title4[col];
end;

{$ENDIF}

class function CoAddZusatzAdressen.Create: IAddZusatzAdressen;
begin
  Result := CreateComObject(CLASS_AddZusatzAdressen) as IAddZusatzAdressen;
end;

class function CoAddZusatzAdressen.CreateRemote(const MachineName: string): IAddZusatzAdressen;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AddZusatzAdressen) as IAddZusatzAdressen;
end;

procedure TAddZusatzAdressen.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{3AC2F9F7-928A-4FC1-AF95-1E3DB7F5F76C}';
    IntfIID:   '{CC12C96B-A021-47B7-96A6-83B37AD21FCB}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TAddZusatzAdressen.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IAddZusatzAdressen;
  end;
end;

procedure TAddZusatzAdressen.ConnectTo(svrIntf: IAddZusatzAdressen);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TAddZusatzAdressen.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TAddZusatzAdressen.GetDefaultInterface: IAddZusatzAdressen;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TAddZusatzAdressen.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TAddZusatzAdressenProperties.Create(Self);
{$ENDIF}
end;

destructor TAddZusatzAdressen.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TAddZusatzAdressen.GetServerProperties: TAddZusatzAdressenProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TAddZusatzAdressen.Get_Count: Integer;
begin
    Result := DefaultInterface.Count;
end;

function TAddZusatzAdressen.Get_Item(pos: Integer): IAddZusatzAdresse;
begin
    Result := DefaultInterface.Item[pos];
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TAddZusatzAdressenProperties.Create(AServer: TAddZusatzAdressen);
begin
  inherited Create;
  FServer := AServer;
end;

function TAddZusatzAdressenProperties.GetDefaultInterface: IAddZusatzAdressen;
begin
  Result := FServer.DefaultInterface;
end;

function TAddZusatzAdressenProperties.Get_Count: Integer;
begin
    Result := DefaultInterface.Count;
end;

function TAddZusatzAdressenProperties.Get_Item(pos: Integer): IAddZusatzAdresse;
begin
    Result := DefaultInterface.Item[pos];
end;

{$ENDIF}

class function CoAddZusatzAdresse.Create: IAddZusatzAdresse;
begin
  Result := CreateComObject(CLASS_AddZusatzAdresse) as IAddZusatzAdresse;
end;

class function CoAddZusatzAdresse.CreateRemote(const MachineName: string): IAddZusatzAdresse;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AddZusatzAdresse) as IAddZusatzAdresse;
end;

procedure TAddZusatzAdresse.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{911397FF-B0DC-492B-AE77-2435B7F8E14C}';
    IntfIID:   '{934E6095-A66B-42CB-9DEE-7BF6CCF6416B}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TAddZusatzAdresse.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IAddZusatzAdresse;
  end;
end;

procedure TAddZusatzAdresse.ConnectTo(svrIntf: IAddZusatzAdresse);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TAddZusatzAdresse.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TAddZusatzAdresse.GetDefaultInterface: IAddZusatzAdresse;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TAddZusatzAdresse.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TAddZusatzAdresseProperties.Create(Self);
{$ENDIF}
end;

destructor TAddZusatzAdresse.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TAddZusatzAdresse.GetServerProperties: TAddZusatzAdresseProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TAddZusatzAdresse.Get_Typ: WideString;
begin
    Result := DefaultInterface.Typ;
end;

function TAddZusatzAdresse.Get_Name: WideString;
begin
    Result := DefaultInterface.Name;
end;

function TAddZusatzAdresse.Get_Kurzname: WideString;
begin
    Result := DefaultInterface.Kurzname;
end;

function TAddZusatzAdresse.Get_Name2: WideString;
begin
    Result := DefaultInterface.Name2;
end;

function TAddZusatzAdresse.Get_Name3: WideString;
begin
    Result := DefaultInterface.Name3;
end;

function TAddZusatzAdresse.Get_Ansprechpartner: WideString;
begin
    Result := DefaultInterface.Ansprechpartner;
end;

function TAddZusatzAdresse.Get_Telefon1: WideString;
begin
    Result := DefaultInterface.Telefon1;
end;

function TAddZusatzAdresse.Get_Telefon2: WideString;
begin
    Result := DefaultInterface.Telefon2;
end;

function TAddZusatzAdresse.Get_Mobil: WideString;
begin
    Result := DefaultInterface.Mobil;
end;

function TAddZusatzAdresse.Get_Fax: WideString;
begin
    Result := DefaultInterface.Fax;
end;

function TAddZusatzAdresse.Get_Mail: WideString;
begin
    Result := DefaultInterface.Mail;
end;

function TAddZusatzAdresse.Get_Web: WideString;
begin
    Result := DefaultInterface.Web;
end;

function TAddZusatzAdresse.Get_USTID: WideString;
begin
    Result := DefaultInterface.USTID;
end;

function TAddZusatzAdresse.Get_PLZGrossempf: WideString;
begin
    Result := DefaultInterface.PLZGrossempf;
end;

function TAddZusatzAdresse.Get_Titel: WideString;
begin
    Result := DefaultInterface.Titel;
end;

function TAddZusatzAdresse.Get_AkadGrad: WideString;
begin
    Result := DefaultInterface.AkadGrad;
end;

function TAddZusatzAdresse.Get_Geburtstag: WideString;
begin
    Result := DefaultInterface.Geburtstag;
end;

function TAddZusatzAdresse.Get_Anrede: WideString;
begin
    Result := DefaultInterface.Anrede;
end;

function TAddZusatzAdresse.Get_Briefanrede: WideString;
begin
    Result := DefaultInterface.Briefanrede;
end;

function TAddZusatzAdresse.Get_Grussformel: WideString;
begin
    Result := DefaultInterface.Grussformel;
end;

function TAddZusatzAdresse.Get_Versandzusatz: WideString;
begin
    Result := DefaultInterface.Versandzusatz;
end;

function TAddZusatzAdresse.Get_Zustellzusatz: WideString;
begin
    Result := DefaultInterface.Zustellzusatz;
end;

procedure TAddZusatzAdresse.Adresse(out strasse: WideString; out land: WideString; 
                                    out plz: WideString; out ort: WideString);
begin
  DefaultInterface.Adresse(strasse, land, plz, ort);
end;

procedure TAddZusatzAdresse.Bankdaten(out blz: WideString; out konto: WideString);
begin
  DefaultInterface.Bankdaten(blz, konto);
end;

procedure TAddZusatzAdresse.Postfach(out Postfach: WideString; out plzPostfach: WideString);
begin
  DefaultInterface.Postfach(Postfach, plzPostfach);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TAddZusatzAdresseProperties.Create(AServer: TAddZusatzAdresse);
begin
  inherited Create;
  FServer := AServer;
end;

function TAddZusatzAdresseProperties.GetDefaultInterface: IAddZusatzAdresse;
begin
  Result := FServer.DefaultInterface;
end;

function TAddZusatzAdresseProperties.Get_Typ: WideString;
begin
    Result := DefaultInterface.Typ;
end;

function TAddZusatzAdresseProperties.Get_Name: WideString;
begin
    Result := DefaultInterface.Name;
end;

function TAddZusatzAdresseProperties.Get_Kurzname: WideString;
begin
    Result := DefaultInterface.Kurzname;
end;

function TAddZusatzAdresseProperties.Get_Name2: WideString;
begin
    Result := DefaultInterface.Name2;
end;

function TAddZusatzAdresseProperties.Get_Name3: WideString;
begin
    Result := DefaultInterface.Name3;
end;

function TAddZusatzAdresseProperties.Get_Ansprechpartner: WideString;
begin
    Result := DefaultInterface.Ansprechpartner;
end;

function TAddZusatzAdresseProperties.Get_Telefon1: WideString;
begin
    Result := DefaultInterface.Telefon1;
end;

function TAddZusatzAdresseProperties.Get_Telefon2: WideString;
begin
    Result := DefaultInterface.Telefon2;
end;

function TAddZusatzAdresseProperties.Get_Mobil: WideString;
begin
    Result := DefaultInterface.Mobil;
end;

function TAddZusatzAdresseProperties.Get_Fax: WideString;
begin
    Result := DefaultInterface.Fax;
end;

function TAddZusatzAdresseProperties.Get_Mail: WideString;
begin
    Result := DefaultInterface.Mail;
end;

function TAddZusatzAdresseProperties.Get_Web: WideString;
begin
    Result := DefaultInterface.Web;
end;

function TAddZusatzAdresseProperties.Get_USTID: WideString;
begin
    Result := DefaultInterface.USTID;
end;

function TAddZusatzAdresseProperties.Get_PLZGrossempf: WideString;
begin
    Result := DefaultInterface.PLZGrossempf;
end;

function TAddZusatzAdresseProperties.Get_Titel: WideString;
begin
    Result := DefaultInterface.Titel;
end;

function TAddZusatzAdresseProperties.Get_AkadGrad: WideString;
begin
    Result := DefaultInterface.AkadGrad;
end;

function TAddZusatzAdresseProperties.Get_Geburtstag: WideString;
begin
    Result := DefaultInterface.Geburtstag;
end;

function TAddZusatzAdresseProperties.Get_Anrede: WideString;
begin
    Result := DefaultInterface.Anrede;
end;

function TAddZusatzAdresseProperties.Get_Briefanrede: WideString;
begin
    Result := DefaultInterface.Briefanrede;
end;

function TAddZusatzAdresseProperties.Get_Grussformel: WideString;
begin
    Result := DefaultInterface.Grussformel;
end;

function TAddZusatzAdresseProperties.Get_Versandzusatz: WideString;
begin
    Result := DefaultInterface.Versandzusatz;
end;

function TAddZusatzAdresseProperties.Get_Zustellzusatz: WideString;
begin
    Result := DefaultInterface.Zustellzusatz;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents(dtlOcxPage, [TAddBOManager, TAddMandant, TAddGeschaeftspartner, TAddWaehrung, 
    TAddProject, TAddKanzlei, TAddProtokoll, TAddAdressVerwaltungMandant, TAddFreieFelder, 
    TAddKinder, TAddAnsprPartnerFachbereich, TAddAnsprPartner, TAddFinanzamt, TAddWorkflowManager, 
    TAddWorkflowItem, TAddTools, TAddWuerfel, TAddServerItem]);
  RegisterComponents(dtlServerPage, [TAddWuerfelAnsicht, TAddZusatzAdressen, TAddZusatzAdresse]);
end;

end.
