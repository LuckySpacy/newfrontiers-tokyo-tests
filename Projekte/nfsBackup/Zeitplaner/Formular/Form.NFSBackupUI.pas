unit Form.NFSBackupUI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, AdvUtil,
  Vcl.Grids, AdvObj, BaseGrid, AdvGrid, Objekt.Option, Objekt.OptionList,
  Objekt.Allgemein, Objekt.BackupChecker, System.UITypes, Datenmodul.dm,
  Vcl.Menus, Vcl.AppEvnts, vcl.themes;


type
  RCol = Record const
    Indicator = 0;
    Datenbank = 1;
    Backupdatei = 2;
    Uhrzeit = 3;
    Status = 4;
    ColCount = 5;
  End;

type
  Tfrm_NFSBackupUI = class(TForm)
    Panel1: TPanel;
    btn_Neu: TButton;
    btn_Loeschen: TButton;
    btn_Starten: TButton;
    Panel2: TPanel;
    grd: TAdvStringGrid;
    Timer1: TTimer;
    cbx_BackupManuell: TCheckBox;
    TrayIcon1: TTrayIcon;
    pop: TPopupMenu;
    pop_Show: TMenuItem;
    N1: TMenuItem;
    pop_Close: TMenuItem;
    ApplicationEvents: TApplicationEvents;
    pop_Einstellung: TPopupMenu;
    pop_EMailEinstellung: TMenuItem;
    Panel3: TPanel;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btn_NeuClick(Sender: TObject);
    procedure grdDblClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure FormShow(Sender: TObject);
    procedure btn_LoeschenClick(Sender: TObject);
    procedure btn_StartenClick(Sender: TObject);
    procedure cbx_BackupManuellClick(Sender: TObject);
    procedure pop_ShowClick(Sender: TObject);
    procedure pop_CloseClick(Sender: TObject);
    procedure ApplicationEventsMinimize(Sender: TObject);
    procedure pop_EMailEinstellungClick(Sender: TObject);
  private
    fCol: RCol;
    fOptionList: TOptionList;
    fProgrammpfad: string;
    fDataFile: string;
    fBackupChecker: TBackupchecker;
    fBackupError: Boolean;
    procedure ShowOption(aOption: TOption);
    procedure StartBackup(aOption: TOption);
    procedure BackupLauft(Sender: TObject; aOption: TOption);
    procedure BackupEndet(Sender: TObject; aOption: TOption);
    procedure ErrorBackup(Sender: TObject; aOption: TOption; aError: string);
    procedure Show_EMail_Einstellung;
  public
    procedure Aktual(aReload: Boolean);
  end;

var
  frm_NFSBackupUI: Tfrm_NFSBackupUI;

implementation

{$R *.dfm}

uses
  Form.Option, Objekt.Backup, Form.Mail;



procedure Tfrm_NFSBackupUI.FormCreate(Sender: TObject);
begin

  AllgemeinObj := TAllgemeinObj.Create;
  dm := Tdm.Create(nil);

  grd.ColCount := fCol.ColCount;
  grd.FixedCols := 1;
  grd.FixedColWidth := 10;
  grd.DefaultRowHeight := 18;
  grd.rowcount := 2;
  grd.Options := grd.Options + [goRowSelect];
  grd.Options := grd.Options + [goColSizing];
  grd.Cells[fCol.Datenbank,0] := 'Datenbank';
  grd.Cells[fCol.Backupdatei,0] := 'Backupdatei';
  grd.Cells[fCol.Uhrzeit,0] := 'Uhrzeit';
  grd.Cells[fCol.Status,0] := 'Status';
  grd.SortSettings.Show := true;

  grd.ColWidths[fCol.Datenbank] := 200;
  grd.ColWidths[fCol.Backupdatei] := 200;
  grd.ColWidths[fCol.Uhrzeit] := 60;
  grd.ColWidths[fCol.Status] := 100;

  fOptionList := TOptionList.Create;
  fProgrammpfad := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
  fDataFile := fProgrammpfad + 'nfsBackup.dat';

  fBackupChecker := TBackupchecker.Create;
  fBackupChecker.FullDataFilename := fDataFile;
  fBackupChecker.OnStartBackup := BackupLauft;
  fBackupChecker.OnEndBackup   := BackupEndet;
  fBackupChecker.OnBackupError := ErrorBackup;

  Aktual(true);
  cbx_BackupManuell.Checked := AllgemeinObj.Ini.ManuellesBackup;

  if AllgemeinObj.Ini.Skin > '' then
    TStyleManager.TrySetStyle(AllgemeinObj.Ini.Skin);

end;

procedure Tfrm_NFSBackupUI.FormDestroy(Sender: TObject);
begin //
  FreeAndNil(fOptionList);
  FreeAndNil(fBackupChecker);
  FreeAndNil(dm);
  FreeAndNil(AllgemeinObj);
end;


procedure Tfrm_NFSBackupUI.FormShow(Sender: TObject);
begin
  Aktual(true);
  fBackupChecker.TimerEnabled := not cbx_BackupManuell.Checked;
  grd.SetFocus;
end;

procedure Tfrm_NFSBackupUI.grdDblClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  if grd.Objects[0, ARow] <> nil then
  begin
    ShowOption(TOption(grd.Objects[0, ARow]));
  end;
end;



procedure Tfrm_NFSBackupUI.BackupEndet(Sender: TObject; aOption: TOption);
var
  i1: Integer;
begin
  if not fBackupError then
  begin
    aOption.StatusMeldung := 'Wartet';
    for i1 := 0 to fOptionList.Count -1 do
    begin
      if SameText(fOptionList.Item[i1].Datenbank, aOption.Datenbank) then
        fOptionList.Item[i1].StatusMeldung := 'Wartet';
    end;
  end;
  Aktual(false);
end;

procedure Tfrm_NFSBackupUI.BackupLauft(Sender: TObject; aOption: TOption);
var
  i1: Integer;
begin
  fBackupError := false;
  aOption.StatusMeldung := 'Läuft';
  for i1 := 0 to fOptionList.Count -1 do
  begin
    if SameText(fOptionList.Item[i1].Datenbank, aOption.Datenbank) then
      fOptionList.Item[i1].StatusMeldung := 'Läuft';
  end;
  Aktual(false);
  Application.ProcessMessages;
end;

procedure Tfrm_NFSBackupUI.ErrorBackup(Sender: TObject; aOption: TOption;
  aError: string);
var
  i1: Integer;
begin
  fBackupError := true;
  aOption.StatusMeldung := 'Backup Error';
  for i1 := 0 to fOptionList.Count -1 do
  begin
    if SameText(fOptionList.Item[i1].Datenbank, aOption.Datenbank) then
      fOptionList.Item[i1].StatusMeldung := 'Backup Error';
  end;
  Aktual(false);
  MessageDlg(aError, mtError, [mbOk], 0);
end;


procedure Tfrm_NFSBackupUI.btn_LoeschenClick(Sender: TObject);
begin
  if grd.Objects[0, grd.Row] = nil then
    exit;
  if MessageDlg('Möchten Sie wirklich diese Sicherheitsoption löschen?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    exit;
  fOptionList.Delete(TOption(grd.Objects[0, grd.Row]).Id);
  fOptionList.SaveToFile(fDataFile);
  fBackupChecker.AktualData := true;
  Aktual(true);
end;

procedure Tfrm_NFSBackupUI.btn_NeuClick(Sender: TObject);
begin
  ShowOption(nil);
end;


procedure Tfrm_NFSBackupUI.btn_StartenClick(Sender: TObject);
begin
  if grd.Objects[0, grd.Row] = nil then
    exit;

  if MessageDlg('Möchten Sie wirklich ein Backup für '+ sLineBreak +
                TOption(grd.Objects[0, grd.Row]).Datenbank  + sLineBreak +
                'jetzt starten?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    exit;
  if grd.Objects[0, grd.Row] <> nil then
  begin
    StartBackup(TOption(grd.Objects[0, grd.Row]));
  end;
end;

procedure Tfrm_NFSBackupUI.cbx_BackupManuellClick(Sender: TObject);
begin
  AllgemeinObj.Ini.ManuellesBackup := cbx_BackupManuell.Checked;
  fBackupChecker.TimerEnabled := not cbx_BackupManuell.Checked;
end;


procedure Tfrm_NFSBackupUI.ShowOption(aOption: TOption);
var
  Form: Tfrm_Option;
  Option: TOption;
begin
  fBackupChecker.TimerEnabled := false;
  Form := Tfrm_Option.Create(nil);
  try
    Option := aOption;
    Form.setOption(Option);
    Form.ShowModal;
    if Form.Cancel then
      exit;
    if Option = nil then
      Option := fOptionList.Add;
    Form.FillOption(Option);
    fOptionList.SaveToFile(fDataFile);
    fBackupChecker.AktualData := true;
    Aktual(true);
  finally
    FreeAndNil(Form);
    fBackupChecker.TimerEnabled := not cbx_BackupManuell.Checked;
  end;
end;



procedure Tfrm_NFSBackupUI.Aktual(aReload: Boolean);
var
  i1: Integer;
  RowCount: Integer;
begin
  grd.BeginUpdate;
  try
    grd.ClearNormalCells;
    if aReload then
      fOptionList.LoadFromFile(fDataFile);
    RowCount := fOptionList.Count + 1;
    if RowCount < 2 then
      RowCount := 2;
    grd.RowCount := RowCount;
    for i1 := 0 to fOptionList.Count -1 do
    begin
      grd.Objects[0, i1+1] := fOptionList.Item[i1];
      grd.Cells[fCol.Datenbank, i1+1] := fOptionList.Item[i1].Datenbank;
      grd.Cells[fCol.Backupdatei, i1+1] := fOptionList.Item[i1].Backupdatei;
      grd.Cells[fCol.Uhrzeit, i1+1] := FormatDateTime('hh:nn',  fOptionList.Item[i1].StartZeit);
      grd.Cells[fCol.Status, i1+1] := fOptionList.Item[i1].StatusMeldung;
    end;
  finally
    grd.EndUpdate;
  end;
end;


procedure Tfrm_NFSBackupUI.StartBackup(aOption: TOption);
var
  Backup: TBackup;
begin
  Backup := TBackup.Create;
  try
    Backup.BackupProtokollPfad := ExtractFilePath(ParamStr(0));
    Backup.OnStartBackup := BackupLauft;
    Backup.OnEndBackup := BackupEndet;
    Backup.OnBackupError := ErrorBackup;
    Backup.StartBackup(aOption);
  finally
    FreeAndNil(BackUp);
  end;

end;


procedure Tfrm_NFSBackupUI.pop_CloseClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_NFSBackupUI.pop_EMailEinstellungClick(Sender: TObject);
begin
  Show_EMail_Einstellung;
end;

procedure Tfrm_NFSBackupUI.pop_ShowClick(Sender: TObject);
begin
  show;
  WindowState := wsNormal;
  Application.BringToFront;
end;

procedure Tfrm_NFSBackupUI.ApplicationEventsMinimize(Sender: TObject);
begin
  Hide;
  WindowState := wsMinimized;
end;


procedure Tfrm_NFSBackupUI.Show_EMail_Einstellung;
var
  Form: Tfrm_Mail;
begin
  Form := Tfrm_Mail.Create(nil);
  try
    Form.ShowModal;
  finally
    FreeAndNil(Form);
  end;

end;




end.
