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
    GroupBox1: TGroupBox;
    Label_LocationName: TLabel;
    Button1: TButton;
    Button2: TButton;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Button3: TButton;
    ListBox1: TListBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label_PermanentLocationID: TLabel;
    Label_CountryID: TLabel;
    Label_CountryCode: TLabel;
    Label_CountryName: TLabel;
    Label_LocalAccessCode: TLabel;
    Label_LongDistanceAccessCode: TLabel;
    Label2: TLabel;
    Label_CityCode: TLabel;
    Button4: TButton;
    hbTapiLine1: ThbTapiLine;
    GroupBox3: TGroupBox;
    Edit1: TEdit;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DoUpdateSystemLocation(Sender: TObject);
    procedure DoUpdateLocations(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure hbTapiLine1TapiTranslateChange(Sender: TObject);
  private
    FLocationList   : ThbTapiLocationList;
    procedure UpdateSystemLocation;
    procedure UpdateLocations;
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  FLocationList   := ThbTapiLocationList.Create;
//  hbTapiLine1.DeviceID := 0;  // we have to select a device to change the location
  hbTapiLine1.Enabled := True;
  UpdateSystemLocation;
  UpdateLocations;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FLocationList.Free;
end;

procedure TForm1.UpdateSystemLocation;
begin
  with hbTapiLine1.Location do
  begin
    Label_LocationName.Caption            := LocationName;
    Label_PermanentLocationID.Caption     := IntToStr(LocationID);
    Label_CountryID.Caption               := IntToStr(CountryID);
    Label_CountryName.Caption             := CountryName;
    Label_CountryCode.Caption             := CountryCode;
    Label_LocationName.Caption            := LocationName;
    Label_CityCode.Caption                := CityCode;
    Label_LocalAccessCode.Caption         := LocalAccessCode;
    Label_LongDistanceAccessCode.Caption  := LongDistanceAccessCode;
  end;
end;

procedure TForm1.UpdateLocations;
var i: integer; s: String;
begin
  ListBox1.Items.Clear;
  with FLocationList do
  try
    Update;
    for i := 0 to Count-1 do
    begin
      s := Items[i].LocationName + ', ID=' + IntToStr(Items[i].LocationID);
      if Items[i].LocationID = CurrentLocationID then
        s := s + ', CurrentLocation';
      ListBox1.Items.AddObject(s, TObject(Items[i].LocationID));
    end;
  except
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  with hbTapiLine1 do
  begin
    TranslateDialog(Edit1.Text, Handle);
    UpdateSystemLocation;
    UpdateLocations;
  end;
end;

procedure TForm1.DoUpdateSystemLocation(Sender: TObject);
begin
  try
    hbTapiLine1.Location.Update;
    UpdateSystemLocation;
  except
  end;  
end;

procedure TForm1.DoUpdateLocations(Sender: TObject);
begin
  UpdateLocations;
end;

procedure TForm1.Button4Click(Sender: TObject);
var i: integer;
begin
  i := ListBox1.ItemIndex;
  if i >= 0 then
    hbTapiLine1.Location.LocationID := DWord(ListBox1.Items.Objects[i]);
  UpdateSystemLocation;
  UpdateLocations;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  MessageDlg('Dialable address: ' + hbTapiLine1.TranslateAddress(Edit1.Text), mtInformation, [mbOK], 0);
end;

procedure TForm1.hbTapiLine1TapiTranslateChange(Sender: TObject);
begin
  MessageDlg('TAPI Translate Caps changed', mtInformation, [mbOK], 0);
  UpdateSystemLocation;
  UpdateLocations;
end;

end.
