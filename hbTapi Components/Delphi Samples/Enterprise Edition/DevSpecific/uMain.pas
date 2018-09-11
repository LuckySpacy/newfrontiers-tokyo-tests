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


const
  SIEMENS_MAX_DIALABLE_STRING_BYTES  = 100;
  SIEMENSLINE_DIAL_DIGITS            = $00000001;
  SIEMENSBUTTONFUNCTION_SERVICE_MENU = $800000A1;

type
  TSIEMENS_LINE_DEV_SPECIFIC = record
    dwRequestType : DWORD;
    szDialableString : array[0..SIEMENS_MAX_DIALABLE_STRING_BYTES-1] of Byte;
  end;
  PSIEMENS_LINE_DEV_SPECIFIC = ^TSIEMENS_LINE_DEV_SPECIFIC;

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
    GroupBox3: TGroupBox;
    Button2: TButton;
    CheckBox1: TCheckBox;
    Edit3: TEdit;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ComboBoxDeviceChange(Sender: TObject);
    procedure DoNegotiateExtVersion(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
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
  hbTapiLine1.Active := False;
  hbTapiLine1.DeviceID := ComboBoxDevice.ItemIndex;
  if hbTapiLine1.Available then
  begin
    Label4.Caption := Format('$%8.8x', [hbTapiLine1.TSP.APIVersion]);
    Label2.Caption := Format('$%x $%x $%x $%x',
    [hbTapiLine1.TSP.ExtensionID0,hbTapiLine1.TSP.ExtensionID1,hbTapiLine1.TSP.ExtensionID2,hbTapiLine1.TSP.ExtensionID3]);
    Label5.Caption := Format('$%8.8x', [hbTapiLine1.TSP.ExtVersion]);
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

procedure TMainForm.Button2Click(Sender: TObject);
var data: TSIEMENS_LINE_DEV_SPECIFIC;
    s: String;
begin
  data.dwRequestType := SIEMENSLINE_DIAL_DIGITS;
  FillChar(data.szDialableString, SIEMENS_MAX_DIALABLE_STRING_BYTES, #0);
  s := Edit3.Text;
  Move(s[1], data.szDialableString, Length(s));
  hbTapiLine1.DevSpecific(@data, sizeof(TSIEMENS_LINE_DEV_SPECIFIC), nil, nil);
end;

procedure TMainForm.CheckBox1Click(Sender: TObject);
begin
  hbTapiLine1.Active := True;
end;

procedure TMainForm.Button3Click(Sender: TObject);
var b: DWORD;
begin
  b := 22;
  hbTapiLine1.DevSpecificFeature(0, @b, sizeof(DWORD));
end;

end.
