unit Form.Paketversand;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Objekt.Allgemein,
  Vcl.StdCtrls, Vcl.ExtCtrls, Frame.DHLVersion, Frame.DHLShipmentOrder,
  Soap.InvokeRegistry, Soap.Rio, Soap.SOAPHTTPClient, Frame.DHLValidateShipmentOrder,
  Frame.Sendungsverfolgung;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    tbs_Einstellung: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edt_Authentication_User: TEdit;
    edt_Authentication_Password: TEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    edt_cis_User: TEdit;
    edt_cis_Password: TEdit;
    tbs_Version: TTabSheet;
    Label5: TLabel;
    edt_Url: TEdit;
    tbs_ShipmentOrder: TTabSheet;
    HTTPRIO1: THTTPRIO;
    tbs_ValidateShipmentOrder: TTabSheet;
    tbs_Sendungsverfolgung: TTabSheet;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    fFrameDHLVersion: Tfra_DHLVersion;
    fFrameDHLShipmentOrder: TFra_DHLShipmentOrder;
    fFrameDHLValidateShipmentOrder: Tfra_DHLValidateShipmentOrder;
    fFrameSendungsverfolgung: Tfra_Sendungsverfolgung;
    procedure SaveEinstellung;
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  Objekt.DHLShipmentOrderRequestAPI;


procedure TForm1.FormCreate(Sender: TObject);
begin
  AllgemeinObj := TAllgemeinObj.Create;

  fFrameDHLVersion := Tfra_DHLVersion.Create(Self);
  fFrameDHLVersion.Parent := tbs_Version;
  fFrameDHLVersion.Align := alClient;

  fFrameDHLShipmentOrder := Tfra_DHLShipmentOrder.Create(Self);
  fFrameDHLShipmentOrder.Parent := tbs_ShipmentOrder;
  fFrameDHLShipmentOrder.Align := alClient;

  fFrameDHLValidateShipmentOrder := Tfra_DHLValidateShipmentOrder.Create(Self);
  fFrameDHLValidateShipmentOrder.Parent := tbs_ValidateShipmentOrder;
  fFrameDHLValidateShipmentOrder.Align := alClient;

  fFrameSendungsverfolgung := Tfra_Sendungsverfolgung.Create(Self);
  fFrameSendungsverfolgung.Parent := tbs_Sendungsverfolgung;
  fFrameSendungsverfolgung.Align := alClient;



end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FreeAndNil(AllgemeinObj);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  edt_Authentication_User.Text := AllgemeinObj.Ini.Authentication_User;
  edt_Authentication_Password.Text := AllgemeinObj.Ini.Authentication_Password;
  edt_cis_User.Text := AllgemeinObj.Ini.cis_User;
  edt_cis_Password.Text := AllgemeinObj.Ini.cis_Password;
  edt_Url.Text := AllgemeinObj.Ini.Url;
end;

procedure TForm1.SaveEinstellung;
begin
  AllgemeinObj.Ini.Authentication_User := edt_Authentication_User.Text;
  AllgemeinObj.Ini.Authentication_Password := edt_Authentication_Password.Text;
  AllgemeinObj.Ini.cis_User := edt_cis_User.Text;
  AllgemeinObj.Ini.cis_Password := edt_cis_Password.Text;
  AllgemeinObj.Ini.Url := edt_Url.Text;
  AllgemeinObj.DHLSend.Username := edt_Authentication_User.Text;
  AllgemeinObj.DHLSend.Password := edt_Authentication_Password.Text;
  AllgemeinObj.DHLSend.cisUser := edt_cis_User.Text;
  AllgemeinObj.DHLSend.cisSignature := edt_cis_Password.Text;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  r: TDHLShipmentOrderRequestAPI;
begin
  r := TDHLShipmentOrderRequestAPI.Create;
  FreeAndNil(r);

end;

procedure TForm1.EditExit(Sender: TObject);
begin
  SaveEinstellung;
end;


end.
