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
  // Fill in the list box with all available telephony devices
  ComboBoxDevice->Items->Assign(hbTapiLine1->DeviceList);
  Edit2->Text = IntToStr((int)hbTapiLine1->CallOptions->GatherDigits->NumDigits);
  CheckBox_MonitorDigitsAutoSelect->Checked = hbTapiLine1->CallOptions->MonitorDigits->AutoSelect;

}
//---------------------------------------------------------------------------
void __fastcall TForm1::ComboBoxDeviceChange(TObject *Sender)
{
  Label1->Caption = "";

  // If TapiLine is currently open) close it
  hbTapiLine1->Active = false;

  // Set TapiLine to use the device selected in the list box
  hbTapiLine1->DeviceID = ComboBoxDevice->ItemIndex;

  // If there was a problem opening etLine last time) make sure that the
  // following properties are reset to their default->
  hbTapiLine1->Privileges->Monitor = true;
  hbTapiLine1->Privileges->Owner   = true;

  try
  {
    hbTapiLine1->Active = true;
    ListBox1->Items->Add("Device is active (open)");
  }
  catch (EhbTapiError &E)
  {
    if (E.ErrorCode == LINEERR_INVALMEDIAMODE)
    {
      hbTapiLine1->Privileges->Owner = false;
      try
      {
        hbTapiLine1->Active = true;
        ListBox1->Items->Add("Device is active (open)");
      }
      catch (EhbTapiError &E)
      {
        MessageDlg("Error opening line device: " + E.Message, mtError, TMsgDlgButtons() << mbOK,0);
      };
      ListBox1->Items->Add("This device is not 100% TAPI compliant");
    }
    else
    {
      MessageDlg("Error opening line device: " + E.Message, mtError, TMsgDlgButtons() << mbOK,0);
      ListBox1->Items->Add(E.Message);
    };
  };
  UpdateStatus();
};

void __fastcall TForm1::UpdateStatus()
{
  unsigned dwCallFeatures;

  // if (the line device is available there must be at least one address we can
  // use to check the availability of CallFeatures

  if (hbTapiLine1->Available)
    dwCallFeatures = hbTapiLine1->Addresses->Items[0]->Caps->CallFeatures;
  else
    dwCallFeatures = 0;

  if (dwCallFeatures & LINECALLFEATURE_MONITORDIGITS)
  {
    GroupBox_MonitorDigits->Enabled = true;
    GroupBox_MonitorDigits->Caption = "Monitor Digits (Available)";
  }
  else
  {
    GroupBox_MonitorDigits->Enabled = false;
    GroupBox_MonitorDigits->Caption = "Monitor Digits (Not Available)";
  }

  if (dwCallFeatures && LINECALLFEATURE_GATHERDIGITS)
  {
    GroupBox_GatherDigits->Enabled = true;
    GroupBox_GatherDigits->Caption = "Gather Digits (Available)";
  }
  else
  {
    GroupBox_GatherDigits->Enabled = FALSE;
    GroupBox_GatherDigits->Caption = "Gather Digits (Not Available)";
  }

  if (dwCallFeatures && LINECALLFEATURE_MONITORTONES)
  {
    GroupBox_MonitorSilence->Enabled = true;
    GroupBox_MonitorSilence->Caption = "Monitor Silence (Available)";
  }
  else
  {
    GroupBox_MonitorSilence->Enabled = true;
    GroupBox_MonitorSilence->Caption = "Monitor Silence (Not Available)";
  }

  if (dwCallFeatures && LINECALLFEATURE_GENERATETONE)
  {
    GroupBox_GenerateTone->Enabled = true;
    GroupBox_GenerateTone->Caption = "Generate Tone (Available)";
  }
  else
  {
    GroupBox_GenerateTone->Enabled = false;
    GroupBox_GenerateTone->Caption = "Generate Tone (Not Available)";
  }

  if (dwCallFeatures && LINECALLFEATURE_GENERATEDIGITS)
  {
    GroupBox_GenerateDigits->Enabled = true;
    GroupBox_GenerateDigits->Caption = "Generate Digits (Available)";
  }
  else
  {
    GroupBox_GenerateDigits->Enabled = false;
    GroupBox_GenerateDigits->Caption = "Generate Digits (Not Available)";
  }


  if (dwCallFeatures && LINECALLFEATURE_MONITORDIGITS)
  {
    GroupBox_MonitorDigits->Enabled = true;
    GroupBox_MonitorDigits->Caption = "Monitor Digits (Available)";
  }
  else
  {
    GroupBox_MonitorDigits->Enabled = FALSE;
    GroupBox_MonitorDigits->Caption = "Monitor Digits (Not Available)";
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button1Click(TObject *Sender)
{
  hbTapiLine1->MakeCall(Edit1->Text);

}
//---------------------------------------------------------------------------
void __fastcall TForm1::hbTapiLine1Connected(ThbTapiLine *Sender,
      ThbTapiCall *Call)
{
  ListBox1->Items->Add("Connected call available");

  if (CheckBox_MonitorDigits->Checked && !hbTapiLine1->CallOptions->MonitorDigits->AutoSelect)
  try
  {
    Call->MonitorDigits->Active = true;
  }
  catch (EhbTapiError &E)
  {
    ListBox1->Items->Add("MonitorDigits failed! " + E.Message);
  };

  if (Call->MonitorDigits->Active)
  {
    CheckBox_DTMF1->Checked  = Call->MonitorDigits->DigitModes & LINEDIGITMODE_DTMF;
    CheckBox_Pulse1->Checked = Call->MonitorDigits->DigitModes & LINEDIGITMODE_PULSE;
  };

  CheckBox_MonitorDigits->OnClick = NULL;
  try
  {
    CheckBox_MonitorDigits->Checked = Call->MonitorDigits->Active;
  }
  __finally
  {
    CheckBox_MonitorDigits->OnClick = DoMonitorDigits;
  };

  if (hbTapiLine1->WaveIn->Available)
    ListBox1->Items->Add("TapiLine WaveIn DeviceID = " + IntToStr(hbTapiLine1->WaveIn->DeviceID));
  else
    ListBox1->Items->Add("TapiLine WaveIn DeviceID = n/a");

}
//---------------------------------------------------------------------------
void __fastcall TForm1::hbTapiLine1Digit(ThbTapiLine *Sender, ThbTapiCall *Call,
      char Digit)
{
  ListBox1->Items->Add("Digit received: " + (String)Digit);

}
//---------------------------------------------------------------------------

void __fastcall TForm1::DoGatherDigits(TObject *Sender)
{
  if (hbTapiLine1->Calls->Count == 0)
    return;

  CheckBox2->OnClick = NULL;
  try
  {
    if (CheckBox2->Checked)
    {
      hbTapiLine1->Calls->Items[0]->GatherDigits->NumDigits = StrToIntDef(Edit2->Text,0);
      hbTapiLine1->Calls->Items[0]->GatherDigits->DigitModes = 0;
      if (CheckBox_DTMF2->Checked)
        hbTapiLine1->Calls->Items[0]->GatherDigits->DigitModes = hbTapiLine1->Calls->Items[0]->GatherDigits->DigitModes | LINEDIGITMODE_DTMF;
      if (CheckBox_Pulse2->Checked)
        hbTapiLine1->Calls->Items[0]->GatherDigits->DigitModes = hbTapiLine1->Calls->Items[0]->GatherDigits->DigitModes | LINEDIGITMODE_PULSE;
      hbTapiLine1->Calls->Items[0]->GatherDigits->TerminationDigits == Edit_Termdigits->Text;
      hbTapiLine1->Calls->Items[0]->GatherDigits->Active = true;
      ListBox1->Items->Add("Gathering started");
    }
    else if (!CheckBox2->Checked && (hbTapiLine1->Calls->Count > 0))
    {
      hbTapiLine1->Calls->Items[0]->GatherDigits->Active = false;
    };
  }
  __finally
  {
    CheckBox2->Checked = hbTapiLine1->Calls->Items[0]->GatherDigits->Active;
    CheckBox2->OnClick = DoGatherDigits;
  };
};

void __fastcall TForm1::hbTapiLine1Digits(ThbTapiLine *Sender, ThbTapiCall *Call,
      String Digits, DWORD Termination)
{
  ListBox1->Items->Add("Gathering terminated");
  switch (Termination)
  {
    case LINEGATHERTERM_BUFFERFULL : // The requested number of digits has been gathered-> The buffer is full->
      ListBox1->Items->Add("Digits gathered: " + (String)Digits);
    break;
    case LINEGATHERTERM_CANCEL : // The request was canceled by this application, by another application, || because the call terminated->
      ListBox1->Items->Add("Gathering canceled");
    break;
    case LINEGATHERTERM_FIRSTTIMEOUT : // The first digit timeout expired-> The buffer contains no digits->
      ListBox1->Items->Add("first digit timeout");
    break;
    case LINEGATHERTERM_INTERTIMEOUT : // The inter-digit timeout expired-> The buffer contains at least one digit->
      ListBox1->Items->Add("inter-digit timeout");
    break;
    case LINEGATHERTERM_TERMDIGIT :
      ListBox1->Items->Add("Termination digit received ("+Digits+")"); // One of the termination digits matched a received digit-> The matched termination digit is the last digit in the buffer->
    break;
  };
  CheckBox2->OnClick = NULL;
  CheckBox2->Checked = false;
  CheckBox2->OnClick = DoGatherDigits;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::DoMonitorDigits(TObject *Sender)
{
  if (hbTapiLine1->Calls->Count == 0)
    return;

  CheckBox_MonitorDigits->OnClick = NULL;
  try
  {
    if (CheckBox_MonitorDigits->Checked)
    {
      if (CheckBox_DTMF1->Checked)
        hbTapiLine1->Calls->Items[0]->MonitorDigits->DigitModes = LINEDIGITMODE_DTMF;
      if (CheckBox_Pulse1->Checked)
        hbTapiLine1->Calls->Items[0]->MonitorDigits->DigitModes = hbTapiLine1->Calls->Items[0]->MonitorDigits->DigitModes | LINEDIGITMODE_PULSE;
      hbTapiLine1->Calls->Items[0]->MonitorDigits->Active = true;
      ListBox1->Items->Add("MonitorDigits active");
    }
    else
    {
      hbTapiLine1->Calls->Items[0]->MonitorDigits->Active = false;
      ListBox1->Items->Add("MonitorDigits inactive");
    };
  }
  __finally
  {
    CheckBox_MonitorDigits->Checked = hbTapiLine1->Calls->Items[0]->MonitorDigits->Active;
    CheckBox_MonitorDigits->OnClick = DoMonitorDigits;
  };
}
//---------------------------------------------------------------------------
void __fastcall TForm1::DoClearList(TObject *Sender)
{
  ListBox1->Items->Clear();

}
//---------------------------------------------------------------------------
void __fastcall TForm1::hbTapiLine1Offering(ThbTapiLine *Sender,
      ThbTapiCall *Call)
{
  Call->Answer("");        
}
//---------------------------------------------------------------------------
void __fastcall TForm1::DoGenerateDigit(TObject *Sender)
{
  if (hbTapiLine1->Calls->Count == 0)
    return;

  if (hbTapiLine1->Calls->Count > 0)
  {
    if (RadioButton_DTMF->Checked)
      hbTapiLine1->Calls->Items[0]->GenerateDigits(((TSpeedButton*)Sender)->Caption, 100);
    else
      hbTapiLine1->Calls->Items[0]->GeneratePulseDigits(((TSpeedButton*)Sender)->Caption, 100);
  };
}
//---------------------------------------------------------------------------
void __fastcall TForm1::hbTapiLine1Silence(ThbTapiLine *Sender,
      ThbTapiCall *Call)
{
  ListBox1->Items->Add("Silence detected");
        
}
//---------------------------------------------------------------------------
void __fastcall TForm1::CheckBox_MonitorDigitsAutoSelectClick(TObject *Sender)
{
  hbTapiLine1->CallOptions->MonitorDigits->AutoSelect == CheckBox_MonitorDigitsAutoSelect->Checked;

}
//---------------------------------------------------------------------------
void __fastcall TForm1::DoGenerateTone(TObject *Sender)
{
  // Enterprice Edition
  if (hbTapiLine1->Calls->Count > 0)
  {
    switch (((TSpeedButton*)Sender)->Tag)
    {
      case 0:
        hbTapiLine1->Calls->Items[0]->GenerateTone(LINETONEMODE_BEEP, 1000);
        break;
      case 1: hbTapiLine1->Calls->Items[0]->GenerateTone(LINETONEMODE_BUSY, 1000);
      break;
      case 2: hbTapiLine1->Calls->Items[0]->GenerateTone(LINETONEMODE_BILLING, 1000);
      break;
      case 3: hbTapiLine1->Calls->Items[0]->GenerateTone(LINETONEMODE_RINGBACK, 1000);
      break;
    }  
  }
}
//---------------------------------------------------------------------------

