//---------------------------------------------------------------------------

#ifndef uMainH
#define uMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "hbTapi.hpp"
#include <Buttons.hpp>
#include <ComCtrls.hpp>
#include <ImgList.hpp>
#include <Menus.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
        TLabel *Label4;
        TLabel *Label6;
        TLabel *Label7;
        TListBox *ListBox1;
        TGroupBox *GroupBox4;
        TLabel *LabelDevice;
        TLabel *Label1;
        TLabel *Label3;
        TComboBox *ComboBox_Line;
        TGroupBox *GroupBox5;
        TLabel *Label2;
        TComboBox *ComboBox_Phone;
        TMemo *Memo1;
        TListView *ListView1;
        TGroupBox *GroupBox1;
        TSpeedButton *Button_HandSetSpeaker;
        TSpeedButton *Button_HandSetMicro;
        TSpeedButton *Button_HandSetHook;
        TLabel *Label8;
        TLabel *Label9;
        TTrackBar *TrackBar_HandSetVolume;
        TTrackBar *TrackBar_HandSetGain;
        TGroupBox *GroupBox2;
        TSpeedButton *Button_HeadSetSpeaker;
        TSpeedButton *Button_HeadSetMicro;
        TSpeedButton *Button_HeadSetHook;
        TLabel *Label10;
        TLabel *Label11;
        TTrackBar *TrackBar_HeadSetVolume;
        TTrackBar *TrackBar_HeadSetGain;
        TGroupBox *Speaker;
        TSpeedButton *Button_SpeakerSpeaker;
        TSpeedButton *Button_SpeakerMicro;
        TSpeedButton *Button_SpeakerHook;
        TLabel *Label13;
        TLabel *Label14;
        TTrackBar *TrackBar_SpeakerVolume;
        TTrackBar *TrackBar_SpeakerGain;
        ThbTapiLine *hbTapiLine1;
        ThbTapiPhone *TapiPhone1;
        TImageList *ImageList1;
        TPopupMenu *PopupMenu1;
        TMenuItem *Steady1;
        TMenuItem *Off1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall ComboBox_LineChange(TObject *Sender);
        void __fastcall DoSetVolume(TObject *Sender);
        void __fastcall DoSetGain(TObject *Sender);
        void __fastcall DoSetHook(TObject *Sender);
        void __fastcall DoSetSpeaker(TObject *Sender);
        void __fastcall DoSetMicro(TObject *Sender);
        void __fastcall DoClearListBox(TObject *Sender);
        void __fastcall ComboBox_PhoneChange(TObject *Sender);
        void __fastcall TapiPhone1Display(TObject *Sender);
        void __fastcall DoUpdatePhoneControls(TObject *Sender);
        void __fastcall TapiPhone1TapiReply(TObject *Sender,
          DWORD RequestID, DWORD ReplyCode);
        void __fastcall TapiPhone1Lamp(ThbTapiPhone *Sender,
          DWORD ButtonLampID);
        void __fastcall Steady1Click(TObject *Sender);
        void __fastcall Off1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TForm1(TComponent* Owner);
        void __fastcall UpdateStatus();
        void __fastcall TForm1::UpdateControls();
        void __fastcall TForm1::UpdatePhoneControls();
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
