//---------------------------------------------------------------------------

#ifndef uMainH
#define uMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "hbTapiWave.hpp"
#include <Buttons.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
        TSpeedButton *SpeedButton_No1;
        TSpeedButton *SpeedButton_No2;
        TSpeedButton *SpeedButton_No3;
        TSpeedButton *SpeedButton_No4;
        TSpeedButton *SpeedButton_No5;
        TSpeedButton *SpeedButton_No6;
        TSpeedButton *SpeedButton_No7;
        TSpeedButton *SpeedButton_No8;
        TSpeedButton *SpeedButton_No9;
        TLabel *Label1;
        TButton *Button_Beep;
        TButton *Button_Play123;
        TButton *Button_Stopm;
        TListBox *ListBox1;
        TButton *Button_Empty;
        TButton *Button_Empty2;
        TButton *Button_Error;
        TComboBox *ComboBox1;
        TButton *Button_Info;
        ThbWaveOut *hbWaveOut1;
        void __fastcall Button_BeepClick(TObject *Sender);
        void __fastcall Button_Play123Click(TObject *Sender);
        void __fastcall WaveOut1WaveError(TObject *Sender, DWORD ErrorCode,
          String ErrorText);
        void __fastcall WaveOut1Done(TObject *Sender);
        void __fastcall DoPlayNo(TObject *Sender);
        void __fastcall Button_StopClick(TObject *Sender);
        void __fastcall Button_EmptyClick(TObject *Sender);
        void __fastcall Button_Empty2Click(TObject *Sender);
        void __fastcall Button_ErrorClick(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall ComboBox1Change(TObject *Sender);
        void __fastcall Button_InfoClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
