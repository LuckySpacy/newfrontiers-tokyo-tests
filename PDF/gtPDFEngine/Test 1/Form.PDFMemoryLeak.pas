unit Form.PDFMemoryLeak;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, frxClass, frxRich,
  gtClasses3, gtCstDocEng, gtCstPlnEng, gtCstPDFEng, gtExPDFEng, gtPDFEng, gtFrxportIntf;

type
  Tfrm_PDFMemoryLeak = class(TForm)
    frxRichObject1: TfrxRichObject;
    frxReport1: TfrxReport;
    btn_Print: TButton;
    btn_PDF: TButton;
    Button1: TButton;
    procedure btn_PrintClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_PDFClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FPath: string;
    FFullFileName: string;
    procedure ExportPDF(aPDFName: string; aOpenAfterCreate: Boolean);
  public
  end;

var
  frm_PDFMemoryLeak: Tfrm_PDFMemoryLeak;

implementation

{$R *.dfm}



procedure Tfrm_PDFMemoryLeak.FormCreate(Sender: TObject);
begin
  FPath := IncludeTrailingPathDelimiter(ExtractFileDir(ParamStr(0)));
  FFullFileName := FPath + 'Test.fr3';
end;


procedure Tfrm_PDFMemoryLeak.btn_PDFClick(Sender: TObject);
begin
  ExportPDF('Test.PDF', true);
end;

procedure Tfrm_PDFMemoryLeak.btn_PrintClick(Sender: TObject);
begin
  frxReport1.LoadFromFile(FFullFileName);
  frxReport1.ShowReport;
end;




procedure Tfrm_PDFMemoryLeak.ExportPDF(aPDFName: string; aOpenAfterCreate: Boolean);
var
  PDFEngine      : TgtPDFEngine;
  ExportInterface: TgtFRExportInterface;
begin
  PDFEngine := TgtPDFEngine.Create(nil);
  ExportInterface := TgtFRExportInterface.Create(nil);
  try
    PDFEngine.Preferences.EmbedTrueTypeFonts := etfSubset;
    PDFEngine.Preferences.OpenAfterCreate := aOpenAfterCreate;
    PDFEngine.Preferences.ShowSetupDialog := false;
    ExportInterface.Engine := PDFEngine;
    IgtDocumentEngine(ExportInterface.Engine).FileName := FPath + aPDFName;
    IgtDocumentEngine(ExportInterface.Engine).Preferences.ShowSetupDialog := false;
    ExportInterface.ShowSaveDialog := false;
    frxReport1.LoadFromFile(FFullFileName);
    ExportInterface.RenderDocument(frxReport1, false, false);
  finally
    FreeAndNil(PDFEngine);
    FreeAndNil(ExportInterface);
  end;
end;


procedure Tfrm_PDFMemoryLeak.Button1Click(Sender: TObject);
var
  i1: Integer;
begin
  for i1 := 0 to 1000 do
  begin
    caption := IntToStr(i1);
    Application.ProcessMessages;
    ExportPDF('Test' + FormatDateTime('yyyymmddhhnnsszzz', now) + '.pdf' , false);
  end;
  ShowMessage('Ready');
end;




end.
