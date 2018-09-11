unit NewFrontiers.Commands;

interface

  uses Classes;

  type


  ///	<summary>
  ///	  Basisklasse für ein Command
  ///	</summary>
  TCommand = class(TComponent)

    protected
      _id: string;
      _titel: string;
      _buttonText: string;
      _beschreibung: string;
      _icon: integer;

      procedure setDefaultValues; virtual; abstract;

    public
      ///	<summary>
      ///	  technische ID des Commands. Dieser Wert darf nie geändert werden, da
      ///	  über diesen die Funktion angesprochen wird.
      ///	</summary>
      property Id: string read _id;

      ///	<summary>
      ///	  Titel des Commands, der in der Auswahloberfläche angezeigt wird
      ///	</summary>
      property Titel: string read _titel;

      ///	<summary>
      ///	  Text, der auf dem Button angezeigt werden soll
      ///	</summary>
      property ButtonText: string read _buttonText write _buttonText;

      ///	<summary>
      ///	  Beschreibung für das Auswahlfenster
      ///	</summary>
      property Beschreibung: string read _beschreibung;

      ///	<summary>
      ///	  Das Icon für das Command (Index der Icon-Imagelist)
      ///	</summary>
      property Icon: integer read _icon write _icon;


      constructor Create(aOwner: TComponent); reintroduce;

      ///	<summary>
      ///	  Ausführen des hinterlegten Commands
      ///	</summary>
      function execute: boolean; virtual; abstract;

  end;

  ///	<summary>
  ///	  Referenz auf den Klassentyp eines Commands
  ///	</summary>
  TCommandClass = class of TCommand;


  ///	<summary>
  ///	  Repository, in dem sich alle zur Verfügung stehenden Commands
  ///	  registrieren müssen. Dies kann im initialization Teil der
  ///	  implementierenden Datei geschehen. Hierdurch ist es egal wie viele
  ///	  Commands vorhanden sind, oder wo diese deklariert werden.
  ///	</summary>
  TCommandRepository = class

    protected
      _actions: TStringlist;

      constructor Create;

    public
      destructor Destroy; override;

      ///	<summary>
      ///	  Die Liste der Commands. Abgebildet als String-List, deren
      ///	  String-Anteil die ID ist.
      ///	</summary>
      property Actions: TStringlist read _actions;

      ///	<summary>
      ///	  Registriert ein neues Command im Repo
      ///	</summary>
      class procedure registerCommand(aActionClass: TCommandClass);

      ///	<summary>
      ///	  Gibt eine neue Instanz des angefragten Commands zurück.
      ///	</summary>
      class function getCommand(aId: string): TCommand;

      ///	<summary>
      ///	  Singleton-Implementierung
      ///	</summary>
      class function getInstance: TCommandRepository;

  end;

  ///	<summary>
  ///	  Dieses Attribut kennzeichnet einen Eingangswert einen Commands
  ///	</summary>
  CommandInput = class(TCustomAttribute);

  ///	<summary>
  ///	  Kennzeichnet eine Ausgangsvariable in einem Command
  ///	</summary>
  CommandOutput = class(TCustomAttribute);

implementation

  var _repositoryInstance: TCommandRepository;


{ TCommandRepository }

constructor TCommandRepository.Create;
begin
  _actions := TStringList.Create;
  _actions.Sorted := True;
  _actions.Duplicates := dupIgnore;
end;

destructor TCommandRepository.Destroy;
begin
  inherited;

  _actions.Free;
  _actions := nil;
end;

class function TCommandRepository.getCommand(aId: string): TCommand;
var
  index: Integer;
  prototype: TCommand;
  commandType: TCommandClass;
begin

  // TODO: An der Stelle gibt es ein Speicherleck. Da mit Owner nil instanziiert wird.

  index := TCommandRepository.getInstance.Actions.IndexOf(aId);

  if (index >= 0) then
  begin
    prototype := TCommand(TCommandRepository.getInstance.Actions.Objects[index]);
    commandType := TCommandClass(prototype.ClassType);
    result := commandType.Create(nil);
  end
  else
    result := nil;

end;

class function TCommandRepository.getInstance: TCommandRepository;
begin
  if _repositoryInstance = nil then
    _repositoryInstance := TCommandRepository.Create;

  result := _repositoryInstance;
end;

class procedure TCommandRepository.registerCommand(
  aActionClass: TCommandClass);
var
  myClass: TCommand;
begin

  myClass := aActionClass.Create(nil);


  //TCommandRepository.getInstance.Actions.AddObject(myClass.Id, TObject(aActionClass));
  TCommandRepository.getInstance.Actions.AddObject(myClass.Id, myClass);

  //myClass.Free;

end;

{ TCommand }

constructor TCommand.Create(aOwner: TComponent);
begin
  inherited;

  setDefaultValues;
end;

end.
