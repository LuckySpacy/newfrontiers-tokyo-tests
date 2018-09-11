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
  ComboBox_Device->Items->Assign(hbTapiLine1->DeviceList);
  if (ComboBox_Device->Items->Count > 0)
    ComboBox_Device->ItemIndex = 0;
  ComboBox_DeviceChange(ComboBox_Device);
  ComboBox_Options->ItemIndex = 0;

}
//---------------------------------------------------------------------------

void __fastcall TForm1::ComboBox_DeviceChange(TObject *Sender)
{
  hbTapiLine1->DeviceID = ComboBox_Device->ItemIndex;
  ComboBox_PhoneNo->Enabled = hbTapiLine1->Available;
  ComboBox_Options->Enabled = hbTapiLine1->Available;

}

//---------------------------------------------------------------------------
void __fastcall TForm1::Button_TranslateDialogClick(TObject *Sender)
{
  hbTapiLine1->TranslateDialog(ComboBox_PhoneNo->Text, Handle);
}

//---------------------------------------------------------------------------
void __fastcall TForm1::Button_TranslateAddressClick(TObject *Sender)
{
  unsigned o;
  switch (ComboBox_PhoneNo->ItemIndex) {
    case 1 :
      o = LINETRANSLATEOPTION_CARDOVERRIDE;
      break;
    case 2 :
      o = LINETRANSLATEOPTION_CANCELCALLWAITING;
      break;
    case 3 :
      o = LINETRANSLATEOPTION_FORCELOCAL;
      break;
    case 4 :
      o = LINETRANSLATEOPTION_FORCELD;
      break;
    default :
     o = 0;
  }
  MessageDlg(hbTapiLine1->TranslateAddress(ComboBox_PhoneNo->Text, o), mtInformation, TMsgDlgButtons() << mbOK, 0);

}
//---------------------------------------------------------------------------
