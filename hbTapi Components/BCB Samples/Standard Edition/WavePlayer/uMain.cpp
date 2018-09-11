//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "uMain.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "hbTapiWave"
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button_BeepClick(TObject *Sender)
{
  hbWaveOut1->Active = false;
  hbWaveOut1->Playlist->Clear();
  hbWaveOut1->Playlist->Add("Beep(1000,200)");
  hbWaveOut1->Playlist->Add("Silence(100)");
  hbWaveOut1->Playlist->Add("Beep(1000,200)");
  hbWaveOut1->Playlist->Add("Silence(100)");
  hbWaveOut1->Playlist->Add("Beep(1000,200)");
  hbWaveOut1->Active = true;
  ListBox1->Items->Add("playing " + hbWaveOut1->Playlist->CommaText + "...");

}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button_Play123Click(TObject *Sender)
{
  hbWaveOut1->Active = false;
  hbWaveOut1->Playlist->Clear();
  hbWaveOut1->Playlist->Add("..\\1.wav");
  hbWaveOut1->Playlist->Add("..\\2.wav");
  hbWaveOut1->Playlist->Add("..\\3.wav");
  hbWaveOut1->Active = true;
  ListBox1->Items->Add("playing " + hbWaveOut1->Playlist->CommaText + "...");
}
//---------------------------------------------------------------------------

void __fastcall TForm1::WaveOut1WaveError(TObject *Sender, DWORD ErrorCode,
      String ErrorText)
{
  ListBox1->Items->Add("::OnWave->OnError " + ErrorText);

}
//---------------------------------------------------------------------------

void __fastcall TForm1::WaveOut1Done(TObject *Sender)
{
  ListBox1->Items->Add("::OnWaveOut->OnDone");

}
//---------------------------------------------------------------------------

void __fastcall TForm1::DoPlayNo(TObject *Sender)
{
  hbWaveOut1->Active = false;
  hbWaveOut1->Playlist->Clear();
  hbWaveOut1->Playlist->Add("..\\" + IntToStr(((TSpeedButton*)Sender)->Tag) + ".wav");
  hbWaveOut1->Active = true;
  ListBox1->Items->Add("playing " + hbWaveOut1->Playlist->CommaText + "...");

}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button_StopClick(TObject *Sender)
{
  hbWaveOut1->Active = false;

}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button_EmptyClick(TObject *Sender)
{
  hbWaveOut1->Active = false;
  hbWaveOut1->Playlist->Clear();
  hbWaveOut1->Active = true;
  ListBox1->Items->Add("playing " + hbWaveOut1->Playlist->CommaText + "...");

}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button_Empty2Click(TObject *Sender)
{
  hbWaveOut1->Active = false;
  hbWaveOut1->Playlist->Clear();
  hbWaveOut1->Playlist->Add("");
  hbWaveOut1->Active = true;
  ListBox1->Items->Add("playing " + hbWaveOut1->Playlist->CommaText + "...");

}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button_ErrorClick(TObject *Sender)
{
  hbWaveOut1->Active = false;
  hbWaveOut1->Playlist->Clear();
  hbWaveOut1->Playlist->Add("error->wav");
  hbWaveOut1->Active = true;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::FormCreate(TObject *Sender)
{
  ComboBox1->Items->Assign(hbWaveOut1->DeviceList);
  ComboBox1->Items->Insert(0, "- none -");
  ComboBox1->ItemIndex == ComboBox1->Items->IndexOf(hbWaveOut1->DeviceName);
  if (ComboBox1->ItemIndex == -1)
    ComboBox1->ItemIndex = 0;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::ComboBox1Change(TObject *Sender)
{
  hbWaveOut1->Active   == false;
  hbWaveOut1->DeviceID == ComboBox1->ItemIndex -1;
        
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button_InfoClick(TObject *Sender)
{
  ListBox1->Items->Add(Format("DeviceName= %s, DeviceID= %d", ARRAYOFCONST((hbWaveOut1->DeviceName, hbWaveOut1->DeviceID))));

}
//---------------------------------------------------------------------------

