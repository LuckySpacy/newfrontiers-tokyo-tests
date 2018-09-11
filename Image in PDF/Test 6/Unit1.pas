unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, gtXportIntf, gtFRXportIntf, gtClasses3,
  gtCstDocEng, gtCstPlnEng, gtCstPDFEng, gtExPDFEng, gtPDFEng, frxClass,
  Vcl.StdCtrls, frxExportPDF, unit2;

type
  TForm1 = class(TForm)
    Report: TfrxReport;
    Button1: TButton;
    Button2: TButton;
    gtPDFEngine1: TgtPDFEngine;
    gtFRExportInterface1: TgtFRExportInterface;
    Button3: TButton;
    frxPDFExport1: TfrxPDFExport;
    frxPDFExport2: TfrxPDFExport;
    Button4: TButton;
    Button5: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
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

procedure TForm1.Button3Click(Sender: TObject);
begin
  Report.Report.LoadFromFile('C:\Users\tbachmann\Desktop\ASS-Vorgang.fp3')
//  Report.LoadFromFile('C:\Users\tbachmann\Desktop\ASS-Vorgang.fp3');
//  Report.PrepareReport;
  frxPDFExport1.FileName := 'd:\Delphi\Tokyo\Test\Image in PDF\Test 6\FRPDF2.pdf';
  //frxPDFExport1.EmbeddedFonts := true;
  //frxPDFExport1.Transparency := true;
  //frxPDFExport1.Compressed := false;
  frxPDfExport1.ShowDialog := false;
  Report.Export(frxPDFExport1);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Form2.ShowModal;
end;


procedure TForm1.GeneratePDF;
begin
  Report.LoadFromFile('Test1.fr3');
  Report.PrepareReport;
  Report.SaveToFile('x.txt');
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


procedure TForm1.Button5Click(Sender: TObject);
var
  List: TStringList;
  i: integer;
  s: string;
  s1: string;
  b: Integer;
  s2: string;
  f: File of byte;
begin
  AssignFile(f, 'd:\Delphi\Tokyo\Test\Image in PDF\Test 6\image.jpg');
  Rewrite(f);
  s2 := '';
  memo1.Clear;
  List := TStringList.Create;
  List.LoadFromFile('d:\Delphi\Tokyo\Test\Image in PDF\Test 6\Image.hex');
  s := List.Text;
  while s > '' do
  begin
    s1 := '$' + copy(s, 1, 2);
    delete(s, 1, 2);
    try
      b := StrToInt(s1);
    except
      on E: Exception do
      begin
        ShowMessage(s1);
      end;
    end;
    s2 := s2 + char(b);
    Write(f, b);
   // memo1.Lines.Add('Hex: ' + s1 + ' Byte: ' + IntToStr(b));
  end;
  List.Free;
  CloseFile(f);
  showMessage('Fertig');
end;


end.
