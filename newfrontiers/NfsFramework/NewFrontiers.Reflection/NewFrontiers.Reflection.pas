unit NewFrontiers.Reflection;

interface

  uses
    System.Rtti, Generics.Collections, System.TypInfo;

  type


    TClassOfAttribute = class of TCustomAttribute;

    ///	<summary>
    ///	  Der Reflection Manager kapselt Zugriffe auf die Rtti und hält den
    ///	  Context über die ganze Laufzeit am Leben.
    ///	</summary>
    TReflectionManager = class

      protected
        _context: TRttiContext;
        _classes: TDictionary<TClass, TRttiInstanceType>;

        constructor Create;

        class function getProperty(aInstance: TObject; aPropertyName: string): TRttiProperty;

      public
        destructor Destroy; override;

        ///	<summary>
        ///	  Der verwendete RttiContext
        ///	</summary>
        property Context: TRttiContext read _context;

        ///	<summary>
        ///	  Ein Dictionary mit den Rtti-Informationen aller Klassen, die
        ///	  bisher abgefragt wurden. Wurde aus Performancegründen eingeführt.
        ///	  Ob das Abrufen der Rtti-Informationen tatsächlich so teuer ist,
        ///	  dass sich ein puffern lohnt wurde noch nicht geprüft.
        ///	</summary>
        property Classes: TDictionary<TClass, TRttiInstanceType> read _classes;

        ///	<summary>
        ///	  Gibt die aktuelle Instanz zurück - Singleton
        ///	</summary>
        class function getInstance: TReflectionManager;

        ///	<summary>
        ///	  Gibt die Rtti-Informationen für die übergebene Klasse zurück.
        ///	</summary>
        class function getInfoForClass(aClass: TClass): TRttiInstanceType;

        ///	<summary>
        ///	  Gibt den Wert einer Property zurück
        ///	</summary>
        class function getPropertyValue(aInstance: TObject; aPropertyName: string): TValue;

        ///	<summary>
        ///	  Setzt den Wert einer Property
        ///	</summary>
        class procedure setPropertyValue(aInstance: TObject; aPropertyName: string; aValue: TValue);

        ///	<summary>
        ///	  Gibt den Typ einer Property zurück.
        ///	</summary>
        class function getPropertyKind(aInstance: TObject; aPropertyName: string): TTypeKind;

        ///	<summary>
        ///	  Gibt den Rtti-Zeiger auf eine Methode innerhalb einer Instanz
        ///	  zurück
        ///	</summary>
        class function getMethod(aInstance: TObject; aMethodName: string): TRttiMethod;

        ///	<summary>
        ///	  Gibt eine Liste aller Properties einer Klasse zurück, die ein
        ///	  bestimmtes Attribut haben
        ///	</summary>
        class function getPropertiesWithAttribute(aClass: TClass; aAttribute: TClassOfAttribute): TList<TRttiProperty>;


        ///	<summary>
        ///	  Gibt eine LIste aller Felder einer Klasse zurück, die ein
        ///	  bestimmtes Attribut haben
        ///	</summary>
        class function getFieldsWithAttribute(aClass: TCLass; aAttribute: TClassOfAttribute): TList<TRttiField>;


        ///	<summary>
        ///	  Gibt den Wert eines Feldes innerhalb einer Klasse zurück. Falls
        ///	  vorhanden wird der entsprechende Getter aufgerufen
        ///	</summary>
        class function getFieldValue(aInstance: TObject; aFieldName: string): TValue;


        ///	<summary>
        ///	  Setzt den Wert eines Feldes innerhalb einer Klasse. Falls
        ///	  vorhanden wird der entsprechende Setter aufgerufen
        ///	</summary>
        class procedure setFieldValue(aInstance: TObject; aFieldName: string; aValue: TValue);


        ///	<summary>
        ///	  Gibt zurück ob die übergebene Instanz eine Property mit dem Namen
        ///	  hat
        ///	</summary>
        class function hasProperty(aInstance: TObject; aPropertyName: string): boolean;

        ///	<summary>
        ///	  Gibt zurück ob die übergebene Instanz ein Feld mit dem Namen hat
        ///	</summary>
        class function hasField(aInstance: TObject; aFieldName: string): Boolean;

    end;

implementation
  uses
    SysUtils, NewFrontiers.Utility.Exceptions, Vcl.Dialogs,
    NewFrontiers.Reflection.ValueConvert, NewFrontiers.Utility.StringUtil;

  var
    _instance: TReflectionManager;

{ TReflectionManager }

constructor TReflectionManager.Create;
begin
  _context := TRttiContext.Create;
  _classes := TObjectDictionary<TClass, TRttiInstanceType>.Create([doOwnsValues]);
end;

destructor TReflectionManager.Destroy;
begin
  _context.Free;
  _classes.Free;

  inherited;
end;

class function TReflectionManager.getFieldsWithAttribute(aClass: TCLass;
  aAttribute: TClassOfAttribute): TList<TRttiField>;
var
  typeInfo: TRttiInstanceType;
  curField: TRttiField;
  curAttribute: TCustomAttribute;
begin

  result := TList<TRttiField>.Create;

  typeInfo := getInstance.Context.getType(aClass) as TRttiInstanceType;

  for curField in typeInfo.GetFields do
  begin
    for curAttribute in curField.GetAttributes do
    begin
      if (curAttribute is aAttribute) then
        Result.add(curField);
    end;
  end;

end;

class function TReflectionManager.getFieldValue(aInstance: TObject;
  aFieldName: string): TValue;
var
  fieldName, path: string;
  tempField: TRttiField;
  getterName: string;
  getter: TRttiMethod;
begin

  // Falls es ein Binding-Path ist, erst aufteilen und dann auswerten
  if (TStringUtil.Contains('.', aFieldName)) then
  begin
    TStringUtil.stringParts(aFieldName, '.', fieldName, path);
    result := TReflectionManager.getFieldValue(aInstance, fieldName);

    if (result.AsObject = nil) then result := TValue.From<string>('')
    else result := TReflectionManager.getFieldValue(result.AsObject, path);
  end

  // Eindeutiges Feld -> Auswerten
  else begin

    // 1. Versuch der Getter
    getterName := 'get' + aFieldName;
    getter := TReflectionManager.getMethod(aInstance, getterName);

    if (getter <> nil) then
    begin

      result := getter.Invoke(aInstance, []);

    end

    else begin
        // 2. Versuch, das Feld direkt

    tempField := TReflectionManager.getInfoForClass(aInstance.ClassType).GetField(aFieldName);

    if (tempField = nil) then
      raise Exception.Create('Feld ' + aFieldName + ' existiert in übergebener Instanz nicht');

    result := tempField.GetValue(aInstance);

    end;

  end;

end;

class function TReflectionManager.getInfoForClass(aClass: TClass): TRttiInstanceType;
var
  typeInfo: TRttiInstanceType;
begin

  if (not getInstance.Classes.ContainsKey(aClass)) then
  begin
    typeInfo := getInstance.Context.getType(aClass) as TRttiInstanceType;
    getInstance.Classes.add(aClass, typeInfo);
  end;

  result := getInstance.Classes[aClass];

end;

class function TReflectionManager.getInstance: TReflectionManager;
begin
  if (_instance = nil) then
    _instance := TReflectionManager.Create;

  result := _instance;
end;

class function TReflectionManager.getMethod(aInstance: TObject;
  aMethodName: string): TRttiMethod;
begin

  result := TReflectionManager.getInfoForClass(aInstance.ClassType).GetMethod(aMethodName);


end;

class function TReflectionManager.getPropertiesWithAttribute(aClass: TClass;
  aAttribute: TClassOfAttribute): TList<TRttiProperty>;
var
  typeInfo: TRttiInstanceType;
  curProperty: TRttiProperty;
  curAttribute: TCustomAttribute;
begin

  result := TList<TRttiProperty>.Create;

  typeInfo := getInstance.Context.getType(aClass) as TRttiInstanceType;

  for curProperty in typeInfo.GetProperties do
  begin
    for curAttribute in curProperty.GetAttributes do
    begin
      if (curAttribute is aAttribute) then
        Result.add(curProperty);
    end;
  end;

end;

class function TReflectionManager.getProperty(aInstance: TObject;
  aPropertyName: string): TRttiProperty;
var
  propertyName, path: string;
begin

  if (TStringUtil.Contains('.', aPropertyName)) then
  begin
    TStringUtil.stringParts(aPropertyName, '.', propertyName, path);
    result := TReflectionManager.getProperty(aInstance, propertyName);
  end

  else begin

    result := getInstance.Classes.Items[aInstance.ClassType].GetProperty(aPropertyName);

  end;


end;

class function TReflectionManager.getPropertyKind(aInstance: TObject;
  aPropertyName: string): TTypeKind;
begin

  result := getProperty(aInstance, aPropertyName).PropertyType.Handle.Kind;

end;

class function TReflectionManager.getPropertyValue(aInstance: TObject;
  aPropertyName: string): TValue;
var
  propertyName, path: string;
  tempProp: TRttiProperty;
begin

  // Falls es ein Binding-Path ist, erst aufteilen und dann auswerten
  if (TStringUtil.Contains('.', aPropertyName)) then
  begin
    TStringUtil.stringParts(aPropertyName, '.', propertyName, path);
    result := TReflectionManager.getPropertyValue(aInstance, propertyName);

    if (result.AsObject = nil) then result := TValue.From<string>('')
    else result := TReflectionManager.getPropertyValue(result.AsObject, path);
  end

  // Eindeutige Property -> Auswerten
  else begin

    if (not getInstance.Classes.ContainsKey(aInstance.ClassType)) then
      TReflectionManager.getInfoForClass(aInstance.ClassType);

    tempProp := getInstance.Classes.Items[aInstance.ClassType].GetProperty(aPropertyName);

    if (tempProp = nil) then
      raise Exception.Create('Property ' + aPropertyName + ' existiert in übergebener Instanz nicht');

    result := tempProp.GetValue(aInstance);
  end;

end;

class function TReflectionManager.hasField(aInstance: TObject;
  aFieldName: string): Boolean;
begin

  raise Exception.Create('not implemented yet');

end;

class function TReflectionManager.hasProperty(aInstance: TObject;
  aPropertyName: string): boolean;
begin
    if (not getInstance.Classes.ContainsKey(aInstance.ClassType)) then
      TReflectionManager.getInfoForClass(aInstance.ClassType);

    result := getInstance.Classes.Items[aInstance.ClassType].GetProperty(aPropertyName) <> nil;
end;

class procedure TReflectionManager.setFieldValue(aInstance: TObject;
  aFieldName: string; aValue: TValue);
var
  fieldName, path: string;
  tempField: TRttiField;
  setterName: string;
  setter: TRttiMethod;
  targetValue: TValue;
begin

  // Falls es ein Binding-Path ist, erst aufteilen und dann auswerten
  if (TStringUtil.Contains('.', aFieldName)) then
  begin
    TStringUtil.stringParts(aFieldName, '.', fieldName, path);
    targetValue := TReflectionManager.getFieldValue(aInstance, fieldName);

    if (targetValue.AsObject <> nil) then
       TReflectionManager.setFieldValue(targetValue.AsObject, path, aValue);
  end

  // Eindeutiges Feld -> Auswerten
  else begin

    // 1. Versuch der Setter
    setterName := 'set' + aFieldName;
    setter := TReflectionManager.getMethod(aInstance, setterName);

    if (setter <> nil) then
    begin

      setter.Invoke(aInstance, [aValue]);

    end

    else begin
        // 2. Versuch, das Feld direkt

    tempField := TReflectionManager.getInfoForClass(aInstance.ClassType).GetField(aFieldName);

    if (tempField = nil) then
      raise Exception.Create('Feld ' + aFieldName + ' existiert in übergebener Instanz nicht');

    tempField.SetValue(aInstance, aValue);

    end;

  end;

end;

class procedure TReflectionManager.setPropertyValue(aInstance: TObject;
  aPropertyName: string; aValue: TValue);
var targetProperty: TRttiProperty;
    targetValue: TValue;
    propertyName, path: string;
begin

  if (not getInstance.Classes.ContainsKey(aInstance.ClassType)) then
    TReflectionManager.getInfoForClass(aInstance.ClassType);

  // Falls es ein Binding-Path ist, erst aufteilen und dann auswerten
  if (TStringUtil.Contains('.', aPropertyName)) then
  begin
    TStringUtil.stringParts(aPropertyName, '.', propertyName, path);

    targetProperty := getInstance.Classes.Items[aInstance.ClassType].GetProperty(propertyName);

    if (targetProperty.getValue(aInstance).AsObject <> nil) then
      TReflectionManager.setPropertyValue(targetProperty.GetValue(aInstance).asObject, path, aValue);

  end
  else begin
    targetProperty := getInstance.Classes.Items[aInstance.ClassType].GetProperty(aPropertyName);
    targetValue := TValueConverter.convertTo(aValue, targetProperty.PropertyType.Handle);
    targetProperty.SetValue(aInstance, targetValue);
  end;





end;

end.

