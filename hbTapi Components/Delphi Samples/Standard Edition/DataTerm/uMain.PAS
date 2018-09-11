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
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ExtCtrls, StdCtrls, hbComm, hbCommUtils, uSettings, Buttons,
  hbTapi, hbTapiUtils, hbTapiApi;
type
  TForm1 = class(TForm)
    MainMenu: TMainMenu;
    menuLine: TMenuItem;
    menuOnLine: TMenuItem;
    menuExit: TMenuItem;
    menuChange: TMenuItem;
    menuPort: TMenuItem;
    menuBaud: TMenuItem;
    menuDataBits: TMenuItem;
    menuParity: TMenuItem;
    menuStopBits: TMenuItem;
    menuCOM1: TMenuItem;
    menuCOM2: TMenuItem;
    menuCOM3: TMenuItem;
    menuCOM4: TMenuItem;
    menu300: TMenuItem;
    menu1200: TMenuItem;
    menu2400: TMenuItem;
    menu4800: TMenuItem;
    menu9600: TMenuItem;
    menu19200: TMenuItem;
    menu38400: TMenuItem;
    menu57600: TMenuItem;
    menuSeven: TMenuItem;
    menuEight: TMenuItem;
    menuNone: TMenuItem;
    menuEven: TMenuItem;
    menuOdd: TMenuItem;
    menuOne: TMenuItem;
    menuTwo: TMenuItem;
    menuControl: TMenuItem;
    menuFlowControl: TMenuItem;
    menuRtsCts: TMenuItem;
    menuXonXoff: TMenuItem;
    menuNoFlow: TMenuItem;
    menuDTR: TMenuItem;
    menuRTS: TMenuItem;
    menuOne5: TMenuItem;
    ComPort1: ThbComPort;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    N1: TMenuItem;
    menuProperties: TMenuItem;
    ComPortStatusLED1: ThbComPortStatusLED;
    ComPortStatusLED2: ThbComPortStatusLED;
    ComPortStatusLED3: ThbComPortStatusLED;
    ComPortStatusLED4: ThbComPortStatusLED;
    ComPortStatusLED5: ThbComPortStatusLED;
    ComPortStatusLED6: ThbComPortStatusLED;
    ComPortStatusLED7: ThbComPortStatusLED;
    menuMark: TMenuItem;
    menuSpace: TMenuItem;
    menuSix: TMenuItem;
    menuFive: TMenuItem;
    menuEcho: TMenuItem;
    menu7200: TMenuItem;
    menu14400: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    menuDtrDsr: TMenuItem;
    menuBreak: TMenuItem;
    Label_Info: TLabel;
    menuSend: TMenuItem;
    ABC1: TMenuItem;
    menuReceive: TMenuItem;
    LargeText1: TMenuItem;
    N5: TMenuItem;
    menuStopsending: TMenuItem;
    menuAutoReceive: TMenuItem;
    N6: TMenuItem;
    menuReceiveData: TMenuItem;
    N1MB1: TMenuItem;
    menuDial: TMenuItem;
    N7: TMenuItem;
    Hangup1: TMenuItem;
    Timer1: TTimer;
    Panel2: TPanel;
    Splitter1: TSplitter;
    menuTimeouts: TMenuItem;
    N8: TMenuItem;
    Panel3: TPanel;
    Panel4: TPanel;
    CheckBox_ShowEvents: TCheckBox;
    ListBox2: TListBox;
    menu110: TMenuItem;
    menuDSRSensitivity: TMenuItem;
    Read10Bytes1: TMenuItem;
    hbTapiLine1: ThbTapiLine;
    Panel5: TPanel;
    Memo1: TMemo;
    Splitter2: TSplitter;
    ListBox1: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure menuOnLineClick(Sender: TObject);
    procedure menuCOMClick(Sender: TObject);
    procedure menuExitClick(Sender: TObject);
    procedure menuNoneClick(Sender: TObject);
    procedure menuEvenClick(Sender: TObject);
    procedure menuOddClick(Sender: TObject);
    procedure menuStopbitsClick(Sender: TObject);
    procedure DoKeyPress(Sender: TObject; var Key: Char);
    procedure menuDTRsetClick(Sender: TObject);
    procedure menuRTSsetClick(Sender: TObject);
    procedure menuDTRclearClick(Sender: TObject);
    procedure menuRTSclearClick(Sender: TObject);
    procedure menuRtsCtsClick(Sender: TObject);
    procedure menuXonXoffClick(Sender: TObject);
    procedure menuNoFlowClick(Sender: TObject);
    procedure ComPort1DSR(Sender: TObject);
    procedure ComPort1CTS(Sender: TObject);
    procedure menuClearClick(Sender: TObject);
    procedure ComPort1BREAK(Sender: TObject);
    procedure ComPort1CommError(Sender: TObject; Error: Cardinal);
    procedure menuPropertiesClick(Sender: TObject);
    procedure menuDatabitsClick(Sender: TObject);
    procedure menuEchoClick(Sender: TObject);
    procedure menuDtrDsrClick(Sender: TObject);
    procedure menuBaudClick(Sender: TObject);
    procedure Text1Click(Sender: TObject);
    procedure menuBreakClick(Sender: TObject);
    procedure menuHelloClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure menuMarkClick(Sender: TObject);
    procedure menuSpaceClick(Sender: TObject);
    procedure ABC1Click(Sender: TObject);
    procedure menuReceiveClick(Sender: TObject);
    procedure LargeText1Click(Sender: TObject);
    procedure menuStopsendingClick(Sender: TObject);
    procedure menuAutoReceiveClick(Sender: TObject);
    procedure DoUpdateStatus(Sender: TObject);
    procedure N1MB1Click(Sender: TObject);
    procedure ComPort1CommEvent(Sender: TObject; Event: Cardinal);
    procedure N11Click(Sender: TObject);
    procedure ComPort1Receive(Sender: TObject; Count: integer);
    procedure ComPort1Activate(Sender: TObject);
    procedure ComPort1Deactivate(Sender: TObject);
    procedure ComPort1txEmpty(Sender: TObject);
    procedure ComPort1SendTimeout(Sender: TObject; Count: Integer);
    procedure ComPort1DCD(Sender: TObject);
    procedure ComPort1Error(Sender: TObject; Errors: Cardinal);
    procedure ListBoxDblClick(Sender: TObject);
    procedure MemoDblClick(Sender: TObject);
    procedure menuTimeoutsClick(Sender: TObject);
    procedure menuDTRClick(Sender: TObject);
    procedure menuRTSClick(Sender: TObject);
    procedure ComPort1Ring(Sender: TObject);
    procedure ComPort1Event(Sender: TObject; Events: Cardinal);
    procedure menuDSRSensitivityClick(Sender: TObject);
    procedure Read10Bytes1Click(Sender: TObject);
    procedure DoMakeCall(Sender: TObject);
    procedure DoHangup(Sender: TObject);
    procedure hbTapiLine1CallState(Sender: ThbTapiLine; Call: ThbTapiCall;
      CallState: Cardinal);
    procedure hbTapiLine1CallDeallocate(Sender: ThbTapiLine; Call: ThbTapiCall);
  private
    procedure UpdateStatus;
    procedure UpdateMenu;
    procedure SendData(Count: integer);
    procedure Log(s: String);
  public
  end ;

var
  Form1: TForm1;

implementation
uses inifiles;

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
var s: String; m: TMenuItem; i: integer;
begin
  with hbTapiLine1 do
  begin
    for i := 0 to DeviceList.Count-1 do
    begin
      m := TMenuItem.Create(self);
      m.Caption := DeviceList[i];
      m.OnClick := DoMakeCall;
      m.Tag     := i;
      menuDial.Add(m);
    end;
  end;
  if ComPort1.Active = False then with TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini')) do
  try
    s := ReadString('ComPort', 'Mode', '');
    if s <> '' then
      ComPort1.Settings := s;
  finally
    Free;
  end;
  UpdateMenu;
  UpdateStatus;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  with TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini')) do
  try
    if (ReadString('ComPort', 'Mode', '') <> ComPort1.Settings) and
       (MessageDlg('Save current settings?', mtConfirmation, [mbYes,mbNo], 0) = mrYes) then
      WriteString('ComPort', 'Mode', ComPort1.Settings);
  finally
    Free;
  end;
end;


procedure TForm1.Log(s: String);
begin
  if CheckBox_ShowEvents.checked then
    Listbox2.Items.Add(s);
end;

procedure TForm1.menuOnLineClick(Sender: TObject);
begin
  ComPort1.Active := not ComPort1.Active;
  Memo1.SetFocus;
  UpdateMenu;
  UpdateStatus;
end;

procedure TForm1.menuExitClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.menuCOMClick(Sender: TObject);
begin
  ComPort1.PortName := Format('COM%d', [TMenuItem(Sender).Tag]);
  UpdateMenu;
  UpdateStatus;
end;


procedure TForm1.menuBaudClick(Sender: TObject);
begin
  ComPort1.Baudrate := TMenuItem(Sender).Tag;
  UpdateStatus;
  UpdateMenu;
end;

procedure TForm1.menuNoneClick(Sender: TObject);
begin
  ComPort1.Parity := NOPARITY;
  UpdateStatus;
  UpdateMenu;
end;

procedure TForm1.menuEvenClick(Sender: TObject);
begin
  ComPort1.Parity := EVENPARITY;
  UpdateStatus;
  UpdateMenu;
end;

procedure TForm1.menuOddClick(Sender: TObject);
begin
  ComPort1.Parity := ODDPARITY;
  UpdateStatus;
  UpdateMenu;
end;

procedure TForm1.menuStopbitsClick(Sender: TObject);
begin
  ComPort1.StopBits := TMenuItem(Sender).Tag;
  UpdateStatus;
  UpdateMenu;
end;

procedure TForm1.DoKeyPress(Sender: TObject; var Key: Char);
begin
  if ComPort1.Active then
    ComPort1.WriteAnsiStr(Key);
end;

procedure TForm1.menuDTRsetClick(Sender: TObject);
begin
  ComPort1.DTR := True;
  UpdateStatus;
  UpdateMenu;
end;

procedure TForm1.menuRTSsetClick(Sender: TObject);
begin
  ComPort1.RTS := True;
  UpdateStatus;
  UpdateMenu;
end;

procedure TForm1.menuDTRclearClick(Sender: TObject);
begin
  ComPort1.DTR := False;
  UpdateStatus;
  UpdateMenu;
end;

procedure TForm1.menuRTSclearClick(Sender: TObject);
begin
  ComPort1.RTS := False;
  UpdateStatus;
  UpdateMenu;
end;

procedure TForm1.menuRtsCtsClick(Sender: TObject);
begin
  ComPort1.FlowCtrl.Handshake := COMPORTHANDSHAKE_RTSCTS;
  UpdateStatus;
  UpdateMenu;
end;

procedure TForm1.menuXonXoffClick(Sender: TObject);
begin
  ComPort1.FlowCtrl.Handshake := COMPORTHANDSHAKE_XONXOFF;
  UpdateStatus;
  UpdateMenu;
end;

procedure TForm1.menuNoFlowClick(Sender: TObject);
begin
  ComPort1.FlowCtrl.Handshake := COMPORTHANDSHAKE_NONE;
  UpdateStatus;
  UpdateMenu;
end;

procedure TForm1.ComPort1DSR(Sender: TObject);
begin
  Log(Format('::OnDSR DSR=%d', [integer(ComPort1.DSR)]));
end;

procedure TForm1.ComPort1CTS(Sender: TObject);
begin
  Log(Format('::OnCTS CTS=%d', [integer(ComPort1.CTS)]))
end;

procedure TForm1.menuClearClick(Sender: TObject);
begin
  Memo1.Lines.Clear;
end;

procedure TForm1.ComPort1BREAK(Sender: TObject);
begin
  Log(Format('::OnBreak', []))
end;

procedure TForm1.ComPort1CommError(Sender: TObject; Error: Cardinal);
begin
  case Error of
    CE_FRAME    : Log('[FRAME Error]');
    CE_OVERRUN  : Log('[OVERRUN Error]');
    CE_RXPARITY : Log('[PARITY Error]');
    CE_RXOVER   : Log('[RXOVER Error]');
  else
    Memo1.Lines.Add('[Error]');
  end;
end;

procedure TForm1.UpdateStatus;
begin
  if ComPort1.Active then
    Caption := Format('%s - Online', [Application.Title])
  else
    Caption := Format('%s - Offline', [Application.Title]);

  Label_Info.Caption := Format('In: %d/%d | Out: %d/%d',[ComPort1.InBuffer.Count, ComPort1.Inbuffer.Size, ComPort1.OutBuffer.Count, ComPort1.OutBuffer.Size]);
end;

procedure TForm1.UpdateMenu;
begin
  with ComPort1 do
  begin
    menuOnLine.checked := Active;
    menuPort.enabled := not ComPort1.Active;
    menuProperties.enabled := not ComPort1.Active;
    menuCom1.checked   := PortName = 'COM1';
    menuCom2.checked   := PortName = 'COM2';
    menuCom3.checked   := PortName = 'COM3';
    menuCom4.checked   := PortName = 'COM4';
    menuCom1.enabled   := ComPort1.PortList.IndexOf('COM1') >= 0;
    menuCom2.enabled   := ComPort1.PortList.IndexOf('COM2') >= 0;
    menuCom3.enabled   := ComPort1.PortList.IndexOf('COM3') >= 0;
    menuCom4.enabled   := ComPort1.PortList.IndexOf('COM4') >= 0;
    menu110.checked    := Baudrate = 110;
    menu300.checked    := Baudrate = 300;
    menu1200.checked   := Baudrate = 1200;
    menu2400.checked   := Baudrate = 2400;
    menu4800.checked   := Baudrate = 4800;
    menu9600.checked   := Baudrate = 9600;
    menu14400.checked   := Baudrate = 14400;
    menu19200.checked  := Baudrate = 19200;
    menu38400.checked  := Baudrate = 38400;
    menu57600.checked  := Baudrate = 57600;
    menuFive.checked   := DataBits = 5;
    menuSix.checked    := DataBits = 6;
    menuSeven.checked  := DataBits = 7;
    menuEight.checked  := DataBits = 8;
    menuNone.checked   := Parity = NOPARITY;
    menuEven.checked   := Parity = EVENPARITY;
    menuOdd.checked    := Parity = ODDPARITY;
    menuMark.checked   := Parity = MARKPARITY;
    menuSpace.checked  := Parity = SPACEPARITY;
    menuOne.checked    := StopBits = ONESTOPBIT;
    menuOne5.checked   := StopBits = ONE5STOPBITS;
    menuTwo.checked    := StopBits = TWOSTOPBITS;
    menuXonXoff.checked := ComPort1.FlowCtrl.Handshake = COMPORTHANDSHAKE_XONXOFF;
    menuRtsCts.checked  := ComPort1.FlowCtrl.Handshake = COMPORTHANDSHAKE_RTSCTS;
    menuDtrDsr.checked  := ComPort1.FlowCtrl.Handshake = COMPORTHANDSHAKE_DTRDSR;
    menuNoFlow.checked  := ComPort1.FlowCtrl.Handshake = COMPORTHANDSHAKE_NONE;
    menuDTR.checked     := ComPort1.DTR;
    menuRTS.checked     := ComPort1.RTS;
    menuTimeouts.checked := ComPort1.Timeouts.Enabled;
    menuDSRSensitivity.checked   := ComPort1.FlowCtrl.DSRSensitivity;
  end;
end;

procedure TForm1.menuPropertiesClick(Sender: TObject);
begin
  with TComPortSettingsDlg.Create(self) do
  try
    AssignFromComport(ComPort1);

    if Execute then
    begin
      AssignToComport(ComPort1);
      UpdateMenu;
      UpdateStatus;
    end;
  finally
    Free;  
  end;
end;

procedure TForm1.menuDatabitsClick(Sender: TObject);
begin
  ComPort1.Databits := TMenuItem(Sender).Tag;
  UpdateStatus;
  UpdateMenu;
end;

procedure TForm1.menuEchoClick(Sender: TObject);
begin
  menuEcho.checked := not menuEcho.checked;
end;

procedure TForm1.menuDtrDsrClick(Sender: TObject);
begin
  ComPort1.FlowCtrl.Handshake := COMPORTHANDSHAKE_DTRDSR;
  menuDtrDsr.Checked := true;
  UpdateStatus;
end;

procedure TForm1.Text1Click(Sender: TObject);
begin
//  Comport1.Events := Comport1.CommEvents or EV_DSR;
end;

procedure TForm1.menuBreakClick(Sender: TObject);
begin
  ComPort1.SendBreak(2000);
end;

procedure TForm1.menuHelloClick(Sender: TObject);
begin
  Memo1.Lines.Add('Hello World');
  ComPort1.WriteAnsiStr('Hello World'+#13+#10);
end;

procedure TForm1.menuMarkClick(Sender: TObject);
begin
  ComPort1.Parity := MARKPARITY;
  UpdateStatus;
  UpdateMenu;

end;

procedure TForm1.menuSpaceClick(Sender: TObject);
begin
  ComPort1.Parity := SPACEPARITY;
  UpdateStatus;
  UpdateMenu;
end;

procedure TForm1.SendData(Count: integer);
var s: String; i, n: integer;
begin
  s := ''; i := 0; n := ord('A');
  while i < Count do
  begin
    s := s + chr(n);
    if n < ord('Z') then
      inc(n)
    else
    begin
      n := ord('A');
      s := s + #13 + #10;
    end;
    inc(i)
  end;
  Log(Format('Sending %d Bytes...', [n]));
  ComPort1.WriteAnsiStr(s);
end;

procedure TForm1.ABC1Click(Sender: TObject);
begin
  SendData(26);
end;

procedure TForm1.menuReceiveClick(Sender: TObject);
var
  S1, S2 : String; i: integer;
begin
  Memo1.Lines.BeginUpdate;
  try
    S1 := ComPort1.ReadAnsiStr;
    S2 := '';
    for i := 1 to length(S1) do
    begin
      if ord(S1[i]) < ord(' ') then
        s2 := s2 + '<#' + IntToStr(ord(s1[i])) + '>'
      else
        s2 := s2 + s1[i];
      if ord(s1[i]) = 13 then
      begin
        if Memo1.Lines.Count = 0 then
          Memo1.Lines.Add(s2)
        else
          Memo1.Lines[Memo1.Lines.Count-1] := Memo1.Lines[Memo1.Lines.Count-1] + s2;
        Memo1.Lines.Add('');
        s2 := '';
      end;
    end;
    if Memo1.Lines.Count = 0 then
      Memo1.Lines.Add(s2)
    else
      Memo1.Lines[Memo1.Lines.Count-1] := Memo1.Lines[Memo1.Lines.Count-1] + s2;
  finally
    Memo1.Lines.EndUpdate;
  end;
  if menuEcho.Checked then
    ComPort1.WriteAnsiStr(s1);
  UpdateStatus;
end;

procedure TForm1.LargeText1Click(Sender: TObject);
begin
  SendData(1024);
end;

procedure TForm1.N1MB1Click(Sender: TObject);
begin
  SendData(10*1024);
end;

procedure TForm1.menuStopsendingClick(Sender: TObject);
begin
  ComPort1.OutBuffer.Clear;
  UpdateStatus;
end;

procedure TForm1.menuAutoReceiveClick(Sender: TObject);
begin
  menuAutoReceive.checked := not menuAutoReceive.checked;
end;

procedure TForm1.DoUpdateStatus(Sender: TObject);
begin
  UpdateStatus;
end;

procedure TForm1.ComPort1CommEvent(Sender: TObject; Event: Cardinal);
begin
  Memo1.Lines.Add(Format('[%s]', [CommEventsToStr(Event, ',')]));
end;

procedure TForm1.N11Click(Sender: TObject);
begin
  ComPort1.ReadAnsiStr(500);
end;

procedure TForm1.ComPort1Receive(Sender: TObject; Count: integer);
var
  S1, S2 : String; i: integer;
begin
  Log(Format('::OnReceive (%d Bytes received)', [Count]));
  UpdateStatus;
  if menuAutoReceive.checked then
  begin
    Listbox1.Items.BeginUpdate;
    try
      S1 := ComPort1.ReadAnsiStr(ComPort1.InCount);
      S2 := '';
      for i := 1 to length(S1) do
      begin
        if ord(S1[i]) < ord(' ') then
          s2 := s2 + '<#' + IntToStr(ord(s1[i])) + '>'
        else
          s2 := s2 + s1[i];
        if s1[i] = #10 then
        begin
          if Listbox1.Items.Count = 0 then
            Listbox1.Items.Add(s2)
          else
            Listbox1.Items[Listbox1.Items.Count-1] := Listbox1.Items[Listbox1.Items.Count-1] + s2;
          Listbox1.Items.Add('');
          s2 := '';
        end;
      end;
      if Listbox1.Items.Count = 0 then
        Listbox1.Items.Add(s2)
      else
        Listbox1.Items[Listbox1.Items.Count-1] := Listbox1.Items[Listbox1.Items.Count-1] + s2;
    finally
      Listbox1.Items.EndUpdate;
    end;
  end;

  if menuEcho.Checked then
  begin
    ComPort1.WriteAnsiStr(s1);
  end;
  UpdateStatus;
end;

procedure TForm1.ComPort1Activate(Sender: TObject);
begin
  Timer1.Enabled := True;
  Log('::OnActivate');
end;

procedure TForm1.ComPort1Deactivate(Sender: TObject);
begin
  Timer1.Enabled := False;
  UpdateStatus;
  Log('::OnDeactivate');
end;

procedure TForm1.ComPort1txEmpty(Sender: TObject);
begin
  Log(Format('::OnTxEmpty OutBuffer.Count=%d', [ComPort1.OutBuffer.Count]));
end;

procedure TForm1.ComPort1SendTimeout(Sender: TObject; Count: Integer);
begin
  Log(Format('::OnTimeout %d Bytes sent', [Count]));
end;

procedure TForm1.ComPort1DCD(Sender: TObject);
begin
  Log(Format('::OnDCD DCD=%d', [integer(ComPort1.DCD)]))
end;

procedure TForm1.ComPort1Error(Sender: TObject; Errors: Cardinal);
begin
  Log(Format('::OnError (%s)', [CommErrorsToStr(Errors, ',')]))
end;

procedure TForm1.ListBoxDblClick(Sender: TObject);
begin
  TListBox(Sender).Items.Clear;
end;

procedure TForm1.MemoDblClick(Sender: TObject);
begin
  Memo1.Lines.Clear;
end;

procedure TForm1.menuTimeoutsClick(Sender: TObject);
begin
  ComPort1.Timeouts.Enabled := not ComPort1.Timeouts.Enabled;
  UpdateMenu;
  UpdateStatus;
end;

procedure TForm1.menuDTRClick(Sender: TObject);
begin
  ComPort1.DTR := not ComPort1.DTR;
  UpdateStatus;
  UpdateMenu;
end;

procedure TForm1.menuRTSClick(Sender: TObject);
begin
  ComPort1.RTS := not ComPort1.RTS;
  UpdateStatus;
  UpdateMenu;
end;

procedure TForm1.ComPort1Ring(Sender: TObject);
begin
  Log(Format('::OnRing', []));
end;

procedure TForm1.ComPort1Event(Sender: TObject; Events: Cardinal);
begin
  Log(Format('::OnEvent (%s) ', [CommEventsToStr(Events, ',')]));
end;

procedure TForm1.menuDSRSensitivityClick(Sender: TObject);
begin
  ComPort1.FlowCtrl.DSRSensitivity := not ComPort1.FlowCtrl.DSRSensitivity;
  UpdateMenu;
end;

procedure TForm1.Read10Bytes1Click(Sender: TObject);
begin
  ComPort1.ReadAnsiStr(10);
end;

procedure TForm1.DoMakeCall(Sender: TObject);
var s: String; cp: ThbTapiCallParams;
begin
  with hbTapiLine1 do
  begin
    DeviceID := TMenuItem(Sender).Tag;
    if (Available = False) then
    begin
      MessageDlg('Device not available!', mtError, [mbOK], 0);
      Exit;
    end;

    if (Caps.MediaModes and LINEMEDIAMODE_DATAMODEM) = 0 then
    begin
      MessageDlg('LINEMEDIAMODE_DATAMODEM not supported!', mtError, [mbOK], 0);
      Exit;
    end;
    if (InputQuery('Dial...', 'Phonenumber', s) = False) or (s = '') then
      Exit;

    try
      Active := True;
      cp := ThbTapiCallParams.Create;
      try
        cp.AddressMode  := LINEADDRESSMODE_ADDRESSID;
        cp.AddressID    := 0;
        cp.MediaMode    := LINEMEDIAMODE_DATAMODEM;
        cp.Flags        := 0;
        cp.NoAnswerTimeout := 3;
        MakeCall(s, 0, cp.TapiData);
        Log(Format('Dialing... %s', [s]));
      finally
        cp.Free;
      end;
    except
      on E:Exception do
       MessageDlg(Format('Dail failed! %s!', [E.Message]), mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.DoHangup(Sender: TObject);
begin
  ComPort1.Active := False;
  if hbTapiLine1.Calls.Count > 0 then
    hbTapiLine1.Calls[0].Drop
  else
    hbTapiLine1.Active := False;
  Memo1.SetFocus;
  UpdateMenu;
  UpdateStatus;
end;

procedure TForm1.hbTapiLine1CallState(Sender: ThbTapiLine; Call: ThbTapiCall;
  CallState: Cardinal);
begin
  Log(Format('Call State: %s', [LinecallStateToStr(CallState)]));
  if CallState = LINECALLSTATE_CONNECTED then
  begin
    if Call.Comm.Available then
    begin
      ComPort1.Handle := Call.Comm.Handle;
      ComPort1.Active := True;
      Log(Format('Connected (%d-%d-%s-%s)', [ComPort1.Baudrate, ComPort1.Databits, ParityToStr(ComPort1.Parity), StopBitsToStr(ComPort1.Stopbits)]))
    end;
  end
  else if ComPort1.Active then
  begin
    ComPort1.Active   := False;
    hbTapiLine1.Active  := False;
  end;

  Memo1.SetFocus;
  UpdateMenu;
  UpdateStatus;
end;

procedure TForm1.hbTapiLine1CallDeallocate(Sender: ThbTapiLine;
  Call: ThbTapiCall);
begin
  Log(Format('Line closed', []));
  hbTapiLine1.Active := False;
  UpdateMenu;
  UpdateStatus;
end;

end.

