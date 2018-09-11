program Log;

uses
  Vcl.Forms,
  u_Log in 'u_Log.pas' {Form1},
  o_LogObj in 'o_LogObj.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
