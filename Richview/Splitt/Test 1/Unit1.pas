unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RVStyle, RVScroll, RichView, RVEdit,
  Vcl.StdCtrls, Vcl.ExtCtrls, crvdata, rvrvdata;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Panel3: TPanel;
    Panel4: TPanel;
    rv1: TRichViewEdit;
    rv2: TRichViewEdit;
    RVStyle1: TRVStyle;
    rv3: TRichViewEdit;
    Button2: TButton;
    rv4: TRichViewEdit;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    procedure SelectText(arv: TRichViewEdit; aStartRow, aPosInStartRow, aEndRow, aPosInEndRow: Integer);
    function SelectTextTillEnd(arv: TRichViewEdit; aSearchText: string): Boolean;
    procedure MoveCaretToTheBeginning(arv: TRichViewEdit);
    procedure GetItemAndOffBevor(aRv: TRichViewEdit; aValue: string; var aItemNo, aOff: Integer);
    procedure GetItemAndOffAfter(aRv: TRichViewEdit; aValue: string; var aItemNo, aOff: Integer);
    function getSelectionAsRTFText(aRV: TRichViewEdit): string;
    procedure setRTF(aRv: TRichViewEdit; aValue: string);
    function MergeRTF(aRTFString1, aRTFString2: string; const aMitUmbruch: Boolean = true; const aCanvas: TCanvas = nil; aPageWidth: Integer = 800): string;
    function RTFTextErsetzen(aRTFText, aSerchText, aChangeText: String): string;
    function RTFAsString(aRV: TRichViewEdit) : string;
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  rvTypes, RVReport;



procedure TForm1.FormCreate(Sender: TObject);
begin //
  rv3.AddNL('Das ist Zeile1', 0);
  rv3.AddNL('Das ist Zeile2', 1, 0);
  rv3.AddNL('Das ist Zeile3', 2, 0);
  rv3.AddNL('Hurra @@Ersetzen@@ Text123', 3, 0);
  rv3.AddNL('Das ist Zeile4', 0, 0);
  rv3.AddNL('Das ist Zeile5', 1, 0);
  rv3.AddNL('Das ist Zeile6', 2, 0);
  rv3.Format;
end;



function TForm1.SelectTextTillEnd(arv: TRichViewEdit; aSearchText: string): Boolean;
var
  StartRow: Integer;
  PosInStartRow: Integer;
  EndRow: Integer;
  PosInEndRow: Integer;
begin
  Result := false;
  MoveCaretToTheBeginning(arv);
  if not arv.SearchText(aSearchText, [rvseoDown]) then
    exit;
  StartRow      := arv.CurItemNo;
  PosInStartRow := Pos(aSearchText, arv.GetItemText(StartRow));
  //PosInStartRow := Pos(aSearchText, arv.GetItemText(arv.CurItemNo));
  EndRow        := arv.ItemCount-1;
  PosInEndRow   := Length(arv.GetItemText(arv.ItemCount-1)) + 1;
  SelectText(arv, StartRow, PosInStartRow, EndRow, PosInEndRow);
  Result := arv.GetSelText > '';

end;



procedure TForm1.MoveCaretToTheBeginning(arv: TRichViewEdit);
var
  ItemNo, Offs: Integer;
begin
  ItemNo := 0;
  Offs   := arv.GetOffsBeforeItem(ItemNo);
  arv.SetSelectionBounds(ItemNo,Offs,ItemNo,Offs);
end;


procedure TForm1.SelectText(arv: TRichViewEdit; aStartRow, aPosInStartRow, aEndRow, aPosInEndRow: Integer);
begin
  arv.SetSelectionBounds(aStartRow, aPosInStartRow, aEndRow, aPosInEndRow);
end;


procedure TForm1.Button1Click(Sender: TObject);
begin
  SelectTextTillEnd(rv3, '@@Ersetzen@@');
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  i1: Integer;
  s: TRVUnicodeString;
  iPos: Integer;
  ItemNo: Integer;
  Off: Integer;
  RtfText1: string;
  RtfText2: string;
  RtfText3: string;
begin
 s := '';
 for i1 := 0 to rv1.RVData.ItemCount -1 do
 begin
   s := s + rv1.RVData.Items[i1] + sLineBreak;
 end;
 if rv3.SearchText('@@Ersetzen@@', [rvseoDown]) then
   rv3.InsertText(s);

 exit;



 rv3.SetFocus;
 GetItemAndOffBevor(RV3, '@@Ersetzen@@', ItemNo, Off);
 rv3.SetSelectionBounds(0, 0, ItemNo, Off);
 RtfText1 := getSelectionAsRTFText(rv3);
 setRTF(rv1, RTFText1);

 rv3.SetFocus;
 GetItemAndOffAfter(RV3, '@@Ersetzen@@', ItemNo, Off);
 rv3.SetSelectionBounds(ItemNo, Off, rv3.RVData.ItemCount-1, Length(rv3.RVData.Items[rv3.RVData.ItemCount-1])+1);
 RtfText2 := getSelectionAsRTFText(rv3);
 setRTF(rv2, RTFText2);

 RtfText3 := MergeRTF(RTFText1, RTFText2);
 setRTF(rv4, RTFText3);


 exit;
 ShowMessage('ItemNo = ' + IntToStr(ItemNo) + ' / Off = ' + IntToStr(Off));



//  MoveCaretToTheBeginning(rv3);
 rv3.SetSelectionBounds(0, 0, 4, 15);
 rv3.GetSelText;
 exit;
 for i1 := 0 to rv3.RVData.Items.Count -1 do
 begin
   s := rv3.RVData.Items[i1];
   iPos := Pos('@@Ersetzen@@', s);
   if iPos > 0 then
   begin

   end;
 end;
end;




procedure TForm1.GetItemAndOffBevor(aRv: TRichViewEdit; aValue: string; var aItemNo, aOff: Integer);
var
  i1: Integer;
  s: TRVUnicodeString;
  iPos: Integer;
begin
  aItemNo := -1;
  aOff    := 0;
  for i1 := 0 to aRV.RVData.Items.Count -1 do
  begin
     s := rv3.RVData.Items[i1];
     iPos := Pos(aValue, s);
     if iPos > 0 then
     begin
       aOff := iPos;
       aItemNo := i1;
     end;
  end;
end;

procedure TForm1.GetItemAndOffAfter(aRv: TRichViewEdit; aValue: string; var aItemNo, aOff: Integer);
var
  i1: Integer;
  s: TRVUnicodeString;
  iPos: Integer;
begin
  aItemNo := -1;
  aOff    := 0;
  for i1 := 0 to aRV.RVData.Items.Count -1 do
  begin
     s := rv3.RVData.Items[i1];
     iPos := Pos(aValue, s);
     if iPos > 0 then
     begin
       aItemNo := i1;
       aOff := iPos + Length(aValue);
       if aOff > Length(s) then
         aOff := 0;
     end;
  end;
end;



function TForm1.getSelectionAsRTFText(aRV: TRichViewEdit): string;
var
  Stream: TMemoryStream;
  List: TStringList;
begin
  List := TStringList.Create;
  Stream := TMemoryStream.Create;
  try
    aRV.SaveRTFToStream(Stream, true);
    Stream.Position := 0;
    List.LoadFromStream(Stream);
    Result := List.Text;
  finally
    FreeAndNil(Stream);
    FreeAndNil(List);
  end;
end;


procedure TForm1.setRTF(aRv: TRichViewEdit; aValue: string);
var
  Stream: TMemoryStream;
  List: TStringList;
begin
  List := TStringList.Create;
  Stream := TMemoryStream.Create;
  try
    List.Text := aValue;
    List.SaveToStream(Stream);
    Stream.Position := 0;
    aRV.LoadRTFFromStream(Stream);
    aRV.Format;
  finally
    FreeAndNil(Stream);
    FreeAndNil(List);
  end;
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
//    rv.SaveRTF('C:\RTFTest\Test1.rtf', false);

    // Load RTFString2
    List.Text := aRTFString2;
    m.Clear;
    m.Position := 0;
    List.SaveToStream(m);
    m.Position := 0;
    if not aMitUmbruch then
      rv.Add('@~BREAK~@',0);
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


    // Result := trim(List.Text);

  finally
    FreeAndNil(List);
    FreeAndNil(m);
    FreeAndNil(Style);
    FreeAndNil(rh);
  end;
end;


function TForm1.RTFTextErsetzen(aRTFText, aSerchText, aChangeText: String): string;
var
  List: TStringList;
  m   : TMemoryStream;
  rh  : TRvReportHelper;
  rv  : TReportRichView;
  rh2  : TRvReportHelper;
  rv2  : TReportRichView;
  Style: TRvStyle;
  s: TRVUnicodeString;
  s1: string;
  iPos: Integer;
  i1, i2: Integer;
  sVorher, sNachher: string;
begin
  rh    := TRvReportHelper.Create(nil);
  rh2   := TRvReportHelper.Create(nil);
  List  := TStringList.Create;
  m     := TMemoryStream.Create;
  Style := TRvStyle.Create(nil);
  try
    rv := rh.RichView;
    rv.RTFReadProperties.TextStyleMode := rvrsAddIfNeeded;
    rv.RTFReadProperties.ParaStyleMode := rvrsAddIfNeeded;
    rv.RVFOptions := rv.RVFOptions + [rvfoSaveTextStyles];
    rv.RVFOptions := rv.RVFOptions + [rvfoSaveParaStyles];
    rv.Style := Style;

    rv2 := rh2.RichView;
    rv2.RTFReadProperties.TextStyleMode := rvrsAddIfNeeded;
    rv2.RTFReadProperties.ParaStyleMode := rvrsAddIfNeeded;
    rv2.RVFOptions := rv.RVFOptions + [rvfoSaveTextStyles];
    rv2.RVFOptions := rv.RVFOptions + [rvfoSaveParaStyles];
    rv2.Style := Style;

    // Load RTFString1
    List.Text := aRTFText;
    m.Position := 0;
    List.SaveToStream(m);
    m.Position := 0;
    rv.LoadRTFFromStream(m);

    List.Clear;
    List.Text := aChangeText;
    for i1 := 0 to rv.RVData.Items.count -1 do
    begin
      s := rv.RVData.Items[i1];
      iPos := Pos(aSerchText, s);
      if iPos > 0 then
      begin
        s1 := List.Strings[0];
        sVorher := copy(s, 1, iPos-1);
        sNachher := copy(s, iPos+Length(aSerchText), Length(s));
        s := sVorher + s1;
        rv2.AddItem(s, rv.RVData.Items.Objects[i1]);
        for i2 := 1 to List.Count -1 do
        begin
          s1 := List.Strings[i2];
          rv2.Addnl(s1, rv.RVData.Items.Objects[i1].StyleNo, 0);
        end;
        rv2.AddNL(sNachher, rv.RVData.Items.Objects[i1].StyleNo, -1);
        continue;
      end;
      rv2.AddItem(s, rv.RVData.Items.Objects[i1]);
    end;

    m.Clear;
    m.Position := 0;
    rv2.SaveRTFToStream(m, false);
    List.Clear;
    m.Position := 0;
    List.LoadFromStream(m);
    Result := List.Text;

  finally
    FreeAndNil(List);
    FreeAndNil(m);
    FreeAndNil(Style);
    FreeAndNil(rh);
    FreeAndNil(rh2);
  end;
end;


function TForm1.RTFAsString(aRV: TRichViewEdit) : string;
var
  Stream: TMemoryStream;
  List: TStringList;
  s: string;
begin
  List := TStringList.Create;
  Stream := TMemoryStream.Create;
  try
    aRV.SaveRTFToStream(Stream, false);
    Stream.Position := 0;
    List.LoadFromStream(Stream);
    Result := List.Text;
    s := copy(Result, Length(Result)-6, Length(Result));
    if s = '#$D#$A' then
      Result := copy(Result, 1, Length(Result)-6);

  finally
    FreeAndNil(Stream);
    FreeAndNil(List);
  end;
end;



procedure TForm1.Button3Click(Sender: TObject);
var
  RTFStr: String;
  s: string;
begin
  RTFStr := RTFAsString(rv3);
  s := 'Jawohl dieser' + sLineBreak + 'Text wurde' + sLineBreak + 'ersetzt.';
  RTFStr := RTFTextErsetzen(RTFStr, '@@Ersetzen@@', s);
  setRTF(rv4, RTFSTr);
end;



end.
