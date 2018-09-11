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
  StdCtrls, hbTapiApi, hbTapi;

type
  TForm1 = class(TForm)
    hbTapiLine1: ThbTapiLine;
    TapiPhone1: ThbTapiPhone;
    GroupBox1: TGroupBox;
    ComboBox_Line: TComboBox;
    ComboBox_Phone: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    Display: TMemo;
    ListBox1: TListBox;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label_Column: TLabel;
    Edit_Row: TEdit;
    Edit_Column: TEdit;
    Edit_Text: TEdit;
    Button1: TButton;
    procedure DoSelectLineDevice(Sender: TObject);
    procedure DoSelectPhoneDevice(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TapiPhone1Display(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.DoSelectLineDevice(Sender: TObject);
var i: integer;
begin
  // If TapiLine is currently open then close it
  hbTapiLine1.Active      := False;
  TapiPhone1.Active     := False;
  TapiPhone1.DeviceID   := -1;
  ComboBox_Phone.Items.Clear;
  ComboBox_Phone.Items.Insert(0, '- none -');
  ComboBox_Phone.ItemIndex := 0;

  // Set TapiLine to use the device selected in the list box
  hbTapiLine1.DeviceID := ComboBox_Line.ItemIndex -1;
  if hbTapiLine1.Available then
  begin
    Listbox1.items.add('Line Device ' + hbTapiLine1.DeviceName + ' selected');
    if (Pos('Modem', hbTapiLine1.DeviceName) > 0) and (hbTapiLine1.Caps.MediaModes and (LINEMEDIAMODE_INTERACTIVEVOICE or LINEMEDIAMODE_DATAMODEM) > 0) then
      hbTapiLine1.MediaModes := LINEMEDIAMODE_DATAMODEM
      // seems to be a modem, use only LINEMEDIAMODE_DATAMODEM to avoid errors
    else if hbTapiLine1.Caps.MediaModes and LINEMEDIAMODE_INTERACTIVEVOICE > 0 then
      hbTapiLine1.MediaModes := LINEMEDIAMODE_INTERACTIVEVOICE
    else if hbTapiLine1.Caps.MediaModes and LINEMEDIAMODE_DATAMODEM > 0 then
      hbTapiLine1.MediaModes := LINEMEDIAMODE_DATAMODEM
    else
      hbTapiLine1.MediaModes := 0; // try to use all supported media modes
    try      
      hbTapiLine1.Active := True;
      Listbox1.items.add('Line Device ' + hbTapiLine1.DeviceName + ' active');
      if hbTapiLine1.Phones.Count > 0 then
      begin
        for i := 0 to hbTapiLine1.Phones.Count-1 do
          ComboBox_Phone.Items.Add(TapiPhone1.DeviceList[hbTapiLine1.Phones.DeviceID[i]]);
        if ComboBox_Phone.Items.Count > 1  then
        begin
          ComboBox_Phone.ItemIndex := 1;
          DoSelectPhoneDevice(nil);
        end
        else
          ComboBox_Phone.ItemIndex := 0;
      end
      else
      begin
        Display.Lines.Clear;
        Listbox1.items.add(hbTapiLine1.DeviceName + ' has not hone Devices');
      end;
    except
      on E:EhbTapiError do
      begin
        Listbox1.items.add(E.Message);
      end;
    end;
  end
  else
    Listbox1.items.add(hbTapiLine1.DeviceName + ' not available');
end;

procedure TForm1.DoSelectPhoneDevice(Sender: TObject);
begin
  // If TapiLine is currently open then close it
  TapiPhone1.Active := False;
  // Set TapiPhone to use the device selected in the list box
  TapiPhone1.DeviceID         := ComboBox_Phone.ItemIndex -1;
  if not TapiPhone1.Available then
    exit;
  Listbox1.items.add('Phone Device ' + TapiPhone1.DeviceName + ' selected');
  TapiPhone1.Privileges.Owner := TRUE;
  try
    TapiPhone1.Active := True;
    Listbox1.items.add('Phone Device ' + TapiPhone1.DeviceName + ' active');
    if TapiPhone1.Display.Available then
      Listbox1.items.add(Format('Display dimensions: %d x %d ', [TapiPhone1.Display.NumRows, TapiPhone1.Display.NumColumns]))
    else
      Listbox1.items.add('No Display available');
  except
    on E:EhbTapiError do
    begin
      if E.ErrorCode = PHONEERR_INVALPRIVILEGE then
      try
        TapiPhone1.Privileges.Owner := FALSE;
        TapiPhone1.Active := True;
        Listbox1.items.add('Phone Device ' + TapiPhone1.DeviceName + ' active as Monitor');
      except
        on E:EhbTapiError do
        begin
          Listbox1.items.add(E.Message);
        end;
      end
      else
        Listbox1.items.add(E.Message);
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 ComboBox_Line.Items.Assign(hbTapiLine1.DeviceList);
 ComboBox_Line.Items.Insert(0, '- none -');
 ComboBox_Line.ItemIndex := 0;

 ComboBox_Phone.Items.Insert(0, '- none -');
 ComboBox_Phone.ItemIndex := 0;
end;

procedure TForm1.TapiPhone1Display(Sender: TObject);
begin
  Display.Lines.Text := TapiPhone1.Display.Text;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  TapiPhone1.Options.ReplyTimeout := 3000;
  TapiPhone1.SetDisplay(StrToIntDef(Edit_Row.Text, 0), StrToIntDef(Edit_Column.Text, 0), Edit_Text.Text);
end;

end.
