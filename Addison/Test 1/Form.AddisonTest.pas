unit Form.AddisonTest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, addisonbasics_TLB,
  afibu_TLB, System.Win.ComObj;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    btn_Connect: TButton;
    mem: TMemo;
    btn_OpEinlesen: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btn_ConnectClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_OpEinlesenClick(Sender: TObject);
  private
    fBOMan: AddBOManager;
    fMand: AddMandant;
    fFibuPrj: afibu_TLB.IAddProject;
    fImpFibuPrj: AddFibuProjectImp;
    fWirtschaftsjahr: RWFibuWJ;
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  Dateutils;



procedure TForm1.FormCreate(Sender: TObject);
begin
  fBOMan := CreateComObject(CLASS_AddBOManager) as IAddBOManager;
end;

procedure TForm1.btn_ConnectClick(Sender: TObject);
var
  WjJahr: Word;
  WjMonat: Word;
  WjTag: Word;
begin
  fBOMan.ConnectEx('20028', '20028A2011');
//  fBOMan.Connect;
  if fBOMan = nil then
  begin
    ShowMessage('connect fehlgeschlagen');
  end;

  ShowMessage('IsOpen ' + IntToStr(fBOMan.IsOpen));

  fMand := fBOMan.GetMandant[21225];
  if fMand = nil then
  begin
    ShowMessage('Mandant nicht gefunden');
    exit;
  end;

  ShowMessage('Mandant gefunden');

  addisonbasics_TLB.IAddProject(fFibuPrj) := fMand.GetFibuProject;

  if fFibuPrj = nil then
  begin
    ShowMessage('fFibuPrj nicht gefunden');
    exit;
  end;


  fImpFibuPrj := CreateComObject(CLASS_AddFibuProjectImp) as IAddFibuProjectImp;
  fImpFibuPrj.Attach(fFibuPrj);

  WjJahr  := 2018;
  WjMonat := 2;
  WjTag   := 1;

  fWirtschaftsjahr := fImpFibuPrj.GetWJDate[EncodeDate(YearOf(now), WjMonat, WjTag)];

  if fWirtschaftsjahr = nil then
  begin
    ShowMessage('Wirtschaftsjahr 01.02.2018 wurde nicht gefunden');
    fWirtschaftsjahr := fImpFibuPrj.GetWJDate[EncodeDate(YearOf(now) - 1, WjMonat, WjTag)];
  end;

  if fWirtschaftsjahr = nil then
    ShowMessage('Wirtschaftsjahr konnte nicht geöffnet werden!')
  else
    ShowMessage('Wirtschaftsjahr: ' + FormatDateTime('dd.mm.yyyy', fWirtschaftsjahr.m_Beginn));

end;

procedure TForm1.btn_OpEinlesenClick(Sender: TObject);
var
  OPSuche: RwOPSuche;
  OP: RwOP;
  i1: Integer;
  s: string;
begin
  OPSuche := fWirtschaftsjahr.CreateOPSuche;
  OPSuche.SearchBelegNr('*', '*');

  mem.Lines.Text := 'Anzahl OP: ' + IntToStr(OPSuche.Count);

  if OPSuche.Count = 0 then
    exit;

  i1 := 0;
  OP := OPSuche.GetAt[i1];

  while OP <> nil do
  begin
    s := OP.m_BelegNr + ' / ' + OP.m_BelegNr2 + ' / ' + FormatDateTime('dd.mm.yyyy', OP.m_BelegDatum) + ' / ' + FloatToStr(OP.m_Betrag);
    mem.Lines.Add(s);
    inc(i1);
    OP := OPSuche.GetAt[i1];
  end;




end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fBOMan.Close;
end;



end.
