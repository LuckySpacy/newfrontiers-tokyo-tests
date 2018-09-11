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
void __fastcall TForm1::ComboBoxDeviceChange(TObject *Sender)
{
  hbTapiLine1->Active = false;
  hbTapiLine1->DeviceID = ComboBoxDevice->ItemIndex-1;
  ComboBoxAddress->Items->Assign(hbTapiLine1->AddressList);
  ComboBoxAddress->ItemIndex = 0;
  if (hbTapiLine1->Available)
  {
    if (ComboBox_Privileges->Text.Pos("AutoSelect") > 0)
      hbTapiLine1->Privileges->AutoSelect = true;
    else
    {
      hbTapiLine1->Privileges->None = true;
      hbTapiLine1->Privileges->AutoSelect = false;
      if (ComboBox_Privileges->Text.Pos("OWNER") > 0)
        hbTapiLine1->Privileges->Owner = true;
      if (ComboBox_Privileges->Text.Pos("MONITOR") > 0)
        hbTapiLine1->Privileges->Monitor = true;
    };
    hbTapiLine1->Active = true;
    Label_Privileges->Caption = "Privileges: " + hbTapiLine1->Privileges->Text;
  };
  UpdateCalls();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormCreate(TObject *Sender)
{
  ComboBoxDevice->Items = hbTapiLine1->DeviceList;
  ComboBoxDevice->Items->Insert(0, "- none -");
  ComboBox_Privileges->ItemIndex = 0;
  ComboBoxDevice->ItemIndex = 0;
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
    li->SubItems->Strings[3]   = hbTapiLine1->Calls->Items[i]->PrivilegeText();

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
void __fastcall TForm1::Button2Click(TObject *Sender)
{
  ThbTapiCallParams* cp;

  if ((InputQuery("MakeCall", "Phone Number", FPhoneNumber) == false) || (FPhoneNumber == ""))
     exit;

  // here we use the ThbTapiCallParams object instead of ThbTapiLine->CallParams
  cp = new ThbTapiCallParams();
  try
  {
    cp->AddressMode   = LINEADDRESSMODE_DIALABLEADDR;
    cp->AddressID     = ComboBoxAddress->ItemIndex;
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
void __fastcall TForm1::Button4Click(TObject *Sender)
{
  ThbTapiCall* c;

  c = GetCall();
  if (!c)
    return;

  if ((InputQuery("Dial", "Phone Number", FPhoneNumber) == false) || (FPhoneNumber == ""))
    return;

  hbTapiLine1->CallParams->AddressID = ComboBoxAddress->ItemIndex;
  c->Dial(FPhoneNumber);
        
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button5Click(TObject *Sender)
{
  ThbTapiCall* c;
  c = GetCall();
  if (!c)
    return;
  c->Answer("");
        
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button6Click(TObject *Sender)
{
  ThbTapiCall* c;
  c = GetCall();
  if (!c)
    return;
  c->Drop("");


}
//---------------------------------------------------------------------------
void __fastcall TForm1::ButtonSetCallDataClick(TObject *Sender)
{
  ThbTapiCall* c;
  c = GetCall();
  if (!c)
    return;
  c->SetCallData((void*)Edit1->Text.c_str(), Edit1->Text.Length()+1);

}
//---------------------------------------------------------------------------
void __fastcall TForm1::ButtonGetCallDataClick(TObject *Sender)
{
  ThbTapiCall* c; void* p;
  c = GetCall();
  if (!c)
    return;

  if (c->GetCallData(p) > 0 )
  try
  {
    Edit2->Text = PChar(p);
  }
  __finally
  {
    free(p);
  };

}
//---------------------------------------------------------------------------
