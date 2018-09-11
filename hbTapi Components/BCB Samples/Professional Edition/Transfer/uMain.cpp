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
  ComboBox_Address->Items->Clear();
  hbTapiLine1->DeviceID = ComboBoxDevice->ItemIndex-1;
  if (hbTapiLine1->Available)
    hbTapiLine1->Active = true;
  ComboBox_Address->Items->Assign(hbTapiLine1->AddressList);
  if (ComboBox_Address->Items->Count > 0)
    ComboBox_Address->ItemIndex = 0;
  else
    ComboBox_Address->ItemIndex = -1;
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

    li->Data = hbTapiLine1->Calls->Items[i];
    li->Caption = IntToHex((int)hbTapiLine1->Calls->Items[i], 8);
    if (hbTapiLine1->Calls->Items[i]->IsOutgoing())
      li->SubItems->Strings[0] = hbTapiLine1->Calls->Items[i]->CalledID->Address;
    else
      li->SubItems->Strings[0] = hbTapiLine1->Calls->Items[i]->CallerID->Address;
    li->SubItems->Strings[1] = hbTapiLine1->Calls->Items[i]->StateText();
    li->SubItems->Strings[2] = hbTapiLine1->Calls->Items[i]->PrivilegeText();
    li->SubItems->Strings[3] = hbTapiLine1->Calls->Items[i]->MediaModeText();
    li->SubItems->Strings[4] = IntToHex((int)hbTapiLine1->Calls->Items[i]->ConferenceCall, 8);
  }
  while (ListView1->Items->Count > hbTapiLine1->Calls->Count)
    ListView1->Items->Item[ListView1->Items->Count-1]->Delete();

  for (i=0;i<ListView1->Items->Count;i++)
  {
    if (ListView1->Items->Item[i]->Data == c)
      ListView1->Selected = ListView1->Items->Item[i];
  };

  if ((ListView1->Selected == NULL) && (ListView1->Items->Count > 0))
    ListView1->Selected == ListView1->Items->Item[0];
};
void __fastcall TForm1::DoUpdateCalls(TObject *Sender)
{
    UpdateCalls();

}
//---------------------------------------------------------------------------
void __fastcall TForm1::hbTapiLine1CallState(ThbTapiLine *Sender,
      ThbTapiCall *Call, DWORD CallState)
{
  ListBox1->Items->Add("::OnCallState " + Call->StateText() + " (Call = 0x" + IntToHex((int)Call, 8) + ")");
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
  ThbTapiCall* c = NULL;

  if (ListView1->Selected)
  {
    c = (ThbTapiCall*)ListView1->Selected->Data;
  } else if (ListView1->Items->Count > 0) {
    c = (ThbTapiCall*)ListView1->Items->Item[0]->Data;
  }
  if (hbTapiLine1->Calls->IndexOf(c) >= 0)
    return c;
  return NULL;
}

//---------------------------------------------------------------------------
void __fastcall TForm1::DoMakeCall(TObject *Sender)
{
  ThbTapiCallParams* cp;

  if ((InputQuery("MakeCall", "Phone Number", FPhoneNumber) == false) || (FPhoneNumber == ""))
     exit;

  // here we use the ThbTapiCallParams object instead of ThbTapiLine->CallParams
  cp = new ThbTapiCallParams();
  try
  {
    cp->AddressMode   = LINEADDRESSMODE_ADDRESSID;
    cp->AddressID     = ComboBox_Address->ItemIndex;
    cp->MediaMode     = LINEMEDIAMODE_INTERACTIVEVOICE;
    cp->Flags         = 0;
    cp->TargetAddress = FPhoneNumber;
    hbTapiLine1->MakeCall(FPhoneNumber, 0, cp->TapiData);
  }
  __finally
  {
    delete cp;
  }
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
void __fastcall TForm1::ButtonTransferDialClick(TObject *Sender)
{
  ThbTapiCall *c1, *c2;

  if ((InputQuery("MakeCall", "Phone Number", FPhoneNumber) == false) || (FPhoneNumber == ""))
    return;

  c1 = GetCall();

  if (!c1)
    return;

  hbTapiLine1->CallParams->AddressID = ComboBox_Address->ItemIndex;
  try
  {
    c2 = c1->SetupTransfer();
    c2->Dial(FPhoneNumber);
    c2->Notes["Action"] = "Conference";
  }
  catch (EhbTapiError &E)
  {
    MessageDlg("SetupTransfer/Dial failed!" + E.Message, mtError, TMsgDlgButtons() << mbOK, 0);
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::DoSwapHold(TObject *Sender)
{
  int i; ThbTapiCall *c1, *c2;

  c1 = GetCall();

  if (!c1)
    return;

  c2 = NULL;
  for (i=0;i<hbTapiLine1->Calls->Count;i++)
  {
    if ((hbTapiLine1->Calls->Items[i] != c1) &&
        ((c1->IsConnected() && hbTapiLine1->Calls->Items[i]->IsHeld()) || (c1->IsHeld() && hbTapiLine1->Calls->Items[i]->IsConnected())))
      c2 == hbTapiLine1->Calls->Items[i];
  }
  
  if (c2)
  {
    if (c1->IsConnected())
      c1->SwapHold(c2);
    else
      c2->SwapHold(c1);
  }
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
void __fastcall TForm1::DoAnswer(TObject *Sender)
{
  ThbTapiCall* c;
  c = GetCall();
  if (!c)
    return;
  c->Answer("");

}
//---------------------------------------------------------------------------
void __fastcall TForm1::DoToggleOwner(TObject *Sender)
{
  ThbTapiCall* c;
  c = GetCall();
  if (!c)
    return;
  c->Owner = !c->Owner;
  UpdateCalls();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button_SetupTransferClick(TObject *Sender)
{
 ThbTapiCall* c1;

  c1 = GetCall();
  if (!c1)
    return;

  hbTapiLine1->CallParams->AddressID = ComboBox_Address->ItemIndex;
  try
  {
    c1->SetupTransfer();
  }
  catch (EhbTapiError &E)
  {
    MessageDlg("SetupTransfer failed!", mtError, TMsgDlgButtons() << mbOK, 0);
  };
}
//---------------------------------------------------------------------------
void __fastcall TForm1::hbTapiLine1Connected(ThbTapiLine *Sender,
      ThbTapiCall *Call)
{
  ListBox1->Items->Add("::OnConnected (Call = 0x" + IntToHex((int)Call, 8)) + ")";

  if (Call->Notes["Action"] == "Conference")
  {
    Call->Notes["Action"] = "";
    Call->CompleteTransfer(true);
  }
  else if (Call->Notes["Action"] == "Transfer")
  {
    Call->Notes["Action"] = "";
    Call->CompleteTransfer(false);
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::ListBox1DblClick(TObject *Sender)
{
  ListBox1->Items->Clear();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::DoBlindTransfer(TObject *Sender)
{
  ThbTapiCall *c1;

  c1 = GetCall();
  if (!c1)
    return;

  if ((InputQuery("BlindTransfer", "Destination Address", FPhoneNumber) == false) || (FPhoneNumber == ""))
    return;

  try
  {
    c1->BlindTransfer(FPhoneNumber);
  }
  catch (EhbTapiError &E)
  {
    MessageDlg("BlindTransfer failed!", mtError, TMsgDlgButtons() << mbOK, 0);
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
void __fastcall TForm1::DoConference(TObject *Sender)
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
    MessageDlg("CompleteTransfer failed!", mtError, TMsgDlgButtons() << mbOK, 0);
  }

}
//---------------------------------------------------------------------------
void __fastcall TForm1::ButtonTransferDialTransferClick(TObject *Sender)
{
  ThbTapiCall *c1, *c2;

  if (!InputQuery("MakeCall", "Phone Number", FPhoneNumber) || (FPhoneNumber == ""))
    return;

  c1 = GetCall();
  if (!c1)
    return;

  hbTapiLine1->CallParams->AddressID = ComboBox_Address->ItemIndex;
  try
  {
    c2 = c1->SetupTransfer();
    c2->Dial(FPhoneNumber);
    c2->Notes["Action"] = "Transfer";
  }

  catch (EhbTapiError &E)
  {
    MessageDlg("SetupTransfer failed!", mtError, TMsgDlgButtons() << mbOK, 0);
  }
}
//---------------------------------------------------------------------------
