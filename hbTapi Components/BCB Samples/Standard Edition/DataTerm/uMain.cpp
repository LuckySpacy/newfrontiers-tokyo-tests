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
void __fastcall TForm1::DoMakeCall(TObject* Sender)
{
  String s; ThbTapiCallParams *cp;
  hbTapiLine1->DeviceName = ((TMenuItem*)Sender)->Caption;

  if (!hbTapiLine1->Available)
  {
    MessageDlg("Device " + hbTapiLine1->DeviceName + " not available!", mtError, TMsgDlgButtons() << mbOK, 0);
    return;
  }

  if (!hbTapiLine1->Caps->MediaModes & LINEMEDIAMODE_DATAMODEM)
  {
    MessageDlg("LINEMEDIAMODE_DATAMODEM not supported!", mtError, TMsgDlgButtons() << mbOK, 0);
    return;
  }
  if (!InputQuery("Dial...", "Phonenumber", s) || (s == ""))
    return;

  try
  {
    hbTapiLine1->Active = true;
    cp = new ThbTapiCallParams();
    try
    {
      cp->AddressMode = LINEADDRESSMODE_ADDRESSID;
      cp->AddressID = 0;
      cp->MediaMode = LINEMEDIAMODE_DATAMODEM;
      cp->Flags = 0;
      cp->NoAnswerTimeout = 3;
      hbTapiLine1->MakeCall(s, 0, cp->TapiData);
      Log("Dialing... " + s);
    }
    __finally
    {
      delete cp;
    }
  }
  catch (Exception &E)
  {
    MessageDlg(Format("Dail failed! %s!", ARRAYOFCONST((E.Message))), mtError, TMsgDlgButtons() << mbOK, 0);
  }
}


//---------------------------------------------------------------------------
void __fastcall TForm1::FormCreate(TObject *Sender)
{
  String s; TMenuItem *m; int i; TIniFile *ini;

  for (i=0;i< hbTapiLine1->DeviceList->Count;i++)
  {
    m = new TMenuItem(this);
    m->Caption = hbTapiLine1->DeviceList->Strings[i];
    m->OnClick = DoMakeCall;
    menuDial->Add(m);
  }

  if (!ComPort1->Active)
  {
    ini = new TIniFile(ChangeFileExt(ParamStr(0), "->ini"));
    try {
      s = ini->ReadString("ComPort", "Mode", "");
      if (s != "")
        ComPort1->Settings = s;
    }
    __finally {
      delete ini;
    }
  }
  UpdateMenu();
  UpdateStatus();
}

void __fastcall TForm1::Log(String s)
{
  if (CheckBox_ShowEvents->Checked)
    ListBox2->Items->Add(s);
};

void __fastcall TForm1::UpdateMenu()
{
  menuOnLine->Checked = ComPort1->Active;
  menuPort->Enabled   = !ComPort1->Active;
  menuProperties->Enabled = !ComPort1->Active;
  menuCOM1->Checked   = ComPort1->PortName == "COM1";
  menuCOM2->Checked   = ComPort1->PortName == "COM2";
  menuCOM3->Checked   = ComPort1->PortName == "COM3";
  menuCOM4->Checked   = ComPort1->PortName == "COM4";
  menuCOM1->Enabled   = ComPort1->PortList->IndexOf("COM1") >= 0;
  menuCOM2->Enabled   = ComPort1->PortList->IndexOf("COM2") >= 0;
  menuCOM3->Enabled   = ComPort1->PortList->IndexOf("COM3") >= 0;
  menuCOM4->Enabled   = ComPort1->PortList->IndexOf("COM4") >= 0;
  menu110->Checked    = ComPort1->Baudrate == 110;
  menu300->Checked    = ComPort1->Baudrate == 300;
  menu1200->Checked   = ComPort1->Baudrate == 1200;
  menu2400->Checked   = ComPort1->Baudrate == 2400;
  menu4800->Checked   = ComPort1->Baudrate == 4800;
  menu9600->Checked   = ComPort1->Baudrate == 9600;
  menu14400->Checked  = ComPort1->Baudrate == 14400;
  menu19200->Checked  = ComPort1->Baudrate == 19200;
  menu38400->Checked  = ComPort1->Baudrate == 38400;
  menu57600->Checked  = ComPort1->Baudrate == 57600;
  menuFive->Checked   = ComPort1->Databits == 5;
  menuSix->Checked    = ComPort1->Databits == 6;
  menuSeven->Checked  = ComPort1->Databits == 7;
  menuEight->Checked  = ComPort1->Databits == 8;
  menuNone->Checked   = ComPort1->Parity == NOPARITY;
  menuEven->Checked   = ComPort1->Parity == EVENPARITY;
  menuOdd->Checked    = ComPort1->Parity == ODDPARITY;
  menuMark->Checked   = ComPort1->Parity == MARKPARITY;
  menuSpace->Checked  = ComPort1->Parity == SPACEPARITY;
  menuOne->Checked    = ComPort1->Stopbits == ONESTOPBIT;
  menuOne5->Checked   = ComPort1->Stopbits == ONE5STOPBITS;
  menuTwo->Checked    = ComPort1->Stopbits == TWOSTOPBITS;
  menuXonXoff->Checked = ComPort1->FlowCtrl->Handshake == COMPORTHANDSHAKE_XONXOFF;
  menuRtsCts->Checked  = ComPort1->FlowCtrl->Handshake == COMPORTHANDSHAKE_RTSCTS;
  menuDtrDsr->Checked  = ComPort1->FlowCtrl->Handshake == COMPORTHANDSHAKE_DTRDSR;
  menuNoFlow->Checked  = ComPort1->FlowCtrl->Handshake == COMPORTHANDSHAKE_NONE;
  menuDTR->Checked     = ComPort1->DTR;
  menuRTS->Checked     = ComPort1->RTS;
  menuTimeouts->Checked = ComPort1->Timeouts->Enabled;
  menuDSRSensitivity->Checked = ComPort1->FlowCtrl->DSRSensitivity;
};

void __fastcall TForm1::UpdateStatus()
{
  if (ComPort1->Active)
    Caption = Format("%s - Online", ARRAYOFCONST((Application->Title)));
  else
    Caption = Format("%s - Offline", ARRAYOFCONST((Application->Title)));

  Label_Info->Caption = Format("In: %d/%d | Out: %d/%d", ARRAYOFCONST(((int)ComPort1->InBuffer->Count, (int)ComPort1->InBuffer->Size, (int)ComPort1->OutBuffer->Count, (int)ComPort1->OutBuffer->Size)));
};

void __fastcall TForm1::menuOnLineClick(TObject *Sender)
{
  ComPort1->Active = !ComPort1->Active;
  Memo1->SetFocus();
  UpdateMenu();
  UpdateStatus();

}
//---------------------------------------------------------------------------

void __fastcall TForm1::menuCOMClick(TObject *Sender)
{
  ComPort1->PortName = Format("COM%d", ARRAYOFCONST((((TMenuItem*)Sender)->Tag)));
  UpdateMenu();
  UpdateStatus();

}
//---------------------------------------------------------------------------

void __fastcall TForm1::menuExitClick(TObject *Sender)
{
  Close();        
}
//---------------------------------------------------------------------------

void __fastcall TForm1::menuBaudClick(TObject *Sender)
{
  ComPort1->Baudrate = ((TMenuItem*)Sender)->Tag;
  UpdateStatus();
  UpdateMenu();

}
//---------------------------------------------------------------------------

void __fastcall TForm1::menuNoneClick(TObject *Sender)
{
  ComPort1->Parity = NOPARITY;
  UpdateStatus();
  UpdateMenu();

}
//---------------------------------------------------------------------------

void __fastcall TForm1::menuEvenClick(TObject *Sender)
{
  ComPort1->Parity = EVENPARITY;
  UpdateStatus();
  UpdateMenu();

}
//---------------------------------------------------------------------------

void __fastcall TForm1::menuOddClick(TObject *Sender)
{
  ComPort1->Parity = ODDPARITY;
  UpdateStatus();
  UpdateMenu();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::menuMarkClick(TObject *Sender)
{
  ComPort1->Parity = MARKPARITY;
  UpdateStatus();
  UpdateMenu();

}
//---------------------------------------------------------------------------

void __fastcall TForm1::menuSpaceClick(TObject *Sender)
{
  ComPort1->Parity = SPACEPARITY;
  UpdateStatus();
  UpdateMenu();

}
//---------------------------------------------------------------------------

void __fastcall TForm1::menuOneClick(TObject *Sender)
{
  ComPort1->Stopbits = ((TMenuItem*)Sender)->Tag;
  UpdateStatus();
  UpdateMenu();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::SendData(int Count)
{
  String s; int i, n;
  s = ""; i = 0; n = 'A';
  while (i < Count)
  {
    s = s + n;
    if (n < 'Z')
      n++;
    else
    {
      n = 'A';
      s = s + '\n';
    }
    i++;
  }
  Log(Format("Sending %d Bytes...", ARRAYOFCONST((n))));
  ComPort1->WriteStr(s);
}
//---------------------------------------------------------------------------


void __fastcall TForm1::ABC1Click(TObject *Sender)
{
  SendData(26);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::LargeText1Click(TObject *Sender)
{
  SendData(1024);
        
}
//---------------------------------------------------------------------------

void __fastcall TForm1::N1MB1Click(TObject *Sender)
{
  SendData(10 * 1024);

}
//---------------------------------------------------------------------------

void __fastcall TForm1::menuStopsendingClick(TObject *Sender)
{
  ComPort1->OutBuffer->Clear();
  UpdateStatus();

}
//---------------------------------------------------------------------------

void __fastcall TForm1::menuAutoReceiveClick(TObject *Sender)
{
  menuAutoReceive->Checked = !menuAutoReceive->Checked;

}
//---------------------------------------------------------------------------

void __fastcall TForm1::DoUpdateStatus(TObject *Sender)
{
  UpdateStatus();

}
//---------------------------------------------------------------------------

void __fastcall TForm1::ComPort1Event(TObject *Sender, DWORD Events)
{
  Memo1->Lines->Add(Format("[%s]", ARRAYOFCONST((CommEventsToStr(Events, ',')))));

}
//---------------------------------------------------------------------------

void __fastcall TForm1::menuDSRSensitivityClick(TObject *Sender)
{
  ComPort1->FlowCtrl->DSRSensitivity = !ComPort1->FlowCtrl->DSRSensitivity;
  UpdateMenu();

}
//---------------------------------------------------------------------------

void __fastcall TForm1::menuReceiveDataClick(TObject *Sender)
{
  String s1, s2; int i;

  Memo1->Lines->BeginUpdate();
  try
  {
    s1 = ComPort1->ReadStr();
    s2 = "";
    for (i=1;i<=s1.Length();i++)
    {
      if (s1[i] < ' ')
        s2 = s2 + "<#" + IntToStr(s1[i]) + ">";
      else
        s2 = s2 + s1[i];
      if (s1[i] == 13)
      {
        if (Memo1->Lines->Count == 0)
          Memo1->Lines->Add(s2);
        else
          Memo1->Lines->Strings[Memo1->Lines->Count-1] = Memo1->Lines->Strings[Memo1->Lines->Count-1] + s2;
        Memo1->Lines->Add("");
        s2 = "";
      }
    }
    if (Memo1->Lines->Count == 0)
      Memo1->Lines->Add(s2);
    else
      Memo1->Lines->Strings[Memo1->Lines->Count-1] = Memo1->Lines->Strings[Memo1->Lines->Count-1] + s2;
  }
  __finally
  {
    Memo1->Lines->EndUpdate();
  }
  if (menuEcho->Checked)
    ComPort1->WriteStr(s1);
  UpdateStatus();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Read10Bytes1Click(TObject *Sender)
{
  ComPort1->ReadStr(10);

}
//---------------------------------------------------------------------------


void __fastcall TForm1::ComPort1Receive(TObject *Sender, int Count)
{
  String s1, s2; int i;
  Log(Format("::OnReceive (%d Bytes received)", ARRAYOFCONST((Count))));
  UpdateStatus();

  Memo1->Lines->BeginUpdate();
  try
  {
    s1 = ComPort1->ReadStr();
    s2 = "";
    for (i=1;i<=s1.Length();i++)
    {
      if (s1[i] < ' ')
        s2 = s2 + "<#" + IntToStr(s1[i]) + ">";
      else
        s2 = s2 + s1[i];
      if (s1[i] == 13)
      {
        if (Memo1->Lines->Count == 0)
          Memo1->Lines->Add(s2);
        else
          Memo1->Lines->Strings[Memo1->Lines->Count-1] = Memo1->Lines->Strings[Memo1->Lines->Count-1] + s2;
        Memo1->Lines->Add("");
        s2 = "";
      }
    }
    if (Memo1->Lines->Count == 0)
      Memo1->Lines->Add(s2);
    else
      Memo1->Lines->Strings[Memo1->Lines->Count-1] = Memo1->Lines->Strings[Memo1->Lines->Count-1] + s2;
  }
  __finally
  {
    Memo1->Lines->EndUpdate();
  }
  if (menuEcho->Checked)
    ComPort1->WriteStr(s1);

  UpdateStatus();
}
//---------------------------------------------------------------------------








void __fastcall TForm1::DoClearList(TObject *Sender)
{
  ((TListBox*)Sender)->Items->Clear();

}
//---------------------------------------------------------------------------

void __fastcall TForm1::Memo1KeyPress(TObject *Sender, char &Key)
{
  if (ComPort1->Active)
    ComPort1->WriteStr(Key);

}
//---------------------------------------------------------------------------

void __fastcall TForm1::menuDTRClick(TObject *Sender)
{
  ComPort1->DTR = !ComPort1->DTR;
  UpdateStatus();
  UpdateMenu();

}
//---------------------------------------------------------------------------

void __fastcall TForm1::menuRTSClick(TObject *Sender)
{
  ComPort1->RTS = True;
  UpdateStatus();
  UpdateMenu();

}
//---------------------------------------------------------------------------

void __fastcall TForm1::ComPort1Activate(TObject *Sender)
{
  Timer1->Enabled = true;
  Log("::OnActivate");
        
}
//---------------------------------------------------------------------------

void __fastcall TForm1::ComPort1Deactivate(TObject *Sender)
{
  Timer1->Enabled = true;
  Log("::OnDeactivate");

}
//---------------------------------------------------------------------------

void __fastcall TForm1::ComPort1TxEmpty(TObject *Sender)
{
  Log(Format("::OnTxEmpty OutBuffer->Count = %d", ARRAYOFCONST(((int)ComPort1->OutBuffer->Count))));

}
//---------------------------------------------------------------------------

void __fastcall TForm1::ComPort1Timeout(TObject *Sender, int Count)
{
  Log(Format("::OnTimeout %d Bytes sent", ARRAYOFCONST((Count))));

}
//---------------------------------------------------------------------------

void __fastcall TForm1::ComPort1DCD(TObject *Sender)
{
  Log(Format("::OnDCD DCD = %d", ARRAYOFCONST(((int)ComPort1->DCD))));

}
//---------------------------------------------------------------------------

void __fastcall TForm1::ComPort1Error(TObject *Sender, DWORD Errors)
{
  Log(Format("::OnError (%s)", ARRAYOFCONST((CommErrorsToStr(Errors, ",")))));

}
//---------------------------------------------------------------------------

void __fastcall TForm1::DoMemoClear(TObject *Sender,
      TPoint &MousePos, bool &Handled)
{
  ((TMemo*)Sender)->Lines->Clear();

}
//---------------------------------------------------------------------------

void __fastcall TForm1::menuTimeoutsClick(TObject *Sender)
{
  ComPort1->Timeouts->Enabled = !ComPort1->Timeouts->Enabled;
  UpdateMenu();
  UpdateStatus();
}
//---------------------------------------------------------------------------


void __fastcall TForm1::ComPort1Ring(TObject *Sender)
{
  Log("::OnRing");

}
//---------------------------------------------------------------------------


void __fastcall TForm1::Hangup1Click(TObject *Sender)
{
  ComPort1->Active = false;
  if (hbTapiLine1->Calls->Count > 0)
    hbTapiLine1->Calls->Items[0]->Drop("");
  else
    hbTapiLine1->Active = false;
  Memo1->SetFocus();
  UpdateMenu();
  UpdateStatus();

}
//---------------------------------------------------------------------------

void __fastcall TForm1::hbTapiLine1CallState(ThbTapiLine *Sender,
      ThbTapiCall *Call, DWORD CallState)
{
  Log("Call State: " + LineCallStateToStr(CallState));
  if (CallState == LINECALLSTATE_CONNECTED)
  {
    if (Call->Comm->Available)
    {
      ComPort1->Handle = Call->Comm->Handle;
      ComPort1->Active = true;
      Log(Format("Connected (%d-%d-%s-%s)", ARRAYOFCONST(((int)ComPort1->Baudrate, ComPort1->Databits, ParityToStr(ComPort1->Parity), StopBitsToStr(ComPort1->Stopbits)))));
    }
  }
  else if (ComPort1->Active)
  {
    ComPort1->Active = false;
    hbTapiLine1->Active = false;
  }

  Memo1->SetFocus();
  UpdateMenu();
  UpdateStatus();

}
//---------------------------------------------------------------------------

void __fastcall TForm1::hbTapiLine1CallDeallocate(ThbTapiLine *Sender,
      ThbTapiCall *Call)
{
  Log("Line closed");
  hbTapiLine1->Active = false;
  UpdateMenu();
  UpdateStatus();

}
//---------------------------------------------------------------------------

void __fastcall TForm1::menuEchoClick(TObject *Sender)
{
  menuEcho->Checked = !menuEcho->Checked;

}
//---------------------------------------------------------------------------

void __fastcall TForm1::ComPort1DSR(TObject *Sender)
{
  Log(Format("::OnDSR DSR=%d", ARRAYOFCONST(((int)ComPort1->DSR))));

}
//---------------------------------------------------------------------------

void __fastcall TForm1::ComPort1Break(TObject *Sender)
{
  Log("::OnBreak");

}
//---------------------------------------------------------------------------

void __fastcall TForm1::ComPort1CTS(TObject *Sender)
{
  Log(Format("::OnCTS CTS=%d", ARRAYOFCONST(((int)ComPort1->CTS))));

}
//---------------------------------------------------------------------------

void __fastcall TForm1::menuBreakClick(TObject *Sender)
{
  ComPort1->SendBreak(2000);

}
//---------------------------------------------------------------------------

