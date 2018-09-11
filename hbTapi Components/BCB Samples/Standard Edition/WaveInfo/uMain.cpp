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
void __fastcall TForm1::DoMakeCall(TObject *Sender)
{
  try {
    hbTapiLine1->CallParams->MediaMode = StrToLineMediaMode(ComboBox_MediaMode->Text, LINEMEDIAMODE_INTERACTIVEVOICE);
    hbTapiLine1->CallParams->AddressID = ComboBox_Address->ItemIndex;
    hbTapiLine1->MakeCall(Edit_PhoneNo->Text);
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
void __fastcall TForm1::hbTapiLine1CallState(ThbTapiLine *Sender,
      ThbTapiCall *Call, DWORD CallState)
{
  ListBox1->Items->Add("::OnCallState (" + Call->StateText() + ")");
  if (Call->CallerID->AddressAvail)
  {
    ListBox1->Items->Add("CallerID Address = " + Call->CallerID->Address);
  }

}
//---------------------------------------------------------------------------
void __fastcall TForm1::hbTapiLine1CallDeallocate(ThbTapiLine *Sender,
      ThbTapiCall *Call)
{
  ListBox1->Items->Add("::OnCallDeallocate");
}
//---------------------------------------------------------------------------
void __fastcall TForm1::DoShowWaveIn(TObject *Sender)
{
  ThbTapiCall* call;

  if (hbTapiLine1->Calls->Count > 0)
    call = hbTapiLine1->Calls->Items[0];
  else
    return;

  try {
    call->WaveIn->DeviceClass = ComboBox_WaveInClass->Text;
    call->WaveIn->Invalidate();
    call->WaveIn->Update();
    if (call->WaveIn->Available)
      ListBox1->Items->Add("WaveIn DeviceID is: " + IntToStr(call->WaveIn->DeviceID));
    else
      ListBox1->Items->Add("WaveIn device not available");
  } catch (Exception &e) {
    MessageDlg("Failed!" + e.Message, mtError, TMsgDlgButtons() << mbOK, 0);
  }

}
//---------------------------------------------------------------------------
void __fastcall TForm1::DoShowWaveOut(TObject *Sender)
{
  ThbTapiCall* call;

  if (hbTapiLine1->Calls->Count > 0)
    call = hbTapiLine1->Calls->Items[0];
  else
    return;

  try {
    call->WaveIn->DeviceClass = ComboBox_WaveOutClass->Text;
    call->WaveIn->Invalidate();
    call->WaveIn->Update();
    if (call->WaveIn->Available)
      ListBox1->Items->Add("WaveOut DeviceID is: " + IntToStr(call->WaveOut->DeviceID));
    else
      ListBox1->Items->Add("WaveOut device not available");
  } catch (Exception &e) {
    MessageDlg("Failed!" + e.Message, mtError, TMsgDlgButtons() << mbOK, 0);
  }
}
//---------------------------------------------------------------------------
