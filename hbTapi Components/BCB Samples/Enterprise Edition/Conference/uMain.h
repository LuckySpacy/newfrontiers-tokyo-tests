//---------------------------------------------------------------------------

#ifndef uMainH
#define uMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "hbTapi.hpp"
#include <ComCtrls.hpp>
#include <ImgList.hpp>
#include <Menus.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
        TGroupBox *GroupBox1;
        TLabel *Label1;
        TComboBox *ComboBoxDevice;
        TGroupBox *GroupBox2;
        TLabel *Label_CallFeature;
        TListView *ListView1;
        TButton *Button_MakeCall;
        TGroupBox *GroupBox3;
        TButton *Button_TransferDial;
        TButton *Button_Transfer;
        TButton *Button_Conference;
        TGroupBox *GroupBox4;
        TButton *Button_SetupConf;
        TButton *Button_AddToConference;
        TGroupBox *GroupBox5;
        TButton *Button_PrepareAddToConf;
        TButton *Button_AddToConference2;
        TButton *Button_Dial;
        TButton *Button_Answer;
        TButton *Button_Drop;
        TListBox *ListBox2;
        TButton *Button9;
        TButton *Button_Hold;
        TButton *Button_SwapHold;
        TButton *Button_RemoveFromConf;
        ThbTapiLine *hbTapiLine1;
        TPopupMenu *PopupMenu1;
        TMenuItem *MakeCall1;
        TMenuItem *Dial1;
        TMenuItem *Answer1;
        TMenuItem *Drop1;
        TMenuItem *N2;
        TMenuItem *HoldUnhold1;
        TMenuItem *SwapHold1;
        TMenuItem *N1;
        TMenuItem *ToggleOwner1;
        TMenuItem *ClearLinks1;
        TMenuItem *UpdateCalls1;
        TImageList *ImageList1;
        TLabel *Label3;
        TLabel *Label2;
        TComboBox *ComboBox_Address;
        void __fastcall hbTapiLine1CallState(ThbTapiLine *Sender,
          ThbTapiCall *Call, DWORD CallState);
        void __fastcall hbTapiLine1CallDeallocate(ThbTapiLine *Sender,
          ThbTapiCall *Call);
        void __fastcall DoMakeCall(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall ComboBoxDeviceChange(TObject *Sender);
        void __fastcall DoDial(TObject *Sender);
        void __fastcall DoAnswer(TObject *Sender);
        void __fastcall DoDrop(TObject *Sender);
        void __fastcall DoHold(TObject *Sender);
        void __fastcall DoSetupTransfer(TObject *Sender);
        void __fastcall DoTransfer(TObject *Sender);
        void __fastcall DoBuildConference(TObject *Sender);
        void __fastcall DoSetupConference(TObject *Sender);
        void __fastcall DoPrepareAddToConf(TObject *Sender);
        void __fastcall DoRemoveFromConference(TObject *Sender);
        void __fastcall DoGetCallList(TObject *Sender);
        void __fastcall DoAddToConference(TObject *Sender);
private:	// User declarations
public:		// User declarations
        String FPhoneNumber;
        __fastcall TForm1(TComponent* Owner);
        void __fastcall UpdateCalls();
        ThbTapiCall* __fastcall GetCall();


};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
