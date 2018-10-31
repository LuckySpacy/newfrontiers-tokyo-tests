program MakeBmpTransparent;

uses
  Vcl.Forms,
  Form.MakeBmpTransparent in 'Form.MakeBmpTransparent.pas' {fra_MakeBMPTransparent};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfra_MakeBMPTransparent, fra_MakeBMPTransparent);
  Application.Run;
end.
