library TestDLL;

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
  sharemem,
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  System.SysUtils,
  System.Classes,
  Vcl.Dialogs,
  Vcl.Forms,
  DLLForm in 'DLLForm.pas' {frm_DLL};

{$R *.res}

{
procedure Test1(aStrValue: string; aInt: Integer); StdCall;
begin
  ShowMessage(IntToStr(aInt));
  ShowMessage(aStrValue);
end;
}

procedure ShowForm(aCaption: String); StdCall;
var
  Form: TFrm_DLL;
begin
  Form := TFrm_DLL.Create(nil);
  Form.Caption := aCaption;
  Form.ShowModal;
  FreeAndNil(Form);
end;

procedure TestInt(aZahl: Integer); StdCall;
begin
  ShowMessage('Zahl: ' + IntToStr(aZahl));
end;


exports
 // Test1,
  ShowForm,
  TestInt;

begin
end.
