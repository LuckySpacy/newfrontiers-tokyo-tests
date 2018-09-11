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
  StdCtrls, hbTapiApi, ExtCtrls, hbTAPI, hbTAPIUtils;

type

  TForm1 = class(TForm)
    LabelCallerIDNumber: TLabel;
    EditPhoneNo: TEdit;
    LabelDevice: TLabel;
    ComboBox_Device: TComboBox;
    hbTapiLine1: ThbTapiLine;
    ComboBox_MediaMode: TComboBox;
    Label1: TLabel;
    Button1: TButton;
    Label2: TLabel;
    Button2: TButton;
    ListBox1: TListBox;
    ComboBox_Address: TComboBox;
    Label3: TLabel;
    CheckBox_SyncMode: TCheckBox;
    ComboBox_Privileges: TComboBox;
    Label4: TLabel;
    Button3: TButton;
    Button4: TButton;
    CheckBox_BlockID: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox_DeviceChange(Sender: TObject);
    procedure hbTapiLine1CallState(Sender: ThbTapiLine; Call: ThbTapiCall;
      CallState: Cardinal);
    procedure DoMakeCall(Sender: TObject);
    procedure hbTapiLine1CallEnd(Sender: ThbTapiLine; Call: ThbTapiCall);
    procedure DoDropCall(Sender: TObject);
    procedure hbTapiLine1CallerID(Sender: ThbTapiLine; Call: ThbTapiCall);
    procedure hbTapiLine1CalledID(Sender: ThbTapiLine; Call: ThbTapiCall);
    procedure hbTapiLine1CallDeallocate(Sender: ThbTapiLine; Call: ThbTapiCall);
    procedure hbTapiLine1ConnectedID(Sender: ThbTapiLine; Call: ThbTapiCall);
    procedure hbTapiLine1RedirectingID(Sender: ThbTapiLine; Call: ThbTapiCall);
    procedure hbTapiLine1RedirectionID(Sender: ThbTapiLine; Call: ThbTapiCall);
    procedure hbTapiLine1TapiReply(Sender: TObject; RequestID,
      ReplyCode: Cardinal);
    procedure hbTapiLine1TapiTimeout(Sender: TObject; RequestID: Cardinal);
    procedure CheckBox_SyncModeClick(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure ComboBox_PrivilegesChange(Sender: TObject);
    procedure DoAnswerCall(Sender: TObject);
    procedure hbTapiLine1CallBegin(Sender: ThbTapiLine; Call: ThbTapiCall);
    procedure Button4Click(Sender: TObject);
    procedure hbTapiLine1CallInfo(Sender: ThbTapiLine; Call: ThbTapiCall;
      InfoState: Cardinal);
  private
    FNumMakeCall : Integer;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  hbTapiLine1.Options.SyncMode := CheckBox_SyncMode.Checked;
  // Fill in the ComboBox with all available telephony line devices
  ComboBox_Device.Items.Assign(hbTapiLine1.DeviceList);
  if ComboBox_Device.Items.Count > 0 then
    ComboBox_Device.Items.Insert(0, '- none -')
  else
    ComboBox_Device.Items.Add('- none -');

  ComboBox_Device.ItemIndex     := 0;
  ComboBox_Privileges.ItemIndex := 0;
end;

procedure TForm1.ComboBox_DeviceChange(Sender: TObject);
begin
  // If TapiLine is currently open then close it
  hbTapiLine1.Active := False;

  // Set the TapiLine.DeviceID to use the device selected in the list box
  hbTapiLine1.DeviceID := ComboBox_Device.ItemIndex - 1;

  // If there was a problem opening TapiLine last time then make sure that the
  // following properties are reset to their default.
  hbTapiLine1.Privileges.None := TRUE;
  if Pos('Owner', ComboBox_Privileges.Text) > 0 then
    hbTapiLine1.Privileges.Owner := TRUE;
  if Pos('Monitor', ComboBox_Privileges.Text) > 0 then
    hbTapiLine1.Privileges.Monitor := TRUE;

  if not hbTapiLine1.Available then
  begin
    ComboBox_MediaMode.Items.Clear;
    Combobox_Address.Items.Clear;
    Exit;
  end;

  // Fill in the ComboBox with all supporting media modes.
  LineMediaModesToStrList(hbTapiLine1.Caps.MediaModes, ComboBox_MediaMode.Items);
  if ComboBox_MediaMode.Items.Count > 0 then
    ComboBox_MediaMode.ItemIndex := 0;

  Combobox_Address.Items.Assign(hbTapiLine1.AddressList);
  if ComboBox_Address.Items.Count > 0 then
    ComboBox_Address.ItemIndex := 0;

  try
    hbTapiLine1.Active := True;
//    ListBox1.Items.add(Format('Line is opened %d times',[hbTapiLine1.Status.NumOpens]));
  except
    on E:EhbTapiError do
      case E.ErrorCode of
         LINEERR_INVALMEDIAMODE :
         begin
           try
             hbTapiLine1.Privileges.Owner := FALSE;
             hbTapiLine1.Active := True;
           except
             on E:Exception do
               MessageDlg('Error opening line device: ' + E.Message, mtError, [mbOk],0);
           end;
           MessageDlg('This device is not 100% TAPI compliant',mtWarning, [mbOk],0);
         end;
      else  // Time for a little error checking
        MessageDlg('Error opening line device: ' + E.Message, mtError, [mbOk],0);
      end;
  end;
end;

procedure TForm1.hbTapiLine1CallState(Sender: ThbTapiLine; Call: ThbTapiCall;
  CallState: Cardinal);
var s: String;
begin
//  ListBox1.Items.Add('::OnCallState (' + Call.StateText + ')');
  ListBox1.Items.Add(Format('::OnCallState %s Origin=0x%x %s', [Call.StateText, Call.Info.Origin, hbTapiUtils.LineCallOriginToStr(Call.Info.Origin)]));
  if Call.CallerID.AddressAvail then
  begin
    s := Call.CallerID.Address;
    ListBox1.Items.Add('CallerID Address = ' + Call.CallerID.Address);
  end;
{$ifdef EDT_PROFESSIONAL}
  if Call.RemoteID.AddressAvail then
  begin
    s := Call.RemoteID.Address;
    ListBox1.Items.Add('Remote Address = ' + Call.RemoteID.Address);
  end;
  if Call.RemoteID.NameAvail then
    ListBox1.Items.Add('Remote Name = ' + Call.RemoteID.Name);
{$endif}
end;

procedure TForm1.DoMakeCall(Sender: TObject);
begin
  try
    hbTapiLine1.CallParams.MediaMode := StrToLineMediaMode(ComboBox_MediaMode.Text);
    hbTapiLine1.CallParams.AddressID := ComboBox_Address.ItemIndex;
    ListBox1.Items.Add('Calling hbTapiLine1.MakeCall...');
    hbTapiLine1.MakeCall(EditPhoneNo.Text);
    inc(FNumMakeCall);
    if hbTapiLine1.Options.SyncMode then
      ListBox1.Items.Add('MakeCall returned.')
    else
    begin
      ListBox1.Items.Add('MakeCall returned. LastRequestID= 0x' + IntToHex(hbTapiLine1.LastRequestID, 2));
      hbTapiLine1.SetRequestNote(hbTapiLine1.LastRequestID, 'NumMakeCall', FNumMakeCall);
    end;
  except
    on E:EhbTapiError do
      MessageDlg('MakeCall failed! ' + E.Message, mtError, [mbok], 0);
  end;
end;

procedure TForm1.hbTapiLine1CallEnd(Sender: ThbTapiLine; Call: ThbTapiCall);
begin
  ListBox1.Items.Add('::OnCallEnd');
end;

procedure TForm1.DoDropCall(Sender: TObject);
begin
  if hbTapiLine1.Calls.count > 0 then
  begin
    ListBox1.Items.Add('Calling Call.Drop...');
    hbTapiLine1.Calls[0].Drop;
    if hbTapiLine1.options.SyncMode then
      ListBox1.Items.Add('Call.Drop returned')
    else
      ListBox1.Items.Add('Drop returned. LastRequestID = 0x' + IntToHex(hbTapiLine1.LastRequestID, 2));
  end;
end;

procedure TForm1.hbTapiLine1CallerID(Sender: ThbTapiLine; Call: ThbTapiCall);
begin
  ListBox1.Items.Add('::OnCallerID (' + Call.CallerID.Address + ', ' + Call.CallerID.Name + ')');
  if Call.CallerID.AddressAvail then
    ListBox1.Items.Add('Caller Address = ' + Call.CallerID.Address);
  if Call.CallerID.NameAvail then
    ListBox1.Items.Add('Caller Name = ' + Call.CallerID.Name);
end;

procedure TForm1.hbTapiLine1CallInfo(Sender: ThbTapiLine; Call: ThbTapiCall;
  InfoState: Cardinal);
begin
   ListBox1.Items.Add(Format('::OnCallInfo Origin=0x%x %s', [Call.Info.Origin, hbTapiUtils.LineCallOriginToStr(Call.Info.Origin)]));
end;

procedure TForm1.hbTapiLine1CalledID(Sender: ThbTapiLine; Call: ThbTapiCall);
begin
{$ifdef EDT_PROFESSIONAL}
  ListBox1.Items.Add('::OnCalledID (' + Call.CalledID.Address + ', ' + Call.CalledID.Name + ')');
  if Call.CalledID.AddressAvail then
    ListBox1.Items.Add('Called Address = ' + Call.CalledID.Address);
  if Call.CalledID.NameAvail then
    ListBox1.Items.Add('Called Name = ' + Call.CalledID.Name);
{$endif}
end;

procedure TForm1.hbTapiLine1CallDeallocate(Sender: ThbTapiLine;
  Call: ThbTapiCall);
begin
  ListBox1.Items.Add('::OnCallDeallocate');
end;

procedure TForm1.hbTapiLine1ConnectedID(Sender: ThbTapiLine; Call: ThbTapiCall);
begin
{$ifdef EDT_PROFESSIONAL}
 ListBox1.Items.Add('::OnConnectedID (' + Call.ConnectedID.Address + ', ' + Call.ConnectedID.Name + ')');
  if Call.RemoteID.AddressAvail then
    ListBox1.Items.Add('Remote Address = ' + Call.RemoteID.Address);
  if Call.RemoteID.NameAvail then
    ListBox1.Items.Add('Remote Name = ' + Call.RemoteID.Name);
{$endif}
end;

procedure TForm1.hbTapiLine1RedirectingID(Sender: ThbTapiLine;
  Call: ThbTapiCall);
begin
// Feature of hbTapi Enterprise
(*
  ListBox1.Items.Add('::OnRedirecingID (' + Call.RedirectingID.Address + ')');
  if Call.RemoteID.AddressAvail then
    ListBox1.Items.Add('Remote Address = ' + Call.RemoteID.Address);
  if Call.RemoteID.NameAvail then
    ListBox1.Items.Add('Remote Name = ' + Call.RemoteID.Name);
*)
end;

procedure TForm1.hbTapiLine1RedirectionID(Sender: ThbTapiLine;
  Call: ThbTapiCall);
begin
// Feature of hbTapi Enterprise
(*
  ListBox1.Items.Add('::OnRedirectionID (' + Call.RedirectionID.Address + ')');
  if Call.RemoteID.AddressAvail then
    ListBox1.Items.Add('Remote Address = ' + Call.RemoteID.Address);
  if Call.RemoteID.NameAvail then
    ListBox1.Items.Add('Remote Name = ' + Call.RemoteID.Name);
*)
end;

procedure TForm1.hbTapiLine1TapiReply(Sender: TObject; RequestID, ReplyCode: Cardinal);
var tr: DWORD;
begin
  if hbTapiLine1.Options.SyncMode then
    exit;
  if (ReplyCode <> 0) then
  begin
    tr := hbTapiLine1.GetRequestNote(RequestID, '&TapiRequest');
    case tr of
      TAPIREQUEST_LINEMAKECALL :
      begin
        MessageDlg(Format('TapiReply: MakeCall #%d failed! %s', [Integer(hbTapiLine1.GetRequestNote(RequestID, 'NumMakeCall')), GetTapiErrorMessage(ReplyCode)]), mtError, [mbOK], 0);
      end;
      TAPIREQUEST_LINEDROP :
        MessageDlg('TapiReply: DropCall failed!' +#13 + #10 + GetTapiErrorMessage(ReplyCode), mtError, [mbOK], 0);
      TAPIREQUEST_LINEANSWER :
        MessageDlg('TapiReply: AnswerCall failed!' +#13 + #10 + GetTapiErrorMessage(ReplyCode), mtError, [mbOK], 0);
    else
      MessageDlg('TapiReply: Error' +#13 + #10 + GetTapiErrorMessage(ReplyCode), mtError, [mbOK], 0);
    end
  end;
end;

procedure TForm1.hbTapiLine1TapiTimeout(Sender: TObject;
  RequestID: Cardinal);
begin
  if hbTapiLine1.Options.SyncMode = FALSE then
    ListBox1.Items.Add(Format('::OnTapiTimeout RequestID=0x%X',[RequestID]));
end;

procedure TForm1.CheckBox_SyncModeClick(Sender: TObject);
begin
  hbTapiLine1.Options.SyncMode := CheckBox_SyncMode.Checked;
end;

procedure TForm1.ListBox1DblClick(Sender: TObject);
begin
  ListBox1.Items.Clear;
end;

procedure TForm1.ComboBox_PrivilegesChange(Sender: TObject);
begin
  if ComboBox_Device.ItemIndex > 0 then
    ComboBox_DeviceChange(nil);
end;

procedure TForm1.DoAnswerCall(Sender: TObject);
begin
  if hbTapiLine1.Calls.count > 0 then
  begin
    ListBox1.Items.Add('Calling Call.Answer...');
    hbTapiLine1.Calls[0].Answer;
    if hbTapiLine1.Options.SyncMode then
      ListBox1.Items.Add('Call.Answer returned')
    else
      ListBox1.Items.Add('Answer returned. LastRequestID = 0x' + IntToHex(hbTapiLine1.LastRequestID, 2));
  end;
end;

procedure TForm1.hbTapiLine1CallBegin(Sender: ThbTapiLine; Call: ThbTapiCall);
begin
  if Call.Owner = FALSE then
  try
    Call.Owner := TRUE;
  except
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var cp: ThbTapiCallParams;
begin
  cp:= ThbTapiCallParams.Create;
  try
    try
      cp.MediaMode := StrToLineMediaMode(ComboBox_MediaMode.Text);
      cp.AddressID := ComboBox_Address.ItemIndex;
      // here we use the Flags property instead of BlockID by example
      // LINECALLPARAMFLAGS_ const for further information
      if CheckBox_BlockID.Checked then
        cp.Flags     := LINECALLPARAMFLAGS_BLOCKID;

      ListBox1.Items.Add('Calling hbTapiLine1.MakeCall...');
      hbTapiLine1.MakeCall(EditPhoneNo.Text, 0, cp.TapiData);

      if hbTapiLine1.Options.SyncMode then
        ListBox1.Items.Add('MakeCall returned.')
      else
      begin
        ListBox1.Items.Add('MakeCall returned. LastRequestID= 0x' + IntToHex(hbTapiLine1.LastRequestID, 2));
        hbTapiLine1.SetRequestNote(hbTapiLine1.LastRequestID, 'NumMakeCall', FNumMakeCall);
      end;
    except
      on E:EhbTapiError do
        MessageDlg('MakeCall failed! ' + E.Message, mtError, [mbok], 0);
    end;
  finally
    cp.Free;
  end;
end;

end.
