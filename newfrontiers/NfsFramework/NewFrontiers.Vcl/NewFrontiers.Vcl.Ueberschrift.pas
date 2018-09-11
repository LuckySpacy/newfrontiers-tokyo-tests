unit NewFrontiers.Vcl.Ueberschrift;

interface

  uses Vcl.Controls, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ImgList, Classes;

  type

  TUeberschriftAccent = (
    Blue, Green
  );

  TUeberschriftIcon = (
    Index,
    Artikel, Auswertungen, Dokumente, Einstellungen, Geraete, Kunden, Lieferanten,
    Mahnwesen, Projekte, Service, Tickets, Versand, Vorgaenge, Wiedervorlage, Kalender,
    DokumentOptionen
  );

  TUeberschriftSize = (
    Klein, Mittel, Gross
  );

  type TUeberschrift = class(TCustomPanel)

    private
      _imageList: TCustomImageList;
      _imageIndex: integer;
      _icon: TUeberschriftIcon;
      _size: TUeberschriftSize;
      _accent: TUeberschriftAccent;
      _text: string;

      _strich: TPanel;
      _iconControl: TImage;
      _textControl: TLabel;

      procedure setIcon(const Value: TUeberschriftIcon);
      procedure setImageIndex(const Value: integer);
      procedure setImageList(const Value: TCustomImageList);
      procedure setSize(const Value: TUeberschriftSize);
      procedure setText(const Value: string);
      procedure GroesseKonfigurieren;
      procedure setAccent(const Value: TUeberschriftAccent);

    protected
      procedure aktual;
      procedure init;
      procedure findIconIndex;

    public
      constructor Create(aOwner: TComponent); override;

    published
      property ImageList: TCustomImageList read _imageList write setImageList;
      property ImageIndex: integer read _imageIndex write setImageIndex;
      property Icon: TUeberschriftIcon read _icon write setIcon;
      property Size: TUeberschriftSize read _size write setSize;
      property Text: string read _text write setText;
      property Accent: TUeberschriftAccent read _accent write setAccent;



  end;


procedure Register;

implementation

uses Vcl.Graphics;

procedure Register;
begin
  RegisterComponents('new frontiers', [TUeberschrift]);
end;

{ TUeberschrift }

procedure TUeberschrift.aktual;
begin

  GroesseKonfigurieren;

  // Farbe
  if (_accent = TUeberschriftAccent.Blue) then
    _strich.Color := 14526722
  else
    _strich.Color := 1435817;

  // Text
  _textControl.Caption := _text;

  // Icon
  if (_ImageList = nil) then
  begin
    _textControl.Left := _iconControl.Left;
    _iconControl.Visible := false;
  end

  else begin
    _iconControl.Visible := false;
    self.Repaint;
    findIconIndex;
    _imageList.GetBitmap(_imageIndex, _iconControl.Picture.Bitmap);
    _iconControl.Visible := true;
    Self.Repaint;

  end;

  
end;

procedure TUeberschrift.init;
begin

  self.ParentFont := false;
  self.ParentBackground := false;
  self.Color      := clWhite;
  self.BevelOuter := bvNone;
  self.BevelInner := bvNone;
  self.Align      := alTop;
  self.Caption    := ' ';


  _strich          := TPanel.Create(self);
  _strich.Parent   := self;
  _strich.Align    := alBottom;
  _strich.ParentBackground := false;
  _strich.BevelOuter := bvNone;
  _strich.BevelInner := bvNone;
  _strich.Caption  := '';

  _iconControl            := TImage.Create(self);
  _iconControl.Parent     := self;
  _iconControl.Transparent := true;

  _textControl    := TLabel.Create(self);
  _textControl.ParentFont := false;
  _textControl.Parent := self;
  _textControl.Autosize   := true;
  _textControl.Color := $005C5C5C;

  _text        := '(c) new | frontiers software gmbh';
  _imageIndex  := 0;
  _icon := TUeberschriftIcon.Index;
  _size := TUeberschriftSize.Klein;

  aktual;

end;

constructor TUeberschrift.Create(aOwner: TComponent);
begin
  inherited;
  init;
end;

procedure TUeberschrift.findIconIndex;
begin
    case _icon of
      Vorgaenge: _imageIndex := 19;
      Kunden: _imageIndex := 21;
      Lieferanten: _imageIndex := 5;
      Artikel: _imageIndex := 8;
      Projekte: _imageIndex := 18;
      Geraete: _imageIndex := 17;
      Versand: _imageIndex := 6;
      Mahnwesen: _imageIndex := 13;
      Wiedervorlage: _imageIndex := 11;
      Auswertungen: _imageIndex := 9;
      Service: _imageIndex := 16;
      Tickets: _imageIndex := 12;
      Einstellungen: _imageIndex := 23;
      Dokumente: _imageIndex := 98;
      Kalender: _imageIndex := 26;
      DokumentOptionen: _imageIndex := 49;
    end;
end;

procedure TUeberschrift.GroesseKonfigurieren;
begin

  // Größe konfigurieren
  if (_size = TUeberschriftSize.Klein) then
  begin
    self.Height := 26;
    self.Constraints.MinHeight := 26;
    self.Constraints.MaxHeight := 26;
    _iconControl.Left := 4;
    _iconControl.Top := 4;
    _iconControl.Width := 16;
    _iconControl.Height := 16;
    _textControl.Font.Name := 'Segoe UI';
    _textControl.Font.Size := 10;
    _textControl.Left := 26;
    _textControl.Top := 4;
    _strich.Height := 2;
  end
  else if (_size = TUeberschriftSize.Mittel) then
  begin
    self.Height := 52;
    self.Constraints.MinHeight := 52;
    self.Constraints.MaxHeight := 52;
    _iconControl.Left := 8;
    _iconControl.Top := 8;
    _iconControl.Width := 32;
    _iconControl.Height := 32;
    _textControl.Font.Name := 'Segoe UI';
    _textControl.Font.Size := 18;
    _textControl.Left := 52;
    _textControl.Top := 6;
    _strich.Height := 4;
  end
  else if (_size = TUeberschriftSize.Gross) then
  begin
    self.Height := 78;
    self.Constraints.MinHeight := 78;
    self.Constraints.MaxHeight := 78;
    _iconControl.Left := 12;
    _iconControl.Top := 12;
    _iconControl.Width := 78;
    _iconControl.Height := 78;
    _textControl.Font.Name := 'Segoe UI';
    _textControl.Font.Size := 24;
    _textControl.Left := 78;
    _textControl.Top := 9;
    _strich.Height := 6;
  end;

end;

procedure TUeberschrift.setAccent(const Value: TUeberschriftAccent);
begin
  _accent := Value;
  aktual;
end;

procedure TUeberschrift.setIcon(const Value: TUeberschriftIcon);
begin
  _icon := Value;
  aktual;
end;

procedure TUeberschrift.setImageIndex(const Value: integer);
begin
  _imageIndex := Value;
  aktual;
end;

procedure TUeberschrift.setImageList(const Value: TCustomImageList);
begin
  _imageList := Value;
  aktual;
end;

procedure TUeberschrift.setSize(const Value: TUeberschriftSize);
begin
  _size := Value;
  aktual;
end;

procedure TUeberschrift.setText(const Value: string);
begin
  _text := Value;
  aktual;
end;

end.
