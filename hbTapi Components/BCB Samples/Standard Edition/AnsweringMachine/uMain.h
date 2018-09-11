//---------------------------------------------------------------------------

#ifndef uMainH
#define uMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Buttons.hpp>
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
#include "hbTapi.hpp"
#include "hbTapiWave.hpp"
#include <Dialogs.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
        TPanel *Panel1;
        TLabel *lbDevice;
        TLabel *lbCaller;
        TLabel *lbFile;
        TSpeedButton *SpeedButtonStop;
        TSpeedButton *SpeedButton1;
        TSpeedButton *SpeedButtonPlay;
        TComboBox *ComboDeviceList;
        TButton *btnAction;
        TCheckBox *cbAutoAnswer;
        TEdit *edCall;
        TEdit *edFile;
        TListView *ListView_Journal;
        TStatusBar *StatusBar;
        ThbWaveOut *WaveOut;
        ThbWaveIn *WaveIn;
        TTimer *TimerToAnswer;
        ThbWaveOut *WaveOutSpeaker;
        TOpenDialog *OpenDialog1;
        ThbTapiLine *TapiLine;
        void __fastcall ComboDeviceListChange(TObject *Sender);
        void __fastcall WaveOutDone(TObject *Sender);
        void __fastcall TapiLineConferenced(ThbTapiLine *Sender,
          ThbTapiCall *Call);
        void __fastcall TapiLineOffering(ThbTapiLine *Sender,
          ThbTapiCall *Call);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall TapiLineDigit(ThbTapiLine *Sender, ThbTapiCall *Call,
          char Digit);
        void __fastcall FormKeyPress(TObject *Sender, char &Key);
        void __fastcall SpeedButtonStopClick(TObject *Sender);
        void __fastcall WaveOutSpeakerDone(TObject *Sender);
        void __fastcall SpeedButton1Click(TObject *Sender);
        void __fastcall SpeedButtonPlayClick(TObject *Sender);

private:	// User declarations
  MESSAGE void Run(TMessage &Message);

public:		// User declarations
        __fastcall TForm1(TComponent* Owner);
        String __fastcall GetCallerInfo(ThbTapiCall *Call);
        void __fastcall GetLineDevices();
BEGIN_MESSAGE_MAP
        MESSAGE_HANDLER(WM_USER, TMessage, Run);
END_MESSAGE_MAP(TForm);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
