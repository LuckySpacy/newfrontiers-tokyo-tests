unit o_nf;

interface

uses
  SysUtils, Classes, o_func, o_system, o_RegIni, o_printer;


// In dieser Unit werden alle erweiterten Befehle der einzelnen Unit's zusammengefasst.
// Es soll dazu dienen den Befehlsaufruf der Bibliotheken zu vereinfachen.

// Diese Unit greiert sich beim Start von selbst und gibt sich beim beenden des Programms
// selbständig wieder frei.

const
  cCSIDL_DESKTOP                       = $0000; { <desktop> }
  cCSIDL_INTERNET                      = $0001; { Internet Explorer (icon on desktop) }
  cCSIDL_PROGRAMS                      = $0002; { Start Menu\Programs }
  cCSIDL_CONTROLS                      = $0003; { My Computer\Control Panel }
  cCSIDL_PRINTERS                      = $0004; { My Computer\Printers }
  cCSIDL_PERSONAL                      = $0005; { My Documents.  This is equivalent to CSIDL_MYDOCUMENTS in XP and above }
  cCSIDL_FAVORITES                     = $0006; { <user name>\Favorites }
  cCSIDL_STARTUP                       = $0007; { Start Menu\Programs\Startup }
  cCSIDL_RECENT                        = $0008; { <user name>\Recent }
  cCSIDL_SENDTO                        = $0009; { <user name>\SendTo }
  cCSIDL_BITBUCKET                     = $000a; { <desktop>\Recycle Bin }
  cCSIDL_STARTMENU                     = $000b; { <user name>\Start Menu }
  cCSIDL_MYDOCUMENTS                   = $000c; { logical "My Documents" desktop icon }
  cCSIDL_MYMUSIC                       = $000d; { "My Music" folder }
  cCSIDL_MYVIDEO                       = $000e; { "My Video" folder }
  cCSIDL_DESKTOPDIRECTORY              = $0010; { <user name>\Desktop }
  cCSIDL_DRIVES                        = $0011; { My Computer }
  cCSIDL_NETWORK                       = $0012; { Network Neighborhood (My Network Places) }
  cCSIDL_NETHOOD                       = $0013; { <user name>\nethood }
  cCSIDL_FONTS                         = $0014; { windows\fonts }
  cCSIDL_TEMPLATES                     = $0015;
  cCSIDL_COMMON_STARTMENU              = $0016; { All Users\Start Menu }
  cCSIDL_COMMON_PROGRAMS               = $0017; { All Users\Start Menu\Programs }
  cCSIDL_COMMON_STARTUP                = $0018; { All Users\Startup }
  cCSIDL_COMMON_DESKTOPDIRECTORY       = $0019; { All Users\Desktop }
  cCSIDL_APPDATA                       = $001a; { <user name>\Application Data }
  cCSIDL_PRINTHOOD                     = $001b; { <user name>\PrintHood }
  cCSIDL_LOCAL_APPDATA                 = $001c; { <user name>\Local Settings\Application Data (non roaming) }
  cCSIDL_ALTSTARTUP                    = $001d; { non localized startup }
  cCSIDL_COMMON_ALTSTARTUP             = $001e; { non localized common startup }
  cCSIDL_COMMON_FAVORITES              = $001f;
  cCSIDL_INTERNET_CACHE                = $0020;
  cCSIDL_COOKIES                       = $0021;
  cCSIDL_HISTORY                       = $0022;
  cCSIDL_COMMON_APPDATA                = $0023; { All Users\Application Data }
  cCSIDL_WINDOWS                       = $0024; { GetWindowsDirectory() }
  cCSIDL_SYSTEM                        = $0025; { GetSystemDirectory() }
  cCSIDL_PROGRAM_FILES                 = $0026; { C:\Program Files }
  cCSIDL_MYPICTURES                    = $0027; { C:\Program Files\My Pictures }
  cCSIDL_PROFILE                       = $0028; { USERPROFILE }
  cCSIDL_SYSTEMX86                     = $0029; { x86 system directory on RISC }
  cCSIDL_PROGRAM_FILESX86              = $002a; { x86 C:\Program Files on RISC }
  cCSIDL_PROGRAM_FILES_COMMON          = $002b; { C:\Program Files\Common }
  cCSIDL_PROGRAM_FILES_COMMONX86       = $002c; { x86 C:\Program Files\Common on RISC }
  cCSIDL_COMMON_TEMPLATES              = $002d; { All Users\Templates }
  cCSIDL_COMMON_DOCUMENTS              = $002e; { All Users\Documents }
  cCSIDL_COMMON_ADMINTOOLS             = $002f; { All Users\Start Menu\Programs\Administrative Tools }
  cCSIDL_ADMINTOOLS                    = $0030; { <user name>\Start Menu\Programs\Administrative Tools }
  cCSIDL_CONNECTIONS                   = $0031; { Network and Dial-up Connections }
  cCSIDL_COMMON_MUSIC                  = $0035; { All Users\My Music }
  cCSIDL_COMMON_PICTURES               = $0036; { All Users\My Pictures }
  cCSIDL_COMMON_VIDEO                  = $0037; { All Users\My Video }
  cCSIDL_RESOURCES                     = $0038; { Resource Directory }
  cCSIDL_RESOURCES_LOCALIZED           = $0039; { Localized Resource Directory }
  cCSIDL_COMMON_OEM_LINKS              = $003a; { Links to All Users OEM specific apps }
  cCSIDL_CDBURN_AREA                   = $003b; { USERPROFILE\Local Settings\Application Data\Microsoft\CD Burning }
  cCSIDL_COMPUTERSNEARME               = $003d; { Computers Near Me (computered from Workgroup membership) }
  cCSIDL_PROFILES                      = $003e;


type
  Tnf = class
  private
  public
    func: Tnf_func;
    System: Tnf_System;
    RegIni: Tnf_RegIni;
    Printer: Tnf_printers;
    constructor Create;
    destructor Destroy; override;
    class function GetInstance: Tnf;
  end;

implementation


var
  instance: Tnf;

{ nf }

constructor Tnf.Create;
begin
  func    := Tnf_func.Create;
  system  := Tnf_System.Create;
  RegIni  := Tnf_RegIni.Create;
  Printer := Tnf_printers.Create;
end;

destructor Tnf.Destroy;
begin
  FreeAndNil(system);
  FreeAndNil(RegIni);
  FreeAndNil(func);
  FreeAndNil(Printer);
  inherited;
end;


class function Tnf.GetInstance: Tnf;
begin
  Result := instance;
end;

// Instanz beim Programmstart erzeugen
initialization
   instance := Tnf.Create;


// Instanz beim Programmende freigeben
finalization
  FreeAndNil(instance);

end.


