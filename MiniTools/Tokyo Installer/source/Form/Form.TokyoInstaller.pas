unit Form.TokyoInstaller;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Objekt.Ini, Vcl.StdCtrls, AdvEdit,
  AdvEdBtn, AdvDirectoryEdit;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    edt_TMS: TAdvDirectoryEdit;
    btn_Install: TButton;
    Label2: TLabel;
    edt_Optima: TAdvDirectoryEdit;
    Label3: TLabel;
    edt_Gnostice: TAdvDirectoryEdit;
    Label4: TLabel;
    edt_Mad: TAdvDirectoryEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_InstallClick(Sender: TObject);
  private
    fIni: TIni;
    fBibliothekspfad: TStringList;
    fSuchpfad: TStringList;
    procedure Installieren;
    procedure SchreibeInBibliothekspfad(aValue: string);
    function getBibliothekspfadFromList: string;
    function getSuchpfadFromList: string;
    procedure LoescheInBibliothekspfad(aValue: string);
    procedure LoescheInSuchpfad(aValue: string);
    procedure SchreibeInSuchpfad(aValue: string);
    procedure MultiLoeschenInBibliothekspfad(aAV_TMS, aAV_OTPIMA: string);
    procedure MultiSchreibeInBibliothekspfad(a32Bit: Boolean);
public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  Objekt.Global, Allgemein.System;



procedure TForm1.FormCreate(Sender: TObject);
begin
  Global := TGlobal.Create(Self);
  fIni := TIni.Create(Self);
  edt_TMS.Text := fIni.TMSPfad;
  edt_Optima.Text := fIni.OptimaPfad;
  edt_Gnostice.Text := fIni.GnosticePfad;
  edt_Mad.Text := fIni.MadCollectionPfad;
  fBibliothekspfad := TStringList.Create;
  fBibliothekspfad.Delimiter := ';';
  fBibliothekspfad.StrictDelimiter := true;
  fSuchpfad := TStringList.Create;
  fSuchpfad.Delimiter := ';';
  fSuchpfad.StrictDelimiter := true;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FreeAndNil(Global);
  FreeAndNil(fIni);
  FreeAndNil(fBibliothekspfad);
  FreeAndNil(fSuchpfad);
end;


procedure TForm1.btn_InstallClick(Sender: TObject);
begin
  if Trim(edt_TMS.Text) = '' then
  begin
    ShowMessage('Bitte TMS-Pfad eintragen.');
    exit;
  end;

  if Trim(edt_Optima.Text) = '' then
  begin
    ShowMessage('Bitte Optima-Komponenten-Pfad eintragen.');
    exit;
  end;

  {
  if Trim(edt_Gnostice.Text) = '' then
  begin
    ShowMessage('Bitte Gnostice-Pfad eintragen.');
    exit;
  end;
  }
  if Trim(edt_Mad.Text) = '' then
  begin
    ShowMessage('Bitte MadCollection-Pfad eintragen.');
    exit;
  end;



  Installieren;

  ShowMessage('Fertig');
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fIni.TMSPfad := IncludeTrailingPathDelimiter(edt_TMS.Text);
  fIni.OptimaPfad :=  IncludeTrailingPathDelimiter(edt_Optima.Text);
  fIni.GnosticePfad :=  IncludeTrailingPathDelimiter(edt_Gnostice.Text);
  fIni.MadCollectionPfad := IncludeTrailingPathDelimiter(edt_Mad.Text);
end;



procedure TForm1.Installieren;
var
  AV_TMS: string;
  AV_OPTIMA: string;
  s: string;
begin
  edt_TMS.Text := IncludeTrailingPathDelimiter(edt_TMS.Text);
  edt_Optima.Text := IncludeTrailingPathDelimiter(edt_Optima.Text);
  AV_TMS := IncludeTrailingPathDelimiter(fIni.AV_TMS);
  if not SameText(AV_TMS, edt_TMS.Text) then
  begin
    fIni.AV_TMS := edt_TMS.Text;
    AV_TMS := IncludeTrailingPathDelimiter(edt_TMS.Text);
  end;

  AV_OPTIMA := IncludeTrailingPathDelimiter(fIni.AV_OPTIMA);
  if not SameText(AV_OPTIMA, edt_Optima.Text) then
  begin
    fIni.AV_OPTIMA := edt_Optima.Text;
    AV_OPTIMA := IncludeTrailingPathDelimiter(edt_Optima.Text);
  end;

  fSuchpfad.DelimitedText := fIni.Suchpfad32;


  // Bibliothekspfad 32
  fBibliothekspfad.DelimitedText := fIni.BibliotheksPfad32;
  MultiLoeschenInBibliothekspfad(AV_TMS, AV_OPTIMA);
  MultiSchreibeInBibliothekspfad(true);
  s := getBibliothekspfadFromList;
  fIni.BibliotheksPfad32 := s;

  // Bibliothekspfad 64
  fBibliothekspfad.Clear;
  fBibliothekspfad.DelimitedText := fIni.BibliotheksPfad64;
  MultiLoeschenInBibliothekspfad(AV_TMS, AV_OPTIMA);
  MultiSchreibeInBibliothekspfad(false);
  s := getBibliothekspfadFromList;
  fIni.BibliotheksPfad64 := s;



  {
  LoescheInSuchpfad(AV_TMS + 'Delphi102Tokyo\Win32\Release\');
  LoescheInSuchpfad(AV_TMS);
  LoescheInSuchpfad(AV_TMS + 'XlsAdapter\');
  LoescheInSuchpfad(AV_OPTIMA + 'delphi-rest-client-api-master\src\');
  LoescheInSuchpfad(AV_OPTIMA + 'Drag and Drop\Source\');
  LoescheInSuchpfad(AV_OPTIMA + 'GridAdapter\');
  LoescheInSuchpfad(AV_OPTIMA + 'logger\');
  LoescheInSuchpfad(AV_OPTIMA + 'logger\log4d\');
  LoescheInSuchpfad(AV_OPTIMA + 'Mail\');
  LoescheInSuchpfad(AV_OPTIMA + 'RegExp\Source\');
  LoescheInSuchpfad(AV_OPTIMA + 'rvSpell\');
  LoescheInSuchpfad(AV_OPTIMA + 'tlb\');
  LoescheInSuchpfad(AV_OPTIMA + 'Virtual-TreeView-master\Source\');
  LoescheInSuchpfad(AV_OPTIMA + 'ZipMaster\');
  LoescheInSuchpfad(AV_OPTIMA + 'newfrontiers\ExecOnTime\');
  LoescheInSuchpfad(AV_OPTIMA + 'newfrontiers\LockProvider\');
  LoescheInSuchpfad(AV_OPTIMA + 'newfrontiers\NFSButton\');
  LoescheInSuchpfad(AV_OPTIMA + 'newfrontiers\NFSComboBox\');
  LoescheInSuchpfad(AV_OPTIMA + 'newfrontiers\NFSDatePicker\');
  LoescheInSuchpfad(AV_OPTIMA + 'newfrontiers\NFSEditAutoComplete\');
  LoescheInSuchpfad(AV_OPTIMA + 'newfrontiers\NFSEditBtn\');
  LoescheInSuchpfad(AV_OPTIMA + 'newfrontiers\NFSEditFloat\');
  LoescheInSuchpfad(AV_OPTIMA + 'newfrontiers\NFSLabel\');
  LoescheInSuchpfad(AV_OPTIMA + 'newfrontiers\ProcessQueue\');
  LoescheInSuchpfad(AV_OPTIMA + 'newfrontiers\Ueberschriftenpanel\');



  s := getSuchpfadFromList;
  fIni.Suchpfad32 := s;
  }

end;


procedure TForm1.MultiSchreibeInBibliothekspfad(a32Bit: Boolean);
var
  GnosticePfad: String;
  MadPfad: string;
  Win: string;
begin
  if a32Bit then
    Win := 'Win32'
  else
    Win := 'Win64';

  GnosticePfad := IncludeTrailingPathDelimiter(edt_Gnostice.Text);
  MadPfad      := IncludeTrailingPathDelimiter(edt_Mad.Text);

  SchreibeInBibliothekspfad('$(TMS)\Delphi102Tokyo\'+ Win + '\Release\');
  SchreibeInBibliothekspfad('$(TMS)\');
  SchreibeInBibliothekspfad('$(TMS)\XlsAdapter\');
  SchreibeInBibliothekspfad('$(OPTIMA)\awrem32\');
  SchreibeInBibliothekspfad('$(OPTIMA)\delphi-rest-client-api-master\src\');
  SchreibeInBibliothekspfad('$(OPTIMA)\Drag and Drop\Source\');
  SchreibeInBibliothekspfad('$(OPTIMA)\Drag and Drop\Demos\Outlook\MAPI\');
  SchreibeInBibliothekspfad('$(OPTIMA)\GridAdapter\');
  SchreibeInBibliothekspfad('$(OPTIMA)\logger\');
  SchreibeInBibliothekspfad('$(OPTIMA)\logger\log4d\');
  SchreibeInBibliothekspfad('$(OPTIMA)\Mail\');
  SchreibeInBibliothekspfad('$(OPTIMA)\RegExp\Source\');
  SchreibeInBibliothekspfad('$(OPTIMA)\rvSpell\');
  SchreibeInBibliothekspfad('$(OPTIMA)\tlb\');
  SchreibeInBibliothekspfad('$(OPTIMA)\Virtual-TreeView-master\Source\');
  SchreibeInBibliothekspfad('$(OPTIMA)\ZipMaster\');
  SchreibeInBibliothekspfad('$(OPTIMA)\newfrontiers\ExecOnTime\');
  SchreibeInBibliothekspfad('$(OPTIMA)\newfrontiers\LockProvider\');
  SchreibeInBibliothekspfad('$(OPTIMA)\newfrontiers\NFSButton\');
  SchreibeInBibliothekspfad('$(OPTIMA)\newfrontiers\NFSComboBox\');
  SchreibeInBibliothekspfad('$(OPTIMA)\newfrontiers\NFSDatePicker\');
  SchreibeInBibliothekspfad('$(OPTIMA)\newfrontiers\NFSEditAutoComplete\');
  SchreibeInBibliothekspfad('$(OPTIMA)\newfrontiers\NFSEditBtn\');
  SchreibeInBibliothekspfad('$(OPTIMA)\newfrontiers\NFSEditFloat\');
  SchreibeInBibliothekspfad('$(OPTIMA)\newfrontiers\NFSLabel\');
  SchreibeInBibliothekspfad('$(OPTIMA)\newfrontiers\ProcessQueue\');
  SchreibeInBibliothekspfad('$(OPTIMA)\newfrontiers\Ueberschriftenpanel\');

  SchreibeInBibliothekspfad('$(OPTIMA)\NfsFramework\NewFrontiers.Commands\');
  SchreibeInBibliothekspfad('$(OPTIMA)\NfsFramework\NewFrontiers.Configuration\');
  SchreibeInBibliothekspfad('$(OPTIMA)\NfsFramework\NewFrontiers.Database\');
  SchreibeInBibliothekspfad('$(OPTIMA)\NfsFramework\NewFrontiers.Entity\');
  SchreibeInBibliothekspfad('$(OPTIMA)\NfsFramework\NewFrontiers.Events\');
  SchreibeInBibliothekspfad('$(OPTIMA)\NfsFramework\NewFrontiers.GUI\');
  SchreibeInBibliothekspfad('$(OPTIMA)\NfsFramework\NewFrontiers.Reflection\');
  SchreibeInBibliothekspfad('$(OPTIMA)\NfsFramework\NewFrontiers.Tapi\');
  SchreibeInBibliothekspfad('$(OPTIMA)\NfsFramework\NewFrontiers.Threading\');
  SchreibeInBibliothekspfad('$(OPTIMA)\NfsFramework\NewFrontiers.Utility\');
  SchreibeInBibliothekspfad('$(OPTIMA)\NfsFramework\NewFrontiers.Validation\');
  SchreibeInBibliothekspfad('$(OPTIMA)\NfsFramework\NewFrontiers.Vcl\');


  if (Length(GnosticePfad) > 1) and (DirectoryExists(GnosticePfad)) then
  begin
    SchreibeInBibliothekspfad(GnosticePfad + 'PDFtoolkit VCL\Lib\RAD10.2\' + Win + '\');
    SchreibeInBibliothekspfad(GnosticePfad + 'Shared\Lib\RAD10.2\' + Win + '\');
    SchreibeInBibliothekspfad(GnosticePfad + 'eDocEngine VCL\Lib\RAD10.2\' + Win + '\');
    SchreibeInBibliothekspfad(GnosticePfad + 'Shared3\Lib\RAD10.2\' + Win + '\');
    SchreibeInBibliothekspfad(GnosticePfad + 'eDocEngine VCL\Lib\RAD10.2\' + Win + '\ExpIntf\');
    SchreibeInBibliothekspfad(GnosticePfad + 'eDocEngine VCL\Source\HtmlView\HtmlViewer Packages\');
  end;

  SchreibeInBibliothekspfad('$(TRichViewVCL)\ThirdParty\rvHtmlViewImporter\Source');

  SchreibeInBibliothekspfad(MadPfad + 'madBasic\BDS19\' + Win + '\');
  SchreibeInBibliothekspfad(MadPfad + 'madDisAsm\BDS19\' + Win + '\');
  SchreibeInBibliothekspfad(MadPfad + 'madExcept\BDS19\' + Win + '\');
  SchreibeInBibliothekspfad(MadPfad + 'madExcept\..\Plugins\' + Win + '\');
  SchreibeInBibliothekspfad(MadPfad + 'madRemote\BDS19\' + Win + '\');
  SchreibeInBibliothekspfad(MadPfad + 'madKernel\BDS19\' + Win + '\');
  if a32Bit then
    SchreibeInBibliothekspfad(MadPfad + 'madCodeHook\BDS19\' + Win + '\');
  SchreibeInBibliothekspfad(MadPfad + 'madSecurity\BDS19\' + Win + '\');
  SchreibeInBibliothekspfad(MadPfad + 'madShell\BDS19\' + Win + '\');


end;


procedure TForm1.MultiLoeschenInBibliothekspfad(aAV_TMS, aAV_OTPIMA: string);
begin
  LoescheInBibliothekspfad(aAV_TMS + 'Delphi102Tokyo\Win32\Release\');
  LoescheInBibliothekspfad(aAV_TMS);
  LoescheInBibliothekspfad(aAV_TMS + 'XlsAdapter\');
  LoescheInBibliothekspfad(aAV_OTPIMA + 'delphi-rest-client-api-master\src\');
  LoescheInBibliothekspfad(aAV_OTPIMA + 'Drag and Drop\Source\');
  LoescheInBibliothekspfad(aAV_OTPIMA + 'Drag and Drop\Demos\Outlook\MAPI\');
  LoescheInBibliothekspfad(aAV_OTPIMA + 'GridAdapter\');
  LoescheInBibliothekspfad(aAV_OTPIMA + 'logger\');
  LoescheInBibliothekspfad(aAV_OTPIMA + 'logger\log4d\');
  LoescheInBibliothekspfad(aAV_OTPIMA + 'Mail\');
  LoescheInBibliothekspfad(aAV_OTPIMA + 'RegExp\Source\');
  LoescheInBibliothekspfad(aAV_OTPIMA + 'rvSpell\');
  LoescheInBibliothekspfad(aAV_OTPIMA + 'tlb\');
  LoescheInBibliothekspfad(aAV_OTPIMA + 'Virtual-TreeView-master\Source\');
  LoescheInBibliothekspfad(aAV_OTPIMA + 'ZipMaster\');
  LoescheInBibliothekspfad(aAV_OTPIMA + 'newfrontiers\ExecOnTime\');
  LoescheInBibliothekspfad(aAV_OTPIMA + 'newfrontiers\LockProvider\');
  LoescheInBibliothekspfad(aAV_OTPIMA + 'newfrontiers\NFSButton\');
  LoescheInBibliothekspfad(aAV_OTPIMA + 'newfrontiers\NFSComboBox\');
  LoescheInBibliothekspfad(aAV_OTPIMA + 'newfrontiers\NFSDatePicker\');
  LoescheInBibliothekspfad(aAV_OTPIMA + 'newfrontiers\NFSEditAutoComplete\');
  LoescheInBibliothekspfad(aAV_OTPIMA + 'newfrontiers\NFSEditBtn\');
  LoescheInBibliothekspfad(aAV_OTPIMA + 'newfrontiers\NFSEditFloat\');
  LoescheInBibliothekspfad(aAV_OTPIMA + 'newfrontiers\NFSLabel\');
  LoescheInBibliothekspfad(aAV_OTPIMA + 'newfrontiers\ProcessQueue\');
  LoescheInBibliothekspfad(aAV_OTPIMA + 'newfrontiers\Ueberschriftenpanel\');
end;


function TForm1.getBibliothekspfadFromList: string;
var
  i1: Integer;
begin
  Result := '';
  for i1 := 0 to fBibliothekspfad.Count -1 do
  begin
    Result := Result + Trim(fBibliothekspfad.Strings[i1]) + ';';
  end;
end;


function TForm1.getSuchpfadFromList: string;
var
  i1: Integer;
begin
  Result := '';
  for i1 := 0 to fSuchpfad.Count -1 do
  begin
    Result := Result + Trim(fSuchpfad.Strings[i1]) + ';';
  end;
end;



procedure TForm1.LoescheInBibliothekspfad(aValue: string);
var
  i1: Integer;
begin
  for i1 := fBibliothekspfad.Count -1 downto 0 do
  begin
    if SameText(aValue, IncludeTrailingPathDelimiter(fBibliothekspfad.Strings[i1])) then
    begin
      fBibliothekspfad.Delete(i1);
      exit;
    end;
  end;
end;



procedure TForm1.SchreibeInBibliothekspfad(aValue: string);
var
  i1: Integer;
  s: string;
begin
  for i1 := 0 to fBibliothekspfad.Count -1 do
  begin
    if SameText(IncludeTrailingPathDelimiter(aValue), IncludeTrailingPathDelimiter(fBibliothekspfad.Strings[i1])) then
      exit;
  end;
  fBibliothekspfad.Add(aValue);
end;




procedure TForm1.LoescheInSuchpfad(aValue: string);
var
  i1: Integer;
begin
  for i1 := fSuchpfad.Count -1 downto 0 do
  begin
    if SameText(aValue, IncludeTrailingPathDelimiter(fSuchpfad.Strings[i1])) then
    begin
      fSuchpfad.Delete(i1);
      exit;
    end;
  end;
end;

procedure TForm1.SchreibeInSuchpfad(aValue: string);
var
  i1: Integer;
  s: string;
begin
  for i1 := 0 to fSuchpfad.Count -1 do
  begin
    if SameText(aValue, fSuchpfad.Strings[i1]) then
      exit;
  end;
  fSuchpfad.Add(aValue);
end;


end.
