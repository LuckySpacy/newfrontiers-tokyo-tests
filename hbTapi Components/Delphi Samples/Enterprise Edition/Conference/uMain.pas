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
    CheckBoxActive: TCheckBox;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    ListView1: TListView;
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
    GroupBox3: TGroupBox;
    Button_TransferDial: TButton;
    Button_Transfer: TButton;
    Button_Conference: TButton;
    GroupBox4: TGroupBox;
    Button_SetupConf: TButton;
    Button_AddToConf: TButton;
    GroupBox5: TGroupBox;
    Button_PrepareAddToConf: TButton;
    Button_AddToConf2: TButton;
    Button_Dial: TButton;
    Button_Answer: TButton;
    ClearLinks1: TMenuItem;
    Button_Drop: TButton;
    UpdateCalls1: TMenuItem;
    ImageList1: TImageList;
    Label3: TLabel;
    ListBox2: TListBox;
    Button_GetConfCalls: TButton;
    Button_Hold: TButton;
    Button_SwapHold: TButton;
    Button_RemoveFromConf: TButton;
    procedure CheckBoxActiveClick(Sender: TObject);
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
    procedure DoSetupTransfer(Sender: TObject);
    procedure DoTransferCall(Sender: TObject);
    procedure DoBuildConf(Sender: TObject);
    procedure DoSetupConf(Sender: TObject);
    procedure DoAnswerCall(Sender: TObject);
    procedure DoToggleOwner(Sender: TObject);
    procedure DoTranferCallConf(Sender: TObject);
    procedure DoAddToConference(Sender: TObject);
    procedure DoPrepareAddToConf(Sender: TObject);
    procedure DoUpdateCalls(Sender: TObject);
    procedure DoShowConfRelatedCalls(Sender: TObject);
    procedure Button_RemoveFromConfClick(Sender: TObject);
  private
    FPhonenumber : String;
    function GetCall: ThbTapiCall;
    procedure UpdateCalls;
  public
    { Public declarations }
  end;

var Form1:        TForm1;

implementation

{$R *.DFM}

procedure TForm1.CheckBoxActiveClick(Sender: TObject);
begin
  if not CheckBoxActive.Checked then
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

procedure TForm1.ComboBoxDeviceChange(Sender: TObject);
begin
  if hbTapiLine1.Active then
  begin
    CheckBoxActive.Checked := False;
    hbTapiLine1.Active := FALSE;
  end;
  hbTapiLine1.DeviceID := ComboBoxDevice.ItemIndex;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ComboBoxDevice.Items := hbTapiLine1.DeviceList;
  if ComboBoxDevice.Items.Count > 0 then
    ComboBoxDevice.Text := ComboBoxDevice.Items[0];
  ComboBoxDevice.ItemIndex := 0;
  ComboBoxDeviceChange(ComboBoxDevice);
end;

procedure TForm1.UpdateCalls;
var i: integer; li: TListItem; c: ThbTapiCall;
begin
  c := nil;
  for i := 0 to ListView1.Items.Count -1 do
  begin
    if (ListView1.Items[i].Selected or ListView1.Items[i].Focused) and (hbTapiLine1.Calls.IndexOf(ListView1.Items[i].Data) >= 0) then
    begin
      c := ThbTapiCall(ListView1.Items[i].Data);
      break;
    end;
  end;

  if c <> nil then
    Label3.Caption := 'CallFeatures: ' + c.FeaturesText
  else
    Label3.Caption := '';

  with hbTapiLine1 do
  begin
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

      if Calls[i].ConferenceCall <> nil then
        li.SubItems[3] := Format('$%x', [integer(Calls[i].ConferenceCall)])
      else
        li.SubItems[3] := '';


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
  ListView1.Update;
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
  if (InputQuery('Dial', 'Telephone number', FPhonenumber) = false) or (FPhonenumber = '') then
    exit;
  hbTapiLine1.MakeCall(FPhonenumber);
end;

procedure TForm1.DoDial(Sender: TObject);
var c: ThbTapiCall;
begin
  c := GetCall;
  if c = nil then
    exit;
  if (InputQuery('Dial', 'Telephone number', FPhonenumber) = false) or (FPhonenumber = '') then
    exit;
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

procedure TForm1.DoSetupTransfer(Sender: TObject);
var c1, c2: ThbTapiCall;
begin
  c1 := GetCall;
  if c1 = nil then
    exit;
  if (InputQuery('Dial', 'Telephone number', FPhonenumber) = false) or (FPhonenumber = '') then
    exit;
  try
    c2 := c1.SetupTransfer;
    c2.Dial(FPhonenumber);
  except
    on EhbTapiError do
      MessageDlg('SetupTransfer failed!', mtError, [mbOK], 0);
  end;
end;

procedure TForm1.DoTransferCall(Sender: TObject);
var c1: ThbTapiCall;
begin
  c1:= GetCall;

  if (c1 = nil) then
    exit;

  try
    c1.CompleteTransfer(False);
  except
    on EhbTapiError do
      MessageDlg('CompleteTransfer failed!', mtError, [mbOK], 0);
  end;
end;

procedure TForm1.DoBuildConf(Sender: TObject);
var c1: ThbTapiCall;
begin
  c1:= GetCall;
  if (c1 = nil) then
    exit;

  try
    c1.CompleteTransfer(True);
  except
    on EhbTapiError do
      MessageDlg('CompleteTransfer failed!', mtError, [mbOK], 0);
  end;
end;

procedure TForm1.DoSetupConf(Sender: TObject);
var c1, c2, c3: ThbTapiCall;
begin
  c1:= GetCall;
  if (c1 = nil) then
    exit;
  if (InputQuery('Dial', 'Telephone number', FPhonenumber) = false) or (FPhonenumber = '') then
    exit;
  try
    c1.SetupConference(c2, c3);
    c3.Dial(FPhonenumber);
  except
    on EhbTapiError do
      MessageDlg('SetupConference failed!', mtError, [mbOK], 0);
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

procedure TForm1.DoTranferCallConf(Sender: TObject);
var c1: ThbTapiCall;
begin
  c1 := GetCall;
  if c1 = nil then exit;

  try
    c1.CompleteTransfer(True);
  except
    on EhbTapiError do
      MessageDlg('CompleteTransfer failed!', mtError, [mbOK], 0);
  end;
end;

procedure TForm1.DoAddToConference(Sender: TObject);
var Call: ThbTapiCall;
begin
  Call := GetCall;
  if (Call = nil) then
    Exit;

  try
    Call.AddToConference;
  except
    on EhbTapiError do
      MessageDlg('SetupConference failed!', mtError, [mbOK], 0);
  end;
end;

procedure TForm1.DoPrepareAddToConf(Sender: TObject);
var c1, c2: ThbTapiCall;
begin
  c1:= GetCall;
  if (c1 = nil) then
    exit;
  if (InputQuery('Dial', 'Telephone number', FPhonenumber) = false) or (FPhonenumber = '') then
    exit;
  try
    c2 := c1.PrepareAddToConference;
    c2.Dial(FPhonenumber);
  except
    on EhbTapiError do
      MessageDlg('PrepareAddToConference failed!', mtError, [mbOK], 0);
  end;
end;

procedure TForm1.DoUpdateCalls(Sender: TObject);
begin
  UpdateCalls;
end;

procedure TForm1.DoShowConfRelatedCalls(Sender: TObject);
var l: TTapiCallList; c: ThbTapiCall; i: integer;
begin
  ListBox2.Items.Clear;
  c := GetCall;
  if c = nil then exit;

  l := TTapiCallList.Create;
  if hbTapiLine1.GetConfRelatedCalls(c, l) then
  begin
    for i := 0 to l.Count-1 do
      ListBox2.Items.Add(Format('Call $%x', [integer(l[i])]));
  end;
end;

procedure TForm1.Button_RemoveFromConfClick(Sender: TObject);
var c1: ThbTapiCall;
begin
  c1:= GetCall;
  if (c1 = nil) then exit;
  try
    c1.RemoveFromConference;
  except
    on EhbTapiError do
      MessageDlg('RemoveFromConference failed!', mtError, [mbOK], 0);
  end;
end;

end.


