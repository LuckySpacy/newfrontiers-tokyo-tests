unit o_stammdaten;

interface

{$WARN SYMBOL_PLATFORM OFF}
{$WARN SYMBOL_DEPRECATED OFF}

uses Classes, IBX.IBDatabase, IBX.IBQuery, IBX.IBTable, Graphics, DB, o_zahlart,
  o_multivalues, Registry, Windows, StdCtrls, o_logging, o_GlobalSpell,
  LockProvider, o_druckablaufHelper, o_bitmuster, SendMail, c_Types;

type
  TStammdaten = class(TComponent)

  private

    IBT: TIBTransaction;
    _Mitarbeiter: pointer;

    Release: string;
    DPAbsender: string;
    DPAbsenderAbk: string;
    DPBank: string;
    DPBLZ: string;
    DPErmaessigung: real;
    DPIdentCode: string;
    DPKontoNr: string;
    DPNNAufschlag: real;
    DPKennung: string;
    DPKundenNr: string;
    DPVorausVerfahren: string;
    DPKennung_inter: string;
    DynamischeID: longint;
    _Easylog: boolean;
    EasyLogPfad: string;
    FarbeEnde: TColor;
    FarbeStart: TColor;
    FaxPfad: string;
    FibuMitarbeiter: string;
    ImageDir: string;
    DokuDir: string;
    InkassoMahnstufe: integer;
    InkassoTage: integer;
    InkassoAbstand: integer;
    JournalPfad: string;
    LeergutID: longint;
    LockServerIP: string;
    MahngebuehrStufe1: real;
    MahngebuehrStufe2: real;
    MahngebuehrStufe3: real;
    MahngebuehrStufe4: real;
    Mahnzins: real;
    MandantName: string;
    NullPosition: longint;
    NummernFormat: string;
    RecoveryPasswort: string;
    ReportPfad: string;
    ReportPfadNeu: string;
    ReportMandantNeu: string;
    ReportPfadUmgeleitet: boolean;
    RMAMitarbeiter: string;
    SMHost: string;
    SMFromAdress: string;
    SMFromName: string;
    SMUser: string;
    SMPass: string;
    StdVersand: longint;
    StdZahlart: longint;
    StdBriefanrede: string;
    TageTeillieferung: integer;
    Versandpause: boolean;
    ZNettoTage: integer;
    ZSkonto: real;
    ZSkontoTage: integer;
    RMA_GUBankZahlart: TZahlungsart;
    RMA_GUKontoZahlart: TZahlungsart;
    ServerEinstellungenLeer: boolean;
    Uebergabeliste: boolean;
    Abrechnungszeit: integer;
    AbrechnungszeitFK: boolean;
    PlanetShop: boolean;
    Mahngrenze: real;
    ChargeMenge: boolean;
    ChargeEnde: string;
    ScanMode: string;
    ScanOK: string;
    ScanAbbr: string;
    StdKUKreditLimit: double;
    StdLTKreditLimit: double;
    ProvDatum: byte;
    NachkommaDruck: integer;
    aktGB: integer;

    KondNetto: string;
    KondNettoTage: string;
    KondSkontoTage: string;
    KondSkonto: string;
    REKondNetto: string;
    REKondNettoTage: string;
    REKondSkontoTage: string;
    REKondSkonto: string;

    MinBestandTage: integer;
    MinBestandGrenze: real;

    VersandMo: boolean;
    VersandDi: boolean;
    VersandMi: boolean;
    VersandDo: boolean;
    VersandFr: boolean;
    VersandSa: boolean;
    VersandSo: boolean;

    FaxFrKu: boolean;
    FaxVersKu: boolean;
    FaxVersVe: boolean;
    MailFrKu: boolean;
    MailVersKu: boolean;
    DruckFrKu: boolean;
    FaxTeillieferung: integer;
    KeinePreisaenderung: boolean;
    BudgetKG: integer;
    WarenGrP: integer;

    KontoDirektfakturaKostenInland: longint;
    KontoDirektfakturaKostenAusland: longint;
    KontoDirektfakturaKostenEUAusland: longint;
    KontoDirektfakturaKostenEUAuslandUST: longint;
    KontoDirektfakturaErloesInland: longint;
    KontoDirektfakturaErloesAusland: longint;
    KontoDirektfakturaErloesEUAusland: longint;
    KontoDirektfakturaErloesEUAuslandUST: longint;

    Anfahrtsart: integer;
    Pauschalbetrag_kennziffer: integer;
    Entfernung_kennziffer: integer;
    Anfahrtszeit_kennziffer: integer;

    SNZwingend: boolean;
    SNzwingend_Raus: boolean;
    SNNeuBeiWE: boolean;
    SNScanbeiVersand: boolean;
    SNzwingend_Raus_WE: boolean;

    SavePasswords: boolean;
    DruckePBS: boolean;
    KommFormular: integer;
    LogMemo: TMemo;
    DruckerAuswahlSynchron: boolean;

    NavExportDir: string;
    NavImportDir: string;
    NavImportBack: string;
    NavExportBack: string;

    UstID: string;
    ILN: string;
    EDIDir: string;
    EDIImportDir: string;
    EDIName: string;
    EDIMitarbeiter: pointer;
    EDIMitarbeiterID: integer;
    EDILager: integer;
    EDIVersandfenster: integer;
    EDIGeschaeftsbereich: integer;

    LIAutoVersand: boolean;

    InkassoAbfrage: boolean;
    PreisKGruppe: integer;
    EinPreisFuerAlle: boolean;
    NullEuroWarnung: boolean;
    SRTextImmer: boolean;

    AnMemoFirma: string;
    AnMemoPrivat: string;
    AnMemoFirmaPf: string;
    AnMemoPrivatPf: string;
    AnMemoFirmaLI: string;
    AnMemoPrivatLI: string;

    KommscheinBeiFreigabe: boolean;
    VOSachbearbeiterUeberschreiben: boolean;
    KontorREMemo: boolean;
    VoArtInGrid: boolean;
    EigeneOPVerwaltung: boolean;
    StdTeillieferVerhalten: integer;
    VerbuchenNachTagen: integer;
    KundenPLZVertreter: boolean;
    RabattUeberschreiben: boolean;
    DPDRoutenVersion: string;
    DPDKundennummer: string;
    DPDDepotkennung: string;
    DPDAbsender: string;
    DPDBank: string;
    DPDBlz: string;
    DPDKontoNr: string;
    DPDNNAufschlag: double;
    DPDDepotAdresse: string;
    DPDDepotTel: string;
    DPDDepotFax: string;
    KuSucheErweitert: boolean;
    RiskCheckCount: integer;
    VOSperreBeiGedruckt: boolean;
    DruckParameter: string;
    Server: boolean;
    KuSperreInkasso: boolean;
    Porto_Skontierbar: boolean;
    CheckSperre: boolean;
    NVEErfassen: boolean;
    DatevKontenManipulieren: boolean;
    UmsatzProvision: boolean;
    MySqlLowerCase: boolean;
    MySqlUtf8: boolean;
    Lagerhelper: pointer;

    VerdichtungKreditoren: integer;
    VerdichtungDebitoren: integer;

    TicketArtikel: integer;

//    Druckobjekt: TDrucken;
    DruckablaufHelper: TDruckablaufHelper;
    fLog: TLogging;

    // Felder für Lager Phase 1
    WELager: integer;
    WEPlatz: integer;

    // Mehrwertsteuer
    MwST_voll_1: real;
    MwST_voll_2: real;
    MwST_vermindert_1: real;
    MwST_vermindert_2: real;
    MwST_Stichtag: TDateTime;

    VKPreiseAnzeigen: boolean;
    VKPreiseAnzeigenKG: integer;
    ResMengenSofort: boolean;
    ServiceVersandartID: integer;
    ServiceVersandart: pointer;
    Waehrungszeichen: string;
    SkontoVonProvAbziehen: boolean;
    ZeitfensterIgnorieren: boolean;
    WiedervorlageAnzeigen: integer;
    Kundenformulare: integer;
    DefaultLiefertage: integer;
    UebersichtAnsprechpartner: boolean;
    KW_Datum: integer;

    // Serviceauftrag
    AU_Bezugsdaten: string;
    AU_Beschreibung: string;
    AU_Bericht: string;
    AU_Art: integer;
    AU_Unterart: integer;
    AU_Anforderung: integer;

    // Fehlerberichte automatisch
    FB_POP3_Server: string;
    FB_POP3_Benutzer: string;
    FB_POP3_Passwort: string;
    FB_POP3_Mail: string;

    erweiterteAdressdaten: boolean;
    KuSperrstatus: integer;
    NachkommaPos: integer;
    VorgangNettoSumme: boolean;
    SammelRe_Porto: boolean;
    FreiText: string;
    BilderAlle: boolean;
    ArtikelExternVKAlle: boolean;
    Zertifikat: boolean;
    Vorgangsspalten: TBitmuster;
    // Artikelspalten                 : TBitmuster;
    KeinRabattBeiSA: boolean;

    Vo_status_beimFortfuehren: integer;
    Vo_status_beimKopieren: integer;
    Vo_status_inRE_Fortfuehren: integer;
    Vo_status_inER_Fortfuehren: integer;

    UPS_KUNR: string;
    UPS_Warenbeschreibung: string;
    UPS_Verzeichnis: string;
    UPS_Telefon: string;

    GENR_Auswahl: integer; // Was wird als Gerätennr verwendet
    ZahlungBeiOPNrNull: boolean;
    karenzZuFaelligkeit: boolean;
    RechnungGetrennt: boolean;
    KeinRabattBeiSpezPreis: boolean;
    Chargenverzeichnis: string;
    Faxversand: TDateTime;
    Faxsofort: boolean;
    Kundensuchspalten: TBitmuster;
    Lief_nichtfortfueren: boolean;
    ServiceGruppieren: boolean;
    GeraeteArtikelnr: boolean;
    ServiceLieferschein: boolean;
    PicklistenDrucken: boolean;
    ChargenInPackliste: boolean;
    KU_Notizen: boolean;
    LT_Notizen: boolean;
    DruckeLangText: boolean;
    // Soll der Langtext bei Vorgängen gedruckt werden oder nicht. Kann in der Position überschrieben werden
    DruckeLangTextKreditor: boolean; // Siehe oben nur Kreditorvorgänge
    GeraetAutomatisch: integer;      // Soll ein Geraet beim Fortführen angelegt werden?
                                     // Wenn ja dann beim LI oder RE

    VOVersandBisTage: integer; // VorgangStammdaten Versandfenster
                               // VersandBis - Tagen einstellen

    SNFensternichtzeigen: boolean; // Schalter für fortführen in LI oder WE
    Versand_allePos: boolean; // (Versand) Wenn Hacken sitzt, dann Textposition und Direktfaktura auc zeigen.
    ProvDecksatzbeachten: boolean; // Provisionsermitlung beim Rohertragskalkulation
    VoSuche_vondatum: TDateTime; // Vorgang Suche Einstellung Vondatum
    VoSuche_Anzahltage: integer; // Statt "VoSuche_vondatum" -> aktuele Datum -(X)Tage
    UseVorgangLiefertermin: boolean;
    VersandFrei: boolean; // falls true, kann die Versandart im Vorgang eingetippt werden
    Mahnzinsen_immerberechnen: boolean; // Zinsen bei Zahlungserinnerung berechnen?
    Art_fuer_neuen_vorgang: integer; // Dieser Art wählen für neuen Vorgang
    ArNr_doppelt_pruefen: boolean; // Artikel_Stamm Prüfung. Beim Kunden , die keinen doppelte Artikelnummer haben -> weiterhin prühfen

    Inventur_Nul_buchen: boolean;         // Erlauben eine Nul-Buchung beim Inventur.
    PreisbasisVKEinheit: boolean;         // Soll Preis gerundert werden? (Positionen.calcpreis)
    ArBemerkung_zeigen: boolean;          // Soll in Bestellkorb, Vorgang beim Artikel einfügen die Bemerkungen angezeigt werden?
    RefNr_Dubblettenpruefung: boolean;    // Soll Dublettenpruefung für Referenznummer durchgeführt werden?
    AuNummer_in_BEordernummer: boolean;   // Soll beim erstellen einen Bestellung aus Auftragsbestätigung der Auftragsnummer in den Referenznummer der Bestellung eingetragen werden?
    EK_beimfortfuehren_neulesen: boolean; // Beim fortführen in Rechnung EK neu lesen
    ChargenNach_FIFO_zuordnen: boolean;   // Bei manuele fortführen AU->RE chargen können automatisch zugeordnet werden
    NachkommaEinzelnpreis: integer;       // Einstellung für Anzeige der Einzelnpreis in Optima und auf dem ausdruck
    NachkommaMenge: integer;              // Einstellung für Anzeige und Berechnung der Menge
    _VoBemerkungZeigen: Boolean;

    // Einstellungen für Deb-undKreditornummer generieren
    DebNr_Von: integer; // Grenzen für Debitornummern
    DebNr_Bis: integer;
    Deb_Vergabeart: integer; // Wie werden die Nummer vergeben? (höchster +1 oder erste freie)
    KredNr_Von: integer;     // Grenzen für Kreditornummern
    KredNr_Bis: integer;
    Kred_Vergabeart: integer;
    PersonenkontenAuto: boolean; // Sollten Debitornummern automatisch generiert werden?
    KredKontenAuto: boolean;
    Doppelte_LTnr_erlauben: boolean;
    KuDebNr_gleich: boolean;  // Enscheidung, ob Kunden- und Debitornummer gleich sein müssen
    LTKredNr_gleich: boolean; // Enscheidung, ob Lieferanten- und Kreditornummer gleich sein müssen
    Doppelte_Kunr_erlauben: boolean; // Dürfen die doppelte Kunden vergeben werden?
                                     // Das ist nur möglich, wenn:
                                     // 1. Debitor nicht automatisch vergeben (FraKunden/Lieferant)
                                     // 2. Debitor nicht gleich KUnr  (FraKunden/Lieferant)

    Fortfuehren_ULI_RE_erstellen: boolean; // Sollte beim fortführen einen Umlagerunglieferschein
                                          // ein Rechnung erstellt werden?
    Bei_freigabe_MA_ueberschreiben: boolean; // Sollte beim freigeben der Mitrabeiter überschrieben werden.
    GleubigerID: string; // Für Bankkonten -> Lastschrift
    MBWert: boolean; // [tb] 12.11.12  (Mindestbestellwert verwenden)
    MBWertText: string; // [tb] 12.11.12  (Bezeichnung für den Mindestbestellwert)
    MBWarenGrp: integer; // [tb] 23.11.12  (Warengruppe für den Mindestbestellwert zwecks Ermittlung der MwSt)
    ArikelNrGenerator: boolean; // [tb] 06.12.12  (automatisches Generieren von Artikelnummern )
    ArtNrFormat: string; // [tb] 07.12.12  (Format für die Artikelnummer Generierung)
    MassArtikelFormat: string;
    // [tb] 10.12.12  (Format für die Artikelnummer für Masse (Länge/Breite/Höhe usw.) wieviel Vorkomma/Nachkomma Stellen)
    FP_Dir_Vorgang: string;    // [tb] 14.02.12  (Verzeichnis für Fastreport-Vorgänge)
    FP_Dir_Auswertung: string; // [tb] 14.02.12  (Verzeichnis für Fastreport-Auswertungen)
    MahnZAFrist: integer;      // [tb] 17.04.13  (Für Mahnungsdruck das Setzen der Zahlungsfrist in Tagen)

    MitarbeiterTicketsystem: integer; // [mm] 22.08.13  (Mitarbeiter, der für den Versand der Ticket-Mails genutzt wird)
    GruppeKeinKundeTicket: integer;   // [mm] 30.08.13  (Mitarbeitergruppe, die informiert wird, wenn kein Kunde gefunden wird -> Ticketsystem)
    GruppeTicketsystem: integer;      // [mm] 06.01.14  (Mitarbeitergruppe, deren Mitglieder in den ComboBoxen im Ticketsystem angezeigt werden)
    PrioNeueTickets: integer;        // [mm] 06.01.14  (Priorität, die automatisch angelegte Tickets haben sollen)

    Mandat_erinnerungszeit: integer;      // [rh] 26.08.13  (Für Mandat-Wiedervorlage, Wiedervorlage - Zieldatum setzen, in Tagen)
    Mandat_warnungszeit: integer;         // [rh] 19.09.13  (Für Mandaten, Vor wieviele Tagen vor dem Ablauf warnen. in Tagen)
    Mandat_verfuegbar_kriterien: integer; // [rh] 26.08.13  (Für Mandat, Wann muss ein gültiges Mandat verfügbar sein)
    Auto_In_Kopierter_Vorgang: boolean;   // [tb] 24.09.13  (Wenn ein Vorgang kopiert wurde, dann automatisch den kopierten Vorgang aufrufen)
    GBSuche_Alle: string;
    Notificationart: integer;
    Mandat_Wiedervorlage_erstellen: boolean; // [rh] 14.10.13  (Für Mandat, wiedervorlagen beim Drucken, Mailen,... erstellen?)
    Vorgang_Portodeaktivieren: boolean;
    Notificationzeit: integer;
    KundeSofortFreigeben: boolean;
    Landkuerzel_fuerUSTID: string;
    Ticketabrechnen: boolean;
    VO_Suche_Status: integer;       // Voreistellung für Vorgangsuche
    Ticket_Kumatchzeigen: boolean;  // Soll der Kundenmatch in Baum  auch angezeigt werden
    Ticket_KUmatch_laenge: integer; // Die länge der angezeigten Match
    AuINBE_Bestandpruefen: boolean; // [rh] 11.09.14 Beim Erstellen einen Bestellung aus Auftrag, wenn True -> nur was felt bestellen
    _TransportVers_Proz: real;
    _TransportVers_Verwenden: integer;
    _TransportVers_Text: string;
    _TransportVers_InPos: boolean;
    _Bestellung_Autom_Freigeben: boolean;
    _Farbe_Freigabe_H: integer;
    _Farbe_Freigabe_T: integer;

    _Eingangsbelegformat : string;
    _Eingangsbeleg_ImportDir : string;
    _Eingangsbeleg_ExportDir : string;
    _Vorgang_ArchivDir  : string;    //Verzeichnis für archivieren der vorgängen(PDF) Definiert in Druckablauf
    _Rabatt2Anzeigen: Boolean;
    _Reisenummerformat : string;
    fLokalpfad: string;

    FibuHost: string;
    FibuUser: string;
    FibuPass: string;
    AddisonUser: string;
    AddisonPass: string;

    DruckdatenFTP: string;
    DruckdatenFTPUser: string;
    DruckdatenFTPPass: string;
    DruckdatenBaseUrl: string;

    NullPosArray: array [1 .. 21] of boolean;

    Update: boolean;

    AktMandantID: integer;
    _Kundennummer : integer;
    _RechnungPerMail: Boolean;
    _RemotePfad: string;
    fAspellStandardPath: string;

    procedure setEasylog(value: boolean);
    function getEasyLog: boolean;

    procedure setVersandpause(value: boolean);
    function getVersandpause: boolean;

    procedure LoadFromQuery(aQuery: TIBQuery);
    procedure saveToQuery;
    procedure setRabatt2Anzeigen(const Value: Boolean);
    procedure setRechnungPerMail(const Value: Boolean);
    function getRemotePfad: string;
    function getAspellStandardPath: string;
    procedure setReisenummerformat(const Value: string);
    function getLokalPfad: string;
    function getLokalHunspellPfad: string;
    function getRemoteHunspellPfad: string;

  public

    LockProviderClient: TLockProviderClient;

    ServerEinstellungen: TMultiValues;
    SendMail: TNfsSendMail;
    Geschaeftsbereich: pointer;

    constructor create(aOwner: TComponent; aIBT: TIBTransaction; aAktuellerMandantID: integer); reintroduce; overload;
    constructor create(aOwner: TComponent; aIBT: TIBTransaction; aAktuellerMandantID: integer; aServer: boolean); reintroduce; overload;
    destructor Destroy; override;

    class function getInstance(): TStammdaten;

    procedure saveToDB;

    function getLagerhelper: pointer;
    procedure setLagerhelper(alagerhelper: pointer);

    function isNullPos(aArt: integer): boolean;
    function getAppDataPfad(hWindow: HWND; aDatei: string): string;
    procedure Sync_Woerterbuch;
    procedure Kopiere_Woerterbuch_nach_Lokal;
    procedure ErsetzeAlteMitNeuerDatei(aQuellDatei, aZielDatei: string);

    procedure SetupNullPosArray;
    procedure VerzeichnisproJahr_anlegen(const aDir : string);

    procedure SetMandant(aMandantID: integer);
    function getAktMandantID: integer;
    procedure setKundennummer(awert : integer);

    procedure ActivateLogging(aLabel: TLabel; aMemo: TMemo; aLogLevel: byte); overload;
    procedure ActivateLogging(aFileName: string; aLabel: TLabel; aMemo: TMemo; aLogLevel: byte); overload;

    procedure setBei_freigabe_MA_ueberschreiben(aWert: boolean);
    procedure setFortfuehren_ULI_RE_erstellen(aWert: boolean);
    procedure setChargenNach_FIFO_zuordnen(aWert: boolean);
    procedure setVoSuche_Anzahltage(aWert: integer);
    procedure setArBemerkung_zeigen(aWert: boolean);
    procedure setVoBemerkungZeigen(aWert: Boolean);
    procedure setDoppelte_Kunr_erlauben(aWert: boolean);
    procedure setDoppelte_LTnr_erlauben(aWert: boolean);
    procedure setDebNr_Von(aWert: integer);
    procedure setDebNr_Bis(aWert: integer);
    procedure setDeb_Vergabeart(aWert: integer);
    procedure setKredNr_Von(aWert: integer);
    procedure setKredNr_Bis(aWert: integer);
    procedure setKred_Vergabeart(aWert: integer);
    procedure setSNFensternichtzeigen(aWert: boolean);
    procedure setGENR_Auswahl(aWert: integer);
    procedure setFB_POP3_Server(aWert: string);
    procedure setFB_POP3_Benutzer(aWert: string);
    procedure setFB_POP3_Passwort(aWert: string);
    procedure setFB_POP3_Mail(aWert: string);
    procedure setMinBestandTage(aMinBestandTage: integer);
    procedure setMinBestandGrenze(aMinBestandGrenze: real);
    procedure setDPAbsender(const aDPAbsender: string);
    procedure setDPAbsenderAbk(const aDPAbsenderAbk: string);
    procedure setDPBank(const aDPBank: string);
    procedure setDPBLZ(const aDPBLZ: string);
    procedure setDPErmaessigung(aDPErmaessigung: real);
    procedure setDPIdentCode(const aDPIdentCode: string);
    procedure setDPKontoNr(const aDPKontoNr: string);
    procedure setDPNNAufschlag(aDPNNAufschlag: real);
    procedure setDPKennung(const aDPKennung: string);
    procedure setDPKundenNr(const aDPKundenNr: string);
    procedure setDPVorausVerfahren(const aDPVorausVerfahren: string);
    procedure setDPKennung_inter(const aWert: string);
    procedure setDynamischeID(aDynamischeID: longint);
    procedure setEasyLogPfad(const aEasyLogPfad: string);
    procedure setFarbeEnde(aFarbeEnde: TColor);
    procedure setFarbeStart(aFarbeStart: TColor);
    procedure setFaxPfad(aFaxPfad: string);
    procedure setFibuMitarbeiter(aFibuMitarbeiter: string);
    procedure setImageDir(aImageDir: string);
    procedure setDokuDir(aDokuDir: string);
    procedure setInkassoMahnstufe(aInkassomahnstufe: integer);
    procedure setInkassoTage(aInkassotage: integer);
    procedure setInkasseAbstand(aInkassoAbstand: integer);
    procedure setJournalPfad(const aJournalPfad: string);
    procedure setLeergutID(aLeergutID: longint);
    procedure setLockServerIP(const aLockServerIP: string);
    procedure setMahngebuehrStufe1(aMahngebuehr: real);
    procedure setMahngebuehrStufe2(aMahngebuehr: real);
    procedure setMahngebuehrStufe3(aMahngebuehr: real);
    procedure setMahngebuehrStufe4(aMahngebuehr: real);
    procedure setMahnzins(aMahnZins: real);
    procedure setMandantName(aMandantName: string);
    procedure setNullPosition(aNullPosition: longint);
    procedure setNummernFormat(aNummernFormat: string);
    procedure setRecoveryPasswort(aRecoveryPasswort: string);
    procedure setReportPfad(aReportPfad: string);
    procedure setRMAMitarbeiter(aRMAMitarbeiter: string);
    procedure setSMHost(aSMHost: string);
    procedure setSMFromAdress(aSMFromAdress: string);
    procedure setSMFromName(aSMFromName: string);
    procedure setSMUser(aSMUser: string);
    procedure setSMPass(aSMPass: string);
    procedure setStdVersand(aStdVersand: longint);
    procedure setStdZahlart(aStdZahlart: longint);
    procedure setStdBriefanrede(aStdBriefanrede: string);
    procedure setTageTeillieferung(aTageTeillieferung: integer);
    procedure setZNettoTage(aZNettoTage: integer);
    procedure setZSkonto(aZSkonto: real);
    procedure setZSkontoTage(aZSkontoTage: integer);
    procedure setKontoDirektfakturaKostenInland(aKontoDirektfakturaKostenInland: longint);
    procedure setKontoDirektfakturaKostenAusland(aKontoDirektfakturaKostenAusland: longint);
    procedure setKontoDirektfakturaKostenEUAusland(aKontoDirektfakturaKostenEUAusland: longint);
    procedure setKontoDirektfakturaKostenEUAuslandUST(aKontoDirektfakturaKostenEUAuslandUST: longint);
    procedure setKontoDirektfakturaErloesInland(aKontoDirektfakturaErloesInland: longint);
    procedure setKontoDirektfakturaErloesAusland(aKontoDirektfakturaErloesAusland: longint);
    procedure setKontoDirektfakturaErloesEUAusland(aKontoDirektfakturaErloesEUAusland: longint);
    procedure setKontoDirektfakturaErloesEUAuslandUST(aKontoDirektfakturaErloesEUAuslandUST: longint);
    procedure setRMA_GUBankZahlart(aZahlart: TZahlungsart);
    procedure setRMA_GUKontoZahlart(aZahlart: TZahlungsart);
    procedure setUebergabeliste(aListe: boolean);
    procedure setAnfahrtsart(aAnfahrtsart: integer);
    procedure setPauschalbetrag_kennziffer(aPauschalbetrag_kennziffer: integer);
    procedure setEntfernung_kennziffer(aEntfernung_kennziffer: integer);
    procedure setAnfahrtszeit_kennziffer(aAnfahrtszeit_kennziffer: integer);
    procedure setAbrechnungszeit(aAbrechnungszeit: integer);
    procedure setAbrechnungszeitFK(aAbrechnungszeitFK: boolean);
    procedure setPlanetShop(aPlanet: boolean);
    procedure setMahngrenze(aMahngrenze: real);
    procedure setChargeMenge(aWert: boolean);
    procedure setChargeEnde(aWert: string);
    procedure setScanMode(aWert: string);
    procedure setScanOK(aWert: string);
    procedure setScanAbbr(const aWert: string);
    procedure setStdKUKreditLimit(aWert: double);
    procedure setStdLTKreditLimit(aWert: double);
    procedure setProvDatum(aWert: byte);
    procedure setKondNetto(aWert: string);
    procedure setKondNettoTage(aWert: string);
    procedure setKondSkontoTage(aWert: string);
    procedure setKondSkonto(aWert: string);
    procedure setREKondNetto(aWert: string);
    procedure setREKondNettoTage(aWert: string);
    procedure setREKondSkontoTage(aWert: string);
    procedure setREKondSkonto(aWert: string);
    procedure setVersandMo(aWert: boolean);
    procedure setVersandDi(aWert: boolean);
    procedure setVersandMi(aWert: boolean);
    procedure setVersandDo(aWert: boolean);
    procedure setVersandFr(aWert: boolean);
    procedure setVersandSa(aWert: boolean);
    procedure setVersandSo(aWert: boolean);
    procedure setFaxFrKu(aWert: boolean);
    procedure setFaxVersKu(aWert: boolean);
    procedure setFaxVersVe(aWert: boolean);
    procedure setMailFrKu(aWert: boolean);
    procedure setMailVersKu(aWert: boolean);
    procedure setFaxTeillieferung(aWert: integer);
    procedure setDruckFrKu(aWert: boolean);
    procedure setSNZwingend_Raus(aWert: boolean);
    procedure setSNZwingend_Raus_WE(aWert: boolean);
    procedure setSNZwingend(aWert: boolean);
    procedure setSNNeuBeiWE(aWert: boolean);
    procedure setSNScanBeiVersand(aWert: boolean);
    procedure setKeinePreisaenderung(aWert: boolean);
    procedure setLogMemo(aMemo: TMemo);
    procedure setNavExportDir(aWert: string);
    procedure setNavImportDir(aWert: string);
    procedure setNavExportBack(aWert: string);
    procedure setNavImportBack(aWert: string);
    procedure setAnMemoFirma(aFormat: string);
    procedure setAnMemoPrivat(aFormat: string);
    procedure setAnMemoFirmaPf(aFormat: string);
    procedure setAnMemoPrivatPf(aFormat: string);
    procedure setAnMemoFirmaLI(aFormat: string);
    procedure setAnMemoPrivatLI(const aFormat: string);
    procedure setILN(aWert: string);
    procedure setEDIDir(aWert: string);
    procedure setEDIImportDir(aWert: string);
    procedure setEDIName(aWert: string);
    procedure setEDIMitarbeiterID(aWert: integer);
    procedure setEDILager(aWert: integer);
    procedure setEDIVersandfenster(aWert: integer);
    procedure setEDIGeschaeftsbereich(aWert: integer);
    procedure setLIAutoVersand(aWert: boolean);
    procedure setInkassoAbfrage(aWert: boolean);
    procedure setPreisKGruppe(aWert: integer);
    procedure setEinPreisFuerAlle(aWert: boolean);
    procedure setKommscheinBeiFreigabe(aWert: boolean); overload;
    procedure setKommscheinBeiDruck;
    procedure setKommscheinBeiFreigabe; overload;
    procedure setVOSachbearbeiterUeberschreiben(aWert: boolean);
    procedure setNullEuroWarnung(aWert: boolean);
    procedure setKontorREMemo(aWert: boolean);
    procedure setSRTextImmer(aWert: boolean);
    procedure setVoArtInGrid(aWert: boolean);
    procedure setPersonenkontenAuto(aWert: boolean);
    procedure setKredKontenAuto(aWert: boolean);
    procedure setEigeneOPVerwaltung(aWert: boolean);
    procedure setStdTeillieferVerhalten(aWert: integer);
    procedure setVerbuchenNachTagen(aWert: integer);
    procedure setKundenPLZVertreter(aWert: boolean);
    procedure setRabattUeberschreiben(aWert: boolean);
    procedure setUstID(aWert: string);
    procedure setNachkommaDruck(aWert: integer);
    procedure setDruckerAuswahlSynchron(aWert: boolean);
    procedure setaktGB(aWert: integer);
    procedure setBudgetKG(aWert: integer);
    procedure setKuSucheErweitert(aWert: boolean);
    procedure setServer(aWert: boolean);
    procedure setWELager(aWert: integer);
    procedure setWEPlatz(aWert: integer);
    procedure setCheckSperre(aWert: boolean);
    procedure setDatevKontenManipulieren(aWert: boolean);
    procedure setWarenGrP(aWert: integer);
    procedure setDruckablaufHelper(aWert: TDruckablaufHelper);
    procedure setWiedervorlageAnzeigen(aWert: integer);
    procedure setKundenformulare(aFormular: integer; aWert: boolean);
    procedure setBilderAlle(aWert: boolean);
    procedure setServiceGruppieren(aWert: boolean);
    procedure setMySqlLowerCase(aWert: boolean);
    procedure setMySqlUtf8(aWert: boolean);
    procedure setUseVorgangLiefertermin(aWert: boolean);

    procedure setMwST_voll_1(aWert: real);
    procedure setMwST_voll_2(aWert: real);
    procedure setMwST_vermindert_1(aWert: real);
    procedure setMwST_vermindert_2(aWert: real);
    procedure setMwST_Stichtag(aWert: TDateTime);

    procedure setVerdichtungskontoDebitor(aWert: integer);
    procedure setVerdichtungskontoKreditor(aWert: integer);

    procedure setMitarbeiter(aMitarbeiter: pointer); // Wird in u_anmeldung gesetzt

    procedure setDPDRoutenVersion(aVersion: string);
    procedure setDPDKundennummer(aKundennummer: string);
    procedure setDPDDepotkennung(aKennung: string);
    procedure setDPDAbsender(aAbsender: string);
    procedure setDPDKontoNr(aKontoNr: string);
    procedure setDPDNNAufschlag(aAufschlag: double);
    procedure setDPDBank(const aBank: string);
    procedure setDPDBlz(aBLZ: string);
    procedure setDPDDepotAdresse(aDepotAdresse: string);
    procedure setDPDDepotTel(aDepotTel: string);
    procedure setDPDDepotFax(aDepotFax: string);
    procedure setRiskcheckCount(aCount: integer);
    procedure setKuSperreInkasso(aWert: boolean);
    procedure setPorto_Skontierbar(aWert: boolean);
    procedure setNVEErfassen(aWert: boolean);
    procedure setUmsatzprovision(aWert: boolean);
    procedure setWaehrungszeichen(aWert: string);
    procedure setSkontoVonProvAbziehen(aWert: boolean);
    procedure setDruckParameter(aParams: string);

    procedure setAU_Bezugsdaten(aParams: string);
    procedure setAU_Beschreibung(aParams: string);
    procedure setAU_Bericht(aParams: string);
    procedure setAU_Art(aWert: integer);
    procedure setAU_Unterart(aWert: integer);
    procedure setAU_Anforderung(aWert: integer);

    procedure setVOSperreBeiGedruckt(aWert: boolean);
    procedure setErweiterteAdressdaten(aWert: boolean);
    procedure setDefaultLiefertage(aWert: integer);
    procedure setUebersichtAnsprechpartner(aWert: boolean);
    procedure setKW_Datum(aWert: integer);
    procedure setTicketArtikel(aArtikelID: integer);
    procedure setVKPreiseAnzeigen(aWert: boolean);
    procedure setVKPreiseAnzeigenKG(aWert: integer);
    procedure setResMengenSofort(aWert: boolean);
    procedure setServiceVersandart(aVersandart: pointer); overload;
    procedure setServiceVersandart(aVersandart: integer); overload;
    procedure setZeitfensterIgnorieren(aWert: boolean);
    procedure setKuSperrstatus(aWert: integer);
    procedure setNachkommaPos(aWert: integer);
    procedure setVorgangNettoSumme(aWert: boolean);
    procedure setSammelRe_Porto(aWert: boolean);
    procedure setFreiText(aWert: string);
    procedure setArtikelExternVKAlle(aWert: boolean);
    procedure setZertifikat(aWert: boolean);
    procedure setKeinRabattBeiSA(aWert: boolean);
    procedure setVo_status_beimFortfuehren(aWert: integer);
    procedure setVo_status_beimKopieren(aWert: integer);
    procedure setVo_status_inRE_Fortfuehren(aWert: integer);
    procedure setVo_status_inER_Fortfuehren(aWert: integer);
    procedure setRechnungGetrennt(aWert: boolean);
    procedure setKeinRabattBeiSpezPreis(aWert: boolean);
    procedure setChargenverzeichnis(aWert: string);
    procedure setFaxversand(aWert: TDateTime);
    procedure setNachkommaEinzelnpreis(aWert: integer);
    procedure setNachkommaMenge(aWert: integer);

    procedure setUPS_KUNR(aWert: string);
    procedure setUPS_Warenbeschreibung(aWert: string);
    procedure setUPS_Verzeichnis(const aWert: string);
    procedure setUPS_Telefon(aWert: string);
    procedure setZahlungBeiOPNrNull(aWert: boolean);
    procedure setkarenzZuFaelligkeit(aWert: boolean);
    procedure setFaxsofort(aWert: boolean);
    procedure setLief_nichtfortfueren(aWert: boolean);
    procedure setGeraeteArtikelnr(aWert: boolean);
    procedure setServiceLieferschein(aWert: boolean);
    procedure setPicklistenDrucken(aWert: boolean);
    procedure setChargenInPackliste(aWert: boolean);
    procedure setKU_Notizen(aWert: boolean);
    procedure setLT_Notizen(aWert: boolean);
    procedure setGeraetAutomatisch(aWert: integer);
    procedure setDruckeLangText(aWert: boolean);
    procedure setDruckeLangTextKreditor(aWert: boolean);
    procedure setVOVersandBisTage(aWert: integer);
    procedure setKuDebNr_gleich(aWert: boolean);
    procedure setLTKredNr_gleich(aWert: boolean);
    procedure setVersand_allePos(aWert: boolean);
    procedure setProvDecksatzbeachten(aWert: boolean);
    procedure setVoSuche_vondatum(aWert: TDateTime);
    procedure setFibuHost(aWert: string);
    procedure setFibuUser(const aWert: string);
    procedure setFibuPass(const aWert: string);
    procedure setDruckdatenFTP(aWert: string);
    procedure setDruckdatenFTPUser(aWert: string);
    procedure setDruckdatenFTPPass(const aWert: string);
    procedure setDruckdatenBaseUrl(aWert: string);
    procedure setVersandFrei(aWert: boolean);
    procedure setMahnzinsen_immerberechnen(aWert: boolean);
    procedure setArt_fuer_neuen_vorgang(aWert: integer);
    procedure setArNr_doppelt_pruefen(aWert: boolean);
    procedure setInventur_Nul_buchen(aWert: boolean);
    procedure setPreisbasisVKEinheit(aWert: boolean);
    procedure setRefNr_Dubblettenpruefung(aWert: boolean);
    procedure setAuNummer_in_BEordernummer(aWert: boolean);
    procedure setEK_beimfortfuehren_neulesen(aWert: boolean);
    procedure setAddisonUser(aWert: string);
    procedure setAddisonPass(aWert: string);
    procedure setGleubigerID(aWert: string);
    procedure setMBWert(aWert: boolean);
    procedure setMBWertText(aWert: string);
    procedure setMBWarenGrp(aWert: integer);
    procedure setArikelNrGenerator(aWert: boolean);
    procedure setArtNrFormat(aWert: string);
    procedure setMassArtikelFormat(aWert: string);
    procedure setFP_Dir_Vorgang(aWert: string);
    procedure setFP_Dir_Auswertung(aWert: string);
    procedure setMahnZAFrist(aWert: integer);
    procedure setMitarbeiterTicketsystem(aWert: integer);
    procedure setGruppeKeinKundeTicket(aWert: integer);
    procedure setGruppeTicketsystem(aWert: integer);
    procedure setPrioNeueTickets(aWert: integer);
    procedure setMandat_erinnerungszeit(aWert: integer);
    procedure setMandat_warnungszeit(aWert: integer);
    procedure setMandat_verfuegbar_kriterien(aWert: integer);
    procedure setAuto_In_Kopierter_Vorgang(aWert: boolean);
    procedure setGBSucheAlle_Artikel(aWert: boolean);
    procedure setGBSucheAlle_Vorgang(aWert: boolean);
    procedure setGBSucheAlle_Kunde(aWert: boolean);
    procedure setGBSucheAlle_Lieferant(aWert: boolean);
    procedure setNotificatonArt(aWert: integer);
    procedure setMandat_Wiedervorlage_erstellen(aWert: boolean);
    procedure setVorgang_Portodeaktivieren(aWert: boolean);
    procedure setNotificationzeit(aWert: integer);
    procedure setKundeSofortFreigeben(aWert: boolean);
    procedure setLandkuerzel_fuerUSTID(aWert: string);
    procedure setTicketabrechnen(aWert: boolean);
    procedure setVO_Suche_Status(aWert: integer);
    procedure setTicket_Kumatchzeigen(aWert: boolean);
    procedure setTicket_KUmatch_laenge(aWert: integer);
    procedure setAuINBE_Bestandpruefen(aWert: boolean);
    procedure setTransportVersProz(aWert: real);
    procedure setTransportVersVerwenden(aWert: integer);
    procedure setTransportVersInPos(aWert: boolean);
    procedure setKommFormular(aFormularID: integer);
    procedure setBestellung_autom_Freigeben(aValue: boolean);
    procedure setFarbe_Freigabe_H(aValue: integer);
    procedure setFarbe_Freigabe_T(aValue: integer);
    procedure setEingangsbelegformat(awert : string);
    procedure setEingangsbeleg_ImportDir(awert : string);
    procedure setEingangsbeleg_ExportDir(awert : string);
    procedure setVorgang_ArchivDir(awert : string);

    property isEasylog: boolean read getEasyLog write setEasylog;
    property isVersandpause: boolean read getVersandpause write setVersandpause;

    function getAuINBE_Bestandpruefen: boolean;
    function getTicket_KUmatch_laenge: integer;
    function getTicket_Kumatchzeigen: boolean;
    function getVO_Suche_Status: integer;
    function getTicketabrechnen: boolean;
    function getLandkuerzel_fuerUSTID: string;
    function getVorgang_Portodeaktivieren: boolean;
    function getMandat_Wiedervorlage_erstellen: boolean;
    function getMandat_verfuegbar_kriterien: integer;
    function getMandat_warnungszeit: integer;
    function getMandat_erinnerungszeit: integer;
    function getGleubigerID: string;
    function getBei_freigabe_MA_ueberschreiben: boolean;
    function getFortfuehren_ULI_RE_erstellen: boolean;
    function getChargenNach_FIFO_zuordnen: boolean;
    function getEK_beimfortfuehren_neulesen: boolean;
    function getAuNummer_in_BEordernummer: boolean;
    function getRefNr_Dubblettenpruefung: boolean;
    function getVoSuche_Anzahltage: integer;
    function getArBemerkung_zeigen: boolean;
    function getPreisbasisVKEinheit: boolean;
    function getInventur_Nul_buchen: boolean;
    function getDoppelte_Kunr_erlauben: boolean;
    function getDoppelte_LTnr_erlauben: boolean;
    function getDebNr_Von: integer;
    function getDebNr_Bis: integer;
    function getDeb_Vergabeart: integer;
    function getKredNr_Von: integer;
    function getKredNr_Bis: integer;
    function getKred_Vergabeart: integer;
    function getArNr_doppelt_pruefen: boolean;
    function getArt_fuer_neuen_vorgang: integer;
    function getMahnzinsen_immerberechnen: boolean;
    function getVoSuche_vondatum: TDateTime;
    function getProvDecksatzbeachten: boolean;
    function getVersand_allePos: boolean;
    function getSNFensternichtzeigen: boolean;
    function getKuDebNr_gleich: boolean;
    function getLTKredNr_gleich: boolean;
    function getVOVersandBisTage: integer;
    function getGeraetAutomatisch: integer;
    function getLief_nichtfortfueren: boolean;
    function getFaxsofort: boolean;
    function getFaxversand: TDateTime;
    function getChargenverzeichnis: string;
    function getKeinRabattBeiSpezPreis: boolean;
    function getGENR_Auswahl: integer;
    function getVo_status_inER_Fortfuehren: integer;
    function getVo_status_inRE_Fortfuehren: integer;
    function getVo_status_beimFortfuehren: integer;
    function getVo_status_beimKopieren: integer;
    function getFreiText: string;
    function getKuSperrstatus: integer;
    function getMinBestandTage: integer;
    function getMinBestandGrenze: real;
    function getRelease: string;
    function getDPAbsender: string;
    function getDPAbsenderAbk: string;
    function getDPBank: string;
    function getDPBLZ: string;
    function getDPErmaessigung: real;
    function getDPIdentCode: string;
    function getDPKontoNr: string;
    function getDPNNAufschlag: real;
    function getDPKennung: string;
    function getDPKundenNr: string;
    function getDPVorausVerfahren: string;
    function getDPKennung_inter: string;
    function getDynamischeID: longint;
    function getEasyLogPfad: string;
    function getFarbeEnde: TColor;
    function getFarbeStart: TColor;
    function getFaxPfad: string;
    function getFibuMitarbeiter: string;
    function getImageDir: string;
    function getDokuDir: string;
    function getDokuDirMail: string;
    function getDokuDirMailSend: string;
    function getInkassoMahnstufe: integer;
    function getInkassoTage: integer;
    function getInkassoAbstand: integer;
    function getJournalPfad: string;
    function getLeergutID: longint;
    function getLockServerIP: string;
    function getMahngebuehrStufe1: real;
    function getMahngebuehrStufe2: real;
    function getMahngebuehrStufe3: real;
    function getMahngebuehrStufe4: real;
    function getMahnzins: real;
    function getMandantName: string;
    function getNullPosition: longint;
    function getNummernFormat: string;
    function getRecoveryPasswort: string;
    function getReportPfad: string;
    function isReportPfadUmgeleitet: boolean;
    function getRMAMitarbeiter: string;
    function getSMHost: string;
    function getSMFromAdress: string;
    function getSMFromName: string;
    function getSMUser: string;
    function getSMPass: string;
    function getStdVersand: longint;
    function getStdZahlart: longint;
    function getStdBriefanrede: string;
    function getTageTeillieferung: integer;
    function getZNettoTage: integer;
    function getZSkonto: real;
    function getZSkontoTage: integer;
    function getKontoDirektfakturaKostenInland: longint;
    function getKontoDirektfakturaKostenAusland: longint;
    function getKontoDirektfakturaKostenEUAusland: longint;
    function getKontoDirektfakturaKostenEUAuslandUST: longint;
    function getKontoDirektfakturaErloesInland: longint;
    function getKontoDirektfakturaErloesAusland: longint;
    function getKontoDirektfakturaErloesEUAusland: longint;
    function getKontoDirektfakturaErloesEUAuslandUST: longint;
    function getRMA_GUBankZahlart: TZahlungsart;
    function getRMA_GUKontoZahlart: TZahlungsart;
    function getUebergabeliste: boolean;
    function getAnfahrtsart: integer;
    function getPauschal_kennziffer: integer;
    function getEntfernung_kennziffer: integer;
    function getAnfahrtszeit_kennziffer: integer;
    function getAbrechnungszeit: integer;
    function getAbrechnungszeitFK: boolean;
    function getPlanetShop: boolean;
    function getMahngrenze: real;
    function getChargeMenge: boolean;
    function getChargeEnde: string;
    function getScanMode: string;
    function getScanOK: string;
    function getScanAbbr: string;
    function getKontoDirektfaktura(aErloese: boolean; aUstID: string; aAusland: boolean; aEUAusland: boolean): longint;
    function getStdKUKreditLimit: double;
    function getStdLTKreditLimit: double;
    function getProvDatum: byte;
    function getKondNetto: string;
    function getKondNettoTage: string;
    function getKondSkontoTage: string;
    function getKondSkonto: string;
    function getREKondNetto: string;
    function getREKondNettoTage: string;
    function getREKondSkontoTage: string;
    function getREKondSkonto: string;
    function getVersandMo: boolean;
    function getVersandDi: boolean;
    function getVersandMi: boolean;
    function getVersandDo: boolean;
    function getVersandFr: boolean;
    function getVersandSa: boolean;
    function getVersandSo: boolean;
    function getFaxFrKu: boolean;
    function getFaxVersKu: boolean;
    function getFaxVersVe: boolean;
    function getMailFrKu: boolean;
    function getMailVersKu: boolean;
    function getFaxTeillieferung: integer;
    function getDruckFrKu: boolean;
    function getKeinePreisaenderung: boolean;
    function getLogMemo: TMemo;
    function getNavImportDir: string;
    function getNavExportDir: string;
    function getNavImportBack: string;
    function getNavExportBack: string;
    function getILN: string;
    function getEDIDir: string;
    function getEDIImportDir: string;
    function getEDIName: string;
    function getEDIMitarbeiter: pointer;
    function getEDIMitarbeiterID: integer;
    function getEDILager: integer;
    function getEDIVersandfenster: integer;
    function getEDIGeschaeftsbereich: integer;
    function getAnMemoPrivat: string;
    function getAnMemoFirma: string;
    function getAnMemoFirmaPf: string;
    function getAnMemoPrivatPf: string;
    function getAnMemoPrivatLI: string;
    function getAnMemoFirmaLI: string;
    function getLIAutoVersand: boolean;
    function getInkassoAbfrage: boolean;
    function getPreisKGruppe: integer;
    function getEinPreisFuerAlle: boolean;
    function getMinDatum: TDateTime;
    function getMaxDatum: TDateTime;
    function getKontorREMemo: boolean;
    function getSRTextImmer: boolean;
    function getVoArtInGrid: boolean;
    function getPersonenkontenAuto: boolean;
    function getKredKontenAuto: boolean;
    function getEigeneOPVerwaltung: boolean;
    function getStdTeillieferVerhalten: integer;
    function getVerbuchenNachTagen: integer;
    function getKundenPLZVertreter: boolean;
    function getRabattUeberschreiben: boolean;
    function getUstID: string;
    function getNachkommaDruck: integer;
    function getNachkommaEinzelnpreis: integer;
    function getNachkommaMenge: integer;
//    function getDruckobjekt: TDrucken; overload;
//    function getDruckobjekt(aLbl: TLabel): TDrucken; overload;
    function getStdSprache: integer;
    function getTransaction: TIBTransaction;
    function getAktGB: integer;
    function getVOSperreBeiGedruckt: boolean;
    function getDruckerAuswahlSynchron: boolean;
    function getBudgetKG: integer;
    function isKuSucheErweitert: boolean;
    function isServer: boolean;
    function getLog: TLogging;
    function getWELager: integer;
    function getWEPlatz: integer;
    function getPorto_Skontierbar: boolean;
    function getCheckSperre: boolean;
    function getNVEErfassen: boolean;
    function getDatevKontenManipulieren: boolean;
    function isUmsatzProvision: boolean;
    function getWaehrungszeichen: string;
    function getDruckablaufHelper: TDruckablaufHelper;
    function getKundenformulare(aFormular: integer): boolean;
    function getDefaultLiefertage: integer;
    function getUebersichtAnsprechpartner: boolean;
    function getKW_Datum: integer;
    function getVorgangNettoSumme: boolean;
    function getBilderAlle: boolean;
    function getDruckeLangText: boolean;
    function getDruckeLangTextKreditor: boolean;
    function getMySqlLowerCase: boolean;
    function getMySqlUtf8: boolean;
    function getUseVorgangLiefertermin: boolean;

    function getVerdichtungskontoDebitor: integer;
    function getVerdichtungskontoKreditor: integer;
    function getAU_Bezugsdaten: string;
    function getAU_Beschreibung: string;
    function getAU_Bericht: string;
    function getAU_Art: integer;
    function getAU_Unterart: integer;
    function getAU_Anforderung: integer;
    function getMBWert: boolean;
    function getMBWertText: string;
    function getMBWarenGrp: integer;

    function getErweiterteAdressdaten: boolean;

    function getMitarbeiter: pointer;

    function getSNZwingend_Raus_WE: boolean;
    function getSNZwingend_Raus: boolean;
    function getSNZwingend: boolean;
    function getSNNeuBeiWE: boolean;
    function getSNScanBeiVersand: boolean;

    function getSavePasswords: boolean;
    procedure setSavePasswords(aValue: boolean);
    function getDruckePBS: boolean;
    procedure SetDruckePBS(aValue: boolean);
    function getKommFormular: integer;

    function getVOSachbearbeiterUeberschreiben: boolean;
    function getKommscheinBeiFreigabe: boolean;
    function getKommscheinBeiDruck: boolean;
    function getNullEuroWarnung: boolean;
    function getSkontoVonProvAbziehen: boolean;
    function getWiedervorlageAnzeigen: integer;
    function getVKPreiseAnzeigenKG: integer;

    function getWarenGrP: integer;

    function getMwST_voll_1: real;
    function getMwST_voll_2: real;
    function getMwST_vermindert_1: real;
    function getMwST_vermindert_2: real;
    function getMwST_Stichtag: TDateTime;

    function getDPDAbsender: string;
    function getDPDDepotkennung: string;
    function getDPDKontoNr: string;
    function getDPDKundennummer: string;
    function getDPDNNAufschlag: double;
    function getDPDRoutenVersion: string;
    function getDPDBank: string;
    function getDPDBlz: string;
    function getDPDDepotAdresse: string;
    function getDPDDepotTel: string;
    function getDPDDepotFax: string;

    function getFB_POP3_Server: string;
    function getFB_POP3_Benutzer: string;
    function getFB_POP3_Passwort: string;
    function getFB_POP3_Mail: string;

    function getRiskCheckCount: integer;
    function isSperreInkasso: boolean;
    function getDruckParameter: string;
    function getTicketArtikel: integer;
    function getMwST_voll(aDatum: TDateTime): real;
    function getMwST_Vermindert(aDatum: TDateTime): real;

    function isVKPreiseAnzeigen: boolean;
    function isVKPreiseAnzeigenKG: integer;
    function isResMengenSofort: boolean;
    function getServiceVersandart: pointer;
    function getServiceVersandartID: integer;
    function getZeitfensterIgnorieren: boolean;
    function getNachkommaPos: integer;
    function getSammelRe_Porto: boolean;
    function getArtikelExternVKAlle: boolean;
    function getZertifikat: boolean;
//    function getVorgangsspalten: TBitmuster;
    function getKeinRabattbeiSA: boolean;
    function isRechnungGetrennt: boolean;
    function getGeraeteArtikelnr: boolean;

    function getUPS_KUNR: string;
    function getUPS_Warenbeschreibung: string;
    function getUPS_Verzeichnis: string;
    function getUPS_Telefon: string;
    function getZahlungBeiOPNrNull: boolean;
    function getkarenzZuFaelligkeit: boolean;
    function getKundensuchspalten: TBitmuster;
    function getServiceGruppieren: boolean;
    function getServiceLieferschein: boolean;
    function getPicklistenDrucken: boolean;
    function getChargenInPackliste: boolean;
    function getKU_Notizen: boolean;
    function getLT_Notizen: boolean;
    function getFibuHost: string;
    function getFibuUser: string;
    function getFibuPass: string;
    function getDruckdatenFTP: string;
    function getDruckdatenFTPUser: string;
    function getDruckdatenFTPPass: string;
    function getDruckdatenBaseUrl: string;
    function getVersandFrei: boolean;
    function getAddisonUser: string;
    function getAddisonPass: string;
    function getArtikelNrGenerator: boolean;
    function getArtNrFormat: string;
    function getMassArtikelFormat: string;
    function getFP_Dir_Vorgang: string;
    function getFP_Dir_Auswertung: string;
    function getMahnZAFrist: integer;
    function getMitarbeiterTicketsystem: integer;
    function getGruppeTicketsystem: integer;
    function getPrioNeueTickets: integer;
    function getGruppeKeinKundeTicket: integer;
    function getAuto_In_Kopierter_Vorgang: boolean;
    function getGBSucheAlle_Artikel: boolean;
    function getGBSucheAlle_Vorgang: boolean;
    function getGBSucheAlle_Kunde: boolean;
    function getGBSucheAlle_Lieferant: boolean;
    function getNotificationart: integer;
    function getNotificationzeit: integer;
    function getKundeSofortFreigeben: boolean;
    function getSperrlagerId(aGB: Integer; aTrans: TIBTransaction): Integer;
    function QS_Verwenden(aGB: Integer; aTrans: TIBTransaction): Boolean;
    function getHauptlagerId(aGB: Integer; aTrans: TIBTransaction): Integer;
    function getHauptlager(aGB: Integer; aTrans: TIBTransaction): pointer;

    function UnpackServerPreferences: boolean;
    procedure PackServerPreferences;

    function CheckSavePassword(aPassword: string): boolean;

    function generateAnschriftenMemo(Anrede, aNachname, Vorname, Firma, Zusatz, Strasse, PLZ, Ort, Land, HausNr, Postfach, PfPLZ,
      Ansprechpartner, Adresse2, Titel: string; Pf_Str, ANObjekt: integer): string;

    procedure forceUpdate;
    property TransportVersProz: real read _TransportVers_Proz write setTransportVersProz;
    property TransportVersVerwenden: integer read _TransportVers_Verwenden write setTransportVersVerwenden;
    property TransportVersText: string read _TransportVers_Text;
    property TransportVersInPos: boolean read _TransportVers_InPos write setTransportVersInPos;
    property Bestellung_autom_Freigeben: boolean read _Bestellung_Autom_Freigeben write setBestellung_autom_Freigeben;
    property Farbe_Freigabe_H: integer read _Farbe_Freigabe_H write setFarbe_Freigabe_H;
    property Farbe_Freigabe_T: integer read _Farbe_Freigabe_T write setFarbe_Freigabe_T;
    property Eingangsbelegformat: string read _Eingangsbelegformat write setEingangsbelegformat;
    property Eingangsbeleg_ImportDir: string read _Eingangsbeleg_ImportDir write setEingangsbeleg_ImportDir;
    property Eingangsbeleg_ExportDir: string read _Eingangsbeleg_ExportDir write setEingangsbeleg_ExportDir;
    property Vorgang_ArchivDir : string read _Vorgang_ArchivDir write setVorgang_ArchivDir;
    property Kundennummer : integer read _Kundennummer write setKundennummer;
    function ArtNrFormatList: string;
    property VoBemerkungZeigen: Boolean read _VoBemerkungZeigen write setVoBemerkungZeigen;
    property Rabatt2Anzeigen: Boolean read _Rabatt2Anzeigen write setRabatt2Anzeigen;
    property RechnungPerMail: Boolean read _RechnungPerMail write setRechnungPerMail;
    property RemotePfad: string read getRemotePfad;
    property AspellStandardPath: string read getAspellStandardPath;
    property LokalPfad: string read getLokalPfad;
    property LokalHunspellPfad: string read getLokalHunspellPfad;
    property RemoteHunspellPfad: string read getRemoteHunspellPfad;
    property Reisenummerformat: string read _Reisenummerformat write setReisenummerformat;

    function Vorgangsarchiv(aVoArt, aVoSubart: Integer): string;
    procedure VerzeichnisproJahr_anlegen_VO;

  end;

const
  cOKDatum = 1;
  cREDatum = 2;

  // ANMEMO auswahl
  cStrasse = 0;
  cPostfach = 1;

  // Anschrieft generieren für
  oEmpfaenger = 0;
  oAnsprechpartner = 1;
  oLieferadresse = 2;

  // Kundenformulare
  kfAdresse = 0;
  kfRechnungsdaten = 1;
  kfPostanschrift = 2;
  kfAnsprechpartner = 3;
  kfLieferadressen = 4;
  kfAnfahrt = 5;
  kfNotizen = 6;
  kfDatenbank = 7;
  ktShopdaten = 8;
  kfModellzuordnung = 9;
  kfArtikelzuordnung = 10;
  kfIndividualtexte = 11;
  kfFormularzuordnung = 12;
  kfDokumente = 13;
  kfKundenaktivitaeten = 14;
  kfBeziehungen = 15;

  // Vorgangsspalten
  vsStatusText = 0;
  vsDruckFeld = 1;
  vsVorgangsnummer = 2;
  vsVorgangstyp = 3;
  vsSubType = 4;
  vsKuLiMatch = 5;
  vsLieferanschrift = 6;
  vsDatum = 7;
  vsSumme = 8;
  vsSummeumgerechnet = 9;
  vsWaehrung = 10;
  vsVorgangstext = 11;
  vsOrdernummer = 12;
  vsProjekt = 13;
  vsGeschaeftsbereich = 14;
  vsAnsprechpartner = 15;
  vsBestaetigt = 16;
  vsVorgaengerVorgang = 17;
 // c_optimaRegPath = '\SOFTWARE\ASS\OPTIMA';


  cNotific_Rechnung = 0;
  cNotific_Eigene = 1;

var
  logFileName: string;

implementation

uses SysUtils, o_empfaenger, f_optima, o_mitarbeiter, o_porto, Math, Dialogs,
  ShlObj, o_nf, DateUtils, o_optimaStandard, o_geschaeftsbereich, o_voarten,
  rvHunSpell;

var
  instance: TStammdaten;

  { TStammdaten }

constructor TStammdaten.create(aOwner: TComponent; aIBT: TIBTransaction; aAktuellerMandantID: integer);
var
  ReadQuery: TIBQuery;
  WasOpen: boolean;
begin

  inherited create(aOwner);

  _RemotePfad := '';
  fAspellStandardPath := '';
  fLokalpfad := '';
  IBT := aIBT;
  AktMandantID := aAktuellerMandantID;
  LogMemo := nil;
  _Mitarbeiter := nil;

  WasOpen := IBT.InTransaction;

  if not WasOpen then
    IBT.StartTransaction;

  ReadQuery := TIBQuery.create(self);
  ReadQuery.Transaction := IBT;

  with ReadQuery do
  begin
    SQL.Add('SELECT * FROM STAMMDATEN');

    Open;

    LoadFromQuery(ReadQuery);

    Close;

    Free;

  end;

  if not WasOpen then
    IBT.Commit;

  instance := self;

end;

function TStammdaten.getDPAbsender: string;
begin
  Result := DPAbsender;
end;

function TStammdaten.getDPAbsenderAbk: string;
begin
  Result := DPAbsenderAbk;
end;

function TStammdaten.getDPBank: string;
begin
  Result := DPBank;
end;

function TStammdaten.getDPBLZ: string;
begin
  Result := DPBLZ;
end;

function TStammdaten.getDPErmaessigung: real;
begin
  Result := DPErmaessigung;
end;

function TStammdaten.getMinBestandTage: integer;
begin
  Result := MinBestandTage;
end;

function TStammdaten.getMinBestandGrenze: real;
begin
  Result := MinBestandGrenze;
end;

function TStammdaten.getDPIdentCode: string;
begin
  Result := DPIdentCode;
end;

function TStammdaten.getDPKennung: string;
begin
  Result := DPKennung;
end;

function TStammdaten.getDPKennung_inter: string;
begin
  Result := DPKennung_inter;
end;

function TStammdaten.getDPKontoNr: string;
begin
  Result := DPKontoNr;
end;

function TStammdaten.getDPKundenNr: string;
begin
  Result := DPKundenNr;
end;

function TStammdaten.getDPVorausVerfahren: string;
begin
  Result := DPVorausVerfahren;
end;

function TStammdaten.getDynamischeID: longint;
begin
  Result := DynamischeID;
end;

function TStammdaten.getEasyLog: boolean;
begin
  Result := _Easylog;
end;

function TStammdaten.getEasyLogPfad: string;
begin
  Result := EasyLogPfad;
end;

function TStammdaten.getFarbeEnde: TColor;
begin
  Result := FarbeEnde;
end;

function TStammdaten.getFarbeStart: TColor;
begin
  Result := FarbeStart;
end;

function TStammdaten.getFaxPfad: string;
begin
  Result := FaxPfad;
end;

function TStammdaten.getFaxsofort: boolean;
begin
  Result := Faxsofort;
end;

function TStammdaten.getFibuHost: string;
begin
  Result := FibuHost;
end;

function TStammdaten.getFibuMitarbeiter: string;
begin
  Result := FibuMitarbeiter;
end;

function TStammdaten.getFibuPass: string;
begin
  Result := FibuPass;
end;

function TStammdaten.getFibuUser: string;
begin
  Result := FibuUser;
end;

function TStammdaten.getFortfuehren_ULI_RE_erstellen: boolean;
begin
  Result := Fortfuehren_ULI_RE_erstellen;
end;

function TStammdaten.getFP_Dir_Auswertung: string;
begin
  Result := FP_Dir_Auswertung;
end;

function TStammdaten.getFP_Dir_Vorgang: string;
begin
  Result := FP_Dir_Vorgang;
end;

function TStammdaten.getFreiText: string;
begin
  Result := FreiText;
end;

function TStammdaten.getGeraetAutomatisch: integer;
begin
  Result := GeraetAutomatisch;
end;

function TStammdaten.getGBSucheAlle_Artikel: boolean;
begin
  Result := GBSuche_Alle[1] = 'T';
end;

function TStammdaten.getGBSucheAlle_Vorgang: boolean;
begin
  Result := GBSuche_Alle[2] = 'T';
end;

function TStammdaten.getGBSucheAlle_Kunde: boolean;
begin
  Result := GBSuche_Alle[3] = 'T';
end;

function TStammdaten.getGBSucheAlle_Lieferant: boolean;
begin
  Result := GBSuche_Alle[4] = 'T';
end;

function TStammdaten.getGENR_Auswahl: integer;
begin
  Result := GENR_Auswahl;
end;

function TStammdaten.getGeraeteArtikelnr: boolean;
begin
  Result := GeraeteArtikelnr;
end;

function TStammdaten.getGleubigerID: string;
begin
  Result := GleubigerID;
end;

function TStammdaten.getGruppeKeinKundeTicket: integer;
begin
  Result := GruppeKeinKundeTicket;
end;

function TStammdaten.getGruppeTicketsystem: integer;
begin
  Result := GruppeTicketsystem;
end;

function TStammdaten.getArBemerkung_zeigen: boolean;
begin
  Result := ArBemerkung_zeigen;
end;

function TStammdaten.getArNr_doppelt_pruefen: boolean;
begin
  Result := ArNr_doppelt_pruefen;
end;

function TStammdaten.getArtikelExternVKAlle: boolean;
begin
  Result := ArtikelExternVKAlle;
end;

function TStammdaten.getArtikelNrGenerator: boolean;
begin
  Result := ArikelNrGenerator;
end;

function TStammdaten.getArtNrFormat: string;
begin
  Result := ArtNrFormat;
end;

function TStammdaten.getMassArtikelFormat: string;
begin
  Result := MassArtikelFormat;
end;

function TStammdaten.getArt_fuer_neuen_vorgang: integer;
begin
  Result := Art_fuer_neuen_vorgang;
end;

function TStammdaten.getAuINBE_Bestandpruefen: boolean;
begin
  Result := AuINBE_Bestandpruefen;
end;

function TStammdaten.getAuNummer_in_BEordernummer: boolean;
begin
  Result := AuNummer_in_BEordernummer;
end;

function TStammdaten.getAuto_In_Kopierter_Vorgang: boolean;
begin
  Result := Auto_In_Kopierter_Vorgang;
end;

function TStammdaten.getImageDir: string;
begin
  Result := ImageDir;
end;

function TStammdaten.getInkassoMahnstufe: integer;
begin
  Result := InkassoMahnstufe;
end;

function TStammdaten.getInkassoTage: integer;
begin
  Result := InkassoTage;
end;

class function TStammdaten.getInstance: TStammdaten;
begin
  Result := instance;
end;

function TStammdaten.getInventur_Nul_buchen: boolean;
begin
  Result := Inventur_Nul_buchen;
end;

function TStammdaten.getJournalPfad: string;
begin
  Result := JournalPfad;
end;

function TStammdaten.getkarenzZuFaelligkeit: boolean;
begin
  Result := karenzZuFaelligkeit;
end;

function TStammdaten.getKontoDirektfakturaErloesAusland: longint;
begin
  Result := KontoDirektfakturaErloesAusland;
end;

function TStammdaten.getKontoDirektfakturaErloesEUAusland: longint;
begin
  Result := KontoDirektfakturaErloesEUAusland;
end;

function TStammdaten.getKontoDirektfakturaErloesEUAuslandUST: longint;
begin
  Result := KontoDirektfakturaErloesEUAuslandUST;
end;

function TStammdaten.getKontoDirektfakturaErloesInland: longint;
begin
  Result := KontoDirektfakturaErloesInland;
end;

function TStammdaten.getKontoDirektfakturaKostenAusland: longint;
begin
  Result := KontoDirektfakturaKostenAusland;
end;

function TStammdaten.getKontoDirektfakturaKostenEUAusland: longint;
begin
  Result := KontoDirektfakturaKostenEUAusland;
end;

function TStammdaten.getKontoDirektfakturaKostenEUAuslandUST: longint;
begin
  Result := KontoDirektfakturaKostenEUAuslandUST;
end;

function TStammdaten.getKontoDirektfakturaKostenInland: longint;
begin
  Result := KontoDirektfakturaKostenInland;
end;

function TStammdaten.getLagerhelper: pointer;
begin
  Result := Lagerhelper;
end;

function TStammdaten.getLandkuerzel_fuerUSTID: string;
begin
  Result := Landkuerzel_fuerUSTID;
end;

function TStammdaten.getLeergutID: longint;
begin
  Result := LeergutID;
end;

function TStammdaten.getLockServerIP: string;
begin
  Result := LockServerIP;
end;

function TStammdaten.getMahnzins: real;
begin
  Result := Mahnzins;
end;

function TStammdaten.getMahnzinsen_immerberechnen: boolean;
begin
  Result := Mahnzinsen_immerberechnen;
end;

function TStammdaten.getMandantName: string;
begin
  Result := MandantName;
end;

function TStammdaten.getMandat_erinnerungszeit: integer;
begin
  Result := Mandat_erinnerungszeit;
end;

function TStammdaten.getMandat_verfuegbar_kriterien: integer;
begin
  Result := Mandat_verfuegbar_kriterien;
end;

function TStammdaten.getMandat_warnungszeit: integer;
begin
  Result := Mandat_warnungszeit;
end;

function TStammdaten.getMandat_Wiedervorlage_erstellen: boolean;
begin
  Result := Mandat_Wiedervorlage_erstellen;
end;

function TStammdaten.getNullPosition: longint;
begin
  Result := NullPosition;
end;

function TStammdaten.getNummernFormat: string;
begin
  Result := NummernFormat;
end;

function TStammdaten.getRecoveryPasswort: string;
var
  KryptPass: string;
  KryptChar: char;
  x: integer;
begin

  KryptPass := '';

  for x := 1 to length(RecoveryPasswort) do
  begin

    KryptChar := RecoveryPasswort[x];
    KryptChar := chr(ord(KryptChar) xor ord('A'));
    KryptPass := KryptPass + KryptChar;

  end;

  Result := KryptPass;

end;

function TStammdaten.getRefNr_Dubblettenpruefung: boolean;
begin
  Result := RefNr_Dubblettenpruefung;
end;

function TStammdaten.getReportPfad: string;
begin

  if ReportPfadUmgeleitet then
    Result := ReportPfadNeu
  else
    Result := ReportPfad;
  Result := IncludeLastBackslash(Result);

end;

function TStammdaten.getRMAMitarbeiter: string;
begin
  Result := RMAMitarbeiter;
end;

function TStammdaten.getRMA_GUBankZahlart: TZahlungsart;
begin
  Result := RMA_GUBankZahlart;
end;

function TStammdaten.getRMA_GUKontoZahlart: TZahlungsart;
begin
  Result := RMA_GUKontoZahlart;
end;

function TStammdaten.getSMFromAdress: string;
begin
  Result := SMFromAdress;
end;

function TStammdaten.getSMFromName: string;
begin
  Result := SMFromName;
end;

function TStammdaten.getSMHost: string;
begin
  Result := SMHost;
end;

function TStammdaten.getSMUser: string;
begin
  Result := SMUser;
end;

function TStammdaten.getStdVersand: longint;
begin
  Result := StdVersand;
end;

function TStammdaten.getStdZahlart: longint;
begin
  Result := StdZahlart;
end;

function TStammdaten.getTageTeillieferung: integer;
begin
  Result := TageTeillieferung;
end;

function TStammdaten.getVersandpause: boolean;
begin
  Result := Versandpause;
end;

function TStammdaten.getZNettoTage: integer;
begin
  Result := ZNettoTage;
end;

function TStammdaten.getZSkonto: real;
begin
  Result := ZSkonto;
end;

function TStammdaten.getZSkontoTage: integer;
begin
  Result := ZSkontoTage;
end;

function TStammdaten.isNullPos(aArt: integer): boolean;
begin
  Result := NullPosArray[aArt];
end;

function TStammdaten.getAnfahrtsart: integer;
begin
  Result := Anfahrtsart;
end;

function TStammdaten.getAnfahrtszeit_kennziffer: integer;
begin
  Result := Anfahrtszeit_kennziffer;
end;

function TStammdaten.getEntfernung_kennziffer: integer;
begin
  Result := Entfernung_kennziffer;
end;

function TStammdaten.getPauschal_kennziffer: integer;
begin
  Result := Pauschalbetrag_kennziffer;
end;

procedure TStammdaten.LoadFromQuery(aQuery: TIBQuery);
var
  Reg: TRegistry;
begin

  if ServerEinstellungen = nil then
    ServerEinstellungen := TMultiValues.create(self);

  with aQuery do
  begin
    Release := FieldByName('ST_RELEASE').AsString;
    DPAbsender := FieldByName('ST_DP_ABSMEMO').AsString;
    DPAbsenderAbk := FieldByName('ST_DP_ABSKURZ').AsString;
    DPBank := FieldByName('ST_DP_BANK').AsString;
    DPBLZ := FieldByName('ST_DP_BLZ').AsString;
    DPErmaessigung := FieldByName('ST_DP_ERMAESSIGUNG').AsFloat;
    DPIdentCode := FieldByName('ST_DP_IDENTCODE').AsString;
    DPKontoNr := FieldByName('ST_DP_KTO').AsString;
    DPNNAufschlag := FieldByName('ST_DP_NNAUFSCHLAG').AsFloat;
    DPKennung := FieldByName('ST_DP_KENNUNG').AsString;
    DPKundenNr := FieldByName('ST_DP_KDNUMMER').AsString;
    DPVorausVerfahren := FieldByName('ST_DP_VORAUSVERF').AsString;
    DPKennung_inter := FieldByName('ST_DP_KENNUNG_INTER').AsString;
    DynamischeID := FieldByName('ST_DYNID').AsInteger;
    EasyLogPfad := FieldByName('ST_EASYLOGDIR').AsString;
    _EasyLog := FieldByName('ST_EASYLOG').AsString = 'T';
    FarbeEnde := FieldByName('ST_SBFARBEENDE').AsInteger;
    FarbeStart := FieldByName('ST_SBFARBESTART').AsInteger;
    FaxPfad := FieldByName('ST_FAXPFAD').AsString;
    FibuMitarbeiter := FieldByName('ST_FIBUMITARBEITER').AsString;
    ImageDir := FieldByName('ST_IMAGEDIR').AsString;
    DokuDir := FieldByName('ST_DOKUDIR').AsString;
    InkassoMahnstufe := FieldByName('ST_INKASSOMAHNST').AsInteger;
    InkassoTage := FieldByName('ST_INKASSOTAGE').AsInteger;
    InkassoAbstand := FieldByName('ST_INKASSOABSTAND').AsInteger;
    JournalPfad := FieldByName('ST_JOUNALEXPORT').AsString;
    LeergutID := FieldByName('ST_LEERGUTID').AsInteger;
    LockServerIP := FieldByName('ST_LOCKSERVERIP').AsString;
    MahngebuehrStufe1 := FieldByName('ST_MAHNGEB_STUFE1').AsFloat;
    MahngebuehrStufe2 := FieldByName('ST_MAHNGEB_STUFE2').AsFloat;
    MahngebuehrStufe3 := FieldByName('ST_MAHNGEB_STUFE3').AsFloat;
    MahngebuehrStufe4 := FieldByName('ST_MAHNGEB_STUFE4').AsFloat;
    Mahnzins := FieldByName('ST_MAHNZINS').AsFloat;
    MandantName := FieldByName('ST_MANDANTNAME').AsString;
    NullPosition := FieldByName('ST_NULLPOS').AsInteger;
    NummernFormat := FieldByName('ST_NUMFORMAT').AsString;
    RecoveryPasswort := FieldByName('ST_RECOVERY').AsString;
    WiedervorlageAnzeigen := FieldByName('ST_WIEDERVORLAGE').AsInteger;

    ReportPfad := FieldByName('ST_REPORTDIR').AsString;

    ReportPfadNeu := GetEnvironmentVariable('REPORT_PATH');
    ReportMandantNeu := GetEnvironmentVariable('REPORT_OVERRIDE');
    ReportPfadUmgeleitet := (ReportPfadNeu <> '') and
      ((ReportMandantNeu = '') or (StrToInt(ReportMandantNeu) = AktMandantID));

    RMAMitarbeiter := FieldByName('ST_RMAMITARBEITER').AsString;
    SMHost := FieldByName('ST_SMHOST').AsString;
    SMFromAdress := FieldByName('ST_SMFROMADDRESS').AsString;
    SMFromName := FieldByName('ST_SMFROMNAME').AsString;
    SMUser := FieldByName('ST_SMUSER').AsString;
    SMPass := FieldByName('ST_SMPASS').AsString;
    StdVersand := FieldByName('ST_STDVERSAND').AsInteger;
    StdZahlart := FieldByName('ST_STDZAHLART').AsInteger;
    StdBriefanrede := FieldByName('ST_STDBRIEFANREDE').AsString;
    TageTeillieferung := FieldByName('ST_TAGETEIL').AsInteger;
    Versandpause := (FieldByName('ST_VERSANDPAUSE').AsString = 'T');
    ZNettoTage := FieldByName('ST_ZNETTOTAGE').AsInteger;
    ZSkonto := FieldByName('ST_ZSKONTO').AsFloat;
    ZSkontoTage := FieldByName('ST_ZSKONTOTAGE').AsInteger;
    Uebergabeliste := FieldByName('ST_UEBERGABELISTE').AsString = 'T';
    Abrechnungszeit := FieldByName('ST_ABRECHNUNGSZEIT').AsInteger;
    AbrechnungszeitFK := FieldByName('ST_ABRECHNUNGSZEIT_FK').AsString = 'T';
    MinBestandTage := FieldByName('ST_MB_TAGE').AsInteger;
    MinBestandGrenze := FieldByName('ST_MB_GRENZE').AsFloat;
    NullEuroWarnung := FieldByName('ST_NULLEUROWARNUNG').AsString = 'T';
    KontorREMemo := FieldByName('ST_KONTORREMEMO').AsString = 'T';

    if FieldByName('ST_RMA_GUBANKZAHLART').AsInteger > 0 then
      RMA_GUBankZahlart := TZahlungsart.create(self, FieldByName('ST_RMA_GUBANKZAHLART').AsInteger, nil, IBT)
    else
      RMA_GUBankZahlart := nil;
    if FieldByName('ST_RMA_GUKONTOZAHLART').AsInteger > 0 then
      RMA_GUKontoZahlart := TZahlungsart.create(self, FieldByName('ST_RMA_GUKONTOZAHLART').AsInteger, nil, IBT)
    else
      RMA_GUKontoZahlart := nil;

    ServerEinstellungenLeer := (FieldByName('ST_EINSTELLUNGEN').AsString = '');
    ServerEinstellungen.Unpack(FieldByName('ST_EINSTELLUNGEN').AsString);

    KontoDirektfakturaKostenInland := FieldByName('ST_DI_KOS_INL').AsInteger;
    KontoDirektfakturaKostenAusland := FieldByName('ST_DI_KOS_AUS').AsInteger;
    KontoDirektfakturaKostenEUAusland := FieldByName('ST_DI_KOS_EUA').AsInteger;
    KontoDirektfakturaKostenEUAuslandUST := FieldByName('ST_DI_KOS_EUID').AsInteger;
    KontoDirektfakturaErloesInland := FieldByName('ST_DI_ERL_INL').AsInteger;
    KontoDirektfakturaErloesAusland := FieldByName('ST_DI_ERL_AUS').AsInteger;
    KontoDirektfakturaErloesEUAusland := FieldByName('ST_DI_ERL_EUA').AsInteger;
    KontoDirektfakturaErloesEUAuslandUST := FieldByName('ST_DI_ERL_EUID').AsInteger;

    Anfahrtsart := FieldByName('ST_ANFAHRTSART').AsInteger;
    Pauschalbetrag_kennziffer := FieldByName('ST_AR_PAUSCHALBETRAG').AsInteger;
    Entfernung_kennziffer := FieldByName('ST_AR_ENTFERNUNG').AsInteger;
    Anfahrtszeit_kennziffer := FieldByName('ST_AR_ANFAHRTSZEIT').AsInteger;

    PlanetShop := FieldByName('ST_PLANETSHOP').AsString = 'T';
    Mahngrenze := FieldByName('ST_MAHNGRENZE').AsFloat;
    ChargeMenge := FieldByName('ST_CHMENGE').AsString = 'T';
    ChargeEnde := FieldByName('ST_CHENDE').AsString;

    ScanMode := FieldByName('ST_SCANMODE').AsString;
    ScanOK := FieldByName('ST_SCANOK').AsString;
    ScanAbbr := FieldByName('ST_SCANABBR').AsString;

    StdKUKreditLimit := FieldByName('ST_KU_KREDITLIMIT').AsFloat;
    StdLTKreditLimit := FieldByName('ST_LT_KREDITLIMIT').AsFloat;
    ProvDatum := FieldByName('ST_PROVDATUM').AsInteger;

    KondNetto := FieldByName('ST_KOND_NETTO').AsString;
    KondNettoTage := FieldByName('ST_KOND_NETTOT').AsString;
    KondSkontoTage := FieldByName('ST_KOND_SKONTOT').AsString;
    KondSkonto := FieldByName('ST_REKOND_SKONTO').AsString;
    REKondNetto := FieldByName('ST_REKOND_NETTO').AsString;
    REKondNettoTage := FieldByName('ST_REKOND_NETTOT').AsString;
    REKondSkontoTage := FieldByName('ST_REKOND_SKONTOT').AsString;
    REKondSkonto := FieldByName('ST_REKOND_SKONTO').AsString;

    VersandMo := FieldByName('ST_VERSANDMO').AsString = 'T';
    VersandDi := FieldByName('ST_VERSANDDI').AsString = 'T';
    VersandMi := FieldByName('ST_VERSANDMI').AsString = 'T';
    VersandDo := FieldByName('ST_VERSANDDO').AsString = 'T';
    VersandFr := FieldByName('ST_VERSANDFR').AsString = 'T';
    VersandSa := FieldByName('ST_VERSANDSA').AsString = 'T';
    VersandSo := FieldByName('ST_VERSANDSO').AsString = 'T';

    FaxFrKu := FieldByName('ST_FAXFRKU').AsString = 'T';
    FaxVersKu := FieldByName('ST_FAXVERSKU').AsString = 'T';
    FaxVersVe := FieldByName('ST_FAXVERSVE').AsString = 'T';
    MailFrKu := FieldByName('ST_MAILFRKU').AsString = 'T';
    MailVersKu := FieldByName('ST_MAILVERSKU').AsString = 'T';
    DruckFrKu := FieldByName('ST_DRUCKFRKU').AsString = 'T';
    FaxTeillieferung := FieldByName('ST_FAXTEILLIEFERUNG').AsInteger;

    KeinePreisaenderung := FieldByName('ST_KPAENDERUNG').AsString = 'T';

    SNZwingend := (FieldByName('ST_SNZWINGEND').AsString = 'T');
    SNzwingend_Raus := (FieldByName('ST_SNZWINGEND_RAUS').AsString = 'T');
    SNNeuBeiWE := (FieldByName('ST_SNNEUWE').AsString = 'T');
    SNScanbeiVersand := (FieldByName('ST_SNSCANVERSAND').AsString = 'T');
    SNzwingend_Raus_WE := (FieldByName('ST_SNZWINGEND_RAUS_WE').AsString = 'T');

    SavePasswords := (FieldByName('ST_SAVE_PW').AsString = 'T');
    DruckePBS := (FieldByName('ST_DRUCKEPBS').AsString = 'T');
    KommFormular := FieldByName('ST_KOMM_ID').AsInteger;

    NavExportDir := FieldByName('ST_NAVEXPORTDIR').AsString;
    NavImportDir := FieldByName('ST_NAVIMPORTDIR').AsString;
    NavExportBack := FieldByName('ST_NAVEXPORTBACK').AsString;
    NavImportBack := FieldByName('ST_NAVIMPORTBACK').AsString;

    EDIDir := FieldByName('ST_EDIDIR').AsString;
    EDIImportDir := FieldByName('ST_EDIIMPORTDIR').AsString;
    EDIName := FieldByName('ST_EDINAME').AsString;
    EDIMitarbeiterID := FieldByName('ST_EDIMA_ID').AsInteger;
    EDILager := FieldByName('ST_EDILA_ID').AsInteger;
    EDIVersandfenster := FieldByName('ST_EDIVFENSTER').AsInteger;
    EDIGeschaeftsbereich := FieldByName('ST_EDIGB_ID').AsInteger;
    ILN := FieldByName('ST_ILN').AsString;

    AnMemoFirma := FieldByName('ST_ANMEMO_FIRMA').AsString;
    AnMemoPrivat := FieldByName('ST_ANMEMO_PERSON').AsString;
    AnMemoFirmaPf := FieldByName('ST_ANMEMO_FIRMA_PF').AsString;
    AnMemoPrivatPf := FieldByName('ST_ANMEMO_PERSON_PF').AsString;
    AnMemoFirmaLI := FieldByName('ST_ANMEMO_FIRMA_LIEF').AsString;
    AnMemoPrivatLI := FieldByName('ST_ANMEMO_PERSON_LIEF').AsString;

    LIAutoVersand := FieldByName('ST_LIAUTOVERSAND').AsString = 'T';
    InkassoAbfrage := FieldByName('ST_INKASSOABFRAGE').AsString = 'T';
    EinPreisFuerAlle := FieldByName('ST_PREISKG').AsString = 'T';
    PreisKGruppe := FieldByName('ST_PREISKG_ID').AsInteger;

    KommscheinBeiFreigabe := FieldByName('ST_KOMMSCHEIN_FREIGABE').AsString = 'T';
    VOSachbearbeiterUeberschreiben := FieldByName('ST_VO_SACHB_UEBERSCHR').AsString = 'T';
    SRTextImmer := FieldByName('ST_SRTEXTIMMER').AsString = 'T';
    VoArtInGrid := FieldByName('ST_VOARTINGRID').AsString = 'T';
    PersonenkontenAuto := FieldByName('ST_PKONTENAUTO').AsString = 'T';
    KredKontenAuto := FieldByName('ST_LT_PKONTENAUTO').AsString = 'T';
    EigeneOPVerwaltung := FieldByName('ST_EIGENEOPVERWALTUNG').AsString = 'T';
    StdTeillieferVerhalten := FieldByName('ST_STDTEILLIEFERV').AsInteger;

    WarenGrP := FieldByName('ST_WAHRENGRP').AsInteger;

    VerbuchenNachTagen := FieldByName('ST_VERBUCHENNACHTAGEN').AsInteger;
    KundenPLZVertreter := FieldByName('ST_KUNDENPLZVERTRETER').AsString = 'T';
    RabattUeberschreiben := FieldByName('ST_RABATTUEBERSCHREIBEN').AsString = 'T';

    DPDRoutenVersion := FieldByName('ST_DPD_ROUTENVER').AsString;
    DPDKundennummer := FieldByName('ST_DPD_KUNDENNR').AsString;
    DPDDepotkennung := FieldByName('ST_DPD_DEPOTKENNUNG').AsString;
    DPDAbsender := FieldByName('ST_DPD_ABSMEMO').AsString;
    DPDBank := FieldByName('ST_DPD_BANK').AsString;
    DPDBlz := FieldByName('ST_DPD_BLZ').AsString;
    DPDKontoNr := FieldByName('ST_DPD_KTO').AsString;
    DPDNNAufschlag := FieldByName('ST_DPD_NNAUFSCHLAG').AsFloat;
    DPDDepotAdresse := FieldByName('ST_DPD_DEPOTADRESSE').AsString;
    DPDDepotTel := FieldByName('ST_DPD_DEPOT_TEL').AsString;
    DPDDepotFax := FieldByName('ST_DPD_DEPOT_FAX').AsString;

    RiskCheckCount := FieldByName('ST_RISIKO_CHECK_COUNT').AsInteger;
    VOSperreBeiGedruckt := FieldByName('ST_VOSPERREBEIGEDRUCKT').AsString = 'T';

    UstID := FieldByName('ST_USTID').AsString;
    NachkommaDruck := FieldByName('ST_NACHKOMMADRUCK').AsInteger;
    BudgetKG := FieldByName('ST_BUDGETKG').AsInteger;
    DruckerAuswahlSynchron := FieldByName('ST_DRUCKERSYNCHRON').AsString = 'T';

    DruckParameter := FieldByName('ST_PRINTPARAMS').AsString;

    KuSucheErweitert := FieldByName('ST_KUSUCHE_ERWEITERT').AsString = 'T';
    KuSperreInkasso := FieldByName('ST_SPERRE_INKASSO').AsString = 'T';
    Porto_Skontierbar := FieldByName('ST_PORTO_SKONTIERBAR').AsString = 'T';
    SammelRe_Porto := FieldByName('ST_SAMMELRE_PORTO').AsString = 'T';
    CheckSperre := FieldByName('ST_CHECKSPERRE').AsString = 'T';
    NVEErfassen := FieldByName('ST_NVEERFASSEN').AsString = 'T';
    DatevKontenManipulieren := FieldByName('ST_DATEVKONTEN').AsString = 'T';
    UmsatzProvision := FieldByName('ST_UMSATZPROVISION').AsString = 'T';

    WELager := FieldByName('ST_WELAGER').AsInteger;
    WEPlatz := FieldByName('ST_WEPLATZ').AsInteger;

    TicketArtikel := FieldByName('ST_TICKETARTIKEL').AsInteger;

    VerdichtungDebitoren := FieldByName('ST_VERDICHTUNG_DEB').AsInteger;
    VerdichtungKreditoren := FieldByName('ST_VERDICHTUNG_KRED').AsInteger;

    MwST_voll_1 := FieldByName('ST_MWST_VOLL_1').AsFloat;
    MwST_voll_2 := FieldByName('ST_MWST_VOLL_2').AsFloat;
    MwST_vermindert_1 := FieldByName('ST_MWST_VERMINDERT_1').AsFloat;
    MwST_vermindert_2 := FieldByName('ST_MWST_VERMINDERT_2').AsFloat;
    MwST_Stichtag := FieldByName('ST_MWST_STICHTAG').AsDateTime;

    VKPreiseAnzeigen := FieldByName('ST_AR_VK_ANZEIGEN').AsString = 'T';
    VKPreiseAnzeigenKG := FieldByName('ST_AR_VK_ANZEIGEN_KG').AsInteger;
    ResMengenSofort := FieldByName('ST_RESMENGESOFORT').AsString = 'T';

    ServiceVersandartID := FieldByName('ST_SERVICE_PO_ID').AsInteger;
    Waehrungszeichen := FieldByName('ST_WAEHRUNGSZEICHEN').AsString;
    SkontoVonProvAbziehen := FieldByName('ST_SKONTOVONPROV').AsString = 'T';
    ZeitfensterIgnorieren := FieldByName('ST_ZEITFENSTERIG').AsString = 'T';
    AU_Bezugsdaten := FieldByName('ST_AU_BEZUGSDATEN').AsString;
    AU_Beschreibung := FieldByName('ST_AU_BESCHREIBUNG').AsString;
    AU_Bericht := FieldByName('ST_AU_BERICHT').AsString;
    AU_Art := FieldByName('ST_AU_ART').AsInteger;
    AU_Unterart := FieldByName('ST_AU_UNTERART').AsInteger;
    AU_Anforderung := FieldByName('ST_AU_ANFORDERUNG').AsInteger;

    erweiterteAdressdaten := FieldByName('ST_ERWEITERTEADRESSE').AsString = 'T';
    Kundenformulare := FieldByName('ST_KUNDENFORMULARE').AsInteger;
    DefaultLiefertage := FieldByName('ST_LIEFERTAGE').AsInteger;
    UebersichtAnsprechpartner := FieldByName('ST_UEBERSICHTAS').AsString = 'T';
    KW_Datum := FieldByName('ST_KW_DATUM').AsInteger;
    KuSperrstatus := FieldByName('ST_KU_SPERRSTATUS').AsInteger;

    FB_POP3_Server := FieldByName('ST_FB_POP3_SERVER').AsString;
    FB_POP3_Benutzer := FieldByName('ST_FB_POP3_BENUTZER').AsString;
    FB_POP3_Passwort := FieldByName('ST_FB_POP3_PASSWORT').AsString;
    FB_POP3_Mail := FieldByName('ST_FB_POP3_Mail').AsString;
    NachkommaPos := FieldByName('ST_NACHKOMMAPOS').AsInteger;
    NachkommaEinzelnpreis := FieldByName('ST_NACHKOMMAEINZELNPREIS').AsInteger;
    NachkommaMenge := FieldByName('ST_NACHKOMMAMENGE').AsInteger;
    VorgangNettoSumme := FieldByName('ST_VORGANGNETTOSUMME').AsString = 'T';
    FreiText := FieldByName('ST_FREITEXT').AsString;
    BilderAlle := FieldByName('ST_BILDERALLE').AsString = 'T';
    ArtikelExternVKAlle := FieldByName('ST_ArtikelExternVKAlle').AsString = 'T';
    Zertifikat := FieldByName('ST_ZERTIFIKAT').AsString = 'T';
    Vorgangsspalten := TBitmuster.create;
    Vorgangsspalten.setBitMuster(FieldByName('ST_VORGANGSSPALTEN').AsInteger);
    // Artikelspalten                       := TBitmuster.Create;
    // Artikelspalten.setBitMuster          (  FieldByName('ST_ARTIKELSPALTEN').asInteger);

    KeinRabattBeiSA := FieldByName('ST_KEINRABATTBEISA').AsString = 'T';
    Vo_status_beimFortfuehren := FieldByName('st_vo_forfuehrstatus').AsInteger;
    Vo_status_beimKopieren := FieldByName('st_vo_kopiestatus').AsInteger;
    GENR_Auswahl := FieldByName('st_genr_auswahl').AsInteger;
    Vo_status_inRE_Fortfuehren := FieldByName('ST_RE_FORFUEHRSTATUS').AsInteger;
    Vo_status_inER_Fortfuehren := FieldByName('ST_ER_FORFUEHRSTATUS').AsInteger;
    RechnungGetrennt := FieldByName('ST_RE_GETRENNT').AsString = 'T';
    GeraetAutomatisch := FieldByName('ST_GERAETAUTOMATISCH').AsInteger;

    UPS_KUNR := FieldByName('ST_UPS_KUNR').AsString;
    UPS_Warenbeschreibung := FieldByName('ST_UPS_WARENBESCHR').AsString;
    UPS_Verzeichnis := FieldByName('ST_UPS_VERZEICHNIS').AsString;
    UPS_Telefon := FieldByName('ST_UPS_TELEFON').AsString;
    ZahlungBeiOPNrNull := FieldByName('ST_ZahlungBeiOPNrNull').AsString = 'T';
    karenzZuFaelligkeit := FieldByName('ST_karenzZuFaelligkeit').AsString = 'T';
    Mahnzinsen_immerberechnen := FieldByName('ST_MAHNZINSEN_IMMER_BERECHNEN').AsString = 'T';

    KeinRabattBeiSpezPreis := FieldByName('ST_KEINRABATTBEISPEZPREIS').AsString = 'T';
    Chargenverzeichnis := FieldByName('ST_CHARGENVERZEICHNIS').AsString;
    Faxversand := FieldByName('ST_FAXVERSAND').AsDateTime;
    Faxsofort := FieldByName('ST_FAX_SOFORT').AsString = 'T';
    Lief_nichtfortfueren := FieldByName('ST_LIEF_NICHTFORTFUEREN').AsString = 'T';
    ServiceGruppieren := FieldByName('ST_SERVICEGRUPPIEREN').AsString = 'T';
    GeraeteArtikelnr := FieldByName('ST_GERAETEARTIKELNR').AsString = 'T';
    ServiceLieferschein := FieldByName('ST_SERVICELIEFERSCHEIN').AsString = 'T';
    PicklistenDrucken := FieldByName('ST_PICKLISTENDRUCKEN').AsString = 'T';
    ChargenInPackliste := FieldByName('ST_CHARGENINPACKLISTE').AsString = 'T';
    KU_Notizen := FieldByName('ST_KU_NOTIZEN').AsString = 'T';
    LT_Notizen := FieldByName('ST_LT_NOTIZEN').AsString = 'T';

    DruckeLangText := FieldByName('ST_DRUCKELANGTEXT').AsString = 'T';
    DruckeLangTextKreditor := FieldByName('ST_DRUCKELANGTEXT_KRED').AsString = 'T';

    Kundensuchspalten := TBitmuster.create;
    Kundensuchspalten.setBitMuster(FieldByName('ST_KUNDENSUCHSPALTEN').AsInteger);

    VOVersandBisTage := FieldByName('ST_VO_VERSANDBIS').AsInteger;
    KuDebNr_gleich := FieldByName('ST_KU_DEBNR_GLEICH').AsString = 'T';
    LTKredNr_gleich := FieldByName('ST_LT_KREDNR_GLEICH').AsString = 'T';
    SNFensternichtzeigen := FieldByName('ST_SNFENSTER_ZEIGEN').AsString = 'T';
    Versand_allePos := FieldByName('ST_VERSAND_ALLEPOS').AsString = 'T';
    ProvDecksatzbeachten := FieldByName('ST_PROV_DECKUNGSSATZ').AsString = 'T';
    VoSuche_vondatum := FieldByName('ST_VOSUCHDATUM_VON').AsDateTime;
    MySqlLowerCase := FieldByName('ST_MYSQL_LOWERCASE').AsString = 'T';
    MySqlUtf8 := FieldByName('ST_MYSQL_UTF8').AsString = 'T';
    UseVorgangLiefertermin := FieldByName('ST_USEVORGANGLIEFER').AsString = 'T';
    VersandFrei := FieldByName('ST_VERSANDFREI').AsString = 'T';
    Art_fuer_neuen_vorgang := FieldByName('ST_ART_FUER_NEUEN_VORGANG').AsInteger;
    Doppelte_Kunr_erlauben := FieldByName('ST_DOPPELTE_KUNM_ERLAUB').AsString = 'T';
    Doppelte_LTnr_erlauben := FieldByName('ST_DOPPELTE_LTNR_ERLAUBT').AsString = 'T';
    DebNr_Von := FieldByName('ST_DEBNR_VON').AsInteger;
    DebNr_Bis := FieldByName('ST_DEBNR_BIS').AsInteger;
    Deb_Vergabeart := FieldByName('ST_DEB_VERGABEART').AsInteger;
    KredNr_Von := FieldByName('ST_KREDNR_VON').AsInteger;
    KredNr_Bis := FieldByName('ST_KREDNR_BIS').AsInteger;
    Kred_Vergabeart := FieldByName('ST_KRED_VERGABEART').AsInteger;
    Inventur_Nul_buchen := FieldByName('ST_INVENTUR_NUL_BUCHEN').AsString = 'T';
    PreisbasisVKEinheit := FieldByName('ST_PREISRUNDEN').AsString = 'T';
    ArBemerkung_zeigen := FieldByName('st_ar_bemerkungzeigen').AsString = 'T';
    _VoBemerkungZeigen := FieldByName('ST_VO_BEMERKUNGZEIGEN').AsString = 'T';
    _Rabatt2Anzeigen   := FieldByName('st_rabatt2anzeigen').AsString = 'T';
    VoSuche_Anzahltage := FieldByName('ST_VOSUCHANZAHL_TAGE').AsInteger;
    RefNr_Dubblettenpruefung := FieldByName('ST_REFNR_DUBLETTENPRUEFUNG').AsString = 'T';
    AuNummer_in_BEordernummer := FieldByName('ST_AUNUMMER_IN_BEORDERNUMMER').AsString = 'T';
    EK_beimfortfuehren_neulesen := FieldByName('ST_BEIMFORTFUEHRENEK_NEULESEN').AsString = 'T';
    ChargenNach_FIFO_zuordnen := FieldByName('ST_CHARGEN_NACH_FIFO_ZUORDNEN').AsString = 'T';
    Fortfuehren_ULI_RE_erstellen := FieldByName('ST_FORTF_ULI_RE_ERSTELLEN').AsString = 'T';
    Bei_freigabe_MA_ueberschreiben := FieldByName('ST_VO_BEI_FREIGABE_MA_UBERSCREI').AsString = 'T';
    GleubigerID := FieldByName('ST_GLEUBIGER_ID').AsString;
    MBWert := FieldByName('ST_MBWERT').AsString = 'T';
    MBWertText := FieldByName('ST_MBWERTTEXT').AsString;
    MBWarenGrp := FieldByName('ST_MBWARENGRP').AsInteger;
    ArikelNrGenerator := FieldByName('ST_ARTNRGEN').AsString = 'T';
    ArtNrFormat := FieldByName('ST_ARTNRFORMAT').AsString;
    MassArtikelFormat := FieldByName('ST_MASSARTIKELFORMAT').AsString;
    FP_Dir_Vorgang := FieldByName('ST_FP_DIR_VORGANG').AsString;
    FP_Dir_Auswertung := FieldByName('ST_FP_DIR_AUSWERTUNG').AsString;
    MahnZAFrist := FieldByName('ST_MAHNZAFRIST').AsInteger;
    MitarbeiterTicketsystem := FieldByName('ST_MITARBEITER_TICKETSYSTEM').AsInteger;
    GruppeTicketsystem := FieldByName('ST_GRUPPEMA_TICKETSYSTEM').AsInteger;
    PrioNeueTickets := FieldByName('ST_PRIO_TICKET').AsInteger;
    GruppeKeinKundeTicket := FieldByName('ST_GRUPPE_TICKETSYSTEM').AsInteger;
    Mandat_erinnerungszeit := FieldByName('ST_MANDAT_ERINNERUNGSZEIT').AsInteger;
    Mandat_warnungszeit := FieldByName('ST_MANDAT_WARNUNGSZEIT').AsInteger;
    Mandat_verfuegbar_kriterien := FieldByName('ST_MANDAT_KRITERIEN').AsInteger;
    GBSuche_Alle := FieldByName('ST_GBSUCHE_ALLE').AsString;
    Notificationart := FieldByName('ST_NOTIFICATIONART').AsInteger;
    Mandat_Wiedervorlage_erstellen := FieldByName('ST_MANDAT_WV_ERSTELLEN').AsString = 'T';
    Vorgang_Portodeaktivieren := FieldByName('ST_VO_PORTO_DEAKTIVIEREN').AsString = 'T';
    KundeSofortFreigeben := FieldByName('ST_KUNDESOFORTFREIGEBEN').AsString = 'T';
    Landkuerzel_fuerUSTID := FieldByName('ST_LANDKUERZEL_USTID').AsString;
    Ticketabrechnen := FieldByName('ST_TICKET_ABRECHNEN').AsString = 'T';
    VO_Suche_Status := FieldByName('ST_VO_SUCHE_STATUS').AsInteger;
    Ticket_Kumatchzeigen := FieldByName('ST_TICKET_KUZEIGEN').AsString = 'T';
    Ticket_KUmatch_laenge := FieldByName('ST_TICKET_KU_LAENGE').AsInteger;
    _TransportVers_Proz := FieldByName('ST_TRANSPORTVERS_PROZ').AsFloat;
    _TransportVers_Verwenden := FieldByName('ST_TRANSPORTVERS_VERWENDEN').AsInteger;
    _TransportVers_Text := 'Transportversicherung';
    _Bestellung_Autom_Freigeben := FieldByName('ST_BESTELLUNG_AUTOM_FREIGEBEN').AsString = 'T';
    _Farbe_Freigabe_H := FieldByName('ST_FARBE_FREIGABE_H').AsInteger;
    _Farbe_Freigabe_T := FieldByName('ST_FARBE_FREIGABE_T').AsInteger;
    _Eingangsbelegformat := FieldByName('ST_EINGANGSBELEGFORMAT').AsString;
    _Eingangsbeleg_ImportDir := FieldByName('ST_EINGBELEG_IMPORTDIR').AsString;
    _Eingangsbeleg_ExportDir := FieldByName('ST_EINGBELEG_EXPORTDIR').AsString;
    _Vorgang_ArchivDir := FieldByName('ST_ARCHIVDIR').AsString;
    _Kundennummer := FieldByName('ST_KUNDENNUMMER').AsInteger;
    _Reisenummerformat := FieldByName('ST_REISENUMMERFORMAT').AsString;

    FibuHost := FieldByName('ST_FIBU_HOST').AsString;
    FibuPass := FieldByName('ST_FIBU_PASS').AsString;
    FibuUser := FieldByName('ST_FIBU_USER').AsString;
    AddisonUser := FieldByName('ST_ADDISON_USER').AsString;
    AddisonPass := FieldByName('ST_ADDISON_PASS').AsString;

    DruckdatenFTP := FieldByName('ST_DRUCKDATEN_FTP').AsString;
    DruckdatenFTPUser := FieldByName('ST_DRUCKDATEN_FTP_USER').AsString;
    DruckdatenFTPPass := FieldByName('ST_DRUCKDATEN_FTP_PASS').AsString;
    DruckdatenBaseUrl := FieldByName('ST_DRUCKDATEN_BASEURL').AsString;

    Notificationzeit := FieldByName('ST_NOTIFICATIONZEIT').AsInteger;
    _RechnungPerMail := FieldByName('ST_RECHNUNG_PER_EMAIL').AsString = 'T';

    if length(GBSuche_Alle) <> 4 then
      GBSuche_Alle := 'FFFF';

  end;

  // Easylog-Unterstützung
  Reg := TRegistry.create;
  Reg.RootKey := HKEY_CURRENT_USER;
  Reg.OpenKey('Software\ASS\OPTIMA', true);
  if Reg.ReadString('Easylog') = 'true' then
  begin
    Reg.WriteString('Easylog', 'false');
    setEasylog(true);
    saveToDB;
  end;
  //Easylog := Reg.ReadString('Easylog') = 'true';
  Reg.CloseKey;
  Reg.Free;

  SetupNullPosArray;

  if _Eingangsbeleg_ExportDir > '' then
     VerzeichnisproJahr_anlegen(_Eingangsbeleg_ExportDir);

  VerzeichnisproJahr_anlegen_VO;
//  if _Vorgang_ArchivDir > '' then
//     VerzeichnisproJahr_anlegen(_Vorgang_ArchivDir);

  Update := false;

end;

function TStammdaten.UnpackServerPreferences: boolean;
begin

  Result := not ServerEinstellungenLeer;

end;

procedure TStammdaten.VerzeichnisproJahr_anlegen_VO;
var
  Verz : string;
begin
  if _Vorgang_ArchivDir > '' then
     VerzeichnisproJahr_anlegen(_Vorgang_ArchivDir);
  //Angebot
  Verz :=  Vorgangsarchiv(cAngebot, 0);
  if (Verz > '')  and (Verz <> _Vorgang_ArchivDir) then
     VerzeichnisproJahr_anlegen(Verz);
  //Auftrag
  Verz :=  Vorgangsarchiv(cAuftrag, 0);
  if (Verz > '')  and (Verz <> _Vorgang_ArchivDir) then
     VerzeichnisproJahr_anlegen(Verz);
  Verz :=  Vorgangsarchiv(cAuftrag, cAUUmlagerung);
  if (Verz > '')  and (Verz <> _Vorgang_ArchivDir) then
     VerzeichnisproJahr_anlegen(Verz);

  //Lieferschein
  Verz :=  Vorgangsarchiv(cLieferschein, cLIStandard);
  if (Verz > '')  and (Verz <> _Vorgang_ArchivDir) then
     VerzeichnisproJahr_anlegen(Verz);
  Verz :=  Vorgangsarchiv(cLieferschein, cLIAustausch);
  if (Verz > '')  and (Verz <> _Vorgang_ArchivDir) then
     VerzeichnisproJahr_anlegen(Verz);
  Verz :=  Vorgangsarchiv(cLieferschein, cLIADBestand);
  if (Verz > '')  and (Verz <> _Vorgang_ArchivDir) then
     VerzeichnisproJahr_anlegen(Verz);
  Verz :=  Vorgangsarchiv(cLieferschein, cLIAnprobe);
  if (Verz > '')  and (Verz <> _Vorgang_ArchivDir) then
     VerzeichnisproJahr_anlegen(Verz);
  Verz :=  Vorgangsarchiv(cLieferschein, cLIVorfuehren);
  if (Verz > '')  and (Verz <> _Vorgang_ArchivDir) then
     VerzeichnisproJahr_anlegen(Verz);
  Verz :=  Vorgangsarchiv(cLieferschein, cLIGarantie);
  if (Verz > '')  and (Verz <> _Vorgang_ArchivDir) then
     VerzeichnisproJahr_anlegen(Verz);
  Verz :=  Vorgangsarchiv(cLieferschein, cLIKANBAN);
  if (Verz > '')  and (Verz <> _Vorgang_ArchivDir) then
     VerzeichnisproJahr_anlegen(Verz);
  Verz :=  Vorgangsarchiv(cLieferschein, cLIUmlagerung);
  if (Verz > '')  and (Verz <> _Vorgang_ArchivDir) then
     VerzeichnisproJahr_anlegen(Verz);

  //Rechnung
  Verz :=  Vorgangsarchiv(cRechnung, 0);
  if (Verz > '')  and (Verz <> _Vorgang_ArchivDir) then
     VerzeichnisproJahr_anlegen(Verz);
  //Gutschrift
  Verz :=  Vorgangsarchiv(cGutschrift, 0);
  if (Verz > '')  and (Verz <> _Vorgang_ArchivDir) then
     VerzeichnisproJahr_anlegen(Verz);
  //Stornierung;
  Verz :=  Vorgangsarchiv(cStornierung, 0);
  if (Verz > '')  and (Verz <> _Vorgang_ArchivDir) then
     VerzeichnisproJahr_anlegen(Verz);
  //Bestellung;
  Verz :=  Vorgangsarchiv(cBestellung, 0);
  if (Verz > '')  and (Verz <> _Vorgang_ArchivDir) then
     VerzeichnisproJahr_anlegen(Verz);
  //Bestellanfrage;
  Verz :=  Vorgangsarchiv(cBestellanfrage, 0);
  if (Verz > '')  and (Verz <> _Vorgang_ArchivDir) then
     VerzeichnisproJahr_anlegen(Verz);
  //Wareneingang;
  Verz :=  Vorgangsarchiv(cWareneingang, 0);
  if (Verz > '')  and (Verz <> _Vorgang_ArchivDir) then
     VerzeichnisproJahr_anlegen(Verz);
  Verz :=  Vorgangsarchiv(cWareneingang, cWEUmlagerung);
  if (Verz > '')  and (Verz <> _Vorgang_ArchivDir) then
     VerzeichnisproJahr_anlegen(Verz);
  //Eingangsgutschrift;
  Verz :=  Vorgangsarchiv(cEingangsgutschrift, 0);
  if (Verz > '')  and (Verz <> _Vorgang_ArchivDir) then
     VerzeichnisproJahr_anlegen(Verz);
  //BEStornierung;
  Verz :=  Vorgangsarchiv(cBEStornierung, 0);
  if (Verz > '')  and (Verz <> _Vorgang_ArchivDir) then
     VerzeichnisproJahr_anlegen(Verz);
  //Preisdifferenz;
  Verz :=  Vorgangsarchiv(cPreisdifferenz, 0);
  if (Verz > '')  and (Verz <> _Vorgang_ArchivDir) then
     VerzeichnisproJahr_anlegen(Verz);
  //Serienvorgang;
  Verz :=  Vorgangsarchiv(cSerienvorgang, 0);
  if (Verz > '')  and (Verz <> _Vorgang_ArchivDir) then
     VerzeichnisproJahr_anlegen(Verz);
  //ProformaRE;
  Verz :=  Vorgangsarchiv(cProformaRE, 0);
  if (Verz > '')  and (Verz <> _Vorgang_ArchivDir) then
     VerzeichnisproJahr_anlegen(Verz);
  //Warenruecknahme;
  Verz :=  Vorgangsarchiv(cWarenruecknahme, 0);
  if (Verz > '')  and (Verz <> _Vorgang_ArchivDir) then
     VerzeichnisproJahr_anlegen(Verz);
  //Rahmenbestellung;
  Verz :=  Vorgangsarchiv(cRahmenbestellung, 0);
  if (Verz > '')  and (Verz <> _Vorgang_ArchivDir) then
     VerzeichnisproJahr_anlegen(Verz);
  //Rahmenauftrag;
  Verz :=  Vorgangsarchiv(cRahmenauftrag, 0);
  if (Verz > '')  and (Verz <> _Vorgang_ArchivDir) then
     VerzeichnisproJahr_anlegen(Verz);
  //Eingangsrechnung;
  Verz :=  Vorgangsarchiv(cEingangsrechnung, 0);
  if (Verz > '')  and (Verz <> _Vorgang_ArchivDir) then
     VerzeichnisproJahr_anlegen(Verz);
  //Ruecklieferung;
  Verz :=  Vorgangsarchiv(cRuecklieferung, 0);
  if (Verz > '')  and (Verz <> _Vorgang_ArchivDir) then
     VerzeichnisproJahr_anlegen(Verz);
  //Fertigungsauftrag;
  Verz :=  Vorgangsarchiv(cFertigungsauftrag, 0);
  if (Verz > '')  and (Verz <> _Vorgang_ArchivDir) then
     VerzeichnisproJahr_anlegen(Verz);
  //Rueckmeldung;
  Verz :=  Vorgangsarchiv(cRueckmeldung, 0);
  if (Verz > '')  and (Verz <> _Vorgang_ArchivDir) then
     VerzeichnisproJahr_anlegen(Verz);
  //Pruefauftrag;
  Verz :=  Vorgangsarchiv(cPruefauftrag, 0);
  if (Verz > '')  and (Verz <> _Vorgang_ArchivDir) then
     VerzeichnisproJahr_anlegen(Verz);
end;

procedure TStammdaten.VerzeichnisproJahr_anlegen(const aDir: string);
var
  BelegDir: string;
begin
  BelegDir := aDir + '\' + IntToStr(YearOf(now));
  if (Tnf.GetInstance.System.DirExist(BelegDir) < 0) then
     ForceDirectories(BelegDir);
end;

function TStammdaten.Vorgangsarchiv(aVoArt, aVoSubart: Integer): string;
var
  VoArten: TVoArten;
begin
  Result := Vorgang_ArchivDir;
  VoArten := TVOArten.Create(nil, aVoArt, aVoSubart, Self, getTransaction);
  if (Trim(VoArten.Archivpfad) > '') and (Tnf.GetInstance.System.DirExist(VoArten.Archivpfad) >= 0) then
    Result := VoArten.Archivpfad;
  FreeAndNil(VoArten);
  if Result > '' then
    Result := IncludeTrailingPathDelimiter(Result);
end;

procedure TStammdaten.saveToDB;
//var
//  Reg: TRegistry;
begin

  if not Update then
    exit;

  saveToQuery;

  // Easylog-Unterstützung
  {
  Reg := TRegistry.create;
  Reg.RootKey := HKEY_CURRENT_USER;
  Reg.OpenKey('Software\ASS\OPTIMA', true);
  if Easylog then
    Reg.WriteString('Easylog', 'true')
  else
    Reg.WriteString('Easylog', 'false');
  Reg.CloseKey;
  Reg.Free;
  }
  Update := false;

end;

procedure TStammdaten.saveToQuery;
var
  WriteQuery: TIBQuery;
  WasOpen: boolean;
begin

  WasOpen := IBT.InTransaction;

  if not WasOpen then
    IBT.StartTransaction;

  WriteQuery := TIBQuery.create(self);
  WriteQuery.Transaction := IBT;
  // WriteQuery.Database := IBT.DefaultDatabase;

  with WriteQuery do
  begin

    SQL.Clear;

    SQL.Add('UPDATE STAMMDATEN SET ' + 'ST_KEINRABATTBEISPEZPREIS = :KeinRabattBeiSpezPreis, ' +
      'ST_MAHNZAFRIST = :ST_MAHNZAFRIST, ' + 'ST_REPORTDIR = :ST_REPORTDIR, ' + 'ST_FAXPFAD = :ST_FAXPFAD, ' +
      'ST_LEERGUTID = :ST_LEERGUTID, ' + 'ST_TAGETEIL = :ST_TAGETEIL, ' + 'ST_IMAGEDIR = :ST_IMAGEDIR, ' +
      'ST_DOKUDIR = :ST_DOKUDIR, ' + 'ST_ZNETTOTAGE = :ST_ZNETTOTAGE, ' + 'ST_ZSKONTOTAGE = :ST_ZSKONTOTAGE, ' +
      'ST_ZSKONTO = :ST_ZSKONTO, ' + 'ST_DYNID = :ST_DYNID, ' + 'ST_SMUSER = :ST_SMUSER, ' + 'ST_SMPASS = :ST_SMPASS, ' +
      'ST_SMHOST = :ST_SMHOST, ' + 'ST_SMFROMNAME = :ST_SMFROMNAME, ' + 'ST_SMFROMADDRESS = :ST_SMFROMADDRESS, ' +
      'ST_RMAMITARBEITER = :ST_RMAMITARBEITER, ' + 'ST_MAHNZINS = :ST_MAHNZINS, ' +
      'ST_MAHNGEB_STUFE1 = :ST_MAHNGEB_STUFE1, ' + 'ST_MAHNGEB_STUFE2 = :ST_MAHNGEB_STUFE2, ' +
      'ST_MAHNGEB_STUFE3 = :ST_MAHNGEB_STUFE3, ' + 'ST_MAHNGEB_STUFE4 = :ST_MAHNGEB_STUFE4, ' +
      'ST_NUMFORMAT = :ST_NUMFORMAT, ' + 'ST_EASYLOGDIR = :ST_EASYLOGDIR, ' + 'ST_MANDANTNAME = :ST_MANDANTNAME, ' +
      'ST_RECOVERY = :ST_RECOVERY, ' + 'ST_SBFARBESTART = :ST_SBFARBESTART, ' + 'ST_SBFARBEENDE = :ST_SBFARBEENDE, ' +
      'ST_DP_VORAUSVERF = :ST_DP_VORAUSVERF, ' + 'ST_DP_ABSMEMO = :ST_DP_ABSMEMO, ' + 'ST_DP_IDENTCODE = :ST_DP_IDENTCODE, '
      + 'ST_DP_ABSKURZ = :ST_DP_ABSKURZ, ' + 'ST_DP_BANK = :ST_DP_BANK, ' + 'ST_DP_BLZ = :ST_DP_BLZ, ' +
      'ST_DP_KTO = :ST_DP_KTO, ' + 'ST_DP_NNAUFSCHLAG = :ST_DP_NNAUFSCHLAG, ' + 'ST_DP_KENNUNG = :ST_DP_KENNUNG, ' +
      'ST_DP_KDNUMMER = :ST_DP_KDNUMMER, ' + 'ST_DP_ERMAESSIGUNG = :ST_DP_ERMAESSIGUNG, ' +
      'ST_DP_KENNUNG_INTER = :ST_DP_KENNUNG_INTER, ' + 'ST_FIBUMITARBEITER = :ST_FIBUMITARBEITER, ' +
      'ST_JOUNALEXPORT = :ST_JOUNALEXPORT, ' + 'ST_NULLPOS = :ST_NULLPOS, ' + 'ST_UPDATE = :ST_UPDATE, ' +
      'ST_STDZAHLART = :ST_STDZAHLART, ' + 'ST_STDVERSAND = :ST_STDVERSAND, ' + 'ST_STDBRIEFANREDE = :ST_STDBRIEFANREDE, ' +
      'ST_LOCKSERVERIP = :ST_LOCKSERVERIP, ' + 'ST_DELETE = :ST_DELETE, ' + 'ST_VERSANDPAUSE = :ST_VERSANDPAUSE, ' +
      'ST_DI_KOS_INL = :ST_DI_KOS_INL, ' + 'ST_DI_KOS_AUS = :ST_DI_KOS_AUS, ' + 'ST_DI_KOS_EUA = :ST_DI_KOS_EUA, ' +
      'ST_DI_ERL_EUA = :ST_DI_ERL_EUA, ' + 'ST_DI_ERL_AUS = :ST_DI_ERL_AUS, ' + 'ST_DI_ERL_INL = :ST_DI_ERL_INL, ' +
      'ST_DI_KOS_EUID = :ST_DI_KOS_EUID, ' + 'ST_DI_ERL_EUID = :ST_DI_ERL_EUID, ' + 'ST_INKASSOMAHNST = :ST_INKASSOMAHNST, '
      + 'ST_INKASSOTAGE = :ST_INKASSOTAGE, ' + 'ST_INKASSOABSTAND = :ST_INKASSOABSTAND, ' +
      'ST_RMA_GUBANKZAHLART = :ST_RMA_GUBANKZAHLART, ' + 'ST_RMA_GUKONTOZAHLART = :ST_RMA_GUKONTOZAHLART, ' +
      'ST_EINSTELLUNGEN = :ST_EINSTELLUNGEN, ' + 'ST_UEBERGABELISTE = :ST_UEBERGABELISTE, ' +
      'ST_ANFAHRTSART = :ST_ANFAHRTSART, ' + 'ST_AR_PAUSCHALBETRAG = :ST_AR_PAUSCHALBETRAG, ' +
      'ST_AR_ENTFERNUNG = :ST_AR_ENTFERNUNG, ' + 'ST_AR_ANFAHRTSZEIT = :ST_AR_ANFAHRTSZEIT, ' +
      'ST_ABRECHNUNGSZEIT = :ST_ABRECHNUNGSZEIT, ' + 'ST_ABRECHNUNGSZEIT_FK = :ST_ABRECHNUNGSZEIT_FK, ' +
      'ST_MAHNGRENZE = :ST_MAHNGRENZE, ' + 'ST_CHMENGE = :ST_CHMENGE, ' + 'ST_CHENDE = :ST_CHENDE, ' +
      'ST_SCANMODE = :ST_SCANMODE, ' + 'ST_SCANOK = :ST_SCANOK, ' + 'ST_SCANABBR = :ST_SCANABBR, ' +
      'ST_PLANETSHOP = :ST_PLANETSHOP, ' + 'ST_PROVDATUM = :ST_PROVDATUM, ' + 'ST_KOND_NETTO = :ST_KOND_NETTO, ' +
      'ST_KOND_NETTOT = :ST_KOND_NETTOT, ' + 'ST_KOND_SKONTOT = :ST_KOND_SKONTOT, ' + 'ST_KOND_SKONTO = :ST_KOND_SKONTO, ' +
      'ST_REKOND_NETTO = :ST_REKOND_NETTO, ' + 'ST_REKOND_NETTOT = :ST_REKOND_NETTOT, ' +
      'ST_REKOND_SKONTOT = :ST_REKOND_SKONTOT, ' + 'ST_REKOND_SKONTO = :ST_REKOND_SKONTO, ' +
      'ST_KU_KREDITLIMIT = :ST_KU_KREDITLIMIT, ' + 'ST_LT_KREDITLIMIT = :ST_LT_KREDITLIMIT, ' +
      'ST_VERSANDMO = :ST_VERSANDMO, ' + 'ST_VERSANDDI = :ST_VERSANDDI, ' + 'ST_VERSANDMI = :ST_VERSANDMI, ' +
      'ST_VERSANDDO = :ST_VERSANDDO, ' + 'ST_VERSANDFR = :ST_VERSANDFR, ' + 'ST_VERSANDSA = :ST_VERSANDSA, ' +
      'ST_VERSANDSO = :ST_VERSANDSO, ' + 'ST_FAXFRKU = :ST_FAXFRKU, ' + 'ST_FAXVERSKU = :ST_FAXVERSKU, ' +
      'ST_FAXVERSVE = :ST_FAXVERSVE, ' + 'ST_MAILFRKU = :ST_MAILFRKU, ' + 'ST_MAILVERSKU = :ST_MAILVERSKU, ' +
      'ST_DRUCKFRKU = :ST_DRUCKFRKU, ' + 'ST_FAXTEILLIEFERUNG = :ST_FAXTEILLIEFERUNG, ' +
      'ST_KPAENDERUNG = :ST_KPAENDERUNG, ' + 'ST_SNZWINGEND = :ST_SNZWINGEND, ' +
      'ST_SNZWINGEND_RAUS = :ST_SNZWINGEND_RAUS, ' + 'ST_SNZWINGEND_RAUS_WE = :ST_SNZWINGEND_RAUS_WE, ' +
      'ST_SNNEUWE = :ST_SNNEUWE, ' + 'ST_SNSCANVERSAND = :ST_SNSCANVERSAND, ' + 'ST_SAVE_PW = :ST_SAVE_PW, ' +
      'ST_DRUCKEPBS = :ST_DRUCKEPBS, ' + 'ST_KOMM_ID = :ST_KOMM_ID, ' + 'ST_NAVIMPORTDIR  = :ST_NAVIMPORTDIR, ' +
      'ST_NAVEXPORTDIR  = :ST_NAVEXPORTDIR, ' + 'ST_NAVIMPORTBACK = :ST_NAVIMPORTBACK, ' +
      'ST_NAVEXPORTBACk = :ST_NAVEXPORTBACK, ' + 'ST_EDIDIR = :ST_EDIDIR, ' + 'ST_EDIIMPORTDIR = :ST_EDIIMPORTDIR, ' +
      'ST_EDINAME = :ST_EDINAME, ' + 'ST_EDIMA_ID = :ST_EDIMA_ID, ' + 'ST_EDILA_ID = :ST_EDILA_ID, ' +
      'ST_EDIVFENSTER = :ST_EDIVFENSTER, ' + 'ST_EDIGB_ID = :ST_EDIGB_ID, ' + 'ST_ILN = :ST_ILN, ' +
      'ST_ANMEMO_FIRMA = :ST_ANMEMO_FIRMA, ' + 'ST_ANMEMO_PERSON = :ST_ANMEMO_PERSON, ' +
      'ST_ANMEMO_FIRMA_PF = :ST_ANMEMO_FIRMA_PF, ' + 'ST_ANMEMO_PERSON_PF = :ST_ANMEMO_PERSON_PF, ' +
      'ST_ANMEMO_FIRMA_LIEF = :ST_ANMEMO_FIRMA_LIEF, ' + 'ST_ANMEMO_PERSON_LIEF = :ST_ANMEMO_PERSON_LIEF, ' +
      'ST_MB_TAGE = :ST_MB_TAGE, ' + 'ST_MB_GRENZE = :ST_MB_GRENZE, ' + 'ST_LIAUTOVERSAND = :ST_LIAUTOVERSAND, ' +
      'ST_INKASSOABFRAGE = :ST_INKASSOABFRAGE, ' + 'ST_PREISKG = :ST_PREISKG, ' + 'ST_PREISKG_ID = :ST_PREISKG_ID, ' +
      'ST_KOMMSCHEIN_FREIGABE = :ST_KOMMSCHEIN_FREIGABE, ' + 'ST_VO_SACHB_UEBERSCHR = :ST_VO_SACHB_UEBERSCHR, ' +
      'ST_KONTORREMEMO = :ST_KONTORREMEMO, ' + 'ST_NULLEUROWARNUNG = :ST_NULLEUROWARNUNG, ' +
      'ST_VOARTINGRID = :ST_VOARTINGRID, ' + 'ST_PKONTENAUTO = :ST_PKONTENAUTO, ' + 'ST_LT_PKONTENAUTO = :KredKontenAuto, ' +
      'ST_EIGENEOPVERWALTUNG = :ST_EIGENEOPVERWALTUNG, ' + 'ST_SRTEXTIMMER = :ST_SRTEXTIMMER, ' +
      'ST_STDTEILLIEFERV = :ST_STDTEILLIEFERV, ' + 'ST_VERBUCHENNACHTAGEN = :ST_VERBUCHENNACHTAGEN, ' +
      'ST_KUNDENPLZVERTRETER = :ST_KUNDENPLZVERTRETER, ' + 'ST_RABATTUEBERSCHREIBEN = :ST_RABATTUEBERSCHREIBEN, ' +
      'ST_DPD_ROUTENVER = :ST_DPD_ROUTENVER, ' + 'ST_DPD_DEPOTKENNUNG = :ST_DPD_DEPOTKENNUNG, ' +
      'ST_DPD_KUNDENNR = :ST_DPD_KUNDENNR, ' + 'ST_DPD_ABSMEMO = :ST_DPD_ABSMEMO, ' + 'ST_DPD_BANK = :ST_DPD_BANK, ' +
      'ST_DPD_BLZ = :ST_DPD_BLZ, ' + 'ST_DPD_KTO = :ST_DPD_KTO, ' + 'ST_DPD_NNAUFSCHLAG = :ST_DPD_NNAUFSCHLAG, ' +
      'ST_DPD_DEPOTADRESSE = :ST_DPD_DEPOTADRESSE, ' + 'ST_DPD_DEPOT_TEL = :ST_DPD_DEPOT_TEL, ' +
      'ST_DPD_DEPOT_FAX = :ST_DPD_DEPOT_FAX, ' + 'ST_RISIKO_CHECK = :ST_RISIKO_CHECK, ' + 'ST_USTID = :ST_USTID, ' +
      'ST_NACHKOMMADRUCK = :ST_NACHKOMMADRUCK, ' + 'ST_RISIKO_CHECK_COUNT = :ST_RISIKO_CHECK_COUNT, ' +
      'ST_VOSPERREBEIGEDRUCKT = :ST_VOSPERREBEIGEDRUCKT, ' + 'ST_BUDGETKG = :ST_BUDGETKG, ' + 'ST_WELAGER = :ST_WELAGER, ' +
      'ST_WEPLATZ = :ST_WEPLATZ, ' + 'ST_PRINTPARAMS = :ST_PRINTPARAMS, ' + 'ST_KUSUCHE_ERWEITERT = :ST_KUSUCHE_ERWEITERT, '
      + 'ST_SPERRE_INKASSO = :ST_SPERRE_INKASSO, ' + 'ST_PORTO_SKONTIERBAR = :ST_PORTO_SKONTIERBAR, ' +
      'ST_SAMMELRE_PORTO = :ST_SAMMELRE_PORTO, ' + 'ST_CHECKSPERRE = :ST_CHECKSPERRE, ' +
      'ST_DATEVKONTEN = :ST_DATEVKONTEN, ' + 'ST_NVEERFASSEN = :ST_NVEERFASSEN, ' + 'ST_TICKETARTIKEL = :ST_TICKETARTIKEL, '
      + 'ST_VERDICHTUNG_DEB = :ST_VERDICHTUNG_DEB, ' + 'ST_VERDICHTUNG_KRED = :ST_VERDICHTUNG_KRED, ' +
      'ST_MWST_VOLL_1 = :ST_MWST_VOLL_1, ' + 'ST_MWST_VERMINDERT_1 = :ST_MWST_VERMINDERT_1, ' +
      'ST_MWST_VOLL_2 = :ST_MWST_VOLL_2, ' + 'ST_MWST_VERMINDERT_2 = :ST_MWST_VERMINDERT_2, ' +
      'ST_MWST_STICHTAG = :ST_MWST_STICHTAG, ' + 'ST_WAHRENGRP = :Warengrp, ' + 'ST_UMSATZPROVISION = :Umsatzprovision, ' +
      'ST_AR_VK_ANZEIGEN = :ST_AR_VK_ANZEIGEN, ' + 'ST_AR_VK_ANZEIGEN_KG = :ST_AR_VK_ANZEIGEN_KG, ' +
      'ST_RESMENGESOFORT = :ST_RESMENGESOFORT, ' + 'ST_SERVICE_PO_ID = :ST_SERVICE_PO_ID, ' +
      'ST_WAEHRUNGSZEICHEN = :Waehrungszeichen, ' + 'ST_DRUCKERSYNCHRON = :DruckerAuswahlSynchron, ' +
      'ST_SKONTOVONPROV = :SkontoVonProv, ' + 'ST_WIEDERVORLAGE = :Wiedervorlage, ' +
      'ST_ZEITFENSTERIG = :ZeitfensterIgnorieren, ' + 'ST_AU_BEZUGSDATEN = :AU_Bezugsdaten, ' +
      'ST_AU_BESCHREIBUNG = :AU_Beschreibung, ' + 'ST_AU_BERICHT = :AU_Bericht, ' + 'ST_AU_ART = :AU_Art, ' +
      'ST_AU_UNTERART = :AU_Unterart, ' + 'ST_AU_ANFORDERUNG = :AU_Anforderung, ' +
      'ST_ERWEITERTEADRESSE = :ErweiterteAdressdaten, ' + 'ST_FB_POP3_SERVER = :FB_POP3_Server, ' +
      'ST_FB_POP3_BENUTZER = :FB_POP3_Benutzer, ' + 'ST_FB_POP3_PASSWORT = :FB_POP3_Passwort, ' +
      'ST_FB_POP3_MAIL = :FB_POP3_MAIL, ' + 'ST_KUNDENFORMULARE = :Kundenformulare, ' +
      'ST_LIEFERTAGE = :DefaultLiefertage, ' + 'ST_KW_DATUM = :KW_Datum, ' + 'ST_KU_SPERRSTATUS = :KuSperrstatus, ' +
      'ST_UEBERSICHTAS = :UebersichtAnsprechpartner, ' + 'ST_NACHKOMMAPOS = :NachkommaPos, ' +
      'ST_NACHKOMMAEINZELNPREIS = :NachkommaEinzelnpreis , ' + 'ST_NACHKOMMAMENGE = :NachkommaMenge, ' +
      'ST_FREITEXT = :FreiText, ' + 'ST_BILDERALLE = :BilderAlle, ' + 'ST_VORGANGNETTOSUMME = :VorgangNettoSumme, ' +
      'ST_ARTIKELEXTERNVKALLE = :ArtikelExternVKAlle, ' + 'ST_ZERTIFIKAT = :Zertifikat, ' +
      'ST_VORGANGSSPALTEN = :Vorgangsspalten, ST_KUNDENNUMMER = :Kundennummer, ' +
      // 'ST_ARTIKELSPALTEN = :Artikelspalten, ' +
      'ST_KEINRABATTBEISA = :KeinRabattBeiSa, ' + 'st_vo_forfuehrstatus = :Vo_status_beimFortfuehren, ' +
      'st_vo_kopiestatus = :Vo_status_beimKopieren, ' + 'ST_RE_FORFUEHRSTATUS = :Vo_status_inRE_Fortfuehren, ' +
      'ST_ER_FORFUEHRSTATUS = :Vo_status_inER_Fortfuehren, ' + 'st_genr_auswahl = :GENR_Auswahl, ' +
      'ST_UPS_WARENBESCHR = :UPS_Warenbeschreibung, ' + 'ST_UPS_KUNR = :UPS_KUNR, ' +
      'ST_UPS_VERZEICHNIS = :UPS_Verzeichnis, ' + 'ST_UPS_TELEFON = :UPS_Telefon, ' +
      'ST_ZahlungBeiOPNrNull = :ZahlungBeiOPNrNull, ' + 'St_karenzZuFaelligkeit = :karenzZuFaelligkeit, ' +
      'ST_RE_GETRENNT = :Rechnunggetrennt, ' + 'ST_CHARGENVERZEICHNIS = :Chargenverzeichnis, ' +
      'ST_FAXVERSAND = :Faxversand, ' + 'ST_FAX_SOFORT = :Faxsofort, ' + 'ST_KUNDENSUCHSPALTEN = :Kundensuchspalten, ' +
      'ST_LIEF_NICHTFORTFUEREN = :Lief_nichtfortfueren, ' + 'ST_GERAETEARTIKELNR = :GeraeteArtikelnr, ' +
      'ST_SERVICELIEFERSCHEIN = :ServiceLieferschein, ' + 'ST_PICKLISTENDRUCKEN = :Picklistendrucken, ' +
      'ST_CHARGENINPACKLISTE = :ChargenInPackliste, ' + 'ST_SERVICEGRUPPIEREN = :ServiceGruppieren, ' +
      'ST_KU_NOTIZEN = :KU_Notizen, ' + 'ST_LT_NOTIZEN = :LT_Notizen, ' + 'ST_DRUCKELANGTEXT = :DruckeLangText, ' +
      'ST_DRUCKELANGTEXT_KRED = :DruckeLangTextKreditor, ' + 'ST_GERAETAUTOMATISCH = :GeraetAutomatisch, ' +
      'ST_VO_VERSANDBIS = :VOVersandBisTage, ' + 'ST_SNFENSTER_ZEIGEN = :SNFensternichtzeigen, ' +
      'ST_VERSAND_ALLEPOS = :Versand_allePos, ' + 'ST_KU_DEBNR_GLEICH = :KuDebNr_gleich, ' +
      'ST_LT_KREDNR_GLEICH = :LTKredNr_gleich, ' + 'ST_PROV_DECKUNGSSATZ = :ProvDecksatzbeachten, ' +
      'ST_FIBU_HOST = :FibuHost, ' + 'ST_FIBU_USER = :FibuUser, ' + 'ST_FIBU_PASS = :FibuPass, ' +
      'ST_MYSQL_LOWERCASE = :MySqlLowerCase, ' + 'ST_MYSQL_UTF8 = :MySqlUtf8, ' +
      'ST_VOSUCHDATUM_VON = :VoSuche_vondatum, ' + 'ST_USEVORGANGLIEFER = :UseVorgangLiefertermin, ' +
      'ST_DRUCKDATEN_FTP = :DruckdatenFTP, ' + 'ST_DRUCKDATEN_FTP_USER = :DruckdatenFTPUser, ' +
      'ST_DRUCKDATEN_FTP_PASS = :DruckdatenFTPPass, ST_DRUCKDATEN_BASEURL = :DruckdatenBaseUrl, ST_VERSANDFREI = :VersandFrei, ' +
      'ST_ART_FUER_NEUEN_VORGANG = :Art_fuer_neuen_vorgang, ' + 'ST_MAHNZINSEN_IMMER_BERECHNEN =:Mahnzinsen_immerberechnen, '
      + 'ST_ARNR_DOPPELT_PRUEFEN =:ArNr_doppelt_pruefen, ' + 'ST_DOPPELTE_KUNM_ERLAUB = :Doppelte_Kunr_erlauben, ' +
      'ST_DOPPELTE_LTNR_ERLAUBT = :Doppelte_LTnr_erlauben, ' + 'ST_DEBNR_VON = :DebNr_Von , ' +
      'ST_DEBNR_BIS = :DebNr_BIS , ' + 'ST_DEB_VERGABEART = :Deb_Vergabeart, ' + 'ST_KREDNR_VON = :KredNr_Von, ' +
      'ST_KREDNR_BIS = :KredNr_Bis, ' + 'ST_KRED_VERGABEART = :Kred_Vergabeart, ' +
      'ST_INVENTUR_NUL_BUCHEN = :Inventur_Nul_buchen, ' + 'ST_PREISRUNDEN = :Preis_Runden, ' +
      'st_ar_bemerkungzeigen =:ArBemerkung_zeigen, ' + 'ST_VOSUCHANZAHL_TAGE = :VoSuche_Anzahltage, ' +
      'ST_REFNR_DUBLETTENPRUEFUNG = :RefNr_Dubblettenpruefung, ' +
      'ST_AUNUMMER_IN_BEORDERNUMMER = :AuNummer_in_BEordernummer, ' +
      'ST_BEIMFORTFUEHRENEK_NEULESEN = :EK_beimfortfuehren_neulesen, ' +
      'ST_CHARGEN_NACH_FIFO_ZUORDNEN = :ChargenNach_FIFO_zuordnen, ' +
      'ST_FORTF_ULI_RE_ERSTELLEN = :Fortfuehren_ULI_RE_erstellen, ' + 'ST_ADDISON_USER = :AddisonUser, ' +
      'ST_ADDISON_PASS = :AddisonPass, ' + 'ST_VO_BEI_FREIGABE_MA_UBERSCREI = :Bei_freigabe_MA_ueberschreiben, ' +
      'ST_GLEUBIGER_ID = :GleubigerID, ' + 'ST_ARTNRGEN = :artikelnrgen, ' + 'ST_MBWERT = :MBWert, ' +
      'ST_MBWERTTEXT = :MBWerttext, ' + 'ST_MBWARENGRP = :MBWarengrp, ' + 'ST_ARTNRFORMAT = :artnrformat, ' +
      'ST_MASSARTIKELFORMAT = :massartikelformat, ' + 'ST_FP_DIR_VORGANG = :FP_Dir_Vorgang, ' +
      'ST_FP_DIR_AUSWERTUNG = :FP_Dir_Auswertung, ' + 'ST_MITARBEITER_TICKETSYSTEM = :MitarbeiterTicketsystem, ' +
      'ST_GRUPPEMA_TICKETSYSTEM = :GruppeMaTicketsystem, ' + 'ST_GRUPPE_TICKETSYSTEM = :GruppeTicketsystem, ' +
      'ST_PRIO_TICKET = :PrioNeueTickets, ' + 'ST_MANDAT_KRITERIEN = :Mandat_verfuegbar_kriterien, ' +
      'ST_MANDAT_WARNUNGSZEIT = :Mandat_warnungszeit, ' + 'ST_MANDAT_ERINNERUNGSZEIT = :Mandat_erinnerungszeit, ' +
      'ST_AUTO_IN_KOPIERTER_VORGANG = :Auto_In_Kopierter_Vorgang, ' + 'ST_GBSUCHE_ALLE = :GBSUCHE_ALLE, ' +
      'ST_NOTIFICATIONART = :Notificationart, ' + 'ST_NOTIFICATIONZEIT = :Notificationzeit, ' +
      'ST_MANDAT_WV_ERSTELLEN = :Mandat_Wiedervorlage_erstellen, ' + 'ST_KUNDESOFORTFREIGEBEN = :KundeSofortFreigeben, ' +
      'ST_VO_PORTO_DEAKTIVIEREN = :Vorgang_Portodeaktivieren, ' + 'ST_LANDKUERZEL_USTID = :Landkuerzel_fuerUSTID, ' +
      'ST_TICKET_ABRECHNEN = :Ticketabrechnen, ' + 'ST_VO_SUCHE_STATUS = :VO_SUCHE_STATUS, ' +
      'ST_TICKET_KUZEIGEN = :Ticket_Kumatchzeigen, ' + 'ST_TICKET_KU_LAENGE = :Ticket_KUmatch_laenge, ' +
      'ST_AUINBE_BESTAND_PRUEFEN = :AuINBE_Bestandpruefen, ' + 'ST_TRANSPORTVERS_PROZ = :Transportvers_Proz, ' +
      'ST_TRANSPORTVERS_VERWENDEN = :Transportvers_Verwenden, ' +
      'ST_BESTELLUNG_AUTOM_FREIGEBEN = :Bestellung_autom_Freigeben, ' + 'ST_FARBE_FREIGABE_H = :Farbe_Freigabe_H, ' +
      'ST_FARBE_FREIGABE_T = :Farbe_Freigabe_T, ST_EINGANGSBELEGFORMAT =:Eingangsbelegformat, ' +
      'ST_EINGBELEG_IMPORTDIR = :Eingangsbeleg_ImportDir, ST_EINGBELEG_EXPORTDIR =:Eingangsbeleg_ExportDir, ' +
      'ST_ARCHIVDIR =:Vorgang_ArchivDir, ST_EASYLOG = :Easylog, ST_VO_BEMERKUNGZEIGEN = :VO_BEMERKUNGZEIGEN, ST_RABATT2ANZEIGEN = :Rabatt2Anzeigen, ' +
      'ST_RECHNUNG_PER_EMAIL = :Rechnung_per_Mail, ST_REISENUMMERFORMAT = :Reisenummerformat ' + '');


    ParamByName('Ticket_KUmatch_laenge').AsInteger := Ticket_KUmatch_laenge;
    ParamByName('Ticket_Kumatchzeigen').AsString := BoolToStr(Ticket_Kumatchzeigen);
    ParamByName('VO_SUCHE_STATUS').AsInteger := VO_Suche_Status;
    ParamByName('Ticketabrechnen').AsString := BoolToStr(Ticketabrechnen);
    ParamByName('Landkuerzel_fuerUSTID').AsString := copy(Trim(Landkuerzel_fuerUSTID), 1, 2);
    ParamByName('Vorgang_Portodeaktivieren').AsString := BoolToStr(Vorgang_Portodeaktivieren);
    ParamByName('GleubigerID').AsString := Trim(GleubigerID);
    ParamByName('Bei_freigabe_MA_ueberschreiben').AsString := BoolToStr(Bei_freigabe_MA_ueberschreiben);
    ParamByName('Fortfuehren_ULI_RE_erstellen').AsString := BoolToStr(Fortfuehren_ULI_RE_erstellen);
    ParamByName('ChargenNach_FIFO_zuordnen').AsString := BoolToStr(ChargenNach_FIFO_zuordnen);
    ParamByName('EK_beimfortfuehren_neulesen').AsString := BoolToStr(EK_beimfortfuehren_neulesen);
    ParamByName('VoSuche_Anzahltage').AsInteger := VoSuche_Anzahltage;
    ParamByName('ArBemerkung_zeigen').AsString := BoolToStr(ArBemerkung_zeigen);
    ParamByName('VO_BEMERKUNGZEIGEN').AsString := BoolToStr(_VoBemerkungZeigen);
    ParamByName('Rabatt2Anzeigen').AsString := BoolToStr(_Rabatt2Anzeigen);
    ParamByName('Mahnzinsen_immerberechnen').AsString := BoolToStr(Mahnzinsen_immerberechnen);
    ParamByName('VOVersandBisTage').AsInteger := VOVersandBisTage;
    ParamByName('GeraetAutomatisch').AsInteger := GeraetAutomatisch;
    ParamByName('GENR_Auswahl').AsInteger := GENR_Auswahl;
    ParamByName('Vo_status_beimFortfuehren').AsInteger := Vo_status_beimFortfuehren;
    ParamByName('Vo_status_beimKopieren').AsInteger := Vo_status_beimKopieren;
    ParamByName('Vo_status_inRE_Fortfuehren').AsInteger := Vo_status_inRE_Fortfuehren;
    ParamByName('Vo_status_inER_Fortfuehren').AsInteger := Vo_status_inER_Fortfuehren;
    ParamByName('KuSperrstatus').AsInteger := KuSperrstatus;
    ParamByName('AU_Anforderung').AsInteger := AU_Anforderung;
    ParamByName('AU_Art').AsInteger := AU_Art;
    ParamByName('AU_Unterart').AsInteger := AU_Unterart;
    ParamByName('AU_Bezugsdaten').AsString := AU_Bezugsdaten;
    ParamByName('AU_Beschreibung').AsString := AU_Beschreibung;
    ParamByName('AU_Bericht').AsString := AU_Bericht;
    ParamByName('ST_MB_GRENZE').AsFloat := MinBestandGrenze;
    ParamByName('ST_MB_TAGE').AsInteger := MinBestandTage;
    ParamByName('ST_DP_ABSMEMO').AsString := DPAbsender;
    ParamByName('ST_DP_ABSKURZ').AsString := DPAbsenderAbk;
    ParamByName('ST_DP_BANK').AsString := DPBank;
    ParamByName('ST_DP_BLZ').AsString := DPBLZ;
    ParamByName('ST_DP_ERMAESSIGUNG').AsFloat := DPErmaessigung;
    ParamByName('ST_DP_IDENTCODE').AsString := DPIdentCode;
    ParamByName('ST_DP_KTO').AsString := DPKontoNr;
    ParamByName('ST_DP_NNAUFSCHLAG').AsFloat := DPNNAufschlag;
    ParamByName('ST_DP_KENNUNG').AsString := DPKennung;
    ParamByName('ST_DP_KDNUMMER').AsString := DPKundenNr;
    ParamByName('ST_DP_VORAUSVERF').AsString := DPVorausVerfahren;
    ParamByName('ST_DP_KENNUNG_INTER').AsString := DPKennung_inter;
    ParamByName('ST_DYNID').AsInteger := DynamischeID;
    ParamByName('ST_EASYLOGDIR').AsString := EasyLogPfad;
    ParamByName('ST_SBFARBEENDE').AsInteger := FarbeEnde;
    ParamByName('ST_SBFARBESTART').AsInteger := FarbeStart;
    ParamByName('ST_FAXPFAD').AsString := FaxPfad;
    ParamByName('ST_FIBUMITARBEITER').AsString := FibuMitarbeiter;
    ParamByName('ST_IMAGEDIR').AsString := ImageDir;
    ParamByName('ST_DOKUDIR').AsString := DokuDir;
    ParamByName('ST_JOUNALEXPORT').AsString := JournalPfad;
    ParamByName('ST_LEERGUTID').AsInteger := LeergutID;
    ParamByName('ST_LOCKSERVERIP').AsString := LockServerIP;
    ParamByName('ST_MAHNGEB_STUFE1').AsFloat := MahngebuehrStufe1;
    ParamByName('ST_MAHNGEB_STUFE2').AsFloat := MahngebuehrStufe2;
    ParamByName('ST_MAHNGEB_STUFE3').AsFloat := MahngebuehrStufe3;
    ParamByName('ST_MAHNGEB_STUFE4').AsFloat := MahngebuehrStufe4;
    ParamByName('ST_MAHNZINS').AsFloat := Mahnzins;
    ParamByName('ST_MANDANTNAME').AsString := MandantName;
    ParamByName('ST_NULLPOS').AsInteger := NullPosition;
    ParamByName('ST_NUMFORMAT').AsString := NummernFormat;
    ParamByName('ST_RECOVERY').AsString := RecoveryPasswort;
    ParamByName('ST_RMAMITARBEITER').AsString := RMAMitarbeiter;
    ParamByName('ST_SMHOST').AsString := SMHost;
    ParamByName('ST_SMFROMADDRESS').AsString := SMFromAdress;
    ParamByName('ST_SMFROMNAME').AsString := SMFromName;
    ParamByName('ST_SMUSER').AsString := SMUser;
    ParamByName('ST_SMPASS').AsString := SMPass;
    ParamByName('ST_STDVERSAND').AsInteger := StdVersand;
    ParamByName('ST_STDZAHLART').AsInteger := StdZahlart;
    ParamByName('ST_STDBRIEFANREDE').AsString := StdBriefanrede;
    ParamByName('ST_TAGETEIL').AsInteger := TageTeillieferung;
    if Versandpause then
      ParamByName('ST_VERSANDPAUSE').AsString := 'T'
    else
      ParamByName('ST_VERSANDPAUSE').AsString := 'F';
    ParamByName('ST_ZNETTOTAGE').AsInteger := ZNettoTage;
    ParamByName('ST_ZSKONTO').AsFloat := ZSkonto;
    ParamByName('ST_ZSKONTOTAGE').AsInteger := ZSkontoTage;
    ParamByName('ST_INKASSOMAHNST').AsInteger := InkassoMahnstufe;
    ParamByName('ST_INKASSOTAGE').AsInteger := InkassoTage;
    ParamByName('ST_INKASSOABSTAND').AsInteger := InkassoAbstand;
    ParamByName('ST_REPORTDIR').AsString := ReportPfad;
    ParamByName('ST_DELETE').AsString := 'F';
    ParamByName('ST_UPDATE').AsString := 'T';
    if ChargeMenge then
      ParamByName('ST_CHMENGE').AsString := 'T'
    else
      ParamByName('ST_CHMENGE').AsString := 'F';
    if Uebergabeliste then
      ParamByName('ST_UEBERGABELISTE').AsString := 'T'
    else
      ParamByName('ST_UEBERGABELISTE').AsString := 'F';

    if RMA_GUBankZahlart <> nil then
      ParamByName('ST_RMA_GUBANKZAHLART').AsInteger := RMA_GUBankZahlart.getID
    else
      ParamByName('ST_RMA_GUBANKZAHLART').AsInteger := 0;
    if RMA_GUKontoZahlart <> nil then
      ParamByName('ST_RMA_GUKONTOZAHLART').AsInteger := RMA_GUKontoZahlart.getID
    else
      ParamByName('ST_RMA_GUKONTOZAHLART').AsInteger := 0;

    ParamByName('ST_EINSTELLUNGEN').AsString := ServerEinstellungen.Pack;

    ParamByName('ST_DI_KOS_INL').AsInteger := KontoDirektfakturaKostenInland;
    ParamByName('ST_DI_KOS_AUS').AsInteger := KontoDirektfakturaKostenAusland;
    ParamByName('ST_DI_KOS_EUA').AsInteger := KontoDirektfakturaKostenEUAusland;
    ParamByName('ST_DI_KOS_EUID').AsInteger := KontoDirektfakturaKostenEUAuslandUST;
    ParamByName('ST_DI_ERL_INL').AsInteger := KontoDirektfakturaErloesInland;
    ParamByName('ST_DI_ERL_AUS').AsInteger := KontoDirektfakturaErloesAusland;
    ParamByName('ST_DI_ERL_EUA').AsInteger := KontoDirektfakturaErloesEUAusland;
    ParamByName('ST_DI_ERL_EUID').AsInteger := KontoDirektfakturaErloesEUAuslandUST;
    ParamByName('ST_ANFAHRTSART').AsInteger := Anfahrtsart;
    ParamByName('ST_AR_PAUSCHALBETRAG').AsInteger := Pauschalbetrag_kennziffer;
    ParamByName('ST_AR_ENTFERNUNG').AsInteger := Entfernung_kennziffer;
    ParamByName('ST_AR_ANFAHRTSZEIT').AsInteger := Anfahrtszeit_kennziffer;
    ParamByName('ST_ABRECHNUNGSZEIT').AsInteger := Abrechnungszeit;
    if AbrechnungszeitFK then
      ParamByName('ST_ABRECHNUNGSZEIT_FK').AsString := 'T'
    else
      ParamByName('ST_ABRECHNUNGSZEIT_FK').AsString := 'F';
    if PlanetShop then
      ParamByName('ST_PLANETSHOP').AsString := 'T'
    else
      ParamByName('ST_PLANETSHOP').AsString := 'F';
    ParamByName('ST_MAHNGRENZE').AsFloat := Mahngrenze;
    ParamByName('ST_CHENDE').AsString := ChargeEnde;
    ParamByName('ST_SCANOK').AsString := ScanOK;
    ParamByName('ST_SCANABBR').AsString := ScanAbbr;
    ParamByName('ST_SCANMODE').AsString := ScanMode;
    ParamByName('ST_KU_KREDITLIMIT').AsFloat := StdKUKreditLimit;
    ParamByName('ST_LT_KREDITLIMIT').AsFloat := StdLTKreditLimit;
    ParamByName('ST_PROVDATUM').AsInteger := ProvDatum;

    ParamByName('ST_KOND_NETTO').AsString := KondNetto;
    ParamByName('ST_KOND_NETTOT').AsString := KondNettoTage;
    ParamByName('ST_KOND_SKONTOT').AsString := KondSkontoTage;
    ParamByName('ST_KOND_SKONTO').AsString := KondSkonto;
    ParamByName('ST_REKOND_NETTO').AsString := REKondNetto;
    ParamByName('ST_REKOND_NETTOT').AsString := REKondNettoTage;
    ParamByName('ST_REKOND_SKONTOT').AsString := REKondSkontoTage;
    ParamByName('ST_REKOND_SKONTO').AsString := REKondSkonto;

    ParamByName('ST_VERSANDMO').AsString := BoolToStr(VersandMo);
    ParamByName('ST_VERSANDDI').AsString := BoolToStr(VersandDi);
    ParamByName('ST_VERSANDMI').AsString := BoolToStr(VersandMi);
    ParamByName('ST_VERSANDDO').AsString := BoolToStr(VersandDo);
    ParamByName('ST_VERSANDFR').AsString := BoolToStr(VersandFr);
    ParamByName('ST_VERSANDSA').AsString := BoolToStr(VersandSa);
    ParamByName('ST_VERSANDSO').AsString := BoolToStr(VersandSo);

    ParamByName('ST_FAXFRKU').AsString := BoolToStr(FaxFrKu);
    ParamByName('ST_FAXVERSKU').AsString := BoolToStr(FaxVersKu);
    ParamByName('ST_FAXVERSVE').AsString := BoolToStr(FaxVersVe);
    ParamByName('ST_MAILFRKU').AsString := BoolToStr(MailFrKu);
    ParamByName('ST_MAILVERSKU').AsString := BoolToStr(MailVersKu);
    ParamByName('ST_DRUCKFRKU').AsString := BoolToStr(DruckFrKu);
    ParamByName('ST_FAXTEILLIEFERUNG').AsInteger := FaxTeillieferung;

    ParamByName('ST_KPAENDERUNG').AsString := BoolToStr(KeinePreisaenderung);

    ParamByName('ST_SNZWINGEND_RAUS_WE').AsString := BoolToStr(SNzwingend_Raus_WE);
    ParamByName('ST_SNZWINGEND_RAUS').AsString := BoolToStr(SNzwingend_Raus);
    ParamByName('ST_SNZWINGEND').AsString := BoolToStr(SNZwingend);
    ParamByName('ST_SNNEUWE').AsString := BoolToStr(SNNeuBeiWE);
    ParamByName('ST_SNSCANVERSAND').AsString := BoolToStr(SNScanbeiVersand);

    ParamByName('ST_SAVE_PW').AsString := BoolToStr(SavePasswords);
    ParamByName('ST_DRUCKEPBS').AsString := BoolToStr(DruckePBS);
    ParamByName('ST_KOMM_ID').AsInteger := KommFormular;
    ParamByName('ST_NAVEXPORTDIR').AsString := NavExportDir;
    ParamByName('ST_NAVIMPORTDIR').AsString := NavImportDir;
    ParamByName('ST_NAVEXPORTBACK').AsString := NavExportBack;
    ParamByName('ST_NAVIMPORTBACK').AsString := NavImportBack;
    ParamByName('ST_ANMEMO_FIRMA').AsString := AnMemoFirma;
    ParamByName('ST_ANMEMO_PERSON').AsString := AnMemoPrivat;
    ParamByName('ST_ANMEMO_FIRMA_PF').AsString := AnMemoFirmaPf;
    ParamByName('ST_ANMEMO_PERSON_PF').AsString := AnMemoPrivatPf;
    ParamByName('ST_ANMEMO_FIRMA_LIEF').AsString := AnMemoFirmaLI;
    ParamByName('ST_ANMEMO_PERSON_LIEF').AsString := AnMemoPrivatLI;
    ParamByName('ST_EDIDIR').AsString := EDIDir;
    ParamByName('ST_EDIIMPORTDIR').AsString := EDIImportDir;
    ParamByName('ST_EDINAME').AsString := EDIName;
    ParamByName('ST_EDIMA_ID').AsInteger := EDIMitarbeiterID;
    ParamByName('ST_EDILA_ID').AsInteger := EDILager;
    ParamByName('ST_EDIVFENSTER').AsInteger := EDIVersandfenster;
    ParamByName('ST_EDIGB_ID').AsInteger := EDIGeschaeftsbereich;
    ParamByName('ST_ILN').AsString := ILN;
    ParamByName('ST_LIAUTOVERSAND').AsString := BoolToStr(LIAutoVersand);
    ParamByName('ST_INKASSOABFRAGE').AsString := BoolToStr(InkassoAbfrage);
    ParamByName('ST_PREISKG').AsString := BoolToStr(EinPreisFuerAlle);
    ParamByName('sT_PREISKG_ID').AsInteger := PreisKGruppe;
    ParamByName('ST_VO_SACHB_UEBERSCHR').AsString := BoolToStr(VOSachbearbeiterUeberschreiben);
    ParamByName('ST_KOMMSCHEIN_FREIGABE').AsString := BoolToStr(KommscheinBeiFreigabe);
    ParamByName('ST_KONTORREMEMO').AsString := BoolToStr(KontorREMemo);
    ParamByName('ST_NULLEUROWARNUNG').AsString := BoolToStr(NullEuroWarnung);
    ParamByName('ST_SRTEXTIMMER').AsString := BoolToStr(SRTextImmer);
    ParamByName('ST_VOARTINGRID').AsString := BoolToStr(VoArtInGrid);
    ParamByName('ST_PKONTENAUTO').AsString := BoolToStr(PersonenkontenAuto);
    ParamByName('KredKontenAuto').AsString := BoolToStr(KredKontenAuto);
    ParamByName('ST_EIGENEOPVERWALTUNG').AsString := BoolToStr(EigeneOPVerwaltung);
    ParamByName('ST_STDTEILLIEFERV').AsInteger := StdTeillieferVerhalten;

    ParamByName('ST_VERBUCHENNACHTAGEN').AsInteger := VerbuchenNachTagen;
    ParamByName('ST_KUNDENPLZVERTRETER').AsString := BoolToStr(KundenPLZVertreter);
    ParamByName('ST_RABATTUEBERSCHREIBEN').AsString := BoolToStr(RabattUeberschreiben);
    ParamByName('ST_DPD_ROUTENVER').AsString := DPDRoutenVersion;
    ParamByName('ST_DPD_DEPOTKENNUNG').AsString := DPDDepotkennung;
    ParamByName('ST_DPD_KUNDENNR').AsString := DPDKundennummer;
    ParamByName('ST_DPD_ABSMEMO').AsString := DPDAbsender;
    ParamByName('ST_DPD_BANK').AsString := DPDBank;
    ParamByName('ST_DPD_BLZ').AsString := DPDBlz;
    ParamByName('ST_DPD_KTO').AsString := DPDKontoNr;
    ParamByName('ST_DPD_NNAUFSCHLAG').AsFloat := DPDNNAufschlag;
    ParamByName('ST_DPD_DEPOTADRESSE').AsString := DPDDepotAdresse;
    ParamByName('ST_DPD_DEPOT_FAX').AsString := DPDDepotFax;
    ParamByName('ST_DPD_DEPOT_TEL').AsString := DPDDepotTel;

    ParamByName('ST_RISIKO_CHECK_COUNT').AsInteger := RiskCheckCount;
    ParamByName('ST_VOSPERREBEIGEDRUCKT').AsString := BoolToStr(VOSperreBeiGedruckt);

    ParamByName('ST_USTID').AsString := UstID;
    ParamByName('ST_NACHKOMMADRUCK').AsInteger := NachkommaDruck;
    ParamByName('ST_BUDGETKG').AsInteger := BudgetKG;

    ParamByName('ST_WELAGER').AsInteger := WELager;
    ParamByName('ST_WEPLATZ').AsInteger := WEPlatz;
    ParamByName('ST_PRINTPARAMS').AsString := DruckParameter;
    ParamByName('ST_KUSUCHE_ERWEITERT').AsString := BoolToStr(KuSucheErweitert);
    ParamByName('ST_SPERRE_INKASSO').AsString := BoolToStr(KuSperreInkasso);
    ParamByName('ST_SAMMELRE_PORTO').AsString := BoolToStr(SammelRe_Porto);
    ParamByName('ST_CHECKSPERRE').AsString := BoolToStr(CheckSperre);
    ParamByName('ST_NVEERFASSEN').AsString := BoolToStr(NVEErfassen);
    ParamByName('ST_DATEVKONTEN').AsString := BoolToStr(DatevKontenManipulieren);
    ParamByName('Umsatzprovision').AsString := BoolToStr(UmsatzProvision);
    ParamByName('SkontoVonProv').AsString := BoolToStr(SkontoVonProvAbziehen);
    ParamByName('Wiedervorlage').AsInteger := WiedervorlageAnzeigen;

    ParamByName('ST_TICKETARTIKEL').AsInteger := TicketArtikel;

    ParamByName('ST_VERDICHTUNG_DEB').AsInteger := VerdichtungDebitoren;
    ParamByName('ST_VERDICHTUNG_KRED').AsInteger := VerdichtungKreditoren;

    ParamByName('Warengrp').AsInteger := WarenGrP;

    ParamByName('ST_MWST_VOLL_1').AsFloat := MwST_voll_1;
    ParamByName('ST_MWST_VERMINDERT_1').AsFloat := MwST_vermindert_1;
    ParamByName('ST_MWST_VOLL_2').AsFloat := MwST_voll_2;
    ParamByName('ST_MWST_VERMINDERT_2').AsFloat := MwST_vermindert_2;
    ParamByName('ST_MWST_STICHTAG').AsDateTime := MwST_Stichtag;
    ParamByName('ST_AR_VK_ANZEIGEN').AsString := BoolToStr(VKPreiseAnzeigen);
    ParamByName('ST_AR_VK_ANZEIGEN_KG').AsInteger := VKPreiseAnzeigenKG;
    ParamByName('ST_RESMENGESOFORT').AsString := BoolToStr(ResMengenSofort);
    ParamByName('ST_SERVICE_PO_ID').AsInteger := ServiceVersandartID;
    ParamByName('Waehrungszeichen').AsString := Waehrungszeichen;
    ParamByName('ErweiterteAdressdaten').AsString := BoolToStr(erweiterteAdressdaten);
    ParamByName('Kundenformulare').AsInteger := Kundenformulare;
    ParamByName('DefaultLiefertage').AsInteger := DefaultLiefertage;
    ParamByName('UebersichtAnsprechpartner').AsString := BoolToStr(UebersichtAnsprechpartner);
    ParamByName('KW_Datum').AsInteger := KW_Datum;
    ParamByName('NachkommaPos').AsInteger := NachkommaPos;
    ParamByName('NachkommaEinzelnpreis').AsInteger := NachkommaEinzelnpreis;
    ParamByName('NachkommaMenge').AsInteger := NachkommaMenge;
    ParamByName('VorgangNettoSumme').AsString := BoolToStr(VorgangNettoSumme);
    ParamByName('BilderAlle').AsString := BoolToStr(BilderAlle);

    if DruckerAuswahlSynchron then
      ParamByName('DruckerAuswahlSynchron').AsString := 'T'
    else
      ParamByName('DruckerAuswahlSynchron').AsString := 'F';

    if ZeitfensterIgnorieren then
      ParamByName('ZeitfensterIgnorieren').AsString := 'T'
    else
      ParamByName('ZeitfensterIgnorieren').AsString := 'F';

    ParamByName('FB_POP3_Server').AsString := FB_POP3_Server;
    ParamByName('FB_POP3_Benutzer').AsString := FB_POP3_Benutzer;
    ParamByName('FB_POP3_Passwort').AsString := FB_POP3_Passwort;
    ParamByName('FB_POP3_Mail').AsString := FB_POP3_Mail;
    ParamByName('ArtikelExternVKAlle').AsString := BoolToStr(ArtikelExternVKAlle);
    ParamByName('zertifikat').AsString := BoolToStr(Zertifikat);
    ParamByName('Vorgangsspalten').AsInteger := Vorgangsspalten.getBitMuster;
    // ParamByName('Artikelspalten').asInteger := Artikelspalten.getBitMuster;
    ParamByName('KeinRabattBeiSa').AsString := BoolToStr(KeinRabattBeiSA);
    ParamByName('Rechnunggetrennt').AsString := BoolToStr(RechnungGetrennt);

    ParamByName('UPS_KUNR').AsString := UPS_KUNR;
    ParamByName('UPS_Warenbeschreibung').AsString := UPS_Warenbeschreibung;
    ParamByName('UPS_Verzeichnis').AsString := UPS_Verzeichnis;
    ParamByName('UPS_Telefon').AsString := UPS_Telefon;
    ParamByName('ZahlungBeiOPNrNull').AsString := BoolToStr(ZahlungBeiOPNrNull);
    ParamByName('karenzZuFaelligkeit').AsString := BoolToStr(karenzZuFaelligkeit);
    ParamByName('Freitext').AsString := FreiText;
    ParamByName('KeinRabattBeiSpezPreis').AsString := BoolToStr(KeinRabattBeiSpezPreis);
    ParamByName('Chargenverzeichnis').AsString := Chargenverzeichnis;
    ParamByName('Faxversand').AsDateTime := Faxversand;
    ParamByName('Faxsofort').AsString := BoolToStr(Faxsofort);
    ParamByName('Kundensuchspalten').AsInteger := Kundensuchspalten.getBitMuster;
    ParamByName('Lief_nichtfortfueren').AsString := BoolToStr(Lief_nichtfortfueren);
    ParamByName('ServiceGruppieren').AsString := BoolToStr(ServiceGruppieren);
    ParamByName('GeraeteArtikelnr').AsString := BoolToStr(GeraeteArtikelnr);
    ParamByName('ServiceLieferschein').AsString := BoolToStr(ServiceLieferschein);
    ParamByName('Picklistendrucken').AsString := BoolToStr(PicklistenDrucken);
    ParamByName('ChargenInPackliste').AsString := BoolToStr(ChargenInPackliste);
    ParamByName('KU_Notizen').AsString := BoolToStr(KU_Notizen);
    ParamByName('LT_Notizen').AsString := BoolToStr(LT_Notizen);
    ParamByName('DruckeLangText').AsString := BoolToStr(DruckeLangText);
    ParamByName('DruckeLangTextKreditor').AsString := BoolToStr(DruckeLangTextKreditor);
    ParamByName('KuDebNr_gleich').AsString := BoolToStr(KuDebNr_gleich);
    ParamByName('LTKredNr_gleich').AsString := BoolToStr(LTKredNr_gleich);
    ParamByName('SNFensternichtzeigen').AsString := BoolToStr(SNFensternichtzeigen);
    ParamByName('Versand_allePos').AsString := BoolToStr(Versand_allePos);
    ParamByName('ProvDecksatzbeachten').AsString := BoolToStr(ProvDecksatzbeachten);
    ParamByName('VoSuche_vondatum').AsDateTime := VoSuche_vondatum;
    ParamByName('FibuHost').AsString := FibuHost;
    ParamByName('FibuUser').AsString := FibuUser;
    ParamByName('FibuPass').AsString := FibuPass;
    ParamByName('MySqlLowerCase').AsString := BoolToStr(MySqlLowerCase);
    ParamByName('MySqlUtf8').AsString := BoolToStr(MySqlUtf8);
    ParamByName('UseVorgangLiefertermin').AsString := BoolToStr(UseVorgangLiefertermin);
    ParamByName('DruckdatenFTP').AsString := DruckdatenFTP;
    ParamByName('DruckdatenFTPUser').AsString := DruckdatenFTPUser;
    ParamByName('DruckdatenFTPPass').AsString := DruckdatenFTPPass;
    ParamByName('DruckdatenBaseUrl').AsString := DruckdatenBaseUrl;
    ParamByName('VersandFrei').AsString := BoolToStr(VersandFrei);
    ParamByName('Art_fuer_neuen_vorgang').AsInteger := Art_fuer_neuen_vorgang;
    ParamByName('ArNr_doppelt_pruefen').AsString := BoolToStr(ArNr_doppelt_pruefen);
    ParamByName('Doppelte_Kunr_erlauben').AsString := BoolToStr(Doppelte_Kunr_erlauben);
    ParamByName('Doppelte_LTnr_erlauben').AsString := BoolToStr(Doppelte_LTnr_erlauben);
    ParamByName('DebNr_Von').AsInteger := DebNr_Von;
    ParamByName('DebNr_BIS').AsInteger := DebNr_Bis;
    ParamByName('Deb_Vergabeart').AsInteger := Deb_Vergabeart;
    ParamByName('KredNr_Von').AsInteger := KredNr_Von;
    ParamByName('KredNr_Bis').AsInteger := KredNr_Bis;
    ParamByName('Kred_Vergabeart').AsInteger := Kred_Vergabeart;
    ParamByName('Inventur_Nul_buchen').AsString := BoolToStr(Inventur_Nul_buchen);
    ParamByName('Preis_Runden').AsString := BoolToStr(PreisbasisVKEinheit);
    ParamByName('ST_PORTO_SKONTIERBAR').AsString := BoolToStr(Porto_Skontierbar);
    ParamByName('RefNr_Dubblettenpruefung').AsString := BoolToStr(RefNr_Dubblettenpruefung);
    ParamByName('AuNummer_in_BEordernummer').AsString := BoolToStr(AuNummer_in_BEordernummer);
    ParamByName('AddisonUser').AsString := AddisonUser;
    ParamByName('AddisonPass').AsString := AddisonPass;
    ParamByName('MBWert').AsString := BoolToStr(MBWert);
    ParamByName('MBWerttext').AsString := MBWertText;
    ParamByName('MBWarengrp').AsInteger := MBWarenGrp;
    ParamByName('artikelnrgen').AsString := BoolToStr(ArikelNrGenerator);
    ParamByName('artnrformat').AsString := ArtNrFormat;
    ParamByName('massartikelformat').AsString := MassArtikelFormat;
    ParamByName('FP_Dir_Vorgang').AsString := FP_Dir_Vorgang;
    ParamByName('FP_Dir_Auswertung').AsString := FP_Dir_Auswertung;
    ParamByName('ST_MAHNZAFRIST').AsInteger := MahnZAFrist;
    ParamByName('MitarbeiterTicketsystem').AsInteger := MitarbeiterTicketsystem;
    ParamByName('GruppeMaTicketsystem').AsInteger := GruppeTicketsystem;
    ParamByName('PrioNeueTickets').AsInteger := PrioNeueTickets;
    ParamByName('GruppeTicketsystem').AsInteger := GruppeKeinKundeTicket;
    ParamByName('Mandat_verfuegbar_kriterien').AsInteger := Mandat_verfuegbar_kriterien;
    ParamByName('Mandat_erinnerungszeit').AsInteger := Mandat_erinnerungszeit;
    ParamByName('Mandat_warnungszeit').AsInteger := Mandat_warnungszeit;
    ParamByName('Auto_In_Kopierter_Vorgang').AsString := BoolToStr(Auto_In_Kopierter_Vorgang);
    ParamByName('GBSUCHE_ALLE').AsString := GBSuche_Alle;
    ParamByName('Notificationart').AsInteger := Notificationart;
    ParamByName('Notificationzeit').AsInteger := Notificationzeit;
    ParamByName('Mandat_Wiedervorlage_erstellen').AsString := BoolToStr(Mandat_Wiedervorlage_erstellen);
    ParamByName('KundeSofortFreigeben').AsString := BoolToStr(KundeSofortFreigeben);
    ParamByName('AuINBE_Bestandpruefen').AsString := BoolToStr(AuINBE_Bestandpruefen);
    ParamByName('Transportvers_Proz').AsFloat := _TransportVers_Proz;
    ParamByName('Transportvers_Verwenden').AsInteger := _TransportVers_Verwenden;
    ParamByName('Bestellung_autom_Freigeben').AsString := BoolToStr(_Bestellung_Autom_Freigeben);
    ParamByName('Farbe_Freigabe_H').AsInteger := _Farbe_Freigabe_H;
    ParamByName('Farbe_Freigabe_T').AsInteger := _Farbe_Freigabe_T;
    ParamByName('Eingangsbelegformat').AsString := _Eingangsbelegformat;
    ParamByName('Eingangsbeleg_ImportDir').AsString := _Eingangsbeleg_ImportDir;
    ParamByName('Eingangsbeleg_ExportDir').AsString := _Eingangsbeleg_ExportDir;
    ParamByName('Vorgang_ArchivDir').AsString := _Vorgang_ArchivDir;
    ParamByName('Kundennummer').AsInteger := _Kundennummer;
    ParamByName('Easylog').asString := BoolToStr(_Easylog);
    ParamByName('Rechnung_per_Mail').asString := BoolToStr(_RechnungPerMail);
    ParamByName('Reisenummerformat').AsString := _Reisenummerformat;


    ExecSQl;

  end;

  if not WasOpen then
    IBT.Commit;

end;

procedure TStammdaten.setDPAbsender(const aDPAbsender: string);
begin
  if aDPAbsender <> DPAbsender then
  begin
    DPAbsender := aDPAbsender;
    Update := true;
  end;
end;

procedure TStammdaten.setDPAbsenderAbk(const aDPAbsenderAbk: string);
begin
  if aDPAbsenderAbk <> DPAbsenderAbk then
  begin
    DPAbsenderAbk := aDPAbsenderAbk;
    Update := true;
  end;
end;

procedure TStammdaten.setDPBank(const aDPBank: string);
begin
  if aDPBank <> DPBank then
  begin
    DPBank := aDPBank;
    Update := true;
  end;
end;

procedure TStammdaten.setDPBLZ(const aDPBLZ: string);
begin
  if aDPBLZ <> DPBLZ then
  begin
    DPBLZ := aDPBLZ;
    Update := true;
  end;
end;

procedure TStammdaten.setDPErmaessigung(aDPErmaessigung: real);
begin
  if aDPErmaessigung <> DPErmaessigung then
  begin
    DPErmaessigung := aDPErmaessigung;
    Update := true;
  end;
end;

procedure TStammdaten.setMinBestandTage(aMinBestandTage: integer);
begin
  if aMinBestandTage <> MinBestandTage then
  begin
    MinBestandTage := aMinBestandTage;
    Update := true;
  end;
end;

procedure TStammdaten.setMinBestandGrenze(aMinBestandGrenze: real);
begin
  if aMinBestandGrenze <> MinBestandGrenze then
  begin
    MinBestandGrenze := aMinBestandGrenze;
    Update := true;
  end;
end;

procedure TStammdaten.setDPIdentCode(const aDPIdentCode: string);
begin
  if aDPIdentCode <> DPIdentCode then
  begin
    DPIdentCode := aDPIdentCode;
    Update := true;
  end;
end;

procedure TStammdaten.setDPKennung(const aDPKennung: string);
begin
  if aDPKennung <> DPKennung then
  begin
    DPKennung := aDPKennung;
    Update := true;
  end;
end;

procedure TStammdaten.setDPKennung_inter(const aWert: string);
begin
  if aWert <> DPKennung_inter then
  begin
    DPKennung_inter := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setDPKontoNr(const aDPKontoNr: string);
begin
  if aDPKontoNr <> DPKontoNr then
  begin
    DPKontoNr := aDPKontoNr;
    Update := true;
  end;
end;

procedure TStammdaten.setDPKundenNr(const aDPKundenNr: string);
begin
  if aDPKundenNr <> DPKundenNr then
  begin
    DPKundenNr := aDPKundenNr;
    Update := true;
  end;
end;

procedure TStammdaten.setDPVorausVerfahren(const aDPVorausVerfahren: string);
begin
  if aDPVorausVerfahren <> DPVorausVerfahren then
  begin
    DPVorausVerfahren := aDPVorausVerfahren;
    Update := true;
  end;
end;

procedure TStammdaten.setDynamischeID(aDynamischeID: integer);
begin
  if aDynamischeID <> DynamischeID then
  begin
    DynamischeID := aDynamischeID;
    Update := true;
  end;
end;

procedure TStammdaten.setEasylog(value: boolean);
begin
  if value <> _Easylog then
  begin
    _Easylog := value;
    Update := true;
  end;
end;

procedure TStammdaten.setEasyLogPfad(const aEasyLogPfad: string);
begin
  if aEasyLogPfad <> EasyLogPfad then
  begin
    EasyLogPfad := aEasyLogPfad;
    Update := true;
  end;
end;

procedure TStammdaten.setFarbeEnde(aFarbeEnde: TColor);
begin
  if aFarbeEnde <> FarbeEnde then
  begin
    FarbeEnde := aFarbeEnde;
    Update := true;
  end;
end;

procedure TStammdaten.setFarbeStart(aFarbeStart: TColor);
begin
  if aFarbeStart <> FarbeStart then
  begin
    FarbeStart := aFarbeStart;
    Update := true;
  end;
end;

procedure TStammdaten.setFarbe_Freigabe_H(aValue: integer);
begin
  if aValue <> _Farbe_Freigabe_H then
  begin
    _Farbe_Freigabe_H := aValue;
    Update := true;
  end;
end;

procedure TStammdaten.setFarbe_Freigabe_T(aValue: integer);
begin
  if aValue <> _Farbe_Freigabe_T then
  begin
    _Farbe_Freigabe_T := aValue;
    Update := true;
  end;
end;

procedure TStammdaten.setFaxPfad(aFaxPfad: string);
begin
  if aFaxPfad <> FaxPfad then
  begin
    FaxPfad := aFaxPfad;
    Update := true;
  end;
end;

procedure TStammdaten.setFaxsofort(aWert: boolean);
begin
  if Faxsofort <> aWert then
  begin
    Faxsofort := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setFibuHost(aWert: string);
begin
  if (FibuHost <> aWert) then
  begin
    FibuHost := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setFibuMitarbeiter(aFibuMitarbeiter: string);
begin
  if aFibuMitarbeiter <> FibuMitarbeiter then
  begin
    FibuMitarbeiter := aFibuMitarbeiter;
    Update := true;
  end;
end;

procedure TStammdaten.setFibuPass(const aWert: string);
begin
  if (FibuPass <> aWert) then
  begin
    FibuPass := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setFibuUser(const aWert: string);
begin
  if (FibuUser <> aWert) then
  begin
    FibuUser := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setFortfuehren_ULI_RE_erstellen(aWert: boolean);
begin
  if Fortfuehren_ULI_RE_erstellen <> aWert then
  begin
    Fortfuehren_ULI_RE_erstellen := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setFP_Dir_Auswertung(aWert: string);
begin
  if FP_Dir_Auswertung <> aWert then
  begin
    FP_Dir_Auswertung := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setFP_Dir_Vorgang(aWert: string);
begin
  if FP_Dir_Vorgang <> aWert then
  begin
    FP_Dir_Vorgang := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setFreiText(aWert: string);
begin
  if FreiText <> aWert then
  begin
    FreiText := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setGeraetAutomatisch(aWert: integer);
begin
  if GeraetAutomatisch <> aWert then
  begin
    GeraetAutomatisch := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setGBSucheAlle_Artikel(aWert: boolean);
var
  Vgl: string;
begin
  Vgl := GBSuche_Alle;
  GBSuche_Alle[1] := BoolToStr(aWert)[1];
  if Vgl <> GBSuche_Alle then
    Update := true;
end;

procedure TStammdaten.setGBSucheAlle_Vorgang(aWert: boolean);
var
  Vgl: string;
begin
  Vgl := GBSuche_Alle;
  GBSuche_Alle[2] := BoolToStr(aWert)[1];
  if Vgl <> GBSuche_Alle then
    Update := true;
end;

procedure TStammdaten.setGBSucheAlle_Kunde(aWert: boolean);
var
  Vgl: string;
begin
  Vgl := GBSuche_Alle;
  GBSuche_Alle[3] := BoolToStr(aWert)[1];
  if Vgl <> GBSuche_Alle then
    Update := true;
end;

procedure TStammdaten.setGBSucheAlle_Lieferant(aWert: boolean);
var
  Vgl: string;
begin
  Vgl := GBSuche_Alle;
  GBSuche_Alle[4] := BoolToStr(aWert)[1];
  if Vgl <> GBSuche_Alle then
    Update := true;
end;

procedure TStammdaten.setGENR_Auswahl(aWert: integer);
begin
  if GENR_Auswahl <> aWert then
  begin
    GENR_Auswahl := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setGeraeteArtikelnr(aWert: boolean);
begin
  if (GeraeteArtikelnr <> aWert) then
  begin
    GeraeteArtikelnr := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setGleubigerID(aWert: string);
begin
  if GleubigerID <> aWert then
  begin
    GleubigerID := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setGruppeKeinKundeTicket(aWert: integer);
begin
  if (GruppeKeinKundeTicket <> aWert) then
  begin
    GruppeKeinKundeTicket := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setGruppeTicketsystem(aWert: integer);
begin
  if (GruppeTicketsystem <> aWert) then
  begin
    GruppeTicketsystem := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setArBemerkung_zeigen(aWert: boolean);
begin
  if ArBemerkung_zeigen <> aWert then
  begin
    ArBemerkung_zeigen := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setVoBemerkungZeigen(aWert: boolean);
begin
  if _VoBemerkungZeigen <> aWert then
  begin
    _VoBemerkungZeigen := aWert;
    Update := true;
  end;
end;


procedure TStammdaten.setArikelNrGenerator(aWert: boolean);
begin
  if ArikelNrGenerator <> aWert then
  begin
    ArikelNrGenerator := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setArtNrFormat(aWert: string);
begin
  if ArtNrFormat <> aWert then
  begin
    ArtNrFormat := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setMassArtikelFormat(aWert: string);
begin
  if MassArtikelFormat <> aWert then
  begin
    MassArtikelFormat := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setArNr_doppelt_pruefen(aWert: boolean);
begin
  if ArNr_doppelt_pruefen <> aWert then
  begin
    ArNr_doppelt_pruefen := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setArtikelExternVKAlle(aWert: boolean);
begin
  if ArtikelExternVKAlle <> aWert then
  begin
    ArtikelExternVKAlle := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setArt_fuer_neuen_vorgang(aWert: integer);
begin
  if Art_fuer_neuen_vorgang <> aWert then
  begin
    Art_fuer_neuen_vorgang := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setAuINBE_Bestandpruefen(aWert: boolean);
begin
  if AuINBE_Bestandpruefen <> aWert then
  begin
    AuINBE_Bestandpruefen := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setAuNummer_in_BEordernummer(aWert: boolean);
begin
  if AuNummer_in_BEordernummer <> aWert then
  begin
    AuNummer_in_BEordernummer := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setAuto_In_Kopierter_Vorgang(aWert: boolean);
begin
  if Auto_In_Kopierter_Vorgang <> aWert then
  begin
    Auto_In_Kopierter_Vorgang := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setImageDir(aImageDir: string);
begin
  if copy(Trim(aImageDir), length(Trim(aImageDir)), 1) <> '\' then
    aImageDir := aImageDir + '\';

  if aImageDir <> ImageDir then
  begin
    ImageDir := aImageDir;
    Update := true;
  end;
end;

procedure TStammdaten.setInkassoMahnstufe(aInkassomahnstufe: integer);
begin
  if aInkassomahnstufe <> InkassoMahnstufe then
  begin
    InkassoMahnstufe := aInkassomahnstufe;
    Update := true;
  end;
end;

procedure TStammdaten.setInkassoTage(aInkassotage: integer);
begin
  if aInkassotage <> InkassoTage then
  begin
    InkassoTage := aInkassotage;
    Update := true;
  end;
end;

procedure TStammdaten.setInventur_Nul_buchen(aWert: boolean);
begin
  if (Inventur_Nul_buchen <> aWert) then
  begin
    Inventur_Nul_buchen := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setJournalPfad(const aJournalPfad: string);
begin
  if aJournalPfad <> JournalPfad then
  begin
    JournalPfad := aJournalPfad;
    Update := true;
  end;
end;

procedure TStammdaten.setkarenzZuFaelligkeit(aWert: boolean);
begin
  if (karenzZuFaelligkeit <> aWert) then
  begin
    karenzZuFaelligkeit := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setKontoDirektfakturaErloesAusland(aKontoDirektfakturaErloesAusland: integer);
begin
  if aKontoDirektfakturaErloesAusland <> KontoDirektfakturaErloesAusland then
  begin
    KontoDirektfakturaErloesAusland := aKontoDirektfakturaErloesAusland;
    Update := true;
  end;
end;

procedure TStammdaten.setKontoDirektfakturaErloesEUAusland(aKontoDirektfakturaErloesEUAusland: integer);
begin
  if aKontoDirektfakturaErloesEUAusland <> KontoDirektfakturaErloesEUAusland then
  begin
    KontoDirektfakturaErloesEUAusland := aKontoDirektfakturaErloesEUAusland;
    Update := true;
  end;
end;

procedure TStammdaten.setKontoDirektfakturaErloesEUAuslandUST(aKontoDirektfakturaErloesEUAuslandUST: integer);
begin
  if aKontoDirektfakturaErloesEUAuslandUST <> KontoDirektfakturaErloesEUAuslandUST then
  begin
    KontoDirektfakturaErloesEUAuslandUST := aKontoDirektfakturaErloesEUAuslandUST;
    Update := true;
  end;
end;

procedure TStammdaten.setKontoDirektfakturaErloesInland(aKontoDirektfakturaErloesInland: integer);
begin
  if aKontoDirektfakturaErloesInland <> KontoDirektfakturaErloesInland then
  begin
    KontoDirektfakturaErloesInland := aKontoDirektfakturaErloesInland;
    Update := true;
  end;
end;

procedure TStammdaten.setKontoDirektfakturaKostenAusland(aKontoDirektfakturaKostenAusland: integer);
begin
  if aKontoDirektfakturaKostenAusland <> KontoDirektfakturaKostenAusland then
  begin
    KontoDirektfakturaKostenAusland := aKontoDirektfakturaKostenAusland;
    Update := true;
  end;
end;

procedure TStammdaten.setKontoDirektfakturaKostenEUAusland(aKontoDirektfakturaKostenEUAusland: integer);
begin
  if aKontoDirektfakturaKostenEUAusland <> KontoDirektfakturaKostenEUAusland then
  begin
    KontoDirektfakturaKostenEUAusland := aKontoDirektfakturaKostenEUAusland;
    Update := true;
  end;
end;

procedure TStammdaten.setKontoDirektfakturaKostenEUAuslandUST(aKontoDirektfakturaKostenEUAuslandUST: integer);
begin
  if aKontoDirektfakturaKostenEUAuslandUST <> KontoDirektfakturaKostenEUAuslandUST then
  begin
    KontoDirektfakturaKostenEUAuslandUST := aKontoDirektfakturaKostenEUAuslandUST;
    Update := true;
  end;
end;

procedure TStammdaten.setKontoDirektfakturaKostenInland(aKontoDirektfakturaKostenInland: integer);
begin
  if aKontoDirektfakturaKostenInland <> KontoDirektfakturaKostenInland then
  begin
    KontoDirektfakturaKostenInland := aKontoDirektfakturaKostenInland;
    Update := true;
  end;
end;

procedure TStammdaten.setLagerhelper(alagerhelper: pointer);
begin
  self.Lagerhelper := alagerhelper;
end;

procedure TStammdaten.setLandkuerzel_fuerUSTID(aWert: string);
begin
  if aWert <> Landkuerzel_fuerUSTID then
  begin
    Landkuerzel_fuerUSTID := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setLeergutID(aLeergutID: integer);
begin
  if aLeergutID <> LeergutID then
  begin
    LeergutID := aLeergutID;
    Update := true;
  end;
end;

procedure TStammdaten.setLockServerIP(const aLockServerIP: string);
begin
  if aLockServerIP <> LockServerIP then
  begin
    LockServerIP := aLockServerIP;
    Update := true;
  end;
end;

procedure TStammdaten.setMahnzins(aMahnZins: real);
begin
  if aMahnZins <> Mahnzins then
  begin
    Mahnzins := aMahnZins;
    Update := true;
  end;
end;

procedure TStammdaten.setMahnzinsen_immerberechnen(aWert: boolean);
begin
  if aWert <> Mahnzinsen_immerberechnen then
  begin
    Mahnzinsen_immerberechnen := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setMandantName(aMandantName: string);
begin
  if aMandantName <> MandantName then
  begin
    MandantName := aMandantName;
    Update := true;
  end;
end;

procedure TStammdaten.setMandat_erinnerungszeit(aWert: integer);
begin
  if aWert <> Mandat_erinnerungszeit then
  begin
    Mandat_erinnerungszeit := aWert;
    Update := true;
  end;

end;

procedure TStammdaten.setMandat_verfuegbar_kriterien(aWert: integer);
begin
  if aWert <> Mandat_verfuegbar_kriterien then
  begin
    Mandat_verfuegbar_kriterien := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setMandat_warnungszeit(aWert: integer);
begin
  if aWert <> Mandat_warnungszeit then
  begin
    Mandat_warnungszeit := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setMandat_Wiedervorlage_erstellen(aWert: boolean);
begin
  if aWert <> Mandat_Wiedervorlage_erstellen then
  begin
    Mandat_Wiedervorlage_erstellen := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setMBWert(aWert: boolean);
begin
  if aWert = MBWert then
    exit;
  MBWert := aWert;
  Update := true;
end;

procedure TStammdaten.setMBWertText(aWert: string);
begin
  if aWert = MBWertText then
    exit;
  MBWertText := aWert;
  Update := true;
end;

procedure TStammdaten.setMBWarenGrp(aWert: integer);
begin
  if aWert = MBWarenGrp then
    exit;
  MBWarenGrp := aWert;
  Update := true;
end;

procedure TStammdaten.setNullPosition(aNullPosition: integer);
begin
  if aNullPosition <> NullPosition then
  begin
    NullPosition := aNullPosition;

    SetupNullPosArray;

    Update := true;
  end;
end;

procedure TStammdaten.setNummernFormat(aNummernFormat: string);
begin
  if aNummernFormat <> NummernFormat then
  begin
    NummernFormat := aNummernFormat;
    Update := true;
  end;
end;

procedure TStammdaten.setRechnungGetrennt(aWert: boolean);
begin
  if RechnungGetrennt <> aWert then
  begin
    RechnungGetrennt := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setRechnungPerMail(const Value: Boolean);
begin
  if _RechnungPerMail <> Value then
  begin
    _RechnungPerMail := Value;
    Update := true;
  end;
end;

procedure TStammdaten.setRecoveryPasswort(aRecoveryPasswort: string);
var
  KryptPass: string;
  KryptChar: char;
  x: integer;
begin

  KryptPass := '';

  for x := 1 to length(aRecoveryPasswort) do
  begin

    KryptChar := aRecoveryPasswort[x];
    KryptChar := chr(ord(KryptChar) xor ord('A'));
    KryptPass := KryptPass + KryptChar;

  end;

  if KryptPass <> RecoveryPasswort then
  begin
    RecoveryPasswort := KryptPass;
    Update := true;
  end;
end;

procedure TStammdaten.setRefNr_Dubblettenpruefung(aWert: boolean);
begin
  if aWert <> RefNr_Dubblettenpruefung then
  begin
    RefNr_Dubblettenpruefung := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setReisenummerformat(const Value: string);
begin
  if _Reisenummerformat <> Value then
  begin
    _Reisenummerformat := Value;
    Update := true;
  end;
end;

procedure TStammdaten.setReportPfad(aReportPfad: string);
begin

  if ReportPfadUmgeleitet then
    exit;

  if aReportPfad <> ReportPfad then
  begin
    ReportPfad := aReportPfad;
    Update := true;
  end;
end;

procedure TStammdaten.setRMAMitarbeiter(aRMAMitarbeiter: string);
begin
  if aRMAMitarbeiter <> RMAMitarbeiter then
  begin
    RMAMitarbeiter := aRMAMitarbeiter;
    Update := true;
  end;
end;

procedure TStammdaten.setRMA_GUBankZahlart(aZahlart: TZahlungsart);
begin
  if (RMA_GUBankZahlart = nil) or (aZahlart = nil) or (RMA_GUBankZahlart.getID <> aZahlart.getID) then
  begin
    RMA_GUBankZahlart := aZahlart;
    Update := true;
  end;
end;

procedure TStammdaten.setRMA_GUKontoZahlart(aZahlart: TZahlungsart);
begin
  if (RMA_GUKontoZahlart = nil) or (aZahlart = nil) or (RMA_GUKontoZahlart.getID <> aZahlart.getID) then
  begin
    RMA_GUKontoZahlart := aZahlart;
    Update := true;
  end;
end;

procedure TStammdaten.setSMFromAdress(aSMFromAdress: string);
begin
  if aSMFromAdress <> SMFromAdress then
  begin
    SMFromAdress := aSMFromAdress;
    Update := true;
  end;
end;

procedure TStammdaten.setSMFromName(aSMFromName: string);
begin
  if aSMFromName <> SMFromName then
  begin
    SMFromName := aSMFromName;
    Update := true;
  end;
end;

procedure TStammdaten.setSMHost(aSMHost: string);
begin
  if aSMHost <> SMHost then
  begin
    SMHost := aSMHost;
    Update := true;
  end;
end;

procedure TStammdaten.setSMUser(aSMUser: string);
begin
  if aSMUser <> SMUser then
  begin
    SMUser := aSMUser;
  end;
end;

procedure TStammdaten.setStdVersand(aStdVersand: integer);
begin
  if aStdVersand <> StdVersand then
  begin
    StdVersand := aStdVersand;
    Update := true;
  end;
end;

procedure TStammdaten.setStdZahlart(aStdZahlart: integer);
begin
  if aStdZahlart <> StdZahlart then
  begin
    StdZahlart := aStdZahlart;
    Update := true;
  end;
end;

procedure TStammdaten.setTageTeillieferung(aTageTeillieferung: integer);
begin
  if aTageTeillieferung <> TageTeillieferung then
  begin
    TageTeillieferung := aTageTeillieferung;
  end;
end;

procedure TStammdaten.SetupNullPosArray;
var
  bit: byte;
begin
  for bit := 0 to 20 do
  begin
    NullPosArray[bit + 1] := (NullPosition and (1 shl bit)) > 0;
  end;
end;

procedure TStammdaten.setVersandpause(value: boolean);
begin
  if value <> Versandpause then
  begin
    Versandpause := value;
    Update := true;
  end;
end;

procedure TStammdaten.setZNettoTage(aZNettoTage: integer);
begin
  if aZNettoTage <> ZNettoTage then
  begin
    ZNettoTage := aZNettoTage;
    Update := true;
  end;
end;

procedure TStammdaten.setZSkonto(aZSkonto: real);
begin
  if aZSkonto <> ZSkonto then
  begin
    ZSkonto := aZSkonto;
    Update := true;
  end;
end;

procedure TStammdaten.setZSkontoTage(aZSkontoTage: integer);
begin
  if aZSkontoTage <> ZSkontoTage then
  begin
    ZSkontoTage := aZSkontoTage;
    Update := true;
  end;
end;

procedure TStammdaten.PackServerPreferences;
begin

  Update := true;

end;


function TStammdaten.getUebergabeliste: boolean;
begin
  Result := Uebergabeliste;
end;

procedure TStammdaten.setUebergabeliste(aListe: boolean);
begin
  if Uebergabeliste <> aListe then
  begin
    Uebergabeliste := aListe;
    Update := true;
  end;
end;

function TStammdaten.getDPNNAufschlag: real;
begin
  Result := DPNNAufschlag;
end;

procedure TStammdaten.setDPNNAufschlag(aDPNNAufschlag: real);
begin
  if DPNNAufschlag <> aDPNNAufschlag then
  begin
    DPNNAufschlag := aDPNNAufschlag;
    Update := true;
  end;
end;

procedure TStammdaten.setAnfahrtsart(aAnfahrtsart: integer);
begin
  if aAnfahrtsart <> Anfahrtsart then
  begin
    Anfahrtsart := aAnfahrtsart;
    Update := true;
  end;
end;

procedure TStammdaten.setAnfahrtszeit_kennziffer(aAnfahrtszeit_kennziffer: integer);
begin
  if aAnfahrtszeit_kennziffer <> Anfahrtszeit_kennziffer then
  begin
    Anfahrtszeit_kennziffer := aAnfahrtszeit_kennziffer;
    Update := true;
  end;
end;

procedure TStammdaten.setEntfernung_kennziffer(aEntfernung_kennziffer: integer);
begin
  if aEntfernung_kennziffer <> Entfernung_kennziffer then
  begin
    Entfernung_kennziffer := aEntfernung_kennziffer;
    Update := true;
  end;
end;

procedure TStammdaten.setPauschalbetrag_kennziffer(aPauschalbetrag_kennziffer: integer);
begin
  if aPauschalbetrag_kennziffer <> Pauschalbetrag_kennziffer then
  begin
    Pauschalbetrag_kennziffer := aPauschalbetrag_kennziffer;
    Update := true;
  end;
end;

function TStammdaten.getAbrechnungszeit: integer;
begin
  Result := Abrechnungszeit;
end;

procedure TStammdaten.setAbrechnungszeit(aAbrechnungszeit: integer);
begin
  if aAbrechnungszeit <> Abrechnungszeit then
  begin
    Abrechnungszeit := aAbrechnungszeit;
    Update := true;
  end;
end;

function TStammdaten.getPlanetShop: boolean;
begin
  Result := PlanetShop;
end;

procedure TStammdaten.setPlanetShop(aPlanet: boolean);
begin
  if PlanetShop <> aPlanet then
  begin
    PlanetShop := aPlanet;
    Update := true;
  end;
end;

function TStammdaten.getMahngrenze: real;
begin
  Result := Mahngrenze;
end;

function TStammdaten.getMahnZAFrist: integer;
begin
  Result := MahnZAFrist;
end;

procedure TStammdaten.setMahngrenze(aMahngrenze: real);
begin
  if Mahngrenze <> aMahngrenze then
  begin
    Mahngrenze := aMahngrenze;
    Update := true;
  end;
end;

procedure TStammdaten.setMahnZAFrist(aWert: integer);
begin
  if MahnZAFrist <> aWert then
  begin
    MahnZAFrist := aWert;
    Update := true;
  end;
end;

function TStammdaten.getInkassoAbstand: integer;
begin
  Result := InkassoAbstand;
end;

procedure TStammdaten.setInkasseAbstand(aInkassoAbstand: integer);
begin
  if InkassoAbstand <> aInkassoAbstand then
  begin
    InkassoAbstand := aInkassoAbstand;
    Update := true;
  end;
end;

function TStammdaten.getChargeMenge: boolean;
begin
  Result := ChargeMenge;
end;

function TStammdaten.getChargenInPackliste: boolean;
begin
  Result := ChargenInPackliste;
end;

function TStammdaten.getChargenNach_FIFO_zuordnen: boolean;
begin
  Result := ChargenNach_FIFO_zuordnen;
end;

function TStammdaten.getChargenverzeichnis: string;
begin
  Result := Chargenverzeichnis;
end;

procedure TStammdaten.setChargeMenge(aWert: boolean);
begin
  if ChargeMenge <> aWert then
  begin
    ChargeMenge := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setChargenInPackliste(aWert: boolean);
begin
  if (ChargenInPackliste <> aWert) then
  begin
    ChargenInPackliste := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setChargenNach_FIFO_zuordnen(aWert: boolean);
begin
  if ChargenNach_FIFO_zuordnen <> aWert then
  begin
    ChargenNach_FIFO_zuordnen := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setChargenverzeichnis(aWert: string);
begin
  if Chargenverzeichnis <> aWert then
  begin
    Chargenverzeichnis := aWert;
    Update := true;
  end;
end;

function TStammdaten.getChargeEnde: string;
begin
  Result := ChargeEnde;
end;

procedure TStammdaten.setChargeEnde(aWert: string);
begin
  if ChargeEnde <> aWert then
  begin
    ChargeEnde := aWert;
    Update := true;
  end;
end;

function TStammdaten.getScanMode: string;
begin
  Result := ScanMode;
end;

procedure TStammdaten.setScanMode(aWert: string);
begin
  if ScanMode <> aWert then
  begin
    ScanMode := aWert;
    Update := true;
  end;
end;

function TStammdaten.getScanAbbr: string;
begin
  Result := ScanAbbr;
end;

function TStammdaten.getScanOK: string;
begin
  Result := ScanOK;
end;

procedure TStammdaten.setScanAbbr(const aWert: string);
begin
  if ScanAbbr <> aWert then
  begin
    ScanAbbr := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setScanOK(aWert: string);
begin
  if ScanOK <> aWert then
  begin
    ScanOK := aWert;
    Update := true;
  end;
end;

function TStammdaten.getKontoDirektfaktura(aErloese: boolean; aUstID: string; aAusland: boolean;
  aEUAusland: boolean): longint;
var
  ustIDGueltig: boolean;
begin
  // entsprechendes Artikel- oder Warengruppenkonto zurückgeben
  // ustIDGueltig := (length(aUstID) > 0) and (length(aUstID) < 14);  weil es gibts > 14
  ustIDGueltig := (length(aUstID) > 0);

  if aErloese then
  begin
    if (aEUAusland) and (not ustIDGueltig) then
      Result := KontoDirektfakturaErloesEUAusland
    else if (aEUAusland) and (ustIDGueltig) and (USTBegintmitStammkuerzel(aUSTID))  then
      Result := KontoDirektfakturaErloesInland
    else if (aEUAusland) and (ustIDGueltig)  and (not USTBegintmitStammkuerzel(aUSTID)) then
      Result := KontoDirektfakturaErloesEUAuslandUST
    else if aAusland then
      Result := KontoDirektfakturaErloesAusland
    else
      Result := KontoDirektfakturaErloesInland;
  end
  else
  begin
    if (aEUAusland) and (not ustIDGueltig) then
      Result := KontoDirektfakturaKostenEUAusland
    else if (aEUAusland) and (ustIDGueltig) then
      Result := KontoDirektfakturaKostenEUAuslandUST
    else if aAusland then
      Result := KontoDirektfakturaKostenAusland
    else
      Result := KontoDirektfakturaKostenInland;
  end;

end;

function TStammdaten.getStdKUKreditLimit: double;
begin
  Result := StdKUKreditLimit;
end;

function TStammdaten.getStdLTKreditLimit: double;
begin
  Result := StdLTKreditLimit;
end;

procedure TStammdaten.setStdKUKreditLimit(aWert: double);
begin
  if StdKUKreditLimit <> aWert then
  begin
    StdKUKreditLimit := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setStdLTKreditLimit(aWert: double);
begin
  if StdLTKreditLimit <> aWert then
  begin
    StdLTKreditLimit := aWert;
    Update := true;
  end;
end;

function TStammdaten.getRelease: string;
begin
  Result := Release;
end;

function TStammdaten.getRemoteHunspellPfad: string;
begin
  Result := getRemotePfad + 'Hunspell\';
end;

function TStammdaten.getRemotePfad: string;
var
  registry: TRegistry;
begin
  Result := '';
  if _RemotePfad > '' then
  begin
    Result := _RemotePfad;
    exit;
  end;
  registry := TRegistry.Create;
  try
    registry.Access := KEY_READ;
    registry.RootKey := HKEY_CURRENT_USER;
    if (registry.OpenKey('SOFTWARE\ASS\OPTIMA', false)) then
    begin
      _RemotePfad := IncludeTrailingPathDelimiter(registry.ReadString('RemotePath'));
      Result := _RemotePfad;
    end;
    registry.CloseKey;
  finally
    registry.free;
  end;
end;

function TStammdaten.getProvDatum: byte;
begin
  Result := ProvDatum;
end;

function TStammdaten.getProvDecksatzbeachten: boolean;
begin
  Result := ProvDecksatzbeachten;
end;

procedure TStammdaten.setProvDatum(aWert: byte);
begin
  if ProvDatum <> aWert then
  begin
    ProvDatum := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setProvDecksatzbeachten(aWert: boolean);
begin
  if ProvDecksatzbeachten <> aWert then
  begin
    ProvDecksatzbeachten := aWert;
    Update := true;
  end;
end;

function TStammdaten.getKondNetto: string;
begin
  Result := KondNetto;
end;

function TStammdaten.getKondNettoTage: string;
begin
  Result := KondNettoTage;
end;

function TStammdaten.getKondSkonto: string;
begin
  Result := KondSkonto;
end;

function TStammdaten.getKondSkontoTage: string;
begin
  Result := KondSkontoTage;
end;

procedure TStammdaten.setKondNetto(aWert: string);
begin
  if KondNetto <> aWert then
  begin
    KondNetto := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setKondNettoTage(aWert: string);
begin
  if KondNettoTage <> aWert then
  begin
    KondNettoTage := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setKondSkontoTage(aWert: string);
begin
  if KondSkontoTage <> aWert then
  begin
    KondSkontoTage := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setKondSkonto(aWert: string);
begin
  if KondSkonto <> aWert then
  begin
    KondSkonto := aWert;
    Update := true;
  end;
end;

function TStammdaten.getVersandDi: boolean;
begin
  Result := VersandDi;
end;

function TStammdaten.getVersandDo: boolean;
begin
  Result := VersandDo;
end;

function TStammdaten.getVersandFr: boolean;
begin
  Result := VersandFr;
end;

function TStammdaten.getVersandFrei: boolean;
begin
  Result := VersandFrei;
end;

function TStammdaten.getVersandMi: boolean;
begin
  Result := VersandMi;
end;

function TStammdaten.getVersandMo: boolean;
begin
  Result := VersandMo;
end;

function TStammdaten.getVersandSa: boolean;
begin
  Result := VersandSa;
end;

function TStammdaten.getVersandSo: boolean;
begin
  Result := VersandSo;
end;

function TStammdaten.getVersand_allePos: boolean;
begin
  Result := Versand_allePos;
end;

procedure TStammdaten.setVersandDi(aWert: boolean);
begin
  if VersandDi <> aWert then
  begin
    VersandDi := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setVersandDo(aWert: boolean);
begin
  if VersandDo <> aWert then
  begin
    VersandDo := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setVersandFr(aWert: boolean);
begin
  if VersandFr <> aWert then
  begin
    VersandFr := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setVersandFrei(aWert: boolean);
begin
  if (VersandFrei <> aWert) then
  begin
    VersandFrei := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setVersandMi(aWert: boolean);
begin
  if VersandMi <> aWert then
  begin
    VersandMi := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setVersandMo(aWert: boolean);
begin
  if VersandMo <> aWert then
  begin
    VersandMo := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setVersandSa(aWert: boolean);
begin
  if VersandSa <> aWert then
  begin
    VersandSa := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setVersandSo(aWert: boolean);
begin
  if VersandSo <> aWert then
  begin
    VersandSo := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setVersand_allePos(aWert: boolean);
begin
  if Versand_allePos <> aWert then
  begin
    Versand_allePos := aWert;
    Update := true;
  end;
end;

function TStammdaten.getFaxFrKu: boolean;
begin
  Result := FaxFrKu;
end;

function TStammdaten.getFaxTeillieferung: integer;
begin
  Result := FaxTeillieferung;
end;

function TStammdaten.getFaxversand: TDateTime;
begin
  Result := Faxversand;
end;

function TStammdaten.getFaxVersKu: boolean;
begin
  Result := FaxVersKu;
end;

function TStammdaten.getFaxVersVe: boolean;
begin
  Result := FaxVersVe;
end;

function TStammdaten.getMailFrKu: boolean;
begin
  Result := MailFrKu;
end;

function TStammdaten.getMailVersKu: boolean;
begin
  Result := MailVersKu;
end;

procedure TStammdaten.setFaxFrKu(aWert: boolean);
begin
  if FaxFrKu <> aWert then
  begin
    FaxFrKu := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setFaxTeillieferung(aWert: integer);
begin
  if FaxTeillieferung <> aWert then
  begin
    FaxTeillieferung := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setFaxversand(aWert: TDateTime);
begin
  if Faxversand <> aWert then
  begin
    Faxversand := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setFaxVersKu(aWert: boolean);
begin
  if FaxVersKu <> aWert then
  begin
    FaxVersKu := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setFaxVersVe(aWert: boolean);
begin
  if FaxVersVe <> aWert then
  begin
    FaxVersVe := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setMailFrKu(aWert: boolean);
begin
  if MailFrKu <> aWert then
  begin
    MailFrKu := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setMailVersKu(aWert: boolean);
begin
  if MailVersKu <> aWert then
  begin
    MailVersKu := aWert;
    Update := true;
  end;
end;

function TStammdaten.getDruckFrKu: boolean;
begin
  Result := DruckFrKu;
end;

{
function TStammdaten.getDruckobjekt(aLbl: TLabel): TDrucken;
begin
  if Druckobjekt = nil then
    Druckobjekt := TDrucken.create(self, aLbl, self, IBT);
  Result := Druckobjekt;
end;
}
procedure TStammdaten.setDruckFrKu(aWert: boolean);
begin
  if DruckFrKu <> aWert then
  begin
    DruckFrKu := aWert;
    Update := true;
  end;
end;

function TStammdaten.getSNFensternichtzeigen: boolean;
begin
  Result := SNFensternichtzeigen;
end;

function TStammdaten.getSNNeuBeiWE: boolean;
begin

  Result := SNNeuBeiWE;

end;

function TStammdaten.getSNScanBeiVersand: boolean;
begin

  Result := SNScanbeiVersand;

end;

function TStammdaten.getSNZwingend: boolean;
begin

  Result := SNZwingend;

end;

function TStammdaten.getSNZwingend_Raus: boolean;
begin
  Result := SNzwingend_Raus;
end;

function TStammdaten.getSNZwingend_Raus_WE: boolean;
begin
  Result := SNzwingend_Raus_WE;
end;

function TStammdaten.getSperrlagerId(aGB: Integer; aTrans: TIBTransaction): Integer;
var
  GB: TGeschaeftsbereich;
begin
  GB := TGeschaeftsbereich.Create(Self, aGB, Self, aTrans);
  Result := GB.SperrlagerID;
  FreeAndNil(GB);
end;

function TStammdaten.QS_Verwenden(aGB: Integer; aTrans: TIBTransaction): Boolean;
var
  GB: TGeschaeftsbereich;
begin
  GB := TGeschaeftsbereich.Create(Self, aGB, Self, aTrans);
  Result := GB.QS_Verwenden;
  FreeAndNil(GB);
end;

function TStammdaten.getHauptlager(aGB: Integer; aTrans: TIBTransaction): pointer;
var
  GB: TGeschaeftsbereich;
begin
  GB := TGeschaeftsbereich.Create(Self, aGB, Self, aTrans);
  Result := GB.getHauptlager;
  FreeAndNil(GB);
end;

function TStammdaten.getHauptlagerId(aGB: Integer; aTrans: TIBTransaction): Integer;
var
  GB: TGeschaeftsbereich;
begin
  GB := TGeschaeftsbereich.Create(Self, aGB, Self, aTrans);
  Result := GB.getHauptlagerID;
  FreeAndNil(GB);
end;

procedure TStammdaten.setSNFensternichtzeigen(aWert: boolean);
begin
  if SNFensternichtzeigen <> aWert then
  begin
    SNFensternichtzeigen := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setSNNeuBeiWE(aWert: boolean);
begin

  if SNNeuBeiWE <> aWert then
  begin
    SNNeuBeiWE := aWert;
    Update := true;
  end;

end;

procedure TStammdaten.setSNScanBeiVersand(aWert: boolean);
begin

  if SNScanbeiVersand <> aWert then
  begin
    SNScanbeiVersand := aWert;
    Update := true;
  end;

end;

procedure TStammdaten.setSNZwingend(aWert: boolean);
begin

  if SNZwingend <> aWert then
  begin
    SNZwingend := aWert;
    Update := true;
  end;

end;

procedure TStammdaten.setSNZwingend_Raus(aWert: boolean);
begin
  if SNzwingend_Raus <> aWert then
  begin
    SNzwingend_Raus := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setSNZwingend_Raus_WE(aWert: boolean);
begin
  if SNzwingend_Raus_WE <> aWert then
  begin
    SNzwingend_Raus_WE := aWert;
    Update := true;
  end;
end;

function TStammdaten.getKeinePreisaenderung: boolean;
begin
  Result := KeinePreisaenderung;
end;

function TStammdaten.getKeinRabattbeiSA: boolean;
begin
  Result := KeinRabattBeiSA;
end;

function TStammdaten.getKeinRabattBeiSpezPreis: boolean;
begin
  Result := KeinRabattBeiSpezPreis;
end;

procedure TStammdaten.setKeinePreisaenderung(aWert: boolean);
begin
  if KeinePreisaenderung <> aWert then
  begin
    KeinePreisaenderung := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setKeinRabattBeiSA(aWert: boolean);
begin
  if (KeinRabattBeiSA <> aWert) then
  begin
    KeinRabattBeiSA := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setKeinRabattBeiSpezPreis(aWert: boolean);
begin
  if (KeinRabattBeiSpezPreis <> aWert) then
  begin
    KeinRabattBeiSpezPreis := aWert;
    Update := true;
  end;
end;

function TStammdaten.CheckSavePassword(aPassword: string): boolean;
var
  alpha, omega: boolean;
  x: integer;
begin

  if length(aPassword) < 6 then
  begin
    Result := false;
    exit;
  end;

  alpha := false;
  omega := false;

  for x := 0 to length(aPassword) - 1 do
  begin
    if CharInSet(aPassword[x], ['a' .. 'z', 'A' .. 'Z']) then
      alpha := true;

    if CharInSet(aPassword[x], ['0' .. '9']) then
      omega := true;
  end;

  Result := alpha and omega;

end;

function TStammdaten.getSavePasswords: boolean;
begin

  Result := SavePasswords;

end;

procedure TStammdaten.setSavePasswords(aValue: boolean);
begin

  if SavePasswords <> aValue then
  begin
    SavePasswords := aValue;
    Update := true;
  end;

end;

function TStammdaten.getDokuDir: string;
begin
  Result := DokuDir;
end;

function TStammdaten.getDokuDirMail: string;
begin
  if DokuDir = '' then
  begin
    Result := '';
    exit;
  end;
  Result := IncludeLastBackslash(DokuDir) + 'ExtAnhaenge';
end;

function TStammdaten.getDokuDirMailSend: string;
begin
  if getDokuDirMail = '' then
  begin
    Result := '';
    exit;
  end;
  Result := IncludeLastBackslash(getDokuDirMail) + 'MailSend';

  if not DirectoryExists(Result) then
    ForceDirectories(Result);
end;

function TStammdaten.getDoppelte_Kunr_erlauben: boolean;
begin
  Result := Doppelte_Kunr_erlauben;
end;

function TStammdaten.getDoppelte_LTnr_erlauben: boolean;
begin
  Result := Doppelte_LTnr_erlauben;
end;

procedure TStammdaten.setDokuDir(aDokuDir: string);
begin

  if DokuDir <> aDokuDir then
  begin
    DokuDir := aDokuDir;
    Update := true;
  end;

end;

procedure TStammdaten.setDoppelte_Kunr_erlauben(aWert: boolean);
begin
  if Doppelte_Kunr_erlauben <> aWert then
  begin
    Doppelte_Kunr_erlauben := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setDoppelte_LTnr_erlauben(aWert: boolean);
begin
  if Doppelte_LTnr_erlauben <> aWert then
  begin
    Doppelte_LTnr_erlauben := aWert;
    Update := true;
  end;
end;

function TStammdaten.getDruckeLangText: boolean;
begin
  Result := DruckeLangText;
end;

function TStammdaten.getDruckeLangTextKreditor: boolean;
begin
  Result := DruckeLangTextKreditor;
end;

function TStammdaten.getDruckePBS: boolean;
begin

  Result := DruckePBS;

end;

procedure TStammdaten.SetDruckePBS(aValue: boolean);
begin

  if DruckePBS <> aValue then
  begin
    DruckePBS := aValue;
    Update := true;
  end;

end;

function TStammdaten.getKommFormular: integer;
begin

  Result := KommFormular;

end;

procedure TStammdaten.setKommFormular(aFormularID: integer);
begin

  if KommFormular <> aFormularID then
  begin
    KommFormular := aFormularID;
    Update := true;
  end;

end;

function TStammdaten.getLogMemo: TMemo;
begin
  Result := LogMemo;
end;

function TStammdaten.getLokalHunspellPfad: string;
var
  Login: string;
begin
  Login := '';
  if getMitarbeiter <> nil then
    Login := TMitarbeiter(getMitarbeiter).getLogin;
  Result := getLokalPfad + 'Hunspell\' + Login + '\';
end;

function TStammdaten.getLokalPfad: string;
var
  reg : TRegistry;
begin
  if fLokalpfad > '' then
  begin
    Result := fLokalpfad;
    exit;
  end;
  reg:=TRegistry.Create;
  reg.RootKey := HKEY_CURRENT_USER;
  if  Reg.OpenKeyReadOnly(c_RegPath) then
  begin
    fLokalPfad := IncludeTrailingPathDelimiter(Reg.ReadString('LocalPath'));
  end;
  reg.CloseKey;
  FreeAndNil(reg);
  Result := fLokalpfad;
end;

function TStammdaten.getLTKredNr_gleich: boolean;
begin
  Result := LTKredNr_gleich
end;

procedure TStammdaten.setLogMemo(aMemo: TMemo);
begin
  LogMemo := aMemo;
end;

procedure TStammdaten.setLTKredNr_gleich(aWert: boolean);
begin
  if (aWert <> LTKredNr_gleich) then
  begin
    LTKredNr_gleich := aWert;
    Update := true;
  end;
end;

function TStammdaten.getNavExportBack: string;
begin
  Result := NavExportBack;
end;

function TStammdaten.getNavExportDir: string;
begin
  Result := NavExportDir;
end;

function TStammdaten.getNavImportBack: string;
begin
  Result := NavImportBack;
end;

function TStammdaten.getNavImportDir: string;
begin
  Result := NavImportDir;
end;

function TStammdaten.getNotificationart: integer;
begin
  Result := Notificationart;
end;

function TStammdaten.getNotificationzeit: integer;
begin
  Result := Notificationzeit;
end;

procedure TStammdaten.setNavImportBack(aWert: string);
begin
  if NavImportBack <> aWert then
  begin
    NavImportBack := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setNavExportBack(aWert: string);
begin
  if NavExportBack <> aWert then
  begin
    NavExportBack := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setNavExportDir(aWert: string);
begin
  if NavExportDir <> aWert then
  begin
    NavExportDir := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setNavImportDir(aWert: string);
begin
  if NavImportDir <> aWert then
  begin
    NavImportDir := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setNotificationzeit(aWert: integer);
begin
  if Notificationzeit <> aWert then
  begin
    Notificationzeit := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setNotificatonArt(aWert: integer);
begin
  if Notificationart <> aWert then
  begin
    Notificationart := aWert;
    Update := true;
  end;
end;

function TStammdaten.getAnMemoFirma: string;
begin

  Result := AnMemoFirma;

end;

function TStammdaten.getAnMemoFirmaLI: string;
begin
  Result := AnMemoFirmaLI
end;

function TStammdaten.getAnMemoFirmaPf: string;
begin

  Result := AnMemoFirmaPf;

end;

function TStammdaten.getAnMemoPrivat: string;
begin

  Result := AnMemoPrivat;

end;

function TStammdaten.getAnMemoPrivatLI: string;
begin

  Result := AnMemoPrivatLI;
end;

function TStammdaten.getAnMemoPrivatPf: string;
begin

  Result := AnMemoPrivatPf;

end;

function TStammdaten.getAppDataPfad(hWindow: HWND; aDatei: string): string;
var
  pfad: string;
begin

  pfad := GetSpecialFolder(hWindow, CSIDL_APPDATA);
  if (not DirectoryExists(pfad + '\optima')) then
    CreateDir(pfad + '\optima');

  Result := pfad + '\optima\' + aDatei;
end;

procedure TStammdaten.setAnMemoFirma(aFormat: string);
begin

  if AnMemoFirma <> aFormat then
  begin
    AnMemoFirma := aFormat;
    Update := true;
  end;

end;

procedure TStammdaten.setAnMemoFirmaLI(aFormat: string);
begin
  if AnMemoFirmaLI <> aFormat then
  begin
    AnMemoFirmaLI := aFormat;
    Update := true;
  end;
end;

procedure TStammdaten.setAnMemoFirmaPf(aFormat: string);
begin

  if AnMemoFirmaPf <> aFormat then
  begin
    AnMemoFirmaPf := aFormat;
    Update := true;
  end;

end;

procedure TStammdaten.setAnMemoPrivat(aFormat: string);
begin

  if AnMemoPrivat <> aFormat then
  begin
    AnMemoPrivat := aFormat;
    Update := true;
  end;

end;

procedure TStammdaten.setAnMemoPrivatLI(const aFormat: string);
begin

  if AnMemoPrivatLI <> aFormat then
  begin
    AnMemoPrivatLI := aFormat;
    Update := true;
  end;

end;

procedure TStammdaten.setAnMemoPrivatPf(aFormat: string);
begin

  if AnMemoPrivatPf <> aFormat then
  begin
    AnMemoPrivatPf := aFormat;
    Update := true;
  end;

end;
{
function TStammdaten.generateAnschriftenMemo(Anrede, aNachname, Vorname, Firma, Zusatz, Strasse, PLZ, Ort, Land, HausNr, Postfach,
  PfPLZ, Ansprechpartner, Adresse2, Titel: string; Pf_Str, ANObjekt: integer): string;

var
  ReadQuery: TIBQuery;
  WasOpen: boolean;
  Formatid: integer;
  function getIso3FromIso2(aIso2: string): string;
  begin

    aIso2 := Trim(aIso2);

    ReadQuery := TIBQuery.create(self);
    with ReadQuery do
    begin

      Transaction := IBT;

      WasOpen := Transaction.InTransaction;
      if not WasOpen then
        Transaction.StartTransaction;

      SQL.Clear;
      SQL.Add('SELECT LC_ISO3 FROM LAENDERCODES WHERE LC_ISO2 = :Iso2');
      ParamByName('Iso2').AsString := aIso2;
      Open;

      Result := FieldByName('LC_ISO3').AsString;

      Close;

      if not WasOpen then
        Transaction.Commit;

      Free;

    end;

  end;

  function getFulltextFromIso2(aIso2: string): string;
  begin

    ReadQuery := TIBQuery.create(self);
    with ReadQuery do
    begin

      Transaction := IBT;

      WasOpen := Transaction.InTransaction;
      if not WasOpen then
        Transaction.StartTransaction;

      SQL.Clear;
      SQL.Add('SELECT LC_NAME FROM LAENDERCODES WHERE LC_ISO2 = :Iso2');
      ParamByName('Iso2').AsString := Trim(aIso2);
      Open;

      Result := FieldByName('LC_NAME').AsString;

      Close;

      if not WasOpen then
        Transaction.Commit;

      Free;

    end;

  end;

  function getFormatFromIso2(aIso2: string): integer;
  begin

    if (length(Trim(aIso2)) > 2) then
    begin
      ShowMsg(self, 'ACHTUNG: Ländereintrag aIso2 ist nicht im ISO2 Format.', mtError, [mbOk], 0);
      aIso2 := 'DE';
    end;

    ReadQuery := TIBQuery.create(self);
    with ReadQuery do
    begin

      Transaction := IBT;

      WasOpen := Transaction.InTransaction;
      if not WasOpen then
        Transaction.StartTransaction;

      SQL.Clear;
      SQL.Add('SELECT LC_FORMATID FROM LAENDERCODES WHERE LC_ISO2 = :Iso2');
      ParamByName('Iso2').AsString := Trim(aIso2);
      Open;

      Result := FieldByName('LC_FORMATID').AsInteger;

      Close;

      if not WasOpen then
        Transaction.Rollback;

      Free;

    end;

  end;

  function isLiefadresseVorlageLeer(aID: integer; aArt: integer): boolean;
  begin
    ReadQuery := TIBQuery.create(self);
    with ReadQuery do
    begin

      Transaction := IBT;

      WasOpen := Transaction.InTransaction;
      if not WasOpen then
        Transaction.StartTransaction;

      SQL.Clear;
      case aArt of
        5:
          SQL.Add('SELECT FV_LIEFADRESSE_FIRMA FROM FORMATVORLAGEN_AN WHERE FV_ID = :ID and FV_DELETE != "T"');
        6:
          SQL.Add('SELECT FV_LIEFADRESSE_PRIVAT FROM FORMATVORLAGEN_AN WHERE FV_ID = :ID and FV_DELETE != "T"');
      end;
      ParamByName('ID').AsInteger := aID;
      Open;
      Result := Fields[0].AsString = '';

      Close;

      if not WasOpen then
        Transaction.Rollback;

      Free;

    end;
  end;

  function getFormatFormatvorlagen(aID: integer; aArt: integer): string;
  begin

    ReadQuery := TIBQuery.create(self);
    with ReadQuery do
    begin

      Transaction := IBT;

      WasOpen := Transaction.InTransaction;
      if not WasOpen then
        Transaction.StartTransaction;

      SQL.Clear;
      SQL.Add('SELECT * FROM FORMATVORLAGEN_AN  WHERE FV_ID = :ID and FV_DELETE != "T"');
      ParamByName('ID').AsInteger := aID;
      Open;

      case aArt of
        1:
          Result := FieldByName('FV_ANSCHRIFT_FIRMA').AsString;
        2:
          Result := FieldByName('FV_ANSCHRIFT_PRIVAT').AsString;
        3:
          Result := FieldByName('FV_POSTFACH_FIRMA').AsString;
        4:
          Result := FieldByName('FV_POSTFACH_PRIVAT').AsString;
        5:
          Result := FieldByName('FV_LIEFADRESSE_FIRMA').AsString;
        6:
          Result := FieldByName('FV_LIEFADRESSE_PRIVAT').AsString;
      end;

      Close;

      if not WasOpen then
        Transaction.Rollback;

      Free;

    end;

  end;

  function parse(aText: string): string;
  var
    rawtext: string;
    finetext: string;
    fieldname: string;
    linecontent: string;

  const
    delim: string = '@@';

  begin

    rawtext := aText;
    finetext := '';

    while pos(delim, rawtext) > 0 do
    begin
      finetext := finetext + copy(rawtext, 1, pos(delim, rawtext) - 1);

      rawtext := copy(rawtext, pos(delim, rawtext) + 2, length(rawtext));
      fieldname := UpperCase(copy(rawtext, 1, pos(delim, rawtext) - 1));

      if fieldname = 'FIRMA' then
      begin
        finetext := finetext + Trim(Firma);
      end
      else if fieldname = 'ZUSATZ' then
      begin
        finetext := finetext + Trim(Zusatz);
      end
      else if fieldname = 'ANREDE' then
      begin
        finetext := finetext + Trim(Anrede);
      end
      else if fieldname = 'TITEL' then
      begin
        finetext := finetext + Trim(Titel);
      end
      else if fieldname = 'VORNAME' then
      begin
        finetext := finetext + Trim(Vorname);
      end
      else if fieldname = 'NAME' then
      begin
        finetext := finetext + Trim(aNachname);
      end
      else if fieldname = 'STRASSE' then
      begin
        finetext := finetext + Trim(Strasse);
      end
      else if fieldname = 'PLZ' then
      begin
        finetext := finetext + Trim(PLZ);
      end
      else if fieldname = 'ORT' then
      begin
        finetext := finetext + Trim(Ort);
      end
      else if fieldname = 'POSTFACH' then
      begin
        finetext := finetext + Trim(Postfach);
      end
      else if fieldname = 'PF_PLZ' then
      begin
        finetext := finetext + Trim(PfPLZ);
      end
      else if fieldname = 'HAUSNR' then
      begin
        finetext := finetext + Trim(HausNr);
      end
      else if fieldname = 'ANSPRECHPARTNER' then
      begin
        finetext := finetext + Trim(Ansprechpartner);
      end
      else if fieldname = 'ADRESSE2' then
      begin
        finetext := finetext + Trim(Adresse2);
      end
      else if fieldname = 'LAND_ISO2' then
      begin
        finetext := finetext + Trim(Land);
      end
      else if fieldname = 'LAND_ISO3' then
      begin
        finetext := finetext + Trim(getIso3FromIso2(Land));
      end
      else if fieldname = 'LAND_VOLL' then
      begin
        finetext := finetext + Trim(getFulltextFromIso2(Land));
      end
      else if fieldname = 'LEER' then
      begin
        finetext := finetext + '@_';
      end
      else
        finetext := finetext + '@@' + fieldname + '@@';

      rawtext := copy(rawtext, pos(delim, rawtext) + 2, length(rawtext));

    end;

    finetext := finetext + rawtext;

    // jetzt auf Leerzeilen prüfen
    rawtext := finetext;
    finetext := '';
    linecontent := '';
    while length(rawtext) > 0 do
    begin
      if copy(rawtext, 1, 2) = #13#10 then
      begin
        if Trim(linecontent) <> '' then
        begin
          finetext := finetext + Trim(linecontent) + #13#10;
          linecontent := '';
        end;
        Delete(rawtext, 1, 2);
      end
      else if copy(rawtext, 1, 2) = '@_' then
      begin
        // Linecontent := Linecontent + ' ';
        // Linecontent := Linecontent + #13#10;
        finetext := finetext + #13#10;
        Delete(rawtext, 1, 2);
      end
      else
      begin
        linecontent := linecontent + rawtext[1];
        Delete(rawtext, 1, 1);
      end;

    end;

    if linecontent <> '' then
      finetext := finetext + Trim(linecontent) + #13#10;

    Result := finetext;

  end;

begin

  Result := '';
  Formatid := getFormatFromIso2(Land);
  if Formatid > 0 then
  begin
    // Es gibts ein Ländercodsformat (in Anschriftenformatvorlagen Tabelle suchen)
    if Pf_Str = cStrasse then
    begin
      // Normale Anschrift (kein Postfach)
      if Firma <> '' then
      begin
        // Anschrieft für Firma
        // Wenn von Lieferadresse -> zuerst Lieferadresseformat prüfen
        if ANObjekt = oLieferadresse then
        begin
          if isLiefadresseVorlageLeer(Formatid, 5) then
            Result := parse(getFormatFormatvorlagen(Formatid, 1))
          else
            Result := parse(getFormatFormatvorlagen(Formatid, 5));
        end
        else
          Result := parse(getFormatFormatvorlagen(Formatid, 1));
      end
      else
      begin
        // Keine Firma -> Privat
        if ANObjekt = oLieferadresse then
        begin
          if isLiefadresseVorlageLeer(Formatid, 6) then
            Result := parse(getFormatFormatvorlagen(Formatid, 2))
          else
            Result := parse(getFormatFormatvorlagen(Formatid, 6));
        end
        else
          Result := parse(getFormatFormatvorlagen(Formatid, 2));
      end;
    end
    else
    begin
      // Es ist ein Postfachadresse
      if Firma <> '' then
        // für Firma
        Result := parse(getFormatFormatvorlagen(Formatid, 3))
      else
        // Privat
        Result := parse(getFormatFormatvorlagen(Formatid, 4));
    end;

  end
  else
  begin
    // Gibts keine Formatvorlage -> Von Stammdaten lesen
    if Pf_Str = cStrasse then
    begin
      // Normale Adresse
      if Firma <> '' then
      begin
        // für Firma
        if ANObjekt = oLieferadresse then
        begin
          if self.getAnMemoFirmaLI = '' then
            Result := parse(getAnMemoFirma)
          else
            Result := parse(getAnMemoFirmaLI);
        end
        else
          Result := parse(getAnMemoFirma);
      end
      else
      begin
        // Privat
        if ANObjekt = oLieferadresse then
        begin
          if self.getAnMemoPrivatLI = '' then
            Result := parse(getAnMemoPrivat)
          else
            Result := parse(getAnMemoPrivatLI);
        end
        else
          Result := parse(getAnMemoPrivat);
      end;
    end
    else
    begin
      // Postfachadresse
      if Firma <> '' then
        // für Firma
        Result := parse(getAnMemoFirmaPf)
      else
        // Privat
        Result := parse(getAnMemoPrivatPf);
    end;
  end;

end;
}

function TStammdaten.generateAnschriftenMemo(Anrede, aNachname, Vorname, Firma, Zusatz, Strasse, PLZ, Ort, Land, HausNr,
 Postfach, PfPLZ, Ansprechpartner, Adresse2, Titel: string; Pf_Str, ANObjekt: integer): string;
var
  ReadQuery: TIBQuery;
  WasOpen: boolean;
  Formatid: integer;
  function getIso3FromIso2(aIso2: string): string;
  begin

    aIso2 := Trim(aIso2);

    ReadQuery := TIBQuery.create(self);
    try
      ReadQuery.Transaction := IBT;
      WasOpen := ReadQuery.Transaction.InTransaction;
      if not WasOpen then
        ReadQuery.Transaction.StartTransaction;

      ReadQuery.SQL.Clear;
      ReadQuery.SQL.Add('SELECT LC_ISO3 FROM LAENDERCODES WHERE LC_ISO2 = :Iso2');
      ReadQuery.ParamByName('Iso2').AsString := aIso2;
      ReadQuery.Open;

      Result := ReadQuery.FieldByName('LC_ISO3').AsString;
    finally
      ReadQuery.Close;
      if not WasOpen then
        ReadQuery.Transaction.Commit;
      FreeAndNil(ReadQuery);
    end;
  end;

  function getFulltextFromIso2(aIso2: string): string;
  begin
    ReadQuery := TIBQuery.create(self);
    try
      ReadQuery.Transaction := IBT;

      WasOpen := ReadQuery.Transaction.InTransaction;
      if not WasOpen then
        ReadQuery.Transaction.StartTransaction;

      ReadQuery.SQL.Clear;
      ReadQuery.SQL.Add('SELECT LC_NAME FROM LAENDERCODES WHERE LC_ISO2 = :Iso2');
      ReadQuery.ParamByName('Iso2').AsString := Trim(aIso2);
      ReadQuery.Open;

      Result := ReadQuery.FieldByName('LC_NAME').AsString;

    finally
      ReadQuery.Close;
      if not WasOpen then
        ReadQuery.Transaction.Commit;
      FreeAndNil(ReadQuery);
    end;
  end;

  function getFormatFromIso2(aIso2: string): integer;
  begin
    if (length(Trim(aIso2)) > 2) then
    begin
      ShowMsg(self, 'ACHTUNG: Ländereintrag aIso2 ist nicht im ISO2 Format.', mtError, [mbOk], 0);
      aIso2 := 'DE';
    end;

    ReadQuery := TIBQuery.create(self);
    try
      ReadQuery.Transaction := IBT;

      WasOpen := ReadQuery.Transaction.InTransaction;
      if not WasOpen then
        ReadQuery.Transaction.StartTransaction;

      ReadQuery.SQL.Clear;
      ReadQuery.SQL.Add('SELECT LC_FORMATID FROM LAENDERCODES WHERE LC_ISO2 = :Iso2');
      ReadQuery.ParamByName('Iso2').AsString := Trim(aIso2);
      ReadQuery.Open;

      Result := ReadQuery.FieldByName('LC_FORMATID').AsInteger;

    finally
      ReadQuery.Close;
      if not WasOpen then
        ReadQuery.Transaction.Rollback;
      FreeAndNil(ReadQuery);
    end;
  end;

  function isLiefadresseVorlageLeer(aID: integer; aArt: integer): boolean;
  begin
    ReadQuery := TIBQuery.create(self);
    try
      ReadQuery.Transaction := IBT;
      WasOpen := ReadQuery.Transaction.InTransaction;
      if not WasOpen then
        ReadQuery.Transaction.StartTransaction;

      ReadQuery.SQL.Clear;
      case aArt of
        c_li_firma:
          ReadQuery.SQL.Add('SELECT FV_LIEFADRESSE_FIRMA FROM FORMATVORLAGEN_AN WHERE FV_ID = :ID and FV_DELETE != "T"');
        c_li_privat:
          ReadQuery.SQL.Add('SELECT FV_LIEFADRESSE_PRIVAT FROM FORMATVORLAGEN_AN WHERE FV_ID = :ID and FV_DELETE != "T"');
        c_li_postfach:
          ReadQuery.SQL.Add('SELECT FV_LIEFADRESSE_POSTFACH FROM FORMATVORLAGEN_AN WHERE FV_ID = :ID and FV_DELETE != "T"');
      end;
      ReadQuery.ParamByName('ID').AsInteger := aID;
      ReadQuery.Open;
      Result := ReadQuery.Fields[0].AsString = '';

    finally
      ReadQuery.Close;
      if not WasOpen then
        ReadQuery.Transaction.Rollback;
      ReadQuery.Free;
    end;
  end;

  function getFormatFormatvorlagen(aID: integer; aArt: integer): string;
  begin
    ReadQuery := TIBQuery.create(self);
    try
      ReadQuery.Transaction := IBT;
      WasOpen := ReadQuery.Transaction.InTransaction;
      if not WasOpen then
        ReadQuery.Transaction.StartTransaction;

      ReadQuery.SQL.Clear;
      ReadQuery.SQL.Add('SELECT * FROM FORMATVORLAGEN_AN  WHERE FV_ID = :ID and FV_DELETE != "T"');
      ReadQuery.ParamByName('ID').AsInteger := aID;
      ReadQuery.Open;

      case aArt of
        c_an_firma:
          Result := ReadQuery.FieldByName('FV_ANSCHRIFT_FIRMA').AsString;
        c_an_privat:
          Result := ReadQuery.FieldByName('FV_ANSCHRIFT_PRIVAT').AsString;
        c_an_firma_pf:
          Result := ReadQuery.FieldByName('FV_POSTFACH_FIRMA').AsString;
        c_an_privat_pf:
          Result := ReadQuery.FieldByName('FV_POSTFACH_PRIVAT').AsString;
        c_li_firma:
          Result := ReadQuery.FieldByName('FV_LIEFADRESSE_FIRMA').AsString;
        c_li_privat:
          Result := ReadQuery.FieldByName('FV_LIEFADRESSE_PRIVAT').AsString;
        c_li_postfach:
          Result := ReadQuery.FieldByName('FV_LIEFADRESSE_POSTFACH').AsString;
      end;

    finally
      ReadQuery.Close;
      if not WasOpen then
        ReadQuery.Transaction.Rollback;
      FreeAndNil(ReadQuery);
    end;
  end;

  function parse(aText: string): string;
  var
    rawtext: string;
    finetext: string;
    fieldname: string;
    linecontent: string;
  const
    delim: string = '@@';

  begin

    rawtext := aText;
    finetext := '';

    while pos(delim, rawtext) > 0 do
    begin
      finetext := finetext + copy(rawtext, 1, pos(delim, rawtext) - 1);

      rawtext := copy(rawtext, pos(delim, rawtext) + 2, length(rawtext));
      fieldname := UpperCase(copy(rawtext, 1, pos(delim, rawtext) - 1));

      if fieldname = 'FIRMA' then
      begin
        finetext := finetext + Trim(Firma);
      end
      else if fieldname = 'ZUSATZ' then
      begin
        finetext := finetext + Trim(Zusatz);
      end
      else if fieldname = 'ANREDE' then
      begin
        finetext := finetext + Trim(Anrede);
      end
      else if fieldname = 'TITEL' then
      begin
        finetext := finetext + Trim(Titel);
      end
      else if fieldname = 'VORNAME' then
      begin
        finetext := finetext + Trim(Vorname);
      end
      else if fieldname = 'NAME' then
      begin
        finetext := finetext + Trim(aNachname);
      end
      else if fieldname = 'STRASSE' then
      begin
        finetext := finetext + Trim(Strasse);
      end
      else if fieldname = 'PLZ' then
      begin
        finetext := finetext + Trim(PLZ);
      end
      else if fieldname = 'ORT' then
      begin
        finetext := finetext + Trim(Ort);
      end
      else if fieldname = 'POSTFACH' then
      begin
        finetext := finetext + Trim(Postfach);
      end
      else if fieldname = 'PF_PLZ' then
      begin
        finetext := finetext + Trim(PfPLZ);
      end
      else if fieldname = 'HAUSNR' then
      begin
        finetext := finetext + Trim(HausNr);
      end
      else if fieldname = 'ANSPRECHPARTNER' then
      begin
        finetext := finetext + Trim(Ansprechpartner);
      end
      else if fieldname = 'ADRESSE2' then
      begin
        finetext := finetext + Trim(Adresse2);
      end
      else if fieldname = 'LAND_ISO2' then
      begin
        finetext := finetext + Trim(Land);
      end
      else if fieldname = 'LAND_ISO3' then
      begin
        finetext := finetext + Trim(getIso3FromIso2(Land));
      end
      else if fieldname = 'LAND_VOLL' then
      begin
        finetext := finetext + Trim(getFulltextFromIso2(Land));
      end
      else if fieldname = 'LEER' then
      begin
        finetext := finetext + '@_';
      end
      else
        finetext := finetext + '@@' + fieldname + '@@';

      rawtext := copy(rawtext, pos(delim, rawtext) + 2, length(rawtext));
    end;

    finetext := finetext + rawtext;

    // jetzt auf Leerzeilen prüfen
    rawtext := finetext;
    finetext := '';
    linecontent := '';
    while length(rawtext) > 0 do
    begin
      if copy(rawtext, 1, 2) = slinebreak then
      begin
        if Trim(linecontent) <> '' then
        begin
          finetext := finetext + Trim(linecontent) + slinebreak;
          linecontent := '';
        end;
        Delete(rawtext, 1, 2);
      end
      else if copy(rawtext, 1, 2) = '@_' then
      begin
        finetext := finetext + slinebreak;
        Delete(rawtext, 1, 2);
      end
      else
      begin
        linecontent := linecontent + rawtext[1];
        Delete(rawtext, 1, 1);
      end;

    end;

    if linecontent <> '' then
      finetext := finetext + Trim(linecontent) + slinebreak;

    Result := finetext;

  end;

begin

  Result := '';
  Formatid := getFormatFromIso2(Land);
  if Formatid > 0 then
  begin
    // Es gibts ein Ländercodsformat (in Anschriftenformatvorlagen Tabelle suchen)
    if Pf_Str = cStrasse then
    begin
      // Normale Anschrift (kein Postfach)
      if Firma <> '' then
      begin
        // Anschrieft für Firma
        // Wenn von Lieferadresse -> zuerst Lieferadresseformat prüfen
        if ANObjekt = oLieferadresse then
        begin
          if isLiefadresseVorlageLeer(Formatid, c_li_firma) then
            Result := parse(getFormatFormatvorlagen(Formatid, c_an_firma))
          else
            Result := parse(getFormatFormatvorlagen(Formatid, c_li_firma));
        end
        else
          Result := parse(getFormatFormatvorlagen(Formatid, c_an_firma));
      end
      else
      begin
        // Keine Firma -> Privat
        if ANObjekt = oLieferadresse then
        begin
          if isLiefadresseVorlageLeer(Formatid, c_li_privat) then
            Result := parse(getFormatFormatvorlagen(Formatid, c_an_privat))
          else
            Result := parse(getFormatFormatvorlagen(Formatid, c_li_privat));
        end
        else
          Result := parse(getFormatFormatvorlagen(Formatid, c_an_privat));
      end;
    end
    else
    begin
      // Es ist ein Postfachadresse
      if Firma <> '' then
      begin
        // für Firma
        if ANObjekt = oLieferadresse then
        begin
          if isLiefadresseVorlageLeer(Formatid, c_li_postfach) then
            Result := parse(getFormatFormatvorlagen(Formatid, c_an_firma_pf))
          else
            Result := parse(getFormatFormatvorlagen(Formatid, c_li_postfach));
        end
        else
           Result := parse(getFormatFormatvorlagen(Formatid, c_an_firma_pf));
      end
      else
        // Privat
        Result := parse(getFormatFormatvorlagen(Formatid, c_an_privat_pf));
    end;
  end
  else
  begin
    // Gibts keine Formatvorlage -> Von Stammdaten lesen
    if Pf_Str = cStrasse then
    begin
      // Normale Adresse
      if Firma <> '' then
      begin
        // für Firma
        if ANObjekt = oLieferadresse then
        begin
          if self.getAnMemoFirmaLI = '' then
            Result := parse(getAnMemoFirma)
          else
            Result := parse(getAnMemoFirmaLI);
        end
        else
          Result := parse(getAnMemoFirma);
      end
      else
      begin
        // Privat
        if ANObjekt = oLieferadresse then
        begin
          if self.getAnMemoPrivatLI = '' then
            Result := parse(getAnMemoPrivat)
          else
            Result := parse(getAnMemoPrivatLI);
        end
        else
          Result := parse(getAnMemoPrivat);
      end;
    end
    else
    begin
      // Postfachadresse
      if Firma <> '' then
        // für Firma
        Result := parse(getAnMemoFirmaPf)
      else
        // Privat
        Result := parse(getAnMemoPrivatPf);
    end;
  end;

end;

function TStammdaten.getEDIDir: string;
begin
  Result := EDIDir;
end;

function TStammdaten.getEDIName: string;
begin
  Result := EDIName;
end;

function TStammdaten.getILN: string;
begin
  Result := ILN;
end;

procedure TStammdaten.setEDIDir(aWert: string);
begin
  if EDIDir <> aWert then
  begin
    EDIDir := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setEDIName(aWert: string);
begin
  if EDIName <> aWert then
  begin
    EDIName := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setILN(aWert: string);
begin
  if ILN <> aWert then
  begin
    ILN := aWert;
    Update := true;
  end;
end;

function TStammdaten.getLIAutoVersand: boolean;
begin
  Result := LIAutoVersand;
end;

function TStammdaten.getLief_nichtfortfueren: boolean;
begin
  Result := Lief_nichtfortfueren;
end;

procedure TStammdaten.setLIAutoVersand(aWert: boolean);
begin
  if LIAutoVersand <> aWert then
  begin
    LIAutoVersand := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setLief_nichtfortfueren(aWert: boolean);
begin
  if Lief_nichtfortfueren <> aWert then
  begin
    Lief_nichtfortfueren := aWert;
    Update := true;
  end;
end;

function TStammdaten.getInkassoAbfrage: boolean;
begin

  Result := InkassoAbfrage;

end;

procedure TStammdaten.setInkassoAbfrage(aWert: boolean);
begin

  if InkassoAbfrage <> aWert then
  begin
    InkassoAbfrage := aWert;
    Update := true;
  end;

end;

function TStammdaten.getEinPreisFuerAlle: boolean;
begin
  Result := EinPreisFuerAlle;
end;

function TStammdaten.getEK_beimfortfuehren_neulesen: boolean;
begin
  Result := EK_beimfortfuehren_neulesen;
end;

function TStammdaten.getPreisKGruppe: integer;
begin
  Result := PreisKGruppe;
end;

function TStammdaten.getPrioNeueTickets: integer;
begin
  Result := PrioNeueTickets;
end;

function TStammdaten.getPreisbasisVKEinheit: boolean;
begin
  Result := PreisbasisVKEinheit;
end;

procedure TStammdaten.setEingangsbelegformat(awert: string);
begin
  if _Eingangsbelegformat <> aWert then
  begin
    _Eingangsbelegformat := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setEingangsbeleg_ExportDir(awert: string);
begin
  if _Eingangsbeleg_ExportDir <> aWert then
  begin
    _Eingangsbeleg_ExportDir := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setEingangsbeleg_ImportDir(awert: string);
begin
  if _Eingangsbeleg_ImportDir <> aWert then
  begin
    _Eingangsbeleg_ImportDir := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setEinPreisFuerAlle(aWert: boolean);
begin
  if EinPreisFuerAlle <> aWert then
  begin
    EinPreisFuerAlle := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setEK_beimfortfuehren_neulesen(aWert: boolean);
begin
  if EK_beimfortfuehren_neulesen <> aWert then
  begin
    EK_beimfortfuehren_neulesen := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setPreisKGruppe(aWert: integer);
begin
  if PreisKGruppe <> aWert then
  begin
    PreisKGruppe := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setPrioNeueTickets(aWert: integer);
begin
  if (PrioNeueTickets <> aWert) then
  begin
    PrioNeueTickets := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setPreisbasisVKEinheit(aWert: boolean);
begin
  if PreisbasisVKEinheit <> aWert then
  begin
    PreisbasisVKEinheit := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setKommscheinBeiDruck;
begin

  setKommscheinBeiFreigabe(false);

end;

procedure TStammdaten.setKommscheinBeiFreigabe;
begin

  setKommscheinBeiFreigabe(true);

end;

procedure TStammdaten.setKommscheinBeiFreigabe(aWert: boolean);
begin

  if KommscheinBeiFreigabe <> aWert then
  begin
    KommscheinBeiFreigabe := aWert;
    Update := true;
  end;

end;

procedure TStammdaten.setVOSachbearbeiterUeberschreiben(aWert: boolean);
begin

  if VOSachbearbeiterUeberschreiben <> aWert then
  begin
    VOSachbearbeiterUeberschreiben := aWert;
    Update := true;
  end;

end;

function TStammdaten.getKommscheinBeiDruck: boolean;
begin

  Result := not getKommscheinBeiFreigabe;

end;

function TStammdaten.getKommscheinBeiFreigabe: boolean;
begin

  Result := KommscheinBeiFreigabe;

end;

function TStammdaten.getVOSachbearbeiterUeberschreiben: boolean;
begin

  Result := VOSachbearbeiterUeberschreiben;

end;

function TStammdaten.getMaxDatum: TDateTime;
begin
  Result := 402134;
end;

function TStammdaten.getMBWert: boolean;
begin
  Result := MBWert;
end;

function TStammdaten.getMBWertText: string;
begin
  Result := MBWertText;
end;

function TStammdaten.getMBWarenGrp: integer;
begin
  Result := MBWarenGrp;
end;

function TStammdaten.getMinDatum: TDateTime;
begin
  Result := 0;
end;

function TStammdaten.getNullEuroWarnung: boolean;
begin
  Result := NullEuroWarnung;
end;

procedure TStammdaten.setNullEuroWarnung(aWert: boolean);
begin
  if NullEuroWarnung <> aWert then
  begin
    NullEuroWarnung := aWert;
    Update := true;
  end;
end;

function TStammdaten.getKontorREMemo: boolean;
begin
  Result := KontorREMemo;
end;

function TStammdaten.getKredKontenAuto: boolean;
begin
  Result := KredKontenAuto;
end;

function TStammdaten.getKredNr_Bis: integer;
begin
  Result := KredNr_Bis;
end;

function TStammdaten.getKredNr_Von: integer;
begin
  Result := KredNr_Von;
end;

function TStammdaten.getKred_Vergabeart: integer;
begin
  Result := Kred_Vergabeart;
end;

procedure TStammdaten.setKontorREMemo(aWert: boolean);
begin
  if KontorREMemo <> aWert then
  begin
    KontorREMemo := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setKredKontenAuto(aWert: boolean);
begin
  if KredKontenAuto <> aWert then
  begin
    KredKontenAuto := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setKredNr_Bis(aWert: integer);
begin
  if KredNr_Bis <> aWert then
  begin
    KredNr_Bis := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setKredNr_Von(aWert: integer);
begin
  if KredNr_Von <> aWert then
  begin
    KredNr_Von := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setKred_Vergabeart(aWert: integer);
begin
  if Kred_Vergabeart <> aWert then
  begin
    Kred_Vergabeart := aWert;
    Update := true;
  end;
end;

function TStammdaten.getSRTextImmer: boolean;
begin
  Result := SRTextImmer;
end;

procedure TStammdaten.setSRTextImmer(aWert: boolean);
begin
  if SRTextImmer <> aWert then
  begin
    SRTextImmer := aWert;
    Update := true;
  end;
end;

function TStammdaten.getVoArtInGrid: boolean;
begin
  Result := VoArtInGrid;
end;

function TStammdaten.getVorgangNettoSumme: boolean;
begin
  Result := VorgangNettoSumme;
end;
{
function TStammdaten.getVorgangsspalten: TBitmuster;
begin
  Result := Vorgangsspalten;
end;
}
function TStammdaten.getVorgang_Portodeaktivieren: boolean;
begin
  Result := Vorgang_Portodeaktivieren;
end;

procedure TStammdaten.setVoArtInGrid(aWert: boolean);
begin
  if VoArtInGrid <> aWert then
  begin
    VoArtInGrid := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setVorgangNettoSumme(aWert: boolean);
begin
  if (VorgangNettoSumme <> aWert) then
  begin
    VorgangNettoSumme := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setVorgang_ArchivDir(awert: string);
begin
  if (_Vorgang_ArchivDir <> aWert) then
  begin
    _Vorgang_ArchivDir := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setVorgang_Portodeaktivieren(aWert: boolean);
begin
  if (Vorgang_Portodeaktivieren <> aWert) then
  begin
    Vorgang_Portodeaktivieren := aWert;
    Update := true;
  end;
end;

function TStammdaten.getREKondNetto: string;
begin
  Result := REKondNetto;
end;

function TStammdaten.getREKondNettoTage: string;
begin
  Result := REKondNettoTage;
end;

function TStammdaten.getREKondSkonto: string;
begin
  Result := REKondSkonto;
end;

function TStammdaten.getREKondSkontoTage: string;
begin
  Result := REKondSkontoTage;
end;

procedure TStammdaten.setREKondNetto(aWert: string);
begin
  if REKondNetto <> aWert then
  begin
    REKondNetto := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setREKondNettoTage(aWert: string);
begin
  if REKondNettoTage <> aWert then
  begin
    REKondNettoTage := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setREKondSkonto(aWert: string);
begin
  if REKondSkonto <> aWert then
  begin
    REKondSkonto := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setREKondSkontoTage(aWert: string);
begin
  if REKondSkontoTage <> aWert then
  begin
    REKondSkontoTage := aWert;
    Update := true;
  end;
end;

function TStammdaten.getPersonenkontenAuto: boolean;
begin
  Result := PersonenkontenAuto;
end;

function TStammdaten.getPicklistenDrucken: boolean;
begin
  Result := PicklistenDrucken;
end;

procedure TStammdaten.setPersonenkontenAuto(aWert: boolean);
begin
  if PersonenkontenAuto <> aWert then
  begin
    PersonenkontenAuto := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setPicklistenDrucken(aWert: boolean);
begin
  if (PicklistenDrucken <> aWert) then
  begin
    PicklistenDrucken := aWert;
    Update := true;
  end;
end;

function TStammdaten.getEigeneOPVerwaltung: boolean;
begin
  Result := EigeneOPVerwaltung;
end;

procedure TStammdaten.setEigeneOPVerwaltung(aWert: boolean);
begin
  if EigeneOPVerwaltung <> aWert then
  begin
    EigeneOPVerwaltung := aWert;
    Update := true;
  end;
end;

function TStammdaten.getStdTeillieferVerhalten: integer;
begin
  Result := StdTeillieferVerhalten;
end;

procedure TStammdaten.setStdTeillieferVerhalten(aWert: integer);
begin
  if StdTeillieferVerhalten <> aWert then
  begin
    StdTeillieferVerhalten := aWert;
    Update := true;
  end;
end;

function TStammdaten.getVerbuchenNachTagen: integer;
begin
  Result := VerbuchenNachTagen;
end;

procedure TStammdaten.setVerbuchenNachTagen(aWert: integer);
begin
  if VerbuchenNachTagen <> aWert then
  begin
    VerbuchenNachTagen := aWert;
    Update := true;
  end;
end;

function TStammdaten.getKundenPLZVertreter: boolean;
begin
  Result := KundenPLZVertreter;
end;

function TStammdaten.getKundensuchspalten: TBitmuster;
begin
  Result := Kundensuchspalten;
end;

function TStammdaten.getKundeSofortFreigeben: boolean;
begin
  Result := KundeSofortFreigeben;
end;

procedure TStammdaten.setKundenPLZVertreter(aWert: boolean);
begin
  if KundenPLZVertreter <> aWert then
  begin
    KundenPLZVertreter := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setKundeSofortFreigeben(aWert: boolean);
begin
  if KundeSofortFreigeben <> aWert then
  begin
    KundeSofortFreigeben := aWert;
    Update := true;
  end;
end;

function TStammdaten.getRabattUeberschreiben: boolean;
begin
  Result := RabattUeberschreiben;
end;

procedure TStammdaten.setRabatt2Anzeigen(const Value: Boolean);
begin
  if _Rabatt2Anzeigen <> Value then
  begin
    _Rabatt2Anzeigen := Value;
    Update := true;
  end;
end;

procedure TStammdaten.setRabattUeberschreiben(aWert: boolean);
begin
  if RabattUeberschreiben <> aWert then
  begin
    RabattUeberschreiben := aWert;
    Update := true;
  end;
end;

function TStammdaten.getDPDAbsender: string;
begin

  Result := DPDAbsender;

end;

function TStammdaten.getDPDDepotkennung: string;
begin

  Result := DPDDepotkennung;

end;

function TStammdaten.getDPDKontoNr: string;
begin

  Result := DPDKontoNr;

end;

function TStammdaten.getDPDKundennummer: string;
begin

  Result := DPDKundennummer;

end;

function TStammdaten.getDPDNNAufschlag: double;
begin

  Result := DPDNNAufschlag;

end;

function TStammdaten.getDPDRoutenVersion: string;
begin

  Result := DPDRoutenVersion;

end;

procedure TStammdaten.setDPDAbsender(aAbsender: string);
begin

  if DPDAbsender <> aAbsender then
  begin
    DPDAbsender := aAbsender;
    Update := true;
  end;

end;

procedure TStammdaten.setDPDDepotkennung(aKennung: string);
begin

  if DPDDepotkennung <> aKennung then
  begin
    DPDDepotkennung := aKennung;
    Update := true;
  end;

end;

procedure TStammdaten.setDPDKontoNr(aKontoNr: string);
begin

  if DPDKontoNr <> aKontoNr then
  begin
    DPDKontoNr := aKontoNr;
    Update := true;
  end;

end;

procedure TStammdaten.setDPDKundennummer(aKundennummer: string);
begin

  if DPDKundennummer <> aKundennummer then
  begin
    DPDKundennummer := aKundennummer;
    Update := true;
  end;

end;

procedure TStammdaten.setDPDNNAufschlag(aAufschlag: double);
begin

  if DPDNNAufschlag <> aAufschlag then
  begin
    DPDNNAufschlag := aAufschlag;
    Update := true;
  end;

end;

procedure TStammdaten.setDPDRoutenVersion(aVersion: string);
begin

  if DPDRoutenVersion <> aVersion then
  begin
    DPDRoutenVersion := aVersion;
    Update := true;
  end;

end;

function TStammdaten.getDPDBank: string;
begin

  Result := DPDBank;

end;

function TStammdaten.getDPDBlz: string;
begin

  Result := DPDBlz;

end;

function TStammdaten.getDPDDepotAdresse: string;
begin

  Result := DPDDepotAdresse;

end;

function TStammdaten.getDPDDepotFax: string;
begin

  Result := DPDDepotFax;

end;

function TStammdaten.getDPDDepotTel: string;
begin

  Result := DPDDepotTel;

end;

procedure TStammdaten.setDPDBank(const aBank: string);
begin

  if DPDBank <> aBank then
  begin
    DPDBank := aBank;
    Update := true;
  end;

end;

procedure TStammdaten.setDPDBlz(aBLZ: string);
begin

  if DPDBlz <> aBLZ then
  begin
    DPDBlz := aBLZ;
    Update := true;
  end;

end;

procedure TStammdaten.setDPDDepotAdresse(aDepotAdresse: string);
begin

  if DPDDepotAdresse <> aDepotAdresse then
  begin
    DPDDepotAdresse := aDepotAdresse;
    Update := true;
  end;

end;

procedure TStammdaten.setDPDDepotFax(aDepotFax: string);
begin

  if DPDDepotFax <> aDepotFax then
  begin
    DPDDepotFax := aDepotFax;
    Update := true;
  end;

end;

procedure TStammdaten.setDPDDepotTel(aDepotTel: string);
begin

  if DPDDepotTel <> aDepotTel then
  begin
    DPDDepotTel := aDepotTel;
    Update := true;
  end;

end;

function TStammdaten.getEDIMitarbeiter: pointer;
begin
  if (EDIMitarbeiter = nil) and (EDIMitarbeiterID <> 0) then
    EDIMitarbeiter := TMitarbeiter.create(self, EDIMitarbeiterID, self, IBT);

  Result := EDIMitarbeiter;
end;

function TStammdaten.getEDIMitarbeiterID: integer;
begin
  Result := EDIMitarbeiterID;
end;

function TStammdaten.getEDILager: integer;
begin
  Result := EDILager;
end;

function TStammdaten.getEDIVersandfenster: integer;
begin
  Result := EDIVersandfenster;
end;

procedure TStammdaten.setEDILager(aWert: integer);
begin
  if EDILager <> aWert then
  begin
    EDILager := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setEDIMitarbeiterID(aWert: integer);
begin
  if EDIMitarbeiterID <> aWert then
  begin
    if EDIMitarbeiter <> nil then
      FreeAndNil(EDIMitarbeiter);

    EDIMitarbeiterID := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setEDIVersandfenster(aWert: integer);
begin
  if EDIVersandfenster <> aWert then
  begin
    EDIVersandfenster := aWert;
    Update := true;
  end;
end;

function TStammdaten.getEDIGeschaeftsbereich: integer;
begin
  Result := EDIGeschaeftsbereich;
end;

procedure TStammdaten.setEDIGeschaeftsbereich(aWert: integer);
begin
  if EDIGeschaeftsbereich <> aWert then
  begin
    EDIGeschaeftsbereich := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setEDIImportDir(aWert: string);
begin

  if EDIImportDir <> aWert then
  begin
    EDIImportDir := aWert;
    Update := true;
  end;

end;

function TStammdaten.getEDIImportDir: string;
begin

  Result := EDIImportDir;

end;

function TStammdaten.getUseVorgangLiefertermin: boolean;
begin
  Result := UseVorgangLiefertermin;
end;

function TStammdaten.getUstID: string;
begin
  Result := UstID;
end;

procedure TStammdaten.setUPS_KUNR(aWert: string);
begin
  if UPS_KUNR <> aWert then
  begin
    UPS_KUNR := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setUPS_Telefon(aWert: string);
begin
  if (UPS_Telefon <> aWert) then
  begin
    UPS_Telefon := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setUPS_Verzeichnis(const aWert: string);
begin
  if UPS_Verzeichnis <> aWert then
  begin
    UPS_Verzeichnis := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setUPS_Warenbeschreibung(aWert: string);
begin
  if UPS_Warenbeschreibung <> aWert then
  begin
    UPS_Warenbeschreibung := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setUseVorgangLiefertermin(aWert: boolean);
begin
  if UseVorgangLiefertermin <> aWert then
  begin
    UseVorgangLiefertermin := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setUstID(aWert: string);
begin
  if UstID <> aWert then
  begin
    UstID := aWert;
    Update := true;
  end;
end;

function TStammdaten.getNachkommaDruck: integer;
begin
  Result := NachkommaDruck;
end;

function TStammdaten.getNachkommaEinzelnpreis: integer;
begin
  Result := NachkommaEinzelnpreis;
end;

function TStammdaten.getNachkommaMenge: integer;
begin
  Result := NachkommaMenge;
end;

function TStammdaten.getNachkommaPos: integer;
begin
  Result := NachkommaPos;
end;

procedure TStammdaten.setNachkommaDruck(aWert: integer);
begin
  if NachkommaDruck <> aWert then
  begin
    NachkommaDruck := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setNachkommaEinzelnpreis(aWert: integer);
begin
  if NachkommaEinzelnpreis <> aWert then
  begin
    NachkommaEinzelnpreis := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setNachkommaMenge(aWert: integer);
begin
  if NachkommaMenge <> aWert then
  begin
    NachkommaMenge := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setNachkommaPos(aWert: integer);
begin
  if NachkommaPos <> aWert then
  begin
    NachkommaPos := aWert;
    Update := true;
  end;
end;

function TStammdaten.getRiskCheckCount: integer;
begin

  Result := RiskCheckCount;

end;

procedure TStammdaten.setRiskcheckCount(aCount: integer);
begin

  if RiskCheckCount <> aCount then
  begin
    RiskCheckCount := aCount;
    Update := true;
  end;

end;

{
function TStammdaten.getDruckobjekt: TDrucken;
begin
  if Druckobjekt = nil then
    Druckobjekt := TDrucken.create(self, nil, self, IBT);
  Result := Druckobjekt;
end;
}

function TStammdaten.getStdSprache: integer;
begin

  result := TOptimaStandard.getSprache;

end;

function TStammdaten.getTransaction: TIBTransaction;
begin
  Result := IBT;
end;

function TStammdaten.getAktGB: integer;
begin
  Result := aktGB;
end;

procedure TStammdaten.setaktGB(aWert: integer);
begin
  aktGB := aWert;
end;

function TStammdaten.getVOSperreBeiGedruckt: boolean;
begin
  Result := VOSperreBeiGedruckt;
end;

function TStammdaten.getVoSuche_Anzahltage: integer;
begin
  Result := VoSuche_Anzahltage;
end;

function TStammdaten.getVoSuche_vondatum: TDateTime;
begin
  Result := VoSuche_vondatum;
end;

function TStammdaten.getVOVersandBisTage: integer;
begin
  Result := VOVersandBisTage;
end;

function TStammdaten.getVo_status_beimFortfuehren: integer;
begin
  Result := Vo_status_beimFortfuehren;
end;

function TStammdaten.getVo_status_beimKopieren: integer;
begin
  Result := Vo_status_beimKopieren
end;

function TStammdaten.getVo_status_inER_Fortfuehren: integer;
begin
  Result := Vo_status_inER_Fortfuehren;
end;

function TStammdaten.getVo_status_inRE_Fortfuehren: integer;
begin
  Result := Vo_status_inRE_Fortfuehren
end;

function TStammdaten.getVO_Suche_Status: integer;
begin
  Result := VO_Suche_Status;
end;

procedure TStammdaten.setVOSperreBeiGedruckt(aWert: boolean);
begin
  if VOSperreBeiGedruckt <> aWert then
  begin
    VOSperreBeiGedruckt := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setVoSuche_Anzahltage(aWert: integer);
begin
  if VoSuche_Anzahltage <> aWert then
  begin
    VoSuche_Anzahltage := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setVoSuche_vondatum(aWert: TDateTime);
begin
  if VoSuche_vondatum <> aWert then
  begin
    VoSuche_vondatum := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setVOVersandBisTage(aWert: integer);
begin
  if VOVersandBisTage <> aWert then
  begin
    VOVersandBisTage := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setVo_status_beimFortfuehren(aWert: integer);
begin
  if Vo_status_beimFortfuehren <> aWert then
  begin
    Vo_status_beimFortfuehren := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setVo_status_beimKopieren(aWert: integer);
begin
  if Vo_status_beimKopieren <> aWert then
  begin
    Vo_status_beimKopieren := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setVo_status_inER_Fortfuehren(aWert: integer);
begin
  if Vo_status_inER_Fortfuehren <> aWert then
  begin
    Vo_status_inER_Fortfuehren := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setVo_status_inRE_Fortfuehren(aWert: integer);
begin
  if Vo_status_inRE_Fortfuehren <> aWert then
  begin
    Vo_status_inRE_Fortfuehren := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setVO_Suche_Status(aWert: integer);
begin
  if VO_Suche_Status <> aWert then
  begin
    VO_Suche_Status := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.SetMandant(aMandantID: integer);
begin

  AktMandantID := aMandantID;

end;

function TStammdaten.getAktMandantID: integer;
begin

  Result := AktMandantID;

end;

function TStammdaten.getBei_freigabe_MA_ueberschreiben: boolean;
begin
  Result := Bei_freigabe_MA_ueberschreiben;
end;

function TStammdaten.getBilderAlle: boolean;
begin
  Result := BilderAlle;
end;

function TStammdaten.getBudgetKG: integer;
begin
  Result := BudgetKG;
end;

procedure TStammdaten.setBei_freigabe_MA_ueberschreiben(aWert: boolean);
begin
  if Bei_freigabe_MA_ueberschreiben <> aWert then
  begin
    Bei_freigabe_MA_ueberschreiben := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setBestellung_autom_Freigeben(aValue: boolean);
begin
  if not aValue = _Bestellung_Autom_Freigeben then
  begin
    Update := true;
    _Bestellung_Autom_Freigeben := aValue;
  end;
end;

procedure TStammdaten.setBilderAlle(aWert: boolean);
begin
  if BilderAlle <> aWert then
  begin
    BilderAlle := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setBudgetKG(aWert: integer);
begin
  if BudgetKG <> aWert then
  begin
    BudgetKG := aWert;
    Update := true;
  end;
end;

function TStammdaten.isRechnungGetrennt: boolean;
begin
  Result := RechnungGetrennt;
end;

function TStammdaten.isReportPfadUmgeleitet: boolean;
begin

  Result := ReportPfadUmgeleitet;

end;

function TStammdaten.getSMPass: string;
var
  KryptPass: string;
  KryptChar: char;
  x: integer;
begin

  KryptPass := '';

  for x := 1 to length(SMPass) do
  begin

    KryptChar := SMPass[x];
    KryptChar := chr(ord(KryptChar) xor ord('A'));
    KryptPass := KryptPass + KryptChar;

  end;

  Result := KryptPass;

end;

procedure TStammdaten.setSMPass(aSMPass: string);
var
  KryptPass: string;
  KryptChar: char;
  x: integer;
begin

  KryptPass := '';

  for x := 1 to length(aSMPass) do
  begin

    KryptChar := aSMPass[x];
    KryptChar := chr(ord(KryptChar) xor ord('A'));
    KryptPass := KryptPass + KryptChar;

  end;

  if KryptPass <> SMPass then
  begin
    SMPass := KryptPass;
    Update := true;
  end;
end;

procedure TStammdaten.ActivateLogging(aLabel: TLabel; aMemo: TMemo; aLogLevel: byte);
begin
  ActivateLogging('default.log', aLabel, aMemo, aLogLevel);
end;

destructor TStammdaten.Destroy;
begin
  // if (Log <> nil) then FreeAndNil(Log);
  if (DruckablaufHelper <> nil) then FreeAndNil(DruckablaufHelper);
  Instance := nil;
  if (Vorgangsspalten <> nil) then
    Vorgangsspalten.Free;
  if (Kundensuchspalten <> nil) then
    Kundensuchspalten.Free;
  // if (Artikelspalten <> nil) then Artikelspalten.free;

  inherited;
end;

procedure TStammdaten.forceUpdate;
begin
  Update := true;
end;

procedure TStammdaten.setDruckParameter(aParams: string);
begin

  if aParams <> DruckParameter then
  begin
    DruckParameter := aParams;
    Update := true;
  end;

end;

function TStammdaten.getDruckParameter: string;
begin

  Result := DruckParameter;

end;

function TStammdaten.isServer: boolean;
begin
  Result := Server;
end;

procedure TStammdaten.setServer(aWert: boolean);
begin
  Server := aWert;
end;

constructor TStammdaten.create(aOwner: TComponent; aIBT: TIBTransaction; aAktuellerMandantID: integer; aServer: boolean);
begin
  self.create(aOwner, aIBT, aAktuellerMandantID);
  Server := aServer;
end;

function TStammdaten.getLog: TLogging;
begin
  if fLog = nil then
    ActivateLogging(nil, nil, llDebug);
  Result := fLog;
end;

procedure TStammdaten.ActivateLogging(aFileName: string; aLabel: TLabel; aMemo: TMemo; aLogLevel: byte);
begin

  if (fLog = nil) then
    fLog := TLogging.getInstance;

  fLog.setStatusLabel(aLabel);
  fLog.setLogMemo(aMemo);
  fLog.setLogLevel(aLogLevel);
  fLog.setFilename(aFileName);

end;


function TStammdaten.getWELager: integer;
begin
  Result := WELager;
end;

function TStammdaten.getWEPlatz: integer;
begin
  Result := WEPlatz;
end;

procedure TStammdaten.setWELager(aWert: integer);
begin
  if (WELager <> aWert) then
  begin
    WELager := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setWEPlatz(aWert: integer);
begin
  if (WEPlatz <> aWert) then
  begin
    WEPlatz := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setKuSucheErweitert(aWert: boolean);
begin

  if KuSucheErweitert <> aWert then
  begin
    KuSucheErweitert := aWert;
    Update := true;
  end;

end;

function TStammdaten.isKuSucheErweitert: boolean;
begin

  Result := KuSucheErweitert;

end;

function TStammdaten.getMitarbeiter: pointer;
begin
  Result := _Mitarbeiter;
end;

function TStammdaten.getMitarbeiterTicketsystem: integer;
begin
  Result := MitarbeiterTicketsystem;
end;

procedure TStammdaten.setMitarbeiter(aMitarbeiter: pointer);
begin
  if (_Mitarbeiter <> nil) and (TMitarbeiter(_Mitarbeiter).Owner = self) then
    FreeAndNil(_Mitarbeiter);
  _Mitarbeiter := aMitarbeiter;
end;

procedure TStammdaten.setMitarbeiterTicketsystem(aWert: integer);
begin
  if MitarbeiterTicketsystem <> aWert then
  begin
    MitarbeiterTicketsystem := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setKuSperreInkasso(aWert: boolean);
begin

  if KuSperreInkasso <> aWert then
  begin
    KuSperreInkasso := aWert;
    Update := true;
  end;

end;

function TStammdaten.isSperreInkasso: boolean;
begin

  Result := KuSperreInkasso;

end;

procedure TStammdaten.setMahngebuehrStufe1(aMahngebuehr: real);
begin

  if aMahngebuehr <> MahngebuehrStufe1 then
  begin
    MahngebuehrStufe1 := aMahngebuehr;
    Update := true;
  end;

end;

function TStammdaten.getMahngebuehrStufe1: real;
begin

  Result := MahngebuehrStufe1;

end;

function TStammdaten.getMahngebuehrStufe2: real;
begin

  Result := MahngebuehrStufe2;

end;

function TStammdaten.getMahngebuehrStufe3: real;
begin

  Result := MahngebuehrStufe3;

end;

function TStammdaten.getMahngebuehrStufe4: real;
begin

  Result := MahngebuehrStufe4;

end;

procedure TStammdaten.setMahngebuehrStufe2(aMahngebuehr: real);
begin

  if aMahngebuehr <> MahngebuehrStufe2 then
  begin
    MahngebuehrStufe2 := aMahngebuehr;
    Update := true;
  end;

end;

procedure TStammdaten.setMahngebuehrStufe3(aMahngebuehr: real);
begin

  if aMahngebuehr <> MahngebuehrStufe3 then
  begin
    MahngebuehrStufe3 := aMahngebuehr;
    Update := true;
  end;

end;

procedure TStammdaten.setMahngebuehrStufe4(aMahngebuehr: real);
begin

  if aMahngebuehr <> MahngebuehrStufe4 then
  begin
    MahngebuehrStufe4 := aMahngebuehr;
    Update := true;
  end;

end;

function TStammdaten.getSammelRe_Porto: boolean;
begin
  Result := SammelRe_Porto;
end;

function TStammdaten.getPorto_Skontierbar: boolean;
begin
  Result := Porto_Skontierbar;
end;

procedure TStammdaten.setSammelRe_Porto(aWert: boolean);
begin
  if (SammelRe_Porto <> aWert) then
  begin
    SammelRe_Porto := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setPorto_Skontierbar(aWert: boolean);
begin
  if (Porto_Skontierbar <> aWert) then
  begin
    Porto_Skontierbar := aWert;
    Update := true;
  end;
end;

function TStammdaten.getCheckSperre: boolean;
begin
  Result := CheckSperre;
end;

procedure TStammdaten.setCheckSperre(aWert: boolean);
begin
  if CheckSperre <> aWert then
  begin
    CheckSperre := aWert;
    Update := true;
  end;
end;

function TStammdaten.getNVEErfassen: boolean;
begin
  Result := NVEErfassen;
end;

procedure TStammdaten.setNVEErfassen(aWert: boolean);
begin
  if NVEErfassen <> aWert then
  begin
    NVEErfassen := aWert;
    Update := true;
  end;
end;

function TStammdaten.getDatevKontenManipulieren: boolean;
begin
  Result := DatevKontenManipulieren;
end;

procedure TStammdaten.setDatevKontenManipulieren(aWert: boolean);
begin
  if DatevKontenManipulieren <> aWert then
  begin
    DatevKontenManipulieren := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setTicketabrechnen(aWert: boolean);
begin
  if Ticketabrechnen <> aWert then
  begin
    Ticketabrechnen := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setTicketArtikel(aArtikelID: integer);
begin

  if TicketArtikel <> aArtikelID then
  begin
    TicketArtikel := aArtikelID;
    Update := true;
  end;

end;

procedure TStammdaten.setTicket_Kumatchzeigen(aWert: boolean);
begin
  if Ticket_Kumatchzeigen <> aWert then
  begin
    Ticket_Kumatchzeigen := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setTicket_KUmatch_laenge(aWert: integer);
begin
  if Ticket_KUmatch_laenge <> aWert then
  begin
    Ticket_KUmatch_laenge := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setTransportVersInPos(aWert: boolean);
begin
  if _TransportVers_InPos <> aWert then
  begin
    _TransportVers_InPos := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setTransportVersProz(aWert: real);
begin
  if _TransportVers_Proz <> aWert then
  begin
    _TransportVers_Proz := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setTransportVersVerwenden(aWert: integer);
begin
  if _TransportVers_Verwenden <> aWert then
  begin
    _TransportVers_Verwenden := aWert;
    Update := true;
  end;
end;

function TStammdaten.getTicketabrechnen: boolean;
begin
  Result := Ticketabrechnen;
end;

function TStammdaten.getTicketArtikel: integer;
begin

  Result := TicketArtikel;

end;

function TStammdaten.getTicket_Kumatchzeigen: boolean;
begin
  Result := Ticket_Kumatchzeigen;
end;

function TStammdaten.getTicket_KUmatch_laenge: integer;
begin
  Result := Ticket_KUmatch_laenge;
end;

function TStammdaten.getVerdichtungskontoDebitor: integer;
begin

  Result := VerdichtungDebitoren;

end;

function TStammdaten.getVerdichtungskontoKreditor: integer;
begin

  Result := VerdichtungKreditoren;

end;

procedure TStammdaten.setVerdichtungskontoDebitor(aWert: integer);
begin

  if VerdichtungDebitoren <> aWert then
  begin
    Update := true;
    VerdichtungDebitoren := aWert;
  end;

end;

procedure TStammdaten.setVerdichtungskontoKreditor(aWert: integer);
begin

  if VerdichtungKreditoren <> aWert then
  begin
    Update := true;
    VerdichtungKreditoren := aWert;
  end;

end;

function TStammdaten.getWarenGrP: integer;
begin
  Result := WarenGrP;
end;

procedure TStammdaten.setWarenGrP(aWert: integer);
begin
  if WarenGrP <> aWert then
  begin
    Update := true;
    WarenGrP := aWert;
  end;
end;

function TStammdaten.getMwST_Vermindert(aDatum: TDateTime): real;
begin
  if aDatum < MwST_Stichtag then
    Result := MwST_vermindert_1
  else
    Result := MwST_vermindert_2;
end;

function TStammdaten.getMwST_voll(aDatum: TDateTime): real;
begin
  if aDatum < MwST_Stichtag then
    Result := MwST_voll_1
  else
    Result := MwST_voll_2;
end;

function TStammdaten.getMwST_Stichtag: TDateTime;
begin
  Result := MwST_Stichtag;
end;

function TStammdaten.getMwST_vermindert_1: real;
begin
  Result := MwST_vermindert_1;
end;

function TStammdaten.getMwST_vermindert_2: real;
begin
  Result := MwST_vermindert_2;
end;

function TStammdaten.getMwST_voll_1: real;
begin
  Result := MwST_voll_1;
end;

function TStammdaten.getMwST_voll_2: real;
begin
  Result := MwST_voll_2;
end;

function TStammdaten.getMySqlLowerCase: boolean;
begin
  Result := MySqlLowerCase;
end;

function TStammdaten.getMySqlUtf8: boolean;
begin
  Result := MySqlUtf8;
end;

procedure TStammdaten.setMwST_Stichtag(aWert: TDateTime);
begin
  if MwST_Stichtag <> aWert then
  begin
    MwST_Stichtag := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setMwST_vermindert_1(aWert: real);
begin
  if MwST_vermindert_1 <> aWert then
  begin
    MwST_vermindert_1 := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setMwST_vermindert_2(aWert: real);
begin
  if MwST_vermindert_2 <> aWert then
  begin
    MwST_vermindert_2 := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setMwST_voll_1(aWert: real);
begin
  if MwST_voll_1 <> aWert then
  begin
    MwST_voll_1 := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setMwST_voll_2(aWert: real);
begin
  if MwST_voll_2 <> aWert then
  begin
    MwST_voll_2 := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setMySqlLowerCase(aWert: boolean);
begin
  if MySqlLowerCase <> aWert then
  begin
    MySqlLowerCase := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setMySqlUtf8(aWert: boolean);
begin
  if MySqlUtf8 <> aWert then
  begin
    MySqlUtf8 := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setVKPreiseAnzeigen(aWert: boolean);
begin

  if aWert <> VKPreiseAnzeigen then
  begin
    VKPreiseAnzeigen := aWert;
    Update := true;
  end;

end;

function TStammdaten.isVKPreiseAnzeigen: boolean;
begin

  Result := VKPreiseAnzeigen;

end;

function TStammdaten.isUmsatzProvision: boolean;
begin
  Result := UmsatzProvision;
end;

procedure TStammdaten.setUmsatzprovision(aWert: boolean);
begin
  if (UmsatzProvision <> aWert) then
  begin
    UmsatzProvision := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setResMengenSofort(aWert: boolean);
begin

  if aWert <> ResMengenSofort then
  begin
    ResMengenSofort := aWert;
    Update := true;
  end;

end;

function TStammdaten.isResMengenSofort: boolean;
begin

  Result := ResMengenSofort;

end;

procedure TStammdaten.setServiceVersandart(aVersandart: pointer);
var
  aID: integer;
begin

  if aVersandart = nil then
    aID := 0
  else
    aID := TPorto(aVersandart).getID;

  setServiceVersandart(aID);

end;

procedure TStammdaten.setServiceGruppieren(aWert: boolean);
begin
  if (ServiceGruppieren <> aWert) then
  begin
    ServiceGruppieren := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setServiceLieferschein(aWert: boolean);
begin
  if (ServiceLieferschein <> aWert) then
  begin
    ServiceLieferschein := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setServiceVersandart(aVersandart: integer);
begin

  if ServiceVersandartID <> aVersandart then
  begin
    ServiceVersandartID := aVersandart;
    Update := true;

    FreeAndNil(ServiceVersandart);
  end;

end;

function TStammdaten.getServiceGruppieren: boolean;
begin
  Result := ServiceGruppieren;
end;

function TStammdaten.getServiceLieferschein: boolean;
begin
  Result := ServiceLieferschein;
end;

function TStammdaten.getServiceVersandart: pointer;
begin

  if (ServiceVersandart = nil) and (ServiceVersandartID <> 0) then
    ServiceVersandart := TPorto.create(self, ServiceVersandartID, self, self.IBT);

  Result := ServiceVersandart;

end;

function TStammdaten.getServiceVersandartID: integer;
begin

  Result := ServiceVersandartID;

end;

function TStammdaten.getWaehrungszeichen: string;
begin
  Result := Waehrungszeichen;
end;

procedure TStammdaten.setWaehrungszeichen(aWert: string);
begin
  if (Waehrungszeichen <> aWert) then
  begin
    Waehrungszeichen := aWert;
    Update := true;
  end;
end;

function TStammdaten.getDruckerAuswahlSynchron: boolean;
begin
  Result := DruckerAuswahlSynchron;
end;

procedure TStammdaten.setDruckerAuswahlSynchron(aWert: boolean);
begin
  if (DruckerAuswahlSynchron <> aWert) then
  begin
    DruckerAuswahlSynchron := aWert;
    Update := true;
  end;
end;

function TStammdaten.getAbrechnungszeitFK: boolean;
begin
  Result := AbrechnungszeitFK;
end;

function TStammdaten.getAddisonPass: string;
begin
  Result := AddisonPass;
end;

function TStammdaten.getAddisonUser: string;
begin
  Result := AddisonUser;
end;

procedure TStammdaten.setAbrechnungszeitFK(aAbrechnungszeitFK: boolean);
begin
  if (AbrechnungszeitFK <> aAbrechnungszeitFK) then
  begin
    AbrechnungszeitFK := aAbrechnungszeitFK;
    Update := true;
  end;
end;

procedure TStammdaten.setAddisonPass(aWert: string);
begin
  if (AddisonPass <> aWert) then
  begin
    AddisonPass := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setAddisonUser(aWert: string);
begin
  if (AddisonUser <> aWert) then
  begin
    AddisonUser := aWert;
    Update := true;
  end;
end;

function TStammdaten.getDruckablaufHelper: TDruckablaufHelper;
begin
  if DruckablaufHelper = nil then
    DruckablaufHelper := TDruckablaufHelper.create(self);

  Result := DruckablaufHelper;
end;

function TStammdaten.getDruckdatenBaseUrl: string;
begin
  result := DruckdatenBaseUrl;
end;

function TStammdaten.getDruckdatenFTP: string;
begin
  Result := DruckdatenFTP;
end;

function TStammdaten.getDruckdatenFTPPass: string;
begin
  Result := DruckdatenFTPPass;
end;

function TStammdaten.getDruckdatenFTPUser: string;
begin
  Result := DruckdatenFTPUser;
end;

procedure TStammdaten.setDruckablaufHelper(aWert: TDruckablaufHelper);
begin
  DruckablaufHelper := aWert;
end;

procedure TStammdaten.setDruckdatenBaseUrl(aWert: string);
begin
  if (DruckdatenBaseUrl <> aWert) then
  begin
    DruckdatenBaseUrl := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setDruckdatenFTP(aWert: string);
begin
  if (DruckdatenFTP <> aWert) then
  begin
    DruckdatenFTP := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setDruckdatenFTPPass(const aWert: string);
begin
  if (DruckdatenFTPPass <> aWert) then
  begin
    DruckdatenFTPPass := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setDruckdatenFTPUser(aWert: string);
begin
  if (DruckdatenFTPUser <> aWert) then
  begin
    DruckdatenFTPUser := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setDruckeLangText(aWert: boolean);
begin
  if (DruckeLangText <> aWert) then
  begin
    DruckeLangText := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setDruckeLangTextKreditor(aWert: boolean);
begin
  if (DruckeLangTextKreditor <> aWert) then
  begin
    DruckeLangTextKreditor := aWert;
    Update := true;
  end;

end;

function TStammdaten.getSkontoVonProvAbziehen: boolean;
begin
  Result := SkontoVonProvAbziehen;
end;

procedure TStammdaten.setSkontoVonProvAbziehen(aWert: boolean);
begin
  if (SkontoVonProvAbziehen <> aWert) then
  begin
    SkontoVonProvAbziehen := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setZahlungBeiOPNrNull(aWert: boolean);
begin
  if (ZahlungBeiOPNrNull <> aWert) then
  begin
    ZahlungBeiOPNrNull := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setZeitfensterIgnorieren(aWert: boolean);
begin

  if ZeitfensterIgnorieren <> aWert then
  begin
    ZeitfensterIgnorieren := aWert;
    Update := true;
  end;

end;

procedure TStammdaten.setZertifikat(aWert: boolean);
begin
  if (Zertifikat <> aWert) then
  begin
    Zertifikat := aWert;
    Update := true;
  end;
end;

function TStammdaten.getZahlungBeiOPNrNull: boolean;
begin
  Result := ZahlungBeiOPNrNull;
end;

function TStammdaten.getZeitfensterIgnorieren: boolean;
begin

  Result := ZeitfensterIgnorieren;

end;

function TStammdaten.getZertifikat: boolean;
begin
  Result := Zertifikat;
end;

function TStammdaten.getWiedervorlageAnzeigen: integer;
begin
  Result := WiedervorlageAnzeigen;
end;

procedure TStammdaten.setWiedervorlageAnzeigen(aWert: integer);
begin
  if WiedervorlageAnzeigen <> aWert then
  begin
    WiedervorlageAnzeigen := aWert;
    Update := true;
  end;
end;

function TStammdaten.getStdBriefanrede: string;
begin
  Result := StdBriefanrede;
end;

procedure TStammdaten.setStdBriefanrede(aStdBriefanrede: string);
begin
  if StdBriefanrede <> aStdBriefanrede then
  begin
    StdBriefanrede := aStdBriefanrede;
    Update := true;
  end;
end;

function TStammdaten.getVKPreiseAnzeigenKG: integer;
begin
  Result := VKPreiseAnzeigenKG;
end;

function TStammdaten.isVKPreiseAnzeigenKG: integer;
begin
  Result := VKPreiseAnzeigenKG;
end;


{
procedure TStammdaten.Sync_Woerterbuch;
var
  Login: string;
  Privat_Remote_Aspell_Pfad: string;
  FileAge_Lokal: Integer;
  FileAge_Remote: Integer;
begin
  //getLog.info('RemotePfad = ' + RemotePfad);
  if RemotePfad = '' then
    exit;
  if (Tnf.GetInstance.System.DirExist(TStammdaten.getInstance.RemotePfad + 'Aspell') < 0)  then
    exit;
  if getMitarbeiter = nil then
     exit;

  Login := TMitarbeiter(getMitarbeiter).getLogin;
  Privat_Remote_Aspell_Pfad := RemotePfad + 'Aspell\Wörterbuch\' + Login + '\';

  if (Tnf.GetInstance.System.DirExist(Privat_Remote_Aspell_Pfad) < 0)  then
    ForceDirectories(Privat_Remote_Aspell_Pfad);

  FileAge_Lokal  := 0;
  FileAge_Remote := 0;

  if (Tnf.GetInstance.System.FileExist(AspellStandardPath + 'de.pws') >= 0) then
    FileAge_Lokal := FileAge(AspellStandardPath + 'de.pws');

  if (Tnf.GetInstance.System.FileExist(Privat_Remote_Aspell_Pfad + 'de.pws') >= 0) then
    FileAge_Remote := FileAge(Privat_Remote_Aspell_Pfad + 'de.pws');

  if FileAge_Lokal > FileAge_Remote then
  begin
    if (Tnf.GetInstance.System.FileExist(AspellStandardPath + 'de.prepl') >= 0) then
    begin
      DeleteFile(Privat_Remote_Aspell_Pfad + 'de.prepl');
      CopyFile(PWideChar(AspellStandardPath + 'de.prepl'), PWideChar(Privat_Remote_Aspell_Pfad + 'de.prepl'), false);
    end;
    if (Tnf.GetInstance.System.FileExist(AspellStandardPath + 'de.pws') >= 0) then
    begin
      DeleteFile(Privat_Remote_Aspell_Pfad + 'de.pws');
      CopyFile(PWideChar(AspellStandardPath + 'de.pws'), PWideChar(Privat_Remote_Aspell_Pfad + 'de.pws'), false);
    end;
  end;

  if FileAge_Lokal < FileAge_Remote then
  begin
    if (Tnf.GetInstance.System.FileExist(Privat_Remote_Aspell_Pfad + 'de.prepl') >= 0) then
    begin
      DeleteFile(AspellStandardPath + 'de.prepl');
      CopyFile(PWideChar(Privat_Remote_Aspell_Pfad + 'de.prepl'), PWideChar(AspellStandardPath + 'de.prepl'), false);
    end;
    if (Tnf.GetInstance.System.FileExist(Privat_Remote_Aspell_Pfad + 'de.pws') >= 0) then
    begin
      DeleteFile(AspellStandardPath + 'de.pws');
      CopyFile(PWideChar(Privat_Remote_Aspell_Pfad + 'de.pws'), PWideChar(AspellStandardPath + 'de.pws'), false);
    end;
  end;

end;
}

procedure TStammdaten.Sync_Woerterbuch;
var
  Login: string;
  Privat_Remote_Hunspell_Pfad: string;
begin
  if RemotePfad = '' then
    exit;

  if (Tnf.GetInstance.System.DirExist(RemoteHunspellPfad) < 0)  then
    exit;

  if getMitarbeiter = nil then
     exit;

  Login := TMitarbeiter(getMitarbeiter).getLogin;
  Privat_Remote_Hunspell_Pfad := RemoteHunspellPfad + 'Wörterbuch\' + Login + '\';

  if  (Tnf.GetInstance.System.FileExist(Privat_Remote_Hunspell_Pfad + 'Custom.woe') < 0)
  and (Tnf.GetInstance.System.FileExist(LokalHunspellPfad + 'Custom.woe') >= 0) then
    CopyFile(PWideChar(LokalHunspellPfad + 'Custom.woe'), PWideChar(Privat_Remote_Hunspell_Pfad + 'Custom.woe'), false);

  if  (Tnf.GetInstance.System.FileExist(Privat_Remote_Hunspell_Pfad + 'Custom.woe') >= 0)
  and (Tnf.GetInstance.System.FileExist(LokalHunspellPfad + 'Custom.woe') < 0) then
    CopyFile(PWideChar(Privat_Remote_Hunspell_Pfad + 'Custom.woe'), PWideChar(LokalHunspellPfad + 'Custom.woe'), false);

  ErsetzeAlteMitNeuerDatei(Privat_Remote_Hunspell_Pfad + 'Custom.woe', LokalHunspellPfad + 'Custom.woe');
  ErsetzeAlteMitNeuerDatei(LokalHunspellPfad + 'Custom.woe', Privat_Remote_Hunspell_Pfad + 'Custom.woe');

end;

procedure TStammdaten.Kopiere_Woerterbuch_nach_Lokal;
var
  Login: string;
  Privat_Remote_Hunspell_Pfad: string;
  Dic: string;
  Aff: String;
  DllName: String;
begin
  if RemotePfad = '' then
    exit;

  if (Tnf.GetInstance.System.DirExist(RemoteHunspellPfad) < 0)  then
    exit;

  Dic := 'German.dic';
  Aff := 'German.aff';

  if (Tnf.GetInstance.System.FileExist(LokalHunspellPfad + 'de.dic') >= 0) then
    DeleteFile(LokalHunspellPfad + 'de.dic');
  if (Tnf.GetInstance.System.FileExist(LokalHunspellPfad + 'de.aff') >= 0) then
    DeleteFile(LokalHunspellPfad + 'de.aff');


  Login := TMitarbeiter(getMitarbeiter).getLogin;
  Privat_Remote_Hunspell_Pfad := RemoteHunspellPfad + 'Wörterbuch\' + Login + '\';
  if (Tnf.GetInstance.System.DirExist(Privat_Remote_Hunspell_Pfad) < 0)  then
    ForceDirectories(Privat_Remote_Hunspell_Pfad);
  if (Tnf.GetInstance.System.DirExist(LokalHunspellPfad) < 0)  then
    ForceDirectories(LokalHunspellPfad);

  if (Tnf.GetInstance.System.FileExist(LokalHunspellPfad + Dic) < 0) then
    CopyFile(PWideChar(RemoteHunspellPfad + Dic), PWideChar(LokalHunspellPfad + Dic), false);
  if (Tnf.GetInstance.System.FileExist(LokalHunspellPfad + Aff) < 0) then
    CopyFile(PWideChar(RemoteHunspellPfad + Aff), PWideChar(LokalHunspellPfad + Aff), false);

  if (Tnf.GetInstance.System.FileExist(LokalHunspellPfad + 'Hunspell64.dll') < 0) then
    CopyFile(PWideChar(RemoteHunspellPfad + 'Hunspell64.dll'), PWideChar(LokalHunspellPfad + 'Hunspell64.dll'), false);
  if (Tnf.GetInstance.System.FileExist(LokalHunspellPfad + 'Hunspell32.dll') < 0) then
    CopyFile(PWideChar(RemoteHunspellPfad + 'Hunspell32.dll'), PWideChar(LokalHunspellPfad + 'Hunspell32.dll'), false);

  ErsetzeAlteMitNeuerDatei(RemoteHunspellPfad + 'Hunspell64.dll', LokalHunspellPfad + 'Hunspell64.dll');
  ErsetzeAlteMitNeuerDatei(RemoteHunspellPfad + 'Hunspell32.dll', LokalHunspellPfad + 'Hunspell32.dll');


  if GlobalSpell = nil then
    exit;

  DllName := 'hunspell32.dll';
  {$IFDEF WIN64}
    DllName := 'hunspell64.dll';
  {$ENDIF}


  GlobalSpell.SpellFormStyle := rvhfClassic;
  GlobalSpell.DllName := DllName;
  GlobalSpell.DllDir  := TStammdaten.getInstance.LokalHunspellPfad;
  GlobalSpell.DictDir := TStammdaten.getInstance.LokalHunspellPfad;
  GlobalSpell.CustomDictionaryFilename := TStammdaten.getInstance.LokalHunspellPfad + 'Custom.woe';
  //fSpell.OnSpellFormAction := RVHunSpell1SpellFormAction;
  GlobalSpell.Dictionaries.Clear;
  GlobalSpell.LoadAllDictionaries;



    {
  if  (Tnf.GetInstance.System.FileExist(RemoteHunspellPfad + 'Hunspell64.dll') >= 0)
  and (Tnf.GetInstance.System.FileExist(LokalHunspellPfad + 'Hunspell64.dll') >= 0) then
  begin
    FileAge_Lokal  := FileAge(LokalHunspellPfad + 'Hunspell64.dll');
    FileAge_Remote := FileAge(RemoteHunspellPfad + 'Hunspell64.dll');
    if FileAge_Lokal < FileAge_Remote then
      CopyFile(PWideChar(RemoteHunspellPfad + 'Hunspell64.dll'), PWideChar(LokalHunspellPfad + 'Hunspell64.dll'), false);
  end;
    }


  {
  if (Tnf.GetInstance.System.DirExist(TStammdaten.getInstance.RemotePfad + 'Aspell') < 0)  then
    exit;

  Login := TMitarbeiter(getMitarbeiter).getLogin;
  Privat_Remote_Aspell_Pfad := RemotePfad + 'Aspell\Wörterbuch\' + Login + '\';

  if (Tnf.GetInstance.System.DirExist(Privat_Remote_Aspell_Pfad) < 0)  then
    ForceDirectories(Privat_Remote_Aspell_Pfad);

  if (Tnf.GetInstance.System.FileExist(Privat_Remote_Aspell_Pfad + 'de.prepl') >= 0) then
  begin
    DeleteFile(AspellStandardPath + 'de.prepl');
    CopyFile(PWideChar(Privat_Remote_Aspell_Pfad + 'de.prepl'), PWideChar(AspellStandardPath + 'de.prepl'), false);
  end;
  if (Tnf.GetInstance.System.FileExist(Privat_Remote_Aspell_Pfad + 'de.pws') >= 0) then
  begin
    DeleteFile(AspellStandardPath + 'de.pws');
    CopyFile(PWideChar(Privat_Remote_Aspell_Pfad + 'de.pws'), PWideChar(AspellStandardPath + 'de.pws'), false);
  end;

  }

end;

procedure TStammdaten.ErsetzeAlteMitNeuerDatei(aQuellDatei, aZielDatei: string);
var
  FileAge_Ziel: Integer;
  FileAge_Quelle: Integer;
begin
  if  (Tnf.GetInstance.System.FileExist(aQuellDatei) >= 0)
  and (Tnf.GetInstance.System.FileExist(aZielDatei) >= 0) then
  begin
    FileAge_Ziel  := FileAge(aZielDatei);
    FileAge_Quelle := FileAge(aQuellDatei);
    if FileAge_Quelle < FileAge_Ziel then
      CopyFile(PWideChar(aQuellDatei), PWideChar(aZieldatei), false);
  end;

end;



function TStammdaten.getAspellStandardPath: string;
var
  reg:TRegistry;
begin
  if fAspellStandardPath > '' then
  begin
    Result := fAspellStandardPath;
    exit;
  end;
  reg:=TRegistry.Create;
  reg.RootKey := HKEY_CURRENT_USER;
  if reg.OpenKey('\SOFTWARE\Aspell', False) then
  begin
    Result := IncludeTrailingPathDelimiter(reg.ReadString(''));
    fAspellStandardPath := Result;
    reg.CloseKey;
  end;
  FreeAndNil(reg);
end;


procedure TStammdaten.setVKPreiseAnzeigenKG(aWert: integer);
begin
  if VKPreiseAnzeigenKG <> aWert then
  begin
    VKPreiseAnzeigenKG := aWert;
    Update := true;
  end;
end;

function TStammdaten.getAU_Bericht: string;
begin
  Result := AU_Bericht;
end;

function TStammdaten.getAU_Beschreibung: string;
begin
  Result := AU_Beschreibung;
end;

function TStammdaten.getAU_Bezugsdaten: string;
begin
  Result := AU_Bezugsdaten;
end;

procedure TStammdaten.setAU_Bericht(aParams: string);
begin
  if AU_Bericht <> aParams then
  begin
    AU_Bericht := aParams;
    Update := true;
  end;
end;

procedure TStammdaten.setAU_Beschreibung(aParams: string);
begin
  if AU_Beschreibung <> aParams then
  begin
    AU_Beschreibung := aParams;
    Update := true;
  end;
end;

procedure TStammdaten.setAU_Bezugsdaten(aParams: string);
begin
  if AU_Bezugsdaten <> aParams then
  begin
    AU_Bezugsdaten := aParams;
    Update := true;
  end;
end;

function TStammdaten.getAU_Art: integer;
begin
  Result := AU_Art;
end;

function TStammdaten.getAU_Unterart: integer;
begin
  Result := AU_Unterart;
end;

procedure TStammdaten.setAU_Art(aWert: integer);
begin
  if AU_Art <> aWert then
  begin
    AU_Art := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setAU_Unterart(aWert: integer);
begin
  if AU_Unterart <> aWert then
  begin
    AU_Unterart := aWert;
    Update := true;
  end;
end;

function TStammdaten.getAU_Anforderung: integer;
begin
  Result := AU_Anforderung;
end;

procedure TStammdaten.setAU_Anforderung(aWert: integer);
begin
  if AU_Anforderung <> aWert then
  begin
    AU_Anforderung := aWert;
    Update := true;
  end;
end;

function TStammdaten.getErweiterteAdressdaten: boolean;
begin
  Result := erweiterteAdressdaten;
end;

procedure TStammdaten.setErweiterteAdressdaten(aWert: boolean);
begin
  if (aWert <> erweiterteAdressdaten) then
  begin
    erweiterteAdressdaten := aWert;
    Update := true;
  end;
end;

function TStammdaten.getFB_POP3_Benutzer: string;
begin
  Result := FB_POP3_Benutzer;
end;

function TStammdaten.getFB_POP3_Mail: string;
begin
  Result := FB_POP3_Mail;
end;

function TStammdaten.getFB_POP3_Passwort: string;
begin
  Result := FB_POP3_Passwort;
end;

function TStammdaten.getFB_POP3_Server: string;
begin
  Result := FB_POP3_Server;
end;

procedure TStammdaten.setFB_POP3_Benutzer(aWert: string);
begin
  if (aWert <> FB_POP3_Benutzer) then
  begin
    FB_POP3_Benutzer := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setFB_POP3_Mail(aWert: string);
begin
  if (aWert <> FB_POP3_Mail) then
  begin
    FB_POP3_Mail := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setFB_POP3_Passwort(aWert: string);
begin
  if (aWert <> FB_POP3_Passwort) then
  begin
    FB_POP3_Passwort := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setFB_POP3_Server(aWert: string);
begin
  if (aWert <> FB_POP3_Server) then
  begin
    FB_POP3_Server := aWert;
    Update := true;
  end;
end;

function TStammdaten.getKuDebNr_gleich: boolean;
begin
  Result := KuDebNr_gleich;
end;

function TStammdaten.getKundenformulare(aFormular: integer): boolean;
begin
  Result := (Kundenformulare and Round(power(2, aFormular))) = Round(power(2, aFormular));
end;

procedure TStammdaten.setKuDebNr_gleich(aWert: boolean);
begin
  if (aWert <> KuDebNr_gleich) then
  begin
    KuDebNr_gleich := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setKundenformulare(aFormular: integer; aWert: boolean);
var
  alt: boolean;
begin

  alt := getKundenformulare(aFormular);

  if (alt <> aWert) then
  begin
    if aWert then
      Kundenformulare := Kundenformulare or Round(power(2, aFormular))
    else
      Kundenformulare := Kundenformulare xor Round(power(2, aFormular));
    Update := true;
  end;

end;

procedure TStammdaten.setKundennummer(awert: integer);
begin
  if (aWert <> _Kundennummer) then
  begin
    _Kundennummer := aWert;
    Update := true;
  end;
end;

function TStammdaten.getDebNr_Bis: integer;
begin
  Result := DebNr_Bis;
end;

function TStammdaten.getDebNr_Von: integer;
begin
  Result := DebNr_Von;
end;

function TStammdaten.getDeb_Vergabeart: integer;
begin
  Result := Deb_Vergabeart;
end;

function TStammdaten.getDefaultLiefertage: integer;
begin
  Result := DefaultLiefertage;
end;

procedure TStammdaten.setDebNr_Bis(aWert: integer);
begin
  if (aWert <> DebNr_Bis) then
  begin
    DebNr_Bis := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setDebNr_Von(aWert: integer);
begin
  if (aWert <> DebNr_Von) then
  begin
    DebNr_Von := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setDeb_Vergabeart(aWert: integer);
begin
  if (aWert <> Deb_Vergabeart) then
  begin
    Deb_Vergabeart := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setDefaultLiefertage(aWert: integer);
begin
  if (aWert <> DefaultLiefertage) then
  begin
    DefaultLiefertage := aWert;
    Update := true;
  end;
end;

function TStammdaten.getUebersichtAnsprechpartner: boolean;
begin
  Result := UebersichtAnsprechpartner;
end;

function TStammdaten.getUPS_KUNR: string;
begin
  Result := UPS_KUNR;
end;

function TStammdaten.getUPS_Telefon: string;
begin
  Result := UPS_Telefon;
end;

function TStammdaten.getUPS_Verzeichnis: string;
begin
  Result := UPS_Verzeichnis;
end;

function TStammdaten.getUPS_Warenbeschreibung: string;
begin
  Result := UPS_Warenbeschreibung;
end;

procedure TStammdaten.setUebersichtAnsprechpartner(aWert: boolean);
begin
  if (UebersichtAnsprechpartner <> aWert) then
  begin
    UebersichtAnsprechpartner := aWert;
    Update := true;
  end;
end;

function TStammdaten.getKW_Datum: integer;
begin
  Result := KW_Datum;
end;

procedure TStammdaten.setKW_Datum(aWert: integer);
begin
  if (aWert <> KW_Datum) then
  begin
    KW_Datum := aWert;
    Update := true;
  end;
end;

function TStammdaten.getKuSperrstatus: integer;
begin
  Result := KuSperrstatus;
end;

procedure TStammdaten.setKuSperrstatus(aWert: integer);
begin
  if (aWert <> KuSperrstatus) then
  begin
    KuSperrstatus := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setKU_Notizen(aWert: boolean);
begin
  if (aWert <> KU_Notizen) then
  begin
    KU_Notizen := aWert;
    Update := true;
  end;
end;

procedure TStammdaten.setLT_Notizen(aWert: boolean);
begin
  if (aWert <> LT_Notizen) then
  begin
    LT_Notizen := aWert;
    Update := true;
  end;
end;

function TStammdaten.getKU_Notizen: boolean;
begin
  Result := KU_Notizen;
end;

function TStammdaten.getLT_Notizen: boolean;
begin
  Result := LT_Notizen;
end;

function TStammdaten.ArtNrFormatList: string;
var
  List: TStringList;
  ArtNrFormat: string;
  s: string;
  iPos: Integer;
begin
  ArtNrFormat := getArtNrFormat;
  List := TStringList.Create;
  try
    iPos := Pos(']', ArtNrFormat);
    while iPos > 0 do
    begin
      s := Trim(copy(ArtNrFormat, 1, iPos));
      s := StringReplace(s, ' ', '', [rfReplaceAll]);
      Delete(ArtnrFormat, 1, iPos);
      List.Add(s);
      iPos := Pos(']', ArtNrFormat);
    end;
    Result := List.Text;
  finally
    FreeAndNil(List);
  end;
end;


end.
