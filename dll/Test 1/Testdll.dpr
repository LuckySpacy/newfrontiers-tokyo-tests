library Testdll;

{ Wichtiger Hinweis zur DLL-Speicherverwaltung: ShareMem muss die erste
  Unit in der USES-Klausel Ihrer Bibliothek UND in der USES-Klausel Ihres Projekts
  (w�hlen Sie 'Projekt-Quelltext anzeigen') sein, wenn Ihre DLL Prozeduren oder Funktionen
  exportiert, die Strings als Parameter oder Funktionsergebnisse �bergeben. Dies
  gilt f�r alle Strings, die an oder von Ihrer DLL �bergeben werden, auch f�r solche,
  die in Records und Klassen verschachtelt sind. ShareMem ist die Interface-Unit zur
  gemeinsamen BORLNDMM.DLL-Speicherverwaltung, die zusammen mit Ihrer DLL
  weitergegeben werden muss. �bergeben Sie String-Informationen mit PChar- oder ShortString-Parametern, um die Verwendung von BORLNDMM.DLL zu vermeiden.
 }

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  System.SysUtils,
  Vcl.Dialogs,
  System.Classes;

{$R *.res}

  function addiereZahlen(Zahl1, Zahl2: Integer): integer; StdCall;
  begin
    Result := Zahl1 + Zahl2;
    ShowMessage(IntToStr(Zahl1));
  end;

  procedure showText(text: PChar); StdCall;
  begin
    ShowMessage(StrPas(text));
  end;

  exports
  addiereZahlen,
  ShowText;

begin


end.
