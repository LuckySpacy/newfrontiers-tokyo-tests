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
  StdCtrls, hbTAPI, hbTapiApi, ExtCtrls;

type
  TForm1 = class(TForm)
    CheckBox_Active: TCheckBox;
    ComboBoxDevice: TComboBox;
    EditApplication: TEdit;
    Button_Answer: TButton;
    Button_Drop: TButton;
    LabelApplication: TLabel;
    hbTapiLine1: ThbTapiLine;
    ListBox1: TListBox;
    procedure CheckBox_ActiveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBoxDeviceChange(Sender: TObject);
    procedure Button_AnswerClick(Sender: TObject);
    procedure Button_DropClick(Sender: TObject);
    procedure ButtonClearClick(Sender: TObject);
    procedure hbTapiLine1MediaMode(Sender: ThbTapiLine; Call: ThbTapiCall);
    procedure hbTapiLine1Connected(Sender: ThbTapiLine; Call: ThbTapiCall);
    procedure hbTapiLine1Ring(Sender: ThbTapiLine; RingMode,
      RingCount: Cardinal);
    procedure hbTapiLine1CallState(Sender: ThbTapiLine; Call: ThbTapiCall;
      CallState: Cardinal);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.CheckBox_ActiveClick(Sender: TObject);
begin
  if not CheckBox_Active.Checked then
    begin
      if hbTapiLine1.Active then
        begin
          ListBox1.Items.Add('hbTapiLine1.Active = False');
          try
            hbTapiLine1.Active := False;
          except
            CheckBox_Active.Checked := True;
            raise;
          end;
        end;
    end
  else
  begin
    if not hbTapiLine1.Active then
    begin
      ListBox1.Items.Add('hbTapiLine1.Active = True');
      try
        hbTapiLine1.Active := True;
      except
        on E:EhbTapiError do
        begin
          if E.ErrorCode = LINEERR_INVALMEDIAMODE then
          begin
            ListBox1.Items.Add('This device is not 100% TAPI compliant');
            hbTapiLine1.MediaModes := LINEMEDIAMODE_DATAMODEM;
            try
              hbTapiLine1.Active := True;
            except
              ListBox1.Items.Add('Error = ' + E.Message);
              CheckBox_Active.Checked := False;
            end;
          end
          else
            CheckBox_Active.Checked := False;
        end;
      end;
    end;
  end;
end;

{------------------------------------------------------------------------------}
{ FormCreate
{------------------------------------------------------------------------------}
procedure TForm1.FormCreate(Sender: TObject);
begin
  ComboBoxDevice.Items := hbTapiLine1.DeviceList;
  if ComboBoxDevice.Items.Count > 0 then
    ComboBoxDevice.Text := ComboBoxDevice.Items[0];
  ComboBoxDevice.ItemIndex := 0;
end;

{------------------------------------------------------------------------------}
{ ComboBoxDeviceChange
{------------------------------------------------------------------------------}
procedure TForm1.ComboBoxDeviceChange(Sender: TObject);
begin
  if hbTapiLine1.Active then
    CheckBox_Active.Checked := False;
  ListBox1.Items.Add('hbTapiLine1.DeviceID = ' + IntToStr(ComboBoxDevice.ItemIndex));
  hbTapiLine1.DeviceID := ComboBoxDevice.ItemIndex;
  if not hbTapiLine1.Available then
    ListBox1.Items.Add('Device not available')
  else
  begin
    hbTapiLine1.Privileges.Monitor := True;
    hbTapiLine1.Privileges.Owner := True;
  end;
end;

{------------------------------------------------------------------------------}
{ ButtonAnswerClick
{------------------------------------------------------------------------------}
procedure TForm1.Button_AnswerClick(Sender: TObject);
begin
  ListBox1.Items.Add('Answering');
  if hbTapiLine1.Calls.Count > 0 then
  begin
    try
      hbTapiLine1.Calls[0].Answer;
    except
      on E:Exception do
        ListBox1.Items.Add(#9 + 'Error = ' + E.Message);
    end;
  end
  else
    ListBox1.Items.Add(#9 + 'No Call');
end;

{------------------------------------------------------------------------------}
{ ButtonHangupClick
{------------------------------------------------------------------------------}
procedure TForm1.Button_DropClick(Sender: TObject);
begin
  ListBox1.Items.Add('Drop');
  if hbTapiLine1.Calls.Count > 0 then
  begin
    try
      hbTapiLine1.Calls[0].Drop;
    except
      on E:Exception do
        ListBox1.Items.Add('Error = ' + E.Message);
    end;
  end
  else
    ListBox1.Items.Add('No Call');
end;

{------------------------------------------------------------------------------}
{ ButtonClearClick
{------------------------------------------------------------------------------}
procedure TForm1.ButtonClearClick(Sender: TObject);
begin
  ListBox1.Items.Clear;
end;

procedure TForm1.hbTapiLine1MediaMode(Sender: ThbTapiLine; Call: ThbTapiCall);
begin
  ListBox1.Items.Add('ThbTapiLine.OnMediaMode');
  if (Call.MediaMode and LINEMEDIAMODE_G3FAX) = 0 then
    ListBox1.Items.Add(#9 + 'MediaMode <> LINEMEDIAMODE_G3FAX')
  else
    begin
        ListBox1.Items.Add(#9 + 'MediaMode = LINEMEDIAMODE_G3FAX');
        ListBox1.Items.Add('Call.HandOff(' + #39 + EditApplication.Text + #39 + ')');
        try
          Call.HandOff(EditApplication.Text);
        except
          on E:Exception do
            ListBox1.Items.Add(#9 + 'Error = ' + E.Message);
        end;
    end;
end;

procedure TForm1.hbTapiLine1Connected(Sender: ThbTapiLine; Call: ThbTapiCall);
begin
  ListBox1.Items.Add('::OnConnected');
  if (Call.Features and LINECALLFEATURE_MONITORMEDIA) = 0 then
  begin
    ListBox1.Items.Add('MonitorMedia not supported. We will try it anyway.');
  end;
  try
    ListBox1.Items.Add('Call.MonitorMedia.MediaModes := LINEMEDIAMODE_G3FAX');
    ListBox1.Items.Add('Call.MonitorMedia.Active := True');
    Call.MonitorMedia.MediaModes := LINEMEDIAMODE_G3FAX;
    Call.MonitorMedia.Active := True;
  except
    on E:Exception do
      ListBox1.Items.Add('Error = ' + E.Message)
  end;
end;

procedure TForm1.hbTapiLine1Ring(Sender: ThbTapiLine; RingMode,
  RingCount: Cardinal);
begin
  ListBox1.Items.Add('hbTapiLine1.OnRing #' + IntToStr(RingCount));
end;

procedure TForm1.hbTapiLine1CallState(Sender: ThbTapiLine; Call: ThbTapiCall;
  CallState: Cardinal);
begin
  ListBox1.Items.Add(Call.StateText);
end;

end.
