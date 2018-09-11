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
  TFrameCallDisplay* r;
  FCallDisp = new TList();
  r = new TFrameCallDisplay(this);
  r->Name  = "";
  r->Align = alTop;
  r->Init();
  Panel_Calls->InsertControl(r);

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
  LabelPrivilege->Caption = "";
  // If TapiLine is currently open then close it
  hbTapiLine1->Active = false;

  // Set the TapiLine->DeviceID to use the device selected in the list box
  hbTapiLine1->DeviceID = ComboBoxDevice->ItemIndex-1;

  // If there was a problem opening TapiLine last time then make sure that the
  // following properties are reset to their default->
  hbTapiLine1->Privileges->AutoSelect = true;
  if (hbTapiLine1->Available)
  try
  {
    hbTapiLine1->Active = true;
    LabelPrivilege->Caption = hbTapiLine1->Privileges->Text;

  }
  catch (EhbTapiError &E)
  {
    MessageDlg("Error opening line device: " + E.Message, mtError, TMsgDlgButtons() << mbOK, 0);
  }
}

//---------------------------------------------------------------------------
void __fastcall TForm1::Log(String value)
{
  ListBox1->Items->Add(FormatDateTime("hh:nn:ss", Now()) + " " + value);
};

int __fastcall TForm1::DisplayCount()
{
  int i = 0, n = 0;

  while (i < Panel_Calls->ControlCount)
  {
    if (Panel_Calls->Controls[i]->ClassNameIs("TFrameCallDisplay"))
      n++;
    i++;
  };
  return n;
};

TFrameCallDisplay* __fastcall TForm1::GetDisplay(int Index)
{
  int i = 0, n = 0;
  while (i < Panel_Calls->ControlCount)
  {
    if (Panel_Calls->Controls[i]->ClassNameIs("TFrameCallDisplay"))
    {
      if (Index == n)
        return (TFrameCallDisplay*) Panel_Calls->Controls[i];
      n++;
    };
    i++;
  };
  return NULL;
};

TFrameCallDisplay* __fastcall TForm1::GetDisplay_Call(ThbTapiCall* Call)
{
  TFrameCallDisplay* r = NULL;
  int i = 0;
  int n = DisplayCount();
  while (i < n)
  {
    if (Call == GetDisplay(i)->Call)
    {
      return GetDisplay(i);
    }
    else if (GetDisplay(i)->Call == NULL)
    {
      Call->Tag = (int) GetDisplay(i);
      GetDisplay(i)->Call = Call;
      return GetDisplay(i);
    };
    i++;
  };

  r = new TFrameCallDisplay(this);
  r->Name = "";
  r->Align = alTop;
  r->Init();
  FCallDisp->Add(r);
  if (Call != NULL)
    Call->Tag = (int)r;
  r->Call = Call;
  Panel_Calls->InsertControl(r);
  return r;
};

void __fastcall TForm1::RemoveCallDisplay(ThbTapiCall* Call)
{
  TFrameCallDisplay* r = NULL;
  int i = 0;
  int n = DisplayCount();
  while (i < n)
  {
    if (Call == GetDisplay(i)->Call)
    {
      r = GetDisplay(i);
      break;
    };
    i++;
  };

  if (r != NULL)
  {
    if (n > 1)
    {
      Panel_Calls->RemoveControl(r);
      delete r;
    }
    else
    {
      r->Init();
    };
  };
};

void __fastcall TForm1::UpdateCallView()
{
  int i = 0;
  ThbTapiCall* call = NULL;

  while (i < DisplayCount())
  {
    if (hbTapiLine1->Calls->IndexOf(GetDisplay(i)->Call) == -1)
    {
      Panel_Calls->RemoveControl(GetDisplay(i));
      delete GetDisplay(i);
    }
    else
      i++;
  };

  for (i=0; i<hbTapiLine1->Calls->Count;i++)
  {
    call = hbTapiLine1->Calls->Items[i];
    GetDisplay_Call(call)->UpdateView();
    GetDisplay_Call(call)->UpdateActionList();
  };

  if (DisplayCount() == 0)
    GetDisplay_Call(NULL);
};

void __fastcall TForm1::hbTapiLine1CallState(ThbTapiLine *Sender,
      ThbTapiCall *Call, DWORD CallState)
{
  GetDisplay_Call(Call)->UpdateView();
  GetDisplay_Call(Call)->UpdateActionList();
  if (CheckBox_CallStates->Checked)
    Log("::OnCallState(" + Call->StateText() + ", " + Call->StateModeText() + ")");
}
//---------------------------------------------------------------------------

void __fastcall TForm1::hbTapiLine1CallDeallocate(ThbTapiLine *Sender,
      ThbTapiCall *Call)
{
  Log("::OnCallDeallocate (Call=" + IntToHex((int)Call, 8) + ")");
  RemoveCallDisplay(Call);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Action_MakeCallExecute(TObject *Sender)
{
  if ((InputQuery("MakeCall", "Phone number", FPhoneNo) == false) || (FPhoneNo == ""))
    return;

  try
  {
    Log("MakeCall started...");
    hbTapiLine1->MakeCall(FPhoneNo);
    Log("MakeCall LastRequestID = 0x" + IntToHex((int)hbTapiLine1->LastRequestID,8));
  }
  catch(EhbTapiError &E)
  {
    Log("MakeCall failed! " + E.Message);
  }
}
//---------------------------------------------------------------------------

