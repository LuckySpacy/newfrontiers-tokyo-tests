//---------------------------------------------------------------------------

#include <vcl.h>
#include <stddef.h>
#pragma hdrstop

#include "uMain.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "hbTapi"
#pragma link "hbTapiWave"
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
}

String __fastcall TForm1::GetCallerInfo(ThbTapiCall *Call)
{
  if (Call->CallerID->Name == "")
    Call->Notes["Name"] = Call->CallerID->Name;
  if (Call->CallerID->Address != "")
    Call->Notes["Address"] = Call->CallerID->Address;

  if (Call->Notes["Name"] != "")
    return Call->Notes["Name"] + " - "  + Call->Notes["Address"];
  else
    return Call->Notes["Address"];
};

//---------------------------------------------------------------------------
void __fastcall TForm1::ComboDeviceListChange(TObject *Sender)
{
  TapiLine->Active = false;
  if (ComboDeviceList->ItemIndex >= 0)
  {
    TapiLine->Privileges->Owner = true;
    TapiLine->DeviceID = int(ComboDeviceList->Items->Objects[ComboDeviceList->ItemIndex]);
    TapiLine->Active = true;
    btnAction->Enabled = true;
  }
}
//---------------------------------------------------------------------------

void __fastcall TForm1::WaveOutDone(TObject *Sender)
{
  int i;
  String Filename;

  WaveOut->Active = false;
  i = 0;
    Filename = Format("Rec%03.3d.wav", ARRAYOFCONST((i)));
  while (FileExists(Filename))
  {
    i++;
    Filename = Format("Rec%03.3d.wav", ARRAYOFCONST((i)));
  };

  try
  {
    WaveIn->Filename = Filename;
    WaveIn->Active = true;
    StatusBar->Panels->Items[1]->Text = "Recording";
  }
  catch  (EhbTapiError &E)
  {
    ShowMessage(E.Message);
  }
}
//---------------------------------------------------------------------------

void __fastcall TForm1::TapiLineConferenced(ThbTapiLine *Sender,
      ThbTapiCall *Call)
{
  if (!Call->WaveOut->Available)
  {
    ShowMessage("Could''t get wave/out handle");
    exit;
  }

  if (!Call->WaveIn->Available)
  {
    ShowMessage("Could''t get wave/in handle");
    exit;
  }

  WaveIn->DeviceID = Call->WaveIn->DeviceID;
  WaveOut->DeviceID = Call->WaveOut->DeviceID;
  WaveOut->Playlist->Clear();
  WaveOut->Playlist->Add(edFile->Text);
  WaveOut->Playlist->Add("Beep(1300,300)");
  WaveOut->Active = true;
  StatusBar->Panels->Items[1]->Text = "Playing...";
  btnAction->Caption = "Drop";
  if (Call->MonitorDigits->Available)
    Call->MonitorDigits->Active = true; // Feature of hbTapi Professional

}
//---------------------------------------------------------------------------


void __fastcall TForm1::TapiLineOffering(ThbTapiLine *Sender,
      ThbTapiCall *Call)
{
  if (cbAutoAnswer->Checked)
  {
    TimerToAnswer->Enabled = true;
    StatusBar->Panels->Items[1]->Text = Format("Ringing. Answer in %d sec.", ARRAYOFCONST(((int)TimerToAnswer->Interval/1000)));
  };
  edCall->Text = GetCallerInfo(Call);
  btnAction->Caption = "Answer";
}
//---------------------------------------------------------------------------


void __fastcall TForm1::FormCreate(TObject *Sender)
{
  PostMessage(Handle, WM_USER, 0, 0);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::TapiLineDigit(ThbTapiLine *Sender, ThbTapiCall *Call,
      char Digit)
{
  switch (Digit)
  {
    case '*' :
      WaveOut->Active = false;
      WaveOut->Active = true;
      StatusBar->Panels->Items[1]->Text = "restarted by *";
    break;
    case '#' :
      WaveOutDone(NULL);
    break;
  }
}
//---------------------------------------------------------------------------

void __fastcall TForm1::FormKeyPress(TObject *Sender, char &Key)
{
  TapiLineDigit(NULL, NULL, Key);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::SpeedButtonStopClick(TObject *Sender)
{
  WaveOutSpeaker->Active = false;
  SpeedButtonStop->Visible = false;
  SpeedButtonPlay->Visible = true;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::WaveOutSpeakerDone(TObject *Sender)
{
  SpeedButtonStopClick(NULL);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::SpeedButton1Click(TObject *Sender)
{
  if (OpenDialog1->Execute())
  {
    edFile->Text = OpenDialog1->FileName;
    edFile->SetFocus();
  };
}
//---------------------------------------------------------------------------

void __fastcall TForm1::SpeedButtonPlayClick(TObject *Sender)
{
  String aFilename;

  if (!WaveOutSpeaker->Active)
  {
    aFilename = "";
    if (ListView_Journal->Focused() && (ListView_Journal->Items->Count > 0))
    {
      if (ListView_Journal->Selected && (ListView_Journal->Selected->SubItems->Count > 0))
      {
        aFilename = ListView_Journal->Selected->SubItems->Strings[2];
      }
    }
    else
      aFilename = edFile->Text;

    if (aFilename == "")
      return;

    WaveOutSpeaker->Playlist->Clear();
    WaveOutSpeaker->Playlist->Add(aFilename);
    WaveOutSpeaker->Active = true;
    SpeedButtonPlay->Visible = false;
    SpeedButtonStop->Visible = true;
  }
}

void __fastcall TForm1::GetLineDevices()
{
  int i;

  if (ComboDeviceList->Items->Count > 0)
    return;

  TapiLine->Privileges->Owner = false;

  // Search for possible tapi devices
  // normaly we need AUTOMATEDVOICE
  for (i=0;i<TapiLine->DeviceList->Count;i++)
  {
    TapiLine->DeviceID = i;
    if (TapiLine->Caps->MediaModes & LINEMEDIAMODE_AUTOMATEDVOICE)
    {
      try
      {
        TapiLine->Active = true;
        if (TapiLine->WaveIn->Available && TapiLine->WaveOut->Available)
        {
          ComboDeviceList->Items->AddObject(Format("DeviceID: %2.2d - %s" , ARRAYOFCONST((i, TapiLine->DeviceList->Strings[0]))),(TObject*)i);
        }
      }
      catch (EhbTapiError &E)
      {
      }
      TapiLine->Active = false;
    }
  }

  if (ComboDeviceList->Items->Count == 0)
  {
    // if there is no AUTOMATEDVOICE device
    // we look INTERACTIVEVOICE

    if (TapiLine->Caps->MediaModes & LINEMEDIAMODE_INTERACTIVEVOICE)
    {
      try
      {
        TapiLine->Active = true;
        if (TapiLine->WaveIn->Available && TapiLine->WaveOut->Available)
        {
          ComboDeviceList->Items->AddObject(Format("DeviceID: %2.2d - %s" , ARRAYOFCONST((i, TapiLine->DeviceList->Strings[0]))),(TObject*)i);
        }
      }
      catch (EhbTapiError &E)
      {
      }
      TapiLine->Active = false;
    }
  }
  if (ComboDeviceList->Items->Count == 0)
    ShowMessage("Could not find a TAPI device assigned with a wave device");

}



void TForm1::Run(TMessage &Message)
{
  Update();
  Screen->Cursor = crHourGlass;
  try
  {
    GetLineDevices();
  }
  __finally
  {
    Screen->Cursor = crDefault;
  }
}

//---------------------------------------------------------------------------

