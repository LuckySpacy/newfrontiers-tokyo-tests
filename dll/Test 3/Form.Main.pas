unit Form.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TTest1DLL = procedure(aStrValue: string; aInt: Integer); StdCall;
  TTestIntDLL = procedure(aZahl: Integer); StdCall;
  TTestFormDLL = procedure(aCaption:String); StdCall;
  TAddierenDLL = function (aZahl1, aZahl2: Integer): Integer; StdCall;

type
  Tfrm_Main = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    fDLLPath: string;
    fTest1DLLHandle: THandle;
    fTest1DLL: TTest1DLL;
    fTestIntDLL: TTestIntDLL;
    fTestFormDLL: TTestFormDLL;
  public
  end;

var
  frm_Main: Tfrm_Main;

implementation

{$R *.dfm}



procedure Tfrm_Main.Button2Click(Sender: TObject);
var
  dllHandle: THandle;
  fTestAddieren: TAddierenDLL;
  Ergebnis: Integer;
begin
  dllHandle  := LoadLibrary(PChar(fDLLPath + 'TestDLL2.dll'));
  fTestAddieren  := GetProcAddress(dllHandle, 'addieren');
  Ergebnis := fTestAddieren(1,2);
  Caption := IntToStr(Ergebnis);
  FreeLibrary(dllHandle);
end;

procedure Tfrm_Main.FormCreate(Sender: TObject);
begin //
  fDLLPath := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
end;

procedure Tfrm_Main.Button1Click(Sender: TObject);
var
  i: Integer;
begin
  fTest1DLLHandle  := LoadLibrary(PChar(fDLLPath + 'TestDLL.dll'));
  fTestFormDLL      := GetProcAddress(fTest1DLLHandle, 'ShowForm');
  fTestIntDLL      := GetProcAddress(fTest1DLLHandle, 'TestInt');
  //fTest1DLL        := GetProcAddress(fTest1DLLHandle, 'Test1');
  //fTest1Dll('Hurra es funktioniert', 10);
  i := 101;
  fTestIntDLL(i);
  fTestFormDLL('Test');
  FreeLibrary(fTest1DLLHandle);
end;


end.
