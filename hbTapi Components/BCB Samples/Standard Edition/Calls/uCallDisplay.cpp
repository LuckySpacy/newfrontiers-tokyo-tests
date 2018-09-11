//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "uCallDisplay.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFrameCallDisplay *FrameCallDisplay;
//---------------------------------------------------------------------------
__fastcall TFrameCallDisplay::TFrameCallDisplay(TComponent* Owner)
        : TFrame(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TFrameCallDisplay::Init()
{
  int i;
  Call = NULL;
  UpdateView();
  UpdateActionList();
}

void __fastcall TFrameCallDisplay::UpdateActionList()
{
  if (Call == NULL)
  {
    Action_Dial->Enabled               = false;
    Action_Drop->Enabled = false;
    Action_AnswerCall->Enabled         = false;
    Action_HoldCall->Enabled           = false;
    Action_SwapHold->Enabled           = false;
    Action_BlindTransfer->Enabled      = false;
  }
  else if (Call->Features != 0)
  {
    // We use the Call->Features flags; set the available actions
    Action_Dial->Enabled               = ((Call->Features & LINECALLFEATURE_DIAL) > 0);
    Action_Drop->Enabled               = ((Call->Features & LINECALLFEATURE_DROP) > 0);
    Action_AnswerCall->Enabled         = ((Call->Features & LINECALLFEATURE_ANSWER) > 0);
    Action_HoldCall->Enabled           = ((Call->Features & LINECALLFEATURE_HOLD) > 0);
    Action_SwapHold->Enabled           = ((Call->Features & LINECALLFEATURE_SWAPHOLD) > 0);
    Action_BlindTransfer->Enabled      = ((Call->Features & LINECALLFEATURE_BLINDTRANSFER) > 0);
  }
  else
  {
    // if (the driver does not set therese flags correctly, you need; use the call states->
    Action_Dial->Enabled               = (Call->State == LINECALLSTATE_DIALTONE);
    Action_Drop->Enabled         = ((Call->State & (LINECALLSTATE_IDLE | LINECALLSTATE_UNKNOWN)) == 0);
    Action_AnswerCall->Enabled         = (Call->State == LINECALLSTATE_OFFERING);
    Action_HoldCall->Enabled           = (Call->IsHeld() || Call->IsConnected());
    Action_SwapHold->Enabled           = Call->IsHeld();
    Action_BlindTransfer->Enabled      = Call->IsConnected();
  };
};

void __fastcall TFrameCallDisplay::UpdateView()
{
  ImageState->Picture->Assign(NULL);
  Label_CallerID->Caption = "";
  Label_CalledID->Caption = "";
  Label_Address->Caption  = "";
  Label_State->Caption    = "";
  Label_Detail->Caption   = "";
  Label_Features->Caption =  "";
  Label_Mode->Caption   = "";

  if (Call == NULL )
    return;

  Label_CallerID->Caption = Call->CallerID->Address;
  if (Call->CallerID->NameAvail )
     Label_CallerID->Caption = Label_CallerID->Caption + " (" + Call->CallerID->Name + ")";;
  Label_CalledID->Caption = Call->CalledID->Address;
  if (Call->CalledID->NameAvail )
     Label_CalledID->Caption = Label_CalledID->Caption + " (" + Call->CalledID->Name + ")";;
  Label_Address->Caption  = Call->Address->AddressName;
  Label_State->Caption  = Call->StateText();;

  if (Call->State && (LINECALLSTATE_DISCONNECTED | LINECALLSTATE_CONNECTED |
     LINECALLSTATE_DIALTONE | LINECALLSTATE_OFFERING | LINECALLSTATE_SPECIALINFO) > 0)
    Label_Detail->Caption = Call->StateModeText();
  Label_Features->Caption = Call->FeaturesText();
  Label_Mode->Caption = Call->MediaModeText();

  ImageState->Picture->Assign(NULL);
  switch (Call->State)
  {
    case LINECALLSTATE_IDLE               : ImageList1->GetBitmap(1, ImageState->Picture->Bitmap); break;
    case LINECALLSTATE_OFFERING           : ImageList1->GetBitmap(4, ImageState->Picture->Bitmap); break;
    case LINECALLSTATE_ACCEPTED           : break;
    case LINECALLSTATE_DIALTONE           :
    case LINECALLSTATE_DIALING            :
    case LINECALLSTATE_RINGBACK           :
    case LINECALLSTATE_PROCEEDING         : ImageList1->GetBitmap(2, ImageState->Picture->Bitmap); break;
    case LINECALLSTATE_BUSY               : ImageList1->GetBitmap(8, ImageState->Picture->Bitmap); break;
    case LINECALLSTATE_SPECIALINFO        :
    case LINECALLSTATE_CONNECTED          : ImageList1->GetBitmap(3, ImageState->Picture->Bitmap); break;
    case LINECALLSTATE_CONFERENCED        : ImageList1->GetBitmap(7, ImageState->Picture->Bitmap); break;
    case LINECALLSTATE_ONHOLD             :
    case LINECALLSTATE_ONHOLDPENDCONF     :
    case LINECALLSTATE_ONHOLDPENDTRANSFER : ImageList1->GetBitmap(5, ImageState->Picture->Bitmap); break;
    case LINECALLSTATE_DISCONNECTED       : ImageList1->GetBitmap(6, ImageState->Picture->Bitmap); break;
  };

};
void __fastcall TFrameCallDisplay::Action_DropExecute(TObject *Sender)
{
  try
  {
    Call->Drop("");
  }
  catch (EhbTapiError &E)
  {
    MessageDlg("Drop failed! " + E.Message, mtError, TMsgDlgButtons() << mbOK,0);
  }
}
//---------------------------------------------------------------------------
void __fastcall TFrameCallDisplay::Action_HoldCallExecute(TObject *Sender)
{
  try
  {
    if (Call->IsHeld())
      Call->Unhold();
    else
      Call->Hold();
  }
  catch (EhbTapiError &E)
  {
    MessageDlg("Hold/UnHold failed! " + E.Message, mtError, TMsgDlgButtons() << mbOK,0);
  }

}
//---------------------------------------------------------------------------
void __fastcall TFrameCallDisplay::Action_AnswerCallExecute(
      TObject *Sender)
{
  try
  {
    Call->Answer("");
  }
  catch (EhbTapiError &E)
  {
    MessageDlg("Answer failed! " + E.Message, mtError, TMsgDlgButtons() << mbOK,0);
  }

}
//---------------------------------------------------------------------------
void __fastcall TFrameCallDisplay::Action_DialExecute(TObject *Sender)
{
  String s;
  if ((InputQuery("Dial", "Phone number", s) == false) || (s == ""))
    return;

  try
  {
    Call->Dial(s);
  }
  catch(EhbTapiError &E)
  {
    MessageDlg("Dial failed! " + E.Message, mtError, TMsgDlgButtons() << mbOK,0);
  }
}
//---------------------------------------------------------------------------
