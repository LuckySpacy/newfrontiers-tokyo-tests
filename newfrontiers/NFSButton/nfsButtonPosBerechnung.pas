unit nfsButtonPosBerechnung;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Winapi.CommCtrl, Vcl.ImgList, vcl.Graphics,
  Vcl.StdCtrls, System.Types, Winapi.Messages, nfsPropPos, System.UITypes, Vcl.comStrs,
  Vcl.Consts, Vcl.ToolWin, Vcl.ListActns, Vcl.StdActns, Vcl.Forms, Contnrs;

type
  TFlaeche = class
  private
    fHoehe: Integer;
    fBreite: Integer;
  public
    property Hoehe: Integer read fHoehe write fHoehe;
    property Breite: Integer read fBreite write fBreite;
    constructor Create;
    destructor Destroy; Override;
    procedure Init;
  end;

type
  TnfsButtonPosBerechnung = class
  private
    fBMP: TFlaeche;
    fCaption: string;
    fGlyphIsDrawing: Boolean;
    fZeichenFlaeche: TFlaeche;
    fShowCaption: Boolean;
    fCanvas: TCanvas;
    fShowAccelChar: Boolean;
    fImageMargin: TMargins;
    fImageLeft: Boolean;
    fImageRight: Boolean;
  public
    BMPPos: TPoint;
    CaptionPos: TPoint;
    property ZeichenFlaeche: TFlaeche read fZeichenFlaeche write fZeichenFlaeche;
    property BMP: TFlaeche read fBMP write fBMP;
    property Caption: string read fCaption write fCaption;
    property GlyphIsDrawing: Boolean read fGlyphIsDrawing write fGlyphIsDrawing;
    property ShowCaption: Boolean read fShowCaption write fShowCaption;
    property Canvas: TCanvas read fCanvas write fCanvas;
    property ShowAccelChar: Boolean read fShowAccelChar write fShowAccelChar;
    property ImageMargin: TMargins read fImageMargin write fImageMargin;
    property ImageLeft: Boolean read fImageLeft write fImageLeft;
    property ImageRight: Boolean read fImageRight write fImageRight;
    procedure Berechne;
    constructor Create;
    destructor Destroy; Override;
  end;


implementation

{ TFlaeche }

constructor TFlaeche.Create;
begin
  Init;
end;

destructor TFlaeche.Destroy;
begin

  inherited;
end;


procedure TFlaeche.Init;
begin
  fHoehe  := 0;
  fBreite := 0;
end;

{ TnfsButtonPosBerechnung }


constructor TnfsButtonPosBerechnung.Create;
begin
  fCanvas := nil;
  fImageMargin := TMargins.Create(nil);
  fZeichenFlaeche := TFlaeche.Create;
  fBMP := TFlaeche.Create;
  fImageLeft := true;
  fImageRight := false;
end;

destructor TnfsButtonPosBerechnung.Destroy;
begin
  inherited;
  FreeAndNil(fImageMargin);
  FreeAndNil(fZeichenFlaeche);
  FreeAndNil(fBMP);
end;


procedure TnfsButtonPosBerechnung.Berechne;
var
  TextMass: TFlaeche;
  ZeichenflaecheMitte: TFlaeche;
  Ausgabe: TFlaeche;
  CaptionText: string;
  BmpMass: TFlaeche;
begin
  BMPPos.X := 0;
  BMPPos.Y := 0;
  CaptionPos.X := 0;
  CaptionPos.Y := 0;
  if fCanvas = nil then
    exit;

  TextMass := TFlaeche.Create;
  ZeichenflaecheMitte := TFlaeche.Create;
  Ausgabe := TFlaeche.Create;
  BmpMass := TFlaeche.Create;
  try

    CaptionText     := '';
    if (fShowCaption) and (Trim(fCaption) > '') then
    begin
      CaptionText := Trim(fCaption);
      if (fShowAccelChar) and (Length(CaptionText) > 1) and (CaptionText[1]='&') then
        CaptionText := Trim(copy(CaptionText, 2, Length(CaptionText)));
    end;

    if CaptionText > '' then
    begin
      TextMass.Hoehe  := canvas.TextHeight(CaptionText);
      TextMass.Breite := canvas.TextWidth(CaptionText);
    end;

    if (fGlyphIsDrawing) then
    begin
      BmpMass.Hoehe  := fbmp.Hoehe;
      BmpMass.Breite := fBmp.Breite;
    end;

    Ausgabe.Breite := BmpMass.Breite + fImageMargin.Right + TextMass.Breite;

    ZeichenflaecheMitte.Hoehe  := trunc(ZeichenFlaeche.Hoehe / 2);
    ZeichenflaecheMitte.Breite := trunc(ZeichenFlaeche.Breite / 2);

    BMPPos.X := ZeichenflaecheMitte.Breite - trunc(Ausgabe.Breite / 2);
    BMPPos.Y := ZeichenflaecheMitte.Hoehe - trunc(BMPMass.Hoehe / 2);

    CaptionPos.X := BMPPos.X + BmpMass.Breite + fImageMargin.Right;
    CaptionPos.Y := ZeichenflaecheMitte.Hoehe - trunc((TextMass.Hoehe / 2)+0.5);

    if fImageRight then
    begin
      CaptionPos.X := ZeichenflaecheMitte.Breite - trunc(Ausgabe.Breite / 2);
      BMPPos.X     := CaptionPos.X + TextMass.Breite + fImageMargin.Left;
    end;


  finally
    FreeAndNil(TextMass);
    FreeAndNil(ZeichenflaecheMitte);
    FreeAndNil(BmpMass);
    FreeAndNil(Ausgabe);
  end;

end;



end.
