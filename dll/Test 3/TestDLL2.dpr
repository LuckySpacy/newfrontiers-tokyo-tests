library TestDLL2;

{ Wichtiger Hinweis zur DLL-Speicherverwaltung: ShareMem muss die erste
  Unit in der USES-Klausel Ihrer Bibliothek UND in der USES-Klausel Ihres Projekts
  (wählen Sie 'Projekt-Quelltext anzeigen') sein, wenn Ihre DLL Prozeduren oder Funktionen
  exportiert, die Strings als Parameter oder Funktionsergebnisse übergeben. Dies
  gilt für alle Strings, die an oder von Ihrer DLL übergeben werden, auch für solche,
  die in Records und Klassen verschachtelt sind. ShareMem ist die Interface-Unit zur
  gemeinsamen BORLNDMM.DLL-Speicherverwaltung, die zusammen mit Ihrer DLL
  weitergegeben werden muss. Übergeben Sie String-Informationen mit PChar- oder ShortString-Parametern, um die Verwendung von BORLNDMM.DLL zu vermeiden.
 }

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  System.SysUtils,
  System.Classes;

{$R *.res}

function addieren(aZahl1, aZahl2: Integer): Integer; StdCall;
begin
  Result := aZahl1 + aZahl2;
end;

exports
  addieren;

begin
end.
