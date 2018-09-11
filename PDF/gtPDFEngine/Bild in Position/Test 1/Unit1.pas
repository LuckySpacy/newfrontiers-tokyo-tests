unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, frxClass, frxRich,
  gtXportIntf, gtFRXportIntf, gtClasses3, gtCstDocEng, gtCstPlnEng, gtCstPDFEng,
  gtExPDFEng, gtPDFEng;

type
  TForm1 = class(TForm)
    Report: TfrxReport;
    btn_Preview: TButton;
    frxRichObject1: TfrxRichObject;
    btn_PDF: TButton;
    gtPDFEngine1: TgtPDFEngine;
    gtFRExportInterface1: TgtFRExportInterface;
    procedure btn_PreviewClick(Sender: TObject);
    procedure btn_PDFClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn_PDFClick(Sender: TObject);
begin
  Report.LoadFromFile('Test1.fr3');
  Report.PrepareReport;
  gtPDFEngine1.Preferences.OpenAfterCreate := true;
  gtPDFEngine1.Preferences.ShowSetupDialog := false;
  gtFRExportInterface1.Engine := gtPDFEngine1;
  gtPDFEngine1.Preferences.EmbedTrueTypeFonts := etfNone;
  IgtDocumentEngine(gtFRExportInterface1.Engine).FileName := 'PDF1.pdf';
  IgtDocumentEngine(gtFRExportInterface1.Engine).Preferences.ShowSetupDialog := false;
  gtFRExportInterface1.RenderDocument(Report, false, false);
end;

procedure TForm1.btn_PreviewClick(Sender: TObject);
begin
  Report.LoadFromFile('Test1.fr3');
  Report.ShowReport;
end;

end.
