unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ppPrnabl, ppClass,
  ppCtrls, ppBands, ppCache, ppDesignLayer, ppParameter, ppComm, ppRelatv,
  ppProd, ppReport, Vcl.Imaging.jpeg, Vcl.Imaging.pngimage;

type
  TForm1 = class(TForm)
    ppReport1: TppReport;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    Button1: TButton;
    ppImage1: TppImage;
    procedure Button1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  ppTypes;

procedure TForm1.Button1Click(Sender: TObject);
begin
  ppReport1.AllowPrintToFile := true;
  ppReport1.ShowPrintDialog  := true;
  ppReport1.PDFSettings.OpenPDFFile := true;
  ppReport1.DeviceType := dtPrinter;
  ppReport1.Print;
end;

end.
