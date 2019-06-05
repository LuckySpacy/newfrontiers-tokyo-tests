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
  private
    fRTF: TStringList;
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
  Report.PrepareReport;
  gtPDFEngine1.Preferences.OpenAfterCreate := true;
  gtPDFEngine1.Preferences.ShowSetupDialog := false;
  gtPDFEngine1.Preferences.EmbedTrueTypeFonts := etfNone;
  gtFRExportInterface1.Engine := gtPDFEngine1;
  IgtDocumentEngine(gtFRExportInterface1.Engine).FileName := 'PDF1.pdf';
  IgtDocumentEngine(gtFRExportInterface1.Engine).Preferences.ShowSetupDialog := false;
  gtFRExportInterface1.RenderDocument(Report, false, false);
  Path := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
end;

procedure TForm1.btn_PreviewClick(Sender: TObject);
begin
  Report.ShowReport;
end;




end.
