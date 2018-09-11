//---------------------------------------------------------------------------

#ifndef uMainH
#define uMainH
//---------------------------------------------------------------------------
#include "hbTapi.hpp"
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Dialogs.hpp>
#include <Forms.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
        TLabel *Label1;
        TLabel *Label2;
        TLabel *Label3;
        TComboBox *ComboBox_Device;
        TComboBox *ComboBox_PhoneNo;
        TButton *Button_TranslateDialog;
        TButton *Button_TranslateAddress;
        TComboBox *ComboBox_Options;
        ThbTapiLine *hbTapiLine1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall ComboBox_DeviceChange(TObject *Sender);
        void __fastcall Button_TranslateDialogClick(TObject *Sender);
        void __fastcall Button_TranslateAddressClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
