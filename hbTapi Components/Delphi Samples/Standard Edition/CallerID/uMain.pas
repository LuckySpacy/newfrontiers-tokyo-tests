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
  StdCtrls, hbTapiApi, ExtCtrls, hbTAPI;

type
  TForm1 = class(TForm)
    Label_CallerID: TLabel;
    Edit_CallerID: TEdit;
    LabelDevice: TLabel;
    ComboBoxDevice: TComboBox;
    hbTapiLine1: ThbTapiLine;
    EditInfo: TEdit;
    Label1: TLabel;
    Edit_CallerIDName: TEdit;
    Label_CallerIDName: TLabel;
    CheckBox_AcceptCalls: TCheckBox;
    Edit_CallState: TEdit;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ComboBoxDeviceChange(Sender: TObject);
    procedure hbTapiLine1CallerID(Sender: ThbTapiLine; Call: ThbTapiCall);
    procedure hbTapiLine1CallState(Sender: ThbTapiLine; Call: ThbTapiCall;
      CallState: Cardinal);
    procedure hbTapiLine1CallEnd(Sender: ThbTapiLine; Call: ThbTapiCall);
    procedure hbTapiLine1CallInfo(Sender: ThbTapiLine; Call: ThbTapiCall;
      InfoState: Cardinal);
    procedure hbTapiLine1CallDeallocate(Sender: ThbTapiLine; Call: ThbTapiCall);
  private
    procedure ShowCallInfo(Call: ThbTapiCall);
    { Private declarations }
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
  ComboBoxDevice.Items.Assign(hbTapiLine1.DeviceList);
  if ComboBoxDevice.Items.Count > 0 then
    ComboBoxDevice.Items.Insert(0, '- none -')
  else
    ComboBoxDevice.Items.Add('- none -');

  ComboBoxDevice.ItemIndex := 0;
end;

procedure TForm1.ComboBoxDeviceChange(Sender: TObject);
begin
  // If TapiLine is currently open then close it
  hbTapiLine1.Active := False;

  // Set the TapiLine.DeviceID to use the device selected in the list box
  hbTapiLine1.DeviceID := ComboBoxDevice.ItemIndex-1;

  // If there was a problem opening TapiLine last time then make sure that the
  // following properties are reset to their default.
  hbTapiLine1.Privileges.AutoSelect := False;
  hbTapiLine1.Privileges.Monitor := TRUE;
  hbTapiLine1.Privileges.Owner   := TRUE;

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

procedure TForm1.ShowCallInfo(Call: ThbTapiCall);
begin

  if Call = nil then
  begin
    Edit_CallState.Text := '';
    Edit_CallerID.Text := '';
    Edit_CallerIDName.Text := '';
    Label_CallerID.Font.Style := Label_CallerID.Font.Style - [fsBold];
    Label_CallerIDName.Font.Style := Label_CallerIDName.Font.Style - [fsBold];
    Exit;
  end;

  Edit_CallState.Text := Call.StateText;

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

  // Check a few of the TapiLine.CallerID Flags
  if Call.CallerID.Blocked then
    EditInfo.Text := 'Blocked';
  if Call.CallerID.OutOfArea then
    EditInfo.Text := 'Out of area';
end;

procedure TForm1.hbTapiLine1CallerID(Sender: ThbTapiLine; Call: ThbTapiCall);
begin
  ShowCallInfo(Call);
end;

procedure TForm1.hbTapiLine1CallState(Sender: ThbTapiLine; Call: ThbTapiCall;
  CallState: Cardinal);
begin
  if (CallState = LINECALLSTATE_OFFERING) and CheckBox_AcceptCalls.Checked and
     (Call.Features and LINECALLFEATURE_ACCEPT > 0) then
  try
    Call.Accept;
  except
  end;
  ShowCallInfo(Call);
end;

procedure TForm1.hbTapiLine1CallEnd(Sender: ThbTapiLine; Call: ThbTapiCall);
begin
  ShowCallInfo(nil);
end;

procedure TForm1.hbTapiLine1CallInfo(Sender: ThbTapiLine; Call: ThbTapiCall;
  InfoState: Cardinal);
begin
  ShowCallInfo(Call);
end;

procedure TForm1.hbTapiLine1CallDeallocate(Sender: ThbTapiLine;
  Call: ThbTapiCall);
begin
  ShowCallInfo(nil);
end;

end.
