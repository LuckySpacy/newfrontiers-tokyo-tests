unit NewFrontiers.GUI.Binding;

interface

  uses Vcl.Controls, Generics.Collections, System.Rtti;

  type

    TBinding = class;

    ///	<summary>
    ///	  Identifiziert den Teilnehmer eines Bindings eindeutig und stellt die
    ///	  Kommunikation mit ihm her.
    ///	</summary>
    TBindingTarget = class

      protected
        _binding: TBinding;
        _target: TObject;
        _bindingPath: string;

        procedure setTarget(const Value: TObject); virtual; abstract;

      public
        property Binding: TBinding read _binding write _binding;
        property BindingPath: string read _bindingPath write _bindingPath;
        property Target: TObject read _target write setTarget;

        function getValue: TValue; virtual; abstract;
        procedure setValue(aValue: TValue); virtual; abstract;

        ///	<summary>
        ///	  Gibt den eindeutigen Identifier zurück.
        ///	</summary>
        ///	<returns>
        ///	  Identifier. Aktuell die Speicheradresse des Objekts sowie den
        ///	  Propertynamen.
        ///	</returns>
        function getIdentifier: string;

    end;


    ///	<summary>
    ///	  Definiert ein Quelle und Ziel eines Bindings. Aktuell handelt es sich
    ///	  immer um ein bi-direktionales Binding.
    ///	</summary>
    TBinding = class

      protected
        _target: TBindingTarget;
        _source: TBindingTarget;

        procedure setSource(const Value: TBindingTarget);
        procedure setTarget(const Value: TBindingTarget);

      public
        destructor Destroy; override;

        property Target: TBindingTarget read _target write setTarget;
        property Source: TBindingTarget read _source write setSource;

        procedure contentChanged(aSender: TBindingTarget); overload;
        procedure contentChanged(aObject: TObject); overload;
        procedure updateTarget;
        procedure updateSource;

        ///	<summary>
        ///	  Trägt dieses Binding im Dictionary ein. Nur eingetragene Bindings
        ///	  werden tatsächlich ausgeführt
        ///	</summary>
        procedure registerWithDictionary;

        ///	<summary>
        ///	  Entfernt das BInding aus dem Dictionary
        ///	</summary>
        procedure removeFromDictionary;


        ///	<summary>
        ///	  Gibt zurück, ob eines der beiden Targets aktuell gegen nil
        ///	  gebunden ist
        ///	</summary>
        function isNilBinding: boolean;

    end;

    ///	<summary>
    ///	  Factory für die BindingTargets. Neue Implementierungen können über
    ///	  den Initialization-Bereich der Quelldatei hinzugefügt werden.
    ///	</summary>
    TBindingTargetFactory = class

      protected
        _registeredTargets: TDictionary<TClass, TClass>;

        constructor Create;

      public
        property RegisteredTargets: TDictionary<TClass, TClass> read _registeredTargets;

        destructor Destroy; override;

        class function getInstance: TBindingTargetFactory;

        ///	<summary>
        ///	  Registriert eine neue Zurdnung Klasse &lt;-&gt; erzeugtes Target.
        ///	</summary>
        class procedure registerTargetClass(aControl: TClass; aTarget: TClass);

        ///	<summary>
        ///	  Diese Methode erzeugt auf Basis eines übergebenen Controls sein
        ///	  Standard-BindingTarget.
        ///	</summary>
        class function createTarget(aControl: TControl): TBindingTarget; overload;

        ///	<summary>
        ///	  Diese Methoder erzeugt auf Basis eines Objekts und eines
        ///	  BindingPath ein neues Target.
        ///	</summary>
        class function createTarget(aObject: TObject; aBindingPath: string): TBindingTarget; overload;

        ///	<summary>
        ///	  Entspricht createTarget nur für Felder statt Properties. ACHTUNG:
        ///	  Wird vor Produktionsreife noch entfernt
        ///	</summary>
        class function createFieldTarget(aObject: TObject; aBindingPath: string): TBindingTarget;
    end;


    ///	<summary>
    ///	  Mit einer Binding-Group können mehrere Bindings in einer Gruppe
    ///	  bearbeitet werden. Alle Bindings haben die gleiche Quelle. (z.B.
    ///	  Entity für die GUI)
    ///	</summary>
    TBindingGroup = class

    protected
      _context: TObject;
      _bindings: TObjectlist<TBinding>;

      procedure setContext(const Value: TObject);

    public
      ///	<summary>
      ///	  Legt den Kontext der Bindings fest. Wird der Kontext gewechselt
      ///	  werden sämtliche Bindings neu aufgesetzt
      ///	</summary>
      property Context: TObject read _context write setContext;

      constructor Create;
      destructor Destroy; override;

      ///	<summary>
      ///	  Fügt der Grupp ein neues Binding hinzu
      ///	</summary>
      procedure addBinding(aControl: TControl; aBindingExpression: string);

      ///	<summary>
      ///	  Fügt der Grupp ein neues Feld-Binding hinzu.l ACHTUNG: Methode wird
      ///	  bis zur Produktionsreife wieder verschwinden.
      ///	</summary>
      procedure addFieldBinding(aControl: TControl; aBindingExpression: string);

      ///	<summary>
      ///	  Erstellt eine Binding zwischen dem übergebenen Property und dem
      ///	  Binding-Context der Gruppe
      ///	</summary>
      procedure bindContextTo(aObject: TObject; aPropertyname: string);

    end;


    ///	<summary>
    ///	  Das Binding-Dictionary enthält Listen Bindings zu den jeweiligen
    ///	  Endpunkten. Wird ein Endpunkt aktualisiert, beauftragt das Dictionary
    ///	  alle abhängigen Bindings sich zu aktualisieren.
    ///	</summary>
    TBindingDictionary = class (TDictionary<string, TList<TBinding>>)

      public
        class function getInstance: TBindingDictionary;

        ///	<summary>
        ///	  Eine Property wurde aktualisiert. Das Dictionary sucht alle
        ///	  abhängigen Bindings und aktualisiert diese.
        ///	</summary>
        procedure propertyChanged(aObject: TObject; aProperty: string);


        ///	<summary>
        ///	  Lässt sich nicht feststellen welche Eigenschaft eines Objekts
        ///	  sich geändert hat, kann man mit dieser Methode alle diesem Objekt
        ///	  zugeordneten Bindings auf einmal aktualisieren.
        ///	</summary>
        procedure objectChanged(aObject: TObject);

        ///	<summary>
        ///	  Fügt dem Dictionary ein neues Binding hinzu
        ///	</summary>
        procedure addBinding(aIdentifier: string; aBinding: TBinding);

        ///	<summary>
        ///	  Entfernt ein Binding aus dem Dictionary
        ///	</summary>
        procedure removeBinding(aIdentifier: string; aBinding: TBinding);

    end;


implementation

  uses NewFrontiers.Reflection, SysUtils, NewFrontiers.GUI.BindingTarget, System.Generics.Defaults,
  NewFrontiers.Utility.StringUtil;

  var _targetFactoryInstance: TBindingTargetFactory;
  var _dictionaryInstance: TBindingDictionary;

{ TBindingManager }

procedure TBindingGroup.addBinding(aControl: TControl;
  aBindingExpression: string);
var
  temp: TBinding;
begin

  temp := TBinding.Create;
  temp.Target := TBindingTargetFactory.createTarget(aControl);
  temp.Source := TBindingTargetFactory.createTarget(_context, aBindingExpression);
  temp.registerWithDictionary;

  _bindings.Add(temp);

end;

procedure TBindingGroup.addFieldBinding(aControl: TControl;
  aBindingExpression: string);
var
  temp: TBinding;
begin

  temp := TBinding.Create;
  temp.Target := TBindingTargetFactory.createTarget(aControl);
  temp.Source := TBindingTargetFactory.createFieldTarget(_context, aBindingExpression);
  temp.registerWithDictionary;

  _bindings.Add(temp);
end;

procedure TBindingGroup.bindContextTo(aObject: TObject; aPropertyname: string);
var binding: TBinding;
begin
  binding := TBinding.Create;
  binding.Target := TBindingTargetFactory.createTarget(self, 'Context');
  binding.Source := TBindingTargetFactory.createTarget(aObject, aPropertyname);
  binding.registerWithDictionary;
end;

constructor TBindingGroup.Create;
begin

  _bindings := TObjectlist<TBinding>.Create(true);

end;

destructor TBindingGroup.Destroy;
begin

  _bindings.Free;

  inherited;
end;


procedure TBindingGroup.setContext(const Value: TObject);
var aktBinding: TBinding;
begin
  if (_context <> Value) then
  begin

    for aktBinding in _bindings do
    begin
      aktBinding.removeFromDictionary;
      aktBinding.Source.Target := Value;
      aktBinding.registerWithDictionary;
      aktBinding.updateTarget;
    end;

  end;

  _context := Value;

end;

{ TBinding }

procedure TBinding.contentChanged(aSender: TBindingTarget);
begin
  if (aSender = _target) then updateSource
  else updateTarget;
end;

procedure TBinding.contentChanged(aObject: TObject);
begin
  if (aObject = _source.Target) then contentChanged(_source)
  else contentChanged(_target);
end;

destructor TBinding.Destroy;
begin
  removeFromDictionary;
  inherited;
end;

function TBinding.isNilBinding: boolean;
begin
  result := (_source.getIdentifier = 'nil') or (_target.getIdentifier = 'nil');  
end;

procedure TBinding.registerWithDictionary;
begin

  TBindingDictionary.getInstance.addBinding(_source.getIdentifier, self);
  TBindingDictionary.getInstance.addBinding(_target.getIdentifier, self);

end;

procedure TBinding.removeFromDictionary;
begin

  TBindingDictionary.getInstance.removeBinding(_source.getIdentifier, self);
  TBindingDictionary.getInstance.removeBinding(_target.getIdentifier, self);

end;

procedure TBinding.setSource(const Value: TBindingTarget);
begin

  _source := Value;
  _source.Binding := self;

  if (_target <> nil) then
    updateTarget;

end;

procedure TBinding.setTarget(const Value: TBindingTarget);
begin
  _target := Value;
  _target.Binding := self;
end;

procedure TBinding.updateSource;
begin
  _source.setValue(_target.getValue);
end;

procedure TBinding.updateTarget;
begin
  _target.setValue(_source.getValue);
end;

{ TBindingTargetFactory }

constructor TBindingTargetFactory.Create;
begin
  _registeredTargets := TDictionary<TClass, TClass>.Create();
end;

class function TBindingTargetFactory.createTarget(
  aControl: TControl): TBindingTarget;
begin

  if (self.getInstance.RegisteredTargets.ContainsKey(aControl.ClassType)) then
  begin
      result := self.getInstance.RegisteredTargets.Items[aControl.ClassType].Create() as TBindingTarget;
      result.Target := aControl;
  end
  else raise Exception.Create('Keine Target-Klasse für übergebenes Control gefunden');

end;

class function TBindingTargetFactory.createFieldTarget(aObject: TObject;
  aBindingPath: string): TBindingTarget;
var fieldName, path: string;
    temp: TObject;
begin

  if (TStringUtil.Contains('.', aBindingPath)) then
  begin

    TStringUtil.stringParts(aBindingPath, '.', fieldName, path);

    temp := TReflectionManager.getFieldValue(aObject, fieldName).AsObject;
    if (temp <> nil) then
    begin
      aObject := temp;
      aBindingPath := path;
    end;

    // TODO: Was machen wenn temp = nil?!

  end;

  result := TBindingTargetField.Create;
  result.Target := aObject;
  result.BindingPath := aBindingPath;
end;

class function TBindingTargetFactory.createTarget(aObject: TObject;
  aBindingPath: string): TBindingTarget;
var propertyName, path: string;
    temp: TObject;
begin


  if (aObject <> nil) and (TStringUtil.Contains('.', aBindingPath)) then
  begin

    TStringUtil.stringParts(aBindingPath, '.', propertyName, path);

    if (not TReflectionManager.hasProperty(aObject, propertyName)) then
    begin
      result := TBindingTargetFactory.createFieldTarget(aObject, aBindingPath);
      exit;
    end;

    temp := TReflectionManager.getPropertyValue(aObject, propertyName).AsObject;
    if (temp <> nil) then
    begin
      aObject := temp;
      aBindingPath := path;
    end
    else begin
      raise Exception.Create('not implemented yet');
    end;

    result := createTarget(aObject, aBindingPath);  // Rekursion

  end
  else begin

    result := TBindingTargetProperty.Create;
    result.Target := aObject;
    result.BindingPath := aBindingPath;

  end;


  // Das ist an dieser Stelle unter Umständen falsch. Es wird geprüft, ob
  // es diese Property überhaupt gibt und wenn nicht, wird ein Field-Binding
  // angelegt. Es wird aktuell aber nicht geprüft, ob es überhaupt ein passendes
  // field gibt.
  if (not TReflectionManager.hasProperty(aObject, aBindingPath)) then
  begin
    result := TBindingTargetFactory.createFieldTarget(aObject, aBindingPath);
    exit;
  end;



end;

destructor TBindingTargetFactory.Destroy;
begin
  _registeredTargets.Free;
  inherited;
end;

class function TBindingTargetFactory.getInstance: TBindingTargetFactory;
begin

  if (_targetFactoryInstance = nil) then
    _targetFactoryInstance := TBindingTargetFactory.Create;

  result := _targetFactoryInstance;

end;

class procedure TBindingTargetFactory.registerTargetClass(aControl,
  aTarget: TClass);
begin

  self.getInstance.RegisteredTargets.Add(aControl, aTarget);

end;


{ TBindingTarget }

function TBindingTarget.getIdentifier: string;
begin

  // Target kann nil sein. Z.B. wenn eine BindingGroup keinen Context hat

  if (_target = nil) then
    result := 'nil'
  else
    result := intToStr(_target.GetHashCode) + '_' + UpperCase(_bindingPath);
end;


{ TBindingDictionary }


procedure TBindingDictionary.addBinding(aIdentifier: string;
  aBinding: TBinding);
begin

  // Bindings gegen nil werden natürlich nicht aufgenommen
  if (aBinding.isNilBinding) then exit;


  // Ggf. eine Liste anlegen
  if (not containsKey(aIdentifier)) then
  begin
    add(aIdentifier, TList<TBinding>.Create);
  end;

  Items[aIdentifier].Add(aBinding);

end;

class function TBindingDictionary.getInstance: TBindingDictionary;
begin

  // Eigener Comparer, sonst wird die GLeichheit nicht erkannt

  if (_dictionaryInstance = nil) then
    _dictionaryInstance := TBindingDictionary.Create();

  result := _dictionaryInstance;
end;

procedure TBindingDictionary.objectChanged(aObject: TObject);
var
  binding: TBinding;
  curKey: string;
begin


  for curKey in self.Keys do
  begin

    if (TStringUtil.startsWith(intToStr(aObject.GetHashCode) + '_',  curKey)) then
    begin

      for binding in Items[curKey] do
      begin
        binding.contentChanged(aObject);
      end;

    end;

  end;


end;

procedure TBindingDictionary.propertyChanged(aObject: TObject;
  aProperty: string);
var
  identifier: string;
  binding: TBinding;
begin

  identifier := intToStr(aObject.GetHashCode) + '_' + UpperCase(aProperty);

  if (self.Count > 0) and (self.ContainsKey(identifier)) then
  begin

    for binding in Items[identifier] do
    begin
      try
        binding.contentChanged(aObject);
      except
        on E:Exception do
          // TOOD: Logging;
      end;
    end;

  end;

end;

procedure TBindingDictionary.removeBinding(aIdentifier: string;
  aBinding: TBinding);
begin

  // Wenn gegen nil gebunden wurde gibt es auch nichts zu entfernen
  if (aBinding.isNilBinding) then exit;


  if (containsKey(aIdentifier)) then
  begin
    Items[aIdentifier].Remove(aBinding);
    if (Items[aIdentifier].Count = 0) then
    begin
      Items[aIdentifier].Free;
      Remove(aIdentifier);
    end;
  end;
end;

end.
