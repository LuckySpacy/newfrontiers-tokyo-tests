unit Objekt.DHLSend;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Objekt.DHLShipmentOrderRequestAPI, geschaeftskundenversand_api_2,
 Soap.InvokeRegistry, Soap.Rio, Soap.SOAPHTTPClient;

type
  TDHLSend = class
  private
    fUsername: string;
    fcisUser: string;
    fPassword: string;
    fcisSignature: string;
    fUrl: string;
    fXMLFilename: string;
    procedure HTTPRIOBeforeExecute(const MethodName: string; SOAPRequest: TStream);
  public
    constructor Create;
    destructor Destroy; override;
    function SendShipmentOrder(aShipmentOrderRequestAPI: TDHLShipmentOrderRequestAPI; aXMLFilename: string): string;
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
end;

destructor TDHLSend.Destroy;
begin

  inherited;
end;


function TDHLSend.SendShipmentOrder(aShipmentOrderRequestAPI: TDHLShipmentOrderRequestAPI; aXMLFilename: string): string;
var
  GHTTPRIO : THTTPRIO;
  hAuthentification : Authentification;
  Response : CreateShipmentOrderResponse;
  GKVAPI : GKVAPIServicePortType;
  ResList: TStringList;
  i, i2: Integer;
  cs: CreationState;
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

    ResList := TStringList.Create;
    try
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
      Result := ResList.Text;
    finally
      FreeAndNil(ResList);
      FreeAndNil(Response);
      FreeAndNil(hAuthentification);
    end;
  finally
    //FreeAndNil(GHTTPRIO);
  end;

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
