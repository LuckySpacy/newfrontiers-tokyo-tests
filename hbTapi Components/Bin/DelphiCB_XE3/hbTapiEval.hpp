// CodeGear C++Builder
// Copyright (c) 1995, 2012 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'hbTapiEval.pas' rev: 24.00 (Win32)

#ifndef HbtapievalHPP
#define HbtapievalHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <Winapi.Windows.hpp>	// Pascal unit
#include <Vcl.Forms.hpp>	// Pascal unit
#include <Vcl.StdCtrls.hpp>	// Pascal unit
#include <Vcl.Controls.hpp>	// Pascal unit
#include <Vcl.ExtCtrls.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <Vcl.Graphics.hpp>	// Pascal unit
#include <hbTapiVer.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Hbtapieval
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS ThbTapiAboutDialog;
class PASCALIMPLEMENTATION ThbTapiAboutDialog : public Vcl::Forms::TForm
{
	typedef Vcl::Forms::TForm inherited;
	
__published:
	Vcl::Extctrls::TPanel* Panel2;
	Vcl::Extctrls::TPanel* Panel1;
	Vcl::Stdctrls::TLabel* Label_Version;
	Vcl::Stdctrls::TLabel* Label_Edition;
	Vcl::Extctrls::TPanel* Panel3;
	Vcl::Stdctrls::TLabel* Label_Info;
	Vcl::Stdctrls::TButton* OK;
	Vcl::Stdctrls::TLabel* Label_WWW;
	Vcl::Stdctrls::TLabel* Label_Copyright;
	Vcl::Extctrls::TImage* Image2;
	Vcl::Extctrls::TImage* Image1;
	Vcl::Extctrls::TImage* Image3;
	Vcl::Extctrls::TImage* Image4;
	Vcl::Extctrls::TImage* Image5;
	Vcl::Extctrls::TImage* Image6;
	void __fastcall DoShowHomepage(System::TObject* Sender);
	
public:
	__fastcall virtual ThbTapiAboutDialog(System::Classes::TComponent* AOwner);
public:
	/* TCustomForm.CreateNew */ inline __fastcall virtual ThbTapiAboutDialog(System::Classes::TComponent* AOwner, int Dummy) : Vcl::Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~ThbTapiAboutDialog(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall ThbTapiAboutDialog(HWND ParentWindow) : Vcl::Forms::TForm(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE void __fastcall hbTapiAbout1(void);
extern PACKAGE void __fastcall hbTapiAbout2(void);
}	/* namespace Hbtapieval */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_HBTAPIEVAL)
using namespace Hbtapieval;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// HbtapievalHPP
