unit fntDemo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, IBCustomDataSet,
  IBQuery, IBDatabase, Vcl.ExtCtrls, nfsEditAutoComplete;

type
  TForm15 = class(TForm)
    IBD_Post: TIBDatabase;
    Trans: TIBTransaction;
    qry: TIBQuery;
    nfsEditAutoComplete1: TnfsEditAutoComplete;
    Label1: TLabel;
    Label2: TLabel;
    nfsEditAutoComplete2: TnfsEditAutoComplete;
    procedure FormCreate(Sender: TObject);
    procedure nfsEditAutoComplete1GetList(Sender: TObject; aList: TStrings);
  private
  public
  end;

var
  Form15: TForm15;

implementation

{$R *.dfm}

procedure TForm15.FormCreate(Sender: TObject);
begin
  IBD_Post.Connected := true;
  nfsEditAutoComplete1.Text := '';
  nfsEditAutoComplete1.SearchInterrupt := 500;  // <-- Einstellung wie schnell die Suche losgehen soll
  nfsEditAutoComplete1.SearchByLetters := 2; // <-- Erst bei einer Eingabe von 2 Buchstaben die Suche starten.

  nfsEditAutoComplete2.Text := '';
  nfsEditAutoComplete2.SearchList.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\x.txt');
  nfsEditAutoComplete2.MaxItems := 0;   // <-- Maximale Anzahl an Einträgen, danach wird die Filterung abgebrochen; 0 = Kein Abbruch
  nfsEditAutoComplete2.SearchInterrupt := 1000;  // <-- Einstellung wie schnell die Suche losgehen soll
  nfsEditAutoComplete2.CaseSensitive := true; // <-- Groß-Kleinschreibung beachten
end;




procedure TForm15.nfsEditAutoComplete1GetList(Sender: TObject; aList: TStrings);
begin
  if Trim(nfsEditAutoComplete1.Text) = '' then
    exit;

  qry.Close;
  qry.SQL.Text := 'select distinct str_name from tb_ld_str where str_name like ' + QuotedStr(nfsEditAutoComplete1.Text + '%') + ' order by str_name';
  qry.Open;
  while not qry.Eof do
  begin
    Application.ProcessMessages;
    aList.Add(qry.FieldByName('str_name').AsString);
    qry.Next;
  end;

end;

end.
