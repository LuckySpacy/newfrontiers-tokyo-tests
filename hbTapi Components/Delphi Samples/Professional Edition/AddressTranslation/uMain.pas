{-------------------------------------------------------------------------
   Copyright by Haeger + Busch, Germany                / >>>>>>>>> /-----
   Ingenieurbuero fuer Kommunikationslösungen         / <<<<<<<<< /
 ----------------------------------------------------/ >>>>>>>>> /
   Homepage  : http://www.hbTapi.com
   EMail     : info@hbTapi.com
   Package   : hbTapi Components
 -------------------------------------------------------------------------}
unit uMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  hbTAPI, hbTapiApi, StdCtrls;

type
  TForm1 = class(TForm)
    ComboBoxDevice: TComboBox;
    ComboBoxPhoneNo: TComboBox;
    ButtonTranslateDlg: TButton;
    ButtonTranslateAddress: TButton;
    hbTapiLine1: ThbTapiLine;
    ComboBoxOptions: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ComboBoxDeviceChange(Sender: TObject);
    procedure ButtonTranslateDlgClick(Sender: TObject);
    procedure ButtonTranslateAddressClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  ComboBoxDevice.Items.Assign(hbTapiLine1.DeviceList);
  if ComboBoxDevice.Items.Count > 0 then
    ComboBoxDevice.ItemIndex := 0;
  ComboBoxDeviceChange(ComboBoxDevice);
  ComboBoxOptions.ItemIndex := 0;
end;

procedure TForm1.ComboBoxDeviceChange(Sender: TObject);
begin
  hbTapiLine1.DeviceID := ComboBoxDevice.ItemIndex;
  ComboBoxPhoneNo.Enabled := hbTapiLine1.Available;
  ComboBoxOptions.Enabled := hbTapiLine1.Available;
end;

procedure TForm1.ButtonTranslateDlgClick(Sender: TObject);
begin
  hbTapiLine1.TranslateDialog(ComboBoxPhoneNo.Text, Handle);
end;

procedure TForm1.ButtonTranslateAddressClick(Sender: TObject);
var o: DWORD;
begin
 case ComboBoxOptions.ItemIndex of
   1 : o := LINETRANSLATEOPTION_CARDOVERRIDE;
   2 : o := LINETRANSLATEOPTION_CANCELCALLWAITING;
   3 : o := LINETRANSLATEOPTION_FORCELOCAL;
   4 : o := LINETRANSLATEOPTION_FORCELD;
 else
   o := 0;
 end;
 MessageDlg(hbTapiLine1.TranslateAddress(ComboBoxPhoneNo.Text, o), mtInformation, [mbOK], 0);
end;

end.
