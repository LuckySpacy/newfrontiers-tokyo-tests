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
{$I ..\..\hbTapiEdition.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, hbTAPI, hbTapiApi, Buttons, ExtCtrls;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    GroupBox_MonitorDigits: TGroupBox;
    GroupBox_GatherDigits: TGroupBox;
    CheckBox_MonitorDigits: TCheckBox;
    CheckBox2: TCheckBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit2: TEdit;
    Edit_Termdigits: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    GroupBox_GenerateDigits: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    GroupBox4: TGroupBox;
    LabelDevice: TLabel;
    Label1: TLabel;
    ComboBoxDevice: TComboBox;
    Label3: TLabel;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton16: TSpeedButton;
    SpeedButton17: TSpeedButton;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    GroupBox_GenerateTone: TGroupBox;
    GroupBox5: TGroupBox;
    Edit1: TEdit;
    Button1: TButton;
    Button_Beep: TButton;
    Button3: TButton;
    Button2: TButton;
    Button_Ringback: TButton;
    Label2: TLabel;
    hbTapiLine1: ThbTapiLine;
    CheckBox_DTMF2: TCheckBox;
    CheckBox_Pulse2: TCheckBox;
    Label11: TLabel;
    CheckBox_DTMF1: TCheckBox;
    CheckBox_Pulse1: TCheckBox;
    RadioButton_DTMF: TRadioButton;
    RadioButton_Pulse: TRadioButton;
    GroupBox_MonitorSilence: TGroupBox;
    CheckBox_MonitorSilence: TCheckBox;
    CheckBox3: TCheckBox;
    Edit_SilenceDuration: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ComboBoxDeviceChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure hbTapiLine1Connected(Sender: ThbTapiLine; Call: ThbTapiCall);
    procedure hbTapiLine1Digit(Sender: ThbTapiLine; Call: ThbTapiCall; Digit: Char);
    procedure DoGatherDigits(Sender: TObject);
    procedure hbTapiLine1GatherDigits(Sender: ThbTapiLine; Call: ThbTapiCall;
      Digits: String; Termination: Cardinal);
    procedure DoMonitorDigits(Sender: TObject);
    procedure hbTapiLine1Offering(Sender: ThbTapiLine; Call: ThbTapiCall);
    procedure DoGenearteDigit(Sender: TObject);
    procedure Button_BeepClick(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure hbTapiLine1Silence(Sender: ThbTapiLine; Call: ThbTapiCall);
    procedure CheckBox3Click(Sender: TObject);
    procedure DoMonitorSilence(Sender: TObject);
  private
    procedure UpdateStatus;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

{*****************************************************************************}
procedure LineVoiceDeviceList(const Strings : TStrings );
{ Toolfunction to collect all lines with voice support in a TStrings Object.
     The Objects property is use to store the deviceid. This enable the application
     using a special line even if there are duplicate device names.}
{*****************************************************************************}
var aLine : ThbTapiLine; I : Integer; NeededMediaModes: DWord;
begin
  NeededMediaModes := LINEMEDIAMODE_INTERACTIVEVOICE or LINEMEDIAMODE_AUTOMATEDVOICE;
  Strings.BeginUpdate;
  try
    Strings.Clear;
    aLine := ThbTapiLine.Create(nil);
    try
      for I := 0 to aLine.DeviceList.Count-1 do begin
        aLine.DeviceID := I;
        if aLine.Available and ((aLine.Caps.MediaModes and NeededMediaModes) > 0) then begin
          Strings.AddObject(aLine.DeviceName, TObject(aLine.DeviceID));
        end;
      end;
    finally
      aLine.Free;
    end;
  finally
    Strings.EndUpdate;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  // Fill in the list box with all available voice telephony devices
  LineVoiceDeviceList(ComboBoxDevice.Items);
  CheckBox3.Checked := hbTapiLine1.CallOptions.MonitorDigits.AutoSelect;
end;

procedure TForm1.ComboBoxDeviceChange(Sender: TObject);
begin
  Label1.Caption := '';

  // If TapiLine is currently open then close it
  hbTapiLine1.Active := False;

  // Set TapiLine to use the device selected in the combo box
  hbTapiLine1.DeviceID := Integer(ComboBoxDevice.Items.Objects[ComboBoxDevice.ItemIndex]);

  // If there was a problem opening etLine last time then make sure that the
  // following properties are reset to their default.
  hbTapiLine1.Privileges.Monitor := True;
  hbTapiLine1.Privileges.Owner   := True;

  try
    hbTapiLine1.Active := True;
    Listbox1.items.add('Device is active (open)');
  except
    on E:EhbTapiError do
    begin
      if (E.ErrorCode = LINEERR_INVALMEDIAMODE) then
      begin
        hbTapiLine1.Privileges.Owner := False;
        try
          hbTapiLine1.Active := True;
          Listbox1.items.add('Device is active (open)');
        except
          on E:EhbTapiError do
            MessageDlg('Error opening line device: ' + E.Message, mtError, [mbOk],0);
        end;
        Listbox1.items.add('This device is not 100% TAPI compliant');
      end
      else
      begin
        MessageDlg('Error opening line device: ' + E.Message, mtError, [mbOk],0);
        Listbox1.items.add(E.Message);
      end;
    end;
  end;
  UpdateStatus;
end;

procedure TForm1.UpdateStatus;
var dwCallFeatures : DWord;
begin
  // if the line device is available there must be at least one address we can
  // use to check the availability of CallFeatures
  if hbTapiLine1.Available then
    dwCallFeatures := hbTapiLine1.Addresses[0].Caps.CallFeatures
  else
    dwCallFeatures := 0;

  if dwCallFeatures and LINECALLFEATURE_MONITORDIGITS > 0 then
  begin
    GroupBox_MonitorDigits.Enabled := TRUE;
    GroupBox_MonitorDigits.Caption := 'Monitor Digits (Available)';
  end
  else
  begin
    GroupBox_MonitorDigits.Enabled := FALSE;
    GroupBox_MonitorDigits.Caption := 'Monitor Digits (Not Available)';
  end;

  if (dwCallFeatures and LINECALLFEATURE_GATHERDIGITS > 0) then
  begin
    GroupBox_GatherDigits.Enabled := TRUE;
    GroupBox_GatherDigits.Caption := 'Gather Digits (Available)';
  end
  else
  begin
    GroupBox_GatherDigits.Enabled := FALSE;
    GroupBox_GatherDigits.Caption := 'Gather Digits (Not Available)';
  end;

  if (dwCallFeatures and LINECALLFEATURE_MONITORTONES > 0) then
  begin
    GroupBox_MonitorSilence.Enabled := TRUE;
    GroupBox_MonitorSilence.Caption := 'Monitor Silence (Available)';
  end
  else
  begin
    GroupBox_MonitorSilence.Enabled := FALSE;
    GroupBox_MonitorSilence.Caption := 'Monitor Silence (Not Available)';
  end;

  if dwCallFeatures and LINECALLFEATURE_GENERATETONE > 0 then
  begin
    GroupBox_GenerateTone.Enabled := TRUE;
    GroupBox_GenerateTone.Caption := 'Generate Tone (Available)';
  end
  else
  begin
    GroupBox_GenerateTone.Enabled := FALSE;
    GroupBox_GenerateTone.Caption := 'Generate Tone (Not Available)';
  end;

  if dwCallFeatures and LINECALLFEATURE_GENERATEDIGITS > 0 then
  begin
    GroupBox_GenerateDigits.Enabled := TRUE;
    GroupBox_GenerateDigits.Caption := 'Generate Digits (Available)';
  end
  else
  begin
    GroupBox_GenerateDigits.Enabled := FALSE;
    GroupBox_GenerateDigits.Caption := 'Generate Digits (Not Available)';
  end;


  if (dwCallFeatures and LINECALLFEATURE_MONITORDIGITS > 0) then
  begin
    GroupBox_MonitorDigits.Enabled := TRUE;
    GroupBox_MonitorDigits.Caption := 'Monitor Digits (Available)'
  end
  else
  begin
    GroupBox_MonitorDigits.Enabled := FALSE;
    GroupBox_MonitorDigits.Caption := 'Monitor Digits (Not Available)';
  end;
  if hbTapiLine1.Caps.GatherDigitsMaxTimeout > hbTapiLine1.Caps.GatherDigitsMinTimeout then begin
    Edit3.Enabled := True;
    Edit4.Enabled := True;
  end
  else
  begin
    Edit3.Enabled := False;
    Edit4.Enabled := False;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  hbTapiLine1.MakeCall(Edit1.Text);
end;

procedure TForm1.hbTapiLine1Connected(Sender: ThbTapiLine; Call: ThbTapiCall);
begin
  ListBox1.Items.Add('Connected call available');

  if CheckBox_MonitorDigits.Checked and (hbTapiLine1.CallOptions.MonitorDigits.AutoSelect = FALSE) then
  try
    Call.MonitorDigits.Active := True;
  except
    on E:Exception do
      ListBox1.Items.Add(Format('MonitorDigits failed! %s',[E.Message]));
  end;

  if Call.MonitorDigits.Active then
  begin
    CheckBox_DTMF1.Checked  := Call.MonitorDigits.DigitModes and LINEDIGITMODE_DTMF > 0;
    CheckBox_Pulse1.Checked := Call.MonitorDigits.DigitModes and LINEDIGITMODE_PULSE > 0;
  end;

  CheckBox_MonitorDigits.OnClick := nil;
  try
    CheckBox_MonitorDigits.Checked := Call.MonitorDigits.Active;
  finally
    CheckBox_MonitorDigits.OnClick := DoMonitorDigits;
  end;

  if CheckBox_MonitorSilence.Checked then
  try
    Call.MonitorSilence.Active := True;
  except
    on E:Exception do
      ListBox1.Items.Add(Format('MonitorSilence failed! %s',[E.Message]));
  end;

  CheckBox_MonitorSilence.OnClick := nil;
  try
    CheckBox_MonitorSilence.Checked := Call.MonitorSilence.Active;
  finally
    CheckBox_MonitorSilence.OnClick := DoMonitorSilence;
  end;

  if hbTapiLine1.WaveIn.Available then
    ListBox1.Items.Add(Format('TapiLine WaveIn DeviceID = %d',[hbTapiLine1.WaveIn.DeviceID]))
  else
    ListBox1.Items.Add(Format('TapiLine WaveIn DeviceID = n/a',[]))
end;

procedure TForm1.hbTapiLine1Digit(Sender: ThbTapiLine; Call: ThbTapiCall; Digit: Char);
begin
  ListBox1.Items.Add('Digit received: ' + Digit);
end;

procedure TForm1.DoGatherDigits(Sender: TObject);
begin
  if hbTapiLine1.Calls.Count = 0 then
    exit;

  CheckBox2.OnClick := nil;
  try
    if CheckBox2.Checked then
    begin
      hbTapiLine1.Calls[0].GatherDigits.NumDigits := StrToIntDef(Edit2.Text,0);


      hbTapiLine1.Calls[0].GatherDigits.FirstDigitTimeout := StrToIntDef(Edit3.Text,0);
      hbTapiLine1.Calls[0].GatherDigits.InterDigitTimeout := StrToIntDef(Edit4.Text,0);
      hbTapiLine1.Calls[0].GatherDigits.DigitModes := 0;
      if CheckBox_DTMF2.Checked then
        hbTapiLine1.Calls[0].GatherDigits.DigitModes := hbTapiLine1.Calls[0].GatherDigits.DigitModes or LINEDIGITMODE_DTMF;
      if CheckBox_Pulse2.Checked then
        hbTapiLine1.Calls[0].GatherDigits.DigitModes := hbTapiLine1.Calls[0].GatherDigits.DigitModes or LINEDIGITMODE_PULSE;
      hbTapiLine1.Calls[0].GatherDigits.TerminationDigits := Edit_Termdigits.Text;
      hbTapiLine1.Calls[0].GatherDigits.Active := True;
      ListBox1.Items.Add('Gathering started');
    end
    else if (not CheckBox2.Checked) and (hbTapiLine1.Calls.Count > 0) then
    begin
      hbTapiLine1.Calls[0].GatherDigits.Active := False;
    end;
  finally
    CheckBox2.Checked := hbTapiLine1.Calls[0].GatherDigits.Active;
    CheckBox2.OnClick := DoGatherDigits;
  end;
end;

procedure TForm1.hbTapiLine1GatherDigits(Sender: ThbTapiLine; Call: ThbTapiCall;
  Digits: String; Termination: Cardinal);
begin
  ListBox1.Items.Add('Gathering terminated');
  case Termination of
    LINEGATHERTERM_BUFFERFULL : // The requested number of digits has been gathered. The buffer is full.
      ListBox1.Items.Add('Digits gathered: ' + Digits);
    LINEGATHERTERM_CANCEL : // The request was canceled by this application, by another application, or because the call terminated.
      ListBox1.Items.Add('Gathering canceled');
    LINEGATHERTERM_FIRSTTIMEOUT : // The first digit timeout expired. The buffer contains no digits.
      ListBox1.Items.Add('first digit timeout');
    LINEGATHERTERM_INTERTIMEOUT : // The inter-digit timeout expired. The buffer contains at least one digit.
      ListBox1.Items.Add('inter-digit timeout');
    LINEGATHERTERM_TERMDIGIT :
      ListBox1.Items.Add('Termination digit received ('+Digits+')'); // One of the termination digits matched a received digit. The matched termination digit is the last digit in the buffer.
  end;
  CheckBox2.OnClick := nil;
  CheckBox2.Checked := False;
  CheckBox2.OnClick := DoGatherDigits;
end;

procedure TForm1.DoMonitorDigits(Sender: TObject);
begin
  if hbTapiLine1.Calls.Count = 0 then
    exit;

  CheckBox_MonitorDigits.OnClick := nil;
  try
    if CheckBox_MonitorDigits.Checked then
    begin
      if CheckBox_DTMF1.Checked then
        hbTapiLine1.Calls[0].MonitorDigits.DigitModes := LINEDIGITMODE_DTMF;
      if CheckBox_Pulse1.Checked then
        hbTapiLine1.Calls[0].MonitorDigits.DigitModes := hbTapiLine1.Calls[0].MonitorDigits.DigitModes or LINEDIGITMODE_PULSE;
      hbTapiLine1.Calls[0].MonitorDigits.Active := True;
      ListBox1.Items.Add('MonitorDigits active');
    end
    else
    begin
      hbTapiLine1.Calls[0].MonitorDigits.Active := False;
      ListBox1.Items.Add('MonitorDigits inactive');
    end;
  finally
    CheckBox_MonitorDigits.Checked := hbTapiLine1.Calls[0].MonitorDigits.Active;
    CheckBox_MonitorDigits.OnClick := DoMonitorDigits;
  end;
end;

procedure TForm1.DoMonitorSilence(Sender: TObject);
begin
  if hbTapiLine1.Calls.Count = 0 then
    exit;

  CheckBox_MonitorSilence.OnClick := nil;
  try
    if CheckBox_MonitorSilence.Checked then
    begin
      hbTapiLine1.Calls[0].MonitorSilence.Duration := StrToIntDef(Edit_SilenceDuration.Text,0);
      hbTapiLine1.Calls[0].MonitorSilence.Active := True;
    end
    else
    begin
      hbTapiLine1.Calls[0].MonitorSilence.Active := False;
    end;
    CheckBox_MonitorSilence.Checked := hbTapiLine1.Calls[0].MonitorSilence.Active;
    if hbTapiLine1.Calls[0].MonitorSilence.Active then
      ListBox1.Items.Add('MonitorSilence is active')
    else
      ListBox1.Items.Add('MonitorSilence is inactive');
  finally
    CheckBox_MonitorSilence.OnClick := DoMonitorSilence;
  end;
end;

procedure TForm1.hbTapiLine1Offering(Sender: ThbTapiLine; Call: ThbTapiCall);
begin
  Call.Answer;
end;

procedure TForm1.DoGenearteDigit(Sender: TObject);
begin
  if hbTapiLine1.Calls.Count = 0 then exit;
  if hbTapiLine1.Calls.Count > 0 then
  begin
    if RadioButton_DTMF.Checked then
      hbTapiLine1.Calls[0].GenerateDigits(TSpeedButton(Sender).Caption, 100)
    else
      hbTapiLine1.Calls[0].GeneratePulseDigits(TSpeedButton(Sender).Caption, 100);
  end;
end;

procedure TForm1.Button_BeepClick(Sender: TObject);
begin
{$ifdef EDT_ENTERPRISE}
 if hbTapiLine1.Calls.Count > 0 then
  begin
    case TSpeedButton(Sender).Tag of
    0: hbTapiLine1.Calls[0].GenerateTone(LINETONEMODE_BEEP, 1000);
    1: hbTapiLine1.Calls[0].GenerateTone(LINETONEMODE_BUSY, 1000);
    2: hbTapiLine1.Calls[0].GenerateTone(LINETONEMODE_BILLING, 1000);
    3: hbTapiLine1.Calls[0].GenerateTone(LINETONEMODE_RINGBACK, 1000);
    end;
  end;
{$endif}
end;

procedure TForm1.ListBox1DblClick(Sender: TObject);
begin
  ListBox1.Items.Clear;
end;

procedure TForm1.hbTapiLine1Silence(Sender: ThbTapiLine; Call: ThbTapiCall);
begin
  ListBox1.Items.Add('Silence detected');
end;

procedure TForm1.CheckBox3Click(Sender: TObject);
begin
  hbTapiLine1.CallOptions.MonitorDigits.AutoSelect := CheckBox3.Checked;
end;


end.
