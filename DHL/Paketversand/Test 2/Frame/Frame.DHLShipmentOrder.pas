unit Frame.DHLShipmentOrder;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Objekt.DHLShipmentOrderRequestAPI, Objekt.DHLShipmentorderResponseList,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  Objekt.Downloadfile;

type
  Tfra_DHLShipmentOrder = class(TFrame)
    Panel1: TPanel;
    btn_ErzeugeShipmentorder: TButton;
    Memo1: TMemo;
    procedure btn_ErzeugeShipmentorderClick(Sender: TObject);
  private
    fDownloadfile: TDownloadfile;
    procedure SendeShipmentOrder;
    procedure FillShipmentOrderRequest(R: TDHLShipmentOrderRequestAPI);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

{$R *.dfm}

{ TFrame1 }

uses
  Objekt.Allgemein;


constructor Tfra_DHLShipmentOrder.Create(AOwner: TComponent);
begin
  inherited;
  Memo1.Clear;
  fDownloadfile := TDownloadfile.Create;
end;

destructor Tfra_DHLShipmentOrder.Destroy;
begin
  FreeAndNil(fDownloadfile);
  inherited;
end;


procedure Tfra_DHLShipmentOrder.btn_ErzeugeShipmentorderClick(Sender: TObject);
begin
  SendeShipmentOrder;
end;


procedure Tfra_DHLShipmentOrder.SendeShipmentOrder;
var
  ShipmentOrder: TDHLShipmentOrderRequestAPI;
  Cur: TCursor;
  ResponseList: TDHLShipmentorderResponseList;
  i1: Integer;
  Filename: string;
begin
  Cur := Screen.Cursor;
  ShipmentOrder := TDHLShipmentOrderRequestAPI.Create;
  try
    Screen.Cursor := crHourGlass;
    FillShipmentOrderRequest(ShipmentOrder);
    ResponseList := AllgemeinObj.DHLSend.SendShipmentOrder(ShipmentOrder, AllgemeinObj.DownloadPath + 'ShipmentOrder.xml');
    Memo1.Clear;
    Memo1.Lines.Add('Statustext = ' + ResponseList.StatusText);
    Memo1.Lines.Add('Statuscode = ' + IntToStr(ResponseList.StatusCode));
    Memo1.Lines.Add('Statusmessage = ' + ResponseList.StatusMessage);
    for i1 := 0 to ResponseList.Count -1 do
    begin
      Memo1.Lines.Add('ShipmentNumber = ' + ResponseList.Item[i1].ShipmentNumber);
      Memo1.Lines.Add('SequenceNumber = ' + ResponseList.Item[i1].SequenceNumber);
      Memo1.Lines.Add('LabelStatusText = ' + ResponseList.Item[i1].LabelStatusText);
      Memo1.Lines.Add('LabelStatusCode = ' + IntToStr(ResponseList.Item[i1].LabelStatusCode));
      Memo1.Lines.Add('LabelStatusMessage = ' + ResponseList.Item[i1].LabelStatusMessage);
      Memo1.Lines.Add('LabelUrl = ' + ResponseList.Item[i1].LabelUrl);
      Memo1.Lines.Add('ReturnLabelUrl = ' + ResponseList.Item[i1].ReturnLabelUrl);
      Memo1.Lines.Add('ExportLabelUrl = ' + ResponseList.Item[i1].ExportLabelUrl);
      Memo1.Lines.Add('CodLabelUrl = ' + ResponseList.Item[i1].CodLabelUrl);
    end;

    for i1 := 0 to ResponseList.Count -1 do
    begin
      Filename := 'Label_' + ResponseList.Item[i1].ShipmentNumber + '.pdf';
      if (ResponseList.StatusCode = 0) and (ResponseList.Item[i1].LabelStatusCode = 0) then
        fDownloadfile.Download(ResponseList.Item[i1].LabelUrl, AllgemeinObj.DownloadPath + Filename);
    end;


  finally
    FreeAndNil(ShipmentOrder);
    Screen.Cursor := cur;
  end;
end;



procedure Tfra_DHLShipmentOrder.FillShipmentOrderRequest(R: TDHLShipmentOrderRequestAPI);
begin
  R.Version.majorRelease := '2';
  R.Version.minorRelease := '2';
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
