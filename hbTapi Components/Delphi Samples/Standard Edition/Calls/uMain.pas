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
  ToolWin, ComCtrls, ImgList, StdCtrls, ExtCtrls,
  ActnList, Menus, Buttons, uCallDisplay, hbTapi, hbTapiUtils, hbTapiApi;

type
  TMainForm = class(TForm)
    hbTapiLine1: ThbTapiLine;
    ImageList_Calls: TImageList;
    ActionList1: TActionList;
    ActionAnswer: TAction;
    ActionDrop: TAction;
    ActionHold: TAction;
    ActionMakeCall: TAction;
    ActionBlindTransfer: TAction;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Panel_Calls: TPanel;
    ListView_Journal: TListView;
    Panel2: TPanel;
    Label1: TLabel;
    ComboBoxDevice: TComboBox;
    Panel3: TPanel;
    CheckBox_TapiMessages: TCheckBox;
    CheckBox_CallStates: TCheckBox;
    CheckBox_CallInfos: TCheckBox;
    LabelPrivilege: TLabel;
    ButtonMakeCall: TButton;
    ListBox1: TListBox;
    procedure hbTapiLine1CallState(Sender: ThbTapiLine; Call: ThbTapiCall; State: Cardinal);
    procedure hbTapiLine1CallBegin(Sender: ThbTapiLine; Call: ThbTapiCall);
    procedure hbTapiLine1CallEnd(Sender: ThbTapiLine; Call: ThbTapiCall);
    procedure hbTapiLine1CallInfo(Sender: ThbTapiLine; Call: ThbTapiCall;
      CallInfo: Cardinal);
    procedure hbTapiLine1CallInfo_CallerID(Sender: ThbTapiLine;
      Call: ThbTapiCall);
    procedure hbTapiLine1CallDeallocate(Sender: ThbTapiLine; Call: ThbTapiCall);
    procedure FormCreate(Sender: TObject);
    procedure ActionMakeCallExecute(Sender: TObject);
    procedure ComboBoxDeviceChange(Sender: TObject);
    procedure hbTapiLine1TapiReply(Sender: TObject; RequestID,
      ReplyCode: Cardinal);
    procedure hbTapiLine1TapiMessage(Sender: TObject; MessageID, Device, Param1,
      Param2, Param3: Cardinal);
    procedure hbTapiLine1DeviceClose(Sender: TObject);
    procedure hbTapiLine1DeviceRemove(Sender: TObject);
    procedure hbTapiLine1Ring(Sender: ThbTapiLine; RingMode,
      RingCount: Cardinal);
    procedure ListBox1DblClick(Sender: TObject);
  protected
  private
    FPhoneNo : String;
    procedure UpdateCallView;
  private

    procedure AddCallToJournal(Call: ThbTapiCall);
    procedure RemoveCallDisplay(Call: ThbTapiCall);

  public
    procedure LogFmt(const aFormat: string; const aArgs: array of const);
    function DisplayCount: Integer;
    function GetDisplay(index : integer): TFrameCallDisplay; overload;
    function GetDisplay_Call(Call: ThbTapiCall): TFrameCallDisplay; overload;
    property Display[index: integer] : TFrameCallDisplay read GetDisplay;
    property PhoneNo : String read FPhoneNo write FPhoneNo;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

procedure TMainForm.FormCreate(Sender: TObject);
var r : TFrameCallDisplay;
begin
  r := TFrameCallDisplay.Create(self);
  r.Name  := '';
  r.Align := alTop;
  r.Init;
  r.Parent := Panel_Calls;
  ComboBoxDevice.Items.Assign(hbTapiLine1.DeviceList);
  ComboBoxDevice.Items.Insert(0, '- None -');
  ComboBoxDevice.ItemIndex := 0;
end;

procedure TMainForm.ComboBoxDeviceChange(Sender: TObject);
var i: integer;
begin
  hbTapiLine1.Active  := FALSE;
  LabelPrivilege.Caption := '';

  i := 0;
  while i < DisplayCount do
  begin
    Display[i].Call := nil;
    inc(i);
  end;

  hbTapiLine1.DeviceID := ComboBoxDevice.ItemIndex -1;
  if hbTapiLine1.Available then
  try
    hbTapiLine1.Active := true;
    LabelPrivilege.Caption := hbTapiLine1.Privileges.Text;
  except
    on E:Exception do
      MessageDlg('Error while opening device: ' + hbTapiLine1.DeviceName, mtError, [mbOK], 0);
  end;
  UpdateCallView;
end;

procedure TMainForm.LogFmt(const aFormat: string; const aArgs: array of const);
begin
  ListBox1.Items.Add(FormatDateTime('hh:nn:ss', now) + ' ' + Format(aFormat, aArgs));
end;

function TMainForm.DisplayCount: Integer;
var i: integer;
begin
  result := 0;
  i := 0;
  while i < Panel_Calls.ControlCount do
  begin
    if Panel_Calls.Controls[i] is TFrameCallDisplay then
    begin
      inc(result);
    end;
    inc(i);
  end;
end;

function TMainForm.GetDisplay(index : integer): TFrameCallDisplay;
var i, n: integer;
begin
  result := nil; i := 0; n := 0;
  while i < Panel_Calls.ControlCount do
  begin
    if Panel_Calls.Controls[i] is TFrameCallDisplay then
    begin
      if Index = n then
      begin
        result := TFrameCallDisplay(Panel_Calls.Controls[i]);
        exit;
      end;
      inc(n);
    end;
    inc(i);
  end;
end;

function TMainForm.GetDisplay_Call(Call: ThbTapiCall): TFrameCallDisplay;
var i, n: integer;
begin
  i := 0; n := DisplayCount;
  while i < n do
  begin
    if Call = Display[i].Call then
    begin
      result := Display[i];
      exit;
    end
    else if Display[i].Call = nil then
    begin
      result       := Display[i];
      Call.Tag     := Integer(Result);
      Result.Call  := Call;
      exit;
    end;
    inc(i);
  end;

  result := TFrameCallDisplay.Create(self);
  result.Name  := '';
  result.Align := alTop;
  result.Init;
  if Call <> nil then
    Call.Tag := Integer(Result);
  Result.Call := Call;
  Result.Parent := Panel_Calls;
end;

procedure TMainForm.RemoveCallDisplay(Call: ThbTapiCall);
var o : TFrameCallDisplay;
    i, n : integer;
begin
  o := nil; i := 0; n := DisplayCount;
  while i < n do
  begin
    if Call = Display[i].Call then
    begin
      o := Display[i];
      break;
    end;
    inc(i);
  end;

  if (o <> nil)  then
  begin
    if (n > 1) then
    begin
      o.Parent := NIL;
      o.Free;
    end
    else
    begin
      o.Init;
    end;
  end;
end;

procedure TMainForm.UpdateCallView;
var i, n: integer;
begin
  i := 0; n := DisplayCount;
  while i < n do
  begin
    if (hbTapiLine1.Calls.IndexOf(Display[i].Call) = -1)  then
      Display[i].Free;
    inc(i);
  end;

  for i := 0 to hbTapiLine1.Calls.Count -1 do
  begin
    with GetDisplay_Call(hbTapiLine1.Calls[i]) do
    begin
      UpdateView;
      UpdateActionList;
    end;
  end;

  if DisplayCount = 0 then
    GetDisplay_Call(nil);
end;

procedure TMainForm.AddCallToJournal(Call: ThbTapiCall);
var iImage      : integer;
    sAddr,
    sName       : String;
    sStart,
    sDuration,
    sDetail     : String;

begin
  if Call.WasIncoming then
  begin
    iImage := 0;
    if Call.CallerID.Blocked then
      sAddr := 'XXX'
    else
      sAddr := Call.CallerID.Address;
    sName  := Call.CallerID.Name;
  end
  else if Call.WasOutgoing then
  begin
    iImage := 2;
{$ifdef EDT_PROFESSIONAL}
    if (Call.CalledID.Address <> '') then // Professional Edt.
      sAddr  := Call.CalledID.Address
    else
{$endif}
	if Call.Info.CalledParty <> '' then
      sAddr  := Call.Info.CalledParty
    else
      saddr := 'XXX';
{$ifdef EDT_PROFESSIONAL}
    sName  := Call.CalledID.Name;
{$endif}
  end
  else
    exit;

  if Call.WasDisconnected then
    sDetail := Call.StateModeText;

  if Call.WasConnected then
    inc(iImage);

  sStart := DateTimetoStr(Call.BeginTime);
  sDuration := TimeToStr(Call.BeginTime - Call.EndTime);

  with ListView_Journal.Items.Add do
  begin
    while SubItems.Count < 5 do
      SubItems.Add('');

    ImageIndex  := iImage;
    Caption     := sStart;
    SubItems[0] := sAddr;
    SubItems[1] := sName;
    SubItems[2] := sDuration;
    SubItems[3] := Call.OriginText;
  end;
end;

procedure TMainForm.hbTapiLine1CallState(Sender: ThbTapiLine; Call: ThbTapiCall; State: Cardinal);
begin
  with GetDisplay_Call(Call) do
  begin
    UpdateView;
    UpdateActionList;//State := LineCallStateToStr(Call.State);
  end;
  if CheckBox_CallStates.Checked then
    LogFmt('::OnCallState(%s, %s)', [Call.StateText, Call.StateModetext]);
end;

procedure TMainForm.hbTapiLine1CallBegin(Sender: ThbTapiLine; Call: ThbTapiCall);
begin
  LogFmt('::OnCallBegin (Call=%x)', [Integer(Call)]);
end;

procedure TMainForm.hbTapiLine1CallEnd(Sender: ThbTapiLine; Call: ThbTapiCall);
begin
  LogFmt('::OnCallEnd (Call=%x)', [Integer(Call)]);
  AddCallToJournal(call);
end;

procedure TMainForm.hbTapiLine1CallDeallocate(Sender: ThbTapiLine;
  Call: ThbTapiCall);
begin
  LogFmt('::OnCallDeallocate (Call=%x)', [Integer(Call)]);
  RemoveCallDisplay(Call);
end;

procedure TMainForm.hbTapiLine1CallInfo(Sender: ThbTapiLine; Call: ThbTapiCall; CallInfo: Cardinal);
begin
    if CheckBox_CallInfos.checked then case CallInfo of
    LINECALLINFOSTATE_ORIGIN :
      LogFmt('::OnCallInfo(%s, %s)', [LineCallInfoStateToStr(CallInfo),LineCallOriginToStr(Call.Info.Origin)]);
    LINECALLINFOSTATE_REASON :
      LogFmt('::OnCallInfo(%s, %s)', [LineCallInfoStateToStr(CallInfo),LINECALLREASONToStr(Call.Info.Reason)]);
    LINECALLINFOSTATE_CALLERID :
      LogFmt('::OnCallInfo(%s, %s, %s)', [LineCallInfoStateToStr(CallInfo), Call.CallerID.Address, Call.CallerID.Name]);
{$ifdef EDT_PROFESSIONAL}
    LINECALLINFOSTATE_CALLEDID :
      LogFmt('::OnCallInfo(%s, %s, %s)', [LineCallInfoStateToStr(CallInfo), Call.CalledID.Address, Call.CalledID.Name]);
{$endif}
{$ifdef EDT_ENTERPRISE}
    LINECALLINFOSTATE_REDIRECTINGID :
      LogFmt('::OnCallInfo(%s, %s, %s)', [LineCallInfoStateToStr(CallInfo), Call.RedirectingID.Address,Call.RedirectingID.Name]);
    LINECALLINFOSTATE_REDIRECTIONID :
      LogFmt('::OnCallInfo(%s, %s, %s)', [LineCallInfoStateToStr(CallInfo), Call.RedirectionID.Address, Call.RedirectionID.Name]);
    LINECALLINFOSTATE_MEDIAMODE     :
{$endif}
  else
    LogFmt('::OnCallInfo(%s)', [LineCallInfoStateToStr(CallInfo), Call]);
  end;
  GetDisplay_Call(Call).UpdateView;
end;

procedure TMainForm.hbTapiLine1CallInfo_CallerID(Sender: ThbTapiLine; Call: ThbTapiCall);
begin
  LogFmt('::OnCallerID(%s)', [Call.CallerID.Address]);
  GetDisplay_Call(Call).UpdateView;
end;


procedure TMainForm.ActionMakeCallExecute(Sender: TObject);
begin
  if (InputQuery('MakeCall', 'Phone number', FPhoneNo) = false) or (FPhoneNo = '') then
    exit;

  try
    LogFmt('MakeCall started...',[]);
    hbTapiLine1.MakeCall(FPhoneNo);
    LogFmt('MakeCall LastRequestID = $%x',[hbTapiLine1.LastRequestID]);
  except
    on E:Exception do
      LogFmt('MakeCall failed! %s', [E.Message]);
  end;
end;


procedure TMainForm.hbTapiLine1TapiReply(Sender: TObject; RequestID,
  ReplyCode: Cardinal);
begin
  LogFmt('::OnTapiReply RequestID= $%x, ReplyCode= $%x', [RequestID, ReplyCode]);
end;

procedure TMainForm.hbTapiLine1TapiMessage(Sender: TObject; MessageID, Device,
  Param1, Param2, Param3: Cardinal);
begin
  if CheckBox_TapiMessages.Checked then
    LogFmt('::OnTapiMessage MessageID= $%x, Param1= $%x, Param2= $%x, Param3= $%x', [MessageID, Param1, Param2, Param3]);
end;

procedure TMainForm.hbTapiLine1DeviceClose(Sender: TObject);
begin
  LogFmt('Device closed', []);
end;

procedure TMainForm.hbTapiLine1DeviceRemove(Sender: TObject);
begin
  LogFmt('Device removed', []);
end;

procedure TMainForm.hbTapiLine1Ring(Sender: ThbTapiLine; RingMode,
  RingCount: Cardinal);
begin
  LogFmt('Ringing %d', [RingCount]);
end;

procedure TMainForm.ListBox1DblClick(Sender: TObject);
begin
  ListBox1.Items.Clear;
end;

end.

