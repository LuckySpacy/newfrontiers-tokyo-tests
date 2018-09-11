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
  ComboBox1->Items->Assign(hbTapiLine1->DeviceList);

}

//---------------------------------------------------------------------------

void __fastcall TForm1::Button5Click(TObject *Sender)
{
  if (hbTapiLine1->Available)
    MessageDlg("Dialable address: " + hbTapiLine1->TranslateAddress(Edit1->Text,0), mtInformation, TMsgDlgButtons() << mbOK, 0);
  else
    MessageDlg("No device selected/available", mtError, TMsgDlgButtons() << mbOK, 0);

}
//---------------------------------------------------------------------------


void __fastcall TForm1::ComboBox1Change(TObject *Sender)
{
  hbTapiLine1->DeviceID = ComboBox1->ItemIndex;

}
//---------------------------------------------------------------------------

