unit NFSEditBtnProp;

interface

uses
  Classes, SysUtils, Contnrs, Controls, StdCtrls, ExtCtrls, Graphics, nfsButton,
  Vcl.ImgList;

type
  TnfsEditBtnProp = class(TPersistent)
  private
    fOnChanged: TNotifyEvent;
    fButton: TnfsButton;
    //fFont: TFont;
    fEnabled: Boolean;
    fImages: TCustomImageList;
    FImageIndex: Integer;
    fFlat: Boolean;
    fCaption: string;
    fVisible: Boolean;
    fOnResize: TNotifyEvent;
    procedure SetImages(const Value: TCustomImageList);
    procedure SetImageIndex(const Value: Integer);
    procedure setFlat(const Value: Boolean);
    procedure setCaption(const Value: string);
    procedure setEnabled(const Value: Boolean);
    procedure setVisible(const Value: Boolean);
  protected
  public
    constructor Create;
    destructor Destroy; override;
    property Button: TNfsButton read fButton write fButton;
  published
    property Images: TCustomImageList read fImages write SetImages;
    property ImageIndex: Integer read FImageIndex write SetImageIndex default -1;
    property OnChanged: TNotifyEvent read fOnChanged write fOnChanged;
    property Flat: Boolean read fFlat write setFlat default true;
    property Caption: string read fCaption write setCaption;
    property Visible: Boolean read fVisible write setVisible default true;
    property Enabled: Boolean read fEnabled write setEnabled default true;
    property OnResize: TNotifyEvent read fOnResize write fOnResize;
  end;


implementation

{ TnfsEditBtnProp }

constructor TnfsEditBtnProp.Create;
begin
  FImageIndex := -1;
  fVisible := true;
  fEnabled := true;
  fFlat := true;
end;

destructor TnfsEditBtnProp.Destroy;
begin

  inherited;
end;

procedure TnfsEditBtnProp.setCaption(const Value: string);
begin
  fCaption := Value;
  fButton.Caption1 := Value;
end;

procedure TnfsEditBtnProp.setEnabled(const Value: Boolean);
begin
  fEnabled := Value;
  fButton.Enabled := Value;
  fButton.Invalidate;
end;

procedure TnfsEditBtnProp.setFlat(const Value: Boolean);
begin
  fFlat := Value;
  fButton.Flat := Value;
end;

procedure TnfsEditBtnProp.SetImageIndex(const Value: Integer);
begin
  FImageIndex := Value;
  fButton.ImageIndex := Value;
  fButton.ImagePos.Left := 1;
end;

procedure TnfsEditBtnProp.SetImages(const Value: TCustomImageList);
begin
  fImages := Value;
  fButton.Images := fImages;
  if fButton.Images.Height * 2 = fImages.Width then
    fButton.NumGlyphs := 2
  else
    fButton.NumGlyphs := 1;
end;

procedure TnfsEditBtnProp.setVisible(const Value: Boolean);
begin
  fVisible := Value;
  fButton.Visible := fVisible;
  if Assigned(fOnResize) then
    fOnResize(Self);
end;

end.
