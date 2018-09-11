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
 ComboBox_Line->Items->Assign(hbTapiLine1->DeviceList);
 ComboBox_Line->Items->Insert(0, "- none -");
 ComboBox_Line->ItemIndex = 0;

 ComboBox_Phone->Items->Insert(0, "- none -");
 ComboBox_Phone->ItemIndex = 0;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::TapiPhone1Display(TObject *Sender)
{
  Display->Lines->Text = TapiPhone1->Display->Text;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::ComboBox_LineChange(TObject *Sender)
{
int i;
String s;
  // If TapiLine is currently open then close it
  hbTapiLine1->Active      = False;
  TapiPhone1->Active     = False;
  TapiPhone1->DeviceID   = -1;
  ComboBox_Phone->Items->Clear();
  ComboBox_Phone->Items->Insert(0, "- none -");
  ComboBox_Phone->ItemIndex = 0;

  // Set TapiLine to use the device selected in the list box
  hbTapiLine1->DeviceID = ComboBox_Line->ItemIndex -1;
  if (hbTapiLine1->Available)
  {
    ListBox1->Items->Add("Line Device " + hbTapiLine1->DeviceName + " selected");
	if (hbTapiLine1->DeviceName.Pos("Modem") && (hbTapiLine1->Caps->MediaModes && (LINEMEDIAMODE_INTERACTIVEVOICE || LINEMEDIAMODE_DATAMODEM) > 0))
    {
      hbTapiLine1->MediaModes = LINEMEDIAMODE_DATAMODEM;
      // seems to be a modem, use only LINEMEDIAMODE_DATAMODEM to avoid errors
    }
    else if (hbTapiLine1->Caps->MediaModes && LINEMEDIAMODE_INTERACTIVEVOICE > 0)
    {
      hbTapiLine1->MediaModes = LINEMEDIAMODE_INTERACTIVEVOICE;
    }
    else if (hbTapiLine1->Caps->MediaModes && LINEMEDIAMODE_DATAMODEM > 0)
    {
      hbTapiLine1->MediaModes = LINEMEDIAMODE_DATAMODEM;
    }
    else
    {
      hbTapiLine1->MediaModes = 0; // try to use all supported media modes
    }
    try
    {
      hbTapiLine1->Active = True;
      ListBox1->Items->Add("Line Device " + hbTapiLine1->DeviceName + " active");
      if (hbTapiLine1->Phones->Count > 0)
      {
        for (i=0; i<hbTapiLine1->Phones->Count;i++)
          ComboBox_Phone->Items->Add(TapiPhone1->DeviceList->Strings[hbTapiLine1->Phones->DeviceID[i]]);
        if (ComboBox_Phone->Items->Count > 1)
        {
          ComboBox_Phone->ItemIndex = 1;
          DoSelectPhoneDevice(NULL);
        }
        else
          ComboBox_Phone->ItemIndex = 0;
      }
      else
      {
        Display->Lines->Clear();
        ListBox1->Items->Add(hbTapiLine1->DeviceName + " has not hone Devices");
      };
    }
    catch (EhbTapiError &E)
    {
      ListBox1->Items->Add(E.Message);
    };
  }
  else
    ListBox1->Items->Add(hbTapiLine1->DeviceName + " not available");
}
//---------------------------------------------------------------------------
void __fastcall TForm1::DoSelectPhoneDevice(TObject *Sender)
{
  // If TapiLine is currently open then close it
  TapiPhone1->Active = false;
  // Set TapiPhone to use the device selected in the list box
  TapiPhone1->DeviceID = ComboBox_Phone->ItemIndex -1;
  if (!TapiPhone1->Available)
    exit;
  ListBox1->Items->Add("Phone Device " + TapiPhone1->DeviceName + " selected");
  TapiPhone1->Privileges->Owner = TRUE;
  try
  {
    TapiPhone1->Active = true;
    ListBox1->Items->Add("Phone Device " + TapiPhone1->DeviceName + " active");
    if (TapiPhone1->Display->Available)
      ListBox1->Items->Add(Format("Display dimensions: %d x %d ", ARRAYOFCONST(((int)TapiPhone1->Display->NumRows, (int)TapiPhone1->Display->NumColumns))));
    else
      ListBox1->Items->Add("No Display available");
  }
  catch (EhbTapiError &E)
  {
    if (E.ErrorCode == PHONEERR_INVALPRIVILEGE)
    {
      try
      {
        TapiPhone1->Privileges->Owner = false;
        TapiPhone1->Active = true;
        ListBox1->Items->Add("Phone Device " + TapiPhone1->DeviceName + " active as Monitor");
      }
      catch (EhbTapiError &E)
      {
        ListBox1->Items->Add(E.Message);
      };
    }
    else
      ListBox1->Items->Add(E.Message);
  };
}
//---------------------------------------------------------------------------
