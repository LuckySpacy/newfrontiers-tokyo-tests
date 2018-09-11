//---------------------------------------------------------------------------

#ifndef uMainH
#define uMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Buttons.hpp>
#include "hbTapi.hpp"
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
        TListBox *ListBox1;
        TGroupBox *GroupBox_MonitorDigits;
        TLabel *Label11;
        TCheckBox *CheckBox_MonitorDigits;
        TCheckBox *CheckBox_DTMF1;
        TCheckBox *CheckBox_Pulse1;
        TCheckBox *CheckBox_MonitorDigitsAutoSelect;
        TGroupBox *GroupBox_GatherDigits;
        TLabel *Label4;
        TLabel *Label5;
        TLabel *Label6;
        TLabel *Label7;
        TLabel *Label8;
        TLabel *Label9;
        TLabel *Label10;
        TCheckBox *CheckBox2;
        TEdit *Edit3;
        TEdit *Edit4;
        TEdit *Edit2;
        TEdit *Edit_Termdigits;
        TCheckBox *CheckBox_DTMF2;
        TCheckBox *CheckBox_Pulse2;
        TGroupBox *GroupBox_GenerateDigits;
        TSpeedButton *SpeedButton1;
        TSpeedButton *SpeedButton2;
        TSpeedButton *SpeedButton3;
        TSpeedButton *SpeedButton4;
        TSpeedButton *SpeedButton5;
        TSpeedButton *SpeedButton6;
        TSpeedButton *SpeedButton7;
        TSpeedButton *SpeedButton8;
        TSpeedButton *SpeedButton9;
        TSpeedButton *SpeedButton10;
        TSpeedButton *SpeedButton11;
        TSpeedButton *SpeedButton12;
        TSpeedButton *SpeedButton16;
        TSpeedButton *SpeedButton17;
        TSpeedButton *SpeedButton18;
        TSpeedButton *SpeedButton19;
        TRadioButton *RadioButton_DTMF;
        TRadioButton *RadioButton_Pulse;
        TGroupBox *GroupBox4;
        TLabel *LabelDevice;
        TLabel *Label1;
        TLabel *Label3;
        TComboBox *ComboBoxDevice;
        TGroupBox *GroupBox_GenerateTone;
        TButton *Button_Beep;
        TButton *Button3;
        TButton *Button2;
        TButton *Button_Ringback;
        TGroupBox *GroupBox5;
        TLabel *Label2;
        TEdit *Edit1;
        TButton *Button1;
        TGroupBox *GroupBox_MonitorSilence;
        TCheckBox *CheckBox_MonitorSilence;
        ThbTapiLine *hbTapiLine1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall ComboBoxDeviceChange(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall hbTapiLine1Connected(ThbTapiLine *Sender,
          ThbTapiCall *Call);
        void __fastcall hbTapiLine1Digit(ThbTapiLine *Sender, ThbTapiCall *Call,
          char Digit);
        void __fastcall hbTapiLine1Digits(ThbTapiLine *Sender, ThbTapiCall *Call,
          String Digits, DWORD Termination);
        void __fastcall DoGatherDigits(TObject *Sender);
        void __fastcall DoMonitorDigits(TObject *Sender);
        void __fastcall DoClearList(TObject *Sender);
        void __fastcall hbTapiLine1Offering(ThbTapiLine *Sender,
          ThbTapiCall *Call);
        void __fastcall DoGenerateDigit(TObject *Sender);
        void __fastcall hbTapiLine1Silence(ThbTapiLine *Sender,
          ThbTapiCall *Call);
        void __fastcall CheckBox_MonitorDigitsAutoSelectClick(TObject *Sender);
        void __fastcall DoGenerateTone(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TForm1(TComponent* Owner);
        void __fastcall UpdateStatus();


};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
