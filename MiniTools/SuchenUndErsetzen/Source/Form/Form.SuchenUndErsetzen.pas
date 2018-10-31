unit Form.SuchenUndErsetzen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, AdvEdit, AdvEdBtn,
  AdvDirectoryEdit, Objekt.Ini, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  Tfrm_SuchenUndErsetzen = class(TForm)
    edt_Verzeichnis: TAdvDirectoryEdit;
    Label1: TLabel;
    edt_Suchtext: TEdit;
    Label2: TLabel;
    edt_Ersetzen: TEdit;
    Label3: TLabel;
    edt_Mask: TEdit;
    Label4: TLabel;
    btn_SuchenUndErsetzen: TButton;
    pnl_Progress: TPanel;
    ProgressBar1: TProgressBar;
    lbl_ProgressText: TLabel;
    cbx_GenaueSuche: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_SuchenUndErsetzenClick(Sender: TObject);
  private
    fIni: TIni;
    procedure SuchenUndErsetzen;
  public
  end;

var
  frm_SuchenUndErsetzen: Tfrm_SuchenUndErsetzen;

implementation

{$R *.dfm}

uses
  Objekt.Global, Allgemein.System;


procedure Tfrm_SuchenUndErsetzen.FormCreate(Sender: TObject);
begin
  Global := TGlobal.Create(Self);
  fIni := TIni.Create(Self);
  edt_Verzeichnis.Text := fIni.Verzeichnis;
  edt_Suchtext.Text := fIni.Suchtext;
  edt_Ersetzen.Text := fIni.Ersetzen;
  edt_Mask.Text     := fIni.Mask;
  cbx_GenaueSuche.Checked := fIni.GenaueSuche;
  pnl_Progress.Visible := false;
end;

procedure Tfrm_SuchenUndErsetzen.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fIni);
  FreeAndNil(Global);
end;



procedure Tfrm_SuchenUndErsetzen.btn_SuchenUndErsetzenClick(Sender: TObject);
begin
  SuchenUndErsetzen;
  pnl_Progress.Visible := false;
  ShowMessage('Fertig');
end;

procedure Tfrm_SuchenUndErsetzen.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  fIni.Verzeichnis := edt_Verzeichnis.Text;
  fIni.Suchtext := edt_Suchtext.Text;
  fIni.Ersetzen := edt_Ersetzen.Text;
  fIni.Mask     := edt_Mask.Text;
  fIni.GenaueSuche := cbx_GenaueSuche.Checked;
end;



procedure Tfrm_SuchenUndErsetzen.SuchenUndErsetzen;
var
  FileList: TStringList;
  TextInhalt: TStringList;
  i1: Integer;
begin
  FileList   := TStringList.Create;
  TextInhalt := TStringList.Create;
  try
    GetAllFiles(edt_Verzeichnis.Text, FileList, true, true, edt_Mask.Text);
    pnl_Progress.Visible := true;
    ProgressBar1.Max := FileList.Count;
    ProgressBar1.Position := 0;
    for i1 := 0 to FileList.Count -1 do
    begin
      ProgressBar1.Position := i1 +1;
      lbl_ProgressText.Caption := FileList.Strings[i1];
      Application.ProcessMessages;
      TextInhalt.Clear;
      TextInhalt.LoadFromFile(FileList.Strings[i1]);
      if cbx_GenaueSuche.Checked then
        TextInhalt.Text := StringReplace(TextInhalt.Text, edt_Suchtext.Text, edt_Ersetzen.Text, [rfReplaceAll])
      else
        TextInhalt.Text := StringReplace(TextInhalt.Text, edt_Suchtext.Text, edt_Ersetzen.Text, [rfReplaceAll, rfIgnoreCase]);
      TextInhalt.SaveToFile(FileList.Strings[i1]);
    end;

  finally
    FreeAndNil(FileList);
    FreeAndNil(TextInhalt);
  end;

end;



end.
