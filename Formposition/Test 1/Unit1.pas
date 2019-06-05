unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    function AufWelchemMonitorIstDieForm: Integer;
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.Button1Click(Sender: TObject);
var
  i1: Integer;
begin
  Memo1.Clear;
  for i1 := 0 to Screen.MonitorCount -1 do
  begin
    Memo1.Lines.Add('Monitor ' + IntToStr(i1+1));
    Memo1.Lines.Add('Left   = ' + IntToStr(Screen.Monitors[i1].Left));
    Memo1.Lines.Add('Width  = ' + IntToStr(Screen.Monitors[i1].Width));
    Memo1.Lines.Add('Top    = ' + IntToStr(Screen.Monitors[i1].Top));
    Memo1.Lines.Add('Height = ' + IntToStr(Screen.Monitors[i1].Height));
    Memo1.Lines.Add('');
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin //
  Caption := 'Die Form ist auf dem ' + IntToStr(AufWelchemMonitorIstDieForm)+ '. Monitor';
end;


function TForm1.AufWelchemMonitorIstDieForm: Integer;
var
  i1: Integer;
  Von: Integer;
  Bis: Integer;
  FormPos: Integer;
begin
  Result := 0;
  FormPos := trunc(Left + (Width div 2));
  if FormPos < 0 then
  begin
    Result := 1;
    exit;
  end;
  for i1 := 0 to Screen.MonitorCount -1 do
  begin
    Von := Screen.Monitors[i1].Left;
    Bis := Von + Screen.Monitors[i1].Width;
    if (FormPos >= Von) and (FormPos <= Bis) then
    begin
      Result := i1+1;
      exit;
    end;
  end;
end;


end.
