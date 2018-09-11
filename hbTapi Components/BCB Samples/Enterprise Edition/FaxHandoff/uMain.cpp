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
  hbTapiLine1->Privileges->AutoSelect = false;
  hbTapiLine1->Privileges->Monitor = true;
  hbTapiLine1->Privileges->Owner = true;
  ComboBoxDevice->Items->Assign(hbTapiLine1->DeviceList);
  if (ComboBoxDevice->Items->Count > 0 )
    ComboBoxDevice->ItemIndex = 0;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::CheckBoxActiveClick(TObject *Sender)
{
  if (!CheckBoxActive->Checked)
  {
    if (hbTapiLine1->Active )
    {
      hbTapiLine1->Active = false;
      ListBox1->Items->Add("hbTapiLine1->Active = false");
    }
  }
  else
  {
    if (!hbTapiLine1->Active )
    {
      hbTapiLine1->Privileges->AutoSelect = false;
      hbTapiLine1->Privileges->Owner = true; // we want to be the owner of inbound calls
      hbTapiLine1->Privileges->Monitor = true;  // we want to see all calls
      hbTapiLine1->MediaModes = 0; // all supported media modes
      try
      {
        hbTapiLine1->Active = true;
      }
      catch (EhbTapiError &E)
      {
        if (E.ErrorCode == LINEERR_INVALMEDIAMODE)
        {
          hbTapiLine1->MediaModes = LINEMEDIAMODE_DATAMODEM;
          hbTapiLine1->Active = true;
        }
      }
      ListBox1->Items->Add("hbTapiLine1->Active = true");
    };
  };
  CheckBoxActive->Checked = hbTapiLine1->Active;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::ComboBoxDeviceChange(TObject *Sender)
{
  if (hbTapiLine1->Active)
  {
    CheckBoxActive->Checked = false;
    hbTapiLine1->Active = false;
    ListBox1->Items->Add("hbTapiLine1->Active = false");
  }

  ListBox1->Items->Add("hbTapiLine1->DeviceID = " + IntToStr(ComboBoxDevice->ItemIndex));
  hbTapiLine1->DeviceID = ComboBoxDevice->ItemIndex;

  if (!hbTapiLine1->Available)
    ListBox1->Items->Add("Device not available!");
}
//---------------------------------------------------------------------------
void __fastcall TForm1::ButtonAnswerClick(TObject *Sender)
{
  ListBox1->Items->Add("Call->Answering()");
  if (hbTapiLine1->Calls->Count > 0 )
  {
    try
    {
      hbTapiLine1->Calls->Items[0]->Answer("");
    }
    catch (Exception &E)
    {
      ListBox1->Items->Add("Error = " + E.Message);
    };
  }
  else
    ListBox1->Items->Add("No Call");

}
//---------------------------------------------------------------------------
void __fastcall TForm1::ButtonHangupClick(TObject *Sender)
{
  ListBox1->Items->Add("Call->Drop()");
  if (hbTapiLine1->Calls->Count > 0 )
  {
    try
    {
      hbTapiLine1->Calls->Items[0]->Drop("");
    }
    catch (Exception &E)
    {
      ListBox1->Items->Add("Error = " + E.Message);
    };
  }
  else
    ListBox1->Items->Add("No Call");
}

//---------------------------------------------------------------------------
void __fastcall TForm1::hbTapiLine1Connected(ThbTapiLine *Sender,
      ThbTapiCall *Call)
{
  ListBox1->Items->Add("::OnConnected");
  if ((Call->Features & LINECALLFEATURE_MONITORMEDIA) == 0)
  {
    ListBox1->Items->Add("MonitorMedia is not supported. We try it anyway.");
  }
  try
  {
    ListBox1->Items->Add("Call->MonitorMedia->MediaModes = LINEMEDIAMODE_G3FAX");
    ListBox1->Items->Add("Call->MonitorMedia->Active = true");
    Call->MonitorMedia->MediaModes = LINEMEDIAMODE_G3FAX;
    Call->MonitorMedia->Active = true;
  }
  catch (Exception &E)
  {
    ListBox1->Items->Add("Error = " + E.Message);
  };
}
//---------------------------------------------------------------------------
void __fastcall TForm1::hbTapiLine1MediaMode(ThbTapiLine *Sender,
      ThbTapiCall *Call)
{
  ListBox1->Items->Add("ThbTapiLine->OnMediaMode");
  if ((Call->MediaMode & LINEMEDIAMODE_G3FAX) == 0)
    ListBox1->Items->Add("MediaMode != LINEMEDIAMODE_G3FAX");
  else
  {
    ListBox1->Items->Add("MediaMode == LINEMEDIAMODE_G3FAX");
    ListBox1->Items->Add("Call->HandOff(EditApplication->Text)");
    try
    {
      Call->HandOff(EditApplication->Text);
    }
    catch (Exception &E)
    {
      ListBox1->Items->Add("Error = " + E.Message);
    };
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::hbTapiLine1CallState(ThbTapiLine *Sender,
      ThbTapiCall *Call, DWORD CallState)
{
  ListBox1->Items->Add("Call->State == " + Call->StateText());
}
//---------------------------------------------------------------------------
