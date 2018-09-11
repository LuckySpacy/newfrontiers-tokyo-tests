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
        TLabel *LabelApplication;
        TCheckBox *CheckBoxActive;
        TComboBox *ComboBoxDevice;
        TEdit *EditApplication;
        TButton *ButtonAnswer;
        TButton *ButtonHangup;
        ThbTapiLine *hbTapiLine1;
        TListBox *ListBox1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBoxActiveClick(TObject *Sender);
        void __fastcall ComboBoxDeviceChange(TObject *Sender);
        void __fastcall ButtonAnswerClick(TObject *Sender);
        void __fastcall ButtonHangupClick(TObject *Sender);
        void __fastcall hbTapiLine1Connected(ThbTapiLine *Sender,
          ThbTapiCall *Call);
        void __fastcall hbTapiLine1MediaMode(ThbTapiLine *Sender,
          ThbTapiCall *Call);
        void __fastcall hbTapiLine1CallState(ThbTapiLine *Sender,
          ThbTapiCall *Call, DWORD CallState);
private:	// User declarations
public:		// User declarations
        __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
