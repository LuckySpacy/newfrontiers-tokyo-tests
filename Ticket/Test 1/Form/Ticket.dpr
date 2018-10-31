program Ticket;

uses
  Vcl.Forms,
  frm_Ticket in 'frm_Ticket.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
