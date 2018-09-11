// CodeGear C++Builder
// Copyright (c) 1995, 2008 by CodeGear
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Hbtapieval.pas' rev: 20.00

#ifndef HbtapievalHPP
#define HbtapievalHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member functions
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <Sysinit.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Stdctrls.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Extctrls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Hbtapiver.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Hbtapieval
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS ThbTapiAboutDialog;
class PASCALIMPLEMENTATION ThbTapiAboutDialog : public Forms::TForm
{
	typedef Forms::TForm inherited;
	
__published:
	Extctrls::TPanel* Panel2;
	Extctrls::TPanel* Panel1;
	Stdctrls::TLabel* Label_Version;
	Stdctrls::TLabel* Label_Edition;
	Extctrls::TPanel* Panel3;
	Stdctrls::TLabel* Label_Info;
	Stdctrls::TButton* OK;
	Stdctrls::TLabel* Label_WWW;
	Stdctrls::TLabel* Label_Copyright;
	Extctrls::TImage* Image2;
	Extctrls::TImage* Image1;
	Extctrls::TImage* Image3;
	Extctrls::TImage* Image4;
	Extctrls::TImage* Image5;
	Extctrls::TImage* Image6;
	void __fastcall DoShowHomepage(System::TObject* Sender);
	
public:
	__fastcall virtual ThbTapiAboutDialog(Classes::TComponent* AOwner);
public:
	/* TCustomForm.CreateNew */ inline __fastcall virtual ThbTapiAboutDialog(Classes::TComponent* AOwner, int Dummy) : Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~ThbTapiAboutDialog(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall ThbTapiAboutDialog(HWND ParentWindow) : Forms::TForm(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE void __fastcall hbTapiAbout1(void);
extern PACKAGE void __fastcall hbTapiAbout2(void);

}	/* namespace Hbtapieval */
using namespace Hbtapieval;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// HbtapievalHPP
