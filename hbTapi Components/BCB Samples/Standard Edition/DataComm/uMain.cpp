//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "uMain.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "hbComm"
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
  int i;
  // Get all line devices which support data communications
  for (i=0;i<hbTapiLine1->DeviceList->Count;i++)
  {
    hbTapiLine1->DeviceID = i;
    if (hbTapiLine1->Available && (hbTapiLine1->Caps->MediaModes & LINEMEDIAMODE_DATAMODEM))
      ComboBoxDevice->Items->Add(hbTapiLine1->DeviceList->Strings[i]);
  }

  if (ComboBoxDevice->Items->Count > 0)
    ComboBoxDevice->ItemIndex = 0;

  ComboBox_Timeout->Text = IntToStr((int)hbTapiLine1->Options->ReplyTimeout / 1000);
  ComboBoxDevice->ItemIndex = 0;
  ComboBoxDeviceChange(ComboBoxDevice);
//  UpdateCalls();
//  UpdateComm();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::ComboBoxDeviceChange(TObject *Sender)
{
  if (hbTapiLine1->Active)
  {
    CheckBoxActive->Checked = false;
    hbTapiLine1->Active = false;
  };
  hbTapiLine1->DeviceID = ComboBoxDevice->ItemIndex;
}

//---------------------------------------------------------------------------

void __fastcall  TForm1::Log(String Value)
{
  ListBox_Log->Items->Add(Value);
};

void __fastcall TForm1::CheckBoxActiveClick(TObject *Sender)
{
  // To abvoid errors, we only use LINEMEDIAMODE_DATAMODEM
  hbTapiLine1->MediaModes = LINEMEDIAMODE_DATAMODEM;
  hbTapiLine1->Privileges->Owner = true;
  hbTapiLine1->Privileges->Monitor = true;

  if (!CheckBoxActive->Checked)
  {
    if (hbTapiLine1->Active)
    {
      hbTapiLine1->Active = false;
      Log("Device closed");
    }
  }
  else
  {
    if (!hbTapiLine1->Active)
    try
    {
      hbTapiLine1->Active = true;
      Log("Device opened");
    }
    catch (EhbTapiError &E)
    {
      Log(E.Message);

     // Try it again withif (! privileges
      hbTapiLine1->Privileges->None = true;
      try
      {
        hbTapiLine1->Active = true;
        Log("Device opened, butif (! 100% TAPI compatible");
      }
      catch (EhbTapiError &E)
      {
        Log(E.Message);
      }
    };
  };
}
//---------------------------------------------------------------------------

void __fastcall TForm1::UpdateCalls()
{
  if (hbTapiLine1->Calls->Count > 0)
  {
    Label_CallState->Caption = hbTapiLine1->Calls->Items[0]->StateText();
    if (hbTapiLine1->Calls->Items[0]->IsOutgoing())
    {
      Label_Info->Caption = "Outgoing Call";

      //  CalledID is a feature of the Professional Edition
      if (hbTapiLine1->Calls->Items[0]->CalledID->AddressAvail)
      {
         Label_Info->Caption = Label_Info->Caption + hbTapiLine1->Calls->Items[0]->CalledID->Address;
      }
      else
      {
      };
    }
    else if (hbTapiLine1->Calls->Items[0]->IsIncoming() && hbTapiLine1->Calls->Items[0]->CallerID->AddressAvail)
    {
      Label_Info->Caption = hbTapiLine1->Calls->Items[0]->CallerID->Address;
    }
  }
  else
  {
    Label_CallState->Caption = "NO CALL";
    Label_Info->Caption      = "";
  };
};

void __fastcall TForm1::UpdateComm()
{
  if (ComPort1->Active)
    Label_Com->Caption = "ACTIVE";
  else
    Label_Com->Caption = "NOT ACTIVE";
};

ThbTapiCall* __fastcall TForm1::GetCall()
{
  if (hbTapiLine1->Calls->Count > 0)
    return hbTapiLine1->Calls->Items[0];
  else
    return NULL;
};

void __fastcall TForm1::DoMakeCall(TObject *Sender)
{
  ThbTapiCallParams* cp;

  hbTapiLine1->Options->ReplyTimeout = StrToIntDef(ComboBox_Timeout->Text, 10) * 1000;
  // use the ThbTapiCallParams entead of ThbTapiLine->CallParams
  cp = new ThbTapiCallParams;
  try
  {
    cp->AddressMode = LINEADDRESSMODE_ADDRESSID;
    cp->AddressID = 0;
    cp->MediaMode = LINEMEDIAMODE_DATAMODEM;
    cp->Flags = 0;
    cp->NoAnswerTimeout = 3;
   hbTapiLine1->MakeCall(EditCallPhoneNumber->Text, 0, cp->TapiData);
  }
  __finally
  {
    delete cp;
  }
};

void __fastcall TForm1::DoDrop(TObject *Sender)
{
  ThbTapiCall* c;
  hbTapiLine1->Options->ReplyTimeout = StrToIntDef(ComboBox_Timeout->Text, 10) * 1000;
  c = GetCall();
  if (c == NULL)
    return;
  c->Drop("");
}

void __fastcall TForm1::DoAnswer(TObject *Sender)
{
  ThbTapiCall* c;
  hbTapiLine1->Options->ReplyTimeout = StrToIntDef(ComboBox_Timeout->Text, 10) * 1000;
  c = GetCall();
  if (c == NULL)
    return;
  c->Answer("");
}

void __fastcall TForm1::hbTapiLine1CallState(ThbTapiLine *Sender,
      ThbTapiCall *Call, DWORD CallState)
{
  switch (Call->State)
  {
    case LINECALLSTATE_CONNECTED :
      Log("Connected");
      if (Call->Comm->Available)
        Log(Format("Comm-Handle available (0x%X)", ARRAYOFCONST(((int)Call->Comm->Handle))));
      else
        Log("Comm Handleif (! available");

      if (Call->Comm->Available && (ComPort1->Active == FALSE))
      {
        ListBox1->Items->Clear();
        ListBox2->Items->Clear();
        ComPort1->Handle == Call->Comm->Handle;
        try
        {
          ComPort1->Active = true;
        }
        catch (Exception &E)
        {
        }
      };
    break;
    default :
      if (ComPort1->Active)
      {
        ComPort1->Active = false;
        ComPort1->Handle = 0;
        Log("ComPort closed");
      };
  }
  UpdateCalls();
  UpdateComm();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::hbTapiLine1CallDeallocate(ThbTapiLine *Sender,
      ThbTapiCall *Call)
{
  UpdateCalls();

}
//---------------------------------------------------------------------------

void __fastcall TForm1::ButtonSendClick(TObject *Sender)
{
  ComPort1->WriteStr(Edit1->Text);
  ComPort1->WriteStr("\n");

}
//---------------------------------------------------------------------------

void __fastcall TForm1::ComPort1Receive(TObject *Sender, int Count)
{
  String s1, s2; int i;
  s1 = ComPort1->ReadStr(Count);
  s2 = "";
  for (i=1; i<=s1.Length(); i++)
  {
    if (s1[i] < ' ')
      s2 = s2 + '<' + IntToStr(s1[i]) + '>';
    else
      s2 = s2 + s1[i];
    if (s1[i] == 10)
    {
      if (ListBox2->Items->Count == 0)
        ListBox2->Items->Add(s2);
      else
        ListBox2->Items->Strings[ListBox2->Items->Count-1] = ListBox2->Items->Strings[ListBox2->Items->Count-1] + s2;
      ListBox2->Items->Add("");
      s2 = "";
    }
  };
  if (ListBox2->Items->Count == 0)
    ListBox2->Items->Add(s2);
  else
    ListBox2->Items->Strings[ListBox2->Items->Count-1] = ListBox2->Items->Strings[ListBox2->Items->Count-1] + s2;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::DoClearList(TObject *Sender)
{
  ((TListBox*) Sender)->Items->Clear();

}
//---------------------------------------------------------------------------


