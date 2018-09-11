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
  // Fill in the ComboBox with all available telephony line devices
  ComboBoxDevice->Items->Assign(hbTapiLine1->DeviceList);
  if (ComboBoxDevice->Items->Count > 0)
    ComboBoxDevice->Items->Insert(0, "- none -");
  else
    ComboBoxDevice->Items->Add("- none -");

  ComboBoxDevice->ItemIndex = 0;
        
}
//---------------------------------------------------------------------------
void __fastcall TForm1::ComboBoxDeviceChange(TObject *Sender)
{
  // If TapiLine is currently open then close it
  hbTapiLine1->Active = false;

  // Set the TapiLine->DeviceID to use the device selected in the list box
  hbTapiLine1->DeviceID = ComboBoxDevice->ItemIndex-1;

  // If there was a problem opening TapiLine last time then make sure that the
  // following properties are reset to their default->
  hbTapiLine1->Privileges->Monitor = true;
  hbTapiLine1->Privileges->Owner   = true;

  try
  {
    hbTapiLine1->Active = true;
  }
  catch (EhbTapiError &E)
  {
    if (E.ErrorCode == LINEERR_INVALMEDIAMODE)
    {
      try
      {
        hbTapiLine1->Privileges->Owner = false;
        hbTapiLine1->Active = true;
      }
      catch (Exception &E)
      {
        MessageDlg("Error opening line device: " + E.Message, mtError, TMsgDlgButtons() << mbOK, 0);
      }
      MessageDlg("This device is not 100% TAPI compliant", mtWarning, TMsgDlgButtons() << mbOK, 0);
    }
    else // Time for a little error checking
      MessageDlg("Error opening line device: " + E.Message, mtError, TMsgDlgButtons() << mbOK, 0);
  }
}

//---------------------------------------------------------------------------
void __fastcall TForm1::ShowCallInfo(ThbTapiCall *Call)
{
  if (Call == NULL)
  {
    Edit_CallState->Text = "";
    Edit_CallerID->Text = "";
    Edit_CallerIDName->Text = "";
    Label_CallerID->Font->Style = Label_CallerID->Font->Style >> fsBold;
    Label_CallerIDName->Font->Style = Label_CallerIDName->Font->Style >> fsBold;
    return;
  }

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

  // Check a few of the TapiLine.CallerID Flags
  if (Call->CallerID->Blocked)
    EditInfo->Text = "Blocked";
  if (Call->CallerID->OutOfArea)
    EditInfo->Text = "Out of area";

  Edit_CallState->Text = Call->StateText();
}

//---------------------------------------------------------------------------
void __fastcall TForm1::hbTapiLine1CallState(ThbTapiLine *Sender,
      ThbTapiCall *Call, DWORD CallState)
{
  if ((CallState == LINECALLSTATE_OFFERING) && CheckBox_Accept->Checked && (Call->Features & LINECALLFEATURE_ACCEPT))
  {
    try
    {
      Call->Accept("");
    }
    catch (EhbTapiError &E)
    {
    }
  }
  ShowCallInfo(Call);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::hbTapiLine1CallEnd(ThbTapiLine *Sender,
      ThbTapiCall *Call)
{
  ShowCallInfo(Call);

}
//---------------------------------------------------------------------------
void __fastcall TForm1::hbTapiLine1CallerID(ThbTapiLine *Sender,
      ThbTapiCall *Call)
{
  ShowCallInfo(Call);

}

void __fastcall TForm1::hbTapiLine1CallInfo(ThbTapiLine *Sender, ThbTapiCall *Call,
      DWORD InfoState)
{
  ShowCallInfo(Call);
	
}
//---------------------------------------------------------------------------

void __fastcall TForm1::hbTapiLine1CallDeallocate(ThbTapiLine *Sender,
      ThbTapiCall *Call)
{
  ShowCallInfo(NULL);

}
//---------------------------------------------------------------------------

