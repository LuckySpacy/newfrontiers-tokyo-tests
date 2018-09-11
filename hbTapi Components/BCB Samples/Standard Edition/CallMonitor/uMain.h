//---------------------------------------------------------------------------

#ifndef uMainH
#define uMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <hbTapi.hpp>
#include <ComCtrls.hpp>
#include <ImgList.hpp>
#include <Menus.hpp>
#include <ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
        ThbTapiLine *hbTapiLine1;
        TPopupMenu *PopupMenu1;
        TMenuItem *Answer1;
        TMenuItem *Drop1;
        TMenuItem *N1;
        TMenuItem *UpdateCalls1;
        TPanel *Panel_Lines;
        TComboBox *ComboBox_Lines;
        TButton *Button1;
        TLabel *Label1;
        TStatusBar *StatusBar1;
        TButton *Button5;
        TButton *Button6;
        TPanel *Panel2;
        TListView *ListView1;
        void __fastcall hbTapiLine1CallState(ThbTapiLine *Sender,
          ThbTapiCall *Call, DWORD CallState);
        void __fastcall hbTapiLine1CallDeallocate(ThbTapiLine *Sender,
          ThbTapiCall *Call);
        void __fastcall DoAnswer(TObject *Sender);
        void __fastcall DoDrop(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall FormDestroy(TObject *Sender);
	void __fastcall hbTapiLine1CallInfo(ThbTapiLine *Sender, ThbTapiCall *Call,
          DWORD InfoState);
	void __fastcall hbTapiLine1NewCall(ThbTapiLine *Sender, ThbTapiCall *Call);
private:	// User declarations
        ThbTapiLineList *FLines;
public:		// User declarations
        String FPhoneNumber;
        __fastcall TForm1(TComponent* Owner);
        void __fastcall DoInit(TObject* Sender);
        ThbTapiCall* __fastcall GetCall();
        void __fastcall UpdateCall(ThbTapiLine* line, ThbTapiCall* call);
        void __fastcall RemoveCall(ThbTapiLine* line, ThbTapiCall* call);




};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
