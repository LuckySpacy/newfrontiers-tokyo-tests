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
  Label_Active->Visible = false;
  if (hbTapiLine1->Available)
    hbTapiLine1->Active = true;
  Label_Active->Visible = hbTapiLine1->Active;
  UpdateCalls();
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
    li->Caption = "0x" + IntToHex((int)hbTapiLine1->Calls->Items[i], 8);
    li->SubItems->Strings[0] = hbTapiLine1->Calls->Items[i]->StateText();
    li->SubItems->Strings[1] = hbTapiLine1->Calls->Items[i]->PrivilegeText();
    li->SubItems->Strings[2] = hbTapiLine1->Calls->Items[i]->MediaModeText();
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
    cp->AddressID     = 0;
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
void __fastcall TForm1::DoDrop(TObject *Sender)
{
  ThbTapiCall* c;
  c = GetCall();
  if (!c)
    return;
  c->Drop("");
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
void __fastcall TForm1::ListBox1DblClick(TObject *Sender)
{
  ListBox1->Items->Clear();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::DoDirectPark(TObject *Sender)
{
  ThbTapiCall* c;
  c = GetCall();
  if (!c)
    return;

  c->Owner = True;
  c->Park(Edit_DirAddress->Text);
  Edit_UnparkAddress->Text = Edit_DirAddress->Text;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button_UnparkClick(TObject *Sender)
{
  hbTapiLine1->Unpark(0, Edit_UnparkAddress->Text);

}
//---------------------------------------------------------------------------

void __fastcall TForm1::DoNonDirectPark(TObject *Sender)
{
  ThbTapiCall* c;
  TVarString* vsAddress;
  c = GetCall();
  if (!c)
    return;

  vsAddress = (TVarString*)malloc(1000);
  try {
    memset(vsAddress, 0, 1000);
    vsAddress->dwTotalSize = 1000;
    vsAddress->dwUsedSize  = sizeof(TVarString);

    try {
      c->Owner = true;
      hbTapiLine1->Park(c, LINEPARKMODE_NONDIRECTED, NULL, vsAddress);
      IsTapiError(0);
      Edit_ParkedAtAddress->Text = GetTapiBlockStr(vsAddress, &vsAddress->dwStringSize, vsAddress->dwStringFormat);

    } catch (EhbTapiError &e) {
        MessageDlg("TapiLine.Park failed! " + e.Message, mtError, TMsgDlgButtons() << mbOK, 0);
    }
  } __finally {
    free(vsAddress);
  }

}
//---------------------------------------------------------------------------

