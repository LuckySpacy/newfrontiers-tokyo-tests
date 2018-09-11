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
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  hbTapi, hbTapiUtils, hbTapiApi, ExtCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    hbTapiLine1: ThbTapiLine;
    TapiPhone1: ThbTapiPhone;
    RadioGroupType: TRadioGroup;
    procedure RadioGroupTypeClick(Sender: TObject);
  private
    { Private declarations }
    procedure DetectRelatedDevice;
    procedure DetectDevices;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.DetectDevices;
var i: Integer;
begin
  Memo1.Lines.Clear;
  for i := 0 to hbTapiLine1.DeviceList.Count - 1 do
  begin
    hbTapiLine1.DeviceID := i;

    if hbTapiLine1.Available then
    begin
      case RadioGroupType.ItemIndex of
        0 : // All
        begin
          Memo1.Lines.Add('Device #' + IntToStr(i) + ' ' + hbTapiLine1.DeviceName);
          Memo1.Lines.Add('MediaModes : ' + LineMediaModesToStr(hbTapiLine1.Caps.MediaModes));
          Memo1.Lines.Add('BearerModes: ' + LineBearerModesToStr(hbTapiLine1.Caps.BearerModes));
          Memo1.Lines.Add('Provider: ' + hbTapiLine1.Caps.ProviderInfo);
          Memo1.Lines.Add('');
        end;
        1 : // Data
        begin
          if (((hbTapiLine1.Caps.BearerModes and LINEBEARERMODE_DATA) <> 0) or
              ((hbTapiLine1.Caps.BearerModes and LINEBEARERMODE_PASSTHROUGH) <> 0)) and
                ((hbTapiLine1.Caps.MediaModes and LINEMEDIAMODE_DATAMODEM) <> 0) then
          begin
            Memo1.Lines.Add('Device #' + IntToStr(i) + ' ' + hbTapiLine1.DeviceName);
            Memo1.Lines.Add(#9 + 'MaxRate: ' + IntToStr(hbTapiLine1.Caps.MaxRate));
            Memo1.Lines.Add('');
          end;
        end;
        2 : // Fax
        begin
          if (((hbTapiLine1.Caps.BearerModes and LINEBEARERMODE_DATA) <> 0) or
             ((hbTapiLine1.Caps.BearerModes and LINEBEARERMODE_PASSTHROUGH) <> 0)) and
             (((hbTapiLine1.Caps.MediaModes and LINEMEDIAMODE_G3FAX) <> 0) or
             ((hbTapiLine1.Caps.MediaModes and LINEMEDIAMODE_G4FAX) <> 0)) then
          begin
            Memo1.Lines.Add('Device #' + IntToStr(i) + ' ' + hbTapiLine1.DeviceName);
            if ((hbTapiLine1.Caps.MediaModes and LINEMEDIAMODE_G3FAX) <> 0) Then
              Memo1.Lines.Add(#9 + 'Group 3 Fax');
            if ((hbTapiLine1.Caps.MediaModes and LINEMEDIAMODE_G4FAX) <> 0) Then
              Memo1.Lines.Add(#9 + 'Group 4 Fax');
            Memo1.Lines.Add(#9 + 'MaxRate: ' + IntToStr(hbTapiLine1.Caps.MaxRate));
            Memo1.Lines.Add('');
          end;
        end;
        3: // Voice
        begin
          if ((hbTapiLine1.Caps.BearerModes and LINEBEARERMODE_VOICE) <> 0) and
              (((hbTapiLine1.Caps.MediaModes and LINEMEDIAMODE_INTERACTIVEVOICE) <> 0) or
              ((hbTapiLine1.Caps.MediaModes and LINEMEDIAMODE_AUTOMATEDVOICE) <> 0)) then
          begin
            Memo1.Lines.Add('Device #' + IntToStr(i) + ' ' + hbTapiLine1.DeviceName);
            DetectRelatedDevice;
            Memo1.Lines.Add('');
          end;
        end;
      end;
    end;
  end;
  if Memo1.Lines.Count = 0 then
    Memo1.Lines.Add('No devices found');
end;


procedure TForm1.DetectRelatedDevice;
var i: integer;
begin
  try
    hbTapiLine1.Active := True;
  except
    on E:EhbTapiError do
    begin
      Memo1.Lines.Add('  Error opening device = ' + E.Message);
      exit;
    end;
  end;

  if hbTapiLine1.Phones.Count = 0 then
    Memo1.Lines.Add('  TAPI Phone Device = n/a')
  else
  begin
    for i := 0 to hbTapiLine1.Phones.Count -1 do
    begin
      TapiPhone1.DeviceID := hbTapiLine1.Phones.DeviceID[i];
      Memo1.Lines.Add('  TAPI Phone Device ID = ' + IntToStr(TapiPhone1.DeviceID));
      Memo1.Lines.Add('  TAPI Phone Device Name = ' + TapiPhone1.DeviceName);
    end;
  end;

  if not hbTapiLine1.WaveOut.Available then
    Memo1.Lines.Add('  Wave Play Device = n/a')
  else
    Memo1.Lines.Add('  Wave Play Device ID = ' + IntToStr(hbTapiLine1.WaveOut.DeviceID));

  if not hbTapiLine1.WaveIn.Available then
    Memo1.Lines.Add('  Wave Record Device = n/a')
  else
    Memo1.Lines.Add('  Wave Record Device ID = ' + IntToStr(hbTapiLine1.WaveIn.DeviceID));
  hbTapiLine1.Active := False;
end;

procedure TForm1.RadioGroupTypeClick(Sender: TObject);
begin
  DetectDevices;
end;

end.
