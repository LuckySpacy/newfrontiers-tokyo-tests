unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, gtXportIntf, gtFRXportIntf, gtClasses3,
  gtCstDocEng, gtCstPlnEng, gtCstPDFEng, gtExPDFEng, gtPDFEng, frxClass,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Report: TfrxReport;
    Button1: TButton;
    Button2: TButton;
    gtPDFEngine1: TgtPDFEngine;
    gtFRExportInterface1: TgtFRExportInterface;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    procedure GeneratePDF;
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  GeneratePDF;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Report.LoadFromFile('Test1.fr3');
  Report.ShowReport;
end;

procedure TForm1.GeneratePDF;
begin
  Report.LoadFromFile('Test1.fr3');
  Report.PrepareReport;
  gtPDFEngine1.Preferences.OpenAfterCreate := true;
  gtPDFEngine1.Preferences.ShowSetupDialog := false;
  {
  gtPDFEngine1.ImageSettings.SourceDPI := 300;
  gtPDFEngine1.InputXRes := 300;
  gtPDFEngine1.InputYRes := 300;
  gtPDFEngine1.ImageSettings.Stretch := true;
  }
  gtFRExportInterface1.Engine := gtPDFEngine1;
  gtPDFEngine1.Preferences.EmbedTrueTypeFonts := etfNone;
  IgtDocumentEngine(gtFRExportInterface1.Engine).FileName := 'PDF1.pdf';
  IgtDocumentEngine(gtFRExportInterface1.Engine).Preferences.ShowSetupDialog := false;
  gtFRExportInterface1.RenderDocument(Report, false, false);
end;

end.
