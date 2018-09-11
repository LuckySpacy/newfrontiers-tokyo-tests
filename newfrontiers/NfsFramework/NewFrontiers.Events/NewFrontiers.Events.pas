unit NewFrontiers.Events;

interface

  uses
    Generics.Collections;

  type

    IEvent = interface

    end;

    TEvent = class(TInterfacedObject, IEvent)

      protected
        _propagationStopped: boolean;

      public
        property PropagationStopped: boolean read _propagationStopped;

    end;

    IEventListener = interface

        function onEvent(aEvent: TEvent): boolean;

    end;

    TEventDispatcher = class

      protected
        _listeners: TObjectDictionary<string, TList<IEventListener>>;

        constructor Create;

      public

        destructor Destroy; override;

        ///	<summary>
        ///	  Singleton-Pattern
        ///	</summary>
        class function getInstance(): TEventDispatcher;

        ///	<summary>
        ///	  Adds an event listener that listens on the specified events
        ///	</summary>
        ///	<param name="aPrio">
        ///	  The higher this value, the earlier an event * listener will be
        ///	  triggered in the chain (defaults to 0)
        ///	</param>
        procedure addListener(aEventName: string; aListener: IEventListener; aPrio: integer = 0);

        ///	<summary>
        ///	  Removes an event listener from the specified events.
        ///	</summary>
        procedure removeListener(aEventName: string; aListener: IEventListener);

        ///	<summary>
        ///	  Gets the listeners of a specific event or all listeners.
        ///	</summary>
        function getListeners(aEventName: string): TList<IEventListener>;

        ///	<summary>
        ///	  Checks whether an event has any registered listeners.
        ///	</summary>
        function hasListeners(aEventName: string): boolean;

        ///	<summary>
        ///	  Dispatches an event to all registered listeners.
        ///	</summary>
        ///	<param name="aEventName">
        ///	  The name of the event to dispatch. The name of * the event is the
        ///	  name of the method that is * invoked on listeners.
        ///	</param>
        ///	<param name="aEvent">
        ///	  The event to pass to the event handlers/listeners. * If not
        ///	  supplied, an empty Event instance is created.
        ///	</param>
        function dispatchEvent(aEventName: string; aEvent: TEvent = nil): TEvent;



    end;


implementation

  var _instance: TEventDispatcher;

{ TEventDispatcher }

procedure TEventDispatcher.addListener(aEventName: string;
  aListener: IEventListener; aPrio: integer);
var
  newListenerList: TList<IEventListener>;
begin

  // TODO: aPrio not supported at the moment

  if (not _listeners.ContainsKey(aEventName)) then
  begin
    newListenerList := TList<IEventListener>.Create();
    _listeners.Add(aEventName, newListenerList);
  end;

  _listeners[aEventName].Add(aListener);

end;

constructor TEventDispatcher.Create;
begin

  _listeners := TObjectDictionary<string, TList<IEventListener>>.Create();

end;

destructor TEventDispatcher.Destroy;
begin

  inherited;

  _listeners.Free;

end;

function TEventDispatcher.dispatchEvent(aEventName: string; aEvent: TEvent = nil): TEvent;
var
  eventListener: IEventListener;
begin

  if (aEvent = nil) then aEvent := TEvent.Create;

  result := aEvent;

  if (not _listeners.ContainsKey(aEventName)) then
    exit;

  for eventListener in getListeners(aEventName) do
  begin
    eventListener.onEvent(aEvent);
    if (aEvent.PropagationStopped) then
      Break;
  end;

end;

class function TEventDispatcher.getInstance: TEventDispatcher;
begin

  if (_instance = nil) then
  begin
    _instance := TEventDispatcher.Create;
  end;

  result := _instance;

end;

function TEventDispatcher.getListeners(
  aEventName: string): TList<IEventListener>;
begin

  result := _listeners[aEventName];

end;

function TEventDispatcher.hasListeners(aEventName: string): boolean;
begin

  result := (getListeners(aEventName) <> nil) and (getListeners(aEventName).Count > 0);

end;

procedure TEventDispatcher.removeListener(aEventName: string;
  aListener: IEventListener);
begin

  getListeners(aEventName).Remove(aListener);


end;

end.
