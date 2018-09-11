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
#include <ImgList.hpp>
#include <Menus.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
        TGroupBox *GroupBox1;
        TLabel *Label1;
        TLabel *Label_Privileges;
        TLabel *Label5;
        TComboBox *ComboBoxDevice;
        TComboBox *ComboBox_Privileges;
        TGroupBox *GroupBox2;
        TLabel *Label_CallFeature;
        TListView *ListView1;
        TButton *Button2;
        TGroupBox *GroupBox3;
        TLabel *Label2;
        TButton *ButtonSetCallData;
        TEdit *Edit1;
        TGroupBox *GroupBox4;
        TLabel *Label4;
        TButton *ButtonGetCallData;
        TEdit *Edit2;
        TButton *Button4;
        TButton *Button5;
        TButton *Button6;
        ThbTapiLine *hbTapiLine1;
        TPopupMenu *PopupMenu1;
        TMenuItem *MakeCall1;
        TMenuItem *Dial1;
        TMenuItem *Answer1;
        TMenuItem *Drop1;
        TMenuItem *N1;
        TMenuItem *UpdateCalls1;
        TImageList *ImageList1;
        TListBox *ListBox1;
        TComboBox *ComboBoxAddress;
        TLabel *Label3;
        void __fastcall ComboBoxDeviceChange(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall hbTapiLine1CallState(ThbTapiLine *Sender,
          ThbTapiCall *Call, DWORD CallState);
        void __fastcall hbTapiLine1CallDeallocate(ThbTapiLine *Sender,
          ThbTapiCall *Call);
        void __fastcall Button2Click(TObject *Sender);
        void __fastcall Button4Click(TObject *Sender);
        void __fastcall Button5Click(TObject *Sender);
        void __fastcall Button6Click(TObject *Sender);
        void __fastcall ButtonSetCallDataClick(TObject *Sender);
        void __fastcall ButtonGetCallDataClick(TObject *Sender);
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
