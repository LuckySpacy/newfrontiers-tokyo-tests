unit Objekt.DHLSend;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Objekt.DHLShipmentOrderRequestAPI, geschaeftskundenversand_api_2,
 Soap.InvokeRegistry, Soap.Rio, Soap.SOAPHTTPClient, Objekt.DHLShipmentorderResponse,
 Objekt.DHLShipmentorderResponseList, Objekt.DHLVersionResponse,
 Objekt.DHLValidateShipmentorderRequestAPI, Objekt.DHLValidateShipmentOrderResponse,
 Objekt.DHLValidateState;

type
  TDHLSend = class
  private
    fUsername: string;
    fcisUser: string;
    fPassword: string;
    fcisSignature: string;
    fUrl: string;
    fXMLFilename: string;
    fShipmentorderResponseList: TDHLShipmentorderResponseList;
    fVersionResponse: TDHLVersionResponse;
    fValidateShipmentResponse: TDHLValidateShipmentOrderResponse;
    procedure HTTPRIOBeforeExecute(const MethodName: string; SOAPRequest: TStream);
  public
    constructor Create;
    destructor Destroy; override;
    function SendShipmentOrder(aShipmentOrderRequestAPI: TDHLShipmentOrderRequestAPI; aXMLFilename: string): TDHLShipmentorderResponseList;
    function SendValidateShipmentOrder(aValidateShipmentOrderRequestAPI: TDHLValidateShipmentorderRequestAPI; aXMLFilename: string): TDHLValidateShipmentorderResponse;
    function getVersion: TDHLVersionResponse;
    property Username: string read fUsername write fUsername;
    property Password: string read fPassword write fPassword;
    property cisUser: string read fcisUser write fcisUser;
    property cisSignature: string read fcisSignature write fcisSignature;
    property Url: string read fUrl write fUrl;
  end;

implementation

{ TDHLSend }

constructor TDHLSend.Create;
begin
  fUsername      := '';
  fcisUser      := '';
  fPassword      := '';
  fcisSignature := '';
  fUrl := '';
  fShipmentorderResponseList := TDHLShipmentorderResponseList.Create;
  fVersionResponse := TDHLVersionResponse.Create;
  fValidateShipmentResponse := TDHLValidateShipmentOrderResponse.Create;
end;

destructor TDHLSend.Destroy;
begin
  FreeAndNil(fShipmentorderResponseList);
  FreeAndNil(fVersionResponse);
  FreeAndNil(fValidateShipmentResponse);
  inherited;
end;


function TDHLSend.getVersion: TDHLVersionResponse;
var
  GHTTPRIO : THTTPRIO;
  GKVAPI : GKVAPIServicePortType;
  v: Version;
  Response: GetVersionResponse;
begin
  GHTTPRIO := THTTPRIO.Create(nil);
  GHTTPRIO.HTTPWebNode.UserName := fUsername;
  GHTTPRIO.HTTPWebNode.Password := fPassword;
  GHTTPRIO.OnBeforeExecute := HTTPRIOBeforeExecute;
  GKVAPI := GetGKVAPIServicePortType(false, fUrl, GHTTPRIO);

  v := Version.Create;
  Response := GKVAPI.getVersion(v);
  fVersionResponse.majorRelease := Response.Version.majorRelease;
  fVersionResponse.minorRelease := Response.Version.minorRelease;
  fVersionResponse.Build        := Response.Version.build;

  FreeAndNil(Response);
  FreeAndNil(v);

  Result := fVersionResponse;

end;

function TDHLSend.SendShipmentOrder(aShipmentOrderRequestAPI: TDHLShipmentOrderRequestAPI; aXMLFilename: string): TDHLShipmentorderResponseList;
var
  GHTTPRIO : THTTPRIO;
  hAuthentification : Authentification;
  Response : CreateShipmentOrderResponse;
  GKVAPI : GKVAPIServicePortType;
  ResList: TStringList;
  i: Integer;
  cs: CreationState;
  ShipmentorderResponse: TDHLShipmentorderResponse;
begin
  fXMLFilename := Trim(aXMLFilename);

  GHTTPRIO := THTTPRIO.Create(nil);
  try
    GHTTPRIO.HTTPWebNode.UserName := fUsername;
    GHTTPRIO.HTTPWebNode.Password := fPassword;
    GHTTPRIO.OnBeforeExecute := HTTPRIOBeforeExecute;

    hAuthentification := Authentification.Create;
    hAuthentification.user := fcisUser;
    hAuthentification.signature := fcisSignature;
    GHTTPRIO.SOAPHeaders.Send(hAuthentification);

    GKVAPI := GetGKVAPIServicePortType(false, fUrl, GHTTPRIO);
    Response := GKVAPI.createShipmentOrder(aShipmentOrderRequestAPI.Request);

    fShipmentorderResponseList.Clear;

    ResList := TStringList.Create;
    try
      fShipmentorderResponseList.StatusText := Response.Status.statusText;
      fShipmentorderResponseList.StatusCode := Response.Status.statusCode;
      fShipmentorderResponseList.StatusMessage := Response.Status.statusMessage[0];

      for i := low(Response.CreationState) to High(Response.CreationState) do
      begin
        ShipmentorderResponse := fShipmentorderResponseList.Add;
        cs := Response.CreationState[i];
        ShipmentorderResponse.SequenceNumber     := cs.sequenceNumber;
        ShipmentorderResponse.LabelStatusCode    := cs.LabelData.Status.statusCode;
        ShipmentorderResponse.LabelStatusText    := cs.LabelData.Status.statusText;
        ShipmentorderResponse.LabelStatusMessage := cs.LabelData.Status.statusMessage[0];
        ShipmentorderResponse.ShipmentNumber     := cs.LabelData.shipmentNumber;
        ShipmentorderResponse.LabelUrl           := cs.LabelData.labelUrl;
        ShipmentorderResponse.ReturnLabelUrl     := cs.LabelData.returnLabelUrl;
        ShipmentorderResponse.ExportLabelUrl     := cs.LabelData.exportLabelUrl;
        ShipmentorderResponse.CodLabelUrl        := cs.LabelData.codLabelUrl;
      end;

      {
      ResList.Add('StatusText='+ Response.Status.statusText);
      ResList.Add('StatusCode='+ IntToStr(Response.Status.statusCode));
      for i := low(Response.Status.statusMessage) to High(Response.Status.statusMessage) do
        ResList.Add('Message' + IntToStr(i) + '=' + Response.Status.statusMessage[i]);
      for i := low(Response.CreationState) to High(Response.CreationState) do
      begin
        cs := Response.CreationState[i];
        ResList.Add('sequenceNumber' + IntToStr(i) + '=' + cs.sequenceNumber);
        ResList.Add('LabelData.Status.statusCode' + IntToStr(i) + '=' + IntToStr(cs.LabelData.Status.statusCode));
        ResList.Add('LabelData.Status.statusText' + IntToStr(i) + '=' + cs.LabelData.Status.statusText);
        for i2 := Low(cs.LabelData.Status.statusMessage) to High(cs.LabelData.Status.statusMessage) do
          ResList.Add('LabelData.Status.statusMessage' + IntToStr(i2) + '=' + cs.LabelData.Status.statusMessage[i2]);
        ResList.Add('LabelData.shipmentNumber' + IntToStr(i) + '=' + cs.LabelData.shipmentNumber);
        ResList.Add('LabelData.labelUrl' + IntToStr(i) + '=' + cs.LabelData.labelUrl);
        ResList.Add('LabelData.returnlabelUrl' + IntToStr(i) + '=' + cs.LabelData.returnLabelUrl);
        ResList.Add('LabelData.exportlabelUrl' + IntToStr(i) + '=' + cs.LabelData.exportLabelUrl);
        ResList.Add('LabelData.codlabelUrl' + IntToStr(i) + '=' + cs.LabelData.codLabelUrl);
      end;
      }

      Result := fShipmentorderResponseList;
    finally
      FreeAndNil(ResList);
      FreeAndNil(Response);
      FreeAndNil(hAuthentification);
    end;
  finally
    //FreeAndNil(GHTTPRIO);
  end;

end;



function TDHLSend.SendValidateShipmentOrder(
  aValidateShipmentOrderRequestAPI: TDHLValidateShipmentorderRequestAPI;
  aXMLFilename: string): TDHLValidateShipmentorderResponse;
var
  GHTTPRIO : THTTPRIO;
  hAuthentification : Authentification;
  Response : ValidateShipmentResponse;
  GKVAPI : GKVAPIServicePortType;
  i: Integer;
  ValidateState: TDHLValidateState;
begin
  GHTTPRIO := THTTPRIO.Create(nil);
  GHTTPRIO.HTTPWebNode.UserName := fUsername;
  GHTTPRIO.HTTPWebNode.Password := fPassword;
  GHTTPRIO.OnBeforeExecute := HTTPRIOBeforeExecute;

  hAuthentification := Authentification.Create;
  hAuthentification.user := fcisUser;
  hAuthentification.signature := fcisSignature;
  GHTTPRIO.SOAPHeaders.Send(hAuthentification);

  GKVAPI := GetGKVAPIServicePortType(false, fUrl, GHTTPRIO);
  Response := GKVAPI.validateShipment(aValidateShipmentOrderRequestAPI.Request);


  fValidateShipmentResponse.Version.majorRelease := Response.Version.majorRelease;
  fValidateShipmentResponse.Version.minorRelease := Response.Version.minorRelease;
  fValidateShipmentResponse.Version.Build        := Response.Version.build;

  fValidateShipmentResponse.Status.StatusCode := Response.Status.statusCode;
  fValidateShipmentResponse.Status.StatusText := Response.Status.statusText;
  fValidateShipmentResponse.Status.StatusMessage := Response.Status.statusMessage[0];

  fValidateShipmentResponse.ValidationState.Clear;
  for i := Low(Response.ValidationState) to High(Response.ValidationState) do
  begin
    ValidateState := fValidateShipmentResponse.ValidationState.Add;
    ValidateState.Status.StatusCode    := Response.ValidationState[i].Status.statusCode;
    ValidateState.Status.StatusText    := Response.ValidationState[i].Status.statusText;
    ValidateState.Status.StatusMessage := Response.ValidationState[i].Status.statusMessage[0];
    ValidateState.SequenceNumber := Response.ValidationState[i].sequenceNumber;
  end;

  FreeAndNil(Response);
  FreeAndNil(hAuthentification);

  Result := fValidateShipmentResponse;

end;

procedure TDHLSend.HTTPRIOBeforeExecute(const MethodName: string; SOAPRequest: TStream);
var
  m: TMemoryStream;
begin
  if fXMLFilename = '' then
    exit;
  SOAPRequest.Position := 0;
  m := TMemoryStream.Create;
  m.LoadFromStream(SOAPRequest);
  m.SaveToFile(fXMLFilename);
  SOAPRequest.Position := 0;
  FreeAndNil(m);
end;


end.
