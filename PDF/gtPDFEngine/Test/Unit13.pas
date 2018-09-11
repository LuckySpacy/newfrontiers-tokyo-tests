unit Unit13;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, frxClass, gtClasses3,
  gtCstDocEng, gtCstPlnEng, gtCstPDFEng, gtExPDFEng, gtPDFEng, gtFrxportIntf,
  frxRich;

type
  TForm13 = class(TForm)
    frxReport1: TfrxReport;
    btn_Print: TButton;
    btn_PDF: TButton;
    frxRichObject1: TfrxRichObject;
    procedure btn_PrintClick(Sender: TObject);
    procedure btn_PDFClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FPath: string;
    FFullFileName: string;
  public
  end;

var
  Form13: TForm13;

implementation

{$R *.dfm}


procedure TForm13.FormCreate(Sender: TObject);
begin
  FPath := IncludeTrailingPathDelimiter(ExtractFileDir(ParamStr(0)));
  FFullFileName := FPath + 'FrameTest.fr3';
end;


procedure TForm13.btn_PrintClick(Sender: TObject);
begin
  frxReport1.LoadFromFile(FFullFileName);
  frxReport1.ShowReport;
end;


procedure TForm13.btn_PDFClick(Sender: TObject);
var
  PDFEngine      : TgtPDFEngine;
  ExportInterface: TgtFRExportInterface;
  i1: Integer;
begin
  PDFEngine := TgtPDFEngine.Create(nil);
  ExportInterface := TgtFRExportInterface.Create(nil);
  try
    PDFEngine.Preferences.EmbedTrueTypeFonts := etfSubset;
    PDFEngine.Preferences.OpenAfterCreate := true;
    PDFEngine.Preferences.ShowSetupDialog := false;
    ExportInterface.Engine := PDFEngine;
    IgtDocumentEngine(ExportInterface.Engine).FileName := FPath + 'FrameTest.pdf';
    IgtDocumentEngine(ExportInterface.Engine).Preferences.ShowSetupDialog := false;
    ExportInterface.ShowSaveDialog := false;
    frxReport1.LoadFromFile(FFullFileName);
    ExportInterface.RenderDocument(frxReport1, false, false);
  finally
    FreeAndNil(PDFEngine);
    FreeAndNil(ExportInterface);
  end;
end;


end.
