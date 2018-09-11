unit Ueberschriftenpanel_norm;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, ExtCtrls, StdCtrls, Graphics;

type
  TUeberschriftenpanel = class(TPanel)
  private
    { Private-Deklarationen }
    FImageList    : TImageList;
    FIndex        : integer;
    FText         : string;
    FHeight       : integer;

    Icon         : TImage;
    Ueberschrift : TLabel;
    Strich       : TPanel;

    procedure PanelErzeugen;
    procedure aktualIcon;
    procedure setIconIndex(const Value: integer);
    procedure setText(const Value: string);
    procedure setImageList(const Value: TImageList);
    procedure setHeight(const Value: integer);
  protected
    { Protected-Deklarationen }
    procedure Loaded; override;
  public
    { Public-Deklarationen }
    constructor Create(aOwner: TComponent); override;
    destructor  Destroy; override;
  published
    { Published-Deklarationen }
    property NF_ImgList: TImageList read FImageList write setImageList;
    property NF_Index  : integer read FIndex write setIconIndex;
    property NF_Text   : string read FText write setText;
    property NF_Height : integer read FHeight write setHeight;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('new frontiers', [TUeberschriftenpanel]);
end;

{ TUeberschriftenpanel }

constructor TUeberschriftenpanel.Create(aOwner: TComponent);
begin
     inherited;
     PanelErzeugen;
end;

procedure TUeberschriftenpanel.aktualIcon;
begin
     if FImageList = nil then
     begin
      Ueberschrift.Left := 8;
      exit;
     end;

     Ueberschrift.Left := 26;
     FImageList.getBitmap(FIndex, Icon.Picture.Bitmap);
     Icon.Transparent := true;
     self.Repaint;
     Icon.Repaint;
end;

destructor TUeberschriftenpanel.Destroy;
begin

    inherited;
end;

procedure TUeberschriftenpanel.Loaded;
begin
  inherited;

  // Überschrift ggf. in der DFM gespeicherte Werte
  if (self.Height = 24) then
    self.Height := 25;

   self.BevelOuter := bvNone;
   self.BevelInner := bvNone;

end;

procedure TUeberschriftenpanel.PanelErzeugen;
begin
     self.ParentFont := false;
     self.Color      := clWhite;
     self.BevelOuter := bvNone;
     self.BevelInner := bvNone;
     self.Align      := alTop;
     self.Height     := 25;
     self.Caption    := ' ';
     {$IfDef VER180}
     self.ParentBackground := false;
     {$EndIf}
     FHeight         := self.Height;
     self.Font.Name  := 'Segoe UI';
     self.Font.Size  := 10;


     Strich          := TPanel.Create(self);
     Strich.Parent   := self;
     Strich.Align    := alBottom;
     Strich.Height   := 2;
     Strich.ParentBackground := false;
     Strich.BevelOuter := bvNone;
     Strich.BevelInner := bvNone;
     Strich.Caption  := '';
     Strich.Color    := 14526722;

     Icon            := TImage.Create(self);
     Icon.Parent     := self;
     Icon.Left       := 3;
     Icon.Top        := 3;
     Icon.Width      := 18;
     Icon.Height     := 18;

     Ueberschrift    := TLabel.Create(self);
     Ueberschrift.ParentFont := false;
     Ueberschrift.Parent := self;
     Ueberschrift.Font.Assign(self.Font);
     Ueberschrift.Autosize   := true;
     Ueberschrift.Caption := '(c) new | frontiers software gmbh';
     Ueberschrift.Left := 26;
     Ueberschrift.Top  := 4;


     FText      := '(c) new | frontiers software gmbh';
     FIndex     := 0;
end;



procedure TUeberschriftenpanel.setIconIndex(const Value: integer);
begin
     FIndex := Value;
     aktualIcon;
end;


procedure TUeberschriftenpanel.setText(const Value: string);
begin
     FText := Value;
     if Ueberschrift <> nil then Ueberschrift.Caption := FText;
end;

procedure TUeberschriftenpanel.setImageList(const Value: TImageList);
begin
     FImageList := Value;
     aktualIcon;
end;

procedure TUeberschriftenpanel.setHeight(const Value: integer);
begin
     FHeight := Value;
     self.Height := FHeight;
     Icon.Top := Round((FHeight - Icon.Height) / 2);
     Ueberschrift.Top := Round((FHeight - Ueberschrift.Height) / 2);     
end;

end.
