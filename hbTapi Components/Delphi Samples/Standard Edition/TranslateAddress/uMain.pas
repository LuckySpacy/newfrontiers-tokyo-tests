{-------------------------------------------------------------------------
   Copyright by Haeger + Busch, Germany                / >>>>>>>>> /-----
   Ingenieurbuero fuer Kommunikationslösungen         / <<<<<<<<< /
 ----------------------------------------------------/ >>>>>>>>> /
   Homepage  : http://www.hbTapi.com
   EMail     : info@hbTapi.com
   Package   : hbTapi Components
 -------------------------------------------------------------------------}

unit uMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, hbtapi,
  StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    hbTapiLine1: ThbTapiLine;
    GroupBox3: TGroupBox;
    Edit1: TEdit;
    Button5: TButton;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  ComboBox1.Items.Assign(hbTapiLine1.DeviceList);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  if hbTapiLine1.Available then
    MessageDlg('Dialable address: ' + hbTapiLine1.TranslateAddress(Edit1.Text), mtInformation, [mbOK], 0)
  else
    MessageDlg('No device selected/available', mtError, [mbOK], 0);
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  hbTapiLine1.DeviceID := ComboBox1.ItemIndex;
end;

end.
