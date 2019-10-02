unit Form.Option;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Objekt.Option, Vcl.Samples.Spin;

type
  Tfrm_Option = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edt_Datenbank: TEdit;
    edt_Backupdatei: TEdit;
    edt_User: TEdit;
    edt_Passwort: TEdit;
    edt_Uhrzeit: TDateTimePicker;
    cbx_Checksum: TCheckBox;
    cbx_Limbo: TCheckBox;
    cbx_MetaOnly: TCheckBox;
    cbx_NoGarbage: TCheckBox;
    cbx_OldMetadata: TCheckBox;
    cbx_NonTransportable: TCheckBox;
    cbx_Convert: TCheckBox;
    cbx_Zeitstempel: TCheckBox;
    Panel1: TPanel;
    btn_Ok: TButton;
    btn_Cancel: TButton;
    Label7: TLabel;
    edt_Servername: TEdit;
    cbx_MaxAnzahl: TCheckBox;
    edt_Anzahl: TSpinEdit;
    lbl_Anzahl: TLabel;
    Shape1: TShape;
    lbl_Hinweis: TLabel;
    Label8: TLabel;
    edt_Passwort2: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btn_OkClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure CheckStateChangedMaxAnzahl;
    procedure cbx_MaxAnzahlClick(Sender: TObject);
  private
    fCancel: Boolean;
    fOption: TOption;
    fConnectCheck: Integer;
    procedure ErrorConnect(Sender: TObject; aMsg: string);
    procedure AfterConnected(Sender: TObject);
  public
    procedure setOption(aOption: TOption);
    procedure FillOption(aOption: TOption);
    property Cancel: Boolean read fCancel;

  end;

var
  frm_Option: Tfrm_Option;

implementation

{$R *.dfm}

uses
  Datenmodul.dm;


procedure Tfrm_Option.FormCreate(Sender: TObject);
begin
  fCancel := true;
  fOption := nil;
  lbl_Anzahl.Visible := false;
  edt_Anzahl.Visible := false;
  edt_Datenbank.Text := '';
  edt_Backupdatei.Text := '';
  edt_User.Text := 'SYSDBA';
  edt_Passwort.Text := '';
  edt_Servername.Text := '';
  edt_Anzahl.Value := 0;
  fConnectCheck := 0;
  lbl_Hinweis.StyleElements := lbl_Hinweis.StyleElements - [seFont];
  lbl_Hinweis.Font.Color := clBlack;
end;

procedure Tfrm_Option.setOption(aOption: TOption);
begin
  fOption := aOption;
  if fOption = nil then
    exit;
  edt_Servername.Text := fOption.Servername;
  edt_Datenbank.Text := fOption.Datenbank;
  edt_Backupdatei.Text := fOption.Backupdatei;
  edt_User.Text := fOption.User;
  edt_Passwort.Text := fOption.Passwort;
  edt_Passwort2.Text := fOption.Passwort;
  edt_Uhrzeit.Time := fOption.StartZeit;
  cbx_Checksum.Checked := fOption.Checksum;
  cbx_Limbo.Checked := fOption.Limbo;
  cbx_MetaOnly.Checked := fOption.OnlyMeta;
  cbx_NoGarbage.Checked := fOption.NoGarbage;
  cbx_NonTransportable.Checked := fOption.NonTransportable;
  cbx_Convert.Checked := fOption.Convert;
  cbx_Zeitstempel.Checked := fOption.Zeitstempel;
  cbx_OldMetadata.Checked := fOption.OldMetadata;
  cbx_MaxAnzahl.Checked := fOption.MaxAnzahlBackupDateien;
  edt_Anzahl.Value := fOption.MaxAnzahlBackup;
  CheckStateChangedMaxAnzahl;
end;

procedure Tfrm_Option.FillOption(aOption: TOption);
begin
  aOption.Servername := edt_Servername.Text;
  aOption.Datenbank := edt_Datenbank.Text;
  aOption.Backupdatei := edt_Backupdatei.Text;
  aOption.User := edt_User.Text;
  aOption.Passwort := edt_Passwort.Text;
  aOption.StartZeit := edt_Uhrzeit.Time;
  aOption.Checksum := cbx_Checksum.Checked;
  aOption.Limbo := cbx_Limbo.Checked;
  aOption.OnlyMeta := cbx_MetaOnly.Checked;
  aOption.NoGarbage := cbx_NoGarbage.Checked;
  aOption.NonTransportable := cbx_NonTransportable.Checked;
  aOption.Convert := cbx_Convert.Checked;
  aOption.Zeitstempel := cbx_Zeitstempel.Checked;
  aOption.OldMetadata := cbx_OldMetadata.Checked;
  aOption.MaxAnzahlBackup := edt_Anzahl.Value;
  aOption.MaxAnzahlBackupDateien := cbx_MaxAnzahl.Checked;
  CheckStateChangedMaxAnzahl;
end;



procedure Tfrm_Option.btn_CancelClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_Option.btn_OkClick(Sender: TObject);
var
  ConnectType: RConnectType;
begin
  if edt_Passwort.Text <> edt_Passwort2.Text then
  begin
    MessageDlg('Das Passwort stimmt nicht überein.', mtError, [mbOk], 0);
    exit;
  end;
  ConnectType.Servername := edt_Servername.Text;
  ConnectType.Datenbank  := edt_Datenbank.Text;
  ConnectType.Passwort   := edt_Passwort.Text;
  ConnectType.User       := edt_User.Text;
  fConnectCheck := 0;
  dm.OnConnectionError := ErrorConnect;
  dm.OnAfterConnect    := AfterConnected;
  dm.CheckConnect(ConnectType);
  while fConnectCheck = 0 do;

  if fConnectCheck < 0 then
  begin
    if MessageDlg('Möchten Sie die Sicherheitsoptionen weiter bearbeiten?', mtConfirmation, [mbYes, mbNo], 0) <> mrNo then
      exit;
  end;

  fCancel := false;
  close;
end;


procedure Tfrm_Option.cbx_MaxAnzahlClick(Sender: TObject);
begin
  CheckStateChangedMaxAnzahl;
end;

procedure Tfrm_Option.CheckStateChangedMaxAnzahl;
begin
  lbl_Anzahl.Visible := cbx_MaxAnzahl.Checked;
  edt_Anzahl.Visible := cbx_MaxAnzahl.Checked;
end;

procedure Tfrm_Option.ErrorConnect(Sender: TObject; aMsg: string);
begin
  fConnectCheck := -1;
  MessageDlg('Die Überprüfung der Datenbankverbindung ist fehlgeschlagen.' + sLineBreak + sLineBreak +
              aMsg, mtError, [mbOk], 0);
end;

procedure Tfrm_Option.AfterConnected(Sender: TObject);
begin
  fConnectCheck := 1;
end;


end.
