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
        TGroupBox *GroupBox1;
        TGroupBox *GroupBox2;
        TGroupBox *GroupBox3;
        TListBox *ListBox1;
        TComboBox *ComboBox_Device;
        TComboBox *ComboBox_Privileges;
        TComboBox *ComboBox_Address;
        TComboBox *ComboBox_MediaMode;
        TLabel *Label1;
        TLabel *Label2;
        TLabel *Label3;
        TLabel *Label4;
        TEdit *Edit_PhoneNumber;
        TButton *Button_MakeCall;
        TButton *Button_AnswerCall;
        TButton *Button_DropCall;
        TLabel *Label5;
        TEdit *Edit_CallerID;
        TEdit *Edit_CallerIDName;
        TEdit *Edit_CalledID;
        TEdit *Edit_CalledIDName;
        TEdit *Edit_ConnectedID;
        TEdit *Edit_ConnectedIDName;
        TEdit *Edit_RedirectionID;
        TEdit *Edit_RedirectionIDName;
        TEdit *Edit_RedirectingID;
        TEdit *Edit_RedirectingIDName;
        TLabel *Label_CallerID;
        TLabel *Label_CallerIDName;
        TLabel *Label_CalledID;
        TLabel *Label_CalledIDName;
        TLabel *Label_ConnectedID;
        TLabel *Label_ConnectedIDName;
        TLabel *Label_RedirectionID;
        TLabel *Label_RedirectionIDName;
        TLabel *Label_RedirectingID;
        TLabel *Label_RedirectingIDName;
        ThbTapiLine *hbTapiLine1;
        void __fastcall hbTapiLine1CallState(ThbTapiLine *Sender, ThbTapiCall *Call, DWORD CallState);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall ComboBox_DeviceChange(TObject *Sender);
        void __fastcall hbTapiLine1CallInfo(ThbTapiLine *Sender,
          ThbTapiCall *Call, DWORD InfoState);
        void __fastcall DoMakeCall(TObject *Sender);
        void __fastcall DoAnswerCall(TObject *Sender);
        void __fastcall DoDropCall(TObject *Sender);
private:	// User declarations
        void __fastcall UpdateCallInfo(ThbTapiLine *Sender, ThbTapiCall *Call, DWORD InfoState);
public:		// User declarations
        __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
