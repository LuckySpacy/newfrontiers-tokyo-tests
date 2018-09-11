//---------------------------------------------------------------------------

#ifndef uMainH
#define uMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Dialogs.hpp>
#include <Forms.hpp>
#include "hbTapi.hpp"
#include "uCallDisplay.h"
#include <ActnList.hpp>
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
#include <ImgList.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
        TPageControl *PageControl1;
        TTabSheet *TabSheet1;
        TPanel *Panel_Calls;
        TTabSheet *TabSheet2;
        TListView *ListView_Journal;
        TTabSheet *TabSheet3;
        TPanel *Panel3;
        TCheckBox *CheckBox_TapiMessages;
        TButton *Button_ClearProt;
        TCheckBox *CheckBox_CallStates;
        TCheckBox *CheckBox_CallInfos;
        TListBox *ListBox1;
        TPanel *Panel2;
        TLabel *Label1;
        TLabel *LabelPrivilege;
        TComboBox *ComboBoxDevice;
        TButton *Button1;
        ThbTapiLine *hbTapiLine1;
        TImageList *ImageList_Calls;
        TActionList *ActionList1;
        TAction *Action_AnswerCall;
        TAction *Action_CancelCall;
        TAction *Action_HoldCall;
        TAction *Action_PageCalls;
        TAction *Action_Pagebook;
        TAction *Action_PageJournal;
        TAction *Action_PageLog;
        TAction *Action_MakeCall;
        TAction *Action_BlindTransfer;
        TImageList *ImageList_Actions;
        TImageList *ImageList_Prot;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall ComboBoxDeviceChange(TObject *Sender);
        void __fastcall hbTapiLine1CallState(ThbTapiLine *Sender,
          ThbTapiCall *Call, DWORD CallState);
        void __fastcall hbTapiLine1CallDeallocate(ThbTapiLine *Sender,
          ThbTapiCall *Call);
        void __fastcall Action_MakeCallExecute(TObject *Sender);
private:	// User declarations
        TList* FCallDisp;
        String FPhoneNo;
public:		// User declarations
        __fastcall TForm1(TComponent* Owner);
        void __fastcall Log(String value);
        int __fastcall DisplayCount();
        TFrameCallDisplay* __fastcall GetDisplay(int Index);
        TFrameCallDisplay* __fastcall GetDisplay_Call(ThbTapiCall* Call);
        void __fastcall RemoveCallDisplay(ThbTapiCall* Call);
        void __fastcall UpdateCallView();


};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
