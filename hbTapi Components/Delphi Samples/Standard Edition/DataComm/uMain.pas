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
  StdCtrls, ExtCtrls, hbTAPI, hbTapiUtils, hbTapiApi, ComCtrls, hbComm;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    ComboBoxDevice: TComboBox;
    CheckBoxActive: TCheckBox;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    ButtonDrop: TButton;
    EditCallPhoneNumber: TEdit;
    ButtonDial: TButton;
    ButtonAnswer: TButton;
    GroupBox3: TGroupBox;
    Edit1: TEdit;
    ButtonSend: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label_Com: TLabel;
    Label_CallState: TLabel;
    Label9: TLabel;
    Label_Info: TLabel;
    ListBox1: TListBox;
    CheckBox1: TCheckBox;
    ComboBox_Timeout: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    ListBox2: TListBox;
    Label6: TLabel;
    Label7: TLabel;
    GroupBox4: TGroupBox;
    ListBox_Log: TListBox;
    Label8: TLabel;
    hbTapiLine1: ThbTapiLine;
    ComPort1: ThbComPort;
    procedure CheckBoxActiveClick(Sender: TObject);
    procedure ComboBoxDeviceChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DoMakeCall(Sender: TObject);
    procedure hbTapiLine1CallState(Sender: ThbTapiLine; Call: ThbTapiCall;
      CallState: Cardinal);
    procedure hbTapiLine1CallDeallocate(Sender: ThbTapiLine; Call: ThbTapiCall);
    procedure hbTapiLine1NewCall(Sender: ThbTapiLine; Call: ThbTapiCall);
    procedure DoDropCall(Sender: TObject);
    procedure DoAnswer(Sender: TObject);
    procedure ButtonSendClick(Sender: TObject);
    procedure hbTapiLine1Offering(Sender: ThbTapiLine; Call: ThbTapiCall);
    procedure DoClearList(Sender: TObject);
    procedure ComPort1Receive(Sender: TObject; Count: Integer);
  private
    function GetCall: ThbTapiCall;
    procedure UpdateCalls;
    procedure UpdateComm;
    procedure Log(Value: String);
  end;

var Form1:        TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
var i: integer;
begin
  // Get all line devices which support data communications
  for i := 0 to hbTapiLine1.DeviceList.Count-1 do
  begin
    hbTapiLine1.DeviceID := i;
    if hbTapiLine1.Available and (hbTapiLine1.Caps.MediaModes and LINEMEDIAMODE_DATAMODEM > 0) then
      ComboBoxDevice.Items.AddObject(hbTapiLine1.DeviceList[i], TObject(i));
  end;

  if ComboBoxDevice.Items.Count > 0 then
    ComboBoxDevice.ItemIndex := 0;

  ComboBox_Timeout.text := IntToStr(hbTapiLine1.Options.ReplyTimeout div 1000);
  ComboBoxDevice.ItemIndex := 0;
  ComboBoxDeviceChange(ComboBoxDevice);
  UpdateCalls;
  UpdateComm;
end;

procedure TForm1.Log(Value: String);
begin
  ListBox_Log.Items.Add(Value);
end;

procedure TForm1.CheckBoxActiveClick(Sender: TObject);
begin
  // To abvoid errors, we only use LINEMEDIAMODE_DATAMODEM
  hbTapiLine1.MediaModes         := LINEMEDIAMODE_DATAMODEM;
  hbTapiLine1.Privileges.Owner   := True;
  hbTapiLine1.Privileges.Monitor := True;

  if not CheckBoxActive.Checked then
  begin
    if hbTapiLine1.Active then
    begin
      hbTapiLine1.Active := False;
      Log('Device closed');
    end;
  end
  else
  begin
    if not hbTapiLine1.Active then
    try
      hbTapiLine1.Active := True;
      Log('Device opened');
    except
      on E:EhbTapiError do
      begin
        Log(E.Message);

        // Try it again with not privileges
        hbTapiLine1.Privileges.None := TRUE;
        try
          hbTapiLine1.Active := True;
          Log('Device opened, but not 100% TAPI compatible');
        except
          on E:EhbTapiError do
            Log(E.Message);
        end;
      end;  
    end;
  end;
end;

procedure TForm1.ComboBoxDeviceChange(Sender: TObject);
begin
  if hbTapiLine1.Active then
  begin
    CheckBoxActive.Checked := False;
    hbTapiLine1.Active := FALSE;
  end;
  if ComboBoxDevice.ItemIndex >= 0 then begin
    hbTapiLine1.DeviceID := Integer(ComboBoxDevice.Items.Objects[ComboBoxDevice.ItemIndex]);
    Log(Format('Select: %s',[hbTapiLine1.DeviceName]));
    Log(Format('DeviceID:%d',[hbTapiLine1.DeviceID]));
  end;
end;

procedure TForm1.UpdateCalls;
begin
  with hbTapiLine1 do
  begin
    if Calls.Count > 0 then
    begin
      Label_CallState.Caption := Calls[0].StateText;
      if Calls[0].IsOutgoing then
      begin
        Label_Info.Caption := 'Outgoing Call';
{$ifdef EDT_PROFESSIONAL}
        if Calls[0].CalledID.AddressAvail then
          Label_Info.Caption := Calls[0].CalledID.Address;
{$endif}		
      end
      else if Calls[0].IsIncoming and Calls[0].CallerID.AddressAvail then
        Label_Info.Caption := Calls[0].CallerID.Address;
    end
    else
    begin
      Label_CallState.Caption := 'NO CALL';
      Label_Info.Caption      := '';
    end;
  end;
end;

procedure TForm1.UpdateComm;
begin
  if ComPort1.Active then
    Label_Com.Caption := 'ACTIVE'
  else
    Label_Com.Caption := 'NOT ACTIVE';
end;

function TForm1.GetCall: ThbTapiCall;
begin
  result := nil;
  if hbTapiLine1.Calls.Count > 0 then
  begin
    result := hbTapiLine1.Calls[0];
  end;
end;

procedure TForm1.DoMakeCall(Sender: TObject);
var cp: ThbTapiCallParams;
begin
  hbTapiLine1.Options.ReplyTimeout := StrToIntDef(ComboBox_Timeout.Text, 10) * 1000;
  // use the ThbTapiCallParams entead of ThbTapiLine.CallParams
  cp := ThbTapiCallParams.Create;
  try
    cp.AddressMode  := LINEADDRESSMODE_ADDRESSID;
    cp.AddressID    := 0;
    cp.MediaMode    := LINEMEDIAMODE_DATAMODEM;
    cp.Flags        := 0;
    cp.NoAnswerTimeout := 3;
    hbTapiLine1.MakeCall(EditCallPhoneNumber.Text, 0, cp.TapiData);
  finally
    cp.Free;
  end;
end;

procedure TForm1.hbTapiLine1CallState(Sender: ThbTapiLine; Call: ThbTapiCall;
  CallState: Cardinal);
begin
  case Call.State of
    LINECALLSTATE_CONNECTED :
    begin
      Log('Connected');
      if Call.Comm.Available then
        Log(Format('Comm-Handle available (0x%X)', [Call.Comm.Handle]))
      else
        Log('Comm Handle not available');

      if Call.Comm.Available and (ComPort1.Active = FALSE) then
      begin
        ListBox1.Items.Clear;
        ListBox2.Items.Clear;
        ComPort1.Handle := Call.Comm.Handle;
        try
          ComPort1.Active := True;
        except
        end;
      end;
    end;
  else
    if Comport1.Active then
    begin
      Comport1.Active := False;
      ComPort1.Handle := 0;
      Log('ComPort closed');
    end;
  end;
  UpdateCalls;
  UpdateComm;
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
  hbTapiLine1.Options.ReplyTimeout := StrToIntDef(ComboBox_Timeout.Text, 10) * 1000;
  c := GetCall;
  if c = nil then exit;
  c.Drop;
end;

procedure TForm1.DoAnswer(Sender: TObject);
var c: ThbTapiCall;
begin
  hbTapiLine1.Options.ReplyTimeout := StrToIntDef(ComboBox_Timeout.Text, 10) * 1000;
  c := GetCall;
  if c = nil then exit;
  c.Answer;
end;

procedure TForm1.ButtonSendClick(Sender: TObject);
begin
  ComPort1.WriteAnsiStr(Edit1.Text + #10 + #13);
end;

procedure TForm1.hbTapiLine1Offering(Sender: ThbTapiLine; Call: ThbTapiCall);
begin
  if Checkbox1.Checked then
  try
    Call.Answer;
  except
    on E:EhbTapiError do
      Log(E.Message);
  end;
end;

procedure TForm1.DoClearList(Sender: TObject);
begin
  TListBox(Sender).Items.Clear;
end;

procedure TForm1.ComPort1Receive(Sender: TObject; Count: Integer);
var
  S1, S2 : String; i: integer;
begin
  S1 := ComPort1.ReadAnsiStr(Count);
  S2 := '';
  for i := 1 to length(S1) do
  begin
    if ord(S1[i]) < ord(' ') then
      s2 := s2 + '<' + IntToStr(ord(s1[i])) + '>'
    else
      s2 := s2 + s1[i];
    if ord(s1[i]) = 10 then
    begin
      if Listbox2.Items.Count = 0 then
        Listbox2.Items.Add(s2)
      else
        Listbox2.Items[Listbox2.Items.Count-1] := Listbox2.Items[Listbox2.Items.Count-1] + s2;
      Listbox2.Items.Add('');
      s2 := '';
    end;
  end;
  if Listbox2.Items.Count = 0 then
    Listbox2.Items.Add(s2)
  else
    Listbox2.Items[Listbox2.Items.Count-1] := Listbox2.Items[Listbox2.Items.Count-1] + s2;
end;

end.


