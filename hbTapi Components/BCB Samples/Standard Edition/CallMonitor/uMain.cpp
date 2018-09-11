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
__fastcall TForm1::TForm1(TComponent* Owner) : TForm(Owner)
{
}

void __fastcall TForm1::DoInit(TObject* Sender)
{
  ThbTapiLine* line;
  int i, n, iOpen=0, iError=0;

  ComboBox_Lines->Items->Clear();
  Screen->Cursor = crHourGlass;
  StatusBar1->Panels->Items[4]->Text = " Opening lines... please wait";
  Update();
  __try
  {
      i = 0;
      while (i < hbTapiLine1->DeviceList->Count)
      {
        hbTapiLine1->DeviceID = i;
        if (hbTapiLine1->Available && (hbTapiLine1->Caps->MediaModes & LINEMEDIAMODE_INTERACTIVEVOICE))
        {
          if (FLines->IndexOfDeviceID(i) >= 0)
            line = (ThbTapiLine*) FLines->Items[FLines->IndexOfDeviceID(i)];
          else
          {
            line = new ThbTapiLine(this);
            line->DeviceID = i;
            FLines->Add(line);
            line->Privileges->Owner = FALSE;
            line->Privileges->Monitor = TRUE;
            line->OnCallState = hbTapiLine1->OnCallState;
            line->OnCallInfo = hbTapiLine1->OnCallInfo;
            line->OnNewCall = hbTapiLine1->OnNewCall;
            line->OnCallDeallocate = hbTapiLine1->OnCallDeallocate;
          }
          if (line->Active)
          {
            ComboBox_Lines->Items->Add(line->DeviceName + " - active");
            iOpen++;
          }
          else
          try
          {
            line->Open();
            ComboBox_Lines->Items->Add(line->DeviceName + " - active");
            iOpen++;
            for (n=0; n < line->Calls->Count; n++)
              UpdateCall(line, line->Calls->Items[n]);
          } catch(EhbTapiError &E) {
             iError++;
             ComboBox_Lines->Items->Add(line->DeviceName + " - " + E.Message);
          }
        }
        i++;
      }

    if (ComboBox_Lines->Items->Count > 0)
      ComboBox_Lines->ItemIndex = 0;
    StatusBar1->Panels->Items[1]->Text = IntToStr(iOpen);
    StatusBar1->Panels->Items[3]->Text = IntToStr(iError);
  }
  __finally
  {
    Screen->Cursor = crDefault;
    StatusBar1->Panels->Items[4]->Text = "";
  }
}

//---------------------------------------------------------------------------
void __fastcall TForm1::UpdateCall(ThbTapiLine* line, ThbTapiCall* call)
{
  TListItem* li;

  li = ListView1->FindData(0, call, true, false);
  if (li == NULL )
  {
    li = ListView1->Items->Add();
    while (li->SubItems->Count < ListView1->Columns->Count-1)
    {
      li->SubItems->Add("");
    }
  }
  li->Data        = call;
  li->Caption     = line->DeviceName;
  li->SubItems->Strings[0] = IntToHex((int)call, 8);
  li->SubItems->Strings[1] = call->StateText();
  li->SubItems->Strings[2] = call->CallerID->Address;
  li->SubItems->Strings[3] = call->CallerID->Name;

  ListView1->Update();
}

//---------------------------------------------------------------------------
void __fastcall TForm1::RemoveCall(ThbTapiLine* line, ThbTapiCall* call)
{
  TListItem* li;

  li = ListView1->FindData(0, call, true, false);
  if (li != NULL)
  {
    ListView1->Items->Delete(ListView1->Items->IndexOf(li));
  }
}

//---------------------------------------------------------------------------
void __fastcall TForm1::hbTapiLine1CallState(ThbTapiLine *Sender,
      ThbTapiCall *Call, DWORD CallState)
{
  UpdateCall(Sender, Call);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::hbTapiLine1CallDeallocate(ThbTapiLine *Sender,
      ThbTapiCall *Call)
{
  RemoveCall(Sender, Call);
}

//---------------------------------------------------------------------------
ThbTapiCall* __fastcall TForm1::GetCall()
{
  if (ListView1->Selected)
    return (ThbTapiCall*)ListView1->Selected->Data;
  return NULL;
}
void __fastcall TForm1::DoAnswer(TObject *Sender)
{
  ThbTapiCall* c;
  c = GetCall();
  if (!c)
    return;
  c->Answer("");
        
}
//---------------------------------------------------------------------------
void __fastcall TForm1::DoDrop(TObject *Sender)
{
  ThbTapiCall* c;
  c = GetCall();
  if (!c)
    return;
  c->Drop("");


}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormCreate(TObject *Sender)
{
  FLines = new ThbTapiLineList();
  DoInit(this);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::FormDestroy(TObject *Sender)
{
  ListView1->Items->Clear();
  FLines->Free();
}

//---------------------------------------------------------------------------
void __fastcall TForm1::hbTapiLine1CallInfo(ThbTapiLine *Sender, ThbTapiCall *Call,
	  DWORD InfoState)
{
  UpdateCall(Sender, Call);
}

//---------------------------------------------------------------------------
void __fastcall TForm1::hbTapiLine1NewCall(ThbTapiLine *Sender, ThbTapiCall *Call)
{
  UpdateCall(Sender, Call);
}

