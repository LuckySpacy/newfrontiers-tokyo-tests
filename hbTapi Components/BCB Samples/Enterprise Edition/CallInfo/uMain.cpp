//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "uMain.h"
#include "hbTapiUtils.hpp"
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
void __fastcall TForm1::hbTapiLine1CallState(ThbTapiLine *Sender,
      ThbTapiCall *Call, DWORD CallState)
{
  ListBox1->Items->Add("::OnCallState call state changed " + Call->StateText());
  UpdateCallInfo(Sender, Call, 0);

}
//---------------------------------------------------------------------------
void __fastcall TForm1::UpdateCallInfo(ThbTapiLine *Sender, ThbTapiCall *Call, DWORD InfoState)
{
  ListBox1->Items->Add("::OnCallInfo callinfo changed or available " + LineCallInfoStateToStr(InfoState) + " (0x" + IntToHex((int)Call,8) + ")");
  if (Call->State == LINECALLSTATE_IDLE) {
    Edit_CallerID->Text = "";
    Edit_CallerIDName->Text = "";
    Edit_CalledID->Text = "";
    Edit_CalledIDName->Text = "";
    Edit_ConnectedID->Text = "";
    Edit_ConnectedIDName->Text = "";
    Edit_RedirectionID->Text = "";
    Edit_RedirectionIDName->Text = "";
    Edit_RedirectingID->Text = "";
    Edit_RedirectingID->Text = "";
    Label_CallerID->Font->Style = Label_CallerID->Font->Style >> fsBold;
    Label_CallerIDName->Font->Style = Label_CallerIDName->Font->Style >> fsBold;
    Label_CalledID->Font->Style = Label_CalledID->Font->Style >> fsBold;
    Label_CalledIDName->Font->Style = Label_CalledIDName->Font->Style >> fsBold;
    Label_ConnectedID->Font->Style = Label_ConnectedID->Font->Style >> fsBold;
    Label_ConnectedIDName->Font->Style = Label_ConnectedIDName->Font->Style >> fsBold;
    Label_RedirectionID->Font->Style = Label_RedirectionID->Font->Style >> fsBold;
    Label_RedirectionIDName->Font->Style = Label_RedirectionIDName->Font->Style >> fsBold;
    Label_RedirectingID->Font->Style = Label_RedirectingID->Font->Style >> fsBold;
    Label_RedirectingIDName->Font->Style = Label_RedirectingIDName->Font->Style >> fsBold;
    return;
  }

  // CallerID

  if (Call->CallerID->AddressAvail)
    Label_CallerID->Font->Style = Label_CallerID->Font->Style << fsBold;
  else
    Label_CallerID->Font->Style = Label_CallerID->Font->Style >> fsBold;

  if (Call->CallerID->NameAvail)
    Label_CallerIDName->Font->Style = Label_CallerIDName->Font->Style << fsBold;
  else
    Label_CallerIDName->Font->Style = Label_CallerIDName->Font->Style >> fsBold;

  Edit_CallerID->Text = Call->CallerID->Address;
  Edit_CallerIDName->Text = Call->CallerID->Name;

  // CalledID

  if (Call->CalledID->AddressAvail)
    Label_CalledID->Font->Style = Label_CalledID->Font->Style << fsBold;
  else
    Label_CalledID->Font->Style = Label_CalledID->Font->Style >> fsBold;

  if (Call->CalledID->NameAvail)
    Label_CalledIDName->Font->Style = Label_CalledIDName->Font->Style << fsBold;
  else
    Label_CalledIDName->Font->Style = Label_CalledIDName->Font->Style >> fsBold;

  Edit_CalledID->Text = Call->CalledID->Address;
  Edit_CalledIDName->Text = Call->CalledID->Name;

  // ConnectedID

  if (Call->ConnectedID->AddressAvail)
    Label_ConnectedID->Font->Style = Label_ConnectedID->Font->Style << fsBold;
  else
    Label_ConnectedID->Font->Style = Label_ConnectedID->Font->Style >> fsBold;

  if (Call->ConnectedID->NameAvail)
    Label_ConnectedIDName->Font->Style = Label_ConnectedIDName->Font->Style << fsBold;
  else
    Label_ConnectedIDName->Font->Style = Label_ConnectedIDName->Font->Style >> fsBold;

  Edit_ConnectedID->Text = Call->ConnectedID->Address;
  Edit_ConnectedIDName->Text = Call->ConnectedID->Name;

  // RedirectionID

  if (Call->RedirectionID->AddressAvail)
    Label_RedirectionID->Font->Style = Label_RedirectionID->Font->Style << fsBold;
  else
    Label_RedirectionID->Font->Style = Label_RedirectionID->Font->Style >> fsBold;

  if (Call->RedirectionID->NameAvail)
    Label_RedirectionIDName->Font->Style = Label_RedirectionIDName->Font->Style << fsBold;
  else
    Label_RedirectionIDName->Font->Style = Label_RedirectionIDName->Font->Style >> fsBold;

  Edit_RedirectionID->Text = Call->RedirectionID->Address;
  Edit_RedirectionIDName->Text = Call->RedirectionID->Name;

  // RedirectingID

  if (Call->RedirectingID->AddressAvail)
    Label_RedirectingID->Font->Style = Label_RedirectingID->Font->Style << fsBold;
  else
    Label_RedirectingID->Font->Style = Label_RedirectingID->Font->Style >> fsBold;

  if (Call->RedirectingID->NameAvail)
    Label_RedirectingIDName->Font->Style = Label_RedirectingIDName->Font->Style << fsBold;
  else
    Label_RedirectingIDName->Font->Style = Label_RedirectingIDName->Font->Style >> fsBold;

  Edit_RedirectingID->Text = Call->RedirectingID->Address;
  Edit_RedirectingID->Text = Call->RedirectingID->Name;
}
void __fastcall TForm1::FormCreate(TObject *Sender)
{
  // Fill in the ComboBox with all available telephony line devices
  ComboBox_Device->Items->Assign(hbTapiLine1->DeviceList);
  if (ComboBox_Device->Items->Count > 0)
    ComboBox_Device->Items->Insert(0, "- none -");
  else
    ComboBox_Device->Items->Add("- none -");

  ComboBox_Device->ItemIndex     = 0;
  ComboBox_Privileges->ItemIndex = 0;

}
//---------------------------------------------------------------------------
void __fastcall TForm1::ComboBox_DeviceChange(TObject *Sender)
{
  // If TapiLine is currently open then close it
  hbTapiLine1->Active = False;

  // Set the TapiLine->DeviceID to use the device selected in the list box
  hbTapiLine1->DeviceID = ComboBox_Device->ItemIndex - 1;

  // If there was a problem opening TapiLine last time then make sure that the
  // following properties are reset to their default->
  hbTapiLine1->Privileges->None = TRUE;
  if (ComboBox_Privileges->Text.Pos("Owner"))
	hbTapiLine1->Privileges->Owner = TRUE;
  if (ComboBox_Privileges->Text.Pos("Monitor"))
	hbTapiLine1->Privileges->Monitor = TRUE;

  if (!hbTapiLine1->Available)
  {
    ComboBox_MediaMode->Items->Clear();
    ComboBox_Address->Items->Clear();
    return;
  };

  // Fill in the ComboBox with all supporting media modes->
  LineMediaModesToStrList(hbTapiLine1->Caps->MediaModes, ComboBox_MediaMode->Items);
  if (hbTapiLine1->Caps->MediaModes & LINEMEDIAMODE_INTERACTIVEVOICE)
    ComboBox_MediaMode->ItemIndex = ComboBox_MediaMode->Items->IndexOf(LineMediaModeToStr(LINEMEDIAMODE_INTERACTIVEVOICE));
  else if (ComboBox_MediaMode->Items->Count > 0)
    ComboBox_MediaMode->ItemIndex = 0;

  ComboBox_Address->Items->Assign(hbTapiLine1->AddressList);
  if (ComboBox_Address->Items->Count > 0)
    ComboBox_Address->ItemIndex = 0;

  try
  {
    hbTapiLine1->Active = True;
  }
  catch (EhbTapiError &e)
  {
    MessageDlg("Error opening line device: " + e.Message, mtError, TMsgDlgButtons() << mbOK, 0);
  };

}
//---------------------------------------------------------------------------
void __fastcall TForm1::hbTapiLine1CallInfo(ThbTapiLine *Sender,
      ThbTapiCall *Call, DWORD InfoState)
{
  UpdateCallInfo(Sender, Call, InfoState);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::DoMakeCall(TObject *Sender)
{
  try {
    hbTapiLine1->CallParams->MediaMode = StrToLineMediaMode(ComboBox_MediaMode->Text, LINEMEDIAMODE_INTERACTIVEVOICE);
    hbTapiLine1->CallParams->AddressID = ComboBox_Address->ItemIndex;
    hbTapiLine1->MakeCall(Edit_PhoneNumber->Text);
  } catch (EhbTapiError &e) {
    MessageDlg("MakeCall failed!" + e.Message, mtError, TMsgDlgButtons() << mbOK, 0);
  }

}
//---------------------------------------------------------------------------
void __fastcall TForm1::DoAnswerCall(TObject *Sender)
{
  if (hbTapiLine1->Calls->Count > 0)
  {
    hbTapiLine1->Calls->Items[0]->Answer();
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::DoDropCall(TObject *Sender)
{
  if (hbTapiLine1->Calls->Count > 0)
  {
    hbTapiLine1->Calls->Items[0]->Drop();
  }
}
//---------------------------------------------------------------------------
