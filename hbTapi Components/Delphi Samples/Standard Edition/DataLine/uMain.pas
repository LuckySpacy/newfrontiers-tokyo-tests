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
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, hbData, hbTapi, hbTapiUtils;

type
  TForm1 = class(TForm)
    ComboBox1: TComboBox;
    Button1: TButton;
    hbTapiLine1: ThbTapiLine;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    DataLine1: ThbDataLine;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    FDataLine : ThbDataLine;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  FDataLine := ThbDataLine.Create(self);
  FDataLine.Privileges.AutoSelect := TRUE;
  Combobox1.Items.Assign(FDataLine.DeviceList);
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  FDataLine.DeviceName := Combobox1.Text;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  FDataLine.MakeCall('102');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  FDataLine.Active := TRUE;
  Label1.caption:= LineCallPrivilegesToStr(FDataLine.Privileges.Value, '+');
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  FDataLine.Active := FALSE;
end;

end.
