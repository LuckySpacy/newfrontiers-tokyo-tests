//---------------------------------------------------------------------------

#ifndef uMainH
#define uMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "hbTapi.hpp"
#include "hbTapiUtils.hpp"
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
        TListView *ListView1;
        TButton *Button_MakeCall;
        TButton *Button_Dial;
        TButton *Button_Answer;
        TButton *Button_Drop;
        TGroupBox *GroupBox3;
        TLabel *Label3;
        TButton *Button_ForwardTo;
        TButton *Button7;
        TButton *Button_ClearForwards;
        TListBox *ListBox1;
        TButton *Button_ClearForwards2;
        TButton *Button_ChangeforwardList;
        ThbTapiLine *hbTapiLine1;
        TImageList *ImageList1;
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
        TMenuItem *UpdateCalls1;
        TLabel *Label2;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall ComboBoxDeviceChange(TObject *Sender);
        void __fastcall hbTapiLine1CallState(ThbTapiLine *Sender,
          ThbTapiCall *Call, DWORD CallState);
        void __fastcall hbTapiLine1CallDeallocate(ThbTapiLine *Sender,
          ThbTapiCall *Call);
        void __fastcall Button_MakeCallClick(TObject *Sender);
        void __fastcall Button_DialClick(TObject *Sender);
        void __fastcall Button_AnswerClick(TObject *Sender);
        void __fastcall Button_DropClick(TObject *Sender);
        void __fastcall Button7Click(TObject *Sender);
        void __fastcall hbTapiLine1AddressState(ThbTapiLine *Sender,
          ThbTapiAddress *Address, DWORD AddressState);
        void __fastcall Button_ForwardToClick(TObject *Sender);
        void __fastcall Button_ClearForwardsClick(TObject *Sender);
        void __fastcall Button_ClearForwards2Click(TObject *Sender);
        void __fastcall Button_ChangeforwardListClick(TObject *Sender);
        void __fastcall DoShowCallFeatures(TObject *Sender);
private:	// User declarations
public:		// User declarations
        String FPhoneNumber;
        __fastcall TForm1(TComponent* Owner);
        void __fastcall UpdateCalls();
        ThbTapiCall* __fastcall GetCall();
        void __fastcall ShowForwards(int AddressID);



};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
