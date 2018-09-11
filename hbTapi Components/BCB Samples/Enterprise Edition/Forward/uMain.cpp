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
  ComboBoxDevice->Items->Assign(hbTapiLine1->DeviceList);
  ComboBoxDevice->Items->Insert(0, "- none -");
  ComboBoxDevice->ItemIndex = 0;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::ComboBoxDeviceChange(TObject *Sender)
{
  hbTapiLine1->Active = false;
  hbTapiLine1->DeviceID = ComboBoxDevice->ItemIndex-1;
  if (hbTapiLine1->Available)
    hbTapiLine1->Active = true;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::UpdateCalls()
{
  int i; TListItem* li; ThbTapiCall* c;

  if (ListView1->Selected)
    c = (ThbTapiCall*)ListView1->Selected->Data;
  else
    c = NULL;

  for (i=0;i<hbTapiLine1->Calls->Count;i++)
  {
    if (i < ListView1->Items->Count)
      li = ListView1->Items->Item[i];
    else
      li = ListView1->Items->Add();

    while (li->SubItems->Count < ListView1->Columns->Count-1)
      li->SubItems->Add("");

    li->Caption = IntToStr((int)hbTapiLine1->Calls->Items[i]->CallID);
    li->Data = hbTapiLine1->Calls->Items[i];
    if (hbTapiLine1->Calls->Items[i]->IsOutgoing())
      li->SubItems->Strings[0] = hbTapiLine1->Calls->Items[i]->CalledID->Address;
    else
      li->SubItems->Strings[0] = hbTapiLine1->Calls->Items[i]->CallerID->Address;
    li->SubItems->Strings[1] = hbTapiLine1->Calls->Items[i]->StateText();
    li->SubItems->Strings[2] = hbTapiLine1->Calls->Items[i]->PrivilegeText();

    li->ImageIndex = 0;
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
    ListView1->Items->Item[ListView1->Items->Count-1]->Delete();

  for (i=0;i<ListView1->Items->Count;i++)
  {
    if (ListView1->Items->Item[i]->Data == c)
      ListView1->Selected = ListView1->Items->Item[i];
  };

  DoShowCallFeatures(NULL);
};
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
    else if (hbTapiLine1->Calls->Count == 1)
      return hbTapiLine1->Calls->Items[0];
    else
      return NULL;
  }
  return NULL;
}

void __fastcall TForm1::Button_MakeCallClick(TObject *Sender)
{
  if ((InputQuery("MakeCall", "Phone Number", FPhoneNumber) == false) || (FPhoneNumber == ""))
    return;

  hbTapiLine1->MakeCall(FPhoneNumber);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button_DialClick(TObject *Sender)
{
  ThbTapiCall* c;

  c = GetCall();
  if (!c)
    return;

  if ((InputQuery("Dial", "Phone Number", FPhoneNumber) == false) || (FPhoneNumber == ""))
    return;

  c->Dial(FPhoneNumber);

}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button_AnswerClick(TObject *Sender)
{
  ThbTapiCall* c;
  c = GetCall();
  if (!c)
    return;
  c->Answer("");

}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button_DropClick(TObject *Sender)
{
  ThbTapiCall* c;
  c = GetCall();
  if (!c)
    return;
  c->Drop("");

}
//---------------------------------------------------------------------------

void __fastcall TForm1::ShowForwards(int AddressID)
{
  int i,n;

  ListBox1->Items->Clear();
  if (AddressID == -1)
  {
    i = 0;
    while (i<hbTapiLine1->Addresses->Count)
    {
      ListBox1->Items->Add("AddressName = " + hbTapiLine1->Addresses->Items[i]->AddressName);
      n = 0;
      while (n < hbTapiLine1->Addresses->Items[i]->ForwardList->Count)
      {
        ListBox1->Items->Add("  ForwarMode    = " + LineForwardModeToStr(hbTapiLine1->Addresses->Items[i]->ForwardList->Items[n]->ForwardMode));
        ListBox1->Items->Add("  CallerAddress = " + hbTapiLine1->Addresses->Items[i]->ForwardList->Items[n]->CallerAddress);
        ListBox1->Items->Add("  DestAddress   = " + hbTapiLine1->Addresses->Items[i]->ForwardList->Items[n]->DestAddress);
        n++;
      };
    };
    i++;
  }
  else
  {
    ListBox1->Items->Add("Forwards of Address " + hbTapiLine1->Addresses->Items[AddressID]->AddressName);
    n = 0;
    while (n < hbTapiLine1->Addresses->Items[AddressID]->ForwardList->Count)
    {
      ListBox1->Items->Add("  ForwarMode    = " + LineForwardModeToStr(hbTapiLine1->Addresses->Items[AddressID]->ForwardList->Items[n]->ForwardMode));
      ListBox1->Items->Add("  CallerAddress = " + hbTapiLine1->Addresses->Items[AddressID]->ForwardList->Items[n]->CallerAddress);
      ListBox1->Items->Add("  DestAddress   = " + hbTapiLine1->Addresses->Items[AddressID]->ForwardList->Items[n]->DestAddress);
      n++;
    };
  };
};
//---------------------------------------------------------------------------

void __fastcall TForm1::Button7Click(TObject *Sender)
{
  ShowForwards(0);
        
}
//---------------------------------------------------------------------------

void __fastcall TForm1::hbTapiLine1AddressState(ThbTapiLine *Sender,
      ThbTapiAddress *Address, DWORD AddressState)
{
  if ((AddressState & LINEADDRESSSTATE_FORWARD) > 0)
  {
    MessageDlg("Forward list of address " + Address->AddressName + " has changed.", mtInformation, TMsgDlgButtons() << mbOK, 0);
    ShowForwards(Address->AddressID);
  };
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button_ForwardToClick(TObject *Sender)
{
  String s = "";
  if (!InputQuery("ForwardTo", "Phone number", s) || (s==""))
    return;

  hbTapiLine1->Addresses->Items[0]->ForwardTo(s);
  ShowForwards(0);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button_ClearForwardsClick(TObject *Sender)
{
  hbTapiLine1->Addresses->Items[0]->ForwardTo("");

}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button_ClearForwards2Click(TObject *Sender)
{
  hbTapiLine1->Addresses->Items[0]->ChangeForwardList(NULL, 0, NULL);

}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button_ChangeforwardListClick(TObject *Sender)
{
  String s = ""; ThbTapiForwardList* l;
  if (!InputQuery("ForwardTo", "Phone number", s) || (s==""))
    return;

  l = new ThbTapiForwardList();
  try
  {
    l->AddEntry(LINEFORWARDMODE_UNCOND, "", 0, s);
    hbTapiLine1->Addresses->Items[0]->ChangeForwardList(l, 3, hbTapiLine1->CallParams);
  }
  __finally
  {
    delete l;
  }
}
//---------------------------------------------------------------------------


void __fastcall TForm1::DoShowCallFeatures(TObject *Sender)
{
  if ((ListView1->Selected == NULL) && (ListView1->Items->Count > 0))
    ListView1->Selected = ListView1->Items->Item[0];
  if (ListView1->Selected != NULL)
    Label2->Caption = "Available features: " + ((ThbTapiCall*)ListView1->Selected->Data)->FeaturesText();
  else
    Label2->Caption = "";
}
//---------------------------------------------------------------------------

