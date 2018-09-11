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
  hbTapiWave, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    hbWaveOut1: ThbWaveOut;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ListBox1: TListBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Button7: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure WaveOut1WaveError(Sender: TObject; ErrorCode: Cardinal;
      ErrorText: String);
    procedure WaveOut1Done(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure WaveIn1Done(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin
  hbWaveOut1.Active := False;
  hbWaveOut1.PlayList.Clear;
  hbWaveOut1.PlayList.add('Beep(1000,200)');
  hbWaveOut1.PlayList.add('Silence(100)');
  hbWaveOut1.PlayList.add('Beep(1000,200)');
  hbWaveOut1.PlayList.add('Silence(100)');
  hbWaveOut1.PlayList.add('Beep(1000,200)');
  hbWaveOut1.Active := True;
  Listbox1.items.add('playing ' + hbWaveOut1.PlayList.CommaText + '...');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  hbWaveOut1.Active := False;
  hbWaveOut1.PlayList.Clear;
  hbWaveOut1.PlayList.add('1.wav');
  hbWaveOut1.PlayList.add('2.wav');
  hbWaveOut1.PlayList.add('3.wav');
  hbWaveOut1.Active := True;
  Listbox1.items.add('playing ' + hbWaveOut1.PlayList.CommaText + '...');
end;

procedure TForm1.WaveOut1WaveError(Sender: TObject; ErrorCode: Cardinal;
  ErrorText: String);
begin
  Listbox1.items.add('::OnWave.OnError '+ ErrorText);
end;

procedure TForm1.WaveOut1Done(Sender: TObject);
begin
  Listbox1.items.add('::OnWaveOut.OnDone');
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  hbWaveOut1.Active := False;
  hbWaveOut1.PlayList.Clear;
  hbWaveOut1.PlayList.add(Format('%d.wav',[TSpeedButton(Sender).Tag]));
  hbWaveOut1.Active := True;
  Listbox1.items.add('playing ' + hbWaveOut1.PlayList.CommaText + '...');
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  hbWaveOut1.Active := False;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  hbWaveOut1.Active := False;
  hbWaveOut1.PlayList.Clear;
  hbWaveOut1.Active := True;
  Listbox1.items.add('playing ' + hbWaveOut1.PlayList.CommaText + '...');
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  hbWaveOut1.Active := False;
  hbWaveOut1.PlayList.Clear;
  hbWaveOut1.PlayList.add('');
  hbWaveOut1.Active := True;
  Listbox1.items.add('playing ' + hbWaveOut1.PlayList.CommaText + '...');
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  hbWaveOut1.Active := False;
  hbWaveOut1.PlayList.Clear;
  hbWaveOut1.PlayList.add('error.wav');
  hbWaveOut1.Active := True;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ComboBox1.Items.Assign(hbWaveOut1.DeviceList);
  ComboBox1.Items.Insert(0, '- none -');
  ComboBox1.ItemIndex := ComboBox1.Items.IndexOf(hbWaveOut1.DeviceName);
  if ComboBox1.ItemIndex = -1 then
    ComboBox1.ItemIndex := 0;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  hbWaveOut1.Active   := False;
  hbWaveOut1.DeviceID := ComboBox1.ItemIndex -1;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  Listbox1.items.add(Format('DeviceName= %s, DeviceID= %d', [hbWaveOut1.DeviceName, hbWaveOut1.DeviceID]));
end;

procedure TForm1.WaveIn1Done(Sender: TObject);
begin
  Listbox1.items.add('::OnWaveIn.OnDone');
end;

end.
