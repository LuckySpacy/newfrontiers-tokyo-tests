unit fntMailLesen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, O_MailLesen;

type
  Tfrm_MailLesen = class(TForm)
    edt_EMail: TEdit;
    edt_Passwort: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    StringGrid1: TStringGrid;
    btn_Aktual: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btn_AktualClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  frm_MailLesen: Tfrm_MailLesen;

implementation

{$R *.dfm}


procedure Tfrm_MailLesen.FormCreate(Sender: TObject);
begin
  edt_EMail.Text := 'thomas.bachmann.soznet@gmail.com';
  edt_Passwort.Text := 'lukastimo';
end;

procedure Tfrm_MailLesen.btn_AktualClick(Sender: TObject);
var
  MailLesen: TMailLesen;
begin
  MailLesen := TMailLesen.Create;
  try
    MailLesen.MeineEMail   := edt_EMail.Text;
    MailLesen.MeinPasswort := edt_Passwort.Text;
    MailLesen.UeberGMail;
  finally
    FreeAndNil(MailLesen);
  end;

end;


end.
