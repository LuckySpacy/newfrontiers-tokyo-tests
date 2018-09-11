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
  StdCtrls, ExtCtrls, hbTAPI, hbTapiUtils, hbTapiApi, ComCtrls;

type
  TForm1 = class(TForm)
    hbTapiLine1: ThbTapiLine;
    GroupBox1: TGroupBox;
    ComboBoxDevice: TComboBox;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    Button_Drop: TButton;
    Button_MakeCall: TButton;
    ListView1: TListView;
    Button_Answer: TButton;
    Button_NonDirectPark: TButton;
    Button_Unpark: TButton;
    Button_DirectPark: TButton;
    Edit_DirAddress: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit_UnparkAddress: TEdit;
    Edit_ParkedAtAddress: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    lbPrivileges: TLabel;
    procedure ComboBoxDeviceChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DoMakeCall(Sender: TObject);
    procedure hbTapiLine1CallState(Sender: ThbTapiLine; Call: ThbTapiCall;
      CallState: Cardinal);
    procedure hbTapiLine1CallDeallocate(Sender: ThbTapiLine; Call: ThbTapiCall);
    procedure hbTapiLine1NewCall(Sender: ThbTapiLine; Call: ThbTapiCall);
    procedure DoDrop(Sender: TObject);
    procedure DoAnswer(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure DoDirectPark(Sender: TObject);
    procedure DoUnpark(Sender: TObject);
    procedure DoNonDirectPark(Sender: TObject);
    procedure hbTapiLine1TapiTranslateChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
  private
    FPhoneNumber : String;
    function GetCall: ThbTapiCall;
    procedure UpdateCalls;
    procedure UpdateControls;
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
  hbTapiLine1.Active   := FALSE;
  hbTapiLine1.Privileges.AutoSelect := True;
  hbTapiLine1.DeviceID := Integer(ComboBoxDevice.Items.Objects[ComboBoxDevice.ItemIndex]);
  hbTapiLine1.Active   := True;
  lbPrivileges.Caption := hbTapiLine1.Privileges.Text;

  UpdateCalls;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  LineVoiceDeviceList(ComboBoxDevice.Items);
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
      if Calls[i].IsOutgoing then
        li.Caption := Calls[i].CalledID.Address
      else
      li.Caption := IntToStr(integer(Calls[i]));
      li.SubItems[0] := Calls[i].StateText;
      li.SubItems[1] := Calls[i].Address.AddressName;
      li.SubItems[2] := Calls[i].PrivilegeText;
      li.SubItems[3] := Calls[i].MediaModeText;
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
  UpdateControls;
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
    cp.AddressID    := 0;
    cp.MediaMode    := LINEMEDIAMODE_INTERACTIVEVOICE;
    cp.Flags        := 0;
    cp.TargetAddress:= FPhoneNumber;
    hbTapiLine1.MakeCall(FPhoneNumber, 0, cp.TapiData);
  finally
    cp.Free;
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
  UpdateCalls;
end;

procedure TForm1.DoDrop(Sender: TObject);
var c: ThbTapiCall;
begin
  c := GetCall;
  if c = nil then exit;
  c.Drop;
end;

procedure TForm1.DoAnswer(Sender: TObject);
var c: ThbTapiCall;
begin
  c := GetCall;
  if c = nil then exit;
  c.Answer;
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  hbTapiLine1.Unpark(0, '0');
end;

procedure TForm1.DoDirectPark(Sender: TObject);
var c: ThbTapiCall;
begin
  c := GetCall;
  if c = nil then
    exit;

  try
    c.Owner := True;
    c.Park(Edit_DirAddress.Text);
    Edit_UnparkAddress.Text := Edit_DirAddress.Text;
  except
    on E:EhbTapiError do
      MessageDlg('TapiLine.Park failed! ' + E.Message, mtError, [mbOK], 0);
  end;
end;

procedure TForm1.DoNonDirectPark(Sender: TObject);
var c: ThbTapiCall; vsAddress : hbTapiApi.PVarString; Address: String;
begin
  c := GetCall;
  if c = nil then
    exit;

  GetMem(vsAddress, 1000);
  try
    FillChar(vsAddress^, 1000, #0);
    vsAddress^.dwTotalSize := 1000;
    vsAddress^.dwUsedSize  := SizeOf(TVarString);

    try
      c.Owner := True;
      hbTapiLine1.Park(c, LINEPARKMODE_NONDIRECTED, '', vsAddress);
      Address := GetTapiBlockStr(vsAddress, @vsAddress^.dwStringSize);
      Edit_ParkedAtAddress.Text := Address;
    except
      on E:EhbTapiError do
        MessageDlg('TapiLine.Park failed! ' + E.Message, mtError, [mbOK], 0);
    end;

  finally
    FreeMem(vsAddress);
  end;
end;

procedure TForm1.DoUnpark(Sender: TObject);
begin
  try
    hbTapiLine1.Unpark(0, Edit_UnparkAddress.Text);
  except
    on E:EhbTapiError do
      MessageDlg('TapiLine.Unpark failed! ' + E.Message, mtError, [mbOK], 0);
  end;
end;

procedure TForm1.hbTapiLine1TapiTranslateChange(Sender: TObject);
begin
  MessageDlg('TranslateCaps changeed. System Location now ' + ThbTapiLine(Sender).Location.LocationName, mtInformation, [mbOK], 0);
end;


procedure TForm1.UpdateControls;
var aCall : ThbTapiCall;
    aAddr : ThbTapiAddress;
begin
  if ListView1.Selected <> nil then begin
    aCall := ThbTapiCall(ListView1.Selected.Data);
    GroupBox2.Caption := Format('Calls (selected:%d)',[Integer(aCall)]);
  end else begin
    aCall := nil;
    GroupBox2.Caption := 'Calls';
  end;

  if hbTapiLine1.Addresses.Count > 0 then
    aAddr := hbTapiLine1.Addresses[0]
  else
    aAddr := nil;

  Button_MakeCall.Enabled :=
    ((hbTapiLine1.Caps.LineFeatures and LINEFEATURE_MAKECALL) > 0) and
    (hbTapiLine1.Calls.Count < hbTapiLine1.Caps.MaxNumActiveCalls);

  Button_Answer.Enabled        := assigned(aCall) and ((aCall.Features and LINECALLFEATURE_ANSWER) > 0);
  Button_Drop.Enabled          := assigned(aCall) and ((aCall.Features and LINECALLFEATURE_DROP) > 0);
  Button_DirectPark.Enabled    := assigned(aCall) and ((aCall.Features and LINECALLFEATURE2_PARKDIRECT) > 0);
  Button_NonDirectPark.Enabled := assigned(aCall) and ((aCall.Features and LINECALLFEATURE2_PARKNONDIRECT) > 0);
  Button_Unpark.Enabled        := assigned(aAddr) and ((aAddr.AddressFeatures and LINEADDRFEATURE_UNPARK) > 0);

end;

procedure TForm1.ListView1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  UpdateControls;
end;

end.


