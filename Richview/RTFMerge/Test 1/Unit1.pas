unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, RVScroll,
  RichView, RVEdit, RVStyle, RVReport, rvItem, rvTypes;

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
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    function AsRVF(rv: TRichViewEdit): string;
    function RTFAsString(rv: TRichViewEdit): string;
    function MergeRTF(aRTFString1, aRTFString2: string; const aMitUmbruch: Boolean = true;  const aCanvas: TCanvas = nil; aPageWidth: Integer = 800): string;
    function MergeRTFOhneUmbruch(aRTFString1, aRTFString2: string; const aCanvas: TCanvas = nil; aPageWidth: Integer = 800): string;
    function LetzterUmbruchEntfernen(aRTFString: string): string;
    procedure MoveCaretToTheEnd(rv: TRichViewEdit);
    function StrToRTF(aValue: string): string;
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







procedure TForm1.Button1Click(Sender: TObject);
begin
  rv1.SaveRTF('c:\Temp3\x.rtf', false);
//  mem_1.Lines.Text := RTFAsString(rv1);
end;


procedure TForm1.Button2Click(Sender: TObject);
var
  rtf1: string;
  rtf2: string;
begin
  rtf1 := RTFAsString(rv1);
  rtf1 := LetzterUmbruchEntfernen(rtf1);
  mem_1.Lines.Text := rtf1;
  mem_1.Lines.SaveToFile('c:\Entwicklung\Delphi\Tokyo\Test\Richview\RTFMerge\Test 1\OhneUmbruch.rtf');
  rtf2 := RTFAsString(rv2);
  //mem_1.Text := LetzterUmbruchEntfernen(rtf1);
  //mem_1.Lines.SaveToFile('c:\Entwicklung\Delphi\Tokyo\Test\Richview\RTFMerge\Test 1\test2.rtf');

  //rtf1 := LetzterUmbruchEntfernen(rtf1);
  mem_1.Text := rtf1;
  mem_1.Lines.SaveToFile('c:\Entwicklung\Delphi\Tokyo\Test\Richview\RTFMerge\Test 1\test1.rtf');
  mem_1.Text := MergeRTF(rtf1, rtf2, false);
  mem_1.Lines.SaveToFile('c:\Entwicklung\Delphi\Tokyo\Test\Richview\RTFMerge\Test 1\test4.rtf');

end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  MoveCaretToTheEnd(rv1);
  rv1.setFocus;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  rtf1: string;
  rtf2: string;
  Stream: TMemoryStream;
begin
  {
  Stream := TMemoryStream.Create;
  //rtf2 := RTFAsString(rv2);
  rv2.SaveRTFToStream(Stream, false);
  Stream.Position := 0;
  rv1.InsertRTFFromStreamEd(Stream);
  FreeAndNil(Stream);
  }
  rtf1 := RTFAsString(rv1);
  rtf2 := RTFAsString(rv2);
  MergeRTFOhneUmbruch(rtf1, rtf2);

end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  mem_2.Text := StrToRTF(mem_1.Text);
end;

function TForm1.LetzterUmbruchEntfernen(aRTFString: string): string;
var
  s: string;
begin
  aRTFString := Trim(aRTFString);
  s := copy(aRTFString, Length(aRTFString)-4, Length(aRTFString));
  if s <> '\par}' then
    exit;
  Delete(aRTFString, Length(aRTFString)-4, Length(aRTFString));
  Result := aRTFString + '}';
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

function TForm1.AsRVF(rv: TRichViewEdit): string;
var
  Stream: TMemoryStream;
  List: TStringList;
begin
  List := TStringList.Create;
  Stream := TMemoryStream.Create;
  try
    //rv.SaveRVFToStream(Stream, false);
    rv.SaveRVFToStream(Stream, false);
    Stream.Position := 0;
    List.LoadFromStream(Stream);
    Result := List.Text;
  finally
    FreeAndNil(Stream);
    FreeAndNil(List);
  end;
end;

procedure TForm1.MoveCaretToTheEnd(rv: TRichViewEdit);
var
  ItemNo, Offs: Integer;
begin
  ItemNo := rv.ItemCount-1;
  Offs   := rv.GetOffsAfterItem(ItemNo);
  rv.SetSelectionBounds(ItemNo,Offs,ItemNo,Offs);
end;




function TForm1.MergeRTF(aRTFString1, aRTFString2: string; const aMitUmbruch: Boolean = true; const aCanvas: TCanvas = nil; aPageWidth: Integer = 800): string;
var
  List: TStringList;
  m   : TMemoryStream;
  rh  : TRvReportHelper;
  rv  : TReportRichView;
  Style: TRvStyle;
  s: string;
  s1: string;
  s2: string;
  iPos: Integer;
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
    if not aMitUmbruch then
      rv.Add('@~BREAK~@',0);
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

    s := Trim(List.Text);
    iPos := Pos('@~BREAK~@', s);
    if iPos > 0 then
    begin
      s1 := copy(s, 1, iPos-1);
      Delete(s, 1, iPos+15);
      s := s1 + s;
    end;

    Result := s;



    //Result := List.Text;

  finally
    FreeAndNil(List);
    FreeAndNil(m);
    FreeAndNil(Style);
    FreeAndNil(rh);
  end;
end;

function TForm1.MergeRTFOhneUmbruch(aRTFString1, aRTFString2: string; const aCanvas: TCanvas = nil; aPageWidth: Integer = 800): string;
var
  List: TStringList;
  m   : TMemoryStream;
  m1  : TMemoryStream;
  rh1  : TRvReportHelper;
  rv1  : TReportRichView;
  rh2  : TRvReportHelper;
  rv2  : TReportRichView;
  Style: TRvStyle;
  i1: Integer;
  iifo: TCustomRVItemInfo;
  s: TRVUnicodeString;
  t: TRvTag;
begin
  rh1    := TRvReportHelper.Create(nil);
  rh2    := TRvReportHelper.Create(nil);
  List  := TStringList.Create;
  m     := TMemoryStream.Create;
  m1    := TMemoryStream.Create;
  Style := TRvStyle.Create(nil);
  try
    rv1       := rh1.RichView;
    rv1.RTFReadProperties.TextStyleMode := rvrsAddIfNeeded;
    rv1.RTFReadProperties.ParaStyleMode := rvrsAddIfNeeded;
    rv1.RVFOptions := rv1.RVFOptions + [rvfoSaveTextStyles];
    rv1.RVFOptions := rv1.RVFOptions + [rvfoSaveParaStyles];
    rv1.Style := Style;

    rv2       := rh2.RichView;
    rv2.RTFReadProperties.TextStyleMode := rvrsAddIfNeeded;
    rv2.RTFReadProperties.ParaStyleMode := rvrsAddIfNeeded;
    rv2.RVFOptions := rv2.RVFOptions + [rvfoSaveTextStyles];
    rv2.RVFOptions := rv2.RVFOptions + [rvfoSaveParaStyles];
    rv2.Style := Style;


    // Load RTFString1
    List.Text := aRTFString1;
    m.Position := 0;
    List.SaveToStream(m);
    m.Position := 0;
    rv1.Clear;
    rv1.LoadRTFFromStream(m);

    for i1 := 0 to rv1.ItemCount do
    begin
      rv1.PageBreaksBeforeItems[i1] := false;
    end;

    // Load RTFString2
    List.Text := aRTFString2;
    m.Position := 0;
    List.SaveToStream(m);
    m.Position := 0;
    rv2.LoadRTFFromStream(m);



    m.Position := 0;
    rv1.SaveRVFToStream(m, false);
    //rv2.SaveRVFToStream(m, false);
    m.Position := 0;
    rvMerge.LoadRVFFromStream(m);
    rvMerge.Format;

    m.Position := 0;
    rv2.SaveRVFToStream(m, false);
    m.Position := 0;
    rvMerge.InsertRVFFromStream(m, rvMerge.ItemCount);
    rvMerge.Format;



    {
    for i1 := 0 to rv1.ItemCount -1 do
    begin
      iifo := rv1.GetItem(i1);
      s := rv1.GetItemTextW(i1);
      rvMerge.AddNL(s, rv1.GetItemStyle(i1), rv1.GetItemPara(i1));
    end;
    rvMerge.Format;

    for i1 := 0 to rv2.ItemCount -1 do
    begin
      iifo := rv2.GetItem(i1);
      s := rv2.GetItemTextW(i1);
      rvMerge.AddNL(s, rv2.GetItemStyle(i1), rv2.GetItemPara(i1));
    end;

    rvMerge.Format;
    }

    //rvMerge.AppendFrom(rv2);

    //m.Position := 0;
    //rv2.SaveRVFToStream(m,false);
    //m.Position := 0;

    {
    //rvMerge.InsertRVFFromStream(m, 1);
    rvMerge.LoadRVFFromStream(m);
    rvMerge.Format;
    }

    {
    rv1.InsertRVFFromStream(m, 1);
    m.Position := 0;
    rv1.SaveRTFToStream(m, false);

    m.Position := 0;
    rvMerge.LoadRTFFromStream(m);

    m.Position := 0;
    List.LoadFromStream(m);
    }


       {
    rv1.InsertRVFFromStream(m, 1);
    m.Position := 0;
    rv1.SaveRTFToStream(m, false);

    m.Position := 0;
    rvMerge.LoadRTFFromStream(m);

    m.Position := 0;
    List.LoadFromStream(m);
      }


    Result := List.Text;

    List.SaveToFile('c:\Entwicklung\Delphi\Tokyo\Test\Richview\RTFMerge\Test 1\test.rtf');



  finally
    FreeAndNil(List);
    FreeAndNil(m);
    FreeAndNil(Style);
    FreeAndNil(m1);
    FreeAndNil(rh1);
    FreeAndNil(rh2);
  end;
end;


function TForm1.StrToRTF(aValue: string): string;
var
  List: TStringList;
  m   : TMemoryStream;
  rh  : TRvReportHelper;
  rv  : TReportRichView;
  Style: TRvStyle;
  fi: TFontInfo;
  i1: Integer;
begin
  rh    := TRvReportHelper.Create(nil);
  List  := TStringList.Create;
  m     := TMemoryStream.Create;
  Style := TRvStyle.Create(nil);
  try

    Style.TextStyles.Clear;
    fi := Style.TextStyles.Add;
    {
    fi.FontName := aFont.Fontname;
    fi.Size := aFont.Fontsize;
    fi.Style := aFont.Style;
    fi.Color := aFont.Fontcolor;
   }
    rv       := rh.RichView;
    rv.RTFReadProperties.TextStyleMode := rvrsAddIfNeeded;
    rv.RTFReadProperties.ParaStyleMode := rvrsAddIfNeeded;
    rv.RVFOptions := rv.RVFOptions + [rvfoSaveTextStyles];
    rv.RVFOptions := rv.RVFOptions + [rvfoSaveParaStyles];
    rv.Style := Style;

    List.Text := aValue;

    rv.Clear;
    for i1 := 0 to List.Count -1 do
    begin
      rv.AddNL(List.Strings[i1], 0, 0);
    end;

    m.Position := 0;
    m.Clear;
    rv.SaveRTFToStream(m, false);
    m.Position := 0;
    List.LoadFromStream(m);
    Result := trim(List.Text);

  finally
    FreeAndNil(List);
    FreeAndNil(m);
    FreeAndNil(Style);
    FreeAndNil(rh);
  end;
end;


end.
