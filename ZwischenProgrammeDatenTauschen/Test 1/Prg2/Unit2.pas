unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Objekt.Prg2CopyData;



type
  Tfrm_Prg2 = class(TForm)
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    fPrg2CopyData: TPrg2CopyData;
    //procedure WMCopyData(var Msg: TWMCopyData); message WM_COPYDATA;
  public
  end;

var
  frm_Prg2: Tfrm_Prg2;

implementation

{$R *.dfm}

{ TForm2 }

{
procedure Tfrm_Prg2.WMCopyData(var Msg: TWMCopyData);
var
  i1: Integer;
  sText: array[0..99] of Char;
begin
  for i1 := 0 to 99 do
    sText[i1] := ' ';
  // generate text from parameter
  // anzuzeigenden Text aus den Parametern generieren
  StrLCopy(sText, Msg.CopyDataStruct.lpData, Msg.CopyDataStruct.cbData);
  // write received text
  // Empfangenen Text ausgeben
  label1.Caption := sText;
end;
}


{
procedure Tfrm_Prg2.WMCopyData(var Msg: TWMCopyData);
var
  p : PCopyDataStruct;
  s : UTF8String;
begin
   p := PCopyDataStruct(Msg.CopyDataStruct);
  if (p <> nil) then
  begin
    SetString(s, PAnsiChar(p^.lpData), p^.cbData);
    Label1.Caption := String(s);
  end
  else
  inherited;
end;
}

procedure Tfrm_Prg2.FormCreate(Sender: TObject);
begin
  fPrg2CopyData := TPrg2CopyData.Create(Self);
end;

procedure Tfrm_Prg2.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fPrg2CopyData);
end;

{

procedure Tfrm_Prg2.WMCopyData(var Msg: TWMCopyData);
var
  s : UTF8String;
begin
  if (Msg.CopyDataStruct <> nil) and (Msg.CopyDataStruct.dwData = 1) then
  begin
    SetString(s, PAnsiChar(Msg.CopyDataStruct.lpData), Msg.CopyDataStruct.cbData);
    Label1.Caption := String(s);
  end
  else
  inherited;
end;
}

end.
