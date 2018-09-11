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
  hbTapi, StdCtrls, hbTapiApi, ExtCtrls, hbTAPIUtils;

type

  TForm1 = class(TForm)
    hbTapiLine1: ThbTapiLine;
    ListBox1: TListBox;
    GroupBox_CallInfo: TGroupBox;
    Label_CallerID: TLabel;
    Edit_CallerID: TEdit;
    Label_CallerIDName: TLabel;
    Edit_CallerIDName: TEdit;
    Label_CalledID: TLabel;
    Edit_CalledID: TEdit;
    Label_CalledIDName: TLabel;
    Edit_CalledIDName: TEdit;
    Label_ConnectedID: TLabel;
    Edit_ConnectedID: TEdit;
    Label_ConnectedIDName: TLabel;
    Edit_ConnectedIDName: TEdit;
    Label_RedirectionID: TLabel;
    Edit_RedirectionID: TEdit;
    Label_RedirectionIDName: TLabel;
    Edit_RedirectionIDName: TEdit;
    Label_RedirectingID: TLabel;
    Edit_RedirectingID: TEdit;
    Label_RedirectingIDName: TLabel;
    Edit_RedirectingIDName: TEdit;
    GroupBox1: TGroupBox;
    ComboBox_Device: TComboBox;
    ComboBox_Privileges: TComboBox;
    ComboBox_Address: TComboBox;
    ComboBox_MediaMode: TComboBox;
    LabelDevice: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    Label_PhoneNo: TLabel;
    Edit_PhoneNo: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox_DeviceChange(Sender: TObject);
    procedure hbTapiLine1CallState(Sender: ThbTapiLine; Call: ThbTapiCall;
      CallState: Cardinal);
    procedure DoMakeCall(Sender: TObject);
    procedure DoDropCall(Sender: TObject);
    procedure hbTapiLine1CallDeallocate(Sender: ThbTapiLine; Call: ThbTapiCall);
    procedure hbTapiLine1TapiReply(Sender: TObject; RequestID,
      ReplyCode: Cardinal);
    procedure hbTapiLine1TapiTimeout(Sender: TObject; RequestID: Cardinal);
    procedure DoClear(Sender: TObject);
    procedure ComboBox_PrivilegesChange(Sender: TObject);
    procedure DoAnswerCall(Sender: TObject);
    procedure hbTapiLine1CallInfo(Sender: ThbTapiLine; Call: ThbTapiCall;
      InfoState: Cardinal);
    procedure Edit_PhoneNoKeyPress(Sender: TObject; var Key: Char);
  private
    procedure UpdateCallInfo(Sender: ThbTapiLine; Call: ThbTapiCall; InfoState: Cardinal);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
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
begin
  ListBox1.Items.Add('::OnCallState call state changed ' + Call.StateText + ' (Call=' + IntToHex(integer(Call),8) + ')');
  UpdateCallInfo(Sender, Call, 0);
end;

procedure TForm1.DoMakeCall(Sender: TObject);
begin
  try
    hbTapiLine1.CallParams.MediaMode := StrToLineMediaMode(ComboBox_MediaMode.Text);
    hbTapiLine1.CallParams.AddressID := ComboBox_Address.ItemIndex;
    hbTapiLine1.MakeCall(Edit_PhoneNo.Text);
  except
    on E:EhbTapiError do
      MessageDlg('MakeCall failed! ' + E.Message, mtError, [mbok], 0);
  end;
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

procedure TForm1.hbTapiLine1CallDeallocate(Sender: ThbTapiLine;
  Call: ThbTapiCall);
begin
  ListBox1.Items.Add('::OnCallDeallocate (0x=' + IntToHex(integer(Call),8) + ')');
end;

procedure TForm1.hbTapiLine1TapiReply(Sender: TObject; RequestID, ReplyCode: Cardinal);
var tr: DWORD;
begin
  if hbTapiLine1.Options.SyncMode = FALSE then
    ListBox1.Items.Add(Format('::OnTapiReply RequestID=0x%X, ReplyCode=0x%X',[RequestID, ReplyCode]))
  else
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

procedure TForm1.DoClear(Sender: TObject);
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

procedure TForm1.hbTapiLine1CallInfo(Sender: ThbTapiLine; Call: ThbTapiCall; InfoState: Cardinal);
begin
  ListBox1.Items.Add('::OnCallInfo callinfo changed or available (0x' + IntToHex(integer(Call),8) + ')');
  UpdateCallInfo(Sender, Call, InfoState);
end;

procedure TForm1.UpdateCallInfo(Sender: ThbTapiLine; Call: ThbTapiCall; InfoState: Cardinal);
begin
  ListBox1.Items.Add('::OnCallInfo callinfo changed or available ' + LineCallInfoStateToStr(InfoState) + ' (0x' + IntToHex(integer(Call),8) + ')');
  if Call.State = LINECALLSTATE_IDLE then
  begin
    Edit_CallerID.Text := '';
    Edit_CallerIDName.Text := '';
    Edit_CalledID.Text := '';
    Edit_CalledIDName.Text := '';
    Edit_ConnectedID.Text := '';
    Edit_ConnectedIDName.Text := '';
    Edit_RedirectionID.Text := '';
    Edit_RedirectionIDName.Text := '';
    Edit_RedirectingID.Text := '';
    Edit_RedirectingID.Text := '';
    Label_CallerID.Font.Style := Label_CallerID.Font.Style - [fsBold];
    Label_CallerIDName.Font.Style := Label_CallerIDName.Font.Style - [fsBold];
    Label_CalledID.Font.Style := Label_CalledID.Font.Style - [fsBold];
    Label_CalledIDName.Font.Style := Label_CalledIDName.Font.Style - [fsBold];
    Label_ConnectedID.Font.Style := Label_ConnectedID.Font.Style - [fsBold];
    Label_ConnectedIDName.Font.Style := Label_ConnectedIDName.Font.Style - [fsBold];
    Label_RedirectionID.Font.Style := Label_RedirectionID.Font.Style - [fsBold];
    Label_RedirectionIDName.Font.Style := Label_RedirectionIDName.Font.Style - [fsBold];
    Label_RedirectingID.Font.Style := Label_RedirectingID.Font.Style - [fsBold];
    Label_RedirectingIDName.Font.Style := Label_RedirectingIDName.Font.Style - [fsBold];
    Exit;
  end;

  // CallerID

  if Call.CallerID.AddressAvail then
    Label_CallerID.Font.Style := Label_CallerID.Font.Style + [fsBold]
  else
    Label_CallerID.Font.Style := Label_CallerID.Font.Style - [fsBold];

  if Call.CallerID.NameAvail then
    Label_CallerIDName.Font.Style := Label_CallerIDName.Font.Style + [fsBold]
  else
    Label_CallerIDName.Font.Style := Label_CallerIDName.Font.Style - [fsBold];

  Edit_CallerID.Text := Call.CallerID.Address;
  Edit_CallerIDName.Text := Call.CallerID.Name;

  // CalledID

  if Call.CalledID.AddressAvail then
    Label_CalledID.Font.Style := Label_CalledID.Font.Style + [fsBold]
  else
    Label_CalledID.Font.Style := Label_CalledID.Font.Style - [fsBold];

  if Call.CalledID.NameAvail then
    Label_CalledIDName.Font.Style := Label_CalledIDName.Font.Style + [fsBold]
  else
    Label_CalledIDName.Font.Style := Label_CalledIDName.Font.Style - [fsBold];

  Edit_CalledID.Text := Call.CalledID.Address;
  Edit_CalledIDName.Text := Call.CalledID.Name;

  // ConnectedID

  if Call.ConnectedID.AddressAvail then
    Label_ConnectedID.Font.Style := Label_ConnectedID.Font.Style + [fsBold]
  else
    Label_ConnectedID.Font.Style := Label_ConnectedID.Font.Style - [fsBold];

  if Call.ConnectedID.NameAvail then
    Label_ConnectedIDName.Font.Style := Label_ConnectedIDName.Font.Style + [fsBold]
  else
    Label_ConnectedIDName.Font.Style := Label_ConnectedIDName.Font.Style - [fsBold];

  Edit_ConnectedID.Text := Call.ConnectedID.Address;
  Edit_ConnectedIDName.Text := Call.ConnectedID.Name;

  // RedirectionID

  if Call.RedirectionID.AddressAvail then
    Label_RedirectionID.Font.Style := Label_RedirectionID.Font.Style + [fsBold]
  else
    Label_RedirectionID.Font.Style := Label_RedirectionID.Font.Style - [fsBold];

  if Call.RedirectionID.NameAvail then
    Label_RedirectionIDName.Font.Style := Label_RedirectionIDName.Font.Style + [fsBold]
  else
    Label_RedirectionIDName.Font.Style := Label_RedirectionIDName.Font.Style - [fsBold];

  Edit_RedirectionID.Text := Call.RedirectionID.Address;
  Edit_RedirectionIDName.Text := Call.RedirectionID.Name;

  // RedirectingID

  if Call.RedirectingID.AddressAvail then
    Label_RedirectingID.Font.Style := Label_RedirectingID.Font.Style + [fsBold]
  else
    Label_RedirectingID.Font.Style := Label_RedirectingID.Font.Style - [fsBold];

  if Call.RedirectingID.NameAvail then
    Label_RedirectingIDName.Font.Style := Label_RedirectingIDName.Font.Style + [fsBold]
  else
    Label_RedirectingIDName.Font.Style := Label_RedirectingIDName.Font.Style - [fsBold];

  Edit_RedirectingID.Text := Call.RedirectingID.Address;
  Edit_RedirectingID.Text := Call.RedirectingID.Name;
end;

procedure TForm1.Edit_PhoneNoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = chr(VK_RETURN) then
    DoMakeCall(nil);
end;

end.
