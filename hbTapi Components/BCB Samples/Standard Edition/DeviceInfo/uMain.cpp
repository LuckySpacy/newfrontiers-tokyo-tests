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
void __fastcall TForm1::DetectRelatedDevice()
{
  int i;
  try
  {
    hbTapiLine1->Active == true;
  }
  catch (EhbTapiError &E)
  {
    Memo1->Lines->Add("  Error opening device. " + E.Message);
    return;
  }

  if (hbTapiLine1->Phones->Count == 0)
    Memo1->Lines->Add("  TAPI Phone Device == n/a");
  else
  {
    for (i=0;i<hbTapiLine1->Phones->Count;i++)
    {
      TapiPhone1->DeviceID = hbTapiLine1->Phones->DeviceID[i];
      Memo1->Lines->Add("  TAPI Phone Device ID == " + IntToStr(TapiPhone1->DeviceID));
      Memo1->Lines->Add("  TAPI Phone Device Name == " + TapiPhone1->DeviceName);
    }
  }

  if (!hbTapiLine1->WaveOut->Available)
    Memo1->Lines->Add("  Wave Play Device == n/a");
  else
    Memo1->Lines->Add("  Wave Play Device ID == " + IntToStr(hbTapiLine1->WaveOut->DeviceID));

  if (!hbTapiLine1->WaveIn->Available)
    Memo1->Lines->Add("  Wave Record Device == n/a");
  else
    Memo1->Lines->Add("  Wave Record Device ID == " + IntToStr(hbTapiLine1->WaveIn->DeviceID));
  hbTapiLine1->Active = false;
};

//---------------------------------------------------------------------------
void __fastcall TForm1::Button1Click(TObject *Sender)
{
  int i;
  Memo1->Lines->Clear();
  for (i=0;i<hbTapiLine1->DeviceList->Count;i++)
  {
    hbTapiLine1->DeviceID = i;
    Memo1->Lines->Add(Format("Device #%d - %s", ARRAYOFCONST((i, hbTapiLine1->DeviceName))));
    if (hbTapiLine1->Available)
    {
      Memo1->Lines->Add(Format("  MediaModes : %s", ARRAYOFCONST((LineMediaModesToStr(hbTapiLine1->Caps->MediaModes, ", ")))));
      Memo1->Lines->Add(Format("  BearerModes: %s", ARRAYOFCONST((LineBearerModesToStr(hbTapiLine1->Caps->BearerModes)))));
      DetectRelatedDevice();
    };
    Memo1->Lines->Add("");
  }
  if (Memo1->Lines->Count == 0)
    Memo1->Lines->Add("No devices found");
}
//---------------------------------------------------------------------------
