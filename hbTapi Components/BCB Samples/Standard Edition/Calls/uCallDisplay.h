//---------------------------------------------------------------------------


#ifndef uCallDisplayH
#define uCallDisplayH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Dialogs.hpp>
#include <ActnList.hpp>
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
#include <ImgList.hpp>
#include <ToolWin.hpp>
#include "hbTapi.hpp"

//---------------------------------------------------------------------------
class TFrameCallDisplay : public TFrame
{
__published:	// IDE-managed Components
        TPanel *Panel_Background;
        TLabel *Label_CallerID;
        TLabel *Label_Address;
        TLabel *Label_CalledID;
        TLabel *Label_State;
        TLabel *Label_Mode;
        TLabel *Label_Detail;
        TImage *ImageState;
        TLabel *Label1;
        TLabel *Label2;
        TLabel *Label3;
        TLabel *Label4;
        TLabel *Label6;
        TLabel *Label7;
        TLabel *Label_Features;
        TToolBar *ToolBar5;
        TToolButton *ToolButton6;
        TToolButton *Button2;
        TToolButton *Button3;
        TToolButton *Button1;
        TToolButton *ToolButton7;
        TToolButton *ToolButton1;
        TImageList *ImageList1;
        TActionList *ActionList1;
        TAction *Action_AnswerCall;
        TAction *Action_Drop;
        TAction *Action_HoldCall;
        TAction *Action_Dial;
        TAction *Action_SwapHold;
        TAction *Action_BlindTransfer;
        void __fastcall Action_DropExecute(TObject *Sender);
        void __fastcall Action_HoldCallExecute(TObject *Sender);
        void __fastcall Action_AnswerCallExecute(TObject *Sender);
        void __fastcall Action_DialExecute(TObject *Sender);
private:	// User declarations
        ThbTapiCall* FCall;
public:		// User declarations
        __fastcall TFrameCallDisplay(TComponent* Owner);
        void __fastcall UpdateView();
        void __fastcall UpdateActionList();
        void __fastcall Init();
        __property ThbTapiCall* Call = {read=FCall, write=FCall};
};
//---------------------------------------------------------------------------
extern PACKAGE TFrameCallDisplay *FrameCallDisplay;
//---------------------------------------------------------------------------
#endif
