library TMSDLLTest;

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
  Form.Test2 in '..\Form.Test2.pas' {Form1},
  Frame.Test2 in '..\Frame.Test2.pas' {Frame1: TFrame},
  Form2.Test2 in '..\Form2.Test2.pas' {Form2},
  Frame2.Test2 in '..\Frame2.Test2.pas' {Frame2: TFrame},
  FormAlsFrame.Test2 in '..\FormAlsFrame.Test2.pas' {FormAlsFrame};

{$R *.res}

procedure ShowForm; StdCall;
var
  Form: TForm1;
begin
  Form := TForm1.Create(nil);
  Form.ShowModal;
  FreeAndNil(Form);
end;

procedure ShowForm2(aConnection, aLoginMA: String; aMandantNr, aKuId: Integer); StdCall;
var
  Form: TForm1;
begin
  Form := TForm1.Create(nil);
  //Form.Caption := aCaption;
  Form.ShowModal;
  FreeAndNil(Form);
end;

exports
  ShowForm,
  ShowForm2;

begin
end.
