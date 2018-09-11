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
        TLabel *Label1;
        TLabel *Label2;
        TComboBox *ComboBox_Line;
        TComboBox *ComboBox_Phone;
        TGroupBox *GroupBox2;
        TMemo *Display;
        TListBox *ListBox1;
        ThbTapiLine *hbTapiLine1;
        ThbTapiPhone *TapiPhone1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall TapiPhone1Display(TObject *Sender);
        void __fastcall ComboBox_LineChange(TObject *Sender);
        void __fastcall DoSelectPhoneDevice(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
