unit u_ReportDesigner;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxDesgn, frxClass, StdCtrls, ExtCtrls, frxDock, frxDBSet,
  frxADOComponents, frxIBXComponents, frxChart, frxCrypt,
  frxGZip, frxDCtrl, frxDMPExport, frxGradient, frxChBox, frxCross, frxRich,
  frxOLE, frxBarcode, frxPreview, Menus, ActnList, ImgList;

type
  TForm1 = class(TForm)
    frxReport1: TfrxReport;
    frxDesigner1: TfrxDesigner;
    frxUserDataSet1: TfrxUserDataSet;
    frxPreview1: TfrxPreview;
    frxBarCodeObject1: TfrxBarCodeObject;
    frxOLEObject1: TfrxOLEObject;
    frxRichObject1: TfrxRichObject;
    frxCrossObject1: TfrxCrossObject;
    frxCheckBoxObject1: TfrxCheckBoxObject;
    frxGradientObject1: TfrxGradientObject;
    frxDotMatrixExport1: TfrxDotMatrixExport;
    frxDialogControls1: TfrxDialogControls;
    frxGZipCompressor1: TfrxGZipCompressor;
    frxCrypt1: TfrxCrypt;
    frxChartObject1: TfrxChartObject;
    frxIBXComponents1: TfrxIBXComponents;
    frxADOComponents1: TfrxADOComponents;
    frxDBDataset1: TfrxDBDataset;
    frxDockSite1: TfrxDockSite;
    Panel1: TPanel;
    Button1: TButton;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    NewMI: TMenuItem;
    NewReportMI: TMenuItem;
    NewPageMI: TMenuItem;
    NewDialogMI: TMenuItem;
    N9: TMenuItem;
    OpenMI: TMenuItem;
    SaveMI: TMenuItem;
    SaveasMI: TMenuItem;
    N1: TMenuItem;
    PreviewMI: TMenuItem;
    PagesettingsMI: TMenuItem;
    N2: TMenuItem;
    ExitMI: TMenuItem;
    Edit1: TMenuItem;
    UndoMI: TMenuItem;
    RedoMI: TMenuItem;
    N3: TMenuItem;
    CutMI: TMenuItem;
    CopyMI: TMenuItem;
    PasteMI: TMenuItem;
    N4: TMenuItem;
    DeleteMI: TMenuItem;
    DeletePageMI: TMenuItem;
    SelectAllMI: TMenuItem;
    GroupMI: TMenuItem;
    UngroupMI: TMenuItem;
    EditMI: TMenuItem;
    N6: TMenuItem;
    FindMI: TMenuItem;
    ReplaceMI: TMenuItem;
    FindNextMI: TMenuItem;
    N5: TMenuItem;
    BringtoFrontMI: TMenuItem;
    SendtoBackMI: TMenuItem;
    Report1: TMenuItem;
    DataMI: TMenuItem;
    VariablesMI: TMenuItem;
    StylesMI: TMenuItem;
    ReportOptionsMI: TMenuItem;
    View1: TMenuItem;
    ToolbarsMI: TMenuItem;
    StandardMI: TMenuItem;
    TextMI: TMenuItem;
    FrameMI: TMenuItem;
    AlignmentPaletteMI: TMenuItem;
    ObjectInspectorMI: TMenuItem;
    DataTreeMI: TMenuItem;
    ReportTreeMI: TMenuItem;
    N7: TMenuItem;
    RulersMI: TMenuItem;
    GuidesMI: TMenuItem;
    DeleteGuidesMI: TMenuItem;
    N8: TMenuItem;
    OptionsMI: TMenuItem;
    Help1: TMenuItem;
    HelpContentsMI: TMenuItem;
    AboutFastReportMI: TMenuItem;
    ESt1: TMenuItem;
    save1: TMenuItem;
    RecentFiles1: TMenuItem;
    N10: TMenuItem;
    mnu_LastFiles: TMenuItem;
    mnu_File1: TMenuItem;
    mnu_File2: TMenuItem;
    mnu_File3: TMenuItem;
    mnu_File4: TMenuItem;
    mnu_File5: TMenuItem;
    mnu_File6: TMenuItem;
    mnu_File7: TMenuItem;
    mnu_File8: TMenuItem;
    mnu_File9: TMenuItem;
    mnu_File10: TMenuItem;
    mnu_Open2: TMenuItem;
    ActionList1: TActionList;
    actOpen: TAction;
    ImageList1: TImageList;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExitMIClick(Sender: TObject);
    procedure ESt1Click(Sender: TObject);
    procedure save1Click(Sender: TObject);
    procedure RecentFiles1Click(Sender: TObject);
    procedure LoadFile(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure mnu_Open2Click(Sender: TObject);
    procedure actOpenExecute(Sender: TObject);
    procedure SaveMIClick(Sender: TObject);
  private
    Ds: TfrxDesignerForm;
    _FileItemList: TList;
    _Caption: string;
    _IniPath: string;
    _IniName: string;
    _LastFiles: TStringList;
    _LastFilesName: string;
    _CurrentFilename: string;
    procedure SetFileName(aFileName: string);
    procedure LoadLastFilesInMenu;
    function GetDatabase(aName: string): TfrxIBXDatabase;
    function LoadReport(aFileName: string): Boolean;
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  frxRes, o_nf;


procedure TForm1.FormCreate(Sender: TObject);
begin
  _FileItemList := TList.Create;
  _IniPath := IncludeTrailingBackslash(Tnf.GetInstance.System.GetShellFolder(cCSIDL_APPDATA)) + 'frReportDesigner';
  _IniName := _IniPath + '\frReportDesigner.ini';
  _LastFilesName := _IniPath + '\LastFiles.txt';
  _CurrentFilename := '';
  if not DirectoryExists(_IniPath) then
    ForceDirectories(_IniPath);
  _LastFiles := TStringList.Create;
  if FileExists(_LastFilesName) then
    _LastFiles.LoadFromFile(_LastFilesName);
  _Caption := Caption;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FreeAndNil(_LastFiles);
  FreeAndNil(_FileItemList);
end;




procedure TForm1.FormShow(Sender: TObject);
  procedure AddMenuItem(aName: string);
  var
    i1: Integer;
    MI: TMenuItem;
  begin
    for i1 := 0 to MainMenu1.Items.Count - 1 do
    begin
      MI := MainMenu1.Items[i1];
      if SameText(MI.Name, aName) then
      begin
        _FileItemList.Add(MI);
        exit;
      end;
    end;
  end;
var
  Designer: TfrxDesignerForm;
  i1, i2: Integer;
  MenuItem: TMenuItem;
  NewItem: TMenuItem;
  MI: TMenuItem;
begin
  // prevent saving/restoring a report when previewing. This will destroy
  // objects that are loaded in the designer and will lead to AV.
  frxReport1.EngineOptions.DestroyForms := False;
  // set the custom preview
  frxReport1.Preview := frxPreview1;
  // display the designer
  frxReport1.DesignReportInPanel(Panel1);

  // set FR images for our menu
  MainMenu1.Images := frxResources.MainButtonImages;
  // get the reference to the Designer
  Designer := TfrxDesignerForm(frxReport1.Designer);

  // assign FR actions to our menu items
  NewMI.Action := Designer.NewItemCmd;
  NewReportMI.Action := Designer.NewReportCmd;
  NewPageMI.Action := Designer.NewPageCmd;
  NewDialogMI.Action := Designer.NewDialogCmd;
  //OpenMI.Action := actOpen;
  //OpenMI.Action := Designer.OpenCmd;
  SaveMI.Action := Designer.SaveCmd;
  //SaveasMI.Action := Designer.SaveAsCmd;
  PreviewMI.Action := Designer.PreviewCmd;
  PageSettingsMI.Action := Designer.PageSettingsCmd;

  UndoMI.Action := Designer.UndoCmd;
  RedoMI.Action := Designer.RedoCmd;
  CutMI.Action := Designer.CutCmd;
  CopyMI.Action := Designer.CopyCmd;
  PasteMI.Action := Designer.PasteCmd;
  DeleteMI.Action := Designer.DeleteCmd;
  DeletePageMI.Action := Designer.DeletePageCmd;
  SelectAllMI.Action := Designer.SelectAllCmd;
  GroupMI.Action := Designer.GroupCmd;
  UngroupMI.Action := Designer.UngroupCmd;
  EditMI.Action := Designer.EditCmd;
  FindMI.Action := Designer.FindCmd;
  ReplaceMI.Action := Designer.ReplaceCmd;
  FindNextMI.Action := Designer.FindNextCmd;
  BringtoFrontMI.Action := Designer.BringToFrontCmd;
  SendtoBackMI.Action := Designer.SendToBackCmd;

  DataMI.Action := Designer.ReportDataCmd;
  VariablesMI.Action := Designer.VariablesCmd;
  StylesMI.Action := Designer.ReportStylesCmd;
  ReportOptionsMI.Action := Designer.ReportOptionsCmd;

  ToolbarsMI.Action := Designer.ToolbarsCmd;
  StandardMI.Action := Designer.StandardTBCmd;
  TextMI.Action := Designer.TextTBCmd;
  FrameMI.Action := Designer.FrameTBCmd;
  AlignmentPaletteMI.Action := Designer.AlignTBCmd;
  ObjectInspectorMI.Action := Designer.InspectorTBCmd;
  DataTreeMI.Action := Designer.DataTreeTBCmd;
  ReportTreeMI.Action := Designer.ReportTreeTBCmd;
  RulersMI.Action := Designer.ShowRulersCmd;
  GuidesMI.Action := Designer.ShowGuidesCmd;
  DeleteGuidesMI.Action := Designer.DeleteGuidesCmd;
  OptionsMI.Action := Designer.OptionsCmd;

  HelpContentsMI.Action := Designer.HelpContentsCmd;
  AboutFastReportMI.Action := Designer.AboutCmd;


  MenuItem := MainMenu1.Items.Find('File');
  MenuItem := MenuItem.Find('Last Reports');
  _FileItemList.Add(MenuItem.Find('file1'));
  _FileItemList.Add(MenuItem.Find('file2'));
  _FileItemList.Add(MenuItem.Find('file3'));
  _FileItemList.Add(MenuItem.Find('file4'));
  _FileItemList.Add(MenuItem.Find('file5'));
  _FileItemList.Add(MenuItem.Find('file6'));
  _FileItemList.Add(MenuItem.Find('file7'));
  _FileItemList.Add(MenuItem.Find('file8'));
  _FileItemList.Add(MenuItem.Find('file9'));
  _FileItemList.Add(MenuItem.Find('file10'));

  Ds := Designer;
  ds.OpenB.Action := actOpen;

  LoadLastFilesInMenu;

  Designer.SaveCmd.OnExecute := SaveMIClick;

 // ShowMessage(IntToStr(Designer.OpenCmd.ImageIndex));


end;

procedure TForm1.LoadLastFilesInMenu;
var
  i1, i2: Integer;
begin
  for i1 := 0 to _FileItemList.Count - 1 do
    TMenuItem(_FileItemList.Items[i1]).Visible := false;

  i2 := 0;
  //for i1 := Designer.RecentFiles.Count - 1 downto 0 do
  for i1 := _LastFiles.Count - 1 downto 0 do
  begin
    if i2 > 9 then
      break;

    if not FileExists(_LastFiles.Strings[i1]) then
    begin
      _LastFiles.Delete(i1);
      continue;
    end;
    TMenuItem(_FileItemList.Items[i2]).Visible := true;
    TMenuItem(_FileItemList.Items[i2]).Caption := _LastFiles.Strings[i1];
    inc(i2);
  end;

end;



function TForm1.LoadReport(aFileName: string): Boolean;
var
  db: TfrxIBXDatabase;
begin
  Result := false;
  if not FileExists(aFileName) then
  begin
    ShowMessage('Datei existiert nicht');
    exit;
  end;
  ds.LoadFile(aFileName, true);
  SetFileName(aFileName);
  db := GetDatabase('db');
  if Assigned(db) then
    db.Connected := false;
  Result := true;
end;

procedure TForm1.LoadFile(Sender: TObject);
var
  FileName: string;
begin
  if Sender is TMenuItem then
  begin
    FileName := StringReplace(TMenuItem(Sender).Caption, '&', '', [rfReplaceAll]);
    LoadReport(FileName);
  end;
end;


procedure TForm1.mnu_Open2Click(Sender: TObject);
begin
  if ds.OpenDialog.Execute then
  begin
    LoadReport(Ds.OpenDialog.FileName);
  end;
end;

procedure TForm1.RecentFiles1Click(Sender: TObject);
begin
  ShowMessage(ds.RecentFiles.Text);
end;

procedure TForm1.save1Click(Sender: TObject);
begin
  if _CurrentFilename > '' then
  begin
    ds.SaveDialog.InitialDir := ExtractFilePath(_CurrentFilename);
    ds.SaveDialog.FileName := _CurrentFilename;
  end;

  if Ds.SaveFile(true, false) then
    SetFilename(ds.SaveDialog.FileName);

end;


procedure TForm1.SaveMIClick(Sender: TObject);
var
  Path: string;
  db: TfrxIBXDatabase;
begin
  Path := ExtractFilePath(_CurrentFilename);
  if not DirectoryExists(Path) then
  begin
    MessageDlg('Pfad "' + Path + '" existiert nicht!', mtError, [mbOk], 0);
    exit;
  end;
  db := GetDatabase('db');
  if Assigned(db) then
    db.Connected := false;
  Ds.SaveFile(false, false)
end;

procedure TForm1.SetFileName(aFileName: string);
var
  i1: Integer;
begin
  _CurrentFilename := aFileName;
  for i1 := _LastFiles.Count - 1 downto 0 do
  begin
    if SameText(_LastFiles.Strings[i1], aFileName) then
      _LastFiles.Delete(i1);
  end;
  _LastFiles.Add(aFileName);
  _LastFiles.SaveToFile(_LastFilesName);
  Caption := _Caption + ' (' + aFileName + ')';
  LoadLastFilesInMenu;
end;

procedure TForm1.actOpenExecute(Sender: TObject);
begin
  mnu_Open2Click(Sender);
end;

procedure TForm1.ESt1Click(Sender: TObject);
begin
  if ds.OpenDialog.Execute then
  begin
    LoadReport(Ds.OpenDialog.FileName);
  end;
end;


procedure TForm1.ExitMIClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frxReport1.Designer.Close;
end;


function TForm1.GetDatabase(aName: string): TfrxIBXDatabase;
var
  x: TfrxComponent;
begin
  Result := nil;
  x := frxReport1.FindObject(aName);
  if Assigned(x) then
  begin
    if x is TfrxIBXDatabase then
      Result := TfrxIBXDatabase(x);
  end;
end;




end.
