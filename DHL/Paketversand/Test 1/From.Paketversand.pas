unit From.Paketversand;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, geschaeftskundenversand_api_2, Soap.InvokeRegistry,
  Vcl.StdCtrls, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, Soap.Soaphttpclient, IdIOHandler, IdIOHandlerStream, Vcl.ExtCtrls, SOAPHTTPTrans,
  Objekt.DHLShipmentOrderRequestAPI, Soap.Rio;

type
  Tfrm_Paketversand = class(TForm)
    IdHTTP: TIdHTTP;
    Memo1: TMemo;
    IdIOHandlerStream1: TIdIOHandlerStream;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    HTTPRIO1: THTTPRIO;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure HTTPRIO1BeforeExecute(const MethodName: string;
      SOAPRequest: TStream);
    procedure Button9Click(Sender: TObject);
  private
    fProgrammPath: string;
    procedure HttpRioHttpWebNodeBeforePost(const HTTPReqResp: THTTPReqResp; Data: Pointer);
    procedure FillShipmentOrderRequest(R: TDHLShipmentOrderRequestAPI);
  public
  end;

var
  frm_Paketversand: Tfrm_Paketversand;

implementation


 uses WinInet;

{$R *.dfm}



procedure Tfrm_Paketversand.FormCreate(Sender: TObject);
begin
  fProgrammPath := ExtractFilePath(ParamStr(0));
end;


procedure Tfrm_Paketversand.HTTPRIO1BeforeExecute(const MethodName: string;
  SOAPRequest: TStream);
var
  m: TMemoryStream;
begin //
  SOAPRequest.Position := 0;
  m := TMemoryStream.Create;
  m.LoadFromStream(SOAPRequest);
  m.SaveToFile('d:\Delphi\Tokyo\Test\DHL\Paketversand\Test 1\request.txt');
  SOAPRequest.Position := 0;
  FreeAndNil(m);
end;

procedure Tfrm_Paketversand.HttpRioHttpWebNodeBeforePost(
  const HTTPReqResp: THTTPReqResp; Data: Pointer);
begin
   if not InternetSetOption(Data,
                      INTERNET_OPTION_USERNAME,
                      PChar(HTTPReqResp.UserName),
                      Length(HTTPReqResp.UserName)) then
   begin
       ShowMessage(SysErrorMessage(GetLastError));
   end;

   if not InternetSetOption(Data,
                      INTERNET_OPTION_PASSWORD,
                      PChar(HTTPReqResp.Password),
                      Length (HTTPReqResp.Password)) then
  begin
       ShowMessage(SysErrorMessage(GetLastError));
  end;
end;

procedure Tfrm_Paketversand.Button1Click(Sender: TObject);
var
  x: GKVAPIServicePortType;
  v: Version;
  v1: Version;
  cs: CreateShipmentOrderRequest;
begin
  x := GetGKVAPIServicePortType(true);
 // v1 := Version.Create;
  v := x.getVersion(nil).Version;
  caption := v.majorRelease;
end;

procedure Tfrm_Paketversand.Button2Click(Sender: TObject);
var
  PostData: TStringList;
  res: string;
begin
  PostData := TStringList.Create;
  idhttp.Request.Username := 'nfs';
  idhttp.Request.Password := 'Jf0JQH7gmHpISf!';
  idhttp.Request.BasicAuthentication := true;
  //idhttp.Request.CustomHeaders.Add('SOAPAction: "urn:createShipmentOrder"');
  idhttp.Request.CustomHeaders.Add('SOAPAction: "urn:getVersion"');
  idhttp.Request.ContentType := 'text/xml;charset=UTF-8';
  idhttp.Request.ContentLength := 390;
  idhttp.Request.Host := 'cig.dhl.de';
  idhttp.Request.Connection := 'Keep-Alive';
  idhttp.Request.UserAgent := 'Apache-HttpClient/4.5.2 (Java/1.8.0_162)';
  res := IdHTTP.Post('https://cig.dhl.de/services/production/soap', PostData);
  Memo1.Lines.Text := res;
  FreeAndNil(PostData)
end;

procedure Tfrm_Paketversand.Button3Click(Sender: TObject);
var
  PostData: TStringList;
  res: string;
begin
  PostData := TStringList.Create;
  PostData.LoadFromFile(fProgrammPath + 'test1.txt');
  //Memo1.Lines.Text := PostData.Text;
//  idhttp.Request.Username := 'nfs';
 // idhttp.Request.Password := 'Jf0JQH7gmHpISf!';
  idhttp.Request.Username := '2222222222_01';
  idhttp.Request.Password := 'pass';
  idhttp.Request.BasicAuthentication := true;
  Idhttp.Request.Authentication.Username := 'nfs';
  IdHTTP.Request.Authentication.Password := 'Jf0JQH7gmHpISf!';
  idhttp.Request.CustomHeaders.Add('SOAPAction: "urn:getManifest"');
  idhttp.Request.ContentType := 'text/xml;charset=UTF-8';
  idhttp.Request.ContentLength := 733;
  idhttp.Request.Host := 'cig.dhl.de';
  idhttp.Request.Connection := 'Keep-Alive';
  idhttp.Request.UserAgent := 'Apache-HttpClient/4.5.2 (Java/1.8.0_162)';
  res := IdHTTP.Post('https://cig.dhl.de/services/production/soap', PostData);
  Memo1.Lines.Text := res;
  FreeAndNil(PostData)
end;


procedure Tfrm_Paketversand.Button4Click(Sender: TObject);
var
  PostData: TStringList;
  res: string;
begin
  PostData := TStringList.Create;
  PostData.LoadFromFile(fProgrammPath + 'version.txt');
  memo1.Lines.Text := PostData.Text;

  {
  idhttp.Request.CustomHeaders.Add('SOAPAction: "urn:getVersion"');
  idhttp.Request.ContentType := 'text/xml;charset=UTF-8';
  //idhttp.Request.ContentLength := Length(Postdata.Text);
  idhttp.Request.ContentLength := 0;
  idhttp.Request.Host := 'cig.dhl.de';
  idhttp.Request.Connection := 'Keep-Alive';
  //idhttp.Request.UserAgent := 'Apache-HttpClient/4.5.2 (Java/1.8.0_162)';
  //idhttp.Request.UserAgent := sDefaultUserAgent;
  idHttp.Request.AcceptEncoding := 'gzip,deflate';
  }

  idhttp.Request.Username := 'nfs';
  idhttp.Request.Password := 'Jf0JQH7gmHpISf!';
  idhttp.Request.BasicAuthentication := true;

  res := IdHTTP.Post('https://cig.dhl.de/services/sandbox/soap', fProgrammPath + 'version.txt');
//  res := IdHTTP.Post('https://cig.dhl.de/services/production/soap', PostData);

  Memo1.Lines.Text := res;
  FreeAndNil(PostData);
end;

procedure Tfrm_Paketversand.Button5Click(Sender: TObject);
var
  hAuthentification : Authentification;
  GKVAPI : GKVAPIServicePortType;
  GHTTPRIO : THTTPRIO;
  hRequest : CreateShipmentOrderRequest;
 // hResponse : CreateShipmentOrderResponse;
  v: Version;
  vg: GetVersionResponse;
begin

  GHTTPRIO := THTTPRIO.Create(nil);
  GHTTPRIO.HTTPWebNode.UserName := 'nfs'; // Applikations-ID (von DHL)
  GHTTPRIO.HTTPWebNode.Password := 'Jf0JQH7gmHpISf!'; // Applikations-Token (von DHL)
  //GHTTPRIO.HTTPWebNode.OnBeforePost := HttpRioHttpWebNodeBeforePost;


  {
  hAuthentification := Authentification.Create;
  hAuthentification.user := '2222222222_01'; // DHL-GK-Benutzername
  hAuthentification.signature := 'pass'; // DHL-GK-Passwort
  GHTTPRIO.SOAPHeaders.Send( hAuthentification);
  }

  GKVAPI := GetGKVAPIServicePortType(false, 'https://cig.dhl.de/services/sandbox/soap', GHTTPRIO);

  //GKVAPI := GetGKVAPIServicePortType( false, '', GHTTPRIO);

  v := Version.Create;
  {
  v.majorRelease := '?';
  v.minorRelease := '?';
  v.build := '?';
  }
  vg := GKVAPI.getVersion(v);

  Memo1.Lines.Text := vg.Version.majorRelease;


  //hResponse := GKVAPI.createShipmentOrder( hRequest);


end;

procedure Tfrm_Paketversand.Button6Click(Sender: TObject);
var
  PostData: TStringList;
  res: string;
begin
  PostData := TStringList.Create;
  PostData.LoadFromFile(fProgrammPath + 'createShipmentOrderV01PAK2.txt');
  Memo1.Lines.Text := PostData.Text;

  {
  idhttp.Request.CustomHeaders.Add('SOAPAction: "urn:createShipmentOrder"');
  idhttp.Request.ContentType := 'text/xml;charset=UTF-8';
  idhttp.Request.ContentLength := Length(PostData.Text);
  idhttp.Request.Host := 'cig.dhl.de';
  idhttp.Request.Connection := 'Keep-Alive';
  idHttp.Request.AcceptEncoding := 'gzip,deflate';
  }

  idhttp.Request.Username := 'nfs';
  idhttp.Request.Password := 'Jf0JQH7gmHpISf!';
  idhttp.Request.BasicAuthentication := true;

  res := IdHTTP.Post('https://cig.dhl.de/services/sandbox/soap', fProgrammPath + 'createShipmentOrderV01PAK2.txt');

  Memo1.Lines.Text := res;
  FreeAndNil(PostData)
end;

procedure Tfrm_Paketversand.Button7Click(Sender: TObject);
var
  hAuthentification : Authentification;
  GKVAPI : GKVAPIServicePortType;
  GHTTPRIO : THTTPRIO;
  hRequest : CreateShipmentOrderRequest;
  hResponse : CreateShipmentOrderResponse;
  x: Array_Of_ShipmentOrderType;
//  x : TArray<ShipmentOrderType>;
  so: ShipmentOrderType;
  v: Version;
  s: Shipment2;
  si: ShipmentItemType;
  Shipper: ShipperType;
  NativeAdress: NativeAddressType;
  aAdress: Array_Of_addressAddition;
  aAdress2: Array_Of_addressAddition2;
  co: CommunicationType;
  Receiver: ReceiverType;
  ReceiverNativAdress: ReceiverNativeAddressType;
  ServiceConf: Serviceconfiguration;
  swkg: weightInKG;
  nt: NameType;
  orig: Origin;
  ShipDet: ShipmentDetailsTypeType;
  ShipNot: ShipmentNotificationType;
begin

  GHTTPRIO := THTTPRIO.Create(nil);
  GHTTPRIO.HTTPWebNode.UserName := 'nfs'; // Applikations-ID (von DHL)
  GHTTPRIO.HTTPWebNode.Password := 'Jf0JQH7gmHpISf!'; // Applikations-Token (von DHL)

  hAuthentification := Authentification.Create;
  hAuthentification.user := '2222222222_01'; // DHL-GK-Benutzername
  hAuthentification.signature := 'pass'; // DHL-GK-Passwort
  GHTTPRIO.SOAPHeaders.Send( hAuthentification);

  GKVAPI := GetGKVAPIServicePortType(false, 'https://cig.dhl.de/services/sandbox/soap', GHTTPRIO);

  hRequest := CreateShipmentOrderRequest.Create;


  v := Version.Create;
  v.majorRelease := '2';
  v.minorRelease := '2';
  hRequest.Version := v;


  swkg := weightInKG.Create;
  swkg.DecimalString := '5.0';


  si := ShipmentItemType.Create;
  si.weightInKG := swkg;
  si.widthInCM  := 60;
  si.widthInCM := 30;
  si.heightInCM := 15;

  nt := NameType.Create;
  nt.name1 := 'Absender Zeile 1';
  nt.name2 := 'Absender Zeile 2';
  nt.name3 := 'Absender Zeile 3';


  Shipper := ShipperType.Create;
  Shipper.Name_ := nt;

  NativeAdress := NativeAddressType.Create;
  NativeAdress.streetName := 'Vegesacker Heerstr.';
  NativeAdress.streetNumber := '111';
  aAdress := NativeAdress.addressAddition;
  SetLength(aAdress, 1);
  aAdress[0] := '2.Etage';
  NativeAdress.addressAddition := aAdress;
  NativeAdress.dispatchingInformation := 'Abgangsinformation';
  NativeAdress.zip := '28757';
  NativeAdress.city := 'Bremen';


  orig := Origin.Create;
  orig.country := 'Germany';
  Orig.countryISOCode := 'DE';

  NativeAdress.Origin := Orig;

  Shipper.Address := NativeAdress;

  co := CommunicationType.Create;
  co.phone := '49421123456';
  co.email := 'Empfaengerin@muster.de';
  co.contactPerson  := 'Frau Empfänger';

  Shipper.Communication := co;


  ReceiverNativAdress := ReceiverNativeAddressType.Create;
  ReceiverNativAdress.name2 := 'Empfänger Zeile 2';
  ReceiverNativAdress.name3 := 'Empfänger Zeile 3';
  ReceiverNativAdress.streetName := 'Neu-Galliner-Ring';
  ReceiverNativAdress.streetNumber := '8';

  SetLength(aAdress2, 1);
  aAdress2[0] := '3. Etage';
  ReceiverNativAdress.addressAddition := aAdress2;
  ReceiverNativAdress.dispatchingInformation := '?';
  ReceiverNativAdress.zip := '19258';
  ReceiverNativAdress.city := 'Gallin';

  ReceiverNativAdress.Origin := orig;




  Receiver := ReceiverType.Create;
  Receiver.name1 := 'Empfänger Zeile 1';
  Receiver.Address := ReceiverNativAdress;
  Receiver.Communication := co;


  ShipNot := ShipmentNotificationType.Create;
  ShipNot.recipientEmailAddress := 'Absender@muster.de';



  ShipDet := ShipmentDetailsTypeType.Create;
  ShipDet.product := 'V01PAK';
  ShipDet.accountNumber := '22222222220101';
  ShipDet.customerReference := 'Kundennummer 123456';
  ShipDet.shipmentDate := '2018-12-31';
  ShipDet.ShipmentItem := si;
  ShipDet.Notification := ShipNot;



  s := Shipment2.Create;
  s.ShipmentDetails := ShipDet;
  S.Shipper := Shipper;
  s.Receiver := Receiver;



  ServiceConf := Serviceconfiguration.Create;
  ServiceConf.active := '1';

  x := hRequest.ShipmentOrder;
  setLength(x, 1);
  x[0] := ShipmentOrderType.Create;
  x[0].sequenceNumber := '123456';
  x[0].PrintOnlyIfCodeable := ServiceConf;
  X[0].labelResponseType := URL;


  hResponse := GKVAPI.createShipmentOrder(hRequest);

  Memo1.Lines.Text := hResponse.Status.statusText

  {
  so := ShipmentOrderType.Create;
  hRequest.ShipmentOrder[0] := so;
  }

end;

procedure Tfrm_Paketversand.Button8Click(Sender: TObject);
var
  Request: TDHLShipmentOrderRequestAPI;
  GKVAPI : GKVAPIServicePortType;
  GHTTPRIO : THTTPRIO;
  hAuthentification : Authentification;
  hResponse : CreateShipmentOrderResponse;
  i: integer;
begin
  Request := TDHLShipmentOrderRequestAPI.Create;
  FillShipmentOrderRequest(Request);


  GHTTPRIO := THTTPRIO.Create(nil);
  GHTTPRIO.HTTPWebNode.UserName := 'nfs'; // Applikations-ID (von DHL)
  GHTTPRIO.HTTPWebNode.Password := 'Jf0JQH7gmHpISf!'; // Applikations-Token (von DHL)
  GHTTPRIO.OnBeforeExecute := HTTPRIO1BeforeExecute;

  hAuthentification := Authentification.Create;
  hAuthentification.user := '2222222222_01'; // DHL-GK-Benutzername
  hAuthentification.signature := 'pass'; // DHL-GK-Passwort
  GHTTPRIO.SOAPHeaders.Send( hAuthentification);

  GKVAPI := GetGKVAPIServicePortType(false, 'https://cig.dhl.de/services/sandbox/soap', GHTTPRIO);

  {
  Memo1.Clear;
  Memo1.Lines.Add(Request.Request.ShipmentOrder[0].sequenceNumber);
  Memo1.Lines.Add(Request.Request.ShipmentOrder[0].Shipment.ShipmentDetails.Notification.recipientEmailAddress);

  Memo1.Lines.Add(Request.Request.ShipmentOrder[0].Shipment.Receiver.Address.name2);
  }
  hResponse := GKVAPI.createShipmentOrder(Request.Request);





  Memo1.Lines.Text := hResponse.Status.statusText;
  Memo1.Lines.Add(InttoStr(hResponse.Status.statusCode));

  for i := low(hResponse.Status.statusMessage) to High(hResponse.Status.statusMessage) do
  begin
    Memo1.Lines.Add(hResponse.Status.statusMessage[i]);
  end;


  //FreeAndNil(GHTTPRIO);


  //FreeAndNil(Request);

end;



procedure Tfrm_Paketversand.Button9Click(Sender: TObject);
var
  Request: TDHLShipmentOrderRequestAPI;
begin
  Request := TDHLShipmentOrderRequestAPI.Create;
  FreeAndNil(Request);
end;

procedure Tfrm_Paketversand.FillShipmentOrderRequest(R: TDHLShipmentOrderRequestAPI);
begin
  R.Version.majorRelease := 2;
  R.Version.minorRelease := 2;
  R.ShipmentOrder.sequenceNumber := '123456';
  r.ShipmentOrder.Shipment.Shipmentdetails.Product := 'V01PAK';
  r.ShipmentOrder.Shipment.Shipmentdetails.AccountNumber := '22222222220101';
  r.ShipmentOrder.Shipment.Shipmentdetails.CustomerReference := 'Kundennummer 123456';
  r.ShipmentOrder.Shipment.Shipmentdetails.ShipmentDate := StrToDate('31.12.2018');
  {
  r.ShipmentOrder.Shipment.Shipmentdetails.ShipmentItem.WeightKG := 5;
  r.ShipmentOrder.Shipment.Shipmentdetails.ShipmentItem.LengthCM := 60;
  r.ShipmentOrder.Shipment.Shipmentdetails.ShipmentItem.WidthCM  := 30;
  r.ShipmentOrder.Shipment.Shipmentdetails.ShipmentItem.HeightCM := 15;
  }

  r.ShipmentOrder.Shipment.Shipmentdetails.ShipmentItem.WeightKG := 5;
  r.ShipmentOrder.Shipment.Shipmentdetails.ShipmentItem.LengthCM := 0;
  r.ShipmentOrder.Shipment.Shipmentdetails.ShipmentItem.WidthCM  := 0;
  r.ShipmentOrder.Shipment.Shipmentdetails.ShipmentItem.HeightCM := 0;


  r.ShipmentOrder.Shipment.Shipmentdetails.Notification.recipientEmailAddress := 'Absender@muster.de';
  r.ShipmentOrder.Shipment.Shipper.Name.Name1 := 'Absender Zeile 1';
  r.ShipmentOrder.Shipment.Shipper.Name.Name2 := 'Absender Zeile 2';
  r.ShipmentOrder.Shipment.Shipper.Name.Name3 := 'Absender Zeile 3';
  r.ShipmentOrder.Shipment.Shipper.Adress.StreetName := 'Vegesacker Heerstr.';
  r.ShipmentOrder.Shipment.Shipper.Adress.StreetNumber := '111';
  r.ShipmentOrder.Shipment.Shipper.Adress.AddressAddition := '2.Etage';
  r.ShipmentOrder.Shipment.Shipper.Adress.DispatchingInformation := 'Abgangsinformation';
  r.ShipmentOrder.Shipment.Shipper.Adress.Zip := '28757';
  r.ShipmentOrder.Shipment.Shipper.Adress.City := 'Bremen';
  r.ShipmentOrder.Shipment.Shipper.Adress.Origin.Country := 'Germany';
  r.ShipmentOrder.Shipment.Shipper.Adress.Origin.CountryISOCode := 'DE';
  r.ShipmentOrder.Shipment.Shipper.Communication.Phone := '+49421123456';
  r.ShipmentOrder.Shipment.Shipper.Communication.EMail := 'Empfaengerin@muster.de';
  r.ShipmentOrder.Shipment.Shipper.Communication.ContactPerson := 'Frau Empfänger';
  r.ShipmentOrder.Shipment.Receiver.Name1 := 'Empfänger Zeile 1';
  r.ShipmentOrder.Shipment.Receiver.Address.Name2 := 'Empfänger Zeile 2';
  r.ShipmentOrder.Shipment.Receiver.Address.Name3 := 'Empfänger Zeile 3';
  r.ShipmentOrder.Shipment.Receiver.Address.StreetName := 'Neu-Galliner-Ring';
  r.ShipmentOrder.Shipment.Receiver.Address.StreetNumber := '8';
  r.ShipmentOrder.Shipment.Receiver.Address.AddressAddition := '3. Etage';
  r.ShipmentOrder.Shipment.Receiver.Address.DispatchingInformation := '?';
  r.ShipmentOrder.Shipment.Receiver.Address.Zip := '19258';
  r.ShipmentOrder.Shipment.Receiver.Address.City := 'Gallin';
  r.ShipmentOrder.Shipment.Receiver.Address.Origin.Country := 'Germany';
  r.ShipmentOrder.Shipment.Receiver.Address.Origin.CountryISOCode := 'DE';
  r.ShipmentOrder.Shipment.Receiver.Address.Origin.State := '?';
  r.ShipmentOrder.Shipment.Receiver.Communication.Phone := '+49421123456789';
  r.ShipmentOrder.Shipment.Receiver.Communication.EMail := 'empfaengerin@muster.de';
  r.ShipmentOrder.Shipment.Receiver.Communication.ContactPerson := 'Frau Empfängerin';

  r.ShipmentOrder.PrintOnlyIfCodeable.Active := '1';


end;


end.
