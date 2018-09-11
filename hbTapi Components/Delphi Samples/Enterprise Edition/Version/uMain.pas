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
  StdCtrls, hbTapiApi, ExtCtrls, hbTAPI;

type
  TMainForm = class(TForm)
    LabelDevice: TLabel;
    ComboBoxDevice: TComboBox;
    hbTapiLine1: ThbTapiLine;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ComboBoxDeviceChange(Sender: TObject);
    procedure DoNegotiateExtVersion(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  // Fill in the list box with all available telephony devices
  ComboBoxDevice.Items.Assign(hbTapiLine1.DeviceList);

  Edit1.Text := Format('$%8.8x', [hbTapiLine1.TSP.ExtLowVersion]);
  Edit2.Text := Format('$%8.8x', [hbTapiLine1.TSP.ExtHighVersion]);

  // Select the first device in the list
  hbTapiLine1.DeviceID := 0;
  if ComboBoxDevice.Items.Count > 0 then
    begin
      ComboBoxDevice.ItemIndex := 0;
      // Try opening the TAPI device
      ComboBoxDeviceChange(nil);
    end;
end;

procedure TMainForm.ComboBoxDeviceChange(Sender: TObject);
begin
  // Set the TapiLine.DeviceID to use the device selected in the list box
  hbTapiLine1.DeviceID := ComboBoxDevice.ItemIndex;
  if hbTapiLine1.Available then
  begin
    Label4.Caption := Format('$%8.8x', [hbTapiLine1.TSP.APIVersion]);
    Label2.Caption := Format('$%x $%x $%x $%x',
    [hbTapiLine1.TSP.ExtensionID0,hbTapiLine1.TSP.ExtensionID1,hbTapiLine1.TSP.ExtensionID2,hbTapiLine1.TSP.ExtensionID3]);
    Label5.Caption := Format('$%8.8x', [hbTapiLine1.TSP.ExtVersion])
  end
  else
  begin
    MessageDlg('line device not available', mtError, [mbOk],0);
  end;
end;

procedure TMainForm.DoNegotiateExtVersion(Sender: TObject);
begin
  hbTapiLine1.TSP.ExtLowVersion  := StrToIntDef(Edit1.Text,0);
  hbTapiLine1.TSP.ExtHighVersion := StrToIntDef(Edit2.Text,0);
  Label5.Caption := Format('$%8.8x', [hbTapiLine1.TSP.ExtVersion])
end;

end.
