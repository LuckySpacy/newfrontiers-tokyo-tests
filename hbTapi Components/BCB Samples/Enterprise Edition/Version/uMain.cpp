//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "uMain.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "hbTapi"
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormCreate(TObject *Sender)
{
  // Fill in the list box with all available telephony devices
  ComboBoxDevice->Items->Assign(hbTapiLine1->DeviceList);

  EditExtLowVersion->Text = "0x" + IntToHex((int)hbTapiLine1->TSP->ExtLowVersion, 8);
  EditExtHighVersion->Text = "0x" + IntToHex((int)hbTapiLine1->TSP->ExtHighVersion, 8);

  // Select the first device in the list
  hbTapiLine1->DeviceID = 0;
  if (ComboBoxDevice->Items->Count > 0)
  {
    ComboBoxDevice->ItemIndex = 0;
    // Try opening the TAPI device
    ComboBoxDeviceChange(NULL);
  };
}
//---------------------------------------------------------------------------
void __fastcall TForm1::ComboBoxDeviceChange(TObject *Sender)
{
  // Set the TapiLine->DeviceID; use the device selected in the list box
  hbTapiLine1->DeviceID = ComboBoxDevice->ItemIndex;
  if (hbTapiLine1->Available)
  {
    Label4->Caption = "0x" + IntToHex((int)hbTapiLine1->TSP->APIVersion,8);
    Label2->Caption = "0x" + IntToHex((int)hbTapiLine1->TSP->ExtensionID0, 8)
      + " 0x" + IntToHex((int)hbTapiLine1->TSP->ExtensionID1,8)
      + " 0x" + IntToHex((int)hbTapiLine1->TSP->ExtensionID2,8)
      + " 0x" + IntToHex((int)hbTapiLine1->TSP->ExtensionID3,8);
    Label5->Caption = IntToHex((int)hbTapiLine1->TSP->ExtVersion,8);
  }
  else
  {
    MessageDlg("Line device not available", mtError, TMsgDlgButtons() << mbOK,0);
  };
}
//---------------------------------------------------------------------------
void __fastcall TForm1::ButtonNogotiateClick(TObject *Sender)
{
  hbTapiLine1->TSP->ExtLowVersion  = StrToIntDef(EditExtLowVersion->Text,0);
  hbTapiLine1->TSP->ExtHighVersion = StrToIntDef(EditExtHighVersion->Text,0);
  Label5->Caption = "0x" + IntToHex((int)hbTapiLine1->TSP->ExtVersion,8);
}
//---------------------------------------------------------------------------
