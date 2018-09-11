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
  hbTapiApi, hbTapi, hbTapiUtils, StdCtrls, MMSystem, ExtCtrls,
  ComCtrls, Buttons, hbTapiWave;

type
  TForm1 = class(TForm)
    TapiLine: ThbTapiLine;
    WaveOut: ThbWaveOut;
    WaveIn: ThbWaveIn;
    ListView_Journal: TListView;
    Panel1: TPanel;
    ComboDeviceList: TComboBox;
    lbDevice: TLabel;
    StatusBar: TStatusBar;
    TimerToAnswer: TTimer;
    WaveOutSpeaker: ThbWaveOut;
    btnAction: TButton;
    cbAutoAnswer: TCheckBox;
    lbCaller: TLabel;
    edCall: TEdit;
    edFile: TEdit;
    lbFile: TLabel;
    SpeedButtonStop: TSpeedButton;
    SpeedButton1: TSpeedButton;
    OpenDialog1: TOpenDialog;
    SpeedButtonPlay: TSpeedButton;
    procedure ComboDeviceListChange(Sender: TObject);
    procedure WaveOutDone(Sender: TObject);
    procedure TapiLineConnected(Sender: ThbTapiLine; Call: ThbTapiCall);
    procedure TapiLineOffering(Sender: ThbTapiLine; Call: ThbTapiCall);
    procedure TapiLineIdle(Sender: ThbTapiLine; Call: ThbTapiCall);
    procedure TimerToAnswerTimer(Sender: TObject);
    procedure TapiLineCallState(Sender: ThbTapiLine; Call: ThbTapiCall;
      CallState: Cardinal);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ListView_JournalDblClick(Sender: TObject);
    procedure btnActionClick(Sender: TObject);
    procedure TapiLineCallerID(Sender: ThbTapiLine; Call: ThbTapiCall);
    procedure TapiLineDigit(Sender: ThbTapiLine; Call: ThbTapiCall;
      Digit: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButtonStopClick(Sender: TObject);
    procedure WaveOutSpeakerDone(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButtonPlayClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
    procedure AddCallToList(Call : ThbTapiCall);
    function  GetCallerInfo(Call : ThbTapiCall) : String;
    procedure GetLineDevices;
    procedure Start(var Msg: TMessage); message WM_USER;
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.ComboDeviceListChange(Sender: TObject);
begin
  TapiLine.Active := false;
  if ComboDeviceList.ItemIndex >= 0 then begin
    TapiLine.Privileges.Owner := true;
    TapiLine.DeviceID         := Integer(ComboDeviceList.Items.Objects[ComboDeviceList.ItemIndex]);
    TapiLine.Active           := true;
    btnAction.Enabled         := true;
  end;
end;

procedure TForm1.WaveOutDone(Sender: TObject);
var
  i : Integer;
  Filename : String;
begin
  WaveOut.Active := false;
  i := 0;
  repeat
    inc(i);
    Filename := Format('Rec%03.3d.wav', [i]);
  until not FileExists(Filename);
  try
    WaveIn.Filename := Filename;
    WaveIn.Active := true;
    StatusBar.Panels[1].Text := 'Recording';
  except
    On E:Exception do
      ShowMessage(E.Message);
  end;
end;

procedure TForm1.TapiLineConnected(Sender: ThbTapiLine; Call: ThbTapiCall);
begin
  if not Call.WaveOut.Available then begin
    ShowMessage('Could''t get wave/out handle');
    EXIT;
  end;

  if not Call.WaveIn.Available then begin
    ShowMessage('Could''t get wave/in handle');
    EXIT;
  end;

  WaveIn.DeviceID    := Call.WaveIn.DeviceID;
  WaveOut.DeviceID   := Call.WaveOut.DeviceID;
  WaveOut.PlayList.Clear;
  WaveOut.PlayList.Add(edFile.Text);
  WaveOut.PlayList.Add('Beep(1300,300)');
  WaveOut.Active     := true;
  StatusBar.Panels[1].Text := 'Playing...';
  btnAction.Caption := 'Drop';
{$ifdef EDT_PROFESSIONAL}
  if Call.MonitorDigits.Available then
    Call.MonitorDigits.Active := true; // Feature of hbTapi Professional
{$endif}
end;

procedure TForm1.TapiLineOffering(Sender: ThbTapiLine; Call: ThbTapiCall);
begin
  if cbAutoAnswer.Checked then begin
    TimerToAnswer.Enabled := true;
    StatusBar.Panels[1].Text := Format('Ringing. Answer in %d sec.',[TimerToAnswer.Interval div 1000]);
  end;
  edCall.Text := GetCallerInfo(Call);
  btnAction.Caption := 'Answer';
end;

procedure TForm1.TapiLineIdle(Sender: ThbTapiLine; Call: ThbTapiCall);
begin
  AddCallToList(Call);
  WaveOut.Active   := false;
  WaveIn.Active := false;
  btnAction.Caption := 'Make Call';
  edCall.Text  := '';
  StatusBar.Panels[1].Text := 'Waiting...';
end;

procedure TForm1.TimerToAnswerTimer(Sender: TObject);
begin
  TimerToAnswer.Enabled := false;
  if TapiLine.Calls.Count > 0 then begin
    if (TapiLine.Calls[0].State = LINECALLSTATE_OFFERING) or
       (TapiLine.Calls[0].State = LINECALLSTATE_ACCEPTED) then
    begin
      TapiLine.Calls[0].Answer
    end
    else
      TapiLine.Calls[0].Drop;
  end;
end;

procedure TForm1.AddCallToList(Call: ThbTapiCall);
begin
  with ListView_Journal.Items.Add do
  begin
    Caption := DateTimetoStr(Call.BeginTime);
    SubItems.Add(GetCallerInfo(Call));
    if StatusBar.Panels[1].Text = 'Recording' then begin
      SubItems.Add(TimeToStr(WaveIn.Time));
      SubItems.Add(WaveIn.Filename);
    end;
  end;
end;

procedure TForm1.TapiLineCallState(Sender: ThbTapiLine; Call: ThbTapiCall;
  CallState: Cardinal);
begin
  StatusBar.Panels[0].Text := LineCallStateToStr(CallState);
  if (CallState = LINECALLSTATE_OFFERING) and
     (Call.Features and LINECALLFEATURE_ACCEPT > 0) then
  try
    Call.Accept;
  except
  end;
  TapiLineCallerID(Sender,Call);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i : Integer;
begin
  for i := 0 to TapiLine.Calls.Count-1 do begin
    TapiLine.Calls[i].Drop;
  end;

  WaveOut.Active   := false;
  WaveIn.Active := false;
  TapiLine.Active   := false;
end;

procedure TForm1.ListView_JournalDblClick(Sender: TObject);
begin
  SpeedButtonPlayClick(nil);
end;

procedure TForm1.btnActionClick(Sender: TObject);
begin
  if TapiLine.Calls.Count = 0 then begin
    TapiLine.MakeCall(edCall.Text);
    btnAction.Caption := 'Drop';
  end else
    TimerToAnswerTimer(nil);
end;

procedure TForm1.TapiLineCallerID(Sender: ThbTapiLine; Call: ThbTapiCall);
begin
  edCall.Text := GetCallerInfo(Call);
end;

function TForm1.GetCallerInfo(Call: ThbTapiCall): String;
begin
  if Call.CallerID.Name <> '' then
    Call.Notes['Name']    := Call.CallerID.Name;
  if Call.CallerID.Address <> '' then
    Call.Notes['Address'] := Call.CallerID.Address;

  if Call.Notes['Name'] <> '' then
    result := Call.Notes['Name']+' - '+Call.Notes['Address']
  else
    result := Call.Notes['Address'];
end;

procedure TForm1.GetLineDevices;
var
  i : Integer;
begin
  if ComboDeviceList.Items.Count > 0 then EXIT;
  TapiLine.Privileges.Owner := false;
  // Search for possible tapi devices
  // normaly we need AUTOMATEDVOICE
  for i := 0 to TapiLine.DeviceList.count-1 do begin
    TapiLine.DeviceID := i;
    if (TapiLine.Caps.MediaModes and LINEMEDIAMODE_AUTOMATEDVOICE) <> 0 then
    try
      TapiLine.Active := true;
      if TapiLine.WaveIn.Available and TapiLine.WaveOut.Available then
        ComboDeviceList.Items.AddObject(
          Format('DeviceID: %02.2d - ',[i])+TapiLine.DeviceList[i],TObject(i));
    except
    end;
    TapiLine.Active := false;
  end;

  if ComboDeviceList.Items.Count = 0 then begin
    // if there is no AUTOMATEDVOICE device
    // we look INTERACTIVEVOICE

    for i := 0 to TapiLine.DeviceList.count-1 do begin
      TapiLine.DeviceID := i;
      if (TapiLine.Caps.MediaModes and LINEMEDIAMODE_INTERACTIVEVOICE) <> 0 then
      try
        TapiLine.Active := true;
        if TapiLine.WaveIn.Available and TapiLine.WaveOut.Available then
          ComboDeviceList.Items.AddObject(
            Format('DeviceID: %02.2d - ',[i])+TapiLine.DeviceList[i],TObject(i));
      except
      end;
      TapiLine.Active := false;
    end;
  end;
  if ComboDeviceList.Items.Count = 0 then
    ShowMessage('Could not find a TAPI device assigned with a wave device');

end;

// Feature of hbTapi Professional

procedure TForm1.TapiLineDigit(Sender: ThbTapiLine; Call: ThbTapiCall;
  Digit: Char);
begin
  case Digit of
    '*' :
    begin
      WaveOut.Active   := false;
      WaveOut.Active   := true;
      StatusBar.Panels[1].Text := 'restarted by *'
    end;
    '#' :
    begin
      WaveOutDone(nil);
    end;
  end;
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  TapiLineDigit(nil,nil,Key);
end;

procedure TForm1.SpeedButtonStopClick(Sender: TObject);
begin
  WaveOutSpeaker.Active := false;
  SpeedButtonStop.Visible := false;
  SpeedButtonPlay.Visible := true;
end;

procedure TForm1.WaveOutSpeakerDone(Sender: TObject);
begin
  SpeedButtonStopClick(nil);
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then begin
    edFile.Text := OpenDialog1.FileName;
    edFile.SetFocus;
  end;
end;

procedure TForm1.SpeedButtonPlayClick(Sender: TObject);
var
  aFilename : String;
begin
  if not WaveOutSpeaker.Active then begin
    aFilename := '';
    if ListView_Journal.Focused and (ListView_Journal.Items.Count>0) then begin
      if  assigned(ListView_Journal.Selected) and
         (ListView_Journal.Selected.SubItems.Count = 3)
      then
        aFilename := ListView_Journal.Selected.SubItems[2]
    end else
      aFilename := edFile.Text;
    if aFilename = '' then
      EXIT;
    WaveOutSpeaker.PlayList.Clear;
    WaveOutSpeaker.PlayList.Add(aFilename);
    WaveOutSpeaker.Active := true;
    SpeedButtonPlay.Visible := false;
    SpeedButtonStop.Visible := true;
  end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  PostMessage(Handle, WM_USER, 0, 0);
end;

procedure TForm1.Start(var Msg: TMessage);
begin
  Update;
  Screen.Cursor := crHourGlass;
  try
    GetLineDevices;
  finally
    Screen.Cursor := crDefault;
  end;
end;

end.
