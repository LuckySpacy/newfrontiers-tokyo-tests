// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'hbTapiEval.pas' rev: 6.00

#ifndef hbTapiEvalHPP
#define hbTapiEvalHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <hbTapiVer.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

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
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual ThbTapiAboutDialog(Classes::TComponent* AOwner, int Dummy) : Forms::TForm(AOwner, Dummy) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.Destroy */ inline __fastcall virtual ~ThbTapiAboutDialog(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall ThbTapiAboutDialog(HWND ParentWindow) : Forms::TForm(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE void __fastcall hbTapiAbout1(void);
extern PACKAGE void __fastcall hbTapiAbout2(void);

}	/* namespace Hbtapieval */
using namespace Hbtapieval;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// hbTapiEval
