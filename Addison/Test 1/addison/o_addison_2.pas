unit o_addison_2;

interface

{$WARN SYMBOL_PLATFORM OFF}
// {$DEFINE FIBUTEST}

uses Classes, SysUtils, StdCtrls, IBX.IBDatabase, IBX.IBQuery,
  addisonbasics_TLB, afibu_TLB, o_nfcsvexport, System.Contnrs,
  o_stammdaten, o_fibu_stamm, o_fibuexport, c_Locks, o_zahlungsschluessel;

type
  TAddison_2 = class(TFibuStamm)
  private
    BOMan: AddBOManager;
    Mand: AddMandant;
    FibuPrj: afibu_TLB.IAddProject;
    ImpFibuPrj: AddFibuProjectImp;
    Wirtschaftsjahr: RWFibuWJ;

    OPSGesehen: array of integer;

    ZFStart, ZFEnde: TDateTime;

    _CSV: TNFCSVExport;
    _CSVK: TNFCSVExport;
    _CSVB: TNFCSVExport;
    _CSVZ: TNFCSVExport;

    function GetDebitorSaldo(aDebitorNummer: integer): double;

    procedure NeuerOP(OP: RwOP; OpNummerSchreiben: boolean);
    procedure OPLoeschen(ID: integer);
    function OPGesehen(aMLID: integer): boolean;
    procedure KeineOPSGesehen;
    function BetragGleich(aBerag1, aBetrag2: double): boolean;

    procedure ZahlungsschluesselAbgleichen(aFilename: string);
    procedure SetKundenShema(aCSV: TNFCSVExport);
    procedure SetBuchenShema(aCSV: TNFCSVExport);
    procedure SetSchluesselSchema(aCSV: TNFCSVExport);
    procedure BeforeExport(aCSVFilename: string);
    procedure DanachExport(aCSVFilename: string);
    procedure SplittCSVList(aCSVFilename: string);
    procedure CombinedCSVList;
    function DebitorExport(aQuery: TIBQuery; aFileName: string): DataArray;
    function KreditorExport(aQuery: TIBQuery; aFilename: string): DataArray;
//    function PostenExport(aQuery: TIBQuery; aFilename: string): DataArray;
    function PostenExport(aQuery: TIBQuery;  aQueryEB: TIBQuery; aFilename: string;
                          var aDataArray : DataArray): DataArray;

    function PostenExportVO(aQuery: TIBQuery; aFilename: string; aZSHelper : TZSHelper; aZahlArten: TIBQuery): DataArray;
    procedure PostenExportEB(aQuery: TIBQuery; aFilename: string; var aDataArray : DataArray; aZSHelper : TZSHelper;
                             aZahlArten: TIBQuery);
  public

    constructor Create(aOwner: TComponent; aStammdaten: TStammdaten;  aTransaction: TIBTransaction); override;
    destructor Destroy; override;

    function connect: boolean;
    procedure disconnect;
    function FibuExport(aQuery: TIBQuery; aQueryEB: TIBQuery; aFibuExportart: TFibuExportart; var aError: Boolean;
                        var aDataArray : DataArray ): DataArray; override;
    procedure PostenReImport; override;
    procedure ImportSalden; override;
    procedure ImportZahlungen; override;
    procedure OPListenAbgleich; override;
    function getName: string; override;

  end;

implementation

uses ComObj, Math, Dialogs, DateUtils,
  o_vorgang, o_erloeskonto, o_empfaenger, f_Optima,
  Windows, o_nf, o_backupfilemanager, o_eingangsbeleg, o_SyEinstellungen, o_dictionary,
  c_Types, o_eingangsbeleg_aufteilung;
{ TAddison_2 }

constructor TAddison_2.Create(aOwner: TComponent; aStammdaten: TStammdaten;
  aTransaction: TIBTransaction);
begin
  inherited;

  _CSV  := TNFCSVExport.Create;
  _CSVK := TNFCSVExport.Create;
  _CSVB := TNFCSVExport.Create;
  _CSVZ := TNFCSVExport.Create;


  {$IFNDEF FIBUTEST}
  BOMan := CreateComObject(CLASS_AddBOManager) as IAddBOManager;
  {$ENDIF}

  ZFStart := StrToTime(Stammdaten.ServerEinstellungen.ReadString
    ('AddisonZFStart', '00:00'));
  ZFEnde := StrToTime(Stammdaten.ServerEinstellungen.ReadString('AddisonZFEnde',
    '00:00'));

  {$IFDEF FIBUTEST}
  ShowMessage('Server befindet sich im FibuTest');
  exit;
  {$ENDIF}

  if connect then
    disconnect
  else
    raise EFibuNotPresent.Create('Fehler beim Verbinden mit Addison-Datenbank');

end;

destructor TAddison_2.Destroy;
begin
  try
    BOMan := nil;

    FreeAndNil(_CSV);
    FreeAndNil(_CSVK);
    FreeAndNil(_CSVB);
    FreeAndNil(_CSVZ);
    inherited;
  except
    on E: Exception do
    begin
      ShowMessage(E.Message + #13 + 'destructor TAddison.destroy');
      raise;
    end;
  end;
end;

procedure TAddison_2.SetKundenShema(aCSV: TNFCSVExport);
begin
  aCSV.Shema.Clear;
  aCSV.Shema.Add('SATZART');
  aCSV.Shema.Add('KONTO');
  aCSV.Shema.Add('BEZEICHNUNG');
  aCSV.Shema.Add('STRASSE');
  aCSV.Shema.Add('LAND');
  aCSV.Shema.Add('PLZ');
  aCSV.Shema.Add('ORT');
  aCSV.Shema.Add('TELEFON1');
  aCSV.Shema.Add('EMAIL');
  aCSV.Shema.Add('TELEFAX');
  aCSV.Shema.Add('USTID');
  aCSV.Shema.Add('ZAHLUNGSART');
  aCSV.Shema.Add('BLZ1');
  aCSV.Shema.Add('BANKKONTO1');
  aCSV.Shema.Add('BANKNAME1');
  aCSV.Shema.Add('KEDITLIMIT');
  aCSV.Shema.Add('KUNDENNUMMER');
  aCSV.Shema.Add('ANREDE');
  aCSV.Shema.Add('KURZBEZ');
  aCSV.Shema.Add('VERDICHTKONTO');
  aCSV.Shema.Add('ZAHLSL');
  aCSV.Shema.Add('SORTSL1');
  aCSV.Shema.Add('SORTSL1BEZ');
  aCSV.Shema.Add('WID_KONTO');
  aCSV.Shema.Add('IBAN1');
  aCSV.Shema.Add('SWIFT1');
  aCSV.Shema.Add('BEZ2');
  aCSV.Shema.Add('BEZ3');
  aCSV.Shema.Add('BRIEFANREDE');
end;

procedure TAddison_2.SetBuchenShema(aCSV: TNFCSVExport);
begin
  aCSV.Shema.Clear;
  aCSV.Shema.Add('SATZART');
  aCSV.Shema.Add('KONTO');
  aCSV.Shema.Add('GEGENKONTO');
  aCSV.Shema.Add('BUCHUNGSDATUM');
  aCSV.Shema.Add('BETRAG');
  aCSV.Shema.Add('BUCHUNGSTEXT');
  aCSV.Shema.Add('BELEGDATUM');
  aCSV.Shema.Add('VALUTADATUM');
  aCSV.Shema.Add('NETTODATUM');
  aCSV.Shema.Add('BELEGNR');
  aCSV.Shema.Add('ABW_ZAHLUNGSART');
  aCSV.Shema.Add('BUCHSTEUERSL');
  aCSV.Shema.Add('BELEGNR2');
  aCSV.Shema.Add('ABW_ZAHLSL');
  aCSV.Shema.Add('WID_KONTO');
  aCSV.Shema.Add('BELEGLINK');

end;

procedure TAddison_2.SetSchluesselSchema(aCSV: TNFCSVExport);
begin
  aCSV.Shema.Clear;
  aCSV.Shema.Add('SATZART');
  aCSV.Shema.Add('ZAHLSL');
  aCSV.Shema.Add('ZAHLSL_NAME');
  aCSV.Shema.Add('ZAHLSL_TAGE1');
  aCSV.Shema.Add('ZAHLSL_PERCENT1');
  aCSV.Shema.Add('ZAHLSL_NETTOTAGE');

end;


function TAddison_2.connect: boolean;
var
  Zeit: TDateTime;
  ZFOK: boolean;
  Wjbeginn: string;
  WjJahr: Word;
  WjMonat: Word;
  WjTag: Word;
  dWjBeginn: TDateTime;
begin

  Wirtschaftsjahr := nil;

  Zeit := Time;

  ZFOK := ((ZFStart < ZFEnde) and (ZFStart < Zeit) and (Zeit < ZFEnde)) or
    ((not(ZFStart < ZFEnde)) and ((Zeit < ZFEnde) or (ZFStart < Zeit)));

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
      BOMan.connect;
  except
    on E: Exception do
    begin
      ShowMsg(Self,'Addison: ' + E.Message);
      Result := false;
      exit;
    end;
  end;

  Mand := BOMan.GetMandant[StrToInt(Stammdaten.ServerEinstellungen.ReadString('AddisonMandant', '99999'))];

  if Mand <> nil then
  begin
    addisonbasics_TLB.IAddProject(FibuPrj) := Mand.GetFibuProject;

    // Start des Wirtschaftsjahres aus den Stammdaten laden
    Stammdaten.ServerEinstellungen.ReadString('AddisonWjBeginn', Wjbeginn);

    if not TryStrToDate(wjbeginn, dWjBeginn) then
      dWjBeginn := DateUtils.StartOfTheYear(now);

    DecodeDate(dWjBeginn, WjJahr, WjMonat, WjTag);

    if FibuPrj <> nil then
    begin

      ImpFibuPrj := CreateComObject(CLASS_AddFibuProjectImp)
        as IAddFibuProjectImp;
      ImpFibuPrj.Attach(FibuPrj);
      Wirtschaftsjahr := ImpFibuPrj.GetWJDate[EncodeDate(YearOf(now), WjMonat, WjTag)];

      if Wirtschaftsjahr = nil then
        Wirtschaftsjahr := ImpFibuPrj.GetWJDate
          [EncodeDate(YearOf(now) - 1, WjMonat, WjTag)];

      if Wirtschaftsjahr = nil then
        LogMessage('Wirtschaftsjahr konnte nicht geöffnet werden!');

    end;
  end;

  Result := (Wirtschaftsjahr <> nil);

end;

procedure TAddison_2.disconnect;
begin
  BOMan.close;
end;


//function TAddison_2.FibuExport(aQuery: TIBQuery; aFibuExportart: TFibuExportart; var aError: Boolean): DataArray;
function TAddison_2.FibuExport(aQuery: TIBQuery; aQueryEB: TIBQuery; aFibuExportart: TFibuExportart; var aError: Boolean;
                        var aDataArray : DataArray ): DataArray;
var
  CSVFilename: string;
  CSVTemp    : string;
  CSVWork    : string;
  Sicherung  : string;
  FileHdl    : THandle;
  FibuPfad   : string;
begin
  aError := false;
  Result := nil;
  _CSV.Clear;

  {$IFDEF FIBUTEST}
  aError := true;
  {$ENDIF FIBUTEST}

  if aQueryEB = nil then
  begin
    if aQuery.Eof then
    begin
       exit;
    end;
  end
  else
  if aQuery.Eof and aQueryEB.Eof then
  begin
    exit;
  end;

  FibuPfad := ExtractFilePath(IncludeTrailingPathDelimiter(Stammdaten.ServerEinstellungen.ReadString('AddisonExportDir', '')) + 'topfib.csv' );
  if Tnf.GetInstance.System.DirExist(FibuPfad) < 0 then
    ForceDirectories(FibuPfad);
  CSVFilename := Stammdaten.ServerEinstellungen.ReadString('AddisonExportDir', '') + '\topfib.csv';
//  CSVFilename := 'D:\topfib.csv';
  CSVTemp := Tnf.GetInstance.System.GetTempFullFilename;
  CSVWork := CSVTemp;

  BeforeExport(CSVFileName);
  if not ChangeFileName(CSVFilename, CSVTemp, Sicherung, FileHdl) then
  begin
    LogFehler('Datei "' + CSVFileName + '" ist gesperrt. TopFib-Export: Export nicht möglich.');
    aError := true;
    exit;
  end;

  try
  //  if not FileExists(CSVTemp) then
    if Tnf.GetInstance.System.FileExist(CSVTemp) < 0 then
      CSVWork := CSVFileName;

    SplittCSVList(CSVWork);

    try
      if aFibuExportart = fibuexp_Debitor then
        Result := DebitorExport(aQuery, CSVWork);
      if aFibuExportart = fibuexp_Kreditor then
        Result := KreditorExport(aQuery, CSVWork);
      if aFibuExportart = fibuexp_Posten then
        Result := PostenExport(aQuery, aQueryEB, CSVWork, aDataArray);

      CombinedCSVList;
      try
        _CSV.SaveToFile(CSVWork);
      except
        on E:Exception do
        begin
          LogMessage('Fehler: Work1 Datei "' + CSVWork + '" konnte nicht geschrieben werden.' + E.Message);
          aError := true;
        end;
      end;

      SplittCSVList(CSVWork);
      ZahlungsschluesselAbgleichen(CSVWork);
      CombinedCSVList;
      try
        _CSV.SaveToFile(CSVWork);
      except
        on E:Exception do
        begin
          LogMessage('Fehler: Work2 Datei "' + CSVWork + '" konnte nicht geschrieben werden.' + E.Message);
          aError := true;
        end;
      end;
    finally
      CloseHandle(FileHdl);
    end;
  finally
    try
      if Tnf.GetInstance.System.FileExist(CSVTemp) = 0 then
        CopyFileA(PAnsiChar(AnsiString(CSVTemp)), PAnsiChar(AnsiString(CSVFileName)), false);
      if Tnf.GetInstance.System.FileExist(CSVFileName) = 0 then
      begin
        try
          DanachExport(CSVFileName);
          DeleteFileA(PAnsiChar(AnsiString(Sicherung)));
        except
        end;
      end
      else
      begin
        aError := true;
      end;
      try
        DeleteFileA(PAnsiChar(AnsiString(CSVTemp)));
      except
      end;
    except
      on E:Exception do
      begin
        LogMessage('function TAddison_2.FibuExport ' + E.Message);
        aError := true;
      end;
    end;
  end;

end;

function TAddison_2.BetragGleich(aBerag1, aBetrag2: double): boolean;
begin
  Result := SameValue(aBerag1, aBetrag2, 0.05);
end;


function TAddison_2.GetDebitorSaldo(aDebitorNummer: integer): double;
var
  FibuKonto: RWFibuKonto;
begin

  Result := 0;

  if Wirtschaftsjahr.IsDebitor[IntToStr(aDebitorNummer)] <> 0 then
  begin
    FibuKonto := Wirtschaftsjahr.m_Debitorkonten.SearchFibuKonto[IntToStr(aDebitorNummer)];
    if FibuKonto <> nil then
    begin
      Result := FibuKonto.m_Saldo[12];
      FibuKonto := nil;
    end;
  end;

end;

function TAddison_2.getName: string;
begin
  Result := 'Addison';
end;

procedure TAddison_2.ImportSalden;
var
  ReadQuery: TIBQuery;
  WriteQuery: TIBQuery;
  saldo: double;
begin

  LogMessage('TobFib: Salden lesen');

  if not connect then
  begin
    LogMessage('Keine Verbindung zur Datenbank');
    exit;
  end;

  if Wirtschaftsjahr = nil then
  begin
    LogMessage('Konnte Wirtschaftsjahr nicht finden');
    exit;
  end;

  ReadQuery := TIBQuery.Create(self);
  ReadQuery.Transaction := Transaction;

  WriteQuery := TIBQuery.Create(self);
  WriteQuery.Transaction := Transaction;

  OpenTransaction;

  ReadQuery.SQL.Clear;
  ReadQuery.SQL.Add('SELECT KU_MATCH, KU_ID, KU_DEBITOR FROM KUNDEN ' +
    'WHERE (KU_DEBITOR != 0) and (KU_DEBITOR IS NOT NULL) and (KU_DELETE != "T")');

  WriteQuery.SQL.Clear;
  WriteQuery.SQL.Add('UPDATE KUNDEN SET KU_SALDO = :Saldo WHERE KU_ID = :ID');

  ReadQuery.Open;

  while not ReadQuery.Eof do
  begin

    WriteQuery.ParamByName('ID').AsInteger := ReadQuery.FieldByName('KU_ID').AsInteger;

    saldo := GetDebitorSaldo(ReadQuery.FieldByName('KU_DEBITOR').AsInteger);
    WriteQuery.ParamByName('Saldo').AsFloat := saldo;

    WriteQuery.ExecSQL;

    LogMessage(ReadQuery.FieldByName('KU_MATCH').AsString + ': ' + formatfloat('0.00',saldo));

    ReadQuery.Next;
  end;

  ReadQuery.close;

  ReadQuery.Free;

  CommitTransaction;

  LogMessage('TobFib: Salden lesen abgeschlossen');

  disconnect;

end;

procedure TAddison_2.ImportZahlungen;
begin
  // Zahlungen können momentan nicht aus der Schnittstelle gelesen werden.

end;

procedure TAddison_2.KeineOPSGesehen;
begin
  SetLength(OPSGesehen, 0);
end;

procedure TAddison_2.NeuerOP(OP: RwOP; OpNummerSchreiben: boolean);
var
  WriteQuery: TIBQuery;
  KUQuery: TIBQuery;
begin

  WriteQuery := TIBQuery.Create(self);
  WriteQuery.Transaction := self.Transaction;

  KUQuery := TIBQuery.Create(self);
  KUQuery.Transaction := self.Transaction;

  KUQuery.SQL.Text := 'SELECT KU_NR, KU_DEBITOR, KU_MATCH, KU_ID ' +
                      'FROM KUNDEN ' +
                      'WHERE KU_DEBITOR = :Debitor  and ku_delete != "T"';

  WriteQuery.SQL.Text := 'INSERT INTO MAHNLAUF ( ' +
    'ML_ID, ML_KUNR, ML_OPNR, ML_DEBITOR, ML_MATCH, ML_MAHNLAUF, ' +
    'ML_REDATUM, ML_MAHNBETRAG, ML_ZTAGENETTO, ' +
    'ML_ZTAGESKONTO, ML_ZSKONTO, ML_LETZTEMDATUM, ' +
    'ML_FAELLIGDATUM, ML_RENUMMER, ML_ERSTEMDATUM, ' +
    'ML_GELEISTET, ML_KU_ID, ML_INKASSOUEBERGABE, ML_FORDERUNGOK '
    + ') VALUES ( ' +
    'GEN_ID(MAHNLAUF_ID, 1), :Kundennr, :OPNr, :Debitornr, :Match, 0, ' +
    ':Redatum, :Betrag, :TageNetto, :TageSkonto, :Skonto, :LetzteMDatum, ' +
    ':Faelligdatum, :Beleg, :Erstemdatum, ' +
    ':Geleistet, :KuId, ' +
    '"F", "F" )';

  if (StrToInt(OP.m_Konto) < 70000) then
  begin

    KUQuery.ParamByName('Debitor').AsInteger := StrToInt(trim(OP.m_Konto));
    KUQuery.Open;

    if (KUQuery.FieldByName('KU_NR').AsInteger <> 0) then
    begin

      LogMessage('ML: Neuer Datensatz: ' + OP.m_BelegNr + ' | ' + OP.m_BelegNr2);

      WriteQuery.ParamByName('Kundennr').AsInteger := KUQuery.FieldByName('KU_NR').AsInteger;
      if OpNummerSchreiben then
        WriteQuery.ParamByName('OpNr').AsInteger := StrToInt(trim(OP.m_BelegNr2))
      else
        WriteQuery.ParamByName('OpNr').AsInteger := 0;
      WriteQuery.ParamByName('Debitornr').AsInteger := KUQuery.FieldByName('KU_DEBITOR').AsInteger;
      WriteQuery.ParamByName('Match').AsString      := KUQuery.FieldByName('KU_MATCH').AsString;
      WriteQuery.ParamByName('KuId').AsInteger      := KUQuery.FieldByName('Ku_Id').AsInteger;
      WriteQuery.ParamByName('ReDatum').AsDateTime  := OP.m_BelegDatum;
      WriteQuery.ParamByName('Betrag').AsFloat      := OP.m_Betrag;
      WriteQuery.ParamByName('TageNetto').AsInteger := Trunc(OP.m_BelegDatum - OP.m_NettoFaelligkeit);
      WriteQuery.ParamByName('TageSkonto').AsInteger:= Trunc(OP.m_BelegDatum - OP.m_SkontoFaelligkeitStufe[0]);
      WriteQuery.ParamByName('Skonto').AsFloat      := OP.m_SkontoProzentSatzStufe[0];
      WriteQuery.ParamByName('LetzteMDatum').AsDateTime := OP.m_BelegDatum;
      WriteQuery.ParamByName('Faelligdatum').AsDateTime := OP.m_NettoFaelligkeit;
      WriteQuery.ParamByName('Beleg').AsString := OP.m_BelegNr;
      WriteQuery.ParamByName('ErsteMDatum').AsDateTime := OP.m_BelegDatum;
      WriteQuery.ParamByName('Geleistet').AsFloat := 0;

      WriteQuery.ExecSQL;

    end;

    KUQuery.close;

  end;

  FreeAndNil(KUQuery);
  FreeAndNil(WriteQuery);

end;

function TAddison_2.OPGesehen(aMLID: integer): boolean;
var
  x: integer;
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

procedure TAddison_2.OPListenAbgleich;
var
  OPSuche: RwOPSuche;
  OP: RwOP;

  Pos: integer;

  ReadQuery: TIBQuery;

  x: integer;

  OpSchreiben: boolean;

  OPNummerOk: boolean;

begin

  LogMessage('TobFib: OP-Listen-Abgleich');

  if not connect then
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
  ReadQuery.Transaction := Transaction;

  OpenTransaction;

  ReadQuery.SQL.Clear;
  ReadQuery.SQL.Add('SELECT ML_ID, ML_OPNR, ML_DEBITOR, ' +
    'ML_RENUMMER, ML_REDATUM, ML_MAHNBETRAG ' + 'FROM MAHNLAUF ' +
    'ORDER BY ML_DEBITOR ');

  ReadQuery.Open;

  Pos := 0;

  KeineOPSGesehen;

  OPSuche := Wirtschaftsjahr.CreateOPSuche;
  OPSuche.SearchBelegNr('*', '*');

  if OPSuche.Count = 0 then
    SysUtils.beep;

  OP := OPSuche.GetAt[Pos];
  while OP <> nil do
  begin

    OpSchreiben := true;

    OPNummerOk := (trim(OP.m_BelegNr2) <> '');

    try
      if OPNummerOk then
        OPNummerOk := (StrToInt(trim(OP.m_BelegNr2)) <> 0);
    except
      OPNummerOk := false;
    end;

    if OPNummerOk then
    begin

      if ReadQuery.Locate('ML_OPNR', trim(OP.m_BelegNr2), []) then
      begin
        // OP Vorhanden!
        OPGesehen(ReadQuery.FieldByName('ML_ID').AsInteger);
        OpSchreiben := false;
      end;

    end
    else
    begin

      // 1. - Debitor vergleichen
      // 2. - Beträge vergleichen
      // 3. - Nachschauen ob ein ML-Eintrag schon mit
      // anderem OP verglichen wurde
      // 4. - wenn ein Unterschied, dann ist der OP noch nicht
      // in die ML-Tabelle aufgenommen

      if ReadQuery.Locate('ML_DEBITOR', trim(OP.m_Konto), []) then
      begin

        // Debitor gefunden, jetzt nach richtigem OP suchen!
        while (not ReadQuery.Eof) and
          (ReadQuery.FieldByName('ML_DEBITOR').AsString = OP.m_Konto) do
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
              OpSchreiben := false;
              break;

            end;
          end;
          ReadQuery.Next;
        end;

      end;
    end;

    if OpSchreiben then
      NeuerOP(OP, OPNummerOk);

    if (Pos > 0) and ((Pos mod 20) = 0) then
      LogMessage('ML: ' + IntToStr(Pos) + ' Datensätze kontrolliert');

    OP := nil;
    inc(Pos);
    OP := OPSuche.GetAt[Pos];

  end;

  ReadQuery.First;

  while not ReadQuery.Eof do
  begin

    OpSchreiben := false;

    if (ReadQuery.FieldByName('ML_OPNR').AsString <> '') and
      (ReadQuery.FieldByName('ML_OPNR').AsInteger <> 0) then
    begin

      OP := nil;

      // wir haben einen OP-Schlüssel, also suchen wir den Schlüssel
      OPSuche.SearchBelegNr2(ReadQuery.FieldByName('ML_DEBITOR').AsString,
                             IntToStr(ReadQuery.FieldByName('ML_OPNR').AsInteger));
      OP := OPSuche.GetAt[0];

      if OP = nil then
        OpSchreiben := true;

    end
    else
    begin

      // OP ohne OPNummer suchen, diese Methode sollte möglichst präzise sein!!!

      if ReadQuery.FieldByName('ML_RENUMMER').AsString <> '' then
      begin
        OPSuche.SearchBelegNr(ReadQuery.FieldByName('ML_DEBITOR').AsString,
                              ReadQuery.FieldByName('ML_RENUMMER').AsString)
      end
      else
      begin
        OPSuche.SearchBelegNr(ReadQuery.FieldByName('ML_DEBITOR').AsString, '*');
      end;

      OpSchreiben := true;

      for x := 0 to OPSuche.Count - 1 do
      begin
        OP := OPSuche.GetAt[x];

        // Vergleichen der kriterien, die übrig sind
        // ACHTUNG! Wertdifferenzen zwischen GS-Fibu und Addison kippen
        // offene, agemahnte OPs in der ML-Tabelle, daher großzügiges
        // Delta bei Betragsvergleich!
        if SameValue(ReadQuery.FieldByName('ML_MAHNBETRAG').AsFloat, OP.m_Betrag, 1) then
        begin
          OpSchreiben := false;
          break;
        end;
      end;
    end;

    if OpSchreiben then
      OPLoeschen(ReadQuery.FieldByName('ML_ID').AsInteger);

    if (ReadQuery.RecNo > 0) and ((ReadQuery.RecNo mod 20) = 0) then
      LogMessage('ML: ' + IntToStr(ReadQuery.RecNo) + ' Datensätze kontrolliert');

    ReadQuery.Next;

    OP := nil;
  end;

  CommitTransaction;

  FreeAndNil(ReadQuery);

  LogMessage('TobFib: OP-Listen-Abgleich abgeschlossen.');

  disconnect;

end;

procedure TAddison_2.OPLoeschen(ID: integer);
var
  WriteQuery: TIBQuery;
begin

  WriteQuery := TIBQuery.Create(self);
  WriteQuery.Transaction := self.Transaction;

  WriteQuery.SQL.Text := 'DELETE FROM MAHNLAUF WHERE ML_ID = :ID';

  WriteQuery.ParamByName('ID').AsInteger := ID;
  WriteQuery.ExecSQL;
  LogMessage('ML: Datensatz ' + IntToStr(ID) + ' gelöscht.');

end;

procedure TAddison_2.BeforeExport(aCSVFilename: string);
var
  List: TStringList;
  BackupFilename: string;
  FileName: string;
  BackupDir: string;
begin
//  if not FileExists(aCSVFilename) then
  if Tnf.GetInstance.System.FileExist(aCSVFilename) < 0 then
    exit;
  List := TStringList.Create;
  try
    try
      List.LoadFromFile(aCSVFilename);
    except
      exit;
    end;
    BackupDir := Stammdaten.ServerEinstellungen.ReadString('AddisonExportBackup', '');
    if Trim(BackupDir) = '' then
      BackupDir := ExtractFilePath(aCSVFilename);
    BackupDir := IncludeTrailingPathDelimiter(BackupDir);

    if not DirectoryExists(BackupDir) then
      ForceDirectories(BackupDir);

    FileName := ExtractFileName(aCSVFilename);
    FileName := StringReplace(FileName, ExtractFileExt(FileName), '', []);

    BackupFilename := BackupDir + FileName + '_backup.' + FormatDatetime('yymmddhhnn', now) + '.bak';

    //BackupFilename := IncludeTrailingBackslash(ExtractFilePath(aCSVFilename)) +
    //  FileName + '_backup.' + FormatDatetime('yymmddhhnn', now) + '.bak';
    try
      List.SaveToFile(BackupFilename);
    except
      on E:Exception do
      begin
        LogMessage('Backup "' + BackupFilename + '" konnte nicht geschrieben werden.' + E.Message);
      end;
    end;

    TBackupFileManager.getInstance().addDirectory(ExtractFilePath(aCSVFilename));
  finally
    FreeAndNil(List);
  end;
end;

procedure TAddison_2.DanachExport(aCSVFilename: string);
var
  List: TStringList;
  BackupFilename: string;
  FileName: string;
  BackupDir: string;
begin
  if Tnf.GetInstance.System.FileExist(aCSVFilename) < 0 then
    exit;
  List := TStringList.Create;
  try
    try
      List.LoadFromFile(aCSVFilename);
    except
      exit;
    end;
    BackupDir := Stammdaten.ServerEinstellungen.ReadString('AddisonExportBackup', '');
    if Trim(BackupDir) = '' then
      BackupDir := ExtractFilePath(aCSVFilename);
    BackupDir := IncludeTrailingPathDelimiter(BackupDir);

    if not DirectoryExists(BackupDir) then
      ForceDirectories(BackupDir);

    FileName := ExtractFileName(aCSVFilename);
    FileName := StringReplace(FileName, ExtractFileExt(FileName), '', []);

    BackupFilename := BackupDir + FileName + '_backup.' + FormatDatetime('yymmddhhnn', now) + '_danach.bak';
    try
      List.SaveToFile(BackupFilename);
    except
      on E:Exception do
      begin
        LogMessage('Backup "' + BackupFilename + '" konnte nicht geschrieben werden.' + E.Message);
      end;
    end;

    TBackupFileManager.getInstance().addDirectory(ExtractFilePath(aCSVFilename));
  finally
    FreeAndNil(List);
  end;

end;


function TAddison_2.DebitorExport(aQuery: TIBQuery; aFileName: string): DataArray;
var
  ZahlArten: TIBQuery;
  i: integer;
  ZSHelper: TZSHelper;
  ZS: TZahlungsschluessel;
  Firmenname, Vorname, Nachname : string;
  WaehrSchlus : integer;
begin
  try
    LogMessage('TobFib-Export: Debitoren');

    ZahlArten := TIBQuery.Create(self);
    ZahlArten.Transaction := self.Transaction;
    ZahlArten.SQL.Text := 'SELECT * FROM ZAHLART';

    ZSHelper := TZSHelper.Create(self, Stammdaten, Transaction);

    OpenTransaction;

    ZahlArten.Open;

    i := 0;
    SetLength(Result, 0);

    if aQuery.Eof then
      exit;

    _CSV.DeleteAllLastDelimiterOnEndLine := true;
    _CSV.Clear;
    SetKundenShema(_CSV);

    while not aQuery.Eof do
    begin
      LogMessage('TobFib-Export: Debitor "' + aQuery.FieldByName('KU_MATCH').AsString + '"');
      LogMessage('Zahlungsschlüssel suchen oder neu anlegen...');
      if SatzSperren(lKunden, aQuery.FieldByName('KU_ID').AsInteger, aQuery.FieldByName('KU_NR').AsString, 'Addison Kundenexport') <= 0 then
      begin
        aQuery.Next;
        continue;
      end;

      ZS := ZSHelper.getZS(self, aQuery.FieldByName('KU_ZNETTOTAGE').AsInteger,
        aQuery.FieldByName('KU_ZSKONTOTAGE').AsInteger,
        aQuery.FieldByName('KU_ZSKONTO').AsFloat);

      LogMessage('Zahlungsschlüssel gelesen...');

      Firmenname := '';
      Vorname    := '';
      Nachname   := '';

      if aQuery.FieldByName('KU_FIRMA').AsString <> '' then
      begin
        Firmenname := aQuery.FieldByName('KU_FIRMA').AsString;
      end
      else
      begin
//        Vorname    := aQuery.FieldByName('KU_VNAME').AsString;
//        Nachname   := aQuery.FieldByName('KU_NAME').AsString;
        Firmenname := aQuery.FieldByName('KU_NAME').AsString + ', ' +
                      aQuery.FieldByName('KU_VNAME').AsString;
      end;

      if Firmenname = '' then
        Firmenname := aQuery.FieldByName('KU_MATCH').AsString;


      _CSV.OpenLine;

      _CSV.AddLine('BEZ2', aQuery.FieldByName('KU_VNAME').AsString);
      _CSV.AddLine('BEZEICHNUNG', Firmenname);
      _CSV.AddLine('KURZBEZ', Firmenname);

      _CSV.AddLine('BRIEFANREDE', aQuery.FieldByName('KU_BRIEFANREDE').AsString);
      _CSV.AddLine('BEZ3', aQuery.FieldByName('KU_ZUSATZ').AsString);
      _CSV.AddLine('SATZART', 'K');
      _CSV.AddLine('KONTO', aQuery.FieldByName('KU_DEBITOR').AsString);
      _CSV.AddLine('STRASSE', trim(aQuery.FieldByName('KU_STRASSE').AsString +
        ' ' + aQuery.FieldByName('KU_HAUSNUMMER').AsString));
      _CSV.AddLine('LAND', aQuery.FieldByName('KU_LAND').AsString);
      _CSV.AddLine('PLZ', aQuery.FieldByName('KU_PLZ').AsString);
      _CSV.AddLine('ORT', aQuery.FieldByName('KU_ORT').AsString);
      _CSV.AddLine('TELEFON1', aQuery.FieldByName('KU_TEL').AsString);
      _CSV.AddLine('EMAIL', aQuery.FieldByName('KU_MAIL').AsString);
      _CSV.AddLine('TELEFAX', aQuery.FieldByName('KU_FAX').AsString);
      _CSV.AddLine('USTID', aQuery.FieldByName('KU_USTID').AsString);
      try
        if ZahlArten.Locate('ZA_ID',  aQuery.FieldByName('KU_ZAHLART').AsInteger, []) and
          (ZahlArten.FieldByName('ZA_BANKV').AsString = 'T') then
          _CSV.AddLine('ZAHLUNGSART', 'A')
        else
          _CSV.AddLine('ZAHLUNGSART', 'N');
      except
        on E: Exception do
        begin
          if not Transaction.InTransaction then
            LogMessage('Geschlossene Transaction (Zahlart.locate -KundenExport )');
          LogMessage('Zahlart.locate -KundenExport' + E.Message);
          raise;
        end;
      end;

      _CSV.AddLine('BLZ1', aQuery.FieldByName('BK_BLZ').AsString);
      _CSV.AddLine('BANKKONTO1', aQuery.FieldByName('BK_KONTONR').AsString);
      _CSV.AddLine('BANKNAME1', aQuery.FieldByName('BK_BANK').AsString);
      _CSV.AddLine('IBAN1', aQuery.FieldByName('BK_IBAN').AsString);
      _CSV.AddLine('SWIFT1', aQuery.FieldByName('BK_BIC').AsString);

      _CSV.AddLine('KEDITLIMIT', aQuery.FieldByName('KU_KREDITLIMIT').AsFloat);
      _CSV.AddLine('KUNDENNUMMER', aQuery.FieldByName('KU_NR').AsString);
      _CSV.AddLine('ANREDE', aQuery.FieldByName('KU_ANREDE').AsString);

      _CSV.AddLine('VERDICHTKONTO', aQuery.FieldByName('UT_KONTONR').AsString);
      _CSV.AddLine('ZAHLSL', ZS.getID);

      WaehrSchlus := aQuery.FieldByName('WG_FIBU_SCHLUESSEL').AsInteger;
      if WaehrSchlus < 1 then
        WaehrSchlus := getEuroWaehrungSchluessel(Self.Transaction);

      _CSV.AddLine('WID_KONTO', WaehrSchlus);

      if aQuery.FieldByName('KU_EUAUSLAND').AsString = 'T' then
      begin
        _CSV.AddLine('SORTSL1', '2');
        _CSV.AddLine('SORTSL1BEZ', 'EU-AUSLAND');
      end
      else if aQuery.FieldByName('KU_AUSLAND').AsString = 'T' then
      begin
        _CSV.AddLine('SORTSL1', '3');
        _CSV.AddLine('SORTSL1BEZ', 'DRITTLAND');
      end
      else
      begin
        _CSV.AddLine('SORTSL1', '1');
        _CSV.AddLine('SORTSL1BEZ', 'INLAND');
      end;

      FreeAndNil(ZS);

      SetLength(Result, i + 1);
      Result[i] := aQuery.FieldByName('KU_ID').AsInteger;

      inc(i);
      _CSV.CloseLine;
      aQuery.Next;

    end;
    try
      _CSV.SaveToFile(aFileName);
    except
      on E:Exception do
      begin
        LogMessage('Fehler: TAddison_2.DebitorExport Datei"' + aFileName + '" konnte nicht geschrieben werden.' + E.Message);
        raise;
      end;
    end;
    _CSV.DeleteAllLastDelimiterOnEndLine := false;

    ZahlArten.close;
    ZahlArten.Free;
    ZSHelper.Free;

    CommitTransaction;

    //ZahlungsschluesselAbgleichen(aFileName);
    LogMessage('TobFib-Export (Debitoren) abgeschlossen');

  except
    on E: Exception do
    begin
      ShowMessage(E.Message + #13 +
        'function TAddison_2.DebitorExport(aQuery: TIBQuery) : DataArray;');
      raise;
    end;
  end;

end;

function TAddison_2.KreditorExport(aQuery: TIBQuery; aFilename: string): DataArray;
var
  ZahlArten: TIBQuery;
  i: integer;
  ZSHelper: TZSHelper;
  ZS: TZahlungsschluessel;
  Firmenname: string;
  Vorname: string;
  WaehrSchlus : integer;
begin
  try
    LogMessage('TobFib-Export: Kreditoren');

    ZahlArten := TIBQuery.Create(self);
    ZahlArten.Transaction := self.Transaction;
    ZahlArten.SQL.Text := 'SELECT * FROM ZAHLART';

    ZSHelper := TZSHelper.Create(self, Stammdaten, Transaction);

    OpenTransaction;

    ZahlArten.Open;

    i := 0;
    SetLength(Result, 0);

    if aQuery.Eof then
      exit;

    {
    CSVFilename := Stammdaten.ServerEinstellungen.ReadString('AddisonExportDir',
      '') + '\topfib.csv';
    }

    //BeforeExport(aFilename);

    _CSV.DeleteAllLastDelimiterOnEndLine := true;
    _CSV.Clear;
    SetKundenShema(_CSV);
    {
    if FileExists(aFilename) then
    begin
      try
        _CSV.LoadFromFile(aFilename);
      except
        LogMessage('TobFib-Export: Topfib');
      end;
    end;
    }
    while not aQuery.Eof do
    begin
      LogMessage('TobFib-Export: Kreditor "' + aQuery.FieldByName('LT_MATCH').AsString + '"');
      LogMessage('Zahlungsschlüssel suchen oder neu anlegen...');

      if SatzSperren(lLieferanten, aQuery.FieldByName('LT_ID').AsInteger, aQuery.FieldByName('LT_NR').AsString, 'Addison Lieferantenexport') <= 0 then
      begin
        aQuery.Next;
        continue;
      end;

      ZS := ZSHelper.getZS(self, aQuery.FieldByName('LT_ZNETTOTAGE').AsInteger,
        aQuery.FieldByName('LT_ZSKONTOTAGE').AsInteger,
        aQuery.FieldByName('LT_ZSKONTO').AsFloat);

      LogMessage('Zahlungsschlüssel gelesen...');

      Firmenname := '';
      Vorname    := '';
 //     Nachname   := '';

      if aQuery.FieldByName('LT_FIRMA').AsString <> '' then
      begin
        Firmenname := aQuery.FieldByName('LT_FIRMA').AsString;
      end
      else
      begin
//        Vorname    := aQuery.FieldByName('LT_VNAME').AsString;
//        Nachname   := aQuery.FieldByName('LT_NAME').AsString;
        Firmenname := aQuery.FieldByName('LT_NAME').AsString + ', ' +
                      aQuery.FieldByName('LT_VNAME').AsString;
      end;

      if Firmenname = '' then
        Firmenname := aQuery.FieldByName('LT_MATCH').AsString;

      _CSV.OpenLine;

      _CSV.AddLine('SATZART', 'K');
      _CSV.AddLine('KONTO', aQuery.FieldByName('LT_KREDITOR').AsString);

      _CSV.AddLine('BEZ2', aQuery.FieldByName('LT_VNAME').AsString);
      _CSV.AddLine('BEZEICHNUNG', Firmenname);
      _CSV.AddLine('KURZBEZ', Firmenname);

      _CSV.AddLine('BRIEFANREDE', aQuery.FieldByName('LT_BRIEFANREDE').AsString);
      _CSV.AddLine('BEZ3', aQuery.FieldByName('LT_ZUSATZ').AsString);
      _CSV.AddLine('STRASSE', trim(aQuery.FieldByName('LT_STRASSE').AsString +
                             ' ' + aQuery.FieldByName('LT_HAUSNUMMER').AsString));
      _CSV.AddLine('LAND', aQuery.FieldByName('LT_LAND').AsString);
      _CSV.AddLine('PLZ', aQuery.FieldByName('LT_PLZ').AsString);
      _CSV.AddLine('ORT', aQuery.FieldByName('LT_ORT').AsString);
      _CSV.AddLine('TELEFON1', aQuery.FieldByName('LT_TEL').AsString);
      _CSV.AddLine('EMAIL', aQuery.FieldByName('LT_MAIL').AsString);
      _CSV.AddLine('TELEFAX', aQuery.FieldByName('LT_FAX').AsString);
      _CSV.AddLine('USTID', aQuery.FieldByName('LT_USTID').AsString);

      try
        if ZahlArten.Locate('ZA_ID',  aQuery.FieldByName('LT_ZAHLART').AsInteger, []) and
          (ZahlArten.FieldByName('ZA_BANKV').AsString = 'T') then
          _CSV.AddLine('ZAHLUNGSART', 'A')
        else
          _CSV.AddLine('ZAHLUNGSART', 'N');
      except
        on E: Exception do
        begin
          if not Transaction.InTransaction then
            LogMessage('Geschlossene Transaction (Zahlart.locate -KreditorenExport )');
          LogMessage('Zahlart.locate -KreditorenExport' + E.Message);
          raise;
        end;
      end;

      _CSV.AddLine('BLZ1', aQuery.FieldByName('BK_BLZ').AsString);
      _CSV.AddLine('BANKKONTO1', aQuery.FieldByName('BK_KONTONR').AsString);
      _CSV.AddLine('BANKNAME1', aQuery.FieldByName('BK_BANK').AsString);
      _CSV.AddLine('IBAN1', aQuery.FieldByName('BK_IBAN').AsString);
      _CSV.AddLine('SWIFT1', aQuery.FieldByName('BK_BIC').AsString);

      _CSV.AddLine('KEDITLIMIT', '0');
      _CSV.AddLine('KUNDENNUMMER', aQuery.FieldByName('LT_NR').AsString);
      _CSV.AddLine('ANREDE', aQuery.FieldByName('LT_ANREDE').AsString);
      _CSV.AddLine('VERDICHTKONTO', aQuery.FieldByName('UT_KONTONR').AsString);
      _CSV.AddLine('ZAHLSL', ZS.getID);

      WaehrSchlus := aQuery.FieldByName('WG_FIBU_SCHLUESSEL').AsInteger;
      if WaehrSchlus < 1 then
        WaehrSchlus := getEuroWaehrungSchluessel(Self.Transaction);
      _CSV.AddLine('WID_KONTO', WaehrSchlus);
      
      if aQuery.FieldByName('LT_EUAUSLAND').AsString = 'T' then
      begin
        _CSV.AddLine('SORTSL1', '2');
        _CSV.AddLine('SORTSL1BEZ', 'EU-AUSLAND');
      end
      else if aQuery.FieldByName('LT_AUSLAND').AsString = 'T' then
      begin
        _CSV.AddLine('SORTSL1', '3');
        _CSV.AddLine('SORTSL1BEZ', 'DRITTLAND');
      end
      else
      begin
        _CSV.AddLine('SORTSL1', '1');
        _CSV.AddLine('SORTSL1BEZ', 'INLAND');
      end;

      _CSV.CloseLine;

      FreeAndNil(ZS);

      SetLength(Result, i + 1);
      Result[i] := aQuery.FieldByName('LT_ID').AsInteger;

      inc(i);

      aQuery.Next;

    end;
//    _CSV.Rotate;
    try
      _CSV.SaveToFile(aFilename);
    except
      on E:Exception do
      begin
        LogMessage('Fehler: TAddison_2.KreditorExport Datei "' + aFilename + '" konnte nicht geschrieben werden.' + E.Message);
        raise;
      end;
    end;
    _CSV.DeleteAllLastDelimiterOnEndLine := false;

    ZahlArten.close;
    ZahlArten.Free;
    ZSHelper.Free;

    CommitTransaction;

    //ZahlungsschluesselAbgleichen(aFileName);

    LogMessage('TobFib-Export (Kreditoren) abgeschlossen');

  except
    on E: Exception do
    begin
      ShowMessage(E.Message + #13 +
        'function TAddison_2.KreditorExport(aQuery: TIBQuery) : DataArray;');
      raise;
    end;
  end;

end;

//function TAddison_2.PostenExport(aQuery: TIBQuery; aFilename: string): DataArray;
function TAddison_2.PostenExport(aQuery: TIBQuery;  aQueryEB: TIBQuery; aFilename: string;
                                 var aDataArray : DataArray): DataArray;
var
  ZahlArten: TIBQuery;
  ZSHelper: TZSHelper;
begin

  try
    LogMessage('TobFib-Export: Posten');

    ZahlArten := TIBQuery.Create(self);
    ZahlArten.Transaction := self.Transaction;
    ZahlArten.SQL.Text := 'SELECT * FROM ZAHLART';

    ZSHelper := TZSHelper.Create(self, Stammdaten, Transaction);
    OpenTransaction;
    try
      ZahlArten.Open;

      SetLength(Result, 0);

      if aQuery.Eof and aQueryEB.Eof then
        exit;

      _CSV.DeleteAllLastDelimiterOnEndLine := true;
      _CSV.Clear;

      SetBuchenShema(_CSV);

      result := PostenExportVO(aQuery, aFilename, ZSHelper, ZahlArten);
      if aQueryEB.RecordCount > 0 then
         PostenExportEB(aQueryEB, aFilename, aDataArray, ZSHelper, ZahlArten);

    finally
      ZahlArten.close;
      ZahlArten.Free;
      ZSHelper.Free;

      CommitTransaction;
    end;

    LogMessage('TobFib-Export (Posten) abgeschlossen.');

  except
    on E: Exception do
    begin
      LogMessage(E.Message + #13 + 'function TAddison_2.PostenExport(aQuery: TIBQuery) : DataArray;');
      raise;
    end;
  end;


end;

procedure TAddison_2.PostenExportEB(aQuery: TIBQuery;aFilename: string;var aDataArray: DataArray; aZSHelper : TZSHelper;
                                    aZahlArten: TIBQuery);
var
  Eingangsbeleg: TEingangsbeleg;
  i,j : integer;
  ZS: TZahlungsschluessel;
  OpNr: string;
  WaehrSchlus : integer;
  EBID : integer;
  EBnummer : string;
  Nettotage : integer;
  SachKonto : TErloeskonto;
  AufteilungListe : TEingangsbeleg_AufteilungListe;
  Aufteilung : TEingangsbeleg_Aufteilung;
  sachkontoistnul : boolean;
  Personkonto : integer;
  TempAuftID : integer;
  TempKontoid : integer;
begin
  i := 0;

  try
    while not aQuery.Eof do
    begin
      Personkonto := 0;
      EBID := aQuery.FieldByName('EB_ID').AsInteger;
      EBnummer := aQuery.FieldByName('EB_BELEGNUMMER').AsString;

      Eingangsbeleg := TEingangsbeleg.Create(self, EBID, Stammdaten, Transaction);
      LogMessage(Eingangsbeleg.Belegnummer);

      if SatzSperren(lEingangsbeleg, EBID, EBnummer, 'Addison Fibuexport') <= 0 then
      begin
        FreeAndNil(Eingangsbeleg);
        aQuery.Next;
        continue;
      end;

      AufteilungListe := TEingangsbeleg_AufteilungListe.loadNachEBID(self, EBID, Transaction);
      try
        if (AufteilungListe = nil) or (AufteilungListe.Count <= 0) then
        begin
          LogMessage('Aufteilungsliste ist leer. Der Eingangsbeleg wurde nicht exportiert.');

          FreeAndNil(AufteilungListe);
          FreeAndNil(Eingangsbeleg);
          aQuery.Next;
          continue;
        end;
         //prüfen ob Aufteilungskonto kann ermitelt werden
        sachkontoistnul := false;
        TempAuftID := 0;
        for j := 0 to AufteilungListe.Count -1 do
        begin
          Aufteilung := TEingangsbeleg_Aufteilung(AufteilungListe[j]);
          TempKontoid := Aufteilung.Basissachkonto;
          if TempKontoid <= 0 then
          begin
            TempKontoid := Einstellung.StdkontoFuerEingangsbelege.AsInteger;
            if TempKontoid <= 0 then
            begin
              TempAuftID := Aufteilung.getID;
              sachkontoistnul := true;
              break;
            end;
          end;
        end;

        if sachkontoistnul then
        begin
          LogMessage('Eingangsbeleg: ' + Eingangsbeleg.Belegnummer + #13#10 +
                     'AufteilungID: ('+ IntToStr(TempAuftID) + ').' + #13#10 +
                     'Das Basissachkonto und das Standardkonto konnte nicht ermittelt werden. '+ #13#10 +
                     'Der Eingangsbeleg wurde nicht exportiert.' );

          FreeAndNil(AufteilungListe);
          FreeAndNil(Eingangsbeleg);
          aQuery.Next;
          continue;
        end;

        //Kann das Konto erzeugt werden?
        for j := 0 to AufteilungListe.Count -1 do
        begin
          Aufteilung := TEingangsbeleg_Aufteilung(AufteilungListe[j]);
          TempKontoid := Aufteilung.Basissachkonto;
          if TempKontoid > 0 then
          begin
            SachKonto := TKontoDictionary.getInstance.getKonto(TempKontoid);
            if SachKonto = nil then
            begin
              LogMessage('Eingangsbeleg: ' + Eingangsbeleg.Belegnummer + #13#10 +
                         'Aufteilung: ('+ IntToStr(Aufteilung.getID) + ').' + #13#10 +
                         'Das Basissachkonto konnte nicht erzeugt werden. Überspringen.' );
              continue;
            end;
          end
          else
          begin
            TempKontoid := Einstellung.StdkontoFuerEingangsbelege.AsInteger;
            SachKonto := TKontoDictionary.getInstance.getKonto(TempKontoid);
            if SachKonto = nil then
            begin
              LogMessage('Eingangsbeleg: ' + Eingangsbeleg.Belegnummer + #13#10 +
                         'Aufteilung: ('+ IntToStr(Aufteilung.getID) + ').' + #13#10 +
                         'Das StandardKonto konnte nicht erzeugt werden. Überspringen.' );
              continue;
            end;
          end;

        end;

////////////////////////////////////////////////////////////////////////////////////////////
//Eingangsbeleg buchen
// Konto ->  LT-Personenkonto oder Reisendeperson-Konto
// Gegenkonto  -> 0
        if Eingangsbeleg.Lieferant <> nil then
          Personkonto := Eingangsbeleg.Lieferant.getPersonenkonto;

        if Personkonto <= 0 then
        begin
          if (Eingangsbeleg.Reisekosten <> nil) and
             (Eingangsbeleg.Reisekosten.Person <> nil) and
             (Eingangsbeleg.Reisekosten.Person.Konto > 0) then
               Personkonto := Eingangsbeleg.Reisekosten.Person.Konto;
        end;

        if Personkonto <= 0 then
        begin
          LogMessage('Es konnte kein Personenkonto ermittelt werden. Der Eingangsbeleg wurde nicht exportiert.');

          FreeAndNil(AufteilungListe);
          FreeAndNil(Eingangsbeleg);
          aQuery.Next;
          continue;
        end;

        Nettotage := Ceil(Eingangsbeleg.Zieldatum - Eingangsbeleg.Eingangsdatum);
        if Nettotage < 0 then
          Nettotage := 0;

        ZS := aZSHelper.getZS(self, Nettotage, 0, 0);
        OpNr := Eingangsbeleg.getLauefndeNrausBelegnummer;

        WaehrSchlus := aQuery.FieldByName('WG_FIBU_SCHLUESSEL').AsInteger;
        if WaehrSchlus < 1 then
          WaehrSchlus := getEuroWaehrungSchluessel(Self.Transaction);

        LogMessage(EBnummer);

/////////////////////////////////////////////////////////////////////////////////////
// Kopf-Datensatz nur schreiben, wenn es sich nicht um eine Reise handelt.

        if (Eingangsbeleg.Reisekosten = nil) then
        begin

          _CSV.OpenLine;
          _CSV.AddLine('SATZART', 'B');
          _CSV.AddLine('KONTO', Personkonto);
          _CSV.AddLine('GEGENKONTO', 0);
          _CSV.AddLine('BUCHUNGSDATUM', Eingangsbeleg.Rechnungsdatum, 'mmyyyy');
          _CSV.AddLine('WID_KONTO', WaehrSchlus);
          _CSV.AddLine('BETRAG', Eingangsbeleg.RechnungsBrutto*(-1));
          _CSV.AddLine('BUCHUNGSTEXT', 'OP: ' + Eingangsbeleg.Belegnummer);
          _CSV.AddLine('BELEGDATUM', Eingangsbeleg.Rechnungsdatum, 'dd.mm.yyyy');
          _CSV.AddLine('VALUTADATUM', Eingangsbeleg.Zieldatum, 'dd.mm.yyyy');
          _CSV.AddLine('NETTODATUM', Eingangsbeleg.Zieldatum,'dd.mm.yyyy');
          _CSV.AddLine('BELEGNR', Eingangsbeleg.Rechnungsnummer);
          _CSV.AddLine('BELEGNR2', OpNr);

          try
            if aZahlArten.Locate('ZA_ID', Eingangsbeleg.EingangsbelegZahlung_id, []) and
               (aZahlArten.FieldByName('ZA_BANKV').AsString = 'T') then
               _CSV.AddLine('ABW_ZAHLUNGSART', 'A')
            else
               _CSV.AddLine('ABW_ZAHLUNGSART', 'N');
          except
          on E: Exception do
          begin
              if not Transaction.InTransaction then
                LogMessage('Geschlossene Transaction (Zahlart.locate)');
                LogMessage('Zahlart.locate' + E.Message);
                raise;
              end;
          end;

          _CSV.AddLine('BUCHSTEUERSL', '');
          _CSV.AddLine('ABW_ZAHLSL', ZS.getID);
          _CSV.AddLine('BELEGLINK', 'file://' +Eingangsbeleg.FullFileName);

          _CSV.CloseLine;

        end;

/////////////////////////////////////////////////////////////////////////////////////
//Aufteilungen buchen
// Konto ->  Buchungskonto der Aufteilung
// Gegenkonto  -> LT-Personenkonto oder Reisendeperson-Konto
        SachKonto := nil;

        for j := 0 to AufteilungListe.Count -1 do
        begin
          Aufteilung := TEingangsbeleg_Aufteilung(AufteilungListe[j]);

          if Aufteilung.Basissachkonto > 0 then
             SachKonto := TKontoDictionary.getInstance.getKonto(Aufteilung.Basissachkonto)
          else
          begin
            if Einstellung.StdkontoFuerEingangsbelege.AsInteger > 0 then
               SachKonto := TKontoDictionary.getInstance.getKonto(Einstellung.StdkontoFuerEingangsbelege.AsInteger);
          end;

          if SachKonto = nil then
          begin
            LogMessage('Eingangsbeleg: ' + Eingangsbeleg.Belegnummer + #13#10 +
                       'Aufteilung: ('+ IntToStr(Aufteilung.getID) + ').' + #13#10 +
                       'Das Basissachkonto konnte nicht erzeugt werden. SachkontoID ist 0. Überspringen.' );
            continue;
          end;

          Nettotage := Ceil(Eingangsbeleg.Zieldatum -Eingangsbeleg.Eingangsdatum);
          if Nettotage < 0 then
            Nettotage := 0;

          ZS := aZSHelper.getZS(self, Nettotage, 0, 0);
          OpNr := Eingangsbeleg.getLauefndeNrausBelegnummer;

          WaehrSchlus := aQuery.FieldByName('WG_FIBU_SCHLUESSEL').AsInteger;
          if WaehrSchlus < 1 then
            WaehrSchlus := getEuroWaehrungSchluessel(Self.Transaction);

          LogMessage(EBnummer);
          _CSV.OpenLine;
          _CSV.AddLine('SATZART', 'B');
          _CSV.AddLine('KONTO', SachKonto.getKontoNr);

          if Eingangsbeleg.Lieferant <> nil then
            _CSV.AddLine('GEGENKONTO', Eingangsbeleg.Lieferant.getPersonenkonto)
          else
          if (Eingangsbeleg.Reisekosten <> nil) and (Eingangsbeleg.Reisekosten.Person <> nil) and
             (Eingangsbeleg.Reisekosten.Person.Konto > 0) then
           _CSV.AddLine('GEGENKONTO', Eingangsbeleg.Reisekosten.Person.Konto)
          else
           _CSV.AddLine('GEGENKONTO', 0);

          _CSV.AddLine('BUCHUNGSDATUM', Eingangsbeleg.Rechnungsdatum, 'mmyyyy');
          _CSV.AddLine('WID_KONTO', WaehrSchlus);
          _CSV.AddLine('BETRAG', Aufteilung.Betrag);
          _CSV.AddLine('BUCHUNGSTEXT', 'OP: ' + Eingangsbeleg.Rechnungsnummer + '/'+ Aufteilung.Buchungstext);
          _CSV.AddLine('BELEGDATUM', Eingangsbeleg.Rechnungsdatum, 'dd.mm.yyyy');
          _CSV.AddLine('VALUTADATUM', Eingangsbeleg.Zieldatum, 'dd.mm.yyyy');
          _CSV.AddLine('NETTODATUM', Eingangsbeleg.Zieldatum,'dd.mm.yyyy');
          _CSV.AddLine('BELEGNR', Eingangsbeleg.Rechnungsnummer);
          _CSV.AddLine('BELEGNR2', OpNr);

          try
            if aZahlArten.Locate('ZA_ID', Eingangsbeleg.EingangsbelegZahlung_id, []) and
               (aZahlArten.FieldByName('ZA_BANKV').AsString = 'T') then
              _CSV.AddLine('ABW_ZAHLUNGSART', 'A')
            else
              _CSV.AddLine('ABW_ZAHLUNGSART', 'N');
          except
            on E: Exception do
            begin
              if not Transaction.InTransaction then
                LogMessage('Geschlossene Transaction (Zahlart.locate)');
              LogMessage('Zahlart.locate' + E.Message);
              raise;
            end;
          end;

          if Aufteilung.SSID > 0 then
             _CSV.AddLine('BUCHSTEUERSL', Aufteilung.steuerschluessel)
          else
             _CSV.AddLine('BUCHSTEUERSL', SachKonto.getPDXKennung);

          _CSV.AddLine('ABW_ZAHLSL', ZS.getID);
          _CSV.AddLine('BELEGLINK', 'file://' +Eingangsbeleg.FullFileName);

          _CSV.CloseLine;

          FreeAndNil(ZS);
        end;

        SetLength(aDataArray, i + 1);
        aDataArray[i] := Eingangsbeleg.getID;
        inc(i);

        aQuery.Next;
      finally
         if AufteilungListe <> nil then
            FreeAndNil(AufteilungListe);
         if Eingangsbeleg <> nil then
            FreeAndNil(Eingangsbeleg);
      end;
    end;

    try
      _CSV.SaveToFile(aFilename);
    except
      on E:Exception do
      begin
        LogMessage('Fehler: TAddison_2.PostenExport Datei "' + aFilename + '" konnte nicht geschrieben werden.' + E.Message);
        raise;
      end;
    end;

  finally
    _CSV.DeleteAllLastDelimiterOnEndLine := false;
  end;

end;

function TAddison_2.PostenExportVO(aQuery: TIBQuery; aFilename: string; aZSHelper : TZSHelper;
                                   aZahlArten: TIBQuery): DataArray;
var
  FibuListe: TFibuExportListe;
  Vorgang: TVorgang;
  i, x: integer;
  ZS: TZahlungsschluessel;
  OpNr: integer;
  WaehrSchlus : integer;
begin
    i := 0;
    SetLength(Result, 0);

    FibuListe := TFibuExportListe.Create;
    try
      while not aQuery.Eof do
      begin
        Vorgang := TVorgang.Create(self, aQuery.FieldByName('VO_ID').AsInteger, Stammdaten, Transaction);
        LogMessage(Vorgang.getNummer);

        //prüfen ob es ein gültides Mandat gibt. Sollte eigentlich noch auf die Einstellungen in Stammdaten geguckt werden
        //         "Mandat_verfuegbar_kriterien", aber um sicher zu sein wird immer geprüft,
        //         weil da muss ein gültiges Mandat geben.
        if (Vorgang.getZahlungsart <> nil) and (Vorgang.getZahlungsart.isBankSEPA) and
           (not Vorgang.istMandatGueltig(Vorgang.getDatum)) then
        begin
          ShowMsg(Self, 'Dem Vorgang [' + Vorgang.getNummer +
                 '] ist kein gültiges Mandat zugeordnet. Der Vorgang wird nicht exportiert.', mtWarning, [mbOk], 0);
          Vorgang.Free;
          aQuery.Next;
          continue;
        end;

        //Konten prüfen
        if (not Vorgang.SindAlle_Kontengesetzt) then
        begin
          ShowMsg(Self, 'Dem Vorgang [' + Vorgang.getNummer +
                 '] sind nicht alle Konten zugeordnet. Der Vorgang wird nicht exportiert.', mtWarning, [mbOk], 0);
          Vorgang.Free;
          aQuery.Next;
          continue;
        end;

        if SatzSperren(lVorgang, aQuery.FieldByName('VO_ID').AsInteger, aQuery.FieldByName('VO_NUMMER').AsString, 'Addison Fibuexport') <= 0 then
        begin
          Vorgang.Free;
          aQuery.Next;
          continue;
        end;

        ZS := aZSHelper.getZS(self, Vorgang.getNettoTage, Vorgang.getSkontoTage, Vorgang.getSkonto);
        OpNr := OPNummer;
        FibuListe.Clear;
        Vorgang.FillFibuList(FibuListe);

        WaehrSchlus := aQuery.FieldByName('WG_FIBU_SCHLUESSEL').AsInteger;
        if WaehrSchlus < 1 then
          WaehrSchlus := getEuroWaehrungSchluessel(Self.Transaction);

        // Wenn es KEINE Aufteilungsbuchung ist
        if FibuListe.Count = 1 then
        begin
          LogMessage(Vorgang.getNummer);
          _CSV.OpenLine;
          _CSV.AddLine('SATZART', 'B');
          _CSV.AddLine('KONTO', Vorgang.Empfaenger.getPersonenkonto);
          _CSV.AddLine('GEGENKONTO', TFibuexportItem(FibuListe.Items[0]).getKonto.getKontoNr);
          _CSV.AddLine('BUCHUNGSDATUM', Vorgang.getDatum, 'mmyyyy');
          _CSV.AddLine('WID_KONTO', WaehrSchlus);

          if WaehrSchlus = 1 then
          begin
            if Vorgang.getArt in [cGutschrift, cEingangsrechnung, cStornierung, cPreisdifferenz] then
              _CSV.AddLine('BETRAG', (-1) * TFibuexportItem(FibuListe.Items[0]).getBetragBrutto)
            else
              _CSV.AddLine('BETRAG', TFibuexportItem(FibuListe.Items[0]).getBetragBrutto);
          end
          else
          begin
            if Vorgang.getArt in [cGutschrift, cEingangsrechnung, cStornierung, cPreisdifferenz] then
              _CSV.AddLine('BETRAG', (-1) * TFibuexportItem(FibuListe.Items[0]).getFremdBetragBrutto)
            else
              _CSV.AddLine('BETRAG', TFibuexportItem(FibuListe.Items[0]).getFremdBetragBrutto);
          end;

          _CSV.AddLine('BUCHUNGSTEXT', 'OP: ' + Vorgang.getNummer + ' / ' + Vorgang.Empfaenger.getMatch);
          _CSV.AddLine('BELEGDATUM', Vorgang.getDatum, 'dd.mm.yyyy');

          if Vorgang.getSkontoTage <> 0 then
            _CSV.AddLine('VALUTADATUM', Vorgang.getDatum + Vorgang.getSkontoTage, 'dd.mm.yyyy')
          else if Vorgang.getNettoTage <> 0 then
            _CSV.AddLine('VALUTADATUM', Vorgang.getDatum + Vorgang.getNettoTage, 'dd.mm.yyyy')
          else
            _CSV.AddLine('VALUTADATUM', Vorgang.getDatum, 'dd.mm.yyyy');

          _CSV.AddLine('NETTODATUM', Vorgang.getDatum + Vorgang.getNettoTage,'dd.mm.yyyy');

          //R.H. 27.10.2017 Beim ER und EG sollte der Liefernten Rechnungsnummer übergeben werden,
          //wird in Refferenznummer der ER reingeschrieben wenn der ER dem Eingangsbeleg zugeordnet wird.
          if Vorgang.isDebitorvorgang then
             _CSV.AddLine('BELEGNR', Vorgang.getNummer)
          else
             _CSV.AddLine('BELEGNR', Vorgang.getOrderNummer);


          _CSV.AddLine('BELEGNR2', OpNr);

          try
            if aZahlArten.Locate('ZA_ID', Vorgang.getZahlungsartID, []) and
               (aZahlArten.FieldByName('ZA_BANKV').AsString = 'T') then
              _CSV.AddLine('ABW_ZAHLUNGSART', 'A')
            else
              _CSV.AddLine('ABW_ZAHLUNGSART', 'N');
          except
            on E: Exception do
            begin
              if not Transaction.InTransaction then
                LogMessage('Geschlossene Transaction (Zahlart.locate)');
              LogMessage('Zahlart.locate' + E.Message);
              raise;
            end;
          end;
          _CSV.AddLine('BUCHSTEUERSL', TFibuexportItem(FibuListe.Items[0]).getKonto.getPDXKennung);
          _CSV.AddLine('ABW_ZAHLSL', ZS.getID);
          _CSV.AddLine('BELEGLINK', 'file://' +getExport_ArchivPfad(Vorgang.getID));

          _CSV.CloseLine;
        end

        else if FibuListe.Count > 1 then

        // Wenn es eine AUFTEILUNGSBUCHUNG IST

        begin

          // Aufteilungsbuchung - Aufteilungsbetrag
          LogMessage(Vorgang.getNummer + ' - Aufteilungsbuchung');

          _CSV.OpenLine;
          _CSV.AddLine('SATZART', 'B');
          _CSV.AddLine('KONTO', Vorgang.Empfaenger.getPersonenkonto);
          _CSV.AddLine('GEGENKONTO', '0');
          _CSV.AddLine('BUCHUNGSDATUM', Vorgang.getDatum, 'mmyyyy');

          _CSV.AddLine('WID_KONTO', WaehrSchlus);

          // Bei nationaler Währung
          if WaehrSchlus = 1 then
          begin
            if Vorgang.getArt in [cGutschrift, cEingangsrechnung, cStornierung, cPreisdifferenz] then
              _CSV.AddLine('BETRAG', (-1) * Vorgang.getBruttosumme)
            else
              _CSV.AddLine('BETRAG', Vorgang.getBruttosumme);
          end
          else
          // Bei Währung <> EUR (1)
          begin
            if Vorgang.getArt in [cGutschrift, cEingangsrechnung, cStornierung, cPreisdifferenz] then
              _CSV.AddLine('BETRAG', (-1) * Vorgang.getBruttosumme*Vorgang.getKurs)
            else
              _CSV.AddLine('BETRAG', Vorgang.getBruttosumme*Vorgang.getKurs);
          end;

          _CSV.AddLine('BUCHUNGSTEXT', 'OP: ' + Vorgang.getNummer + ' / ' +  Vorgang.Empfaenger.getMatch);
          _CSV.AddLine('BELEGDATUM', Vorgang.getDatum, 'dd.mm.yyyy');

          if Vorgang.getSkontoTage <> 0 then
            _CSV.AddLine('VALUTADATUM', Vorgang.getDatum + Vorgang.getSkontoTage, 'dd.mm.yyyy')
          else if Vorgang.getNettoTage <> 0 then
            _CSV.AddLine('VALUTADATUM', Vorgang.getDatum + Vorgang.getNettoTage, 'dd.mm.yyyy')
          else
            _CSV.AddLine('VALUTADATUM', Vorgang.getDatum, 'dd.mm.yyyy');

          _CSV.AddLine('NETTODATUM', Vorgang.getDatum + Vorgang.getNettoTage, 'dd.mm.yyyy');

          if Vorgang.isDebitorvorgang then
             _CSV.AddLine('BELEGNR', Vorgang.getNummer)
          else
             _CSV.AddLine('BELEGNR', Vorgang.getOrderNummer);

          _CSV.AddLine('BELEGNR2', OpNr);
          try
            if aZahlArten.Locate('ZA_ID', Vorgang.getZahlungsartID, []) and
              (aZahlArten.FieldByName('ZA_BANKV').AsString = 'T') then
              _CSV.AddLine('ABW_ZAHLUNGSART', 'A')
            else
              _CSV.AddLine('ABW_ZAHLUNGSART', 'N');
          except
            on E: Exception do
            begin
              if not Transaction.InTransaction then
                LogMessage('Geschlossene Transaction (Zahlart.locate -Aufteilungsbuchung)');
              LogMessage('Zahlart.locate -Aufteilungsbuchung' + E.Message);
              raise;
            end;
          end;
          _CSV.AddLine('BUCHSTEUERSL', '');
          _CSV.AddLine('ABW_ZAHLSL', ZS.getID);
          _CSV.AddLine('BELEGLINK', 'file://' +getExport_ArchivPfad(Vorgang.getID));

          _CSV.CloseLine;

          for x := 0 to FibuListe.Count - 1 do
          begin
            // Aufteilungsbuchung - Aufteilungs-Gegenbuchung
            LogMessage(Vorgang.getNummer + ' - Aufteilungs-Gegenbuchung ' + IntToStr(x));
            _CSV.OpenLine;
            _CSV.AddLine('SATZART', 'B');
            _CSV.AddLine('KONTO', TFibuexportItem(FibuListe.Items[x]).getKonto.getKontoNr);
            _CSV.AddLine('GEGENKONTO', Vorgang.Empfaenger.getPersonenkonto);
            _CSV.AddLine('BUCHUNGSDATUM', Vorgang.getDatum, 'mmyyyy');

            _CSV.AddLine('WID_KONTO', WaehrSchlus);

            if WaehrSchlus = 1 then
            begin
              if Vorgang.getArt in [cGutschrift, cEingangsrechnung, cStornierung, cPreisdifferenz] then
                _CSV.AddLine('BETRAG',  TFibuexportItem(FibuListe.Items[x]).getBetragBrutto)
              else
                _CSV.AddLine('BETRAG', (-1) * TFibuexportItem(FibuListe.Items[x]).getBetragBrutto);
            end
            else
            begin
              if Vorgang.getArt in [cGutschrift, cEingangsrechnung, cStornierung, cPreisdifferenz] then
                _CSV.AddLine('BETRAG', TFibuexportItem(FibuListe.Items[x]).getFremdBetragBrutto)
              else
                _CSV.AddLine('BETRAG', (-1) * TFibuexportItem(FibuListe.Items[x]).getFremdBetragBrutto);
            end;

            _CSV.AddLine('BUCHUNGSTEXT', 'OP: ' + Vorgang.getNummer + ' / ' + Vorgang.Empfaenger.getMatch);
            _CSV.AddLine('BELEGDATUM', Vorgang.getDatum, 'dd.mm.yyyy');

            if Vorgang.getSkontoTage <> 0 then
              _CSV.AddLine('VALUTADATUM', Vorgang.getDatum + Vorgang.getSkontoTage, 'dd.mm.yyyy')
            else if Vorgang.getNettoTage <> 0 then
              _CSV.AddLine('VALUTADATUM', Vorgang.getDatum + Vorgang.getNettoTage, 'dd.mm.yyyy')
            else
              _CSV.AddLine('VALUTADATUM', Vorgang.getDatum, 'dd.mm.yyyy');

            _CSV.AddLine('NETTODATUM', Vorgang.getDatum + Vorgang.getNettoTage, 'dd.mm.yyyy');
            if Vorgang.isDebitorvorgang then
               _CSV.AddLine('BELEGNR', Vorgang.getNummer)
            else
               _CSV.AddLine('BELEGNR', Vorgang.getOrderNummer);
            _CSV.AddLine('BELEGNR2', OpNr);
            try
              if aZahlArten.Locate('ZA_ID', Vorgang.getZahlungsartID, []) and
                (aZahlArten.FieldByName('ZA_BANKV').AsString = 'T') then
                _CSV.AddLine('ABW_ZAHLUNGSART', 'A')
              else
                _CSV.AddLine('ABW_ZAHLUNGSART', 'N');
            except
              on E: Exception do
              begin
                if not Transaction.InTransaction then
                  LogMessage('Geschlossene Transaction (Zahlart.locate -Aufteilungs-Gegenbuchung )');
                LogMessage('Zahlart.locate -Aufteilungs-Gegenbuchung' + E.Message);
                raise;
              end;
            end;
            _CSV.AddLine('ABW_ZAHLSL', ZS.getID);
            _CSV.AddLine('BUCHSTEUERSL', TFibuexportItem(FibuListe.Items[x]).getKonto.getPDXKennung);
            _CSV.AddLine('BELEGLINK', 'file://' +getExport_ArchivPfad(Vorgang.getID));
            _CSV.CloseLine;
          end;
        end;

        SetLength(Result, i + 1);
        Result[i] := Vorgang.getID;

        FreeAndNil(ZS);

        Vorgang.Free;

        inc(i);

        aQuery.Next;
      end;

      try
        _CSV.SaveToFile(aFilename);
      except
        on E:Exception do
        begin
          LogMessage('Fehler: TAddison_2.PostenExport Datei "' + aFilename + '" konnte nicht geschrieben werden.' + E.Message);
          raise;
        end;
      end;

    finally
      _CSV.DeleteAllLastDelimiterOnEndLine := false;

      FibuListe.Free;
    end;

end;

procedure TAddison_2.PostenReImport;
var
  {$IFNDEF FIBUTEST}
  OPSuche: RwOPSuche;
  {$ENDIF FIBUTEST}
  OP: RwOP;
  IBQVorgaenge: TIBQuery;
  Vorgang: TVorgang;
  Nummern: TStrings;
  CSVFilename: string;
  i: integer;
  BelegNr: string;
  SatzArt: string;
  VorgangNummer: string;
  NummernIndex: Integer;
  LogFileList: TStringList;
  LogFilename: string;
  LogFileListTemp: TStringList;
  s: string;
  LogDir: string;
  Buchungstext : string;
begin
  LogMessage('TobFib Posten Reimport');
  s := '';
  {$IFNDEF FIBUTEST}
  if not connect then
  begin
    LogMessage('Posten Re-Import: Keine Verbindung zur Datenbank');
    exit;
  end;
  {$ENDIF FIBUTEST}

  Nummern := TStringList.Create;
  LogFileList := TStringList.Create;
  LogFileListTemp := TStringList.Create;
  LogFileList.Clear;
  LogFileListTemp.Clear;

  CSVFilename := Stammdaten.ServerEinstellungen.ReadString('AddisonExportDir','') + '\topfib.csv';

  LogDir := Stammdaten.ServerEinstellungen.ReadString('AddisonExportLog', '');
  if Trim(LogDir) = '' then
    LogDir := Stammdaten.ServerEinstellungen.ReadString('AddisonExportDir', '');
  LogDir := IncludeTrailingPathDelimiter(LogDir);
  if not FileExists(LogDir) then
    ForceDirectories(LogDir);

  LogFileName := LogDir + 'PostenReImport_' + FormatDateTime('yyyymmdd', now) + '.log';

  //LogFileName := Stammdaten.ServerEinstellungen.ReadString('AddisonExportDir', '') + '\' + 'PostenReImport_' + FormatDateTime('yyyymmdd', now) + '.log';

//  if FileExists(LogFileName) then
  if Tnf.GetInstance.System.FileExist(LogFileName) = 0 then
  begin
    try
      LogFileList.LoadFromFile(LogFileName);
    except
      LogMessage('Posten Re-Import: PostenReImport_log kann nicht gelesen werden. Re-Import wurde abgebrochen.');
      FreeAndNil(LogFileListTemp);
      FreeAndNil(LogFileList);
      FreeAndNil(Nummern);
      exit;
    end;
  end;

  _CSV.DeleteAllLastDelimiterOnEndLine := true;
  _CSV.Clear;
  SetBuchenShema(_CSV);
  if Tnf.GetInstance.System.FileExist(CSVFilename) = 0 then
  begin
    try
      _CSV.LoadFromFile(CSVFilename);
    except
      LogMessage('Posten Re-Import: Topfib.csv kann nicht gelesen werden. Re-Import wurde abgebrochen.');
      FreeAndNil(LogFileListTemp);
      FreeAndNil(LogFileList);
      FreeAndNil(Nummern);
      exit;
    end;
    LogFileListTemp.LoadFromFile(CSVFilename);
    LogFileList.AddStrings(LogFileListTemp);
  end;

  FreeAndNil(LogFileListTemp);

  for i := 0 to _CSV.Count - 1 do
  begin
    SatzArt := _CSV.GetValue(i, 'SATZART');
    if SatzArt = 'B' then
    begin
      Buchungstext := _CSV.GetValue(i, 'BUCHUNGSTEXT');
      System.Delete(Buchungstext, 1, Pos(':', Buchungstext) +1);
      BelegNr := trim(copy(Buchungstext, 1, Pos(' / ', Buchungstext)-1));
//      BelegNr := _CSV.GetValue(i, 'BELEGNR');
      Nummern.Add(Trim(BelegNr));
    end;
  end;
  _CSV.DeleteAllLastDelimiterOnEndLine := false;

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
      Vorgang := TVorgang.Create(self, FieldByName('VO_ID').AsInteger, Stammdaten, Transaction);
      VorgangNummer := Trim(Vorgang.getNummer);
      if Nummern.Count > 0 then
        NummernIndex  := Nummern.IndexOf(VorgangNummer)
      else
        NummernIndex := -1;
      // 1. OP noch in der Datei?
      if (Nummern.Count = 0) or (NummernIndex = -1) then
      begin
        LogFileList.Add(FormatDateTime('dd.mm.yyyy', now) +  ' / Nicht gefunden Belegnummer: ' + VorgangNummer);
        // nicht vorhanden in Exportdatei
        // 2. OP noch in Addison?
        OP := nil;
       {$IFNDEF FIBUTEST}
        OPSuche := Wirtschaftsjahr.CreateOPSuche;
        if Vorgang.Empfaenger.isOfType(cKunde) then
          OPSuche.SearchBelegNr(IntToStr(TKunden(Vorgang.Empfaenger).getDebitor), Vorgang.getNummer)
        else
          OPSuche.SearchBelegNr(IntToStr(TLieferant(Vorgang.Empfaenger).getKreditor), Vorgang.getNummer);

        OP := OPSuche.GetAt[0];
        if OP = nil then
        begin
          // nicht Vorhanden in Addison
          // Vorgang ist erledigt
          LogMessage('      Vorgang erledigt: ' + Vorgang.getNummer);
          Vorgang.setStatus(cErledigt);
          Vorgang.saveToDB;
          Vorgang.HistorienDatensatzAnlegen(12, 'Vorgang wurde erledigt. (Server: Fibu - PostenReImport).');
          LogFileList.Add(FormatDateTime('dd.mm.yyyy', now) +  ' / Erledigte Belegnummer: ' + VorgangNummer);
        end
        else
        begin
          s := '/BelegNr/BelegNr2/Datum/Betrag' + OP.m_BelegNr + '/' + OP.m_BelegNr2 + '/' +
               FormatDateTime('dd.mm.yyyy', OP.m_BelegDatum) + '/' +  CurrToStr(OP.m_Betrag);
          LogFileList.Add(FormatDateTime('dd.mm.yyyy', now) +  ' / Vorgang noch offen: ' + Vorgang.getNummer + s);
          LogMessage('      Vorgang noch offen: ' + Vorgang.getNummer);
        end;
       {$ENDIF FIBUTEST}
      end;

      Vorgang.Free;

      if IBQVorgaenge.RecNo mod 10 = 0 then
        LogMessage(IntToStr(IBQVorgaenge.RecNo) + ' Datensätze überprüft');

      Next;

    end;
    close;
    Free;
  end;


  LogFileList.Add('');
  try
    LogFileList.SaveToFile(LogFilename);
  except
    on E:Exception do
    begin
      LogMessage('Fehler: TAddison_2.PostenReImport Datei "' + LogFilename + '" konnte nicht geschrieben werden.' + E.Message);
      raise;
    end;
  end;

  FreeAndNil(LogFileList);
  CommitTransaction;
  Nummern.Free;
  OP := nil;

  {$IFNDEF FIBUTEST}
  disconnect;
  {$ENDIF FIBUTEST}
end;

procedure TAddison_2.ZahlungsschluesselAbgleichen(aFilename: string);
var
  ReadQuery: TIBQuery;
  WriteQuery: TIBQuery;
begin

  LogMessage('Zahlungsschluessel aktualisieren');

  ReadQuery := TIBQuery.Create(self);
  WriteQuery := TIBQuery.Create(self);
  try
    WriteQuery.Transaction := self.Transaction;
    WriteQuery.SQL.Text := 'UPDATE ZAHLUNGSSCHLUESSEL SET ZS_PDXUPDATE = "F" WHERE ZS_ID = :Id';

    OpenTransaction;

    _CSV.DeleteAllLastDelimiterOnEndLine := true;
    _CSV.Clear;
    SetSchluesselSchema(_CSV);

    ReadQuery.Transaction := self.Transaction;
    ReadQuery.SQL.Text := 'SELECT * FROM ZAHLUNGSSCHLUESSEL WHERE ' +
                          'ZS_PDXUPDATE = "T" AND ZS_DELETE <> "T" ';
    ReadQuery.Open;

    while not ReadQuery.Eof do
    begin
      LogMessage(ReadQuery.FieldByName('ZS_BEZEICHNUNG').AsString);

      // CSVFile.Insert;
      _CSV.OpenLine;
      _CSV.AddLine('SATZART', 'Z');
      _CSV.AddLine('ZAHLSL', ReadQuery.FieldByName('ZS_ID').AsInteger);
      _CSV.AddLine('ZAHLSL_NAME', ReadQuery.FieldByName('ZS_BEZEICHNUNG').AsString);
      _CSV.AddLine('ZAHLSL_TAGE1', ReadQuery.FieldByName('ZS_SKONTOTAGE').AsInteger);
      _CSV.AddLine('ZAHLSL_PERCENT1', ReadQuery.FieldByName('ZS_SKONTO').AsFloat);
      _CSV.AddLine('ZAHLSL_NETTOTAGE', ReadQuery.FieldByName('ZS_NETTOTAGE').AsInteger);

      WriteQuery.ParamByName('ID').AsInteger := ReadQuery.FieldByName('ZS_ID').AsInteger;
      WriteQuery.ExecSQL;

      _CSV.CloseLine;
      ReadQuery.Next;
    end;

    ReadQuery.close;
  //  _CSV.Rotate;
    try
      _CSV.SaveToFile(aFilename);
    except
      on E:Exception do
      begin
        LogMessage('Fehler: TAddison_2.ZahlungsschluesselAbgleichen Datei "' +
                     aFilename + '" konnte nicht geschrieben werden.' + E.Message);
        raise;
      end;
    end;

  finally
    _CSV.DeleteAllLastDelimiterOnEndLine := false;
    CommitTransaction;

    WriteQuery.Free;
    ReadQuery.Free;
  end;

end;


procedure TAddison_2.SplittCSVList(aCSVFilename: string);
var
  i1: Integer;
  SatzArt: string;
begin
  _CSVZ.Clear;
  _CSVZ.DeleteAllLastDelimiterOnEndLine := true;
  SetSchluesselSchema(_CSVZ);

  _CSVK.Clear;
  _CSVK.DeleteAllLastDelimiterOnEndLine := true;
  SetKundenShema(_CSVK);

  _CSVB.DeleteAllLastDelimiterOnEndLine := true;
  _CSVB.Clear;
  SetBuchenShema(_CSVB);

  _CSVZ.LoadFromFile(aCSVFilename);
  _CSVK.LoadFromFile(aCSVFilename);
  _CSVB.LoadFromFile(aCSVFilename);

  for i1 := _CSVZ.Count - 1 downto 0 do
  begin
    SatzArt := _CSVZ.GetValue(i1, 'SATZART');
    if SatzArt <> 'Z' then
      _CSVZ.DeleteItem(i1);
  end;

  for i1 := _CSVK.Count - 1 downto 0 do
  begin
    SatzArt := _CSVK.GetValue(i1, 'SATZART');
    if SatzArt <> 'K' then
      _CSVK.DeleteItem(i1);
  end;

  for i1 := _CSVB.Count - 1 downto 0 do
  begin
    SatzArt := _CSVB.GetValue(i1, 'SATZART');
    if SatzArt <> 'B' then
      _CSVB.DeleteItem(i1);
  end;


end;


procedure TAddison_2.CombinedCSVList;
var
  SatzArt: string;
  TempList: TStringList;
  CSVList: TStringList;
begin
  SatzArt := '';
  if _CSV.Count > 0 then
    SatzArt := _CSV.GetValue(0, 'SATZART');
  TempList := TStringList.Create;
  CSVList  := TStringList.Create;
  try
    _CSV.LoadList(CSVList);
    _CSV.Clear;
    if SatzArt = 'K' then
    begin
      _CSVK.LoadList(TempList);
      _CSV.Attach(TempList);
      _CSV.Attach(CSVList);
      _CSVZ.LoadList(TempList);
      _CSV.Attach(TempList);
      _CSVB.LoadList(TempList);
      _CSV.Attach(TempList);
    end;
    if SatzArt = 'Z' then
    begin
      _CSVK.LoadList(TempList);
      _CSV.Attach(TempList);
      _CSVZ.LoadList(TempList);
      _CSV.Attach(TempList);
      _CSV.Attach(CSVList);
      _CSVB.LoadList(TempList);
      _CSV.Attach(TempList);
    end;
    if SatzArt = 'B' then
    begin
      _CSVK.LoadList(TempList);
      _CSV.Attach(TempList);
      _CSVZ.LoadList(TempList);
      _CSV.Attach(TempList);
      _CSVB.LoadList(TempList);
      _CSV.Attach(TempList);
      _CSV.Attach(CSVList);
    end;
    if SatzArt = '' then
    begin
      _CSVK.LoadList(TempList);
      _CSV.Attach(TempList);
      _CSVZ.LoadList(TempList);
      _CSV.Attach(TempList);
      _CSVB.LoadList(TempList);
      _CSV.Attach(TempList);
    end;
  finally
    FreeAndNil(TempList);
    FreeAndNil(CSVList);
  end;
end;


end.
