program Paketversand;

{$R *.res}

uses
  FastMM4 in '..\..\..\..\FastMM\FastMM4.pas',
  FastMM4Messages in '..\..\..\..\FastMM\FastMM4Messages.pas',
  Vcl.Forms,
  Form.Paketversand in 'Form.Paketversand.pas' {Form1},
  Objekt.Allgemein in '..\Objekt\Objekt.Allgemein.pas',
  Objekt.Ini in '..\Objekt\Objekt.Ini.pas',
  Allgemein.Funktionen in '..\Allgemein\Allgemein.Funktionen.pas',
  Allgemein.RegIni in '..\Allgemein\Allgemein.RegIni.pas',
  Allgemein.SysFolderlocation in '..\Allgemein\Allgemein.SysFolderlocation.pas',
  Allgemein.System in '..\Allgemein\Allgemein.System.pas',
  {$R}
  Allgemein.Types in '..\Allgemein\Allgemein.Types.pas' {$R *.res},
  Objekt.DHLShipmentOrderRequestAPI in '..\Objekt\DHL\Objekt.DHLShipmentOrderRequestAPI.pas',
  geschaeftskundenversand_api_2 in '..\wsdl\dhl\geschaeftskundenversand_api_2.pas',
  Frame.DHLVersion in '..\Frame\Frame.DHLVersion.pas' {fra_DHLVersion: TFrame},
  Frame.DHLShipmentOrder in '..\Frame\Frame.DHLShipmentOrder.pas' {fra_DHLShipmentOrder: TFrame},
  Objekt.DHLSend in '..\Objekt\DHL\Objekt.DHLSend.pas',
  Objekt.DHLShipmentorderResponse in '..\Objekt\DHL\Objekt.DHLShipmentorderResponse.pas';

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
