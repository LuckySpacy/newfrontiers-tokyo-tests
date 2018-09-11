unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, gtCstDocEng, gtCstPlnEng,
  gtCstPDFEng, gtExPDFEng, gtPDFEng, gtClasses3, Vcl.Samples.Gauges,
  Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    ListBox1: TListBox;
    Panel2: TPanel;
    RadioGroup1: TRadioGroup;
    Button1: TButton;
    CheckBox1: TCheckBox;
    Button2: TButton;
    Button3: TButton;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    gtPDFEngine1: TgtPDFEngine;
    Image1: TImage;
    ProgressBar1: TProgressBar;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button2Click(Sender: TObject);
var
  LI: Integer;
begin
  if (not OpenDialog1.Execute) then Exit;
  if (OpenDialog1.Files.Count = 0) then Exit;
  ListBox1.Items.AddStrings(OpenDialog1.Files);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  ListBox1.DeleteSelected;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  LI: Integer;
  LFileExtension: string;
begin
  // Abbruch, wenn kein Bild vorhanden ist oder keine Ausgabedatei gewählt wurde
  if (ListBox1.Count = 0) then Exit;
  if (not SaveDialog1.Execute) then Exit;

  // Fortschrittsbalken initialisieren
  ProgressBar1.Visible := True;
  ProgressBar1.Max := ListBox1.Count;

  with gtPDFEngine1 do
    begin
      // Jede Seite einzeln erstellen und speichern (siehe Artikel)
      Preferences.ProcessAfterEachPage := True;

      Preferences.OpenAfterCreate := False;
      Preferences.ShowSetupDialog := False;
      MeasurementUnit := muPixels;
    end;

  if (RadioGroup1.ItemIndex = 0) then
    begin
      with gtPDFEngine1 do
        begin
          FileName := SaveDialog1.FileName;

          for LI := 0 to (ListBox1.Count - 1) do
          begin
            Image1.Picture.LoadFromFile(ListBox1.Items[LI]);

            ImageSettings.SourceDPI := 300;
            InputXRes := 300;
            InputYRes := 300;
            ImageSettings.Stretch := true;

            // Seitengröße an Bildgröße anpassen
            {
            Page.PaperSize := Custom;
            Page.Width := Image1.Picture.Width;
            Page.Height := Image1.Picture.Height;
            }
            // Beim ersten Bild das Dokument beginnen, ansonsten eine neue Seite erzeugen
            if (LI <> 0) then
              NewPage
            else
              BeginDoc;

            // Metafiles bei entsprechender Einstellung als Vektorgrafiken rendern
            LFileExtension := ExtractFileExt(ListBox1.Items[LI]);
            if (((CompareText(LFileExtension, '.wmf') = 0) or
              (CompareText(LFileExtension, '.emf') = 0)) and (not CheckBox1.Checked)) then
              PlayMetafile(Image1.Picture.Metafile)
            else
              DrawImage(0, 0, Image1.Picture.Graphic);

            ProgressBar1.StepIt();
          end;

        EndDoc;
      end;
    end
  else
    begin
      for LI := 0 to (ListBox1.Count - 1) do
        with gtPDFEngine1 do
          begin
            FileName := SaveDialog1.FileName + '_' + ExtractFileName(ListBox1.Items[LI]);
            Image1.Picture.LoadFromFile(ListBox1.Items[LI]);

            // Seitengröße an Bildgröße anpassen
            Page.PaperSize := Custom;
            Page.Width := Image1.Picture.Width;
            Page.Height := Image1.Picture.Height;

            BeginDoc;

            // Metafiles bei entsprechender Einstellung als Vektorgrafiken rendern
            LFileExtension := ExtractFileExt(ListBox1.Items[LI]);
            if (((CompareText(LFileExtension, '.wmf') = 0) or
              (CompareText(LFileExtension, '.emf') = 0)) and (not CheckBox1.Checked)) then
              PlayMetafile(Image1.Picture.Metafile)
            else
              DrawImage(0, 0, Image1.Picture.Graphic);

            EndDoc;

            ProgressBar1.StepIt();
          end;
    end;

  ProgressBar1.Visible := False;
end;

end.
