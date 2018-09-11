{-------------------------------------------------------------------------
   Copyright by Haeger + Busch, Germany                / >>>>>>>>> /-----
   Ingenieurbuero fuer Kommunikationslösungen         / <<<<<<<<< /
 ----------------------------------------------------/ >>>>>>>>> /
   Homepage  : http://www.hbTapi.com
   EMail     : info@hbTapi.com
   Package   : hbTapi Components
 -------------------------------------------------------------------------}
 
unit uSettings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, hbComm, hbCommUtils;

type
  TComPortSettingsDlg = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ButtonCancel: TButton;
    ButtonOk: TButton;
    Label6: TLabel;
    Bevel1: TBevel;
    Label_Port: TLabel;
    cbPort: TComboBox;
    cbBaud: TComboBox;
    cbDataBits: TComboBox;
    cbParity: TComboBox;
    cbStopBits: TComboBox;
    cbHandshake: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure DoChangePort(Sender: TObject);
  private
    FPortName : String;
    function  GetBaud: Integer;
    procedure Set_Baud(const Value: Integer);
    function  GetParity: Byte;
    procedure Set_Parity(Value: Byte);
    function  GetDatabits: Integer;
    procedure Set_DataBits(const Value: Integer);
    procedure Set_Port(const Value: String);
    function  GetPort: String;
    function  GetStopbits: Integer;
    procedure Set_StopBits(Value: Integer);
    function GetHandshake: DWORD;
    procedure Set_Handshake(const Value: DWORD);
  public
    function Execute: Boolean;
    procedure AssignFromComPort(const Value: ThbComPort);
    procedure AssignToComPort(const Value: ThbComPort);
    property PortName : String          read  GetPort      write Set_Port;
    property Baud     : Integer         read  GetBaud      write Set_Baud;
    property Parity   : Byte            read  GetParity    write Set_Parity;
    property DataBits : Integer         read  GetDatabits  write Set_DataBits;
    property StopBits : Integer         read  GetStopbits  write Set_StopBits;
    property Handshake: DWORD           read  GetHandshake write Set_Handshake;
  end;


implementation
{$R *.DFM}

function TComPortSettingsDlg.Execute: Boolean;
begin
  result := ShowModal = mrOK;
end;

procedure TComPortSettingsDlg.AssignFromComPort(const Value: ThbComPort);
begin
  PortName   := Value.PortName;
  Baud       := Value.Baudrate;
  Parity     := Value.Parity;
  Databits   := Value.Databits;
  Stopbits   := Value.Stopbits;
  Handshake  := Value.FlowCtrl.Handshake;
end;

procedure TComPortSettingsDlg.AssignToComPort(const Value: ThbComPort);
begin
  Value.PortName   := PortName;
  Value.Baudrate   := Baud;
  Value.Parity     := Parity;
  Value.Databits   := Databits;
  Value.Stopbits   := Stopbits;
  Value.FlowCtrl.Handshake := Handshake;
end;

function TComPortSettingsDlg.GetBaud: Integer;
begin
  result := StrToIntDef(cbBaud.Text, 19200);
end;

function TComPortSettingsDlg.GetParity: Byte;
begin
  case cbParity.ItemIndex of
  1 : result := ODDPARITY;
  2 : result := EVENPARITY;
  3 : result := MARKPARITY;
  4 : result := SPACEPARITY;
  else
    result := NOPARITY;
  end;
end;

procedure TComPortSettingsDlg.Set_Baud(const Value: Integer);
var i : integer;
begin
  i := cbBaud.Items.IndexOf(IntToStr(Value));
  if i >= 0 then
    cbBaud.ItemIndex := i;
end;

procedure TComPortSettingsDlg.Set_Parity(Value: Byte);
begin
  case Value of
    ODDPARITY    : cbParity.ItemIndex := 1;
    EVENPARITY   : cbParity.ItemIndex := 2;
    MARKPARITY   : cbParity.ItemIndex := 3;
    SPACEPARITY  : cbParity.ItemIndex := 4;
  else
    cbParity.ItemIndex := 0; // NOPARITY
  end;  
end;

procedure TComPortSettingsDlg.FormCreate(Sender: TObject);
begin
  EnumSerialPorts(cbPort.Items);
  Set_Baud    (19200);
  Set_Databits(8);
  set_StopBits(ONESTOPBIT);
  Set_Parity  (NOPARITY);
end;

function TComPortSettingsDlg.GetDatabits: Integer;
begin
  result := StrToIntDef( cbDatabits.Text, 8);
end;

procedure TComPortSettingsDlg.Set_DataBits(const Value: Integer);
var i : integer;
begin
  i := cbDatabits.Items.IndexOf(IntToStr(Value));
  if i >= 0 then
    cbDatabits.ItemIndex := i;
end;

procedure TComPortSettingsDlg.Set_Port(const Value: String);
begin
  Label_Port.Caption := Value;
  FPortName          := Value;
  cbPort.OnChange    := nil;
  cbPort.ItemIndex   := cbPort.Items.IndexOf(FPortName);
  cbPort.OnChange    := DoChangePort;
end;

function TComPortSettingsDlg.GetPort: String;
begin
  result  := FPortName;
end;

function TComPortSettingsDlg.GetStopbits: Integer;
begin
  case cbStopbits.ItemIndex of
    1 : result := ONE5STOPBITS;
    2 : result := TWOSTOPBITS;
  else
    result := ONESTOPBIT;
  end;
end;

procedure TComPortSettingsDlg.Set_StopBits(Value: Integer);
begin
  case Value of
    ONE5STOPBITS : cbStopbits.ItemIndex := 1;
    TWOSTOPBITS  : cbStopbits.ItemIndex := 2;
  else
    cbStopbits.ItemIndex := 0
  end;  
end;

procedure TComPortSettingsDlg.DoChangePort(Sender: TObject);
begin
  Set_Port(cbPort.Text);
end;

function TComPortSettingsDlg.GetHandshake: DWORD;
begin
  case cbHandshake.ItemIndex of
    1: result := COMPORTHANDSHAKE_XONXOFF;
    2: result := COMPORTHANDSHAKE_RTSCTS;
    3: result := COMPORTHANDSHAKE_DTRDSR;
  else
    result := COMPORTHANDSHAKE_NONE;
  end;
end;

procedure TComPortSettingsDlg.Set_Handshake(const Value: DWORD);
begin
  case Value  of
    COMPORTHANDSHAKE_XONXOFF : cbHandshake.ItemIndex := 1;
    COMPORTHANDSHAKE_RTSCTS  : cbHandshake.ItemIndex := 2;
    COMPORTHANDSHAKE_DTRDSR  : cbHandshake.ItemIndex := 3;
  else
    cbHandshake.ItemIndex := 0;
  end;
end;

end.
