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
  ComboBox_Phone->Items->Add("- none -");
  ComboBox_Phone->ItemIndex = 0;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::ComboBox_LineChange(TObject *Sender)
{
  int i;
  Label1->Caption = "";

  // if TapiLine is currently open then close it
  hbTapiLine1->Active = false;
  TapiPhone1->Active = false;
  TapiPhone1->DeviceName = "";
  ComboBox_Phone->Items->Clear();
  ComboBox_Phone->Items->Add("- none -");
  ComboBox_Phone->ItemIndex = 0;

  // Set TapiLine; use the device selected in the list box
  hbTapiLine1->DeviceID = ComboBox_Line->ItemIndex-1;

  if (hbTapiLine1->Available)
  try
  {
    hbTapiLine1->Active = true;
    ListBox1->Items->Add("Line Device is active (open)");
    ListBox1->Items->Add("Extention Version = " + IntToHex((int)TapiPhone1->TSP->ExtVersion,8));
    if (hbTapiLine1->Phones->Count > 0)
    {
      ComboBox_Phone->Items->Clear();
      for (i=0;i<hbTapiLine1->Phones->Count;i++)
        ComboBox_Phone->Items->Add(TapiPhone1->DeviceList->Strings[hbTapiLine1->Phones->DeviceID[i]]);
      ComboBox_Phone->Items->Insert(0, "- none -");
      if (ComboBox_Phone->Items->Count > 0)
        ComboBox_Phone->ItemIndex = 1;
      else
        ComboBox_Phone->ItemIndex = 0;
      ComboBox_PhoneChange(NULL);
    }
    else
    {
      Memo1->Lines->Clear();
      ListBox1->Items->Add(hbTapiLine1->DeviceName + " has not hone Devices");
    };
  }
  catch (EhbTapiError &E)
  {
    ListBox1->Items->Add(E.Message);
  }
  UpdateStatus();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::UpdateStatus()
{
  if (TapiPhone1->Active)
	Label7->Caption = IntToStr((int)TapiPhone1->Caps->DisplayNumRows) + " x " + IntToStr((int)TapiPhone1->Caps->DisplayNumColumns);
  else
    Label7->Caption = "";
  UpdatePhoneControls();
  UpdateControls();
};
//---------------------------------------------------------------------------

void __fastcall TForm1::UpdateControls()
{
   int i; TListItem* li; ThbTapiPhoneControl* c;

  if (ListView1->Selected)
    c = (ThbTapiPhoneControl*)ListView1->Selected->Data;
  else
    c = NULL;

  for (i=0;i<TapiPhone1->Controls->Count;i++)
  {
    if (i < ListView1->Items->Count)
      li = ListView1->Items->Item[i];
    else
      li = ListView1->Items->Add();

    while (li->SubItems->Count < ListView1->Columns->Count)
      li->SubItems->Add("");

    li->Caption = IntToStr(i);
    li->Data = TapiPhone1->Controls->Items[i];
    li->SubItems->Strings[0] = TapiPhone1->Controls->Items[i]->ButtonFunctionText();
    li->SubItems->Strings[1] = TapiPhone1->Controls->Items[i]->ButtonText;
    li->SubItems->Strings[2] = TapiPhone1->Controls->Items[i]->ButtonStateText();;
    li->SubItems->Strings[3] = TapiPhone1->Controls->Items[i]->LampModeText();
    li->SubItems->Strings[4] = TapiPhone1->Controls->Items[i]->IsLamp()?"Yes":"No";
    li->SubItems->Strings[5] = TapiPhone1->Controls->Items[i]->IsButton()?"Yes":"No";
    li->SubItems->Strings[6] = TapiPhone1->Controls->Items[i]->ButtonModeText();

    switch (TapiPhone1->Controls->Items[i]->LampMode)
    {
      case PHONELAMPMODE_OFF           : li->ImageIndex = 1; break;
      case PHONELAMPMODE_STEADY        : li->ImageIndex = 2; break;
      case PHONELAMPMODE_WINK :
      case PHONELAMPMODE_FLASH :
      case PHONELAMPMODE_FLUTTER :
      case PHONELAMPMODE_BROKENFLUTTER : li->ImageIndex = 3; break;
      default :
        li->ImageIndex = 0;
    };
  }
  while (ListView1->Items->Count > TapiPhone1->Controls->Count)
    ListView1->Items->Delete(ListView1->Items->Count-1);

  for (i=0;i<ListView1->Items->Count;i++)
  {
    if (ListView1->Items->Item[i]->Data == c)
    {
      ListView1->Selected = ListView1->Items->Item[i];
    };
  };
  if ((!ListView1->Selected) && (ListView1->Items->Count > 0))
    ListView1->Selected = ListView1->Items->Item[0];
};
//---------------------------------------------------------------------------

void __fastcall TForm1::UpdatePhoneControls()
{
  if (TapiPhone1->Active == false )
  {
    Button_HandSetHook->Down             = false;
    Button_HeadSetHook->Down             = false;
    Button_SpeakerHook->Down             = false;
    Button_HandSetSpeaker->Down          = false;
    Button_HandSetMicro->Down            = false;
    Button_HeadSetSpeaker->Down          = false;
    Button_HeadSetMicro->Down            = false;
    Button_SpeakerSpeaker->Down          = false;
    Button_SpeakerMicro->Down            = false;
  }
  else
  {
    Button_HandSetHook->Down             = !TapiPhone1->HandSet->OnHook;
    Button_HeadSetHook->Down             = !TapiPhone1->HeadSet->OnHook;
    Button_SpeakerHook->Down             = !TapiPhone1->Speakerphone->OnHook;
    Button_HandSetSpeaker->Down          = TapiPhone1->HandSet->SpeakerActive;
    Button_HandSetMicro->Down            = TapiPhone1->HandSet->MicroActive;
    Button_HeadSetSpeaker->Down          = TapiPhone1->HeadSet->SpeakerActive;
    Button_HeadSetMicro->Down            = TapiPhone1->HeadSet->MicroActive;
    Button_SpeakerSpeaker->Down          = TapiPhone1->Speakerphone->SpeakerActive;
    Button_SpeakerMicro->Down            = TapiPhone1->Speakerphone->MicroActive;


//    TrackBar_RingerVolume->Position      = TapiPhone1->Ringer->Volume;
    TrackBar_SpeakerVolume->OnChange = NULL;
    TrackBar_SpeakerVolume->Position = TapiPhone1->Speakerphone->Volume;
    TrackBar_SpeakerVolume->OnChange = DoSetVolume;
    TrackBar_SpeakerGain->OnChange   = NULL;
    TrackBar_SpeakerGain->Position   = TapiPhone1->Speakerphone->Gain;
    TrackBar_SpeakerGain->OnChange   = DoSetGain;
    TrackBar_HeadSetVolume->OnChange = NULL;
    TrackBar_HeadSetVolume->Position = TapiPhone1->HeadSet->Volume;
    TrackBar_HeadSetVolume->OnChange = DoSetVolume;
    TrackBar_HeadSetGain->OnChange   = NULL;
    TrackBar_HeadSetGain->Position   = TapiPhone1->HeadSet->Gain;
    TrackBar_HeadSetGain->OnChange   = DoSetGain;
    TrackBar_HandSetVolume->OnChange = NULL;
    TrackBar_HandSetVolume->Position = TapiPhone1->HandSet->Volume;
    TrackBar_HandSetVolume->OnChange = DoSetVolume;
    TrackBar_HandSetGain->OnChange   = NULL;
    TrackBar_HandSetGain->Position   = TapiPhone1->HandSet->Gain;
    TrackBar_HandSetGain->OnChange   = DoSetGain;
  };
};
//---------------------------------------------------------------------------

void __fastcall TForm1::DoSetVolume(TObject *Sender)
{
  try
  {
    switch (((TTrackBar*)Sender)->Tag)
    {
      case 0 : TapiPhone1->HandSet->Volume = ((TTrackBar*)Sender)->Position; break;
      case 1 : TapiPhone1->HeadSet->Volume = ((TTrackBar*)Sender)->Position; break;
      case 2 : TapiPhone1->Speakerphone->Volume = ((TTrackBar*)Sender)->Position; break;
    }
  }
  catch (...)
  {
    UpdatePhoneControls();
    throw;
  };
}
//---------------------------------------------------------------------------

void __fastcall TForm1::DoSetGain(TObject *Sender)
{
  try
  {
    switch (((TTrackBar*)Sender)->Tag)
    {
      case 0 : TapiPhone1->HandSet->Gain = ((TTrackBar*)Sender)->Position; break;
      case 1 : TapiPhone1->HeadSet->Gain = ((TTrackBar*)Sender)->Position; break;
      case 2 : TapiPhone1->Speakerphone->Gain = ((TTrackBar*)Sender)->Position; break;
    }
  }
  catch (...)
  {
    UpdatePhoneControls();
    throw;
  };
}
//---------------------------------------------------------------------------

void __fastcall TForm1::DoSetHook(TObject *Sender)
{
  try
  {
    switch (((TSpeedButton*)Sender)->Tag)
    {
      case 0 : TapiPhone1->HandSet->OnHook = !((TSpeedButton*)Sender)->Down; break;
      case 1 : TapiPhone1->HeadSet->OnHook = !((TSpeedButton*)Sender)->Down; break;
      case 2 : TapiPhone1->Speakerphone->OnHook = !((TSpeedButton*)Sender)->Down; break;
    }
  }
  catch (...)
  {
    UpdatePhoneControls();
    throw;
  };

}
//---------------------------------------------------------------------------

void __fastcall TForm1::DoSetSpeaker(TObject *Sender)
{
  try
  {
    switch (((TSpeedButton*)Sender)->Tag)
    {
      case 0 : TapiPhone1->HandSet->SpeakerActive = ((TSpeedButton*)Sender)->Down; break;
      case 1 : TapiPhone1->HeadSet->SpeakerActive = ((TSpeedButton*)Sender)->Down; break;
      case 2 : TapiPhone1->Speakerphone->SpeakerActive = ((TSpeedButton*)Sender)->Down; break;
    }
  }
  catch (...)
  {
    UpdatePhoneControls();
    throw;
  };
}
//---------------------------------------------------------------------------

void __fastcall TForm1::DoSetMicro(TObject *Sender)
{
  try
  {
    switch (((TSpeedButton*)Sender)->Tag)
    {
      case 0 : TapiPhone1->HandSet->MicroActive = ((TSpeedButton*)Sender)->Down; break;
      case 1 : TapiPhone1->HeadSet->MicroActive = ((TSpeedButton*)Sender)->Down; break;
      case 2 : TapiPhone1->Speakerphone->MicroActive = ((TSpeedButton*)Sender)->Down; break;
    }
  }
  catch (...)
  {
    UpdatePhoneControls();
    throw;
  };
}
//---------------------------------------------------------------------------

void __fastcall TForm1::DoClearListBox(TObject *Sender)
{
  ((TListBox*)Sender)->Items->Clear();        
}
//---------------------------------------------------------------------------

void __fastcall TForm1::ComboBox_PhoneChange(TObject *Sender)
{
  // if TapiPhone1 is currently open then close it
  TapiPhone1->Active = false;

  // Set TapiPhone; use the device selected in the list box
  TapiPhone1->DeviceID = ComboBox_Phone->ItemIndex-1;
  TapiPhone1->Privileges->Owner = true;
  if (TapiPhone1->Available)
  try
  {
    TapiPhone1->Active = true;
    ListBox1->Items->Add("Phone Device is active");
    ListBox1->Items->Add("Extention Version = " + IntToHex((int)TapiPhone1->TSP->ExtVersion,8));
    UpdateControls();
  }
  catch (EhbTapiError &E)
  {
    if (E.ErrorCode == PHONEERR_INVALPRIVILEGE )
    try
    {
      TapiPhone1->Privileges->Owner = false;
      TapiPhone1->Active = true;
      ListBox1->Items->Add("Phone Device is active (Monitor only)");
      ListBox1->Items->Add("Extention Version = " + IntToHex((int)TapiPhone1->TSP->ExtVersion,8));
      UpdateControls();
    }
    catch (EhbTapiError &E)
    {
       ListBox1->Items->Add(E.Message);
    }
    else
      ListBox1->Items->Add(E.Message);
  };
  UpdateStatus();

  if (TapiPhone1->Active )
  {
    ListBox1->Items->Add("ButtonLamps = " + IntToStr(TapiPhone1->Controls->Count));
  }
}
//---------------------------------------------------------------------------

void __fastcall TForm1::TapiPhone1Display(TObject *Sender)
{
  TapiPhone1->Status->Update();
  ListBox1->Items->Add("::OnDisplay");
  Memo1->Lines->Text = TapiPhone1->Display->Text;

}
//---------------------------------------------------------------------------

void __fastcall TForm1::DoUpdatePhoneControls(TObject *Sender)
{
  UpdatePhoneControls();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::TapiPhone1TapiReply(TObject *Sender,
      DWORD RequestID, DWORD ReplyCode)
{
  ListBox1->Items->Add("::OnTapiReply RequestID= 0x" + IntToStr((int)RequestID) + " ReplyCode= 0x" + IntToHex((int)ReplyCode,8));
}
//---------------------------------------------------------------------------

void __fastcall TForm1::TapiPhone1Lamp(ThbTapiPhone *Sender,
      DWORD ButtonLampID)
{
  ListBox1->Items->Add("::OnLamp #" + IntToStr((int)ButtonLampID) + " " + TapiPhone1->Controls->Items[ButtonLampID]->LampModeText() + ", " + TapiPhone1->Controls->Items[ButtonLampID]->ButtonText);
  UpdateControls();

}
//---------------------------------------------------------------------------

void __fastcall TForm1::Steady1Click(TObject *Sender)
{
  if (!ListView1->Selected)
    return;
  ((ThbTapiPhoneControl*)ListView1->Selected->Data)->LampMode = PHONELAMPMODE_STEADY;

}
//---------------------------------------------------------------------------

void __fastcall TForm1::Off1Click(TObject *Sender)
{
  if (!ListView1->Selected)
    return;
  ((ThbTapiPhoneControl*)ListView1->Selected->Data)->LampMode = PHONELAMPMODE_OFF;

}
//---------------------------------------------------------------------------



