unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, RVScroll,
  RichView, RVEdit, RVStyle, RVReport;

type
  TForm1 = class(TForm)
    rv1: TRichViewEdit;
    Panel1: TPanel;
    Button1: TButton;
    RVStyle1: TRVStyle;
    rv2: TRichViewEdit;
    RVStyle2: TRVStyle;
    rvMerge: TRichViewEdit;
    RVStyle3: TRVStyle;
    mem_1: TMemo;
    mem_2: TMemo;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    function RTFAsString(rv: TRichViewEdit): string;
    function MergeRTF(aRTFString1, aRTFString2: string; const aCanvas: TCanvas = nil; aPageWidth: Integer = 800): string;
    function LetzterUmbruchEntfernen(aRTFString): string;
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}




{
class function TRichViewEditObj.MergeRTF(aRTFString1, aRTFString2: string; const aCanvas: TCanvas = nil; aPageWidth: Integer = 800): string;
var
  List: TStringList;
  m   : TMemoryStream;
  rh  : TRvReportHelper;
  rv  : TReportRichView;
  Style: TRvStyle;
begin
  rh    := TRvReportHelper.Create(nil);
  List  := TStringList.Create;
  m     := TMemoryStream.Create;
  Style := TRvStyle.Create(nil);
  try
    rv       := rh.RichView;
    rv.RTFReadProperties.TextStyleMode := rvrsAddIfNeeded;
    rv.RTFReadProperties.ParaStyleMode := rvrsAddIfNeeded;
    rv.RVFOptions := rv.RVFOptions + [rvfoSaveTextStyles];
    rv.RVFOptions := rv.RVFOptions + [rvfoSaveParaStyles];
    rv.Style := Style;

    // Load RTFString1
    List.Text := aRTFString1;
    m.Position := 0;
    List.SaveToStream(m);
    m.Position := 0;
    rv.LoadRTFFromStream(m);

    // Load RTFString2
    List.Text := aRTFString2;
    m.Clear;
    m.Position := 0;
    List.SaveToStream(m);
    m.Position := 0;
    rv.LoadRTFFromStream(m);

    // New RTFString
    m.Position := 0;

    if aCanvas <> nil then
      rh.Init(aCanvas, aPageWidth); // <-- Wenn man eine RTF Tabellen hat, dann ist es unbedingt notwendig das ein Canvas übergeben wird.
                                    //     Sollte kein Canvas übergeben werden, dann

    try
      rv.SaveRTFToStream(m, false); // <-- gibt es hier eine exception [@tb 08.05.2015]
    except
      on E: Exception do
      begin
        ShowMessage(e.Message);
      end;
    end;

    m.Position := 0;


    List.LoadFromStream(m);
    Result := List.Text;

  finally
    FreeAndNil(List);
    FreeAndNil(m);
    FreeAndNil(Style);
    FreeAndNil(rh);
  end;
end;
 }

function TForm1.MergeRTF(aRTFString1, aRTFString2: string; const aCanvas: TCanvas = nil; aPageWidth: Integer = 800): string;
var
  List: TStringList;
  m   : TMemoryStream;
  rh  : TRvReportHelper;
  rv  : TReportRichView;
  Style: TRvStyle;
begin
  rh    := TRvReportHelper.Create(nil);
  List  := TStringList.Create;
  m     := TMemoryStream.Create;
  Style := TRvStyle.Create(nil);
  try
    rv       := rh.RichView;
    rv.RTFReadProperties.TextStyleMode := rvrsAddIfNeeded;
    rv.RTFReadProperties.ParaStyleMode := rvrsAddIfNeeded;
    rv.RVFOptions := rv.RVFOptions + [rvfoSaveTextStyles];
    rv.RVFOptions := rv.RVFOptions + [rvfoSaveParaStyles];
    rv.Style := Style;

    // Load RTFString1
    List.Text := aRTFString1;
    m.Position := 0;
    List.SaveToStream(m);
    m.Position := 0;
    rv.LoadRTFFromStream(m);

    // Load RTFString2
    List.Text := aRTFString2;
    m.Clear;
    m.Position := 0;
    List.SaveToStream(m);
    m.Position := 0;
    rv.LoadRTFFromStream(m);

    // New RTFString
    m.Position := 0;

    if aCanvas <> nil then
      rh.Init(aCanvas, aPageWidth); // <-- Wenn man eine RTF Tabellen hat, dann ist es unbedingt notwendig das ein Canvas übergeben wird.
                                    //     Sollte kein Canvas übergeben werden, dann

    try
      rv.SaveRTFToStream(m, false); // <-- gibt es hier eine exception [@tb 08.05.2015]
    except
      on E: Exception do
      begin
        ShowMessage(e.Message);
      end;
    end;

    m.Position := 0;


    List.LoadFromStream(m);
    Result := List.Text;

  finally
    FreeAndNil(List);
    FreeAndNil(m);
    FreeAndNil(Style);
    FreeAndNil(rh);
  end;
end;



procedure TForm1.Button1Click(Sender: TObject);
begin
  mem_1.Lines.Text := RTFAsString(rv1);
end;


procedure TForm1.Button2Click(Sender: TObject);
var
  rtf1: string;
  rtf2: string;
begin
  rtf1 := RTFAsString(rv1);
  rtf2 := RTFAsString(rv2);
  mem_1.Text := MergeRTF(rtf1, rtf2);
  mem_1.Lines.SaveToFile('c:\Entwicklung\Delphi\Tokyo\Test\Richview\RTFMerge\Test 1\test2.rtf');
end;

function TForm1.LetzterUmbruchEntfernen(aRTFString): string;
var
  s: string;
begin
  s := copy(aRTFString, Length(aRTFString)-5, Length(aRTFString));
  if s <> '\par}' then
    exit;
  Delete(s, Length(aRTFString)-5, Length(aRTFString));

end;

function TForm1.RTFAsString(rv: TRichViewEdit): string;
var
  Stream: TMemoryStream;
  List: TStringList;
begin
  List := TStringList.Create;
  Stream := TMemoryStream.Create;
  try
    //rv.SaveRVFToStream(Stream, false);
    rv.SaveRTFToStream(Stream, false);

    Stream.SaveToFile('c:\Entwicklung\Delphi\Tokyo\Test\Richview\RTFMerge\Test 1\test.rtf');
    //rv.SaveRTFToStream(Stream, false);
    Stream.Position := 0;
    List.LoadFromStream(Stream);
    Result := List.Text;
  finally
    FreeAndNil(Stream);
    FreeAndNil(List);
  end;
end;

end.
