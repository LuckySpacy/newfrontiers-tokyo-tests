unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, gtClasses3, gtCstDocEng, gtCstPlnEng,
  gtCstPDFEng, gtExPDFEng, gtPDFEng, vcl.imaging.jpeg, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    gtPDFEngine1: TgtPDFEngine;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    procedure SchreibePDF;
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  SchreibePDF;
end;

procedure TForm1.SchreibePDF;
var
  JpegImage1: TJPEGImage;
begin
  JpegImage1 := TJPEGImage.Create;
  JpegImage1.LoadFromFile('KN-Top.jpg');


  with gtPDFEngine1 do
  begin
    InputXres := 300;
    InputYres := 300;
    Preferences.ShowSetupDialog := true;
    Preferences.OpenAfterCreate := true;
    Preferences.ProcessAfterEachPage := true;

    FileName := 'Mytest.pdf';
    BeginDoc;
    ImageSettings.SourceDPI := 300;
    ImageSettings.JPEGQuality := 100;
    ImageSettings.Stretch := True;
    DrawImage(0, 0, JpegImage1);
    EndDoc;
  end;
  JpegImage1.Free;
end;



end.
