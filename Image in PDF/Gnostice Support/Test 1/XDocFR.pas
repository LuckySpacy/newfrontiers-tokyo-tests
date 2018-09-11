unit XDocFR;

interface

uses
  Windows, Messages, SysUtils, Variants,
  Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, frxClass,
  frxGradient, frxChBox, frxRich, frxOLE,
  frxBarcode, frxDBSet, DB, DBClient, gtCstDocEng, gtCstPlnEng, gtCstPDFEng,
  gtExPDFEng, gtPDFEng, gtClasses3, gtXportIntf, gtFRXportIntf, gtRTFEng,
  gtTIFFEng, gtPNGEng, gtSVGEng, gtWMFEng, gtMetafileEng, gtEMFEng, gtBMPEng,
  gtGIFEng, gtCstGfxEng, gtJPEGEng, gtSLKEng, gtDIFEng, gtLotusEng, gtQProEng,
  gtTXTEng, gtCstSpdEng, gtCstXLSEng, gtExXLSEng, gtXLSEng, gtXHTMLEng,
  gtCstHTMLEng, gtExHTMLEng, gtHTMLEng;

type
  TfrmFR = class(TForm)
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Button1: TButton;
    Button2: TButton;
    frxReport1: TfrxReport;
    gtFRExportInterface1: TgtFRExportInterface;
    gtPDFEngine1: TgtPDFEngine;
    gtRTFEngine1: TgtRTFEngine;
    gtRTFEngine2: TgtRTFEngine;
    gtHTMLEngine1: TgtHTMLEngine;
    gtXHTMLEngine1: TgtXHTMLEngine;
    gtExcelEngine1: TgtExcelEngine;
    gtTextEngine1: TgtTextEngine;
    gtQuattroProEngine1: TgtQuattroProEngine;
    gtLotusEngine1: TgtLotusEngine;
    gtDIFEngine1: TgtDIFEngine;
    gtSYLKEngine1: TgtSYLKEngine;
    gtJPEGEngine1: TgtJPEGEngine;
    gtGIFEngine1: TgtGIFEngine;
    gtBMPEngine1: TgtBMPEngine;
    gtEMFEngine1: TgtEMFEngine;
    gtDocSettings1: TgtDocSettings;
    gtWMFEngine1: TgtWMFEngine;
    gtSVGEngine1: TgtSVGEngine;
    gtPNGEngine1: TgtPNGEngine;
    gtTIFFEngine1: TgtTIFFEngine;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }

  end;

const
  SPDFDescription = 'Adobe PDF Files (*.pdf)|*.pdf|';
  SRTFDescription = 'Rich Text Format (*.rtf)|*.rtf|';
  SBMPDescription = 'Windows Bitmap (*.bmp)|*.bmp|';
  SJPEGDescription = 'JPEG File Interchange Format (*.jpg)|*.jpg|';
  SWMFDescription = 'Windows Metafiles (*.wmf)|*.wmf|';
  SEMFDescription = 'Enhanced Metafiles (*.emf)|*.emf|';
  SGIFDescription = 'Graphics Interchange Format (*.gif)|*.gif|';
  SHTMLDescription = 'HyperText Markup Language (*.htm)|*.htm|';
  SXHTMLDescription = 'Extended HyperText Markup Language (*.htm)|*.htm|';
  SExcelDescription = 'Microsoft Excel Workbook (*.xlsx)|*.xlsx|';
  SQuattroProDescription = 'Quattro Pro for Windows (*.wb1)|*.wb1|';
  SLotusDescription = 'Lotus 1-2-3 (*.wk2)|*.wk2|';
  SDIFDescription = 'Data Interchange Format (*.dif)|*.dif|';
  SSYLKDescription = 'Symbolic Link (*.slk)|*.slk|';
  STextDescription = 'Text Document (*.txt)|*.txt|';
  SSVGDescription = 'Scalable Vector Graphics (*.svg)|*.svg|';
  SPNGDescription = 'Portable Network Graphics (*.png)|*.png|';
  STIFFDescription = 'Tagged Image File Format (*.tif)|*.tif|';

var
  frmFR: TfrmFR;

implementation

{$R *.dfm}

procedure TfrmFR.Button1Click(Sender: TObject);
begin

  if not OpenDialog1.Execute then
    Exit;
  case OpenDialog1.FilterIndex of
    1:
      begin
        frxReport1.Clear;
        frxReport1.PreviewPages.LoadFromFile(OpenDialog1.FileName);
        gtFRExportInterface1.Engine := gtPDFEngine1;
        frxReport1.ShowPreparedReport;
      end;
    2:
      begin
        frxReport1.Clear;
        frxReport1.LoadFromFile(OpenDialog1.FileName);
        frxReport1.PrepareReport;
        gtFRExportInterface1.Engine := gtPDFEngine1;
        frxReport1.ShowPreparedReport;
      end;
  end;
end;

procedure TfrmFR.Button2Click(Sender: TObject);
begin
  SaveDialog1.Filter := SPDFDescription + SRTFDescription + SHTMLDescription +
    SXHTMLDescription + STextDescription + SExcelDescription + SDIFDescription +
    SQuattroProDescription + SLotusDescription + SSYLKDescription +
    SBMPDescription + SJPEGDescription + SEMFDescription + SWMFDescription +
    SGIFDescription + SSVGDescription + SPNGDescription + STIFFDescription;

  if not OpenDialog1.Execute then
    Exit;
  case OpenDialog1.FilterIndex of
    1:
      begin
        frxReport1.Clear;
        frxReport1.PreviewPages.LoadFromFile(OpenDialog1.FileName);
      end;
    2:
      begin
        frxReport1.Clear;
        frxReport1.LoadFromFile(OpenDialog1.FileName);
        frxReport1.PrepareReport;
      end;
  end;

  if not SaveDialog1.Execute then
    Exit;
  case SaveDialog1.FilterIndex of
    1:
      gtFRExportInterface1.Engine := gtPDFEngine1;
    2:
      gtFRExportInterface1.Engine := gtRTFEngine1;
    3:
      gtFRExportInterface1.Engine := gtHTMLEngine1;
    4:
      gtFRExportInterface1.Engine := gtXHTMLEngine1;
    5:
      gtFRExportInterface1.Engine := gtTextEngine1;
    6:
      gtFRExportInterface1.Engine := gtExcelEngine1;
    7:
      gtFRExportInterface1.Engine := gtDIFEngine1;
    8:
      gtFRExportInterface1.Engine := gtQuattroProEngine1;
    9:
      gtFRExportInterface1.Engine := gtLotusEngine1;
    10:
      gtFRExportInterface1.Engine := gtSYLKEngine1;
    11:
      gtFRExportInterface1.Engine := gtBMPEngine1;
    12:
      gtFRExportInterface1.Engine := gtJPEGEngine1;
    13:
      gtFRExportInterface1.Engine := gtEMFEngine1;
    14:
      gtFRExportInterface1.Engine := gtWMFEngine1;
    15:
      gtFRExportInterface1.Engine := gtGIFEngine1;
    16:
      gtFRExportInterface1.Engine := gtSVGEngine1;
    17:
      gtFRExportInterface1.Engine := gtPNGEngine1;
    18:
      gtFRExportInterface1.Engine := gtTIFFEngine1;

  end;
  gtFRExportInterface1.RenderDocument(frxReport1, True, False);

end;

end.
