unit NewFrontiers.Threading;

interface

  uses SysUtils, Classes, System.Generics.Collections;

  type


    TThreadMessageType = (rtOk, rtInfo, rtWarning, rtError);

    ///	<summary>
    ///	  Eine Nachricht, die von einem Thread (einer asynchronen Funktionen)
    ///	  erzeugt wurde.
    ///	</summary>
    TThreadMessage = class

      protected
        _type: TThreadMessageType;
        _message: string;

      public
        property MessageType: TThreadMessageType read _type;
        property Message: string read _message;

        constructor Create(aType: TThreadMessageType; aMessage: string);

    end;

    ///	<summary>
    ///	  Das Interface dient nur dazu die Referenzzählung zu verwenden und
    ///	  damit keine Speicherlöcher zu hinterlassen
    ///	</summary>
    IThreadResult = interface

        procedure setResult(aValue: boolean);
        procedure setException(aValue: Exception);

        function getResult: boolean;
        function getMessages: TObjectList<TThreadMessage>;
        function getException: Exception;

        property Result: boolean read getResult write setResult;
        property Messages: TObjectList<TThreadMessage> read getMessages;
        property Exception: Exception read getException write setException;

    end;


    ///	<summary>
    ///	  Das Ergebnis eines Threads. Besteht aus einem Boolean, das angibt ob
    ///	  die Ausführung erfolgreich war, den erzeugten Nachrichten sowie ggf.
    ///	  der aufgetretenen Exception. Muss vom Aufrufer freigeben werden!
    ///	</summary>
    TThreadResult = class(TInterfacedObject, IThreadResult)

      protected
        _result: boolean;
        _messages: TObjectList<TThreadMessage>;
        _exception: Exception;

        procedure setResult(aValue: boolean);
        procedure setException(aValue: Exception);

        function getResult: boolean;
        function getMessages: TObjectList<TThreadMessage>;
        function getException: Exception;

      public
        constructor Create;
        destructor Destroy; override;

    end;



    ///	<summary>
    ///	  Wrapper für einen Thread, der bereits die Grundlogik enthält
    ///	</summary>
    TAsync = class(TThread)

      protected
        _result: IThreadResult;

        procedure doWork; virtual; abstract;
        procedure Execute; override;

      public
        property Result: IThreadResult read _result;

        ///	<summary>
        ///	  Der Konstruktor sorgt dafür, dass der Thread immer suspended
        ///	  gestartet wird.
        ///	</summary>
        constructor Create; reintroduce;


    end;


    ///	<summary>
    ///	  Anonyme Methode, die mit dem Manager gestartet werden kann
    ///	</summary>
    TAsyncProcedure = reference to procedure;


    ///	<summary>
    ///	  Async-Klasse, die eine anonyme Methode ausführen kann
    ///	</summary>
    TAsyncProcedureThread = class(TAsync)

      protected
        _proc: TAsyncProcedure;

        procedure doWork; override;

      public
        property Proc: TAsyncProcedure read _proc write _proc;


    end;

    ///	<summary>
    ///	  Referenz auf eine Klasse vom Typ TAsync
    ///	</summary>
    TAsyncClass = class of TAsync;

    ///	<summary>
    ///	  Der Thread-Manager wird zum Ausführen von Threads (asynchronen
    ///	  Funktionen) verwendet.
    ///	</summary>
    TThreadManager = class


      public
        ///	<summary>
        ///	  Führt den übergebenen Thread aus und gibt die Kontrolle erst nach
        ///	  dem Abschluss an das Hauptprogramm zurück. Auf diese Weise
        ///	  reagiert die GUI auch während blockender Operationen
        ///	</summary>
        class function await(aClassToExecute: TAsyncClass): IThreadResult; overload;

        class function await(aThread: TAsync): IThreadResult; overload;

        class function await(aProc: TAsyncProcedure): IThreadResult; overload;

        ///	<summary>
        ///	  Führt den übergebenen Thread aus und gibt die Kontrolle sofort an
        ///	  das Hauptprogramm zurück. Über die zurückgegebene ID, kann das
        ///	  Ergebnis später abgefragt werden
        ///	</summary>
        class procedure run(aClassToExecute: TAsyncClass); overload;

        class procedure run(aThread: TAsync); overload;

        class procedure run(aProc: TAsyncProcedure); overload;

    end;

implementation

  const AWAIT_SLEEP_TIME = 100;

{ TAsync }

constructor TAsync.Create;
begin

  inherited Create(true);

end;

procedure TAsync.execute;
begin
  inherited;

  _result := TThreadResult.Create;

  try
    doWork;
  except
    on E:Exception do
    begin
      _result.Result := false;
      _result.Exception := E;
    end;
  end;

end;

{ TThreadManager }

class function TThreadManager.await(
  aClassToExecute: TAsyncClass): IThreadResult;
var curThread: TAsync;
begin

  curThread := aClassToExecute.Create;

  result := await(curThread);

  curThread.Free;

end;

class procedure TThreadManager.run(aClassToExecute: TAsyncClass);
var curThread: TAsync;
begin

  curThread := aClassToExecute.Create;
  curThread.FreeOnTerminate := true;

  run(curThread);

end;

class function TThreadManager.await(aThread: TAsync): IThreadResult;
begin

  aThread.FreeOnTerminate := false;

  aThread.Start;
  aThread.WaitFor;

  result := aThread.Result;

end;

class procedure TThreadManager.run(aThread: TAsync);
begin

  aThread.Start;

end;

class function TThreadManager.await(aProc: TAsyncProcedure): IThreadResult;
var curThread: TAsyncProcedureThread;
begin

  curThread := TAsyncProcedureThread.Create;
  curThread.Proc := aProc;

  result := await(curThread);

  curThread.Free;
end;

class procedure TThreadManager.run(aProc: TAsyncProcedure);
var curThread: TAsyncProcedureThread;
begin

  curThread := TAsyncProcedureThread.Create;
  curThread.Proc := aProc;
  curThread.FreeOnTerminate := true;

  run(curThread);

end;

{ TThreadMessage }

constructor TThreadMessage.Create(aType: TThreadMessageType; aMessage: string);
begin
  inherited Create;
  _type := aType;
  _message := aMessage;
end;

{ TThreadResult }

constructor TThreadResult.Create;
begin
  _messages := TObjectList<TThreadMessage>.Create(true);
end;

destructor TThreadResult.Destroy;
begin
  _messages.Free;

  inherited;
end;

function TThreadResult.getException: Exception;
begin
  result := _exception;
end;

function TThreadResult.getMessages: TObjectList<TThreadMessage>;
begin
  result := _messages;
end;

function TThreadResult.getResult: boolean;
begin
  result := _result;
end;

procedure TThreadResult.setException(aValue: Exception);
begin
  _exception := aValue;
end;

procedure TThreadResult.setResult(aValue: boolean);
begin
  _result := aValue;
end;

{ TAsyncProcedureThread }

procedure TAsyncProcedureThread.doWork;
begin

  _proc();
  //Terminate;

end;

end.
