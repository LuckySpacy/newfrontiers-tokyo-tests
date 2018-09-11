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
  hbTapiLine1->Options->SyncMode = CheckBox_SyncMode->Checked;
  // Fill in the ComboBox with all available telephony line devices
  ComboBox_Device->Items->Assign(hbTapiLine1->DeviceList);
  if (ComboBox_Device->Items->Count > 0)
  {
    ComboBox_Device->Items->Insert(0, "- none -");
  }
  else
  {
    ComboBox_Device->Items->Add("- none -");
  }

  ComboBox_Device->ItemIndex = 0;
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

  if (hbTapiLine1->Available != true)
  {
    ComboBox_MediaMode->Items->Clear();
    ComboBox_Address->Items->Clear();
    return;
  };

  // Fill in the ComboBox with all supporting media modes->
  LineMediaModesToStrList(hbTapiLine1->Caps->MediaModes, ComboBox_MediaMode->Items);
  if (ComboBox_MediaMode->Items->Count > 0)
    ComboBox_MediaMode->ItemIndex = 0;

  ComboBox_Address->Items->Assign(hbTapiLine1->AddressList);
  if (ComboBox_Address->Items->Count > 0)
    ComboBox_Address->ItemIndex = 0;

  try
  {
    hbTapiLine1->Active = True;
//    ListBox1->Items->add(Format('Line is opened %d times',[hbTapiLine1->Status->NumOpens]));
  }
  catch (const EhbTapiError &tapiErr)
  {
    switch (tapiErr.ErrorCode) {
      case LINEERR_INVALMEDIAMODE :
        try
        {
          hbTapiLine1->Privileges->Owner = FALSE;
          hbTapiLine1->Active = True;
          MessageDlg("This device is not 100% TAPI compliant",mtWarning, TMsgDlgButtons() << mbOK,0);
        }
        catch (const Exception &Err)
        {
          MessageDlg("Error opening line device: " + Err.Message, mtError, TMsgDlgButtons() << mbOK,0);
        }
      default :
        MessageDlg("Error opening line device: " + tapiErr.Message, mtError, TMsgDlgButtons() << mbOK,0);
    };
  };
}
//---------------------------------------------------------------------------
void __fastcall TForm1::DoMakeCall(TObject *Sender)
{
  try
  {
    hbTapiLine1->CallParams->MediaMode = StrToLineMediaMode(ComboBox_MediaMode->Text,0);
    hbTapiLine1->CallParams->AddressID = ComboBox_Address->ItemIndex;
    ListBox1->Items->Add("Calling hbTapiLine1.MakeCall...");
    hbTapiLine1->MakeCall(EditPhoneNo->Text);
    if (hbTapiLine1->Options->SyncMode)
    {
      ListBox1->Items->Add("MakeCall returned.");
    }
    else
    {
      ListBox1->Items->Add("MakeCall returned. LastRequestID= 0x" + IntToHex(int(hbTapiLine1->LastRequestID), 2));
      FNumMakeCall =+ 1;
      hbTapiLine1->SetRequestNote(hbTapiLine1->LastRequestID, FNumMakeCall, 1);
    };
  }
  catch (EhbTapiError &tapiErr)
  {
    MessageDlg("MakeCall failed! " + tapiErr.Message, mtError, TMsgDlgButtons() << mbOK, 0);
  };
}
//---------------------------------------------------------------------------
void __fastcall TForm1::hbTapiLine1CallState(ThbTapiLine *Sender,
      ThbTapiCall *Call, DWORD CallState)
{
  ListBox1->Items->Add("::OnCallState (" + Call->StateText() + ")");
  if (Call->CallerID->AddressAvail)
  {
    ListBox1->Items->Add("CallerID Address = " + Call->CallerID->Address);
  };
}
//---------------------------------------------------------------------------
void __fastcall TForm1::hbTapiLine1CallEnd(ThbTapiLine *Sender,
      ThbTapiCall *Call)
{
  ListBox1->Items->Add("::OnCallEnd");

}
//---------------------------------------------------------------------------
void __fastcall TForm1::hbTapiLine1CallerID(ThbTapiLine *Sender,
      ThbTapiCall *Call)
{
  ListBox1->Items->Add("::OnCallerID (" + Call->CallerID->Address + ", " + Call->CallerID->Name + ")");
  if (Call->CallerID->AddressAvail)
    ListBox1->Items->Add("Caller Address = " + Call->CallerID->Address);
  if (Call->CallerID->NameAvail)
    ListBox1->Items->Add("Caller Name = " + Call->CallerID->Name);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::hbTapiLine1CallDeallocate(ThbTapiLine *Sender,
      ThbTapiCall *Call)
{
  ListBox1->Items->Add("::OnCallDeallocate");
}
//---------------------------------------------------------------------------
void __fastcall TForm1::CheckBox_SyncModeClick(TObject *Sender)
{
  hbTapiLine1->Options->SyncMode = CheckBox_SyncMode->Checked;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::ListBox1DblClick(TObject *Sender)
{
  ListBox1->Items->Clear();        
}
//---------------------------------------------------------------------------
void __fastcall TForm1::ComboBox_PrivilegesChange(TObject *Sender)
{
  if (ComboBox_Device->ItemIndex > 0)
    ComboBox_DeviceChange(NULL);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::DoAnswerCall(TObject *Sender)
{
  if (hbTapiLine1->Calls->Count > 0)
  {
    ListBox1->Items->Add("Calling Call->Answer...");
    hbTapiLine1->Calls->Items[0]->Answer("");
    if (hbTapiLine1->Options->SyncMode)
      ListBox1->Items->Add("Call->Answer returned");
    else
      ListBox1->Items->Add("Answer returned-> LastRequestID = 0x" + IntToHex(int(hbTapiLine1->LastRequestID), 2));
  };
}
//---------------------------------------------------------------------------
void __fastcall TForm1::DoMakeCall2(TObject *Sender)
{
  ThbTapiCallParams *cp;

  cp = new ThbTapiCallParams;
  try
  {
    try
    {
      cp->MediaMode = StrToLineMediaMode(ComboBox_MediaMode->Text,0);
      cp->AddressID = ComboBox_Address->ItemIndex;
      // here we use the Flags property instead of BlockID by example
      // LINECALLPARAMFLAGS_ const for further information
      if (CheckBox_BlockID->Checked)
        cp->Flags = LINECALLPARAMFLAGS_BLOCKID;

      ListBox1->Items->Add("Calling hbTapiLine1->MakeCall->->->");
      hbTapiLine1->MakeCall(EditPhoneNo->Text, 0, cp->TapiData);

      if (hbTapiLine1->Options->SyncMode)
      {
        ListBox1->Items->Add("MakeCall returned->");
      }
      else
      {
        ListBox1->Items->Add("MakeCall returned-> LastRequestID= 0x" + IntToHex(int(hbTapiLine1->LastRequestID), 2));
        hbTapiLine1->SetRequestNote(hbTapiLine1->LastRequestID, "NumMakeCall", FNumMakeCall);
      };
    }
    catch (EhbTapiError &tapiErr)
    {
      MessageDlg("MakeCall failed! " + tapiErr.Message, mtError, TMsgDlgButtons() << mbOK, 0);
    }
  }
  __finally
  {
    delete cp;
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button5Click(TObject *Sender)
{
  if (hbTapiLine1->Calls->Count > 0)
  {
    ListBox1->Items->Add("Calling Call->Drop...");
    hbTapiLine1->Calls->Items[0]->Drop("");
    if (hbTapiLine1->Options->SyncMode)
      ListBox1->Items->Add("Call->Drop returned");
    else
      ListBox1->Items->Add("Drop returned-> LastRequestID = 0x" + IntToHex(int(hbTapiLine1->LastRequestID), 2));
  };
}
//---------------------------------------------------------------------------
