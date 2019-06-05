unit Form.SetterAndGetterErzeugen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Objekt.FeldList, Objekt.Feld;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    mem_DDL: TMemo;
    btn_Erzeugen: TButton;
    Label1: TLabel;
    edt_Praefix: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btn_ErzeugenClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    fPraefix: string;
    fPropertyList: TStringList;
    fIniList: TStringList;
    fSaveToDBList: TStringList;
    fLoadFromQueryList: TStringList;
    fPath: string;
    fFeldList: TFeldList;
    procedure LadeFeldList;
  public
    procedure Erzeugen;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  db;

procedure TForm1.FormCreate(Sender: TObject);
begin
  edt_Praefix.Text := 'ST';
  fPath := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
  fPropertyList := TStringList.Create;
  fIniList := TStringList.Create;
  fSaveToDBList := TStringList.Create;
  fLoadFromQueryList := TStringList.Create;
  fFeldList := TFeldList.Create;
end;


procedure TForm1.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fIniList);
  FreeAndNil(fPropertyList);
  FreeAndNil(fSaveToDBList);
  FreeAndNil(fFeldList);
  FreeAndNil(fLoadFromQueryList);
end;

procedure TForm1.btn_ErzeugenClick(Sender: TObject);
begin
  LadeFeldList;
  Erzeugen;
end;

procedure TForm1.LadeFeldList;
var
  i1, i2: Integer;
  iPos: Integer;
  s: string;
  Vari: String;
  First: Boolean;
  Feld: TFeld;
begin
  fFeldList.Clear;
  fPraefix := edt_Praefix.Text;
  if fPraefix[Length(fPraefix)] <> '_' then
    fPraefix := fPraefix + '_';
  fFeldList.Preafix := fPraefix;

  for i1 := 0 to mem_DDL.Lines.Count -1 do
  begin
    s := mem_DDL.Lines[i1];
    iPos := Pos(fPraefix, s);
    if iPos <= 0 then
      continue;
    Vari := '';
    First := true;
    for i2 := 1 to Length(s) do
    begin
      if (s[i2] = ' ') and (First) then
        continue;
      First := false;
      if (s[i2] = ' ') then
        break;
      Vari := Vari + s[i2];
      if (Length(Vari) = 3) and (SameText(Vari, fPraefix)) then
        Vari := '';
    end;
    if Vari > '' then
    begin
      if (Pos('INTEGER,', s) > 0)
      or (Pos('INTEGER ', s) > 0)
      or (Pos('CHAR(', s) > 0)
      or (Pos('CHAR ', s) > 0)
      or (Pos('VARCHAR(', s) > 0)
      or (Pos('VARCHAR ', s) > 0)
      or (Pos('BLOB S', s) > 0)
      or (Pos('DATE,', s) > 0)
      or (Pos('DATE ', s) > 0)
      or (Pos('DOUBLE PRECISION ', s) > 0)
      or (Pos('DOUBLE PRECISION,', s) > 0) then
      begin
        Feld := fFeldList.Add;
        Feld.Name := Vari;
        Feld.Typ := ftUnknown;
        if (Pos('VARCHAR(', s) > 0) or (Pos('VARCHAR ', s) > 0) then
          Feld.Typ := ftString;
        if (Feld.Typ = ftUnknown) and (Pos('CHAR(', s) > 0) or (Pos('CHAR ', s) > 0) then
          Feld.Typ := ftBoolean;
        if (Pos('INTEGER,', s) > 0) or (Pos('INTEGER ', s) > 0) then
          Feld.Typ := ftInteger;
        if (Pos('BLOB S', s) > 0) then
          Feld.Typ := ftBlob;
        if (Pos('DOUBLE PRECISION,', s) > 0) or (Pos('DOUBLE PRECISION ', s) > 0) then
          Feld.Typ := ftFloat;
        if (Pos('DATE,', s) > 0) or (Pos('DATE ', s) > 0) then
          Feld.Typ := ftDateTime;
      end;
    end;
  end;

end;

procedure TForm1.Erzeugen;
begin
  fFeldList.PropertyList(fPropertyList);
  fFeldList.InitList(fIniList);
  fFeldList.SaveToDBList(fSaveToDBList);
  fFeldList.LoadFromQuery(fLoadFromQueryList);
  fPropertyList.SaveToFile(fPath + 'Property.txt');
  fIniList.SaveToFile(fPath + 'Ini.txt');
  fSaveToDBList.SaveToFile(fPath + 'SaveToDB.txt');
  fLoadFromQueryList.SaveToFile(fPath + 'LoadFromQuery.txt');
  ShowMessage('Fertig');
end;


{
procedure TForm1.Erzeugen;
var
  i1, i2: Integer;
  iPos: Integer;
  s: string;
  Vari: String;
  VariArt: string;
  First: Boolean;
begin
  fPropertyList.Clear;
  fIniList.Clear;
  fSaveToDBList.Clear;
  fSaveToDBList.Add('queryBuilder');
  fSaveToDBList.Add('.table(getTableName)');
  fPraefix := edt_Praefix.Text;
  if fPraefix[Length(fPraefix)] <> '_' then
    fPraefix := fPraefix + '_';

  for i1 := 0 to mem_DDL.Lines.Count -1 do
  begin
    s := mem_DDL.Lines[i1];
    iPos := Pos(fPraefix, s);
    if iPos <= 0 then
      continue;
    Vari := '';
    First := true;
    for i2 := 1 to Length(s) do
    begin
      if (s[i2] = ' ') and (First) then
        continue;
      First := false;
      if (s[i2] = ' ') then
        break;
      Vari := Vari + s[i2];
      if (Length(Vari) = 3) and (SameText(Vari, fPraefix)) then
        Vari := '';
    end;
    if Vari > '' then
    begin
      if Pos('INTEGER', s) > 0 then
        VariArt := 'Integer';
      if Pos('CHAR', s) > 0 then
        VariArt := 'String';
      if Pos('DOUBLE PRECISION', s) > 0 then
        VariArt := 'Real';
      s := 'property ' + Vari + ': ' + VariArt + ' read f' + Vari + ' write set' + Vari;
      fPropertyList.Add(s);
      s := 'f' + Vari + ' := ';
      if (VariArt = 'Integer') or (VariArt = 'Real') then
        s := s + '0;';
      if (VariArt = 'String') then
        s := s + QuotedStr('') + ';';
      fIniList.Add(s);
      s := '.field(' + '''' + fPraefix + Vari + '''' + ', f' + Vari + ')';
      fSaveToDBList.Add(s);
    end;
  end;

  fPropertyList.SaveToFile(fPath + 'Property.txt');
  fIniList.SaveToFile(fPath + 'Ini.txt');
  fSaveToDBList.SaveToFile(fPath + 'SaveToDB.txt');

  ShowMessage('Fertig');

end;
}


end.
