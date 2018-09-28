unit Frame.DHLValidateShipmentOrder;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Objekt.DHLValidateShipmentOrder, Objekt.DHLValidateShipmentOrderRequestAPI,
  Objekt.DHLValidateShipmentOrderResponse;

type
  Tfra_DHLValidateShipmentOrder = class(TFrame)
    Panel1: TPanel;
    btn_ErzeugeShipmentorder: TButton;
    Memo1: TMemo;
    procedure btn_ErzeugeShipmentorderClick(Sender: TObject);
  private
    procedure SendeValidateShipmentOrder;
    procedure FillValidateShipmentOrderRequest(r: TDHLValidateShipmentOrderRequestAPI);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

{$R *.dfm}

uses
  Objekt.Allgemein;


{ Tfra_DHLValidateShipmentOrder }

procedure Tfra_DHLValidateShipmentOrder.btn_ErzeugeShipmentorderClick(
  Sender: TObject);
begin
  SendeValidateShipmentOrder;
end;

constructor Tfra_DHLValidateShipmentOrder.Create(AOwner: TComponent);
begin
  inherited;

end;

destructor Tfra_DHLValidateShipmentOrder.Destroy;
begin

  inherited;
end;

procedure Tfra_DHLValidateShipmentOrder.SendeValidateShipmentOrder;
var
  ValidateShipmentOrder: TDHLValidateShipmentOrderRequestAPI;
  Cur: TCursor;
  Response: TDHLValidateShipmentorderResponse;
  i1: Integer;
  Filename: string;
begin
  Cur := Screen.Cursor;
  ValidateShipmentOrder := TDHLValidateShipmentOrderRequestAPI.Create;
  try
    Screen.Cursor := crHourGlass;
    FillValidateShipmentOrderRequest(ValidateShipmentOrder);
    Response := AllgemeinObj.DHLSend.SendValidateShipmentOrder(ValidateShipmentOrder, AllgemeinObj.DownloadPath + 'ValidateShipmentOrder.xml');
    Memo1.Clear;
    Memo1.Lines.Add('Statustext = ' + Response.Status.StatusText);
    Memo1.Lines.Add('Statuscode = ' + IntToStr(Response.Status.StatusCode));
    Memo1.Lines.Add('Statusmessage = ' + Response.Status.StatusMessage);
    for i1 := 0 to Response.ValidationState.Count -1 do
    begin
      Memo1.Lines.Add('SequenceNumber = ' + Response.ValidationState.Item[i1].SequenceNumber);
      Memo1.Lines.Add('ValidationStatuscode = ' + IntToStr(Response.ValidationState.Item[i1].Status.StatusCode));
      Memo1.Lines.Add('ValidationStatusText = ' + Response.ValidationState.Item[i1].Status.StatusText);
      Memo1.Lines.Add('ValidationStatusmessage = ' + Response.ValidationState.Item[i1].Status.StatusMessage);
    end;

  finally
    FreeAndNil(ValidateShipmentOrder);
    Screen.Cursor := cur;
  end;
end;


procedure Tfra_DHLValidateShipmentOrder.FillValidateShipmentOrderRequest(r: TDHLValidateShipmentOrderRequestAPI);
var
  s: TDHLValidateShipmentOrder;
begin
  s := r.ShipmentOrder;
  s.sequenceNumber := '1';
  s.PrintOnlyIfCodeable.Active := '1';
  s.Shipment.Shipmentdetails.Product := 'V01PAK';
  s.Shipment.Shipmentdetails.AccountNumber := '22222222220101';
  s.Shipment.Shipmentdetails.CustomerReference := 'Kundennummer 123456';
  s.Shipment.Shipmentdetails.ShipmentDate := StrToDate('31.12.2018');
  {
  r.ShipmentOrder.Shipment.Shipmentdetails.ShipmentItem.WeightKG := 5;
  r.ShipmentOrder.Shipment.Shipmentdetails.ShipmentItem.LengthCM := 60;
  r.ShipmentOrder.Shipment.Shipmentdetails.ShipmentItem.WidthCM  := 30;
  r.ShipmentOrder.Shipment.Shipmentdetails.ShipmentItem.HeightCM := 15;
  }

  s.Shipment.Shipmentdetails.ShipmentItem.WeightKG := 5;
  s.Shipment.Shipmentdetails.ShipmentItem.LengthCM := 0;
  s.Shipment.Shipmentdetails.ShipmentItem.WidthCM  := 0;
  s.Shipment.Shipmentdetails.ShipmentItem.HeightCM := 0;


  s.Shipment.Shipmentdetails.Notification.recipientEmailAddress := 'Absender@muster.de';
  s.Shipment.Shipper.Name.Name1 := 'Absender Zeile 1';
  s.Shipment.Shipper.Name.Name2 := 'Absender Zeile 2';
  s.Shipment.Shipper.Name.Name3 := 'Absender Zeile 3';
  s.Shipment.Shipper.Adress.StreetName := 'Vegesacker Heerstr.';
  s.Shipment.Shipper.Adress.StreetNumber := '111';
  s.Shipment.Shipper.Adress.AddressAddition := '2.Etage';
  s.Shipment.Shipper.Adress.DispatchingInformation := 'Abgangsinformation';
  s.Shipment.Shipper.Adress.Zip := '28757';
  s.Shipment.Shipper.Adress.City := 'Bremen';
  s.Shipment.Shipper.Adress.Origin.Country := 'Germany';
  s.Shipment.Shipper.Adress.Origin.CountryISOCode := 'DE';
  s.Shipment.Shipper.Communication.Phone := '+49421123456';
  s.Shipment.Shipper.Communication.EMail := 'Empfaengerin@muster.de';
  s.Shipment.Shipper.Communication.ContactPerson := 'Frau Empfänger';
  s.Shipment.Receiver.Name1 := 'Empfänger Zeile 1';
  s.Shipment.Receiver.Address.Name2 := 'Empfänger Zeile 2';
  s.Shipment.Receiver.Address.Name3 := 'Empfänger Zeile 3';
  s.Shipment.Receiver.Address.StreetName := 'Neu-Galliner-Ring';
  s.Shipment.Receiver.Address.StreetNumber := '8';
  s.Shipment.Receiver.Address.AddressAddition := '3. Etage';
  s.Shipment.Receiver.Address.DispatchingInformation := '?';
  s.Shipment.Receiver.Address.Zip := '19258';
  s.Shipment.Receiver.Address.City := 'Gallin';
  s.Shipment.Receiver.Address.Origin.Country := 'Germany';
  s.Shipment.Receiver.Address.Origin.CountryISOCode := 'DE';
  s.Shipment.Receiver.Address.Origin.State := '?';
  s.Shipment.Receiver.Communication.Phone := '+49421123456789';
  s.Shipment.Receiver.Communication.EMail := 'empfaengerin@muster.de';
  s.Shipment.Receiver.Communication.ContactPerson := 'Frau Empfängerin';
end;

end.
