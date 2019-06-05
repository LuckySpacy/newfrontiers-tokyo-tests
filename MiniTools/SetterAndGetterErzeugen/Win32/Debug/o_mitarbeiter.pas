unit o_mitarbeiter;

interface

uses
  IBX.IBDatabase, SysUtils, IBX.IBQuery, Classes, contnrs, o_optima,
  o_mitarbeitergruppe, o_vertreter, f_optima, o_maeinstellungen, c_Types, o_berechtigungobj;

type
  TMitarbeiter = class(TOptima)

    private
      Login: string;
      MitarbeiterName: string;
      Tel: string;
      Fax: string;
      Mail: string;
      Passwort: string;
      Signatur: string;
      Anfragen: boolean;
      Geschaeftsbereich: integer;
      Aussendienst: boolean;
      Vertreter: TVertreter;
      NurEigene: boolean;
      Gesperrt: boolean;
      PWNeverExpires: boolean;
      PWChangeOwn: boolean;
      PWChanged: TDateTime;
      PWExpiresAfter: integer;
      IstAktiv: boolean;
      Admin: boolean;
      Gruppe: integer;
      NurZeitbuchung: boolean;
      _Geschlecht: TGeschlecht;
      _EBNotifikation : boolean;
//      _IMAP_User: string;
//      _IMAP_Passwort: string;
      Hash: string;
      Salt: string;

      Gruppen: TObjectList;

      function getAnfragen: boolean;
      procedure setAnfragen(value: boolean);
      procedure setGeschlecht(const Value: TGeschlecht);
//    procedure setIMAP_Passwort(const Value: string);
//    procedure setIMAP_User(const Value: string);
//    function getIMAP_Passwort: string;

    protected

      function getGeneratorName: string; override;
      function getTablePrefix: string; override;

    public
      Einstellung: TMAEinstellungen;
      Berechtigung: TBerechtigungObj;
      function delete: boolean; override;

      constructor Create(aOwner: TComponent; aLogin: string; aStammdaten: pointer; aTransaction: TIBTransaction); overload;
      destructor Destroy; override;

      function getTableName: string; override;
      procedure loadFromQuery(aQuery: TIBQuery); override;
      procedure saveToDB; override;

      function getLogin: string;
      function getMitarbeiterName: string;
      function getTel: string;
      function getFax: string;
      function getMail: string;
      function getPasswort: string;
      function getSignatur: string;
      function getGeschaeftsbereich: integer;
      function isGesperrt: boolean;
      function getPWNeverExpires: boolean;
      function getPWChangeOwn: boolean;
      function getPWChanged: TDateTime;
      function getPWExpiresAfter: integer;
      function getGruppen: TObjectList;
      function getAdmin: boolean;
      function getGruppe: integer;
      function getImageFile: string;
      function getNurZeibuchung: boolean;
      function getHash: string;
      function getSalt: string;

      procedure setLogin(const aLogin: string);
      procedure setMitarbeiterName(aMitarbeiterName: string);
      procedure setTel(aTel: string);
      procedure setFax(aFax: string);
      procedure setMail(aMail: string);
      procedure setPasswort(aPasswort: string);
      procedure setSignatur(aSignatur: string);
      procedure setGeschaeftsbereich(aGeschaeftsbereich: integer);
      procedure setGesperrt(aGesperrt: boolean);
      procedure setPWNeverExpires(aValue: boolean);
      procedure setPWChangeOwn(aValue: boolean);
      procedure setPWChanged(aDate: TDateTime);
      procedure setPWExpiresAfter(aDays: integer);
      procedure setGruppe(aWert: integer);
      procedure setNurZeitbuchung(aWert: boolean);
      procedure setHash(const aHash: string);
      procedure setSalt(const aSalt: string);

      procedure neueGruppe(aGruppeID: integer);
      procedure GruppenAufheben;
      function isInGruppe(aGruppe: TMitarbeitergruppe): boolean;
      property isAnfragen: boolean read getAnfragen write setAnfragen;

      procedure setEBNotifikation(awert : boolean);
      procedure setIstAktiv(aWert: boolean);
      procedure setVertreter(aVertreter: TVertreter);
      procedure setNurEigene(aWert: boolean);
      procedure setAussendienst(aWert: boolean);
      function getVertreter: TVertreter;
      function getNurEigene: boolean;
      function getAussendienst: boolean;
      function getIstAktiv: boolean;

      function getKommunikationMail: string;
      function getGBKommunikationID: integer;
      function getMAKommunikationID: integer;
      function getStandardKommunikationsprofil: pointer;

      function getGB_Bev_KommunikationID: integer;

      function isGruppe: boolean;
      function isLogin: boolean;
      function getKey: string;

      property Geschlecht: TGeschlecht read _Geschlecht write setGeschlecht;
      property EBNotifikation: boolean read _EBNotifikation write setEBNotifikation;
//      property IMAP_User: string read _IMAP_User write setIMAP_User;
//      property IMAP_Passwort: string read getIMAP_Passwort write setIMAP_Passwort;

      class function loadForGruppe(aOwner: TComponent; aGruppenId: integer; aStammdaten: pointer; aTransaction: TIBTransaction): TMitarbeiter;
      procedure InitNew; override;



  end;

const
  cAussendienst = 10;

implementation

uses
  o_makommunikation, o_optimaSimpleQueryBuilder, o_optimaFactory, IdHTTP, IdHash,
  IdHashMessageDigest, o_nf, o_MaGruppe, o_Geschaeftsbereich, math,
  o_debuglist, o_Stammdaten;


constructor TMitarbeiter.Create(aOwner: TComponent; aLogin: string; aStammdaten: pointer; aTransaction: TIBTransaction);
var
  ReadQuery: TIBQuery;
  Lower_Login: string;
  Login_Length: Integer;
begin
  inherited Create(aOwner);

  Transaction := aTransaction;

  ReadQuery := TIBQuery.Create(self);

  with ReadQuery do
  begin

    Lower_Login := SqlCaseSensitiv(aLogin);
    Transaction := self.Transaction;
    OpenTransaction;

    Login_Length := f_optima.FieldSize('MA_LOGIN', 'MITARBEITER', Transaction);
    Lower_Login  := Copy(Lower_Login, 1, Login_Length);

    SQL.Clear;
    SQL.Add('select * from MITARBEITER where lower(MA_LOGIN) = lower(:Login) and MA_DELETE != "T" and MA_AKTIV = "T" ');
    ParamByName('Login').asString := Lower_Login;
    Open;

    loadFromQuery(ReadQuery);

    Close;

    CommitTransaction;

    Free;

  end;

end;

function TMitarbeiter.getLogin: string;
begin
  result := Login;
end;

function TMitarbeiter.getMitarbeiterName: string;
begin
  result := MitarbeiterName;
end;

function TMitarbeiter.getPasswort: string;
var
  KryptPass: string;
  KryptChar: char;
  x: integer;
begin

  KryptPass := '';

  for x := 1 to length(Passwort) do
  begin

    KryptChar := Passwort[x];
    KryptChar := chr(ord(KryptChar) xor ord('A'));
    KryptPass := KryptPass + KryptChar;

  end;

  result := KryptPass;

end;

function TMitarbeiter.getAdmin: boolean;
begin
  result := Admin;
end;

function TMitarbeiter.getSignatur: string;
begin
  result := Signatur;
end;

function TMitarbeiter.getStandardKommunikationsprofil: pointer;
var
  stdID: integer;
begin
  result := nil;
  stdID := getMAKommunikationID;
  if stdID > 0 then
    result := TMAKommunikation.Create(self, stdID, StammdatenX, Transaction);

end;

function TMitarbeiter.getGeschaeftsbereich: integer;
begin
  result := Geschaeftsbereich;
end;

function TMitarbeiter.getAnfragen: boolean;
begin
  result := Anfragen;
end;

procedure TMitarbeiter.saveToDB;
var
  WriteQuery: TIBQuery;
  x: integer;
begin

  if ((not Update) and (not Neu) and (not Del)) or (Neu and Del) then
    Exit;

  WriteQuery := TIBQuery.Create(self);

  // Mitarbeitergruppen speichern
  with WriteQuery do
  begin
    Transaction := self.Transaction;

    OpenTransaction;

    // TODO: Macht das Sinn bei jedem Speichern des Mitarbeiters die
    // gesamten Gruppenzuordnungen zu löschen und neu anzulegen?!

    SQL.Clear;
    SQL.Add('UPDATE MA_MG SET MA_MG_DELETE = "T" WHERE MA_MG_MA_ID = :ID');

    ParamByName('ID').AsInteger := ID;

    ExecSQL;

    SQL.Clear;
    SQL.Add('INSERT INTO MA_MG ( ' + 'MA_MG_ID, MA_MG_MA_ID, MA_MG_MG_ID, MA_MG_UPDATE, MA_MG_DELETE ' + ') VALUES ( ' +
      'GEN_ID(MA_MG_ID, 1), :Mitarbeiter, :Gruppe, "T", "F" ' + ') ');

    for x := 0 to self.getGruppen.Count - 1 do
    begin
      ParamByName('Mitarbeiter').AsInteger := ID;
      ParamByName('Gruppe').AsInteger := TMitarbeitergruppe(self.getGruppen.Items[x]).getID;

      ExecSQL;
    end;

    SQL.Clear;

    if not Neu then
      SQL.Add('update MITARBEITER set ' +
        'MA_NAME = :MA_Name, ' +
        'MA_LOGIN = :Login, ' +
        'MA_PASSWORD = :Pass, ' +
        'MA_TEL = :Tel, ' +
        'MA_FAX = :Fax, ' +
        'MA_MAIL = :Mail, ' +
        'MA_SIGNATUR = :Signatur, ' +
        'MA_ANFRAGEN = :Anfragen, ' +
        'MA_GB_ID = :GBereich, ' +
        'MA_VERTRETER = :Vertreter, ' +
        'MA_NUREIGENE = :NurEIgene, ' +
        'MA_AUSSENDIENST = :Aussendienst, ' +
        'MA_UPDATE = :Upd, ' +
        'MA_DELETE = :Del, ' +
        'MA_PW_NEVER_EXPIRE = :PWNeverExpire, ' +
        'MA_PW_CHANGE_OWN = :PWChangeOwn, ' +
        'MA_GESPERRT = :Gesperrt, ' +
        'MA_PW_CHANGED = :PWChanged, ' +
        'MA_TEL_NORM = :TelNorm, ' +
        'MA_AKTIV = :IstAktiv, ' +
        'MA_PW_EXPIRES_AFTER = :PWExpiresAfter, ' +
        'MA_GESCHLECHT = :Geschlecht, ' +
        'MA_EB_NOTIFICATION = :EBNotifikation, ' +
        'MA_NURZEITBUCHUNG = :NurZeitbuchung, ' +
//        'MA_IMAP_USER = :IMAPUser, ' +
//        'MA_IMAP_PASSWORT = :IMAPPasswort, ' +
        'MA_GRUPPE = :Gruppe, ' +
        'MA_HASH = :Hash, ' +
        'MA_SALT = :Salt ' +
        'where MA_ID = :ID')

    else
      SQL.Add('insert into MITARBEITER( ' +
        'MA_ID, MA_NAME, MA_LOGIN, MA_PASSWORD, MA_TEL, MA_FAX, MA_MAIL, MA_SIGNATUR, ' +
        'MA_ANFRAGEN, MA_GB_ID, MA_VERTRETER, MA_NUREIGENE, MA_AUSSENDIENST, MA_UPDATE, ' +
        'MA_DELETE, MA_AKTIV, MA_PW_NEVER_EXPIRE, MA_PW_CHANGE_OWN, MA_GESPERRT, ' +
        'MA_PW_CHANGED, MA_PW_EXPIRES_AFTER, MA_TEL_NORM, ' +
        'MA_GRUPPE, MA_GESCHLECHT, MA_EB_NOTIFICATION, MA_NURZEITBUCHUNG, ' +
//        'MA_IMAP_USER, MA_IMAP_PASSWORT, ' +
        'MA_HASH, MA_SALT ' +
        ') values ( ' +
        ':ID, :MA_Name, :Login, :Pass, :Tel, :Fax, :Mail, :Signatur, :Anfragen, ' +
        ':GBereich, :Vertreter, :NurEigene, :Aussendienst, :Upd, :Del, :IstAktiv, ' +
        ':PWNeverExpire, :PWChangeOwn, :Gesperrt, :PWChanged, :PWExpiresAfter, ' +
        ':TelNorm, :Gruppe, :Geschlecht, :EBNotifikation, :NurZeitbuchung, ' +
//        ':IMAPUser, :IMAPPasswort, ' +
        ':Hash, :Salt)');

    ParamByName('ID').AsInteger := ID;
    ParamByName('MA_Name').asString := MitarbeiterName;
    ParamByName('Tel').asString := Tel;
    ParamByName('Fax').asString := Fax;
    ParamByName('Mail').asString := Mail;
    ParamByName('Login').asString := Login;
    ParamByName('Pass').asString := Passwort;
    ParamByName('Signatur').asString := Signatur;
    ParamByName('Anfragen').asString := BoolToStr(Anfragen);
    ParamByName('GBereich').AsInteger := Geschaeftsbereich;
    ParamByName('Upd').asString := 'T';
    ParamByName('Del').asString := BoolToStr(Del);
    if Vertreter = nil then
      ParamByName('Vertreter').AsInteger := 0
    else
      ParamByName('Vertreter').AsInteger := Vertreter.getID;
    ParamByName('NurEigene').asString := BoolToStr(NurEigene);
    ParamByName('Aussendienst').asString := BoolToStr(Aussendienst);
    ParamByName('PWNeverExpire').asString := BoolToStr(PWNeverExpires);
    ParamByName('PWChangeOwn').asString := BoolToStr(PWChangeOwn);
    ParamByName('Gesperrt').asString := BoolToStr(Gesperrt);
    ParamByName('PWChanged').AsDateTime := PWChanged;
    ParamByName('PWExpiresAfter').AsInteger := PWExpiresAfter;
    ParamByName('TelNorm').asString := normalisieren(Tel);
    ParamByName('IstAktiv').asString := BoolToStr(IstAktiv);
    ParamByName('Gruppe').AsInteger := Gruppe;
    ParamByName('Geschlecht').AsInteger := ord(Geschlecht);
    ParamByName('EBNotifikation').asString := BoolToStr(_EBNotifikation);
    ParamByName('NurZeitbuchung').AsString := BoolToStr(NurZeitbuchung);
//    ParamByName('IMAPUser').AsString := _IMAP_User;
//    ParamByName('IMAPPasswort').AsString := _IMAP_Passwort;
    ParamByName('Hash').AsString := Hash;
    ParamByName('Salt').AsString := Salt;
    ExecSQL;

    CommitTransaction;

    Free;

    Update := false;
    Neu := false;

  end;

end;

procedure TMitarbeiter.setAnfragen(value: boolean);
begin
  if value <> Anfragen then
  begin
    Anfragen := value;
    Update := true;
  end;
end;

class function TMitarbeiter.loadForGruppe(aOwner: TComponent; aGruppenId: integer; aStammdaten: pointer; aTransaction: TIBTransaction): TMitarbeiter;
var
  queryBuilder: TOptimaSimpleQueryBuilder;
begin

  queryBuilder := TOptimaSimpleQueryBuilder.Create;
  queryBuilder.select.from('MITARBEITER').where('MA_GRUPPE = :Gruppe').param('Gruppe', aGruppenId).where('MA_DELETE != "T"');

  result := TOptimaFactory.FindFirst(TMitarbeiter, queryBuilder, aOwner, aTransaction) as TMitarbeiter;

  queryBuilder.Free;

end;

procedure TMitarbeiter.loadFromQuery(aQuery: TIBQuery);
begin

  with aQuery do
  begin

    ID := FieldByName('MA_ID').AsInteger;
    MitarbeiterName := FieldByName('MA_NAME').asString;
    Tel := FieldByName('MA_TEL').asString;
    Fax := FieldByName('MA_FAX').asString;
    Mail := FieldByName('MA_MAIL').asString;
    Login := FieldByName('MA_LOGIN').asString;
    Passwort := FieldByName('MA_PASSWORD').asString;
    Signatur := FieldByName('MA_SIGNATUR').asString;
    Anfragen := (FieldByName('MA_ANFRAGEN').asString = 'T');
    Geschaeftsbereich := FieldByName('MA_GB_ID').AsInteger;
    if FieldByName('MA_VERTRETER').AsInteger = 0 then
      Vertreter := nil
    else
      Vertreter := TVertreter.Create(self, FieldByName('MA_Vertreter').AsInteger, StammdatenX, self.Transaction);
    NurEigene := FieldByName('MA_NUREIGENE').asString = 'T';
    Aussendienst := FieldByName('MA_AUSSENDIENST').asString = 'T';

    Gesperrt := (FieldByName('MA_GESPERRT').asString = 'T');
    PWNeverExpires := (FieldByName('MA_PW_NEVER_EXPIRE').asString = 'T');
    PWChangeOwn := (FieldByName('MA_PW_CHANGE_OWN').asString = 'T');
    PWChanged := FieldByName('MA_PW_CHANGED').AsDateTime;
    PWExpiresAfter := FieldByName('MA_PW_EXPIRES_AFTER').AsInteger;
    IstAktiv := FieldByName('MA_AKTIV').asString = 'T';
    Admin := FieldByName('MA_ADMIN').asString = 'T';
    Gruppe := FieldByName('MA_GRUPPE').AsInteger;
    Einstellung := TMAEinstellungen.Create(self, ID, aQuery.Transaction.DefaultDatabase);
    Berechtigung := TBerechtigungObj.Create(Id, aQuery.Transaction);
    Geschlecht := TGeschlecht(FieldByName('MA_GESCHLECHT').AsInteger);
    NurZeitbuchung := FieldByName('MA_NURZEITBUCHUNG').AsString = 'T';
    _EBNotifikation := FieldByName('MA_EB_NOTIFICATION').asString = 'T';
//    _IMAP_User := FieldByName('MA_IMAP_USER').AsString;
//    _IMAP_Passwort := FieldByName('MA_IMAP_PASSWORT').AsString;
    Hash := FieldByName('MA_HASH').asString;
    Salt := FieldByName('MA_SALT').asString;
  end;

end;

procedure TMitarbeiter.setGeschaeftsbereich(aGeschaeftsbereich: integer);
begin

  UpdateV(Geschaeftsbereich, aGeschaeftsbereich);

end;

procedure TMitarbeiter.setGeschlecht(const Value: TGeschlecht);
begin
  if _Geschlecht <> Value then
  begin
    _Geschlecht := Value;
    Aktual;
  end;
  //UpdateV(ord(_Geschlecht), ord(Value));
end;

procedure TMitarbeiter.setLogin(const aLogin: string);
begin

  UpdateV(Login, aLogin);

end;

procedure TMitarbeiter.setMitarbeiterName(aMitarbeiterName: string);
begin

  UpdateV(MitarbeiterName, aMitarbeiterName);

end;

procedure TMitarbeiter.setPasswort(aPasswort: string);
var
  KryptPass: string;
  KryptChar: char;
  x: integer;
begin

  KryptPass := '';

  for x := 1 to length(aPasswort) do
  begin

    KryptChar := aPasswort[x];
    KryptChar := chr(ord(KryptChar) xor ord('A'));
    KryptPass := KryptPass + KryptChar;

  end;

  UpdateV(Passwort, KryptPass);

end;

procedure TMitarbeiter.setSignatur(aSignatur: string);
begin

  UpdateV(Signatur, aSignatur);

end;

procedure TMitarbeiter.neueGruppe(aGruppeID: integer);
begin

  self.getGruppen.Add(TMitarbeitergruppe.Create(self, aGruppeID, StammdatenX, Transaction));
  Update := true;

end;

procedure TMitarbeiter.GruppenAufheben;
begin

  self.getGruppen.Clear;
  Update := true;

end;

function TMitarbeiter.isInGruppe(aGruppe: TMitarbeitergruppe): boolean;
var
  x: integer;
begin

  result := false;

  for x := 0 to self.getGruppen.Count - 1 do
  begin
    if TMitarbeitergruppe(self.getGruppen.Items[x]).getID = aGruppe.getID then
    begin
      result := true;
      Exit;
    end;
  end;

end;

function TMitarbeiter.isLogin: boolean;
begin
  result := Gruppe = 0;
end;

function TMitarbeiter.getVertreter: TVertreter;
begin

  result := Vertreter;

end;

procedure TMitarbeiter.setVertreter(aVertreter: TVertreter);
begin
  if (Vertreter = nil) or (aVertreter = nil) or (Vertreter.getID <> aVertreter.getID) then
  begin
    Vertreter := aVertreter;
    Update := true;
  end;
end;


function TMitarbeiter.getNurEigene: boolean;
begin

  result := NurEigene;

end;

function TMitarbeiter.getNurZeibuchung: boolean;
begin
  result := NurZeitbuchung;
end;

procedure TMitarbeiter.setNurEigene(aWert: boolean);
begin

  UpdateV(NurEigene, aWert);

end;

procedure TMitarbeiter.setNurZeitbuchung(aWert: boolean);
begin
  updateV(NurZeitbuchung, aWert);
end;

function TMitarbeiter.getAussendienst: boolean;
begin

  result := Aussendienst;

end;

procedure TMitarbeiter.setAussendienst(aWert: boolean);
begin

  UpdateV(Aussendienst, aWert);

end;

function TMitarbeiter.getPWChanged: TDateTime;
begin

  result := PWChanged;

end;

function TMitarbeiter.getPWChangeOwn: boolean;
begin

  result := PWChangeOwn;

end;

function TMitarbeiter.getPWExpiresAfter: integer;
begin

  result := PWExpiresAfter;

end;

function TMitarbeiter.getPWNeverExpires: boolean;
begin

  result := PWNeverExpires;

end;

function TMitarbeiter.isGesperrt: boolean;
begin

  result := Gesperrt;

end;

function TMitarbeiter.isGruppe: boolean;
begin
  result := Gruppe > 0;
end;

procedure TMitarbeiter.setGesperrt(aGesperrt: boolean);
begin

  UpdateV(Gesperrt, aGesperrt);

end;

procedure TMitarbeiter.setGruppe(aWert: integer);
begin
  UpdateV(Gruppe, aWert);
end;
{
procedure TMitarbeiter.setIMAP_Passwort(const Value: string);
begin
  UpdateV(_IMAP_Passwort, PasswortVerschluesseln(Value, getKey));
end;

procedure TMitarbeiter.setIMAP_User(const Value: string);
begin
  UpdateV(_IMAP_User, Value);
end;
  }
procedure TMitarbeiter.setIstAktiv(aWert: boolean);
begin
  UpdateV(IstAktiv, aWert);
end;

procedure TMitarbeiter.setHash(const aHash: string);
begin
  UpdateV(Hash, aHash);
end;

function TMitarbeiter.getHash: string;
begin
  result := Hash;
end;

procedure TMitarbeiter.setSalt(const aSalt: string);
begin
  UpdateV(Salt, aSalt);
end;

function TMitarbeiter.getSalt: string;
begin
  result := Salt;
end;

procedure TMitarbeiter.setPWChanged(aDate: TDateTime);
begin

  UpdateV(PWChanged, aDate);

end;

procedure TMitarbeiter.setPWChangeOwn(aValue: boolean);
begin

  UpdateV(PWChangeOwn, aValue);

end;

procedure TMitarbeiter.setPWExpiresAfter(aDays: integer);
begin

  UpdateV(PWExpiresAfter, aDays);

end;

procedure TMitarbeiter.setPWNeverExpires(aValue: boolean);
begin

  UpdateV(PWNeverExpires, aValue);

end;

function TMitarbeiter.getGeneratorName: string;
begin

  result := 'MA_ID';

end;

function TMitarbeiter.getTableName: string;
begin

  result := 'MITARBEITER';

end;

function TMitarbeiter.getTablePrefix: string;
begin

  result := 'MA';

end;

function TMitarbeiter.getKey: string;
var
  eKey: Extended;
begin
  eKey := power(getID, 2);
  Result := 'O$p"t!m$' + FloatToStr(eKey) + 'n2wß-f*r#o€n<t>i&e@r=s';
end;

function TMitarbeiter.getKommunikationMail: string;
var
  Query: TIBQuery;
  WasOpen: boolean;
begin

  Query := TIBQuery.Create(self);
  with Query do
  begin
    Transaction := self.Transaction;
    WasOpen := Transaction.inTransaction;
    if not WasOpen then
      Transaction.StartTransaction;
    SQL.Add('select MK_MAIL from MAKOMMUNIKATION ' +
           'where ' +
           'MK_DELETE != "T" and ' +
           'MK_MA_ID = :ID and ' +
           'MK_STANDARD = "T" ');

    ParamByName('ID').AsInteger := self.getID;
    Open;
    result := Fields[0].asString;
    Close;

    if not WasOpen then
      Transaction.Rollback;

    Free;

  end;

end;

function TMitarbeiter.getGruppe: integer;
begin
  result := Gruppe;
end;

function TMitarbeiter.getGruppen: TObjectList;
var
  ReadQuery: TIBQuery;
begin

  if Gruppen = nil then
  begin
    Gruppen := TObjectList.Create;
    ReadQuery := TIBQuery.Create(self);

    with ReadQuery do
    begin

      Transaction := self.Transaction;
      OpenTransaction;

      SQL.Clear;
      SQL.Add('SELECT * FROM MA_MG WHERE MA_MG_MA_ID = :ID AND MA_MG_DELETE <> "T"');

      ParamByName('ID').AsInteger := ID;

      Open;

      while not eof do
      begin

        Gruppen.Add(TMitarbeitergruppe.Create(self, FieldByName('MA_MG_MG_ID').AsInteger, StammdatenX, self.Transaction));
        next;

      end;

      Close;
      CommitTransaction;

    end;

    freeAndNil(ReadQuery);
  end;

  result := Gruppen;

end;

function TMitarbeiter.getImageFile: string;
var
  Mail, hash: string;
  fileStream: TFileStream;
  md5: TIdHashMessageDigest5;
  http: TIdHttp;
  DebugList: TDebugList;
begin

  // TODO: In eigene Klasse packen
  // TODO: TTL implementieren
  // TODO: In ein Temp-Verzeichnis speichern
  result := '';

  DebugList := TDebugList.Create('c:\temp\log.txt');
  try
    DebugList.Log('TMitarbeiter.getImageFile', '***START***');


    if getStandardKommunikationsprofil = nil then
    begin
      DebugList.Log('TMitarbeiter.getImageFile', 'Kein Standardprofil gefunden.');
      Exit;
    end;



    Mail := TMAKommunikation(getStandardKommunikationsprofil).getMail;
    DebugList.Log('TMitarbeiter.getImageFile', Mail);

    md5 := TIdHashMessageDigest5.Create;
    hash := LowerCase(md5.HashStringAsHex(LowerCase(Mail)));
    md5.Free;
    DebugList.Log('TMitarbeiter.getImageFile', Hash);

    result := Tnf.GetInstance.System.GetTempPath + hash + '.jpg';
    DebugList.Log('TMitarbeiter.getImageFile', Result);

    if (not FileExists(result)) then
    begin
      DebugList.Log('TMitarbeiter.getImageFile', 'Datei nicht gefunden');

      fileStream := TFileStream.Create(result, fmCreate);
      http := TIdHttp.Create(self);
      http.Get('http://www.gravatar.com/avatar/' + hash + '?s=32&d=mm', fileStream);
      DebugList.Log('TMitarbeiter.getImageFile', 'Get');
      http.Free;
      fileStream.Free;

    end;

    DebugList.Log('TMitarbeiter.getImageFile', '***ENDE***');
  finally
    FreeAndNil(DebugList);
  end;


end;
{
function TMitarbeiter.getIMAP_Passwort: string;
begin
  Result := PasswortEntschluesseln(_IMAP_Passwort, getKey);
end;
}
function TMitarbeiter.getIstAktiv: boolean;
begin
  result := IstAktiv;
end;

destructor TMitarbeiter.Destroy;
begin

  if (Vertreter <> nil) and (Vertreter.Owner = self) then
    freeAndNil(Vertreter);

  if (Gruppen <> nil) then
    freeAndNil(Gruppen);

  if (Berechtigung <> nil) then
    FreeAndNil(Berechtigung);

  inherited;
end;

function TMitarbeiter.getFax: string;
begin

  result := Fax;

end;

function TMitarbeiter.getMail: string;
begin

  result := Mail;

end;

function TMitarbeiter.getMAKommunikationID: integer;
var
  Query: TIBQuery;
  WasOpen: boolean;
begin
  result := -1;

  Query := TIBQuery.Create(self);
  with Query do
  begin
    Transaction := self.Transaction;
    WasOpen := Transaction.inTransaction;
    if not WasOpen then
      Transaction.StartTransaction;
    SQL.Add('select MK_ID from MAKOMMUNIKATION ' +
            'where ' +
            'MK_DELETE != "T" and ' +
            'MK_MA_ID = :ID and ' +
            'MK_STANDARD = "T" ');

    ParamByName('ID').AsInteger := self.getID;
    Open;
    if Fields[0].AsInteger > 0 then
      result := Fields[0].AsInteger;
    Close;

    if not WasOpen then
      Transaction.Rollback;

    Free;
  end;

end;

function TMitarbeiter.getGBKommunikationID: integer;
var
  Query: TIBQuery;
  WasOpen: boolean;
begin
  result := -1;
  Query := TIBQuery.Create(self);
  try
    Query.Transaction := self.Transaction;
    WasOpen := self.Transaction.Active;
    if not WasOpen then
      self.Transaction.StartTransaction;
    Query.SQL.Add('select MK_ID from MAKOMMUNIKATION ' +
                  'where ' +
                  'MK_DELETE != "T" and ' +
                  'MK_MA_ID = :ID and ' +
                  'MK_GB_ID = :GBID ');

    Query.ParamByName('ID').AsInteger := self.getID;

    Query.ParamByName('GBID').AsInteger := StammdatenX.getAktGB;
    Query.Open;
    if Query.Fields[0].AsInteger > 0 then
      result := Query.Fields[0].AsInteger;
    Query.Close;

    if not WasOpen then
      Transaction.Rollback;

  finally
    freeAndNil(Query);
  end;

end;

function TMitarbeiter.getGB_Bev_KommunikationID: integer;
var
  Query: TIBQuery;
  WasOpen: boolean;
begin
  result := -1;
  Query := TIBQuery.Create(self);
  try
    Query.Transaction := self.Transaction;
    WasOpen := self.Transaction.Active;
    if not WasOpen then
      self.Transaction.StartTransaction;
    Query.SQL.Add('select MK_ID from MAKOMMUNIKATION ' +
                  'where ' +
                  'MK_DELETE != "T" and ' +
                  'MK_GB_BEVORZUGT = "T" and ' +
                  'MK_MA_ID = :ID and ' +
                  'MK_GB_ID = :GBID ');

    Query.ParamByName('ID').AsInteger := self.getID;

    Query.ParamByName('GBID').AsInteger := StammdatenX.getAktGB;
    Query.Open;
    if Query.Fields[0].AsInteger > 0 then
      result := Query.Fields[0].AsInteger;
    Query.Close;

    if not WasOpen then
      Transaction.Rollback;

  finally
    freeAndNil(Query);
  end;

end;

function TMitarbeiter.getTel: string;
begin
  result := Tel;
end;

procedure TMitarbeiter.setFax(aFax: string);
begin

  UpdateV(Fax, aFax);

end;

procedure TMitarbeiter.setMail(aMail: string);
begin

  UpdateV(Mail, aMail);

end;

procedure TMitarbeiter.setTel(aTel: string);
begin

  UpdateV(Tel, aTel);

end;

function TMitarbeiter.delete: boolean;
begin
  DelQueries := TStringList.Create;
  DelQueries.Add('select count(*) from MAHNUNGEN where (MA_MITARBEITER =:Param)');
  DelQueries.Add('select count(*) from JOURNAL where (JO_MITARBEITER =:Param) and (JO_DELETE != "T")');
  DelQueries.Add('select count(*) from VORGANG where (VO_MITARBEITER =:Param) and (VO_DELETE != "T")');
  DelQueries.Add('select count(*) from AUFTRAGSSTEUERUNG where (AU_MA_ID =:Param) and (AU_DELETE != "T")');
  DelQueries.Add('select count(*) from CHARGE where (CH_MA_ID =:Param) and (CH_DELETE != "T")');
  DelQueries.Add('select count(*) from SERIENNUMMERN where (SN_MA_ID =:Param) and (SN_DELETE != "T")');
  DelQueries.Add('select count(*) from EXTDOKUMENTE where (ED_MA_ID =:Param) and (ED_DELETE != "T")');
  DelQueries.Add('select count(*) from ZAHLUNGEN where (ZA_MA_ID =:Param)');
  DelQueries.Add('select count(*) from MAILS where (ML_MA_ID =:Param) and (ML_DELETE != "T")');
  DelQueries.Add('select count(*) from T_PROZESS where (PZ_MA_ID =:Param) and (PZ_DELETE != "T")');
  DelQueries.Add('select count(*) from T_ARBEITSAUFTRAEGE where (AA_MA_ID =:Param) or (AA_AKT_MA_ID =:Param) and (AA_DELETE != "T")');
  DelQueries.Add('select count(*) from SENDUNGEN where (SE_MA_ID =:Param) and (SE_DELETE != "T")');
  DelQueries.Add('select count(*) from KUNDENAKTIVITAET where (KA_MA_ID =:Param) and (KA_DELETE != "T")');
  DelQueries.Add('select count(*) from ANSPRECHPARTNER where (AS_KONTAKTER =:Param) and (AS_DELETE != "T")');
  DelQueries.Add('select count(*) from PERSON where (PP_MA_ID =:Param) and (PP_DELETE != "T")');

  DelMessages := TStringList.Create;
  DelMessages.Add('den Mahnungen');
  DelMessages.Add('dem Journal');
  DelMessages.Add('aktiven Vorgängen');
  DelMessages.Add('den Service-Aufträgen');
  DelMessages.Add('den Chargen');
  DelMessages.Add('den Seriennummern');
  DelMessages.Add('den externen Dokumenten');
  DelMessages.Add('den Zahlungen');
  DelMessages.Add('den Mails');
  DelMessages.Add('den Tickets');
  DelMessages.Add('den Arbeitsauftraegen');
  DelMessages.Add('den Sendungen');
  DelMessages.Add('den Kundenaktivitäten');
  DelMessages.Add('den Ansprechpartnern');
  DelMessages.Add('den Personen');

  if AllowDelete then
  begin
    inherited delete;
    TMAGruppe.DeleteParent(getId, Transaction);
    result := true;
  end
  else
    result := false;

  FreeAndNil(DelQueries);
  FreeAndNil(DelMessages);
end;

procedure TMitarbeiter.InitNew;
begin
  inherited;
  Geschaeftsbereich := StammdatenX.getAktGB;
end;

procedure TMitarbeiter.setEBNotifikation(awert: boolean);
begin
  UpdateV(_EBNotifikation, awert);
end;

end.
