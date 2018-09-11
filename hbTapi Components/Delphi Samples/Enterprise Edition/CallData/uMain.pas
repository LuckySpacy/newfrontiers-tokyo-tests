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
  StdCtrls, ExtCtrls, hbTAPI, hbTapiUtils, hbTapiApi, ComCtrls, ImgList, Menus,
  hbComm;

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
    MakeCall1: TMenuItem;
    Dial1: TMenuItem;
    Button2: TButton;
    GroupBox3: TGroupBox;
    ButtonSetCallData: TButton;
    GroupBox4: TGroupBox;
    ButtonGetCallData: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    UpdateCalls1: TMenuItem;
    ImageList1: TImageList;
    Label3: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    N1: TMenuItem;
    Label_Privileges: TLabel;
    ComboBox_Privileges: TComboBox;
    Label5: TLabel;
    procedure CheckBoxActiveClick(Sender: TObject);
    procedure ComboBoxDeviceChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DoMakeCall(Sender: TObject);
    procedure DoSwapHold(Sender: TObject);
    procedure hbTapiLine1CallState(Sender: ThbTapiLine; Call: ThbTapiCall;
      CallState: Cardinal);
    procedure hbTapiLine1CallDeallocate(Sender: ThbTapiLine; Call: ThbTapiCall);
    procedure hbTapiLine1NewCall(Sender: ThbTapiLine; Call: ThbTapiCall);
    procedure DoDropCall(Sender: TObject);
    procedure DoDial(Sender: TObject);
    procedure DoAnswerCall(Sender: TObject);
    procedure DoUpdateCalls(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
    procedure ButtonSetCallDataClick(Sender: TObject);
    procedure ButtonGetCallDataClick(Sender: TObject);
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
      begin
        hbTapiLine1.Active := False;
        Label_Privileges.Caption := '';
      end;
    end
  else
    begin
      if not hbTapiLine1.Active then
      begin
        if Pos('AutoSelect', ComboBox_Privileges.Text) > 0 then
          hbTapiLine1.Privileges.AutoSelect := True
        else  
        begin
          hbTapiLine1.Privileges.None := True;
          hbTapiLine1.Privileges.AutoSelect := False;
          if Pos('OWNER', ComboBox_Privileges.Text) > 0 then
            hbTapiLine1.Privileges.Owner := True;
          if Pos('MONITOR', ComboBox_Privileges.Text) > 0 then
            hbTapiLine1.Privileges.Monitor := True;
        end;
        hbTapiLine1.Active := True;
        Label_Privileges.Caption := Format('Privileges: %s', [hbTapiLine1.Privileges.Text]);
      end;
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
  ComboBox_Privileges.ItemIndex := 0;
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

      li.Caption       := Format('$%x',[integer(Calls[i])]);
      li.Data          := Calls[i];
      li.SubItems[0]   := inttostr(Calls[i].CallID);

      if Calls[i].IsOutgoing then
        li.SubItems[1] := Calls[i].CalledID.Address
      else
        li.SubItems[1] := Calls[i].CallerID.Address;
      li.SubItems[2]   := Calls[i].StateText;
      li.SubItems[3]   := Calls[i].PrivilegeText;

      li.ImageIndex    := 0;
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

procedure TForm1.DoAnswerCall(Sender: TObject);
var c: ThbTapiCall;
begin
  c := GetCall;
  if c = nil then exit;
  c.Answer;
end;

procedure TForm1.DoUpdateCalls(Sender: TObject);
begin
  UpdateCalls;
end;

procedure TForm1.ListView1Click(Sender: TObject);
begin
  UpdateCalls;
end;

procedure TForm1.ButtonSetCallDataClick(Sender: TObject);
var c: ThbTapiCall;
begin
  c := GetCall;
  if c = nil then exit;
  c.SetCallData(PAnsiChar(AnsiString(Edit1.Text)), length(Edit1.Text)+1);
end;

procedure TForm1.ButtonGetCallDataClick(Sender: TObject);
var c: ThbTapiCall; p: Pointer;
begin
  c := GetCall;
  if c = nil then exit;
  if c.GetCallData(p) > 0 then
  try
    Edit2.Text := PAnsiChar(p);
  finally
    FreeMem(p);
  end;
end;

end.


