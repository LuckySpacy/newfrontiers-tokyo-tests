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
        TButton *ButtonDial;
        TListView *ListView1;
        TButton *ButtonAnswer;
        TListBox *ListBox1;
        ThbTapiLine *hbTapiLine1;
        TLabel *Label2;
        TLabel *Label3;
        TLabel *Label4;
        TButton *Button_NonDirectPark;
        TButton *Button_Unpark;
        TButton *Button_DirectPark;
        TEdit *Edit_DirAddress;
        TEdit *Edit_UnparkAddress;
        TEdit *Edit_ParkedAtAddress;
        TLabel *Label_Active;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall ComboBoxDeviceChange(TObject *Sender);
        void __fastcall DoUpdateCalls(TObject *Sender);
        void __fastcall hbTapiLine1CallState(ThbTapiLine *Sender,
          ThbTapiCall *Call, DWORD CallState);
        void __fastcall hbTapiLine1CallDeallocate(ThbTapiLine *Sender,
          ThbTapiCall *Call);
        void __fastcall DoMakeCall(TObject *Sender);
        void __fastcall DoDrop(TObject *Sender);
        void __fastcall DoAnswer(TObject *Sender);
        void __fastcall ListBox1DblClick(TObject *Sender);
        void __fastcall DoDirectPark(TObject *Sender);
        void __fastcall Button_UnparkClick(TObject *Sender);
        void __fastcall DoNonDirectPark(TObject *Sender);
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
