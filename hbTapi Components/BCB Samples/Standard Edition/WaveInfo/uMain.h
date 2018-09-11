//---------------------------------------------------------------------------

#ifndef uMainH
#define uMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
#include "hbTapi.hpp"
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
        TComboBox *ComboBox_Device;
        TLabel *Label1;
        TEdit *Edit_PhoneNo;
        TComboBox *ComboBox_Privileges;
        TComboBox *ComboBox_Address;
        TComboBox *ComboBox_MediaMode;
        TLabel *Label2;
        TLabel *Label3;
        TLabel *Label4;
        TLabel *Label5;
        TComboBox *ComboBox_WaveInClass;
        TComboBox *ComboBox_WaveOutClass;
        TLabel *Label6;
        TLabel *Label7;
        TButton *Button_MakeCall;
        TButton *Button2;
        TButton *Button3;
        TListBox *ListBox1;
        TLabel *Label8;
        TBevel *Bevel1;
        TBevel *Bevel2;
        TButton *Button4;
        TButton *Button5;
        ThbTapiLine *hbTapiLine1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall ComboBox_DeviceChange(TObject *Sender);
        void __fastcall DoMakeCall(TObject *Sender);
        void __fastcall DoAnswerCall(TObject *Sender);
        void __fastcall DoDropCall(TObject *Sender);
        void __fastcall hbTapiLine1CallState(ThbTapiLine *Sender,
          ThbTapiCall *Call, DWORD CallState);
        void __fastcall hbTapiLine1CallDeallocate(ThbTapiLine *Sender,
          ThbTapiCall *Call);
        void __fastcall DoShowWaveIn(TObject *Sender);
        void __fastcall DoShowWaveOut(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
