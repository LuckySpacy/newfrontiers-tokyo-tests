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

void __fastcall TForm1::FormCreate(TObject *Sender)
{
  FLocationList = new ThbTapiLocationList();
  hbTapiLine1->DeviceID = 0;  // we have to select a device to change the location
  UpdateSystemLocation();
  UpdateLocations();

}
//---------------------------------------------------------------------------

void __fastcall TForm1::UpdateLocations()
{
  int i; String s;
  ListBox1->Items->Clear();
  FLocationList->Update();
  for (i=0;i<FLocationList->Count;i++)
  {
    s = FLocationList->Items[i]->LocationName + ", ID=" + IntToStr((int)FLocationList->Items[i]->LocationID);
    if (FLocationList->Items[i]->LocationID == FLocationList->CurrentLocationID)
      s = s + ", CurrentLocation";
    ListBox1->Items->AddObject(s, (TObject*)FLocationList->Items[i]->LocationID);
  }
}

void __fastcall TForm1::UpdateSystemLocation()
{
    Label_LocationName->Caption            = hbTapiLine1->Location->LocationName;
	Label_PermanentLocationID->Caption     = IntToStr((int)hbTapiLine1->Location->LocationID);
    Label_CountryID->Caption               = IntToStr((int)hbTapiLine1->Location->CountryID);
    Label_CountryName->Caption             = hbTapiLine1->Location->CountryName;
    Label_CountryCode->Caption             = hbTapiLine1->Location->CountryCode;
    Label_LocationName->Caption            = hbTapiLine1->Location->LocationName;
    Label_CityCode->Caption                = hbTapiLine1->Location->CityCode;
    Label_LocalAccessCode->Caption         = hbTapiLine1->Location->LocalAccessCode;
    Label_LongDistanceAccessCode->Caption  = hbTapiLine1->Location->LongDistanceAccessCode;
}

//---------------------------------------------------------------------------
void __fastcall TForm1::Button1Click(TObject *Sender)
{
  hbTapiLine1->TranslateDialog(Edit1->Text, Handle);
  UpdateSystemLocation();
  UpdateLocations();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::FormDestroy(TObject *Sender)
{
  delete FLocationList;

}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button2Click(TObject *Sender)
{
  try
  {
    hbTapiLine1->Location->Update();
    UpdateSystemLocation();
  }
  catch (...)
  {
  }
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button4Click(TObject *Sender)
{
  int i;
  i = ListBox1->ItemIndex;
  if (i >= 0)
    hbTapiLine1->Location->LocationID = (unsigned) ListBox1->Items->Objects[i];
  UpdateSystemLocation();
  UpdateLocations();

}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button5Click(TObject *Sender)
{
  MessageDlg("Dialable address: " + hbTapiLine1->TranslateAddress(Edit1->Text, 0), mtInformation, TMsgDlgButtons() << mbOK, 0);

}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button3Click(TObject *Sender)
{
  UpdateLocations();

}
//---------------------------------------------------------------------------

