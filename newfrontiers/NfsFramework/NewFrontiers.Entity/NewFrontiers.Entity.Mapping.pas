unit NewFrontiers.Entity.Mapping;

interface

  uses
    System.Rtti, Generics.Collections, NewFrontiers.Reflection;

  type

    ///	<summary>
    ///	  Enumeration für den Feldtyp. Wird verwendet um typsicher mit den
    ///	  DB-Feldern kommunizieren zu können.
    ///	</summary>
    TFieldType = (
      ftString,

      ftInteger,

      ftFloat,

      ftDateTime,

      ftBoolean
    );

    TEntityMapping = class;


    ///	<summary>
    ///	  Stellt eine Feld einer Entity dar. Enthält alle benötigten
    ///	  Informationen zu einem Feld.
    ///	</summary>
    TEntityField = class
      protected
        _fieldname: string;
        _type: TFieldType;
        _property: TRttiProperty;
        _field: TRttiField;
        _mapping: TEntityMapping;

        function getFieldname: string;
        function getFieldType: TFieldType; virtual; abstract;
        function getDBType: string; virtual; abstract;

      public
        ///	<summary>
        ///	  Feldname in der Datenbank.
        ///	</summary>
        property Fieldname: string read getFieldname write _fieldname;
        property FieldType: TFieldType read getFieldType;
        property RttiProperty: TRttiProperty read _property write _property;
        property RttiField: TRttiField read _field write _field;

        ///	<summary>
        ///	  Gibt den Typ des DB Felds zurück (z.B. für alter table Statements)
        ///	</summary>
        property DBType: string read getDBType;

        ///	<summary>
        ///	  Referenz auf das Mapping. Wird benötigt um den Feldnamen
        ///	  automatisch zu generieren (hierfür wird das Prefix benötigt)
        ///	</summary>
        property Mapping: TEntityMapping read _mapping write _mapping;

        class function from(aProperty: TRttiProperty; aMapping: TEntityMapping): TEntityField; overload;
        class function from(aField: TRttiField): TEntityField; overload;
        class function from(aType: TRttiType): TEntityField; overload;

        function getValue(aInstance: TObject): TValue;
        procedure setValue(aInstance: TObject; const Value: TValue);

    end;

    TEntityFieldString = class(TEntityField)

      protected
        function getFieldType: TFieldType; override;
        function getDBType: string; override;

    end;

    TEntityFieldInteger = class(TEntityField)

      protected
        function getFieldType: TFieldType; override;
        function getDBType: string; override;

    end;

    TEntityFieldFloat = class(TEntityField)

      protected
        function getFieldType: TFieldType; override;
        function getDBType: string; override;

    end;

    TEntityFieldDateTime = class(TEntityField)

      protected
        function getFieldType: TFieldType; override;
        function getDBType: string; override;

    end;

    TEntityFieldBoolean = class(TEntityField)

      protected
        function getFieldType: TFieldType; override;
        function getDBType: string; override;

    end;

    ///	<summary>
    ///	  Bildet das Mapping zwischen einer Klasse und einer DB-Tabelle ab.
    ///	  Wird automatische aus den Attributen der Klasse erzeugt
    ///	</summary>
    TEntityMapping = class

      protected
        _table: string;
        _prefix: string;
        _generator: string;

        _primary: string;

        _fields: TList<TEntityField>;

      public

        constructor Create(aClass: TClass);
        destructor Destroy; override;

        property Tablename: string read _table;
        property Prefix: string read _prefix;
        property Generator: string read _generator;
        property Primary: string read _primary;
        property Fields: TList<TEntityField> read _fields;


    end;

    ///	<summary>
    ///	  Im Mapping-Dictionary werden aus Performancegründen alle
    ///	  Mapping-Definitionen zwischengespeichert. So muss jede Klasse nur
    ///	  einmal analysiert werden.
    ///	</summary>
    TEntityMappingDictionary = class(TObjectDictionary<string, TEntityMapping>)

      public
        class function getInstance: TEntityMappingDictionary;

        ///	<summary>
        ///	  Gibt das Mapping für ein Entity zurück. Wurde noch kein Mapping
        ///	  angelegt, wird dieses innerhalb der Methode getan.
        ///	</summary>
        class function getMappingFor(aClass: TClass): TEntityMapping;

    end;



implementation
  uses NewFrontiers.Entity, SysUtils, System.TypInfo, NewFrontiers.Reflection.Helper;

  var _instance: TEntityMappingDictionary;

{ TEntityMapping }

constructor TEntityMapping.Create(aClass: TClass);
var
  typeInfo: TRttiInstanceType;
  curAttribute: TCustomAttribute;
  properties: TList<TRttiProperty>;
  aktProperty: TRttiProperty;
begin

  typeInfo := TReflectionManager.getInstance.getInfoForClass(aClass);

  for curAttribute in typeInfo.GetAttributes do
  begin

    if (curAttribute is Table) then
    begin
      _table := Table(curAttribute).Tablename;
      _prefix := Table(curAttribute).Prefix;
      _generator := Table(curAttribute).Generator;
      _primary := _prefix + '_id';
    end;

  end;

  _fields := TList<TEntityField>.Create;
  properties := TReflectionManager.getInstance.getPropertiesWithAttribute(aClass, Column);

  for aktProperty in properties do
  begin
    _fields.Add(TEntityField.from(aktProperty, self));
  end;

  properties.Free;

end;

destructor TEntityMapping.Destroy;
begin
  _fields.Free;
  inherited;
end;


{ TEntityMappingDictionary }

class function TEntityMappingDictionary.getInstance: TEntityMappingDictionary;
begin

  if (_instance = nil) then
    _instance := TEntityMappingDictionary.Create([doOwnsValues]);

  result := _instance;

end;

class function TEntityMappingDictionary.getMappingFor(
  aClass: TClass): TEntityMapping;
begin

  if (not getInstance.ContainsKey(aClass.ClassName)) then
  begin
    getInstance.Add(aClass.ClassName, TEntityMapping.Create(aClass));
  end;

  result := getInstance.Items[aClass.ClassName];

end;

{ TEntityField }

class function TEntityField.from(aField: TRttiField): TEntityField;
begin

  result := TEntityField.from(aField.FieldType);
  result.RttiField := aField;

end;

class function TEntityField.from(aProperty: TRttiProperty; aMapping: TEntityMapping): TEntityField;
var
  curAttribute: TCustomAttribute;
begin


  result := TEntityField.from(aProperty.PropertyType);
  result.RttiProperty := aProperty;
  result.Fieldname := aProperty.Name;
  result.Mapping := aMapping;

  for curAttribute in aProperty.GetAttributes do
  begin

    if (curAttribute is Column) and (Column(curAttribute).Fieldname <> '') then
    begin
      result.Fieldname := Column(curAttribute).Fieldname;
    end;

  end;


end;

class function TEntityField.from(aType: TRttiType): TEntityField;
begin


  if (aType.IsDateTime) then
    result := TEntityFieldDateTime.Create
  else if (aType.TypeKind = tkString) or (aType.TypeKind = tkUString) then
    result := TEntityFieldString.Create
  else if (aType.TypeKind = tkFloat) then
    result := TEntityFieldFloat.Create
  else if (aType.TypeKind = tkInteger) then
    result := TEntityFieldInteger.Create
  else
    raise Exception.Create('Unbekannter Typ: ' + aType.ToString + ' / ' + intToStr(ord(aType.TypeKind)));
//  else if (aType.TypeKind = tkBoolean) then
//    result := TEntityFieldBoolean.Create

end;


function TEntityField.getFieldname: string;
begin
  result := _mapping.Prefix + '_' + _fieldname;
end;

function TEntityField.getValue(aInstance: TObject): TValue;
begin

  if (_property <> nil) then _property.GetValue(aInstance)
  else if (_field <> nil) then _field.GetValue(aInstance)
  else raise Exception.Create('Weder Property noch Feld gesetzt');       

end;

procedure TEntityField.setValue(aInstance: TObject; const Value: TValue);
begin

  if (_property <> nil) then _property.setValue(aInstance, Value)
  else if (_field <> nil) then _field.setValue(aInstance, Value)
  else raise Exception.Create('Weder Property noch Feld gesetzt');


end;

{ TEntityFieldString }

function TEntityFieldString.getDBType: string;
begin
  result := 'varchar(255)'; // TODO: Maxlength
end;

function TEntityFieldString.getFieldType: TFieldType;
begin
  result := ftString;
end;

{ TEntityFieldInteger }

function TEntityFieldInteger.getDBType: string;
begin
  result := 'integer';
end;

function TEntityFieldInteger.getFieldType: TFieldType;
begin
  result := ftInteger;
end;

{ TEntityFieldFloat }

function TEntityFieldFloat.getDBType: string;
begin
  result := 'float';
end;

function TEntityFieldFloat.getFieldType: TFieldType;
begin
  result := ftFloat;
end;

{ TEntityFieldDateTime }

function TEntityFieldDateTime.getDBType: string;
begin
  result := 'date';
end;

function TEntityFieldDateTime.getFieldType: TFieldType;
begin
  result := ftDateTime;
end;

{ TEntityFieldBoolean }

function TEntityFieldBoolean.getDBType: string;
begin
  result := 'char(1) default "F"';
end;

function TEntityFieldBoolean.getFieldType: TFieldType;
begin
  result := ftBoolean;
end;

end.
