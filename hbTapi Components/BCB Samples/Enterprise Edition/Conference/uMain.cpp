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
void __fastcall TForm1::UpdateCalls()
{
  int i; TListItem* li; ThbTapiCall* c;
  c = NULL;

  for (i=0;i<ListView1->Items->Count;i++)
  {
    if ((ListView1->Items->Item[i]->Selected || ListView1->Items->Item[i]->Focused)
         && (hbTapiLine1->Calls->IndexOf(ListView1->Items->Item[i]->Data) >= 0))
    {
      c = (ThbTapiCall*)ListView1->Items->Item[i]->Data;
      break;
    };
  };

  for (i=0;i<hbTapiLine1->Calls->Count;i++)
  {
    if (i < ListView1->Items->Count)
      li = ListView1->Items->Item[i];
    else
      li = ListView1->Items->Add();

    while (li->SubItems->Count < ListView1->Columns->Count)
      li->SubItems->Add("");

    li->Caption = "0x" + IntToHex((int)hbTapiLine1->Calls->Items[i],8);
    li->Data = hbTapiLine1->Calls->Items[i];
    li->SubItems->Strings[0] = IntToStr((int)hbTapiLine1->Calls->Items[i]->CallID);

    if (hbTapiLine1->Calls->Items[i]->IsOutgoing())
      li->SubItems->Strings[1] = hbTapiLine1->Calls->Items[i]->CalledID->Address;
    else
      li->SubItems->Strings[1] = hbTapiLine1->Calls->Items[i]->CallerID->Address;
    li->SubItems->Strings[2]   = hbTapiLine1->Calls->Items[i]->StateText();
    if (hbTapiLine1->Calls->Items[i]->ConferenceCall)
      li->SubItems->Strings[3]   = IntToHex((int)hbTapiLine1->Calls->Items[i]->ConferenceCall, 8);
    else
      li->SubItems->Strings[3]   = "";

    li->ImageIndex    = 0;
    switch (hbTapiLine1->Calls->Items[i]->State)
    {
      case LINECALLSTATE_IDLE               : li->ImageIndex = 1; break;
      case LINECALLSTATE_OFFERING           : li->ImageIndex = 4; break;
      case LINECALLSTATE_ACCEPTED           :; break;
      case LINECALLSTATE_DIALTONE           :
      case LINECALLSTATE_DIALING            :
      case LINECALLSTATE_RINGBACK           :
      case LINECALLSTATE_PROCEEDING         : li->ImageIndex = 2; break;
      case LINECALLSTATE_BUSY               : li->ImageIndex = 8; break;
      case LINECALLSTATE_SPECIALINFO        :; break;
      case LINECALLSTATE_CONNECTED          : li->ImageIndex = 3; break;
      case LINECALLSTATE_CONFERENCED        : li->ImageIndex = 7; break;
      case LINECALLSTATE_ONHOLD             :
      case LINECALLSTATE_ONHOLDPENDCONF     :
      case LINECALLSTATE_ONHOLDPENDTRANSFER : li->ImageIndex = 5; break;
      case LINECALLSTATE_DISCONNECTED       : li->ImageIndex = 6; break;
    }
  }

  while (ListView1->Items->Count > hbTapiLine1->Calls->Count)
    ListView1->Items->Delete(ListView1->Items->Count-1);

  for (i=0;i<ListView1->Items->Count;i++)
  {
    if (ListView1->Items->Item[i]->Data == c)
      ListView1->Selected = ListView1->Items->Item[i];
  }
  if (!ListView1->Selected && (ListView1->Items->Count > 0))
    ListView1->Selected = ListView1->Items->Item[0];

  if (!c && (ListView1->Items->Count > 0))
    c = (ThbTapiCall*)ListView1->Items->Item[0]->Data;

  if (c)
    Label_CallFeature->Caption = "CallFeatures: " + c->FeaturesText();
  else
    Label_CallFeature->Caption = "";

  ListView1->Update();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::hbTapiLine1CallState(ThbTapiLine *Sender,
      ThbTapiCall *Call, DWORD CallState)
{
  UpdateCalls();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::hbTapiLine1CallDeallocate(ThbTapiLine *Sender,
      ThbTapiCall *Call)
{
  UpdateCalls();
}
//---------------------------------------------------------------------------
ThbTapiCall* __fastcall TForm1::GetCall()
{
  if (hbTapiLine1->Calls->Count > 0)
  {
    if (ListView1->Selected)
    {
      if (hbTapiLine1->Calls->IndexOf((ThbTapiCall*)ListView1->Selected->Data) == -1)
        return NULL;
      else
        return (ThbTapiCall*)ListView1->Selected->Data;
    }
  }
  return NULL;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::DoMakeCall(TObject *Sender)
{
  if ((InputQuery("MakeCall", "Phone Number", FPhoneNumber) == false) || (FPhoneNumber == ""))
     return;
  hbTapiLine1->CallParams->AddressID = ComboBox_Address->ItemIndex;
  hbTapiLine1->MakeCall(FPhoneNumber);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormCreate(TObject *Sender)
{
  ComboBoxDevice->Items->Assign(hbTapiLine1->DeviceList);
  ComboBoxDevice->Items->Insert(0, "- none -");
  ComboBoxDevice->ItemIndex = 0;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::ComboBoxDeviceChange(TObject *Sender)
{
  hbTapiLine1->Active = false;
  hbTapiLine1->DeviceID = ComboBoxDevice->ItemIndex-1;
  ComboBox_Address->Items->Assign(hbTapiLine1->AddressList);
  ComboBox_Address->ItemIndex = 0;
  if (hbTapiLine1->Available)
    hbTapiLine1->Active = true;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::DoDial(TObject *Sender)
{
  ThbTapiCall* c;

  c = GetCall();
  if (!c)
    return;

  if ((InputQuery("Dial", "Phone Number", FPhoneNumber) == false) || (FPhoneNumber == ""))
    return;

  hbTapiLine1->CallParams->AddressID = ComboBox_Address->ItemIndex;
  c->Dial(FPhoneNumber);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::DoAnswer(TObject *Sender)
{
  ThbTapiCall* c;
  c = GetCall();
  if (!c)
    return;
  c->Answer("");
}
//---------------------------------------------------------------------------
void __fastcall TForm1::DoDrop(TObject *Sender)
{
  ThbTapiCall* c;
  c = GetCall();
  if (!c)
    return;
  c->Drop("");
}
//---------------------------------------------------------------------------
void __fastcall TForm1::DoHold(TObject *Sender)
{
  ThbTapiCall* c;
  c = GetCall();
  if (!c)
    return;
  if (c->IsHeld())
    c->Unhold();
  else
    c->Hold();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::DoSetupTransfer(TObject *Sender)
{
  ThbTapiCall *c1, *c2;

  if ((InputQuery("MakeCall", "Phone Number", FPhoneNumber) == false) || (FPhoneNumber == ""))
    return;

  c1 = GetCall();

  if (!c1)
    return;

  try
  {
    hbTapiLine1->CallParams->AddressID = ComboBox_Address->ItemIndex;
    c2 = c1->SetupTransfer();
    c2->Dial(FPhoneNumber);
  }
  catch (EhbTapiError &E)
  {
    MessageDlg("SetupTransfer/Dial failed!" + E.Message, mtError, TMsgDlgButtons() << mbOK, 0);
  }

}
//---------------------------------------------------------------------------

void __fastcall TForm1::DoTransfer(TObject *Sender)
{
  ThbTapiCall *c1;

  c1 = GetCall();
  if (!c1)
    return;

  try
  {
    c1->CompleteTransfer(false);
  }
  catch (EhbTapiError &E)
  {
    MessageDlg("CompleteTransfer failed!", mtError, TMsgDlgButtons() << mbOK, 0);
  }
        
}
//---------------------------------------------------------------------------

void __fastcall TForm1::DoBuildConference(TObject *Sender)
{
  ThbTapiCall *c1;

  c1 = GetCall();
  if (!c1)
    return;

  try
  {
    c1->CompleteTransfer(true);
  }
  catch (EhbTapiError &E)
  {
    MessageDlg("CompleteTransfer failed! " + E.Message, mtError, TMsgDlgButtons() << mbOK, 0);
  }

}
//---------------------------------------------------------------------------

void __fastcall TForm1::DoSetupConference(TObject *Sender)
{
  ThbTapiCall *c1, *c2, *c3;
  c1 = GetCall();
  if (!c1)
    return;
  if ((InputQuery("Dial", "Telephone number", FPhoneNumber) == false) || (FPhoneNumber == ""))
    return;
  try
  {
    hbTapiLine1->CallParams->AddressID = ComboBox_Address->ItemIndex;
    c1->SetupConference(c2, c3);
    c3->Dial(FPhoneNumber);
  }
  catch (EhbTapiError &E)
  {
     MessageDlg("SetupConference failed! " + E.Message, mtError, TMsgDlgButtons() << mbOK, 0);
  };
}
//---------------------------------------------------------------------------


void __fastcall TForm1::DoPrepareAddToConf(TObject *Sender)
{
  ThbTapiCall *c1, *c2, *c3;
  c1 = GetCall();

  if (!c1)
    return;

  if ((InputQuery("MakeCall", "Telephone number", FPhoneNumber) == false) || (FPhoneNumber == ""))
    return;

  try
  {
    hbTapiLine1->CallParams->AddressID = ComboBox_Address->ItemIndex;
    c2 = c1->PrepareAddToConference();
    c2->Dial(FPhoneNumber);
  }
  catch (EhbTapiError &E)
  {
    MessageDlg("PrepareAddToConference failed! " + E.Message, mtError, TMsgDlgButtons() << mbOK, 0);
  };

}
//---------------------------------------------------------------------------


void __fastcall TForm1::DoRemoveFromConference(TObject *Sender)
{
  ThbTapiCall* c;
  c = GetCall();
  if (!c)
    return;

  try
  {
    c->RemoveFromConference();
  }
  catch (EhbTapiError &E)
  {
    MessageDlg("RemoveFromConference failed! " + E.Message, mtError, TMsgDlgButtons() << mbOK, 0);
  };

}
//---------------------------------------------------------------------------

void __fastcall TForm1::DoGetCallList(TObject *Sender)
{
  ThbTapiCall* c; TTapiCallList* l; int i;
  c = GetCall();
  if (!c)
    return;

  ListBox2->Items->Clear();

  l = new TTapiCallList();
  try
  {
    if (hbTapiLine1->GetConfRelatedCalls(c, l))
    {
      for (i=0;i<l->Count;i++)
        ListBox2->Items->Add("Call 0x" + IntToHex((int)l->Items[i],8));
    };
  }
  __finally
  {
    delete l;
  }
}
//---------------------------------------------------------------------------


void __fastcall TForm1::DoAddToConference(TObject *Sender)
{
  ThbTapiCall* c;
  c = GetCall();
  if (!c)
    return;

  try
  {
    c->AddToConference();
  }
  catch (EhbTapiError &E)
  {
    MessageDlg("AddToConference failed! " + E.Message, mtError, TMsgDlgButtons() << mbOK, 0);
  };

}
//---------------------------------------------------------------------------

