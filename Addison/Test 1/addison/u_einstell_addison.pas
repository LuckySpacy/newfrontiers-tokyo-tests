unit u_einstell_addison;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, o_stammdaten, ComCtrls,
  Ueberschriftenpanel_norm, Vcl.Buttons, AdvEdit, AdvEdBtn, AdvDirectoryEdit, DateUtils;

type
  TFrmAddisonEinstellungen = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DTPStart: TDateTimePicker;
    DTPEnde: TDateTimePicker;
    Label4: TLabel;
    Ueberschriftenpanel2: TUeberschriftenpanel;
    Label5: TLabel;
    Label6: TLabel;
    EdtDir: TAdvDirectoryEdit;
    Label7: TLabel;
    edt_Backup: TAdvDirectoryEdit;
    Label8: TLabel;
    edt_Log: TAdvDirectoryEdit;
    EdtID: TEdit;
    edtAddisonUser: TEdit;
    edtAddisonPass: TEdit;
    BtnApply: TSpeedButton;
    Label9: TLabel;
    edt_Wirtschaftsjahr: TDateTimePicker;
    procedure BtnApplyClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    Stammdaten : TStammdaten;
    { Private-Deklarationen }
  public
    procedure setStammdaten(aStammdaten : TStammdaten);
    { Public-Deklarationen }
  end;

var
  FrmAddisonEinstellungen: TFrmAddisonEinstellungen;

implementation
uses u_main;
{$R *.dfm}

procedure TFrmAddisonEinstellungen.setStammdaten(aStammdaten: TStammdaten);
begin

  Stammdaten := aStammdaten;

end;

procedure TFrmAddisonEinstellungen.BtnApplyClick(Sender: TObject);
begin

  ModalResult := mrOK;

end;

procedure TFrmAddisonEinstellungen.FormShow(Sender: TObject);
var
  Wjbeginn: string;
begin

  Stammdaten.UnpackServerPreferences;

  EdtDir.Text := Stammdaten.ServerEinstellungen.ReadString('AddisonExportDir', '');
  EdtID.Text := Stammdaten.ServerEinstellungen.ReadString('AddisonMandant', '00000');

  edt_Backup.Text := Stammdaten.ServerEinstellungen.ReadString('AddisonExportBackup', '');
  edt_Log.Text := Stammdaten.ServerEinstellungen.ReadString('AddisonExportLog', '');

  if Trim(edt_Backup.Text) = '' then
    edt_Backup.Text := EdtDir.Text;

  if Trim(edt_Log.Text) = '' then
    edt_Log.Text := EdtDir.Text;

  edtAddisonUser.Text := Stammdaten.getAddisonUser;
  edtAddisonPass.Text := Stammdaten.getAddisonPass;

  DTPStart.Time := StrToTime(Stammdaten.ServerEinstellungen.ReadString('AddisonZFStart', '00:00'));
  DTPEnde.Time := StrToTime(Stammdaten.ServerEinstellungen.ReadString('AddisonZFEnde', '00:00'));

  Wjbeginn := DateTimeToStr(DateUtils.StartOfTheYear(now));
  edt_Wirtschaftsjahr.Date := StrToDate(Stammdaten.ServerEinstellungen.ReadString('AddisonWjBeginn', Wjbeginn));

end;

procedure TFrmAddisonEinstellungen.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  Stammdaten.ServerEinstellungen.WriteString('AddisonExportDir', EdtDir.Text);
  Stammdaten.ServerEinstellungen.WriteString('AddisonMandant', EdtId.Text);
  Stammdaten.ServerEinstellungen.WriteString('AddisonZFStart', FormatDateTime('hh:nn', DTPStart.Time));
  Stammdaten.ServerEinstellungen.WriteString('AddisonZFEnde', FormatDateTime('hh:nn', DTPEnde.Time));
  Stammdaten.ServerEinstellungen.WriteString('AddisonWjBeginn', DateToStr(edt_Wirtschaftsjahr.Date));

  Stammdaten.ServerEinstellungen.WriteString('AddisonExportBackup', edt_Backup.Text);
  Stammdaten.ServerEinstellungen.WriteString('AddisonExportLog', edt_Log.Text);

  Stammdaten.setAddisonUser(EdtAddisonUser.Text);
  Stammdaten.setAddisonPass(edtAddisonPass.Text);

  Stammdaten.PackServerPreferences;
  Stammdaten.saveToDB;

end;

end.
