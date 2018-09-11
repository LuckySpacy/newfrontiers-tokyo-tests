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
  StdCtrls, hbTAPI, hbTapiApi, hbTapiUtils, Buttons, ExtCtrls, ComCtrls, ImgList,
  Menus;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    GroupBox4: TGroupBox;
    LabelDevice: TLabel;
    Label1: TLabel;
    ComboBox_Line: TComboBox;
    Label3: TLabel;
    GroupBox5: TGroupBox;
    Label2: TLabel;
    hbTapiLine1: ThbTapiLine;
    TapiPhone1: ThbTapiPhone;
    ComboBox_Phone: TComboBox;
    Memo1: TMemo;
    Label4: TLabel;
    ListView1: TListView;
    ImageList1: TImageList;
    Label6: TLabel;
    Label7: TLabel;
    PopupMenu1: TPopupMenu;
    Steady1: TMenuItem;
    Off1: TMenuItem;
    GroupBox1: TGroupBox;
    Button_HandsetSpeaker: TSpeedButton;
    Button_HandSetMicro: TSpeedButton;
    GroupBox2: TGroupBox;
    Button_HeadsetSpeaker: TSpeedButton;
    Button_HeadsetMicro: TSpeedButton;
    Button_SpeakerSpeaker: TSpeedButton;
    Button_SpeakerMicro: TSpeedButton;
    Button_HandsetHook: TSpeedButton;
    Button_HeadsetHook: TSpeedButton;
    Button_SpeakerHook: TSpeedButton;
    TrackBar_HandsetVolume: TTrackBar;
    TrackBar_HandsetGain: TTrackBar;
    Label8: TLabel;
    Label9: TLabel;
    TrackBar_HeadsetVolume: TTrackBar;
    TrackBar_HeadsetGain: TTrackBar;
    Label10: TLabel;
    Label11: TLabel;
    TrackBar_SpeakerVolume: TTrackBar;
    TrackBar_SpeakerGain: TTrackBar;
    Label13: TLabel;
    Label14: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure DoSelectLineDevice(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure DoSelectPhoneDevice(Sender: TObject);
    procedure TapiPhone1Lamp(Sender: ThbTapiPhone; ButtonLampID: Cardinal);
    procedure TapiPhone1Display(Sender: TObject);
    procedure TapiPhone1DigitPressed(Sender: ThbTapiPhone; Digit: Char);
    procedure Steady1Click(Sender: TObject);
    procedure Off1Click(Sender: TObject);
    procedure TapiPhone1HandsetHookSwitch(Sender: TObject);
    procedure TapiPhone1HeadsetHookSwitch(Sender: TObject);
    procedure TapiPhone1SpeakerHookSwitch(Sender: TObject);
    procedure DoSetSpeaker(Sender: TObject);
    procedure DoSetMicro(Sender: TObject);
    procedure DoSetHook(Sender: TObject);
    procedure DoUpdatePhoneControls(Sender: TObject);
    procedure DoSetVolume(Sender: TObject);
    procedure DoSetGain(Sender: TObject);
    procedure TapiPhone1TapiReply(Sender: TObject; RequestID,
      ReplyCode: Cardinal);
    procedure TapiPhone1Button(Sender: ThbTapiPhone; ButtonID, ButtonMode,
      ButtonState: Cardinal);
  private
    procedure UpdateStatus;
    procedure UpdateControls;
    procedure UpdatePhoneControls;
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  // Fill in the list box with all available telephony devices
  ComboBox_Line.Items.Assign(hbTapiLine1.DeviceList);
end;

procedure TForm1.DoSelectLineDevice(Sender: TObject);
var i: integer;
begin
  Label1.Caption := '';

  // If TapiLine is currently open then close it
  hbTapiLine1.Active := False;
  TapiPhone1.Active := False;
  TapiPhone1.DeviceName := '';
  ComboBox_Phone.Items.Clear;
  UpdateControls;

  // Set TapiLine to use the device selected in the list box
  hbTapiLine1.DeviceID := ComboBox_Line.ItemIndex;

  try
    hbTapiLine1.Active := True;
    Listbox1.items.add('Line Device is active (open)');
    Listbox1.items.add(Format('Extention Version = %8.8x', [hbTapiLine1.TSP.ExtVersion]));
    if hbTapiLine1.Phones.Count > 0 then
    begin
      ComboBox_Phone.Items.Clear;
      for i := 0 to hbTapiLine1.Phones.Count-1 do
        ComboBox_Phone.Items.Add(TapiPhone1.DeviceList[hbTapiLine1.Phones.DeviceID[i]]);
    end
    else
    begin
      Memo1.Lines.Clear;
      Listbox1.items.add(hbTapiLine1.DeviceName + ' has not Phone Devices');
    end;
  except
    on E:EhbTapiError do
    begin
      Listbox1.items.add(E.Message);
    end;
  end;
  UpdateStatus;
end;

procedure TForm1.DoSelectPhoneDevice(Sender: TObject);
begin
  // If TapiLine is currently open then close it
  TapiPhone1.Active := False;
  // Set TapiPhone to use the device selected in the list box
  TapiPhone1.DeviceName := ComboBox_Phone.Text;
  TapiPhone1.Privileges.Owner := TRUE;
  try
    TapiPhone1.Active := True;
    Listbox1.items.add('Phone Device is active');
    Listbox1.items.add(Format('Extention Version = %8.8x', [TapiPhone1.TSP.ExtVersion]));
    updateControls;
  except
    on E:EhbTapiError do
    begin
      if E.ErrorCode = PHONEERR_INVALPRIVILEGE then
      try
        TapiPhone1.Privileges.Owner := FALSE;
        TapiPhone1.Active := True;
        Listbox1.items.add('Phone Device is active (Monitor only)');
        Listbox1.items.add(Format('Extention Version = %8.8x', [TapiPhone1.TSP.ExtVersion]));
        UpdateControls;
      except
        on E:EhbTapiError do
        begin
          Listbox1.items.add(E.Message);
        end;
      end
      else
        Listbox1.items.add(E.Message);
    end;
  end;
  UpdateStatus;

  if TapiPhone1.Active then
  begin
    Listbox1.items.add(Format('ButtonLamps = %d', [TapiPhone1.Controls.Count]));
  end;
end;

procedure TForm1.UpdateStatus;
begin
  if TapiPhone1.Active then
    Label7.Caption := Format('%dx%d', [TapiPhone1.Caps.DisplayNumRows, TapiPhone1.Caps.DisplayNumColumns])
  else
    Label7.Caption := '';
  UpdatePhoneControls;
  UpdateControls;
end;


procedure TForm1.ListBox1DblClick(Sender: TObject);
begin
  ListBox1.Items.Clear;
end;


procedure TForm1.TapiPhone1Lamp(Sender: ThbTapiPhone; ButtonLampID: Cardinal);
begin
  Listbox1.items.add(Format('Lamp #%d is %s %s', [ButtonLampID, TapiPhone1.Controls[ButtonLampID].LampModeText, TapiPhone1.Controls[ButtonLampID].ButtonText]));
  UpdateControls;
end;

procedure TForm1.TapiPhone1Display(Sender: TObject);
begin
  TapiPhone1.Status.Update;
  Listbox1.items.add('::OnDisplay');
  Memo1.Lines.Text := TapiPhone1.Display.Text;
end;

procedure TForm1.TapiPhone1DigitPressed(Sender: ThbTapiPhone; Digit: Char);
begin
  Listbox1.items.add(Format('Digit pressed: %s ', [Digit]));
end;

procedure TForm1.UpdateControls;
var i: integer; li: TListItem; c: ThbTapiPhoneControl;
const NoYes : array[False..True] of String = ('No', 'Yes');
begin
  with TapiPhone1 do
  begin
    if ListView1.Selected <> nil then
      c := ThbTapiPhoneControl(ListView1.Selected.Data)
    else
      c := nil;

    for i:= 0 to Controls.Count-1 do
    begin
      if i < ListView1.Items.Count then
        li := ListView1.Items[i]
      else
        li := ListView1.Items.Add;
      while li.SubItems.Count < ListView1.Columns.Count do
        li.SubItems.Add('');

      li.Caption     := Format('%d',[i]);
      li.Data        := Controls[i];
      li.SubItems[0] := Controls[i].ButtonFunctionText;
      li.SubItems[1] := Controls[i].ButtonText;
      li.SubItems[2] := Controls[i].ButtonStateText;
      li.SubItems[3] := Controls[i].LampModeText;
      li.SubItems[4] := NoYes[Controls[i].IsLamp];
      li.SubItems[5] := NoYes[Controls[i].IsButton];
      li.SubItems[6] := Controls[i].ButtonModeText;

      case Controls[i].LampMode of
        PHONELAMPMODE_OFF               : li.ImageIndex := 1;
        PHONELAMPMODE_STEADY            : li.ImageIndex := 2;
        PHONELAMPMODE_WINK,
        PHONELAMPMODE_FLASH,
        PHONELAMPMODE_FLUTTER,
        PHONELAMPMODE_BROKENFLUTTER     : li.ImageIndex := 3;
      else
        li.ImageIndex := 0;
      end;
    end;

    while ListView1.Items.Count > Controls.Count do
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

procedure TForm1.Steady1Click(Sender: TObject);
begin
  if ListView1.Selected = nil then exit;
  ThbTapiPhoneControl(ListView1.Selected.Data).LampMode := PHONELAMPMODE_STEADY;
end;

procedure TForm1.Off1Click(Sender: TObject);
begin
  if ListView1.Selected = nil then exit;
  ThbTapiPhoneControl(ListView1.Selected.Data).LampMode := PHONELAMPMODE_OFF;
end;

procedure TForm1.TapiPhone1HandsetHookSwitch(Sender: TObject);
begin
  UpdatePhoneControls;
end;

procedure TForm1.TapiPhone1HeadsetHookSwitch(Sender: TObject);
begin
  if TapiPhone1.Headset.OnHook then
    Listbox1.items.add('HeadsetHookSwitch is Onhook')
  else
    Listbox1.items.add('HeadsetHookSwitch is Offhook');
  if TapiPhone1.Headset.SpeakerActive then
    Listbox1.items.add('Headset Speakerphone is Active')
  else
    Listbox1.items.add('Headset Speakerphone is inactive');
  if TapiPhone1.Headset.MicroActive then
    Listbox1.items.add('Headset Micro is Active')
  else
    Listbox1.items.add('Headset Micro is inactive');
end;

procedure TForm1.TapiPhone1SpeakerHookSwitch(Sender: TObject);
begin
  if TapiPhone1.Speakerphone.OnHook then
    Listbox1.items.add('SpeakerHookSwitch is Onhook')
  else
    Listbox1.items.add('SpeakerHookSwitch is Offhook');
  if TapiPhone1.Speakerphone.SpeakerActive then
    Listbox1.items.add('Speakerphone Speakerphone is Active')
  else
    Listbox1.items.add('Speakerphone Speakerphone is inactive');
  if TapiPhone1.Speakerphone.MicroActive then
    Listbox1.items.add('Speakerphone Micro is Active')
  else
    Listbox1.items.add('Speakerphone Micro is inactive');
end;

procedure TForm1.UpdatePhoneControls;
begin
  if TapiPhone1.Active = FALSE then
  begin
    Button_HandsetHook.Down             := FALSE;
    Button_HeadsetHook.Down             := FALSE;
    Button_SpeakerHook.Down             := FALSE;
    Button_HandsetSpeaker.Down          := FALSE;
    Button_HandsetMicro.Down            := FALSE;
    Button_HeadsetSpeaker.Down          := FALSE;
    Button_HeadsetMicro.Down            := FALSE;
    Button_SpeakerSpeaker.Down          := FALSE;
    Button_SpeakerMicro.Down            := FALSE;
  end
  else
  begin
    Button_HandsetHook.Down             := not TapiPhone1.Handset.OnHook;
    Button_HeadsetHook.Down             := not TapiPhone1.Headset.OnHook;
    Button_SpeakerHook.Down             := not TapiPhone1.Speakerphone.OnHook;
    Button_HandsetSpeaker.Down          := TapiPhone1.Handset.SpeakerActive;
    Button_HandsetMicro.Down            := TapiPhone1.Handset.MicroActive;
    Button_HeadsetSpeaker.Down          := TapiPhone1.Headset.SpeakerActive;
    Button_HeadsetMicro.Down            := TapiPhone1.Headset.MicroActive;
    Button_SpeakerSpeaker.Down          := TapiPhone1.Speakerphone.SpeakerActive;
    Button_SpeakerMicro.Down            := TapiPhone1.Speakerphone.MicroActive;


//    TrackBar_RingerVolume.Position      := TapiPhone1.Ringer.Volume;
    TrackBar_SpeakerVolume.OnChange := nil;
    TrackBar_SpeakerVolume.Position := TapiPhone1.Speakerphone.Volume;
    TrackBar_SpeakerVolume.OnChange := DoSetVolume;
    TrackBar_SpeakerGain.OnChange   := nil;
    TrackBar_SpeakerGain.Position   := TapiPhone1.Speakerphone.Gain;
    TrackBar_SpeakerGain.OnChange   := DoSetGain;
    TrackBar_HeadsetVolume.OnChange := nil;
    TrackBar_HeadsetVolume.Position := TapiPhone1.Headset.Volume;
    TrackBar_HeadsetVolume.OnChange := DoSetVolume;
    TrackBar_HeadsetGain.OnChange   := nil;
    TrackBar_HeadsetGain.Position   := TapiPhone1.Headset.Gain;
    TrackBar_HeadsetGain.OnChange   := DoSetGain;
    TrackBar_HandsetVolume.OnChange := nil;
    TrackBar_HandsetVolume.Position := TapiPhone1.Handset.Volume;
    TrackBar_HandsetVolume.OnChange := DoSetVolume;
    TrackBar_HandsetGain.OnChange   := nil;
    TrackBar_HandsetGain.Position   := TapiPhone1.Handset.Gain;
    TrackBar_HandsetGain.OnChange   := DoSetGain;
  end;
end;

procedure TForm1.DoSetSpeaker(Sender: TObject);
begin
  case TSpeedButton(Sender).Tag of
  0: TapiPhone1.HandSet.SpeakerActive := TSpeedButton(Sender).Down;
  1: TapiPhone1.HeadSet.SpeakerActive := TSpeedButton(Sender).Down;
  2: TapiPhone1.Speakerphone.SpeakerActive := TSpeedButton(Sender).Down;
  end;
end;

procedure TForm1.DoSetMicro(Sender: TObject);
begin
  case TSpeedButton(Sender).Tag of
  0: TapiPhone1.HandSet.MicroActive   := TSpeedButton(Sender).Down;
  1: TapiPhone1.HeadSet.MicroActive   := TSpeedButton(Sender).Down;
  2: TapiPhone1.Speakerphone.MicroActive   := TSpeedButton(Sender).Down;
  end;
end;

procedure TForm1.DoSetHook(Sender: TObject);
begin
  try
    case TSpeedButton(Sender).Tag of
    0: TapiPhone1.HandSet.OnHook        := not TSpeedButton(Sender).Down;
    1: TapiPhone1.HeadSet.OnHook        := not TSpeedButton(Sender).Down;
    2: TapiPhone1.Speakerphone.OnHook   := not TSpeedButton(Sender).Down;
    end;
  except
    UpdatePhoneControls;
    raise;
  end;
end;

procedure TForm1.DoUpdatePhoneControls(Sender: TObject);
begin
  UpdatePhoneControls;
end;

procedure TForm1.DoSetVolume(Sender: TObject);
begin
  try
    case TSpeedButton(Sender).Tag of
    0: TapiPhone1.HandSet.Volume        := TTrackBar(Sender).Position;
    1: TapiPhone1.HeadSet.Volume        := TTrackBar(Sender).Position;
    2: TapiPhone1.Speakerphone.Volume   := TTrackBar(Sender).Position;
    end;
  except
    UpdatePhoneControls;
    raise;
  end;
end;

procedure TForm1.DoSetGain(Sender: TObject);
begin
  try
    case TSpeedButton(Sender).Tag of
    0: TapiPhone1.HandSet.Gain        := TrackBar_HandsetGain.Position;
    1: TapiPhone1.HeadSet.Gain        := TrackBar_HeadsetGain.Position;
    2: TapiPhone1.Speakerphone.Gain   := TrackBar_SpeakerGain.Position;
    end;
  except
    UpdatePhoneControls;
    raise;
  end;
end;



procedure TForm1.TapiPhone1TapiReply(Sender: TObject; RequestID,
  ReplyCode: Cardinal);
begin
  Listbox1.items.add(Format('Reply RequestID=0x%X, ReplyCode=0x%X', [RequestID, ReplyCode]));
end;

procedure TForm1.TapiPhone1Button(Sender: ThbTapiPhone; ButtonID, ButtonMode,
  ButtonState: Cardinal);
begin
  Listbox1.items.add(Format('Button #%d ', [ButtonID]));
  UpdateControls;
end;

end.
