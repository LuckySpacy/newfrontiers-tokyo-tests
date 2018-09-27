program Paketversand;

uses
  Vcl.Forms,
  From.Paketversand in 'From.Paketversand.pas' {frm_Paketversand},
  geschaeftskundenversand_api_2 in 'geschaeftskundenversand_api_2.pas',
  Objekt.DHLShipmentOrderRequestAPI in 'Objekt\Objekt.DHLShipmentOrderRequestAPI.pas',
  Objekt.DHLVersion in 'Objekt\Objekt.DHLVersion.pas',
  Objekt.DHLShipmentorder in 'Objekt\Objekt.DHLShipmentorder.pas',
  Objekt.DHLServiceconfiguration in 'Objekt\Objekt.DHLServiceconfiguration.pas',
  Objekt.DHLShipment2 in 'Objekt\Objekt.DHLShipment2.pas',
  Objekt.DHLShipmentdetails in 'Objekt\Objekt.DHLShipmentdetails.pas',
  Objekt.DHLShipmentItem in 'Objekt\Objekt.DHLShipmentItem.pas',
  Objekt.DHLShipmentNotification in 'Objekt\Objekt.DHLShipmentNotification.pas',
  Objekt.DHLShipper in 'Objekt\Objekt.DHLShipper.pas',
  Objekt.DHLNameType in 'Objekt\Objekt.DHLNameType.pas',
  Objekt.DHLNativeAdress in 'Objekt\Objekt.DHLNativeAdress.pas',
  Objekt.DHLOrigin in 'Objekt\Objekt.DHLOrigin.pas',
  Objekt.DHLCommunication in 'Objekt\Objekt.DHLCommunication.pas',
  Objekt.DHLReceiver in 'Objekt\Objekt.DHLReceiver.pas',
  Objekt.DHLReceiverNativeAddress in 'Objekt\Objekt.DHLReceiverNativeAddress.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_Paketversand, frm_Paketversand);
  Application.Run;
end.
