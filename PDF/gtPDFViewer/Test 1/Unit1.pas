unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, gtScrollingPanel, gtPDFViewer,
  gtPDFClasses, gtCstPDFDoc, gtExPDFDoc, gtExProPDFDoc, gtPDFDoc, Vcl.StdCtrls,
  Vcl.ExtCtrls, gtPDFPrinter;

type
  TForm1 = class(TForm)
    pdf: TgtPDFViewer;
    PDFDoc: TgtPDFDocument;
    Panel1: TPanel;
    Button1: TButton;
    PDFPrinterx: TgtPDFPrinter;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    procedure Drucken(aPDF, aDrucker: string);
    procedure Drucken2(aPDF, aDrucker, aSchacht: string);
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  //pdf.PrintDoc(true);
  Drucken2('g:\OPTIMA\Versandetiketten\Manifest\Manifest_2018-10-30.pdf', 'PDF24 PDF', '');
end;


procedure TForm1.FormCreate(Sender: TObject);
begin  //

end;

procedure TForm1.FormDestroy(Sender: TObject);
begin  //

end;

procedure TForm1.FormShow(Sender: TObject);
begin
  //PDFDoc.LoadFromFile('g:\OPTIMA\Versandetiketten\Manifest\Manifest_2018-10-30.pdf');
  //PDF.PDFDocument := PDFDoc;
  //PDF.Active := true;
end;


procedure TForm1.Drucken(aPDF, aDrucker: string);
var
  Viewer: TgtPDFViewer;
  PdfDocument: TgtPDFDocument;
begin
  PDFDocument := TgtPDFDocument.Create(Self);
  Viewer := TgtPDFViewer.Create(Self);
  try
    PDFDocument.LoadFromFile(aPDF);
    Viewer.PDFDocument := PDFDocument;
    //Viewer.Active := true;
    Viewer.PrintDoc(true);
  finally
    FreeAndNil(PDFDocument);
    FreeAndNil(Viewer);
  end;
end;


procedure TForm1.Drucken2(aPDF, aDrucker, aSchacht: string);
var
  PDFPrinter: TgtPDFPrinter;
  PdfDocument: TgtPDFDocument;
  i1: Integer;
  PrinterIndex: Integer;
begin
  PDFPrinter := TgtPDFPrinter.Create(nil);
  PDFDocument := TgtPDFDocument.Create(Self);
  try
    PDFDocument.LoadFromFile(aPDF);
    PDFPrinter.PDFDocument := PDFDocument;
    PDFPrinter.ShowSetupDialog := false;
    PrinterIndex := -1;
    memo1.Clear;
    for i1 := 0 to PDFPrinter.GetInstalledPrinters.Count -1 do
    begin
      Memo1.Lines.Add(PDFPrinter.GetInstalledPrinters.Strings[i1]);
      if SameText(aDrucker, PDFPrinter.GetInstalledPrinters.Strings[i1]) then
      begin
        PrinterIndex := i1;
        break;
      end;
    end;
    {
    if PDFPrinter.SelectPrinterByIndex(PrinterIndex) then
    begin
      PDFPrinter.AdvancedPrinterSettings.BinName := aSchacht;
      PDFPrinter.PrintDoc;
    end;
    }

    if PDFPrinter.SelectPrinterByName(aDrucker) then
    begin
      PDFPrinter.AdvancedPrinterSettings.BinName := aSchacht;
      PDFPrinter.PrintDoc;
    end;

  finally
    FreeAndNil(PDFPrinter);
    FreeAndNil(PDFDocument);
  end;
end;

end.
