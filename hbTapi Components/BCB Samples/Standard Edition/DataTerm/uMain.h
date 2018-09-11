//---------------------------------------------------------------------------

#ifndef uMainH
#define uMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "hbComm.hpp"
#include "hbCommUtils.hpp"
#include "hbTapi.hpp"
#include "hbTapiUtils.hpp"
#include <ExtCtrls.hpp>
#include <Graphics.hpp>
#include <Menus.hpp>
#include <IniFiles.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
        TPanel *Panel1;
        TLabel *Label1;
        TLabel *Label2;
        TLabel *Label3;
        TLabel *Label4;
        TLabel *Label5;
        TLabel *Label6;
        TLabel *Label7;
        ThbComPortStatusLED *ComPortStatusLED1;
        ThbComPortStatusLED *ComPortStatusLED2;
        ThbComPortStatusLED *ComPortStatusLED3;
        ThbComPortStatusLED *ComPortStatusLED4;
        ThbComPortStatusLED *ComPortStatusLED5;
        ThbComPortStatusLED *ComPortStatusLED6;
        ThbComPortStatusLED *ComPortStatusLED7;
        TLabel *Label_Info;
        TPanel *Panel2;
        TSplitter *Splitter1;
        TPanel *Panel3;
        TPanel *Panel4;
        TCheckBox *CheckBox_ShowEvents;
        TListBox *ListBox2;
        TPanel *Panel5;
        TSplitter *Splitter2;
        TMemo *Memo1;
        TListBox *ListBox1;
        TMainMenu *MainMenu;
        TMenuItem *menuLine;
        TMenuItem *menuOnLine;
        TMenuItem *N7;
        TMenuItem *menuDial;
        TMenuItem *Hangup1;
        TMenuItem *N3;
        TMenuItem *menuEcho;
        TMenuItem *N2;
        TMenuItem *menuExit;
        TMenuItem *menuChange;
        TMenuItem *menuPort;
        TMenuItem *menuCOM1;
        TMenuItem *menuCOM2;
        TMenuItem *menuCOM3;
        TMenuItem *menuCOM4;
        TMenuItem *menuBaud;
        TMenuItem *menu110;
        TMenuItem *menu300;
        TMenuItem *menu1200;
        TMenuItem *menu2400;
        TMenuItem *menu4800;
        TMenuItem *menu7200;
        TMenuItem *menu9600;
        TMenuItem *menu14400;
        TMenuItem *menu19200;
        TMenuItem *menu38400;
        TMenuItem *menu57600;
        TMenuItem *menuDataBits;
        TMenuItem *menuFive;
        TMenuItem *menuSix;
        TMenuItem *menuSeven;
        TMenuItem *menuEight;
        TMenuItem *menuParity;
        TMenuItem *menuNone;
        TMenuItem *menuEven;
        TMenuItem *menuOdd;
        TMenuItem *menuMark;
        TMenuItem *menuSpace;
        TMenuItem *menuStopBits;
        TMenuItem *menuOne;
        TMenuItem *menuOne5;
        TMenuItem *menuTwo;
        TMenuItem *menuFlowControl;
        TMenuItem *menuRtsCts;
        TMenuItem *menuDtrDsr;
        TMenuItem *menuXonXoff;
        TMenuItem *menuNoFlow;
        TMenuItem *N1;
        TMenuItem *menuProperties;
        TMenuItem *menuControl;
        TMenuItem *menuDTR;
        TMenuItem *menuRTS;
        TMenuItem *menuSend;
        TMenuItem *ABC1;
        TMenuItem *LargeText1;
        TMenuItem *N1MB1;
        TMenuItem *N5;
        TMenuItem *menuStopsending;
        TMenuItem *menuBreak;
        TMenuItem *N8;
        TMenuItem *menuTimeouts;
        TMenuItem *menuReceive;
        TMenuItem *menuReceiveData;
        TMenuItem *Read10Bytes1;
        TMenuItem *N6;
        TMenuItem *menuAutoReceive;
        TMenuItem *menuDSRSensitivity;
        ThbComPort *ComPort1;
        TTimer *Timer1;
        ThbTapiLine *hbTapiLine1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall DoMakeCall(TObject* Sender);
        void __fastcall menuOnLineClick(TObject *Sender);
        void __fastcall menuCOMClick(TObject *Sender);
        void __fastcall menuExitClick(TObject *Sender);
        void __fastcall menuBaudClick(TObject *Sender);
        void __fastcall menuNoneClick(TObject *Sender);
        void __fastcall menuEvenClick(TObject *Sender);
        void __fastcall menuOddClick(TObject *Sender);
        void __fastcall menuMarkClick(TObject *Sender);
        void __fastcall menuSpaceClick(TObject *Sender);
        void __fastcall menuOneClick(TObject *Sender);
        void __fastcall ABC1Click(TObject *Sender);
        void __fastcall LargeText1Click(TObject *Sender);
        void __fastcall N1MB1Click(TObject *Sender);
        void __fastcall menuStopsendingClick(TObject *Sender);
        void __fastcall menuAutoReceiveClick(TObject *Sender);
        void __fastcall DoUpdateStatus(TObject *Sender);
        void __fastcall ComPort1Event(TObject *Sender, DWORD Events);
        void __fastcall menuDSRSensitivityClick(TObject *Sender);
        void __fastcall Read10Bytes1Click(TObject *Sender);
        void __fastcall menuReceiveDataClick(TObject *Sender);
        void __fastcall ComPort1Receive(TObject *Sender, int Count);
        void __fastcall DoClearList(TObject *Sender);
        void __fastcall Memo1KeyPress(TObject *Sender, char &Key);
        void __fastcall menuRTSClick(TObject *Sender);
        void __fastcall ComPort1Activate(TObject *Sender);
        void __fastcall ComPort1Deactivate(TObject *Sender);
        void __fastcall ComPort1TxEmpty(TObject *Sender);
        void __fastcall ComPort1Timeout(TObject *Sender, int Count);
        void __fastcall ComPort1DCD(TObject *Sender);
        void __fastcall ComPort1Error(TObject *Sender, DWORD Errors);
        void __fastcall DoMemoClear(TObject *Sender,
          TPoint &MousePos, bool &Handled);
        void __fastcall menuTimeoutsClick(TObject *Sender);
        void __fastcall menuDTRClick(TObject *Sender);
        void __fastcall ComPort1Ring(TObject *Sender);
        void __fastcall Hangup1Click(TObject *Sender);
        void __fastcall hbTapiLine1CallState(ThbTapiLine *Sender,
          ThbTapiCall *Call, DWORD CallState);
        void __fastcall hbTapiLine1CallDeallocate(ThbTapiLine *Sender,
          ThbTapiCall *Call);
        void __fastcall menuEchoClick(TObject *Sender);
        void __fastcall ComPort1DSR(TObject *Sender);
        void __fastcall ComPort1Break(TObject *Sender);
        void __fastcall ComPort1CTS(TObject *Sender);
        void __fastcall menuBreakClick(TObject *Sender);

private:	// User declarations
public:		// User declarations
        __fastcall TForm1(TComponent* Owner);
        void __fastcall Log(String s);
        void __fastcall TForm1::UpdateMenu();
        void __fastcall UpdateStatus();
        void __fastcall SendData(int Count);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
