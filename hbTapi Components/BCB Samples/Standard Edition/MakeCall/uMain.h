//---------------------------------------------------------------------------

#ifndef uMainH
#define uMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "hbTapi.hpp"
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
        TComboBox *ComboBox_Device;
        ThbTapiLine *hbTapiLine1;
        TCheckBox *CheckBox_SyncMode;
        TComboBox *ComboBox_Privileges;
        TComboBox *ComboBox_MediaMode;
        TComboBox *ComboBox_Address;
        TListBox *ListBox1;
        TButton *Button1;
        TEdit *EditPhoneNo;
        TButton *Button2;
        TButton *Button3;
        TCheckBox *CheckBox_BlockID;
        TButton *Button5;
        TLabel *LabelDevice;
        TLabel *Label1;
        TLabel *Label4;
        TLabel *Label3;
        TLabel *LabelCallerIDNumber;
        TLabel *Label2;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall ComboBox_DeviceChange(TObject *Sender);
        void __fastcall DoMakeCall(TObject *Sender);
        void __fastcall hbTapiLine1CallState(ThbTapiLine *Sender,
          ThbTapiCall *Call, DWORD CallState);
        void __fastcall hbTapiLine1CallEnd(ThbTapiLine *Sender,
          ThbTapiCall *Call);
        void __fastcall hbTapiLine1CallerID(ThbTapiLine *Sender,
          ThbTapiCall *Call);
        void __fastcall hbTapiLine1CallDeallocate(ThbTapiLine *Sender,
          ThbTapiCall *Call);
        void __fastcall CheckBox_SyncModeClick(TObject *Sender);
        void __fastcall ListBox1DblClick(TObject *Sender);
        void __fastcall ComboBox_PrivilegesChange(TObject *Sender);
        void __fastcall DoAnswerCall(TObject *Sender);
        void __fastcall DoMakeCall2(TObject *Sender);
        void __fastcall Button5Click(TObject *Sender);
private:	// User declarations
   int FNumMakeCall;

public:		// User declarations
        __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
