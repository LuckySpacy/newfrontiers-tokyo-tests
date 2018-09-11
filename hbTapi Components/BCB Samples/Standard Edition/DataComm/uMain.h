//---------------------------------------------------------------------------

#ifndef uMainH
#define uMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "hbComm.hpp"
#include "hbTapi.hpp"
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
        TGroupBox *GroupBox1;
        TLabel *Label1;
        TComboBox *ComboBoxDevice;
        TCheckBox *CheckBoxActive;
        TGroupBox *GroupBox2;
        TLabel *Label2;
        TLabel *Label_CallState;
        TLabel *Label9;
        TLabel *Label_Info;
        TLabel *Label4;
        TLabel *Label5;
        TLabel *Label8;
        TButton *ButtonDrop;
        TEdit *EditCallPhoneNumber;
        TButton *ButtonDial;
        TButton *ButtonAnswer;
        TCheckBox *CheckBox1;
        TComboBox *ComboBox_Timeout;
        TGroupBox *GroupBox3;
        TLabel *Label3;
        TLabel *Label_Com;
        TLabel *Label6;
        TLabel *Label7;
        TEdit *Edit1;
        TButton *ButtonSend;
        TListBox *ListBox1;
        TListBox *ListBox2;
        TGroupBox *GroupBox4;
        TListBox *ListBox_Log;
        ThbTapiLine *hbTapiLine1;
        ThbComPort *ComPort1;
        TLabel *Label10;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall ComboBoxDeviceChange(TObject *Sender);
        void __fastcall CheckBoxActiveClick(TObject *Sender);
        void __fastcall DoMakeCall(TObject *Sender);
        void __fastcall DoDrop(TObject *Sender);
        void __fastcall DoAnswer(TObject *Sender);
        void __fastcall hbTapiLine1CallState(ThbTapiLine *Sender,
          ThbTapiCall *Call, DWORD CallState);
        void __fastcall hbTapiLine1CallDeallocate(ThbTapiLine *Sender,
          ThbTapiCall *Call);
        void __fastcall ButtonSendClick(TObject *Sender);
        void __fastcall ComPort1Receive(TObject *Sender, int Count);
        void __fastcall DoClearList(TObject *Sender);

private:	// User declarations
public:		// User declarations
        __fastcall TForm1(TComponent* Owner);
        void __fastcall  Log(String Value);
        void __fastcall UpdateCalls();
        void __fastcall UpdateComm();
        ThbTapiCall* __fastcall GetCall();
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
