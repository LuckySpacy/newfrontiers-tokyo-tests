unit o_addison;

interface

uses Classes, SysUtils, StdCtrls, IBDatabase, IBQuery,
     sdfdata,

     addisonbasics_TLB, afibu_TLB,

     o_stammdaten, o_fibu_stamm, o_fibuexport;

const KundenSchema : array[0..22] of string = (
                      'SATZART', 'KONTO', 'BEZEICHNUNG', 'STRASSE', 'LAND',
                      'PLZ', 'ORT', 'TELEFON1', 'EMAIL', 'TELEFAX' , 'USTID',
                      'ZAHLUNGSART', 'BLZ1', 'BANKKONTO1', 'BANKNAME1', 'KEDITLIMIT',
                      'KUNDENNUMMER', 'ANREDE', 'KURZBEZ', 'VERDICHTKONTO',
                      'ZAHLSL', 'SORTSL1', 'SORTSL1BEZ');

const BuchenSchema : array[0..13] of string = (
                      'SATZART', 'KONTO', 'GEGENKONTO', 'BUCHUNGSDATUM', 'BETRAG',
                      'BUCHUNGSTEXT', 'BELEGDATUM', 'VALUTADATUM', 'NETTODATUM',
                      'BELEGNR', 'ABW_ZAHLUNGSART', 'BUCHSTEUERSL', 'BELEGNR2',
                      'ABW_ZAHLSL');

const ZSchluesselSchema : array[0..5] of string = (
                           'SATZART', 'ZAHLSL', 'ZAHLSL_NAME', 'ZAHLSL_TAGE1',
                           'ZAHLSL_PERCENT1', 'ZAHLSL_NETTOTAGE');

const KundenSchemaLaenge = 23;
const BuchenSchemaLaenge = 14;
const ZSchluesselSchemaLaenge = 6;

type TAddison = class(TFibuStamm)
  private

     CSVFile : TSdfDataSet;

     BOMan : AddBOManager;
     Mand  : AddMandant;
     FibuPrj : afibu_TLB.IAddProject;
     ImpFibuPrj : AddFibuProjectImp;
     Wirtschaftsjahr : RWFibuWJ;

     OPSGesehen : array of integer;

     ZFStart, ZFEnde : TDateTime;

     procedure CSVSchema(aTyp : integer; aFilter : string);

     function GetDebitorSaldo(aDebitorNummer : integer) : double;

     procedure NeuerOP(OP: RwOP; OpNummerSchreiben : boolean);
     procedure OPLoeschen(ID : integer);
     function OPGesehen(aMLID : integer) : boolean;
     procedure KeineOPSGesehen;
     function BetragGleich(aBerag1, aBetrag2 : double) : boolean;

     procedure ZahlungsschluesselAbgleichen;

  public

    constructor Create(aOwner: TComponent; aStammdaten: TStammdaten; aTransaction: TIBTransaction); override;
    destructor Destroy; override;

    function connect : boolean;
    procedure disconnect;

    function DebitorExport(aQuery : TIBQuery) : DataArray; override;
    function KreditorExport(aQuery : TIBQuery) : DataArray; override;
    function PostenExport(aQuery: TIBQuery) : DataArray; override;
    procedure PostenReImport; override;
    procedure ImportSalden; override;
    procedure ImportZahlungen; override;
    procedure OPListenAbgleich; override;
    function getName: string; override;    

end;

implementation

uses  ComObj, Math, Dialogs, DateUtils,  
      o_vorgang, o_erloeskonto, o_empfaenger, o_zahlungsschluessel, f_Optima;

{ TAddison }

function TAddison.BetragGleich(aBerag1, aBetrag2: double): boolean;
begin

  Result := SameValue(aBerag1, aBetrag2, 0.05);

end;

function TAddison.connect: boolean;
var Zeit : TDateTime;
    ZFOK : boolean;
begin

  Wirtschaftsjahr := nil;

  Zeit := Time;

  ZFOK := (
            (ZFStart < ZFEnde) and (ZFStart < Zeit) and (Zeit < ZFEnde)
          )
          or
          (
            (not (ZFStart < ZFEnde)) and ((Zeit < ZFEnde) or (ZFStart < Zeit))
          );

  if not ZFOK then
    begin
      Inaktiviert;
      Result := false;
      exit;
    end;

  try
    if (Stammdaten.getAddisonUser <> '') then    
      BOMan.ConnectEx(Stammdaten.getAddisonUser, Stammdaten.getAddisonPass)
    else
      BOMan.Connect;
  except
    on E:Exception do
    begin
      ShowMsg('Addison: ' + E.Message);
      Result := false;
      exit;
    end;
  end;

  Mand := BOMan.GetMandant[
                  StrToInt(Stammdaten.ServerEinstellungen.ReadString('AddisonMandant', '99999'))
                ];

  if Mand <> nil then
    begin
      addisonbasics_TLB.IAddProject(FibuPrj) := mand.GetFibuProject;

      if FibuPrj <> nil then
        begin

          ImpFibuPrj := CreateComObject(CLASS_AddFibuProjectImp) as IAddFibuProjectImp;
          ImpFibuPrj.Attach(FibuPrj);
          Wirtschaftsjahr := ImpFibuPrj.GetWJDate[EncodeDate(YearOf(now), 1, 1)];

          if Wirtschaftsjahr = nil then
            Wirtschaftsjahr := ImpFibuPrj.GetWJDate[EncodeDate(YearOf(now) - 1, 1, 1)];

          if Wirtschaftsjahr = nil then
            LogMessage('Wirtschaftsjahr konnte nicht geöffnet werden!');

        end;
    end;

  Result := (Wirtschaftsjahr <> nil);

end;

constructor TAddison.Create(aOwner: TComponent; aStammdaten: TStammdaten;
  aTransaction: TIBTransaction);
begin
  inherited;

  CSVFile := TSdfDataSet.Create(self);
  CSVFile.Delimiter := ';';
  CSVFile.FirstLineAsSchema := false;
  CSVFile.FileMustExist := false;
  CSVFile.FileName := Stammdaten.ServerEinstellungen.ReadString('AddisonExportDir', '') + '\topfib.csv';

  BOMan := CreateComObject(CLASS_AddBOManager) as IAddBOManager;

  ZFStart := StrToTime(Stammdaten.ServerEinstellungen.ReadString('AddisonZFStart', '00:00'));
  ZFEnde := StrToTime(Stammdaten.ServerEinstellungen.ReadString('AddisonZFEnde', '00:00'));


  if Connect then
    Disconnect
  else
    raise EFibuNotPresent.Create('Fehler beim Verbinden mit Addison-Datenbank');

end;

procedure TAddison.CSVSchema(aTyp: integer; aFilter : string);
var x : integer;
begin

  CSVFile.Schema.Clear;

  case aTyp of
   1 : begin
         x := 0;
         while x < KundenSchemaLaenge do
           begin
             CSVFile.Schema.Add(KundenSchema[x]);
             inc(x);
           end;
       end;
   2 : begin
         x := 0;
         while x < BuchenSchemaLaenge do
           begin
             CSVFile.Schema.Add(BuchenSchema[x]);
             inc(x);
           end;
       end;
   3 : begin
         x := 0;
         while x < ZSchluesselSchemaLaenge do
           begin
             CSVFile.Schema.Add(ZSchluesselSchema[x]);
             inc(x);
           end;
       end;
  end;

  if aFilter <> '' then
    begin
      CSVFile.Filter := aFilter;
      CSVFile.Filtered := true;
    end
  else
    begin
      CSVFile.Filter := '';
      CSVFile.Filtered := false;
    end;

end;

function TAddison.DebitorExport(aQuery: TIBQuery) : DataArray;
var ZahlArten : TIBQuery;
    i: integer;
    ZSHelper : TZSHelper;
    ZS : TZahlungsschluessel;
    Firmenname : string;
begin
  try
    LogMessage('TobFib-Export: Debitoren');

    ZahlArten := TIBQuery.Create(self);
    ZahlArten.Transaction := self.Transaction;
    ZahlArten.SQL.Text := 'SELECT * FROM ZAHLART';

    ZSHelper := TZSHelper.create(self, Stammdaten, Transaction);

    OpenTransaction;

    ZahlArten.Open;

    CSVSchema(1, '');

    CSVFile.Open;

    i := 0;
    setlength(Result, 0);

    while not aQuery.Eof do
    begin
      LogMessage('TobFib-Export: Debitor "' + aQuery.FieldByName('KU_MATCH').AsString + '"');
      LogMessage('Zahlungsschlüssel suchen oder neu anlegen...');

      ZS := ZSHelper.getZS(self, aQuery.FieldByName('KU_ZNETTOTAGE').AsInteger,
                           aQuery.FieldByName('KU_ZSKONTOTAGE').AsInteger,
                           aQuery.FieldByName('KU_ZSKONTO').AsFloat);

      LogMessage('Zahlungsschlüssel gelesen...');

      Firmenname := '';

      if aQuery.FieldByName('KU_FIRMA').AsString <> '' then
        Firmenname := aQuery.FieldByName('KU_FIRMA').AsString
      else
        Firmenname := aQuery.FieldByName('KU_VNAME').AsString  + ' ' + aQuery.FieldByName('KU_NAME').AsString;

      if Firmenname = '' then
        Firmenname := aQuery.FieldByName('KU_MATCH').AsString;

      CSVFile.Append;

      CSVFile.FieldByName('SATZART').AsString := 'K';
      CSVFile.FieldByName('KONTO').AsInteger  := aQuery.FieldByName('KU_DEBITOR').AsInteger;
      CSVFile.FieldByName('BEZEICHNUNG').AsString := Firmenname;
      CSVFile.FieldByName('STRASSE').AsString  := Trim(aQuery.FieldByName('KU_STRASSE').AsString + ' ' + aQuery.FieldByName('KU_HAUSNUMMER').asString);
      CSVFile.FieldByName('LAND').AsString     := aQuery.FieldByName('KU_LAND').AsString;
      CSVFile.FieldByName('PLZ').AsString      := aQuery.FieldByName('KU_PLZ').AsString;
      CSVFile.FieldByName('ORT').AsString      := aQuery.FieldByName('KU_ORT').AsString;
      CSVFile.FieldByName('TELEFON1').AsString := aQuery.FieldByName('KU_TEL').AsString;
      CSVFile.FieldByName('EMAIL').AsString    := aQuery.FieldByName('KU_MAIL').AsString;
      CSVFile.FieldByName('TELEFAX').AsString  := aQuery.FieldByName('KU_FAX').AsString;
      CSVFile.FieldByName('USTID').AsString    := aQuery.FieldByName('KU_USTID').AsString;

      if ZahlArten.Locate('ZA_ID', aQuery.FieldByName('KU_ZAHLART').AsInteger, [])
      and (Zahlarten.FieldByName('ZA_BANKV').AsString = 'T') then
        CSVFile.FieldByName('ZAHLUNGSART').AsString := 'A'
      else
        CSVFile.FieldByName('ZAHLUNGSART').AsString := 'N';

      CSVFile.FieldByName('BLZ1').AsString := aQuery.FieldByName('KU_BLZ').AsString;
      CSVFile.FieldByName('BANKKONTO1').AsString := aQuery.FieldByName('KU_KTONR').AsString;
      CSVFile.FieldByName('BANKNAME1').AsString  := aQuery.FieldByName('KU_BANK').AsString;
      CSVFile.Fields[15].Asfloat   := aQuery.FieldByName('KU_KREDITLIMIT').AsFloat;
      CSVFile.Fields[16].AsString  := aQuery.FieldByName('KU_NR').AsString;
      CSVFile.Fields[17].AsString  := aQuery.FieldByName('KU_ANREDE').AsString;
      CSVFile.Fields[18].AsString  := Firmenname;
      CSVFile.Fields[19].AsString  := aQuery.FieldByName('UT_KONTONR').AsString;
      CSVFile.Fields[20].AsInteger := ZS.getID;

      if aQuery.FieldByName('KU_EUAUSLAND').AsString = 'T' then
      begin
        CSVFile.Fields[21].AsInteger := 2;
        CSVFile.Fields[22].AsString := 'EU-AUSLAND';
      end
      else
        if aQuery.FieldByName('KU_AUSLAND').AsString = 'T' then
        begin
          CSVFile.Fields[21].AsInteger := 3;
          CSVFile.Fields[22].AsString := 'DRITTLAND';
        end
        else
        begin
          CSVFile.Fields[21].AsInteger := 1;
          CSVFile.Fields[22].AsString := 'INLAND';
        end;


      CSVFile.CheckBrowseMode;

      setlength(Result, i + 1);
      Result[i] := aQuery.FieldByName('KU_ID').AsInteger;

      FreeAndNil(ZS);
      inc(i);

      aQuery.Next;
    end;

    CSVFile.Close;

    ZahlArten.Close;
    ZahlArten.Free;

    ZSHelper.Free;

    CommitTransaction;

    ZahlungsschluesselAbgleichen;

    LogMessage('TobFib-Export (Debitoren) abgeschlossen');

  except
    on E:Exception do
    begin
      ShowMessage(E.Message + #13 + 'function TAddison.DebitorExport(aQuery: TIBQuery) : DataArray;');
      raise;
    end;
  end;

end;

destructor TAddison.destroy;
begin
  try
    BoMan := nil;

    // Backup
    CSVFile.Open;
    if CSVFile.RecordCount > 0 then
       CSVFile.SaveFileAs(Stammdaten.ServerEinstellungen.ReadString('AddisonExportDir', '') + '\backup.' + FormatDatetime('ddmmyyhhnn', now) + '.txt');
    CSVFile.Close;

    CSVFile.Free;

    inherited;
  except
    on E:Exception do
    begin
      ShowMessage(E.Message + #13 + 'destructor TAddison.destroy');
      raise;
    end;
  end;

end;

procedure TAddison.disconnect;
begin

  BOMan.close;

end;

function TAddison.GetDebitorSaldo(aDebitorNummer: integer): double;
var FibuKonto : RWFibuKonto;
begin

  Result := 0;

  if Wirtschaftsjahr.IsDebitor[IntToStr(aDebitorNummer)] <> 0 then
    begin
      FibuKonto := Wirtschaftsjahr.m_Debitorkonten.SearchFibuKonto[IntToStr(aDebitorNummer)];
      if FibuKonto <> nil then
        begin
          result := FibuKonto.m_Saldo[12];
          FibuKonto := nil;
        end;
    end;

end;

function TAddison.getName: string;
begin
  result := 'Addison';
end;

procedure TAddison.ImportSalden;
var ReadQuery : TIBQuery;
    WriteQuery : TIBQuery;
begin

  LogMessage('TobFib: Salden lesen');

  if not Connect then
    begin
      LogMessage('Keine Verbindung zur Datenbank');
      exit;
    end;

  if Wirtschaftsjahr = nil then
    begin
      LogMessage('Keine Verbindung zur Datenbank');
      exit;
    end;

  ReadQuery := TIBQuery.Create(self);
  ReadQuery.Transaction := Transaction;

  WriteQuery := TIBQuery.Create(self);
  WriteQuery.Transaction := Transaction;

  OpenTransaction;

  Readquery.SQL.Clear;
  Readquery.SQL.Add('SELECT KU_MATCH, KU_ID, KU_DEBITOR FROM KUNDEN ' +
                    'WHERE (KU_DEBITOR != 0) and (KU_DEBITOR IS NOT NULL)');

  WriteQuery.SQL.Clear;
  WriteQuery.SQL.Add('UPDATE KUNDEN SET KU_SALDO = :Saldo WHERE KU_ID = :ID');

  ReadQuery.Open;

  while not ReadQuery.Eof do
    begin

      LogMessage(Readquery.FieldByName('KU_MATCH').AsString);

      WriteQuery.ParamByName('ID').AsInteger :=
        Readquery.FieldByName('KU_ID').AsInteger;

      WriteQuery.ParamByName('Saldo').AsFloat :=
        GetDebitorSaldo(ReadQuery.FieldByName('KU_DEBITOR').AsInteger);

      WriteQuery.ExecSQL;

      ReadQuery.Next;
    end;

  Readquery.Close;

  Readquery.Free;

  CommitTransaction;

  LogMessage('TobFib: Salden lesen abgeschlossen');

  Disconnect;

end;

procedure TAddison.ImportZahlungen;
begin

  // Zahlungen können momentan nicht aus der Schnittstelle gelesen werden.

end;

procedure TAddison.KeineOPSGesehen;
begin

  SetLength(OPSGesehen, 0);

end;

function TAddison.KreditorExport(aQuery : TIBQuery) : DataArray;
var ZahlArten : TIBQuery;
    i : integer;
    ZSHelper : TZSHelper;
    ZS : TZahlungsschluessel;
    Firmenname : string;
begin

  LogMessage('TobFib-Export: Kreditoren');

  ZahlArten := TIBQuery.Create(self);
  ZahlArten.Transaction := self.Transaction;
  ZahlArten.SQL.Text := 'SELECT * FROM ZAHLART';
  ZahlArten.Open;

  ZSHelper := TZSHelper.create(self, Stammdaten, Transaction);

  OpenTransaction;

  ZahlArten.Open;

  CSVSchema(1, '');

  CSVFile.Open;

  i := 0;
  setlength(Result, 0);

  while not aQuery.Eof do
    begin

      LogMessage('TobFib-Export: Kreditor "' + aQuery.FieldByName('LT_MATCH').AsString + '"');
      LogMessage('Zahlungsschlüssel suchen oder neu anlegen...');

      ZS := ZSHelper.getZS(self, aQuery.FieldByName('LT_ZNETTOTAGE').AsInteger,
                                 aQuery.FieldByName('LT_ZSKONTOTAGE').AsInteger,
                                 aQuery.FieldByName('LT_ZSKONTO').AsFloat);

      LogMessage('Zahlungsschlüssel gelesen...');

      Firmenname := '';

      if aQuery.FieldByName('LT_FIRMA').AsString <> '' then Firmenname := aQuery.FieldByName('LT_FIRMA').AsString
      else Firmenname := aQuery.FieldByName('LT_VNAME').AsString  + ' ' + aQuery.FieldByName('LT_NAME').AsString;
      if Firmenname = '' then Firmenname := aQuery.FieldByName('LT_MATCH').AsString;

      CSVFile.Append;

      CSVFile.FieldByName('SATZART').AsString := 'K';
      CSVFile.FieldByName('KONTO').AsInteger := aQuery.FieldByName('LT_KREDITOR').AsInteger;
      CSVFile.FieldByName('BEZEICHNUNG').AsString := Firmenname;
      CSVFile.FieldByName('STRASSE').AsString := Trim(aQuery.FieldByName('LT_STRASSE').AsString + ' ' + aQuery.FieldByName('LT_HAUSNUMMER').asString);
      CSVFile.FieldByName('LAND').AsString := aQuery.FieldByName('LT_LAND').AsString;
      CSVFile.FieldByName('PLZ').AsString := aQuery.FieldByName('LT_PLZ').AsString;
      CSVFile.FieldByName('ORT').AsString := aQuery.FieldByName('LT_ORT').AsString;
      CSVFile.FieldByName('TELEFON1').AsString := aQuery.FieldByName('LT_TEL').AsString;
      CSVFile.FieldByName('EMAIL').AsString := aQuery.FieldByName('LT_MAIL').AsString;
      CSVFile.FieldByName('TELEFAX').AsString := aQuery.FieldByName('LT_FAX').AsString;
      CSVFile.FieldByName('USTID').AsString := aQuery.FieldByName('LT_USTID').AsString;

      if ZahlArten.Locate('ZA_ID', aQuery.FieldByName('LT_ZAHLART').AsInteger, []) and
         (Zahlarten.FieldByName('ZA_BANKV').AsString = 'T') then
        CSVFile.FieldByName('ZAHLUNGSART').AsString := 'A'
      else
        CSVFile.FieldByName('ZAHLUNGSART').AsString := 'N';

      CSVFile.FieldByName('BLZ1').AsString := aQuery.FieldByName('LT_BLZ').AsString;
      CSVFile.FieldByName('BANKKONTO1').AsString := aQuery.FieldByName('LT_KTONR').AsString;
      CSVFile.FieldByName('BANKNAME1').AsString := aQuery.FieldByName('LT_BANK').AsString;
      CSVFile.Fields[15].Asfloat := 0;
      CSVFile.Fields[16].AsString := aQuery.FieldByName('LT_NR').AsString;
      CSVFile.Fields[17].AsString := aQuery.FieldByName('LT_ANREDE').AsString;
      CSVFile.Fields[18].AsString := Firmenname;
      CSVFile.Fields[19].AsString := aQuery.FieldByName('UT_KONTONR').AsString;
      CSVFile.Fields[20].AsInteger := ZS.getID;

      if aQuery.FieldByName('LT_EUAUSLAND').AsString = 'T' then
        begin
          CSVFile.Fields[21].AsInteger := 2;
          CSVFile.Fields[22].AsString := 'EU-AUSLAND';
        end
      else if aQuery.FieldByName('LT_AUSLAND').AsString = 'T' then
        begin
          CSVFile.Fields[21].AsInteger := 3;
          CSVFile.Fields[22].AsString := 'DRITTLAND';
        end
      else
        begin
          CSVFile.Fields[21].AsInteger := 1;
          CSVFile.Fields[22].AsString := 'INLAND';
        end;

      CSVFile.CheckBrowseMode;

      setlength(Result, i + 1);
      Result[i] := aQuery.FieldByName('LT_ID').AsInteger;

      FreeAndNil(ZS);

      inc(i);

      aQuery.Next;

    end;

  CSVFile.Close;

  ZahlArten.Close;
  ZahlArten.Free;

  ZSHelper.Free;
  
  CommitTransaction;

  ZahlungsschluesselAbgleichen;

  LogMessage('TobFib-Export (Kreditoren) abgeschlossen');

end;

procedure TAddison.NeuerOP(OP: RwOP; OpNummerSchreiben : boolean);
var WriteQuery : TIBQuery;
    KUQuery : TIBQuery;

begin

  WriteQuery := TIBQuery.Create(self);
  WriteQuery.Transaction := self.Transaction;

  KUQuery := TIBQuery.Create(self);
  KUQuery.Transaction := self.Transaction;

  KUQuery.SQL.Text := 'SELECT KU_NR, KU_DEBITOR, KU_MATCH, KU_ID ' +
                      'FROM KUNDEN WHERE ' +
                      'KU_DEBITOR = :Debitor ';



  WriteQuery.SQL.Text := 'INSERT INTO MAHNLAUF ( ' +
                         'ML_ID, ML_KUNR, ML_OPNR, ML_DEBITOR, ML_MATCH, ML_MAHNLAUF, ' +
                         'ML_REDATUM, ML_MAHNBETRAG, ML_ZTAGENETTO, ' +
                         'ML_ZTAGESKONTO, ML_ZSKONTO, ML_LETZTEMDATUM, ' +
                         'ML_FAELLIGDATUM, ML_RENUMMER, ML_ERSTEMDATUM, ' +
                         'ML_GELEISTET, ML_KU_ID ' +
                         ') VALUES ( ' +
                         'GEN_ID(MAHNLAUF_ID, 1), :Kundennr, :OPNr, :Debitornr, :Match, 0, ' +
                         ':Redatum, :Betrag, :TageNetto, ' +
                         ':TageSkonto, :Skonto, :LetzteMDatum, ' +
                         ':Faelligdatum, :Beleg, :Erstemdatum, ' +
                         ':Geleistet, :KuId ' +
                         ')';

  if (StrToInt(OP.m_Konto) < 70000) then
    begin

      KUQuery.ParamByName('Debitor').AsInteger := StrtoInt(trim(OP.m_Konto));
      KUQuery.Open;

      if (KUQuery.FieldByName('KU_NR').AsInteger <> 0) then
        begin

          LogMessage('ML: Neuer Datensatz: ' + OP.m_BelegNr +  ' | ' + OP.m_BelegNr2);

          WriteQuery.ParamByName('Kundennr').AsInteger := KUQuery.FieldByName('KU_NR').AsInteger;
          if OPNummerSchreiben then
            WriteQuery.ParamByName('OpNr').AsInteger := StrToInt(Trim(OP.m_BelegNr2))
          else
            WriteQuery.ParamByName('OpNr').AsInteger := 0;
          WriteQuery.ParamByName('Debitornr').AsInteger := KUQuery.FieldByName('KU_DEBITOR').AsInteger;
          WriteQuery.ParamByName('Match').AsString := KUQuery.FieldByName('KU_MATCH').AsString;
          WriteQuery.ParamByName('KuId').AsInteger := KUQuery.FieldByName('Ku_Id').AsInteger;
          WriteQuery.ParamByName('ReDatum').AsDateTime := OP.m_BelegDatum;
          WriteQuery.ParamByName('Betrag').AsFloat := OP.m_Betrag;
          WriteQuery.ParamByName('TageNetto').AsInteger := Trunc(op.m_BelegDatum - Op.m_NettoFaelligkeit);
          WriteQuery.ParamByName('TageSkonto').AsInteger := Trunc(op.m_BelegDatum - Op.m_SkontoFaelligkeitStufe[0]);
          WriteQuery.ParamByName('Skonto').AsFloat := op.m_SkontoProzentSatzStufe[0];
          WriteQuery.ParamByName('LetzteMDatum').AsDateTime := OP.m_BelegDatum;
          WriteQuery.ParamByName('Faelligdatum').AsDateTime := OP.m_NettoFaelligkeit;
          WriteQuery.ParamByName('Beleg').asString := OP.m_BelegNr;
          WriteQuery.ParamByName('ErsteMDatum').AsDateTime := OP.m_BelegDatum;
          WriteQuery.ParamByName('Geleistet').AsFloat := 0;

          Writequery.ExecSQL;

        end;

      KUQuery.Close;

    end;

  FreeAndNil(KUQuery);
  FreeAndNil(WriteQuery);

end;

function TAddison.OPGesehen(aMLID: integer): boolean;
var x : integer;
begin

  for x := 0 to High(OPSGesehen) do
    if OPSGesehen[x] = aMLID then
      begin
        Result := true;
        exit;
      end;

  SetLength(OPSGesehen, High(OPSGesehen) + 2);
  OPSGesehen[High(OPSGesehen)] := aMLID;
  Result := false;

end;

procedure TAddison.OPListenAbgleich;
var OPSuche : RwOPSuche;
    OP : RwOP;

    Pos : integer;

    ReadQuery : TIBQuery;

    x : integer;

    OpSchreiben : boolean;

    OPNummerOk : boolean;

begin

  LogMessage('TobFib: OP-Listen-Abgleich');

  if not Connect then
    begin
      LogMessage('OP-Abgleich: Keine Verbindung zur Datenbank!');
      exit;
    end;

  if Wirtschaftsjahr = nil then
    begin
      LogMessage('OP-Abgleich: Keine Verbindung zur Datenbank!');
      exit;
    end;

  ReadQuery := TIBQuery.Create(self);
  Readquery.Transaction := Transaction;

  OpenTransaction;

  Readquery.SQL.Clear;
  ReadQuery.SQL.Add('SELECT ML_ID, ML_OPNR, ML_DEBITOR, ' +
                    'ML_RENUMMER, ML_REDATUM, ML_MAHNBETRAG ' +
                    'FROM MAHNLAUF ' +
                    'ORDER BY ML_DEBITOR ');

  Readquery.Open;

  Pos := 0;

  KeineOPSGesehen;

  OPSuche := Wirtschaftsjahr.CreateOPSuche;
  OPSuche.SearchBelegNr('*', '*');

  if OPSuche.Count = 0 then beep;

  OP := OPSuche.GetAt[Pos];
  while OP <> nil do
    begin

      OPSchreiben := true;

      OpNummerOK := (trim(OP.m_BelegNr2) <> '');

      try
        if OPNummerOK then
          OPNummerOK := (StrtoInt(trim(OP.m_BelegNr2)) <> 0);
      except
        OPNummerOK := false;
      end;

      if OPNummerOK then
        begin

          if ReadQuery.Locate('ML_OPNR', trim(OP.m_BelegNr2), []) then
            begin
              // OP Vorhanden!
              OPGesehen(ReadQuery.FieldByName('ML_ID').AsInteger);
              OPSchreiben := false;
            end;

        end
      else
        begin

          // 1. - Debitor vergleichen
          // 2. - Beträge vergleichen
          // 3. - Nachschauen ob ein ML-Eintrag schon mit
          //      anderem OP verglichen wurde
          // 4. - wenn ein Unterschied, dann ist der OP noch nicht
          //      in die ML-Tabelle aufgenommen

          if ReadQuery.Locate('ML_DEBITOR', trim(OP.m_Konto), []) then
            begin

              // Debitor gefunden, jetzt nach richtigem OP suchen!
              while (not ReadQuery.Eof) and
                    (ReadQuery.FieldByName('ML_DEBITOR').AsString = OP.m_Konto)  do
                begin

                  // wenn Beträge übereinstimmen nehmen wir an dieser    
                  // ML-Eintrag sei der vorgehaltene OP
                  if BetragGleich(ReadQuery.FieldByName('ML_MAHNBETRAG').AsFloat, OP.m_Betrag) then
                    begin

                      // Jetzt prüfen, ob wir ausgesuchten ML-Eintrag NICHT
                      // schon für einen anderen OP gehalten haben
                      if not OPGesehen(ReadQuery.FieldByName('ML_ID').AsInteger) then
                        begin

                          // Wir haben diesen ML-Eintrag noch nicht mit einem anderen
                          // OP in Verbindung gebracht.
                          // Daher ist der ausgesuchte ML-Eintrag tatsächlich unser OP
                          // und braucht nicht in die ML-Tabelle geschrieben werden.
                          OPSchreiben := false;
                          break;

                        end;
                    end;
                  ReadQuery.Next;
                end;

            end;
        end;

      if OPSchreiben then NeuerOP(OP, OPNummerOK);

      if (pos > 0) and ((pos mod 20) = 0) then
        LogMessage('ML: ' + IntToStr(pos) + ' Datensätze kontrolliert');

      OP := nil;
      inc(pos);
      OP := OPSuche.GetAt[pos];

    end;

  ReadQuery.First;

  while not ReadQuery.Eof do
    begin

      OPSchreiben := false;

      if (ReadQuery.FieldByName('ML_OPNR').AsString <> '') and
         (ReadQuery.FieldByName('ML_OPNR').AsInteger <> 0) then
        begin

          OP := nil;

          // wir haben einen OP-Schlüssel, also suchen wir den Schlüssel
          OPSuche.SearchBelegNr2(ReadQuery.FieldByName('ML_DEBITOR').AsString, IntToStr(ReadQuery.FieldByName('ML_OPNR').AsInteger));
          OP := OPSuche.GetAt[0];

          if OP = nil then OPSchreiben := true;

        end
      else
        begin

          // OP ohne OPNummer suchen, diese Methode sollte möglichst präzise sein!!!

          if ReadQuery.FieldByName('ML_RENUMMER').AsString <> '' then
            begin
              OPSuche.SearchBelegNr(ReadQuery.FieldByName('ML_DEBITOR').AsString, ReadQuery.FieldByName('ML_RENUMMER').AsString)
            end
          else
            begin
              OPSuche.SearchBelegNr(ReadQuery.FieldByName('ML_DEBITOR').AsString,'*');
            end;

          OPSchreiben := true;

          for x := 0 to OPSuche.Count - 1 do
            begin
              OP := nil;
              OP := OPSuche.GetAt[x];

              // Vergleichen der kriterien, die übrig sind
              // ACHTUNG! Wertdifferenzen zwischen GS-Fibu und Addison kippen
              // offene, agemahnte OPs in der ML-Tabelle, daher großzügiges
              // Delta bei Betragsvergleich!
              if SameValue(ReadQuery.FieldByName('ML_MAHNBETRAG').AsFloat, OP.m_Betrag, 1) then
                begin
                  OPSchreiben := false;
                  break;
                end;

            end;

        end;

      if OPSchreiben then
        OPLoeschen(ReadQuery.FieldByName('ML_ID').AsInteger);

      if (ReadQuery.RecNo > 0) and ((ReadQuery.RecNo mod 20) = 0) then
        LogMessage('ML: ' + IntToStr(ReadQuery.RecNo) + ' Datensätze kontrolliert');

      ReadQuery.Next;

      OP := nil;

    end;

  CommitTransaction;

  FreeAndNil(ReadQuery);

  LogMessage('TobFib: OP-Listen-Abgleich abgeschlossen.');

  Disconnect;

end;

procedure TAddison.OPLoeschen(ID: integer);
var WriteQuery : TIBQuery;
begin

  WriteQuery := TIBQuery.Create(self);
  WriteQuery.Transaction := self.Transaction;

  WriteQuery.SQL.Text := 'DELETE FROM MAHNLAUF WHERE ML_ID = :ID';

  WriteQuery.ParamByName('ID').AsInteger := ID;
  WriteQuery.ExecSQL;
  LogMessage('ML: Datensatz ' + IntToStr(ID) + ' gelöscht.');

end;

function TAddison.PostenExport(aQuery: TIBQuery) : DataArray;
var FibuListe : TFibuExportListe;
    Vorgang : TVorgang;
    x : integer;
    ZahlArten : TIBQuery;
    i : integer;
    OpNr : integer;

    ZSHelper : TZSHelper;
    ZS : TZahlungsschluessel;
begin

  if aQuery.Eof then exit;

  setLength(Result, 0);
  i := 0;

  LogMessage('TobFib-Export: Posten');

  ZSHelper := TZSHelper.create(self, Stammdaten, Transaction);

  OpenTransaction;

  ZahlArten := TIBQuery.Create(self);
  ZahlArten.Transaction := self.Transaction;
  ZahlArten.SQL.Text := 'SELECT * FROM ZAHLART';
  ZahlArten.Open;

  CSVSchema(2, '');
  CSVFile.Open;

  FibuListe := TFibuExportListe.Create;

  while not aQuery.Eof do
    begin

//      Vorgang := TVorgang.Create(aQuery.FieldByName('VO_ID').AsInteger, Transaction.DefaultDatabase, true, Stammdaten, self);
      Vorgang := TVorgang.Create(self, aQuery.FieldByName('VO_ID').AsInteger, Stammdaten, Transaction);
      LogMessage(Vorgang.getNummer);

      ZS := ZSHelper.getZS(self, Vorgang.getNettoTage, Vorgang.getSkontoTage, Vorgang.getSkonto);

      OPNr := OPNummer;

      FibuListe.Clear;

      Vorgang.FillFibuList(FibuListe);

      if FibuListe.Count = 1 then
        begin

          CSVFile.Append;

          LogMessage(Vorgang.getNummer);

          CSVFile.FieldByName('SATZART').AsString := 'B';
          CSVFile.FieldByName('KONTO').AsInteger := Vorgang.Empfaenger.getPersonenkonto;
          CSVFile.FieldByName('GEGENKONTO').AsInteger := TFibuexportItem(FibuListe.Items[0]).getKonto.getKontoNr;
          CSVFile.FieldByName('BUCHUNGSDATUM').AsString := FormatDateTime('mmyyyy', Vorgang.getDatum);

          if Vorgang.getArt in [cGutschrift, cEingangsrechnung, cStornierung, cPreisdifferenz] then
            CSVFile.FieldByName('BETRAG').AsFloat := -1 * TFibuexportItem(FibuListe.Items[0]).getBetragBrutto
          else
            CSVFile.FieldByName('BETRAG').AsFloat := TFibuexportItem(FibuListe.Items[0]).getBetragBrutto;

          CSVFile.FieldByName('BUCHUNGSTEXT').AsString := 'OP: ' + Vorgang.getNummer + ' / ' + Vorgang.Empfaenger.getMatch;
          CSVFile.FieldByName('BELEGDATUM').AsDateTime := Vorgang.getDatum;
          if Vorgang.getSkontoTage <> 0 then
            CSVFile.FieldByName('VALUTADATUM').AsDateTime := Vorgang.getDatum + Vorgang.getSkontoTage
          else if Vorgang.getNettoTage <> 0 then
            CSVFile.FieldByName('VALUTADATUM').AsDateTime := Vorgang.getDatum + Vorgang.getNettoTage
          else
            CSVFile.FieldByName('VALUTADATUM').AsDateTime := Vorgang.getDatum;
          CSVFile.FieldByName('NETTODATUM').AsDateTime := Vorgang.getDatum + Vorgang.getNettoTage;
          CSVFile.FieldByName('BELEGNR').AsString := Vorgang.getNummer;
          CSVFile.FieldByName('BELEGNR2').AsString := IntToStr(OPNr);

          if ZahlArten.Locate('ZA_ID', Vorgang.getZahlungsartID, []) and
            (Zahlarten.FieldByName('ZA_BANKV').AsString = 'T') then
            CSVFile.FieldByName('ABW_ZAHLUNGSART').AsString := 'A'
          else
            CSVFile.FieldByName('ABW_ZAHLUNGSART').AsString := 'N';

          CSVFile.FieldByName('BUCHSTEUERSL').AsString := IntToStr(TFibuexportItem(FibuListe.Items[0]).getKonto.getPDXKennung);

          CSVFile.FieldByName('ABW_ZAHLSL').AsInteger := ZS.getID;

          CSVFile.CheckBrowseMode;

        end
      else if FibuListe.Count > 1 then
        begin

          // Aufteilungsbuchung - Aufteilungsbetrag

          CSVFile.Append;

          LogMessage(Vorgang.getNummer + ' - Aufteilungsbuchung');

          CSVFile.FieldByName('SATZART').AsString := 'B';
          CSVFile.FieldByName('KONTO').AsInteger := Vorgang.Empfaenger.getPersonenkonto;
          CSVFile.FieldByName('GEGENKONTO').AsInteger := 0;
          CSVFile.FieldByName('BUCHUNGSDATUM').AsString := FormatDateTime('mmyyyy', Vorgang.getDatum);

          if Vorgang.getArt in [cGutschrift, cEingangsrechnung, cStornierung, cPreisdifferenz] then
            CSVFile.FieldByName('BETRAG').AsFloat := -1 * Vorgang.getBruttosumme
          else
            CSVFile.FieldByName('BETRAG').AsFloat := Vorgang.getBruttosumme;

          CSVFile.FieldByName('BUCHUNGSTEXT').AsString := 'OP: ' + Vorgang.getNummer + ' / ' + Vorgang.Empfaenger.getMatch;
          CSVFile.FieldByName('BELEGDATUM').AsDateTime := Vorgang.getDatum;
          if Vorgang.getSkontoTage <> 0 then
            CSVFile.FieldByName('VALUTADATUM').AsDateTime := Vorgang.getDatum + Vorgang.getSkontoTage
          else if Vorgang.getNettoTage <> 0 then
            CSVFile.FieldByName('VALUTADATUM').AsDateTime := Vorgang.getDatum + Vorgang.getNettoTage
          else
            CSVFile.FieldByName('VALUTADATUM').AsDateTime := Vorgang.getDatum;
          CSVFile.FieldByName('NETTODATUM').AsDateTime := Vorgang.getDatum + Vorgang.getNettoTage;
          CSVFile.FieldByName('BELEGNR').AsString := Vorgang.getNummer;
          CSVFile.FieldByName('BELEGNR2').AsString := IntToStr(OPNr);

          if ZahlArten.Locate('ZA_ID', Vorgang.getZahlungsartID, []) and
            (Zahlarten.FieldByName('ZA_BANKV').AsString = 'T') then
            CSVFile.FieldByName('ABW_ZAHLUNGSART').AsString := 'A'
          else
            CSVFile.FieldByName('ABW_ZAHLUNGSART').AsString := 'N';

          CSVFile.FieldByName('ABW_ZAHLSL').AsInteger := ZS.getID;

          CSVFile.FieldByName('BUCHSTEUERSL').AsString := '';

          CSVFile.CheckBrowseMode;

          for x := 0 to FibuListe.Count - 1 do
            begin
              // Aufteilungsbuchung - Aufteilungs-Gegenbuchung

              CSVFile.Append;

              LogMessage(Vorgang.getNummer + ' - Aufteilungs-Gegenbuchung ' + IntToStr(x));

              CSVFile.FieldByName('SATZART').AsString := 'B';
              CSVFile.FieldByName('KONTO').AsInteger := TFibuexportItem(FibuListe.Items[x]).getKonto.getKontoNr;
              CSVFile.FieldByName('GEGENKONTO').AsInteger := Vorgang.Empfaenger.getPersonenkonto;
              CSVFile.FieldByName('BUCHUNGSDATUM').AsString := FormatDateTime('mmyyyy', Vorgang.getDatum);

              if Vorgang.getArt in [cGutschrift, cEingangsrechnung, cStornierung, cPreisdifferenz] then
                CSVFile.FieldByName('BETRAG').AsFloat := TFibuexportItem(FibuListe.Items[x]).getBetragBrutto
              else
                CSVFile.FieldByName('BETRAG').AsFloat := -1 * TFibuexportItem(FibuListe.Items[x]).getBetragBrutto;

              CSVFile.FieldByName('BUCHUNGSTEXT').AsString := 'OP: ' + Vorgang.getNummer + ' / ' + Vorgang.Empfaenger.getMatch;
              CSVFile.FieldByName('BELEGDATUM').AsDateTime := Vorgang.getDatum;
              if Vorgang.getSkontoTage <> 0 then
                CSVFile.FieldByName('VALUTADATUM').AsDateTime := Vorgang.getDatum + Vorgang.getSkontoTage
              else if Vorgang.getNettoTage <> 0 then
                CSVFile.FieldByName('VALUTADATUM').AsDateTime := Vorgang.getDatum + Vorgang.getNettoTage
              else
                CSVFile.FieldByName('VALUTADATUM').AsDateTime := Vorgang.getDatum;
              CSVFile.FieldByName('NETTODATUM').AsDateTime := Vorgang.getDatum + Vorgang.getNettoTage;
              CSVFile.FieldByName('BELEGNR').AsString := Vorgang.getNummer;
              CSVFile.FieldByName('BELEGNR2').AsString := IntToStr(OPNr);

              if ZahlArten.Locate('ZA_ID', Vorgang.getZahlungsartID, []) and
                (Zahlarten.FieldByName('ZA_BANKV').AsString = 'T') then
                CSVFile.FieldByName('ABW_ZAHLUNGSART').AsString := 'A'
              else
                CSVFile.FieldByName('ABW_ZAHLUNGSART').AsString := 'N';

              CSVFile.FieldByName('ABW_ZAHLSL').AsInteger := ZS.getID;

              CSVFile.FieldByName('BUCHSTEUERSL').AsString := IntToStr(TFibuexportItem(FibuListe.Items[x]).getKonto.getPDXKennung);

              CSVFile.CheckBrowseMode;

            end;
        end;

      setlength(Result, i + 1);
      Result[i] := Vorgang.getID;

      FreeAndNil(ZS);

      //Vorgang.setFibuStapel(true);
      //Vorgang.setExportDatum(date);
      //Vorgang.saveToDB;

      Vorgang.Free;

      inc(i);

      aQuery.Next;
    end;

  FibuListe.Free;

  ZahlArten.Close;
  ZahlArten.Free;

  ZSHelper.Free;

  CSVFile.Close;

  CommitTransaction;

  ZahlungsschluesselAbgleichen;

  LogMessage('TobFib Export (Posten) abgeschlossen');

end;

procedure TAddison.PostenReImport;
var OPSuche : RwOPSuche;
    OP : RwOP;
    IBQVorgaenge : TIBQuery;
    Vorgang : TVorgang;
    Nummern : TStrings;
begin


  LogMessage('TobFib Posten Reimport');

  if not Connect then
    begin
      LogMessage('Posten Re-Import: Keine Verbindung zur Datenbank');
      exit;
    end;

  Nummern := TStringList.Create;

  CSVSchema(2, '');
  CSVFile.Open;

  while not CSVFile.Eof do
    begin

      if CSVFile.FieldByName('SATZART').AsString = 'B' then
        Nummern.Add(CSVFile.FieldByName('BELEGNR').AsString);

      CSVFile.Next;

    end;

  CSVFile.Close;

  IBQVorgaenge := TIBQuery.Create(self);
  IBQVorgaenge.Transaction := self.Transaction;

  OpenTransaction;


  with IBQVorgaenge do
    begin

      SQL.Clear;

      SQL.Add('SELECT VO_ID ' +
              'FROM VORGANG ' +
              'WHERE ' +
              '(VO_ART IN ("4","5","18","10","12")) ' +
              'AND ' +
              '(VO_STATUS <> 3) ' +
              'AND ' +
              '(VO_FIBUSTAPEL = "T") ' +
              'AND ' +
              '(VO_DELETE != "T") ' +
              'ORDER BY VO_NUMMER');

      Open;

      while not Eof do
        begin

//          Vorgang := TVorgang.Create(FieldByName('VO_ID').AsInteger, self.Transaction.DefaultDatabase, true, Stammdaten, self);
          Vorgang := TVorgang.Create(self, FieldByName('VO_ID').AsInteger, Stammdaten, Transaction);

          // 1. OP noch in der Datei?
          if (Nummern.Count = 0) or
             (Nummern.IndexOf(Vorgang.getNummer) = -1) then
            begin

              // nicht vorhanden in Exportdatei
              // 2. OP noch in Addison?
              OP := nil;

              OPSuche := Wirtschaftsjahr.CreateOPSuche;
              if Vorgang.Empfaenger.isOfType(cKunde) then
                OPSuche.SearchBelegNr(IntToStr(TKunden(Vorgang.Empfaenger).getDebitor), Vorgang.getNummer)
              else
                OPSuche.SearchBelegNr(IntToStr(TLieferant(Vorgang.Empfaenger).getKreditor), Vorgang.getNummer);
              OP := OPSuche.GetAt[0];

              if op = nil then
                begin

                  // nicht Vorhanden in Addison
                  // Vorgang ist erledigt
                  LogMessage('      Vorgang erledigt: ' + Vorgang.getNummer);
                  Vorgang.setStatus(cErledigt);
                  Vorgang.saveToDB;
                  Vorgang.HistorienDatensatzAnlegen(12, 'Vorgang wurde erledigt. (Server: Fibu - PostenReImport).');
                end
              else
                begin
                  LogMessage('      Vorgang noch offen: ' + Vorgang.getNummer);
                end;

            end;

          Vorgang.Free;

          if IBQVorgaenge.RecNo mod 10 = 0 then
            LogMessage(IntToStr(IBQVorgaenge.RecNo) + ' Datensätze überprüft');

          Next;

        end;

      Close;

      Free;

    end;

  CommitTransaction;

  Nummern.Free;

  OP := nil;
  
  Disconnect;

end;

procedure TAddison.ZahlungsschluesselAbgleichen;
var ReadQuery : TIBQuery;
    WriteQuery : TIBQuery;
begin

  LogMessage('Zahlungsschluessel aktualisieren');

  ReadQuery := TIBQUery.Create(self);
  WriteQuery := TIBQUery.Create(self);

  with WriteQuery do
    begin

      Transaction := self.Transaction;
      SQL.Text := 'UPDATE ZAHLUNGSSCHLUESSEL SET ZS_PDXUPDATE = "F" WHERE ZS_ID = :Id';

    end;

  OpenTransaction;

  CSVSchema(3, '');
  CSVFile.Open;

  with ReadQuery do
    begin

      Transaction := self.Transaction;
      SQL.Text := 'SELECT * FROM ZAHLUNGSSCHLUESSEL WHERE ' +
                  'ZS_PDXUPDATE = "T" AND ZS_DELETE <> "T" ';

      Open;

      CSVFile.First;

      while not EOF do
        begin

          LogMessage(ReadQuery.FieldByName('ZS_BEZEICHNUNG').AsString);

          CSVFile.Insert;

          CSVFile.FieldByName('SATZART').AsString := 'Z';
          CSVFile.FieldByName('ZAHLSL').AsInteger := ReadQuery.FieldByName('ZS_ID').AsInteger;
          CSVFile.FieldByName('ZAHLSL_NAME').AsString := ReadQuery.FieldByName('ZS_BEZEICHNUNG').AsString;
          CSVFile.FieldByName('ZAHLSL_TAGE1').AsInteger := ReadQuery.FieldByName('ZS_SKONTOTAGE').AsInteger;
          CSVFile.FieldByName('ZAHLSL_PERCENT1').AsFloat := ReadQuery.FieldByName('ZS_SKONTO').AsFloat;
          CSVFile.FieldByName('ZAHLSL_NETTOTAGE').AsInteger := readQuery.FieldByName('ZS_NETTOTAGE').AsInteger;

          CSVFile.CheckBrowseMode;

          WriteQuery.ParamByName('ID').AsInteger := ReadQuery.FieldByName('ZS_ID').AsInteger;
          WriteQuery.ExecSQL;

          Next;

        end;

      Close;

    end;

  CSVFile.Close;

  CommitTransaction;

  WriteQuery.Free;
  ReadQuery.Free;

end;

end.
