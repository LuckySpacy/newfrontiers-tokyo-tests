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
  StdCtrls, ExtCtrls, hbTAPI, hbTapiUtils, hbTapiApi, ComCtrls, ImgList, Menus;

type
  TForm1 = class(TForm)
    hbTapiLine1: ThbTapiLine;
    GroupBox1: TGroupBox;
    ComboBoxDevice: TComboBox;
    CheckBox_Active: TCheckBox;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    ListView1: TListView;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    Answer1: TMenuItem;
    Drop1: TMenuItem;
    HoldUnhold1: TMenuItem;
    SwapHold1: TMenuItem;
    N1: TMenuItem;
    ToggleOwner1: TMenuItem;
    N2: TMenuItem;
    MakeCall1: TMenuItem;
    Dial1: TMenuItem;
    Button_MakeCall: TButton;
    Button_Dial: TButton;
    Button_Answer: TButton;
    Button_Drop: TButton;
    UpdateCalls1: TMenuItem;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Button_ForwardTo: TButton;
    Button_GetForwardList: TButton;
    Button_ClearForwards: TButton;
    ListBox1: TListBox;
    Button_ClearForwards2: TButton;
    Button_ChangeForwardList: TButton;
    procedure CheckBox_ActiveClick(Sender: TObject);
    procedure ComboBoxDeviceChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DoMakeCall(Sender: TObject);
    procedure DoSetupTransferAndDial(Sender: TObject);
    procedure DoSwapHold(Sender: TObject);
    procedure hbTapiLine1CallState(Sender: ThbTapiLine; Call: ThbTapiCall;
      CallState: Cardinal);
    procedure hbTapiLine1CallDeallocate(Sender: ThbTapiLine; Call: ThbTapiCall);
    procedure hbTapiLine1NewCall(Sender: ThbTapiLine; Call: ThbTapiCall);
    procedure DoDropCall(Sender: TObject);
    procedure DoHoldCall(Sender: TObject);
    procedure DoDial(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DoAnswerCall(Sender: TObject);
    procedure DoToggleOwner(Sender: TObject);
    procedure Button_ForwardToClick(Sender: TObject);
    procedure DoUpdateCalls(Sender: TObject);
    procedure Button_GetForwardListClick(Sender: TObject);
    procedure hbTapiLine1AddressState(Sender: ThbTapiLine;
      Address: ThbTapiAddress; AddressState: Cardinal);
    procedure Button_ClearForwardsClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
  private
    FPhonenumber : String;
    function GetCall: ThbTapiCall;
    procedure UpdateCalls;
    procedure ShowForwards(AddressID: Integer);
  public
    { Public declarations }
  end;

var Form1:        TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  ComboBoxDevice.Items := hbTapiLine1.DeviceList;
  if ComboBoxDevice.Items.Count > 0 then
    ComboBoxDevice.Text := ComboBoxDevice.Items[0];
  ComboBoxDevice.ItemIndex := 0;
  ComboBoxDeviceChange(ComboBoxDevice);
end;

procedure TForm1.ComboBoxDeviceChange(Sender: TObject);
begin
  if hbTapiLine1.Active then
  begin
    CheckBox_Active.Checked := False;
    hbTapiLine1.Active := FALSE;
  end;
  hbTapiLine1.DeviceID := ComboBoxDevice.ItemIndex;
end;

procedure TForm1.CheckBox_ActiveClick(Sender: TObject);
begin
  if not CheckBox_Active.Checked then
    begin
      if hbTapiLine1.Active then
        hbTapiLine1.Active := False
    end
  else
    begin
      if not hbTapiLine1.Active then
        hbTapiLine1.Active := True;
    end;
  UpdateCalls;
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

      while li.SubItems.Count < ListView1.Columns.Count do
        li.SubItems.Add('');

        Calls[i].Info.Update;
      li.Caption := Format('$%x (%d)',[integer(Calls[i]), Calls[i].CallID]);

      li.Data := Calls[i];
      if Calls[i].IsOutgoing then
        li.SubItems[0] := Calls[i].CalledID.Address
      else
        li.SubItems[0] := Calls[i].CallerID.Address;
      li.SubItems[1] := Calls[i].StateText;
      li.SubItems[2] := Calls[i].PrivilegeText;
      li.SubItems[3] := Calls[i].FeaturesText;
      li.ImageIndex  := 0;

      case Calls[i].State of
        LINECALLSTATE_IDLE               : li.ImageIndex := 1;
        LINECALLSTATE_OFFERING           : li.ImageIndex := 4;
        LINECALLSTATE_ACCEPTED           :;
        LINECALLSTATE_DIALTONE,
        LINECALLSTATE_DIALING,
        LINECALLSTATE_RINGBACK,
        LINECALLSTATE_PROCEEDING         : li.ImageIndex := 2;
        LINECALLSTATE_BUSY               : li.ImageIndex := 8;
        LINECALLSTATE_SPECIALINFO:;
        LINECALLSTATE_CONNECTED          : li.ImageIndex := 3;
        LINECALLSTATE_CONFERENCED        : li.ImageIndex := 7;
        LINECALLSTATE_ONHOLD,
        LINECALLSTATE_ONHOLDPENDCONF,
        LINECALLSTATE_ONHOLDPENDTRANSFER : li.ImageIndex := 5;
        LINECALLSTATE_DISCONNECTED       : li.ImageIndex := 6;
      end;
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
begin
  if InputQuery('Dial to', 'Phonenumber', FPhonenumber) then
    hbTapiLine1.MakeCall(FPhonenumber);
end;

procedure TForm1.DoDial(Sender: TObject);
var c: ThbTapiCall;
begin
  c := GetCall;
  if c = nil then
    exit;
  if InputQuery('Dial to', 'Phonenumber', FPhonenumber) then
    c.Dial(FPhonenumber);
end;

procedure TForm1.DoSetupTransferAndDial(Sender: TObject);
var c1: ThbTapiCall;
begin
  c1 := GetCall;
  if c1 = nil then exit;

  try
    c1.Dial(FPhonenumber);
  except
    on EhbTapiError do
      MessageDlg('SetupTransfer failed!', mtError, [mbOK], 0);
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
  UpdateCalls;
end;

procedure TForm1.DoDropCall(Sender: TObject);
var c: ThbTapiCall;
begin
  c := GetCall;
  if c = nil then exit;
  c.Drop;
end;

procedure TForm1.DoHoldCall(Sender: TObject);
var c: ThbTapiCall;
begin
  c := GetCall;
  if c = nil then exit;
  if c.IsHeld then
    c.Unhold
  else
    c.Hold;
end;

procedure TForm1.Button4Click(Sender: TObject);
var c1: ThbTapiCall;
begin
  c1 := GetCall;
  if c1 = nil then exit;
  try
    c1.Dial(FPhonenumber);
  except
    on EhbTapiError do
      MessageDlg('Dial failed!', mtError, [mbOK], 0);
  end;
end;

procedure TForm1.DoAnswerCall(Sender: TObject);
var c: ThbTapiCall;
begin
  c := GetCall;
  if c = nil then exit;
  c.Answer;
end;

procedure TForm1.DoToggleOwner(Sender: TObject);
var c: ThbTapiCall;
begin
  c := GetCall;
  if c = nil then exit;
  c.Owner := not c.Owner;
  UpdateCalls;
end;


procedure TForm1.DoUpdateCalls(Sender: TObject);
begin
  UpdateCalls;
end;

procedure TForm1.ShowForwards(AddressID: Integer);
var i,n: integer;

  procedure AddForward(Value: ThbTapiForward);
  begin
    listbox1.Items.Add(Format('  ForwardMode = %s',  [LineForwardModeToStr(Value.ForwardMode)]));
    listbox1.Items.Add(Format('  CallerAddress =%s', [Value.CallerAddress]));
    listbox1.Items.Add(Format('  DestAddress = %s',  [Value.DestAddress]));
  end;

begin
  listbox1.Items.Clear;
  if AddressID = -1 then
  begin
    i := 0;
    while i < hbTapiLine1.Addresses.Count do
    begin
      listbox1.Items.Add(Format('AddressName = %s',[hbTapiLine1.Addresses[i].AddressName]));
      with hbTapiLine1.Addresses[i].ForwardList do
      begin
        n := 0;
        while n < Count do
        begin
          AddForward(Items[n]);
          inc(n);
        end;
      end;
      inc(i);
    end;
  end
  else
  begin
    listbox1.Items.Add(Format('Forwards of Address "%s"',[hbTapiLine1.Addresses[AddressID].AddressName]));
    with hbTapiLine1.Addresses[AddressID].ForwardList do
    begin
      n := 0;
      while n < Count do
      begin
        AddForward(Items[n]);
        inc(n);
      end;
    end;
  end;
end;

procedure TForm1.Button_GetForwardListClick(Sender: TObject);
begin
  ShowForwards(0);
end;

procedure TForm1.hbTapiLine1AddressState(Sender: ThbTapiLine;
  Address: ThbTapiAddress; AddressState: Cardinal);
begin
  if AddressState and  LINEADDRESSSTATE_FORWARD > 0 then
  begin
    MessageDlg(Format('Forward list of address ''%s'' has changed.', [Address.AddressName]), mtInformation, [mbOK], 0);
    ShowForwards(Address.AddressID);
  end;
end;

procedure TForm1.Button_ClearForwardsClick(Sender: TObject);
begin
  hbTapiLine1.Addresses[0].ForwardTo('');
end;

procedure TForm1.Button3Click(Sender: TObject);
var l: ThbTapiForwardList;
begin
  l := ThbTapiForwardList.Create;
  try
    l.AddEntry(LINEFORWARDMODE_UNCOND, '', 0, '102');
    hbTapiLine1.Addresses[0].ChangeforwardList(l, 3, hbTapiLine1.CallParams);
  finally
    l.free;
  end;
end;

procedure TForm1.Button_ForwardToClick(Sender: TObject);
var s: String;
begin
  if InputQuery('ForwardTo', 'Phone number', s) then
    hbTapiLine1.Addresses[0].ForwardTo(s);
  ShowForwards(0);
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
  hbTapiLine1.Addresses[0].ForwardTo('');
  ShowForwards(0);
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  hbTapiLine1.Addresses[0].ChangeForwardList(nil, 0, nil);
end;

end.


