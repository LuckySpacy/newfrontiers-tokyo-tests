unit nfsPropNotification;

interface

uses
  Classes, SysUtils, Contnrs, Controls, StdCtrls, ExtCtrls, Graphics, nfsPropPos,
  Winapi.Windows;


 {
type
  TCircleMargin = class
    X: Integer;
    Y: Integer;
  end;
  }

type
  TKreis = class
    A: TPoint;
    B: TPoint;
  end;

type
  RMass=Record
    Height: Integer;
    Width : Integer;
  End;

type
  TnfsPropNotification = class(TPersistent)
  private
    fOnChanged: TNotifyEvent;
    fWidth: Integer;
    fHeight: Integer;
    fPosX: Integer;
    fPosY: Integer;
    fCanvas: TCanvas;
    fCircleAlignment: TImageAlignment;
    fCirclePos: TnfsPropPos;
    fCaption: string;
    fCircleFrameColor: TColor;
    fCircleColor: TColor;
    fFont: TFont;
    fKreis: TKreis;
    fTextPos: TPoint;
    fTextMass: RMass;
    fKreisMass: RMass;
    fCircleColorTransparent: Boolean;
    fCircleMarginX: Integer;
    fCircleMarginY: Integer;
    procedure setHeight(const Value: Integer);
    procedure setWidth(const Value: Integer);
    procedure setPosX(const Value: Integer);
    procedure setPosY(const Value: Integer);
    procedure SetCircleAlignment(const Value: TImageAlignment);
    procedure PropPosChanged(Sender: TObject);
    procedure setCaption(const Value: string);
    procedure setCircleColor(const Value: TColor);
    procedure setCircleFrameColor(const Value: TColor);
    procedure setFont(const Value: TFont);
    procedure BerechneKreis;
    procedure BerechneZifferKoord;
    procedure setCircleColorTransparent(const Value: Boolean);
    procedure setCircleMarginX(const Value: Integer);
    procedure setCircleMarginY(const Value: Integer);
  protected
  public
    constructor Create;
    destructor Destroy; override;
    property Width: Integer read fWidth write setWidth;
    property Height: Integer read fHeight write setHeight;
    property PosX: Integer read fPosX write setPosX;
    property PosY: Integer read fPosY write setPosY;
    property Canvas: TCanvas read fCanvas write fCanvas;
    property TextPos: TPoint read fTextPos;
    property KreisPos: TKreis read fKreis;
  published
    property OnChanged: TNotifyEvent read fOnChanged write fOnChanged;
    property CircleAlignment: TImageAlignment read fCircleAlignment write SetCircleAlignment default iaLeft;
    property CirclePos: TnfsPropPos read fCirclePos write fCirclePos;
    property CircleMarginX: Integer read fCircleMarginX write setCircleMarginX;
    property CircleMarginY: Integer read fCircleMarginY write setCircleMarginY;
    property CircleColor: TColor read fCircleColor write setCircleColor default clRed;
    property CircleColorTransparent: Boolean read fCircleColorTransparent write setCircleColorTransparent default false;
    property CircleFrameColor: TColor read fCircleFrameColor write setCircleFrameColor default clWhite;
    property Caption: string read fCaption write setCaption;
    property Font: TFont read fFont write setFont;
  end;

implementation

{ TnfsPropNotification }


constructor TnfsPropNotification.Create;
begin
  fCanvas := nil;
  fKreis := TKreis.Create;
  fFont := TFont.Create;
  fFont.Size := 7;
  fFont.Color := clWhite;
  fCircleMarginX := 3;
  fCircleMarginY := 3;
  fCircleColor := clRed;
  fCircleFrameColor := clWhite;
  fCirclePos := TnfsPropPos.Create;
  fCirclePos.OnChanged := PropPosChanged;
  fCircleColorTransparent := false;
end;

destructor TnfsPropNotification.Destroy;
begin
  FreeAndNil(fCirclePos);
  FreeAndNil(fFont);
  FreeAndNil(fKreis);
  inherited;
end;

procedure TnfsPropNotification.PropPosChanged(Sender: TObject);
begin
  BerechneKreis;
end;

procedure TnfsPropNotification.setCaption(const Value: string);
begin
  fCaption := Value;
  BerechneKreis;
end;

procedure TnfsPropNotification.SetCircleAlignment(const Value: TImageAlignment);
begin
  fCircleAlignment := Value;
  BerechneKreis;
end;

procedure TnfsPropNotification.setCircleColor(const Value: TColor);
begin
  fCircleColor := Value;
  BerechneKreis;
end;

procedure TnfsPropNotification.setCircleColorTransparent(const Value: Boolean);
begin
  fCircleColorTransparent := Value;
  BerechneKreis;
end;

procedure TnfsPropNotification.setCircleFrameColor(const Value: TColor);
begin
  fCircleFrameColor := Value;
  BerechneKreis;
end;

procedure TnfsPropNotification.setCircleMarginX(const Value: Integer);
begin
  fCircleMarginX := Value;
  BerechneKreis;
end;

procedure TnfsPropNotification.setCircleMarginY(const Value: Integer);
begin
  fCircleMarginY := Value;
  BerechneKreis;
end;

procedure TnfsPropNotification.setFont(const Value: TFont);
begin
  fFont.Assign(Value);
  BerechneKreis;
end;

procedure TnfsPropNotification.setHeight(const Value: Integer);
begin
  fHeight := Value;
  BerechneKreis;
end;


procedure TnfsPropNotification.setPosX(const Value: Integer);
begin
  fPosX := Value;
end;

procedure TnfsPropNotification.setPosY(const Value: Integer);
begin
  fPosY := Value;
end;

procedure TnfsPropNotification.setWidth(const Value: Integer);
begin
  fWidth := Value;
  BerechneKreis;
end;


procedure TnfsPropNotification.BerechneKreis;
var
  TextPosMitte: TPoint;
  KreisPos1: TPoint;
  KreisPos2: TPoint;
  KreisHalbe: Integer;
  WidthHalbe: Integer;
begin
  if fCanvas = nil then
    exit;
  fcanvas.Font.Assign(fFont);
  fTextMass.Height := fCanvas.TextHeight(fCaption);
  fTextMass.Width  := fCanvas.TextWidth(fCaption);

  TextPosMitte.Y := trunc(fTextMass.Height/2) + 1;
  TextPosMitte.X := trunc(fTextMass.Width/2);



  if fCircleAlignment = iaLeft then
  begin
    fPosX := fCirclePos.Left;
    fPosY := 0;
  end;

  KreisPos2.X := fTextMass.Width + (fCircleMarginX * 2);
  KreisPos2.Y := fTextMass.Height + (fCircleMarginY * 2);

  if KreisPos2.Y > KreisPos2.X then
    KreisPos2.X := KreisPos2.Y;

  fKreisMass.Width  := KreisPos2.X;
  fKreisMass.Height := KreisPos2.Y;

  if fCircleAlignment = iaRight then
  begin
    fPosX := fWidth - fKreisMass.Width;
    fPosX := fPosX - fCirclePos.Right;
    fPosY := fCirclePos.Top;
  end;

  if fCircleAlignment = iaCenter then
  begin
    KreisHalbe := trunc(fKreisMass.Width / 2);
    WidthHalbe := trunc(fWidth/2);
    fPosX := WidthHalbe - KreisHalbe;
    KreisHalbe := trunc(fKreisMass.Height / 2);
    WidthHalbe := trunc(fHeight/2);
    fPosY := WidthHalbe - KreisHalbe;
    if fCirclePos.Top > 0 then
      fPosY := fCirclePos.Top;
    if fCirclePos.Left > 0 then
      fPosX := fCirclePos.Left;
  end;


  KreisPos1.X := fPosX;
  KreisPos1.Y := fPosY;


  fKreis.A.X := KreisPos1.X;
  fKreis.A.Y := KreisPos1.Y;
  fKreis.B.X := fKreis.A.X + fKreisMass.Width;
  fKreis.B.Y := fKreis.A.Y + fKreisMass.Height;

  BerechneZifferKoord;

  if Assigned(fOnChanged) then
    fOnChanged(Self);


end;

procedure TnfsPropNotification.BerechneZifferKoord;
var
  KreisHalbe: TPoint;
  TextHalbe: TPoint;
begin
  KreisHalbe.X := (trunc(fKreisMass.Width / 2));
  KreisHalbe.Y := (trunc(fKreisMass.Height / 2));
  TextHalbe.X := trunc(fTextMass.Width / 2);
  TextHalbe.Y := trunc(fTextMass.Height / 2);
  fTextPos.X := KreisHalbe.X - TextHalbe.X + fPosX;
  fTextPos.Y := KreisHalbe.Y - TextHalbe.Y + fPosY;
end;


end.
