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

void __fastcall TForm1::RequestMakeCall(TObject *Sender, String DestAddress, String AppName, String CalledParty, String Comment)
{
  ListBox1->Items->Add("DestAddress = " + DestAddress);
  ListBox1->Items->Add("AppName     = " + AppName);
  ListBox1->Items->Add("CalledParty = " + CalledParty);
  ListBox1->Items->Add("Comment     = " + Comment);
}

//---------------------------------------------------------------------------

void __fastcall TForm1::FormCreate(TObject *Sender)
{
  hbTapiApplication->OnRequestMakeCall = &RequestMakeCall;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button1Click(TObject *Sender)
{
  hbTapiApplication->AssistMakeCall = true;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button2Click(TObject *Sender)
{
  hbTapiApplication->AssistMakeCall = false;
}
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
void __fastcall TForm1::Button3Click(TObject *Sender)
{
#ifdef _DELPHI_STRING_UNICODE
#ifdef _UNICODE
  lineSetAppPriority(ParamStr(0).c_str(), 0, NULL, LINEREQUESTMODE_MAKECALL, NULL, 1);
#else
  lineSetAppPriority(ParamStr(0).t_str(), 0, NULL, LINEREQUESTMODE_MAKECALL, NULL, 1);
#endif
#else
  lineSetAppPriority(ParamStr(0).c_str(), 0, NULL, LINEREQUESTMODE_MAKECALL, NULL, 1);
#endif
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button4Click(TObject *Sender)
{
#ifdef _DELPHI_STRING_UNICODE
#ifdef _UNICODE
  lineSetAppPriority(ParamStr(0).c_str(), 0, NULL, LINEREQUESTMODE_MAKECALL, NULL, 0);
#else
  lineSetAppPriority(ParamStr(0).t_str(), 0, NULL, LINEREQUESTMODE_MAKECALL, NULL, 0);
#endif
#else
  lineSetAppPriority(ParamStr(0).c_str(), 0, NULL, LINEREQUESTMODE_MAKECALL, NULL, 0);
#endif
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button5Click(TObject *Sender)
{
  ListBox1->Items->Clear();
}
//---------------------------------------------------------------------------
