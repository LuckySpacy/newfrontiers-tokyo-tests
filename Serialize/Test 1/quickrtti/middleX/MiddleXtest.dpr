program MiddleXtest;

uses
  Forms,
  middletestu in 'middletestu.pas' {Form1},
  middlex in 'middlex.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
