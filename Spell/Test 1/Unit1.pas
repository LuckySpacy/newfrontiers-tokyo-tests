unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RVStyle, RVScroll, RichView, RVEdit;

type
  TForm1 = class(TForm)
    RichViewEdit1: TRichViewEdit;
    RVStyle1: TRVStyle;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RichViewEdit1SpellingCheck(Sender: TCustomRichView;
      const AWord: string; StyleNo: Integer; var Misspelled: Boolean);
  private
    fSpell: TStringList;
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  fSpell := TStringList.Create;
  fSpell.Duplicates := dupIgnore;
  fSpell.CaseSensitive := false;
  fSpell.Sorted := true;
  fSpell.LoadFromFile('D:\Delphi\Tokyo\Test\Spell\Test 1\german.dic');
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fSpell);
end;

procedure TForm1.RichViewEdit1SpellingCheck(Sender: TCustomRichView;
  const AWord: string; StyleNo: Integer; var Misspelled: Boolean);
begin
  //Misspelled := true;
  //caption := IntToStr(fSpell.IndexOf(aWord));
  Misspelled := fSpell.IndexOf(aWord) = -1;
end;

end.
