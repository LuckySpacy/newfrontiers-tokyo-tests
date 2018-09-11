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
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
		TLabel *Label_CallerIDName;
		TLabel *LabelDevice;
		TLabel *Label_CallerID;
		TEdit *EditCallerIDName;
        TComboBox *ComboBoxDevice;
        TEdit *EditInfo;
        ThbTapiLine *hbTapiLine1;
	TEdit *Edit_CallState;
	TEdit *Edit_CallerIDName;
	TEdit *Edit_CallerID;
	TCheckBox *CheckBox_Accept;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall ComboBoxDeviceChange(TObject *Sender);
        void __fastcall hbTapiLine1CallState(ThbTapiLine *Sender,
          ThbTapiCall *Call, DWORD CallState);
        void __fastcall hbTapiLine1CallEnd(ThbTapiLine *Sender,
          ThbTapiCall *Call);
        void __fastcall hbTapiLine1CallerID(ThbTapiLine *Sender,
          ThbTapiCall *Call);
	void __fastcall hbTapiLine1CallInfo(ThbTapiLine *Sender, ThbTapiCall *Call,
          DWORD InfoState);
	void __fastcall hbTapiLine1CallDeallocate(ThbTapiLine *Sender, ThbTapiCall *Call);
private:	// User declarations
public:		// User declarations
        void __fastcall ShowCallInfo(ThbTapiCall *Call);
        __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
