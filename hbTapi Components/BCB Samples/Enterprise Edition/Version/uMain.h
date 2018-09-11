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
        TLabel *LabelDevice;
        TComboBox *ComboBoxDevice;
        TGroupBox *GroupBox1;
        TLabel *Label3;
        TLabel *Label4;
        TGroupBox *GroupBox2;
        TLabel *Label6;
        TLabel *Label1;
        TLabel *Label2;
        TLabel *Label5;
        TLabel *Label7;
        TLabel *Label8;
        TEdit *EditExtLowVersion;
        TEdit *EditExtHighVersion;
        TButton *ButtonNogotiate;
        ThbTapiLine *hbTapiLine1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall ComboBoxDeviceChange(TObject *Sender);
        void __fastcall ButtonNogotiateClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
