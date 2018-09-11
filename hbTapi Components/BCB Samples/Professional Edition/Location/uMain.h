//---------------------------------------------------------------------------

#ifndef uMainH
#define uMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "hbTapi.hpp"
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
        TGroupBox *GroupBox1;
        TLabel *Label_LocationName;
        TLabel *Label3;
        TLabel *Label5;
        TLabel *Label6;
        TLabel *Label7;
        TLabel *Label8;
        TLabel *Label9;
        TLabel *Label10;
        TLabel *Label_PermanentLocationID;
        TLabel *Label_CountryID;
        TLabel *Label_CountryCode;
        TLabel *Label_CountryName;
        TLabel *Label_LocalAccessCode;
        TLabel *Label_LongDistanceAccessCode;
        TLabel *Label2;
        TLabel *Label_CityCode;
        TButton *Button1;
        TButton *Button2;
        TGroupBox *GroupBox2;
        TButton *Button3;
        TListBox *ListBox1;
        TButton *Button4;
        TGroupBox *GroupBox3;
        TEdit *Edit1;
        TButton *Button5;
        ThbTapiLine *hbTapiLine1;
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall FormDestroy(TObject *Sender);
        void __fastcall Button2Click(TObject *Sender);
        void __fastcall Button4Click(TObject *Sender);
        void __fastcall Button5Click(TObject *Sender);
        void __fastcall Button3Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        ThbTapiLocationList* FLocationList;

        __fastcall TForm1(TComponent* Owner);
        void __fastcall UpdateLocations();
        void __fastcall UpdateSystemLocation();


};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
