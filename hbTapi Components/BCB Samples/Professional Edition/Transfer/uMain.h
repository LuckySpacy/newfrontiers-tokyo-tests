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
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
        TGroupBox *GroupBox1;
        TLabel *Label1;
        TComboBox *ComboBoxDevice;
        TGroupBox *GroupBox2;
        TButton *ButtonDrop;
        TButton *ButtonHoldUnhold;
        TButton *ButtonTransferSwapHold;
        TButton *ButtonDial;
        TButton *Button_SetupTransfer;
        TButton *Button_Dial;
        TButton *ButtonTransferDial;
        TButton *Button2;
        TButton *ButtonTransferDialTransfer;
        TListView *ListView1;
        TButton *ButtonAnswer;
        TButton *Button_BlindTransfer;
        TButton *Button3;
        TButton *Button5;
        TListBox *ListBox1;
        ThbTapiLine *hbTapiLine1;
        TLabel *LabelAddressPrimary;
        TComboBox *ComboBox_Address;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall ComboBoxDeviceChange(TObject *Sender);
        void __fastcall DoUpdateCalls(TObject *Sender);
        void __fastcall hbTapiLine1CallState(ThbTapiLine *Sender,
          ThbTapiCall *Call, DWORD CallState);
        void __fastcall hbTapiLine1CallDeallocate(ThbTapiLine *Sender,
          ThbTapiCall *Call);
        void __fastcall DoMakeCall(TObject *Sender);
        void __fastcall DoDial(TObject *Sender);
        void __fastcall ButtonTransferDialClick(TObject *Sender);
        void __fastcall DoSwapHold(TObject *Sender);
        void __fastcall DoDrop(TObject *Sender);
        void __fastcall DoHold(TObject *Sender);
        void __fastcall DoAnswer(TObject *Sender);
        void __fastcall DoToggleOwner(TObject *Sender);
        void __fastcall Button_SetupTransferClick(TObject *Sender);
        void __fastcall hbTapiLine1Connected(ThbTapiLine *Sender,
          ThbTapiCall *Call);
        void __fastcall ListBox1DblClick(TObject *Sender);
        void __fastcall DoBlindTransfer(TObject *Sender);
        void __fastcall DoTransfer(TObject *Sender);
        void __fastcall DoConference(TObject *Sender);
        void __fastcall ButtonTransferDialTransferClick(TObject *Sender);
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
