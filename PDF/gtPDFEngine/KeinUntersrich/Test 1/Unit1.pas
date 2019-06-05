unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, gtXportIntf,
  gtFRXportIntf, gtClasses3, gtCstDocEng, gtCstPlnEng, gtCstPDFEng, gtExPDFEng,
  gtPDFEng, frxRich, frxClass;

type
  TForm1 = class(TForm)
    Report: TfrxReport;
    frxRichObject1: TfrxRichObject;
    gtPDFEngine1: TgtPDFEngine;
    gtFRExportInterface1: TgtFRExportInterface;
    btn_Preview: TButton;
    btn_PDF: TButton;
    procedure btn_PreviewClick(Sender: TObject);
    procedure btn_PDFClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    fRTF: TStringList;
    procedure SetRichViewText(aName, aValue: string); overload;
    procedure SetRichViewText(aRichView: TfrxRichView; aValue: string); overload;
    function GetRichView(aName: string): TfrxRichView;
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn_PDFClick(Sender: TObject);
var
  Path: string;
begin
  Report.LoadFromFile('Test.fr3');
  SetRichViewText('rv_Langbez', fRTF.Text);
  Report.PrepareReport;
  gtPDFEngine1.Preferences.OpenAfterCreate := true;
  gtPDFEngine1.Preferences.ShowSetupDialog := false;
  gtPDFEngine1.Preferences.EmbedTrueTypeFonts := etfNone;
  //gtFRExportInterface1.RichTextAsImage := true;
  gtFRExportInterface1.Engine := gtPDFEngine1;
  IgtDocumentEngine(gtFRExportInterface1.Engine).FileName := 'PDF1.pdf';
  IgtDocumentEngine(gtFRExportInterface1.Engine).Preferences.ShowSetupDialog := false;
  gtFRExportInterface1.RenderDocument(Report, false, false);
  Path := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
  Report.SaveToFile(Path + 'test.rep');
end;

procedure TForm1.btn_PreviewClick(Sender: TObject);
begin
  Report.LoadFromFile('Test.fr3');
  SetRichViewText('rv_Langbez', fRTF.Text);
  Report.ShowReport;
end;




procedure TForm1.FormCreate(Sender: TObject);
var
  Path: string;
begin
  Path := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
  fRTF := TStringList.Create;
  fRTF.LoadFromFile(Path + 'rtf1.rtf');
end;

procedure TForm1.SetRichViewText(aName, aValue: string);
var
  RichView: TfrxRichView;
begin
  RichView := GetRichView(aName);
  if not Assigned(RichView) then
    exit;
  SetRichViewText(Richview, aValue);
end;


function TForm1.GetRichView(aName: string): TfrxRichView;
var
  x: TfrxComponent;
begin
  Result := nil;
  x := Report.FindObject(aName);
  if Assigned(x) then
  begin
    if x is TfrxRichView then
      Result := TfrxRichView(x);
  end;
end;

procedure TForm1.SetRichViewText(aRichView: TfrxRichView; aValue: string);
var
  List: TStringList;
  m   : TMemoryStream;
begin
  if not Assigned(aRichView) then
    exit;
  List := TStringList.Create;
  m    := TMemoryStream.Create;
  try
    List.Text := aValue; // Kann ein #$D#$A einfügen.
    List.SaveToStream(m);
    if (List.Text <> aValue) and (Copy(List.Text,  length(List.Text) -1, 2)=#$D#$A)  then
      m.Size := m.Size - Length(System.sLineBreak);
    m.Position := 0;
    aRichView.RichEdit.Lines.LoadFromStream(m);
  finally
    FreeAndNil(List);
    FreeAndNil(m);
  end;
end;

end.
