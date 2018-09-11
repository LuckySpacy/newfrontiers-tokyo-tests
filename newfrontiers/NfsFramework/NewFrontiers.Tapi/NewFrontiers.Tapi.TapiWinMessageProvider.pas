unit NewFrontiers.Tapi.TapiWinMessageProvider;

interface

uses NewFrontiers.Tapi;

type

  ///	<summary>
  ///	  Der WinMessageProvider stellt die Tapi-Funktionen zur Verfügung, indem
  ///	  ein anderes Programm via Windows Messages ferngesteuert wird. Es steht
  ///	  daher  nur ein Subset der Funktionen zur Verfügung
  ///	</summary>
  TTapiWinMessageProvider = class(TInterfacedObject, ITapiProvider)

    public
      function anrufen(aNummer: string): TTapiResult;

  end;

implementation

uses Windows, SysUtils, Messages, Vcl.Forms, Vcl.Dialogs;

{ TTapiWinMessageProvider }

function TTapiWinMessageProvider.anrufen(aNummer: string): TTapiResult;
var
   copyDataStruct: TCopyDataStruct;
   receiverHandle: THandle;
   res: integer;
   NormNummer: ansistring;
begin

  aNummer := TTapi.normalisieren(aNummer);

  if (aNummer = '') then
  begin
    result.result := false;
    result.error := 'Keine Nummer angegeben';
    exit;
  end;

  Normnummer := AnsiString(TTapi.normalisieren(aNummer)); // <-- [tb Funktioniert nicht über String, sondern über Ansi]

   res := 0;
   copyDataStruct.dwData := 0;
   copyDataStruct.cbData := 1 + (Length(aNummer) * SizeOf(Char));
   copyDataStruct.lpData := PAnsiChar(Normnummer);
   //copyDataStruct.lpData := PChar(Normnummer);

   receiverHandle := FindWindow(PChar('TForm6'), PChar('TAPI Client'));
   if receiverHandle = 0 then
   begin
      result.result := false;
      result.error := 'TAPI Client wurde nicht gefunden. Bitte prüfen Sie ob das Programm gestartet ist';
      ShowMessage(result.error);
      Exit;
   end;
   try
     res := SendMessage(receiverHandle, WM_COPYDATA, WPARAM(Application.Handle), LPARAM(@copyDataStruct));
   except
      on E: Exception do
        ShowMessage('Leitungen sind voll. Bitte versuchen Sie es noch einmal. ' + E.Message);
   end;

   result.result := res > 0;

end;

end.
