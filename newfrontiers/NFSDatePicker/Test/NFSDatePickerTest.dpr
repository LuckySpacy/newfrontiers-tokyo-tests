program NFSDatePickerTest;

uses
  Vcl.Forms,
  uNFSDatePickerTest in 'uNFSDatePickerTest.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
