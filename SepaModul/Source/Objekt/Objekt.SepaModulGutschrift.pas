unit Objekt.SepaModulGutschrift;

interface

uses
  SysUtils, Classes, IBX.IBDatabase, IBX.IBQuery, Objekt.SepaBSHeaderList,
  o_Sepa_G_CstmrCdtTrfInitn, Objekt.SepaBSHeader, o_Sepa_G_CdtTrfTxInf,
  Objekt.SepaFormat, o_Sepa_G_PmtInf, Objekt.SepaBSPos, o_nf,
  XML.XMLIntf, XML.XMLDoc, o_Sepa_Obj_BS, o_Sepa_Log, Objekt.SepaDateiList,
  Objekt.SepaDatei;


type
  TSepaModulGutschrift = class
  private
    fTrans: TIBTransaction;
    fAusgabepfad: string;
    fSicherungspfad: string;
    fSepaDateiList: TSepaDateiList;
    fCstmrCdtTrfInitn: TSepa_G_CstmrCdtTrfInitn;
    fSepaFormat: TSepaFormat;
    fnf: Tnf;
    fLog : TSepa_Log;
  public
    constructor Create;
    destructor Destroy; override;
    property Ausgabepfad: string read fAusgabepfad write fAusgabepfad;
    property Sicherungspfad:string read fSicherungspfad write fSicherungspfad;
    property Trans: TIBTransaction read fTrans write fTrans;
    property GutschriftXML: TSepa_G_CstmrCdtTrfInitn read fCstmrCdtTrfInitn;
    procedure LadeGutschrift(aFilename: string; aBS: TSepaBSHeaderList);
    procedure LadeAlleGutschriften;
    procedure SchreibeAlleGutschriften;
    procedure LadeUeberweisungsauftrag;
    procedure DeleteAllGutschrift(aPath: string);
    procedure SchreibeGutschrift(aSepaDatei: TSepaDatei);
    procedure setLog(aLog: TSepa_Log);
  end;

implementation

{ TSepaModulGutschrift }

constructor TSepaModulGutschrift.Create;
begin
  fAusgabepfad := '';
  fSicherungspfad := '';
  fTrans := nil;
  fSepaDateiList := nil;
  fLog := nil;
  fCstmrCdtTrfInitn := TSepa_G_CstmrCdtTrfInitn.Create;
  fSepaFormat := TSepaFormat.Create;
  fnf := Tnf.GetInstance;
end;


destructor TSepaModulGutschrift.Destroy;
begin
  FreeAndNil(fCstmrCdtTrfInitn);
  FreeAndNil(fSepaFormat);
  if fSepaDateiList <> nil then
    FreeAndNil(fSepaDateiList);
  inherited;
end;


procedure TSepaModulGutschrift.LadeGutschrift(aFilename: string; aBS: TSepaBSHeaderList);
var
  i1: Integer;
  BSHeader: TSepaBSHeader;
  BSPos: TSepaBSPos;
  CdtTrfTxInf: TSepa_G_CdtTrfTxInf;
  PmtInf: TSepa_G_PmtInf;
begin
  if aBS = nil then
    exit;
  if not FileExists(aFilename) then
    exit;
  fCstmrCdtTrfInitn.Init;
  fCstmrCdtTrfInitn.Load(aFileName);
  if (aBS.NM > '') and (aBS.NM <> fCstmrCdtTrfInitn.Grphdr.InitgPty.Nm) then
    exit;
  aBS.MsgId := fCstmrCdtTrfInitn.Grphdr.MsgId;
  aBS.CreDtTm := fCstmrCdtTrfInitn.Grphdr.CreDtTM;
  aBS.Nm := fCstmrCdtTrfInitn.Grphdr.InitgPty.Nm;

  PmtInf := fCstmrCdtTrfInitn.PmtInf;

  BSHeader := aBS.getBSHeader(PmtInf.DbtrAcct.Id.IBAN, fSepaFormat.SepaDateToDateTime(PmtInf.ReqdExctnDt));

  BSHeader.IBAN := PmtInf.DbtrAcct.Id.IBAN;
  BSHeader.Auftraggeber := PmtInf.Dbtr.Nm;
  BSHeader.BIC := PmtInf.DbtrAgt.FinInstnId.BIC;
  BSHeader.ZahlDatum := fSepaFormat.SepaDateToDateTime(PmtInf.ReqdExctnDt);
  BSHeader.PmtInfId := PmtInf.PmtInfId;
  BSHeader.PmtMtd   := PmtInf.PmtMtd;
  BSHeader.ChrgBr   := PmtInf.ChrgBr;
  BSHeader.MsgId    := aBS.MsgId;

  for i1 := 0 to PmtInf.CdtTrfTxInfList.Count -1 do
  begin
    CdtTrfTxInf := PmtInf.CdtTrfTxInfList.CdtTrfTxInf[i1];
    BSPos := BSHeader.BS.Add;
    BSPos.Betrag := fSepaFormat.SepaCurrStrToCurr(CdtTrfTxInf.Amt.InstdAmt.InstdAmt);
    BSPos.EndToEnd := CdtTrfTxInf.PmtId.EndToEndId;
    BSPos.BIC := CdtTrfTxInf.CdtrAgt.FinInstnId.BIC;
    BSPos.Empfaenger := CdtTrfTxInf.Cdtr.Nm;
    BSPos.IBAN := CdtTrfTxInf.CdtrAcct.Id.IBAN;
    BSPos.VZweck.Zweck1 := CdtTrfTxInf.RmtInf.Ustrd;
  end;

end;


procedure TSepaModulGutschrift.SchreibeGutschrift(aSepaDatei: TSepaDatei);
var
  Pfad: string;
  i1, i2: Integer;
  BSHeader: TSepaBSHeader;
  CdtTrfTxInf: TSepa_G_CdtTrfTxInf;
  XML: TXMLDocument;
  Document : IXMLNode;
  PmtInf: TSepa_G_PmtInf;
  BSPos: TSepaBSPos;
  BS: TSepaBSHeaderList;
begin
  Pfad := IncludeTrailingPathDelimiter(Ausgabepfad) + 'Test\';
  if not DirectoryExists(Pfad) then
    ForceDirectories(Pfad);

  BS := aSepaDatei.BSHeaderList;

  for i1 := 0 to BS.Count -1 do
  begin
    BSHeader := BS.Item[i1];

    //if not BSHeader.Changed then
    //  continue;

    if fCstmrCdtTrfInitn <> nil then
      FreeAndNil(fCstmrCdtTrfInitn);
    fCstmrCdtTrfInitn := TSepa_G_CstmrCdtTrfInitn.Create;

    XML := TXMLDocument.Create(nil);
    try
      XML.Active     := true;
      XML.Encoding   := 'UTF-8';
      XML.Options    := XML.Options + [doNodeAutoIndent];
      Document := XML.CreateElement('Document', '');
      Document.Attributes['xsi:schemaLocation'] := 'urn:iso:std:iso:20022:tech:xsd:pain.001.002.03 pain.001.002.03.xsd';
      Document.Attributes['xmlns:xsi'] := 'http://www.w3.org/2001/XMLSchema-instance';
      Document.Attributes['xmlns'] := 'urn:iso:std:iso:20022:tech:xsd:pain.001.002.03';

      XML.DocumentElement := Document;

      fCstmrCdtTrfInitn.Grphdr.MsgId := BSHeader.MsgId;
      fCstmrCdtTrfInitn.Grphdr.CreDtTM := fSepaFormat.IsoDateTime;
      fCstmrCdtTrfInitn.Grphdr.NbOfTxs := IntToStr(BS.NbOfTxs);
      fCstmrCdtTrfInitn.Grphdr.CtrlSum := CurrToStr(BS.CtrlSum);
      fCstmrCdtTrfInitn.Grphdr.InitgPty.Nm := BSHeader.Auftraggeber;

      PmtInf := fCstmrCdtTrfInitn.PmtInf;
      PmtInf.PmtInfId := BSHeader.PmtInfId;
      PmtInf.PmtMtd   := BSHeader.PmtMtd;
      PmtInf.NbOfTxs  := IntToStr(BSHeader.NbOfTxs);
      PmtInf.CtrlSum  := CurrToStr(BSHeader.CtrlSum);
      PmtInf.ReqdExctnDt := fSepaFormat.DateToSepaDate(BSHeader.ZahlDatum);
      PmtInf.Dbtr.Nm := BSHeader.Auftraggeber;
      PmtInf.DbtrAcct.Id.IBAN := BSHeader.IBAN;
      PmtInf.DbtrAgt.FinInstnId.BIC := BSHeader.BIC;
      PmtInf.ChrgBr := BSHeader.ChrgBr;

      for i2 := 0 to BSHeader.BS.Count -1 do
      begin
        BSPos := BSHeader.BS.Item[i2];
        CdtTrfTxInf := PmtInf.AddCdtTrfTxInf;
        CdtTrfTxInf.Amt.InstdAmt.InstdAmt  := CurrToStr(BSPos.Betrag);
        CdtTrfTxInf.Amt.InstdAmt.Ccy       := BSPos.Waehrung;
        CdtTrfTxInf.CdtrAgt.FinInstnId.BIC := BSPos.BIC;
        CdtTrfTxInf.Cdtr.Nm                := BSPos.Empfaenger;
        CdtTrfTxInf.CdtrAcct.Id.IBAN       := BSPos.IBAN;
        CdtTrfTxInf.PmtId.EndToEndId       := BSPos.EndToEnd;
        CdtTrfTxInf.RmtInf.Ustrd           := BSPos.VZweckStr;
      end;


      fCstmrCdtTrfInitn.Log := fLog;
      fCstmrCdtTrfInitn.Check;
      fCstmrCdtTrfInitn.Add(XML);
      XML.SaveToFile(Pfad + ExtractFileName(aSepaDatei.Filename));

    finally
      FreeAndNil(XML);
    end;

  end;
end;


procedure TSepaModulGutschrift.setLog(aLog: TSepa_Log);
begin
  fLog := aLog;
end;


procedure TSepaModulGutschrift.LadeAlleGutschriften;
var
  FileList  : TStringList;
  i1: Integer;
begin
  if fSepaDateiList <> nil then
    FreeAndNil(fSepaDateiList);
  fSepaDateiList := TSepaDateiList.Create;
  fSepaDateiList.FilePath := Ausgabepfad;
  FileList := TStringList.Create;
  try
    fNf.System.GetAllFiles(fAusgabepfad, FileList, true, false, 'SEPA_G*.xml');
    for i1 := 0 to FileList.Count -1 do
    begin
      LadeGutschrift(FileList.Strings[i1], fSepaDateiList.SepaDatei(FileList.Strings[i1]).BSHeaderList);
    end;
  finally
    FreeAndNil(FileList);
  end;
end;

procedure TSepaModulGutschrift.SchreibeAlleGutschriften;
var
  i1: Integer;
begin
  if fSepaDateiList = nil then
    exit;
  for i1 := 0 to fSepaDateiList.Count -1 do
  begin
    SchreibeGutschrift(fSepaDateiList.Item[i1]);
  end;
end;

procedure TSepaModulGutschrift.DeleteAllGutschrift(aPath: string);
var
  FileList  : TStringList;
  i1: Integer;
begin
  FileList := TStringList.Create;
  try
    fNf.System.GetAllFiles(aPath, FileList, true, false, 'SEPA_G*.xml');
    for i1 := 0 to FileList.Count -1 do
    begin
    end;
  finally
    FreeAndNil(FileList);
  end;

end;

procedure TSepaModulGutschrift.LadeUeberweisungsauftrag;
var
  qry: TIBQuery;
  qryUpd: TIBQuery;
  BSHeader: TSepaBSHeader;
  BSPos: TSepaBSPos;
  SepaDatei: TSepaDatei;
begin
  if fSepaDateiList = nil then
    fSepaDateiList := TSepaDateiList.Create;
  fSepaDateiList.FilePath := Ausgabepfad;
  if fTrans.InTransaction then
    fTrans.Commit;

  fTrans.StartTransaction;
  qryUpd := TIBQuery.Create(nil);
  qry := TIBQuery.Create(nil);
  try
    qryUpd.Transaction := fTrans;
    qry.Transaction := fTrans;
    qry.SQL.Text := ' select * from ueberweisungsauftrag' +
                    ' where su_delete != "T"' +
                    ' and   su_sepa_erstellt != "T"' +
                    ' order by su_auftraggeber_iban';

    qryUpd.SQL.Text := ' update ueberweisungsauftrag' +
                       ' set su_sepa_erstellt = "T", su_sepa_erstellt_datum = :datum' +
                       ' where su_id = :id';

    qry.Open;
    while not qry.Eof do
    begin
      try
        qryUpd.ParamByName('datum').AsDateTime := now;
        qryUpd.ParamByName('id').AsInteger     := qry.FieldByName('su_id').asInteger;
        qryUpd.ExecSQL;
      except
        on E:Exception do
        begin
          fLog.Add('', E.Message + ' ' + qry.FieldByName('su_id').asString);
          qry.Next;
          continue;
        end;
      end;
      //SepaDatei := fSepaDateiList.SepaDateiByIban(qry.FieldByName('su_auftraggeber_iban').AsString);
      SepaDatei := fSepaDateiList.SepaDateiByIbanUndZahlung(qry.FieldByName('su_auftraggeber_iban').AsString, qry.FieldByName('su_zahldatum').asDateTime);
      BSHeader  := SepaDatei.BSHeaderList.getBSHeader(qry.FieldByName('su_auftraggeber_iban').AsString, qry.FieldByName('su_zahldatum').asDateTime);

      BSHeader.IBAN         := qry.FieldByName('su_auftraggeber_iban').AsString;
      BSHeader.Auftraggeber := qry.FieldByName('su_auftraggeber').AsString;
      BSHeader.BIC          := qry.FieldByName('su_bic').AsString;
      BSHeader.ZahlDatum    := qry.FieldByName('su_zahldatum').AsDateTime;

      if BSHeader.PmtInfId = '' then
        BSHeader.PmtInfId := FormatDateTime('yyyymmddhhnnsszzz', now);

      BSHeader.PmtMtd       := 'TRF';
      BSHeader.ChrgBr       := 'SLEV';

      BSHeader.Changed := true;
      BSPos := BSHeader.BS.Add;
      BSPos.SU_Id := qry.FieldByName('su_id').asInteger;
      BSPos.Betrag := qry.FieldByName('su_betrag').AsFloat;
      BSPos.EndToEnd := qry.FieldByName('su_endtoend').AsString;
      BSPos.BIC := qry.FieldByName('su_bic').AsString;
      BSPos.Empfaenger := qry.FieldByName('su_empfaenger').AsString;
      BSPos.IBAN := qry.FieldByName('su_iban').AsString;
      BSPos.VZweck.Zweck1 := qry.FieldByName('su_vzweck1').AsString;
      BSPos.VZweck.Zweck2 := qry.FieldByName('su_vzweck2').AsString;
      BSPos.VZweck.Zweck3 := qry.FieldByName('su_vzweck3').AsString;
      BSPos.VZweck.Zweck4 := qry.FieldByName('su_vzweck4').AsString;
      qry.Next;
    end;

  finally
    FreeAndNil(qry);
    FreeAndNil(qryUpd);
  end;
end;



end.
