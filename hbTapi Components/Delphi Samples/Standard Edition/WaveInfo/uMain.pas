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
  StdCtrls, hbTapiApi, ExtCtrls, hbTAPI, hbTAPIUtils;

type

  TForm1 = class(TForm)
    LabelCallerIDNumber: TLabel;
    EditPhoneNo: TEdit;
    LabelDevice: TLabel;
    ComboBox_Device: TComboBox;
    hbTapiLine1: ThbTapiLine;
    ComboBox_MediaMode: TComboBox;
    Label1: TLabel;
    Button_MakeCall: TButton;
    Label2: TLabel;
    Button_DropCall: TButton;
    ListBox1: TListBox;
    ComboBox_Address: TComboBox;
    Label3: TLabel;
    ComboBox_Privileges: TComboBox;
    Label4: TLabel;
    Button_AnswerCall: TButton;
    ComboBox_WaveInClass: TComboBox;
    Label5: TLabel;
    ComboBox_WaveOutClass: TComboBox;
    Label6: TLabel;
    Button_ShowWaveIn: TButton;
    Button_ShowWaveOut: TButton;
    Bevel1: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox_DeviceChange(Sender: TObject);
    procedure hbTapiLine1CallState(Sender: ThbTapiLine; Call: ThbTapiCall;
      CallState: Cardinal);
    procedure DoMakeCall(Sender: TObject);
    procedure hbTapiLine1CallEnd(Sender: ThbTapiLine; Call: ThbTapiCall);
    procedure DoDropCall(Sender: TObject);
    procedure hbTapiLine1CallDeallocate(Sender: ThbTapiLine; Call: ThbTapiCall);
    procedure ListBox1DblClick(Sender: TObject);
    procedure ComboBox_PrivilegesChange(Sender: TObject);
    procedure DoAnswerCall(Sender: TObject);
    procedure DoShowWaveIn(Sender: TObject);
    procedure DoShowWaveOut(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  // Fill in the ComboBox with all available telephony line devices
  ComboBox_Device.Items.Assign(hbTapiLine1.DeviceList);
  if ComboBox_Device.Items.Count > 0 then
    ComboBox_Device.Items.Insert(0, '- none -')
  else
    ComboBox_Device.Items.Add('- none -');

  ComboBox_Device.ItemIndex     := 0;
  ComboBox_Privileges.ItemIndex := 0;
end;

procedure TForm1.ComboBox_DeviceChange(Sender: TObject);
begin
  // If TapiLine is currently open then close it
  hbTapiLine1.Active := False;

  // Set the TapiLine.DeviceID to use the device selected in the list box
  hbTapiLine1.DeviceID := ComboBox_Device.ItemIndex - 1;

  // If there was a problem opening TapiLine last time then make sure that the
  // following properties are reset to their default.
  hbTapiLine1.Privileges.None := TRUE;
  if Pos('Owner', ComboBox_Privileges.Text) > 0 then
    hbTapiLine1.Privileges.Owner := TRUE;
  if Pos('Monitor', ComboBox_Privileges.Text) > 0 then
    hbTapiLine1.Privileges.Monitor := TRUE;

  if not hbTapiLine1.Available then
  begin
    ComboBox_MediaMode.Items.Clear;
    Combobox_Address.Items.Clear;
    Exit;
  end;

  // Fill in the ComboBox with all supporting media modes.
  LineMediaModesToStrList(hbTapiLine1.Caps.MediaModes, ComboBox_MediaMode.Items);
  if (hbTapiLine1.Caps.MediaModes and LINEMEDIAMODE_INTERACTIVEVOICE > 0) then
    ComboBox_MediaMode.ItemIndex := ComboBox_MediaMode.Items.IndexOf(LineMediaModeToStr(LINEMEDIAMODE_INTERACTIVEVOICE))
  else if ComboBox_MediaMode.Items.Count > 0 then
    ComboBox_MediaMode.ItemIndex := 0;

  Combobox_Address.Items.Assign(hbTapiLine1.AddressList);
  if ComboBox_Address.Items.Count > 0 then
    ComboBox_Address.ItemIndex := 0;

  try
    hbTapiLine1.Active := True;
//    ListBox1.Items.add(Format('Line is opened %d times',[hbTapiLine1.Status.NumOpens]));
  except
    on E:EhbTapiError do
      case E.ErrorCode of
         LINEERR_INVALMEDIAMODE :
         begin
           try
             hbTapiLine1.Privileges.Owner := FALSE;
             hbTapiLine1.Active := True;
           except
             on E:Exception do
               MessageDlg('Error opening line device: ' + E.Message, mtError, [mbOk],0);
           end;
           MessageDlg('This device is not 100% TAPI compliant',mtWarning, [mbOk],0);
         end;
      else  // Time for a little error checking
        MessageDlg('Error opening line device: ' + E.Message, mtError, [mbOk],0);
      end;
  end;
end;

procedure TForm1.hbTapiLine1CallState(Sender: ThbTapiLine; Call: ThbTapiCall;
  CallState: Cardinal);
var s: String;
begin
  ListBox1.Items.Add('::OnCallState (' + Call.StateText + ')');
  if Call.CallerID.AddressAvail then
  begin
    s := Call.CallerID.Address;
    ListBox1.Items.Add('CallerID Address = ' + Call.CallerID.Address);
  end;

end;

procedure TForm1.DoMakeCall(Sender: TObject);
begin
  try
    hbTapiLine1.CallParams.MediaMode := StrToLineMediaMode(ComboBox_MediaMode.Text);
    hbTapiLine1.CallParams.AddressID := ComboBox_Address.ItemIndex;
    hbTapiLine1.MakeCall(EditPhoneNo.Text);
  except
    on E:EhbTapiError do
      MessageDlg('MakeCall failed! ' + E.Message, mtError, [mbok], 0);
  end;
end;

procedure TForm1.hbTapiLine1CallEnd(Sender: ThbTapiLine; Call: ThbTapiCall);
begin
  ListBox1.Items.Add('::OnCallEnd');
end;

procedure TForm1.DoDropCall(Sender: TObject);
begin
  if hbTapiLine1.Calls.count > 0 then try
    hbTapiLine1.Calls[0].Drop;
  except
    on E:EhbTapiError do
      MessageDlg('Drop failed! ' + E.Message, mtError, [mbok], 0);
  end;
end;

procedure TForm1.DoAnswerCall(Sender: TObject);
begin
  if hbTapiLine1.Calls.count > 0 then try
    hbTapiLine1.Calls[0].Answer;
  except
    on E:EhbTapiError do
      MessageDlg('Answer failed! ' + E.Message, mtError, [mbok], 0);
  end;
end;

procedure TForm1.hbTapiLine1CallDeallocate(Sender: ThbTapiLine;
  Call: ThbTapiCall);
begin
  ListBox1.Items.Add('::OnCallDeallocate');
end;

procedure TForm1.ListBox1DblClick(Sender: TObject);
begin
  ListBox1.Items.Clear;
end;

procedure TForm1.ComboBox_PrivilegesChange(Sender: TObject);
begin
  if ComboBox_Device.ItemIndex > 0 then
    ComboBox_DeviceChange(nil);
end;


procedure TForm1.DoShowWaveIn(Sender: TObject);
var call: ThbTapiCall;
begin
  if hbTapiLine1.Calls.Count > 0 then
    call := hbTapiLine1.Calls[0]
  else
    exit;

  with Call.WaveIn do
  try
    DeviceClass := ComboBox_WaveInClass.Text;
    Invalidate;
    Update;
    ListBox1.Items.Add(Format('WaveIn DeviceID is: %d', [DeviceID]));
  except
    on E:Exception do
    begin
      MessageDlg(E.Message, mtInformation, [mbOk], 0);
    end;
  end;

end;

procedure TForm1.DoShowWaveOut(Sender: TObject);
var call: ThbTapiCall;
begin
  if hbTapiLine1.Calls.Count > 0 then
    call := hbTapiLine1.Calls[0]
  else
    exit;

  with Call.WaveIn do
  try
    DeviceClass := ComboBox_WaveOutClass.Text;
    Invalidate;
    Update;
    ListBox1.Items.Add(Format('WaveOut DeviceID is: %d', [DeviceID]));
  except
    on E:Exception do
    begin
      MessageDlg(E.Message, mtInformation, [mbOk], 0);
    end;
  end;

end;

end.
