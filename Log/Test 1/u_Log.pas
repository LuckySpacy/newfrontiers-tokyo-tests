unit u_Log;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, o_logObj, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    fLogObj: TLogObj;
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  fLogObj.Write('Das ist ein Test');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  //fLogObj := TLogObj.Create(ExtractFilePath(ParamStr(0)), 'Log.txt', 104000000);
  fLogObj := TLogObj.Create(ExtractFilePath(ParamStr(0)), 'Log.txt', 104);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fLogObj);
end;

end.
