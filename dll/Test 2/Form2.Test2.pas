unit Form2.Test2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, AdvEdit, frame.Test2,
  Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    procedure FormCreate(Sender: TObject);
  private
    fFrame1: TFrame;
  public
    { Public-Deklarationen }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
begin
  fFrame1 := TFrame1.Create(Self);
  fFrame1.Parent := Panel1;
  fFrame1.Align  := alClient;
end;

end.
