program Project13;

uses
  Vcl.Forms,
  Unit17 in 'Unit17.pas' {Form17},
  o_zpl in 'o_zpl.pas',
  o_BinConverter in 'o_BinConverter.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm17, Form17);
  Application.Run;
end.
