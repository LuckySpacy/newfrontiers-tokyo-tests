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
  StdCtrls, ExtCtrls, hbTAPI, hbTapiUtils, hbTapiApi, ComCtrls;

type
  TForm1 = class(TForm)
    hbTapiLine1: ThbTapiLine;
    GroupBox1: TGroupBox;
    ComboBoxDevice: TComboBox;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    Button_Drop: TButton;
    Button_Hold: TButton;
    ButtonSwapHold: TButton;
    LabelAddressPrimary: TLabel;
    Button_MakeCall: TButton;
    Button_SetupTransfer: TButton;
    Button_Dial: TButton;
    Button_DialConference: TButton;
    Button_Owner: TButton;
    Button_DialTransfer: TButton;
    ListView1: TListView;
    Button_Answer: TButton;
    Button_BlindTransfer: TButton;
    ListBox1: TListBox;
    Button_Transfer: TButton;
    Button_Conference: TButton;
    ComboBox_Address: TComboBox;
    procedure ComboBoxDeviceChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DoMakeCall(Sender: TObject);
    procedure DoDialConference(Sender: TObject);
    procedure DoSwapHold(Sender: TObject);
    procedure hbTapiLine1CallState(Sender: ThbTapiLine; Call: ThbTapiCall;
      CallState: Cardinal);
    procedure hbTapiLine1CallDeallocate(Sender: ThbTapiLine; Call: ThbTapiCall);
    procedure hbTapiLine1NewCall(Sender: ThbTapiLine; Call: ThbTapiCall);
    procedure DoDrop(Sender: TObject);
    procedure DoHold(Sender: TObject);
    procedure DoDial(Sender: TObject);
    procedure DoSetupTransfer(Sender: TObject);
    procedure DoAnswer(Sender: TObject);
    procedure Button_OwnerClick(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure hbTapiLine1Connected(Sender: ThbTapiLine; Call: ThbTapiCall);
    procedure DoDialTransfer(Sender: TObject);
    procedure DoBlindTransfer(Sender: TObject);
    procedure DoTransfer(Sender: TObject);
    procedure DoConference(Sender: TObject);
    procedure hbTapiLine1CallInfo(Sender: ThbTapiLine; Call: ThbTapiCall;
      InfoState: Cardinal);
    procedure FormActivate(Sender: TObject);
  private
    FPhoneNumber : String;
    function GetCall: ThbTapiCall;
    procedure UpdateCalls;
  public
    { Public declarations }
  end;

var Form1:        TForm1;

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


procedure TForm1.ComboBoxDeviceChange(Sender: TObject);
begin
  hbTapiLine1.Active := FALSE;
  hbTapiLine1.DeviceID := Integer(ComboBoxDevice.Items.Objects[ComboBoxDevice.ItemIndex]);
  ComboBox_Address.Items.Assign(hbTapiLine1.AddressList);
  if ComboBox_Address.Items.Count > 0 then
    ComboBox_Address.ItemIndex := 0;
  if hbTapiLine1.Available then
    hbTapiLine1.Active := True;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  if ComboBoxDevice.ItemIndex = -1 then begin
    if ComboBoxDevice.Items.Count > 0 then begin
      ComboBoxDevice.ItemIndex := 0;
      ComboBoxDeviceChange(ComboBoxDevice);
    end else
      Application.MessageBox(PChar(Format('Sorry, no one of your %d tapi lines support voice mediamodes',[hbTapiLine1.DeviceList.Count])),
                             'Information');
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  LineVoiceDeviceList(ComboBoxDevice.Items);
end;

procedure TForm1.UpdateCalls;
var i: integer; li: TListItem; c: ThbTapiCall;
begin
  with hbTapiLine1 do
  begin
    if ListView1.Selected <> nil then
      c := ThbTapiCall(ListView1.Selected.Data)
    else
      c := nil;
    for i:= 0 to Calls.Count-1 do
    begin
      if i < ListView1.Items.Count then
        li := ListView1.Items[i]
      else
        li := ListView1.Items.Add;
      while li.SubItems.Count < Listview1.Columns.Count-1 do
        li.SubItems.Add('');
      li.Data := Calls[i];
      li.Caption := IntToStr(integer(Calls[i]));
      if Calls[i].IsOutgoing then
        li.SubItems[0] := Calls[i].CalledID.Address
      else
        li.SubItems[0] := Calls[i].CallerID.Address;
      li.SubItems[1] := Calls[i].StateText;
      li.SubItems[2] := Calls[i].Address.AddressName;
      li.SubItems[3] := Calls[i].PrivilegeText;
      li.SubItems[4] := Calls[i].MediaModeText;
{$ifdef EDT_ENTERPRISE}
      li.SubItems[5] := IntToStr(integer(Calls[i].ConferenceCall));
{$endif}
    end;
    while ListView1.Items.Count > Calls.Count do
      ListView1.Items[ListView1.Items.Count-1].Delete;
    for i := 0 to ListView1.Items.Count -1 do
    begin
      if ListView1.Items[i].Data = c then
      begin
        ListView1.Selected := ListView1.Items[i];
      end;
    end;
    if (ListView1.Selected = nil) and (ListView1.Items.Count > 0) then
      ListView1.Selected := ListView1.Items[0];
  end;
end;

function TForm1.GetCall: ThbTapiCall;
begin
  result := nil;

  if (ListView1.Selected = nil) and (ListView1.Items.Count >0) then
    ListView1.Selected := ListView1.Items[0];

  if ListView1.Selected = nil then
  begin
    MessageDlg('No call available.', mtInformation, [mbOk], 0);
    exit;
  end;

  result := ThbTapiCall(ListView1.Selected.Data);

  if hbTapiLine1.Calls.IndexOf(result) = -1 then
      result := nil;
end;

procedure TForm1.DoMakeCall(Sender: TObject);
var cp: ThbTapiCallParams; 
begin
   if (InputQuery('MakeCall', 'Phone Number', FPhonenumber) = False) or (FPhonenumber = '') then
     exit;
  // here we use the ThbTapiCallParams object instead of ThbTapiLine.CallParams
  cp := ThbTapiCallParams.Create;
  try
    cp.AddressMode  := LINEADDRESSMODE_ADDRESSID;
    cp.AddressID    := ComboBox_Address.ItemIndex;
    cp.MediaMode    := LINEMEDIAMODE_INTERACTIVEVOICE;
    cp.Flags        := 0;
    cp.TargetAddress:= FPhoneNumber;
    hbTapiLine1.MakeCall(FPhoneNumber, 0, cp.TapiData);
  finally
    cp.Free;
  end;
end;

procedure TForm1.DoDial(Sender: TObject);
var c: ThbTapiCall;
begin
  if (InputQuery('Dial', 'Phone Number', FPhonenumber) = False) or (FPhonenumber = '') then
     exit;
  c := GetCall;
  hbTapiLine1.CallParams.AddressID := ComboBox_Address.ItemIndex;
  if c <> nil then
    c.Dial(FPhonenumber);
end;

procedure TForm1.DoDialConference(Sender: TObject);
var c1, c2: ThbTapiCall;
begin
   if (InputQuery('MakeCall', 'Phone Number', FPhonenumber) = False) or (FPhonenumber = '') then
     exit;
  c1 := GetCall;
  if c1 = nil then exit;

  hbTapiLine1.CallParams.AddressID := ComboBox_Address.ItemIndex;
  try
    c2 := c1.SetupTransfer;
    if c2.Valid then begin
      while (c2.Features and LINECALLFEATURE_DIAL) = 0 do Sleep(10);
      c2.Dial(FPhonenumber);
      c2.Notes['Action'] := 'Conference';
    end;
  except
    on EhbTapiError do
      MessageDlg('SetupTransfer/Dial failed!', mtError, [mbOK], 0);
  end;
end;

procedure TForm1.DoSwapHold(Sender: TObject);
var i: integer; c1, c2: ThbTapiCall;
begin
  c1:= GetCall;
  if c1 = nil then exit;
  c2:= nil;
  for i := 0 to hbTapiLine1.Calls.Count -1 do
  begin
    if (hbTapiLine1.Calls[i] <> c1) and
       ((c1.IsConnected and hbTapiLine1.Calls[i].IsHeld) or (c1.IsHeld and hbTapiLine1.Calls[i].IsConnected)) then
    begin
      c2 := hbTapiLine1.Calls[i];
    end;
  end;
  if (c2 <> nil) then
  begin
    if c1.IsConnected then
      c1.SwapHold(c2)
    else
      c2.SwapHold(c1);
  end;
end;

procedure TForm1.hbTapiLine1CallState(Sender: ThbTapiLine; Call: ThbTapiCall;
  CallState: Cardinal);
begin
  UpdateCalls;
end;

procedure TForm1.hbTapiLine1CallDeallocate(Sender: ThbTapiLine;
  Call: ThbTapiCall);
begin
  UpdateCalls;
end;

procedure TForm1.hbTapiLine1NewCall(Sender: ThbTapiLine; Call: ThbTapiCall);
begin
  ListBox1.Items.Add(Format('::OnNewCall Call = %d',[integer(Call)]));
  UpdateCalls;
end;

procedure TForm1.DoDrop(Sender: TObject);
var c: ThbTapiCall;
begin
  c := GetCall;
  if c = nil then exit;
  c.Drop;
end;

procedure TForm1.DoHold(Sender: TObject);
var c: ThbTapiCall;
begin
  c := GetCall;
  if c = nil then exit;
  if c.IsHeld then
    c.Unhold
  else
    c.Hold;
end;

procedure TForm1.DoSetupTransfer(Sender: TObject);
var c1: ThbTapiCall;
begin
  c1 := GetCall;
  if c1 = nil then exit;
  hbTapiLine1.CallParams.AddressID := ComboBox_Address.ItemIndex;
  try
    c1.SetupTransfer;
  except
    on EhbTapiError do
      MessageDlg('SetupTransfer failed!', mtError, [mbOK], 0);
  end;
end;

procedure TForm1.DoAnswer(Sender: TObject);
var c: ThbTapiCall;
begin
  c := GetCall;
  if c = nil then exit;
  c.Answer;
end;

procedure TForm1.Button_OwnerClick(Sender: TObject);
var c: ThbTapiCall;
begin
  c := GetCall;
  if c = nil then exit;
  c.Owner := not c.Owner;
  UpdateCalls;
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  hbTapiLine1.Unpark(0, '0');
end;

procedure TForm1.hbTapiLine1Connected(Sender: ThbTapiLine; Call: ThbTapiCall);
begin
  ListBox1.Items.Add(Format('::OnConnected Call = %d',[integer(Call)]));

  if Call.Notes['Action'] = 'Conference' then
  begin
    Call.Notes['Action'] := '';
    Call.CompleteTransfer(True);
  end
  else if Call.Notes['Action'] = 'Transfer' then
  begin
    Call.Notes['Action'] := '';
    Call.CompleteTransfer(False);
  end;
end;


procedure TForm1.DoDialTransfer(Sender: TObject);
var c1, c2: ThbTapiCall;
begin
   if (InputQuery('MakeCall', 'Phone Number', FPhonenumber) = False) or (FPhonenumber = '') then
     exit;

  c1 := GetCall;
  if c1 = nil then exit;

  //hbTapiLine1.CallParams.AddressID := ComboBox_Address.ItemIndex;
  try
    c2 := c1.SetupTransfer;
    // Workaround: sometimes we get a valid call but can't dial on it immediately
    if c2.Valid then begin
      while (c2.Features and LINECALLFEATURE_DIAL) = 0 do Sleep(10);
      c2.Dial(FPhonenumber);
      c2.Notes['Action'] := 'Transfer';
    end;
  except
    on EhbTapiError do
      MessageDlg('SetupTransfer/Dial failed!', mtError, [mbOK], 0);
  end;
end;

procedure TForm1.DoBlindTransfer(Sender: TObject);
var c1: ThbTapiCall;
begin
  c1 := GetCall;
  if c1 = nil then exit;
  if (InputQuery('BlindTransfer', 'Destination Address', FPhonenumber) = False) or (FPhonenumber = '') then
    exit;

  try
    c1.BlindTransfer(FPhonenumber);
  except
    on EhbTapiError do
      MessageDlg('BlindTransfer failed!', mtError, [mbOK], 0);
  end;
end;

procedure TForm1.DoTransfer(Sender: TObject);
var c: ThbTapiCall;
begin
  c := GetCall;
  if c = nil then
    exit;

  try
    c.CompleteTransfer(False);
  except
    on EhbTapiError do
      MessageDlg('CompleteTransfer failed!', mtError, [mbOK], 0);
  end;
end;

procedure TForm1.DoConference(Sender: TObject);
var c: ThbTapiCall;
begin
  c := GetCall;
  if c = nil then
    exit;

  try
    c.CompleteTransfer(True);
  except
    on EhbTapiError do
      MessageDlg('CompleteTransfer failed!', mtError, [mbOK], 0);
  end;
end;

procedure TForm1.hbTapiLine1CallInfo(Sender: ThbTapiLine; Call: ThbTapiCall;
  InfoState: Cardinal);
begin
  UpdateCalls;
end;


end.


