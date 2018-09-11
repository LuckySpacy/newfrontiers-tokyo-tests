unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, gtClasses3, gtCstDocEng, gtCstPlnEng,
  gtCstPDFEng, gtExPDFEng, gtPDFEng, gtXportIntf, gtFRXportIntf, frxClass,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    gtPDFEngine1: TgtPDFEngine;
    gtFRExportInterface1: TgtFRExportInterface;
    Report: TfrxReport;
    Button1: TButton;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    function GeneratePDF(aFilename: string; aOpenAfterCreate: Boolean): Integer;
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}




procedure TForm1.Button1Click(Sender: TObject);
begin
  GeneratePDF('g:\OPTIMA\Fastreport\Nieder\test1.pdf', true);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Report.PrepareReport;
  Report.ShowReport;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  report.LoadFromFile('g:\OPTIMA\Fastreport\Nieder\Bild2.fr3');
end;

function TForm1.GeneratePDF(aFilename: string;
  aOpenAfterCreate: Boolean): Integer;
var
  PDFEngine      : TgtPDFEngine;
  ExportInterface: TgtFRExportInterface;
  i1: Integer;
begin
  Result := 0;
  PDFEngine := TgtPDFEngine.Create(nil);
  ExportInterface := TgtFRExportInterface.Create(nil);
  try
    PDFEngine.MeasurementUnit := muPixels;
    PDFEngine.Preferences.OpenAfterCreate := aOpenAfterCreate;
    PDFEngine.Preferences.ShowSetupDialog := false;
    ExportInterface.Engine := PDFEngine;
    PDFEngine.Preferences.EmbedTrueTypeFonts := etfNone;
    IgtDocumentEngine(ExportInterface.Engine).FileName := aFilename;
    IgtDocumentEngine(ExportInterface.Engine).Preferences.ShowSetupDialog := false;
    ExportInterface.ShowSaveDialog := false;
    ExportInterface.RenderDocument(Report, false, false);
  finally
    FreeAndNil(PDFEngine);
    FreeAndNil(ExportInterface);
  end;
end;

end.
