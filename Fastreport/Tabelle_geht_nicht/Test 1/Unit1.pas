unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RVScroll, RichView, RVEdit,
  NFSRichViewEdit, Vcl.ExtCtrls, NFSRichViewtoolbar, Vcl.Menus, NFSRichviewPopUp,
  frxClass, frxRich;

type
  TForm1 = class(TForm)
    Toolbar: TNFSRichViewtoolbar;
    Rv: TNFSRichViewEdit;
    NFSRichviewPopUp1: TNFSRichviewPopUp;
    Report: TfrxReport;
    frxRichObject1: TfrxRichObject;
    procedure ToolbarPictureClick(Sender: TObject);
  private
    function GetRichView(aName: string): TfrxRichView;
    procedure SetRichViewText(aName, aValue: string); overload;
    procedure SetRichViewText(aRichView: TfrxRichView; aValue: string); overload;
    function RTFPrintText(aRTFString: string): string;
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  rvReport, rvStyle;

procedure TForm1.ToolbarPictureClick(Sender: TObject);
begin
  setRichviewText('rv', Rv.AsRTFString);
  Report.ShowReport;
//  ShowMessage('Bild');
end;



function TForm1.GetRichView(aName: string): TfrxRichView;
var
  x: TfrxComponent;
begin
  Result := nil;
  x := Report.FindObject(aName);
  if Assigned(x) then
  begin
    if x is TfrxRichView then
      Result := TfrxRichView(x);
  end;
end;


procedure TForm1.SetRichViewText(aName, aValue: string);
var
  RichView: TfrxRichView;
  NeuerText: string;
begin
  RichView := GetRichView(aName);
  if not Assigned(RichView) then
    exit;
  NeuerText :=RTFPrintText(aValue);
  SetRichViewText(Richview, NeuerText);
  //SetRichViewText(Richview, aValue);
end;

procedure TForm1.SetRichViewText(aRichView: TfrxRichView; aValue: string);
var
  List: TStringList;
  m   : TMemoryStream;
begin
  if not Assigned(aRichView) then
    exit;
  List := TStringList.Create;
  m    := TMemoryStream.Create;
  try
    List.Text := aValue; // Kann ein #$D#$A einfügen.
    List.SaveToStream(m);
    if (List.Text <> aValue) and (Copy(List.Text,  length(List.Text) -1, 2)=#$D#$A)  then
      m.Size := m.Size - Length(System.sLineBreak);
    m.Position := 0;
    aRichView.RichEdit.Lines.LoadFromStream(m);
  finally
    FreeAndNil(List);
    FreeAndNil(m);
  end;
end;

function TForm1.RTFPrintText(aRTFString: string): string;
var
  List: TStringList;
  m   : TMemoryStream;
  rh  : TRvReportHelper;
  rv  : TReportRichView;
  Style: TRvStyle;
begin
  rh    := TRvReportHelper.Create(Report);
  List  := TStringList.Create;
  m     := TMemoryStream.Create;
  Style := TRvStyle.Create(Self);
  try
    rv       := rh.RichView;
    rv.RTFReadProperties.TextStyleMode := rvrsAddIfNeeded;
    rv.RTFReadProperties.ParaStyleMode := rvrsAddIfNeeded;
    rv.RVFOptions := rv.RVFOptions + [rvfoSaveTextStyles];
    rv.RVFOptions := rv.RVFOptions + [rvfoSaveParaStyles];

    rv.RTFOptions := rv.RTFOptions - [rvrtfSaveJpegAsJpeg];

    // Da sich das Wordpad und somit auch FR unter Win8 anders verhält,
    // muss diese Abfrage sein.
    {
    if (GetWindowsVersion = wv_8) or (GetWindowsVersion = wv_8_1) then
      rv.RTFOptions := rv.RTFOptions + [rvrtfPNGInsteadOfBitmap]
    else
      rv.RTFOptions := rv.RTFOptions + [rvrtfSaveBitmapDefault];
    }

    rv.RTFOptions := rv.RTFOptions + [rvrtfSaveBitmapDefault];
    rv.Style := Style;

    // Load RTFString
    List.Text := aRTFString;
    m.Position := 0;
    List.SaveToStream(m);
    m.Position := 0;

    rh.Init(Self.Canvas, 800); // <-- Wenn man eine RTF Tabellen hat, dann ist es unbedingt notwendig das ein Canvas übergeben wird.

    rv.LoadRTFFromStream(m);

    m.Position := 0;
    rv.SaveRTFToStream(m, false);

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

end.
