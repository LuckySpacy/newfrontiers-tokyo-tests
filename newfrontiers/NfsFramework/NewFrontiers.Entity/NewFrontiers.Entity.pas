unit NewFrontiers.Entity;

interface

  uses
    NewFrontiers.GUI.PropertyChanged, Data.DB, System.Rtti, NewFrontiers.Entity.Mapping, NewFrontiers.Database,
    System.Classes, Generics.Collections;


  type


    ///	<summary>
    ///	  Mapping-Attribut. Legt die Tabelle fest, in der das Entity
    ///	  gespeichert wird
    ///	</summary>
    Table = class(TCustomAttribute)

      protected
        _tablename: string;
        _prefix: string;
        _generator: string;

      public
        constructor Create(aTablename, aPrefix, aGenerator: string);

        property Tablename: string read _tablename;
        property Prefix: string read _prefix;
        property Generator: string read _generator;

    end;


    ///	<summary>
    ///	  Mapping-Attribut. Legt fest, welche Eigenschaften eins Enttiy in der
    ///	  Datenbank gespeichert werden
    ///	</summary>
    Column = class(TCustomAttribute)

      protected
        _fieldname: string;

      public
        constructor Create(aFieldname: string = '');

        property Fieldname: string read _fieldname;

    end;



    ///	<summary>
    ///	  Mapping-Attribute. Legt das Feld für den Primärschlüssel fest.
    ///	</summary>
    Primary = class(TCustomAttribute)

    end;


    ///	<summary>
    ///	  Basisklasse für Entitys. Vereinfacht den Umgang mit dem Mapper. Ziel
    ///	  ist es auch PODOs verwenden zu können.
    ///	</summary>
    TEntity = class(TPropertyChangedObject)

      protected
        _id: integer;

        _dirty: boolean;
        _new: boolean;
        _deleted: boolean;

        function updateV(var aAlterWert: string; aNeuerWert: string; aPropertyName: string): boolean; overload;
        function updateV(var aAlterWert: integer; aNeuerWert: integer; aPropertyName: string): boolean; overload;
        function updateV(var aAlterWert: real; aNeuerWert: real; aPropertyName: string): boolean; overload;
        function updateV(var aAlterWert: boolean; aNeuerWert: boolean; aPropertyName: string): boolean; overload;
        function updateV(var aAlterWert: TDateTime; aNeuerWert: TDateTime; aPropertyName: string): boolean; overload;

      public
        [Primary]
        property Id: integer read _id write _id;

        ///	<summary>
        ///	  Gibt zurück, ob es Änderungen an diesem Objekt gab
        ///	</summary>
        property IsDirty: boolean read _dirty write _dirty;

        ///	<summary>
        ///	  Gibt zurück, ob es sich um einen neuen Datensatz handelt
        ///	</summary>
        property IsNew: boolean read _new write _new;

        ///	<summary>
        ///	  Gibt zurück, ob dieser Datensatz gelöscht wurde
        ///	</summary>
        property IsDeleted: boolean read _deleted write _deleted;


        procedure save();

        procedure delete();

    end;



    TEntityList<T: class> = class(TObjectList<T>);

    ///	<summary>
    ///	  Repository-Klasse, die statische Methoden für die CRUD Operationen
    ///	  von Entities zur Verfügung stellt.
    ///	</summary>
    TEntityRepository = class

      public
        ///	<summary>
        ///	  Lädt einen Datensatz des Typs T mit der übergebenen ID
        ///	</summary>
        class function load<T: class, constructor>(aId: integer): T; overload;

        ///	<summary>
        ///	  Lädt einen Datensatz des Typs T auf Basis des aktuellen
        ///	  Datensatzes in der übergebenen Query
        ///	</summary>
        class function load<T: class, constructor>(aQuery: TDataset): T; overload;

        ///	<summary>
        ///	  Lädt einen Datensatz des Typs T auf Basis des ersten Eintrags der
        ///	  Query, die vom übergebenen QueryBuilder definiert wird
        ///	</summary>
        class function load<T: class, constructor>(aQueryBuilder: TQueryBuilder; aTransaction: TNfsTransaction = nil): T; overload;


        ///	<summary>
        ///	  Lädt alle Datensätze der Entity (ohne Sortierung!)
        ///	</summary>
        class function loadAll<T: class, constructor>(aTransaction: TNfsTransaction = nil): TList<T>; overload;

        ///	<summary>
        ///	  Lädt alle Datensätze der Entity auf Basis des übergebenen
        ///	  QueryBuilders
        ///	</summary>
        class function loadList<T: class, constructor>(aQueryBuilder: TQueryBuilder; aTransaction: TNfsTransaction = nil): TList<T>; overload;

        ///	<summary>
        ///	  Lädt alle Datensätze der Entity auf Basis der übergebenen Query
        ///	</summary>
        class function loadList<T: class, constructor>(aQuery: TDataset): TList<T>; overload;

        ///	<summary>
        ///	  Speichert das übergebene Entity in der Datenbank ab
        ///	</summary>
        class procedure save(aEntity: TEntity; aTransaction: TNfsTransaction = nil);

        ///	<summary>
        ///	  Erzeugt ein neues Entity des Typs T
        ///	</summary>
        class function new<T: class, constructor>(): T;

        ///	<summary>
        ///	  Löscht einen Datensatz ind er Datenbank
        ///	</summary>
        class procedure delete(aEntity: TEntity; aTransaction: TNfsTransaction = nil);

        class function  getValueFromDBField(aQuery: TDataset; aField: TEntityField): TValue;

    end;


    type
      ///	<summary>
      ///	  Shortcut-Klasse, damit maan weniger tippen muss
      ///	</summary>
      TNfs = TEntityRepository;

implementation

  uses System.SysUtils, NewFrontiers.Reflection, System.TypInfo, NewFrontiers.Database.Utility;


{ TEntityRepository }

class function TEntityRepository.load<T>(aId: integer): T;
var queryBuilder: TQueryBuilder;
    mapping: TEntityMapping;
begin

  mapping := TEntityMappingDictionary.getMappingFor(T);

  queryBuilder := TQueryBuilder
    .select
    .from(mapping.Tablename)
    .where(mapping.Primary + ' = :id')
    .param('id', aId);

  result := TEntityRepository.load<T>(queryBuilder);

  queryBuilder.free;

end;

class procedure TEntityRepository.delete(aEntity: TEntity;
  aTransaction: TNfsTransaction);
var queryBuilder: TQueryBuilder;
    mapping: TEntityMapping;
    query: TNfsQuery;
    wasOpen: boolean;
begin

  if (aTransaction = nil) then
    aTransaction := TDatabaseProvider.getDefaultTransaction;

  wasOpen := aTransaction.InTransaction;
  if not WasOpen then aTransaction.StartTransaction;

  mapping := TEntityMappingDictionary.getMappingFor(aEntity.ClassType);

  queryBuilder := TQueryBuilder
    .delete
    .from(mapping.Tablename)
    .where(mapping.Primary + ' = :id')
    .param('id', aEntity.Id);

  query := queryBuilder.getQuery(nil, aTransaction);
  query.Execute;
  query.Free;

  queryBuilder.Free;

  if not wasOpen then aTransaction.Commit;

  aEntity.IsDeleted := true;

end;

class function TEntityRepository.getValueFromDBField(aQuery: TDataset; aField: TEntityField): TValue;
begin

  if (aField is TEntityFieldInteger) then
    result := TValue.From<integer>(aQuery.FieldByName(aField.FieldName).AsInteger)
  else if (aField is TEntityFieldFloat) then
    result := TValue.From<Double>(aQuery.FieldByName(aField.FieldName).AsFloat)
  else if (aField is TEntityFieldString) then
    result := TValue.From<string>(aQuery.FieldByName(aField.FieldName).AsString);

end;

class function TEntityRepository.load<T>(aQuery: TDataset): T;
var
  mapping: TEntityMapping;
  aktField: TEntityField;
  value: TValue;
begin

  if (not aQuery.Active) then
    raise Exception.Create('Übergebene Query ist nicht geöffnet');

  if (aQuery.IsEmpty) then
    raise Exception.Create('Übergebene Query ist leer');

  mapping := TEntityMappingDictionary.getMappingFor(T);
  result := T.Create;

  TEntity(result).Id := aQuery.FieldByName(mapping.Primary).AsInteger;

  for aktField in mapping.Fields do
  begin
    value := getValueFromDBField(aQuery, aktField);
    TReflectionManager.setPropertyValue(result, aktField.RttiProperty.Name, value);
  end;


end;



class function TEntityRepository.load<T>(aQueryBuilder: TQueryBuilder; aTransaction: TNfsTransaction = nil): T;
var wasOpen: boolean;
    query: TNfsQuery;
begin

  if (aTransaction = nil) then
    aTransaction := TDatabaseProvider.getDefaultTransaction;

  wasOpen := aTransaction.InTransaction;
  if not wasOpen then aTransaction.StartTransaction;

  query := aQueryBuilder.getQuery(nil, aTransaction);
  query.Open;
  result := TEntityRepository.load<T>(query);
  query.Close;
  query.Free;

  if not wasOpen then aTransaction.Commit;

end;

class function TEntityRepository.loadAll<T>(
  aTransaction: TNfsTransaction): TList<T>;
var
  mapping : TEntityMapping;
  queryBuilder: TQueryBuilder;
begin


  mapping := TEntityMappingDictionary.getMappingFor(T);
  queryBuilder := TQueryBuilder.select.from(mapping.Tablename);

  result := TEntityRepository.loadList<T>(queryBuilder, aTransaction);

  queryBuilder.free;

end;

class function TEntityRepository.loadList<T>(aQueryBuilder: TQueryBuilder;
  aTransaction: TNfsTransaction): TList<T>;
var
  query: TNfsQuery;
begin

  query := aQueryBuilder.getQuery(nil, aTransaction);
  result := TEntityRepository.loadList<T>(query);


end;

class function TEntityRepository.loadList<T>(aQuery: TDataset): TList<T>;
var
  wasOpen: boolean;
begin

  wasOpen := aQuery.Active;

  // TODO: Passt das mit der Transaction?

  if (not wasOpen) then
  begin
    aQuery.Open;
  end;

  result := TList<T>.Create;

  while (not aQuery.Eof) do
  begin
    result.Add(TEntityRepository.load<T>(aQuery));
    aQuery.Next;
  end;

  if (not wasOpen) then
  begin
    aQuery.Close;
  end;


end;

class function TEntityRepository.new<T>: T;
var mapping: TEntityMapping;
begin

  result := T.Create;

  mapping := TEntityMappingDictionary.getMappingFor(T);

  TEntity(result).Id := TDatabaseUtility.getGeneratorValue(mapping.Generator, TDatabaseProvider.getDefaultTransaction);
  TEntity(result).IsNew := true;

end;

class procedure TEntityRepository.save(aEntity: TEntity; aTransaction: TNfsTransaction = nil);
var queryBuilder: TQueryBuilder;
    mapping: TEntityMapping;
    aktFeld: TEntityField;
    query: TNfsQuery;
    wasOpen: boolean;
begin


  if (not aEntity.IsDirty) and (not aEntity.IsNew) then exit;
  

  if (aTransaction = nil) then
    aTransaction := TDatabaseProvider.getDefaultTransaction;

  wasOpen := aTransaction.InTransaction;
  if not WasOpen then aTransaction.StartTransaction;

  mapping := TEntityMappingDictionary.getMappingFor(aEntity.ClassType);

  if (aEntity.IsNew) then
    queryBuilder := TQueryBuilder.insert.field(mapping.Primary, aEntity.Id)
  else
    queryBuilder := TQueryBuilder.update.where(mapping.Primary + ' = :id').param('id', aEntity.Id);

  queryBuilder
    .table(mapping.Tablename);

  for aktFeld in mapping.Fields do
  begin
    queryBuilder.field(aktFeld.Fieldname, aktFeld.RttiProperty.GetValue(aEntity)); // TODO: Geht nicht für Felder
  end;

  query := queryBuilder.getQuery(nil, aTransaction);


  query.Execute;
  query.Free;

  queryBuilder.Free;

  if not wasOpen then aTransaction.Commit;

  aEntity.IsDirty := false;
  aEntity.IsNew := false;

end;

{ Table }

constructor Table.Create(aTablename, aPrefix, aGenerator: string);
begin
  _tablename := aTablename;
  _prefix := aPrefix;
  _generator := aGenerator;
end;

{ Column }

constructor Column.Create(aFieldname: string);
begin
  _fieldname := aFieldname;
end;

{ TEntity }

function TEntity.updateV(var aAlterWert: string; aNeuerWert,
  aPropertyName: string): boolean;
begin
  result := false;
  if (aAlterWert <> aNeuerWert) then
  begin
    aAlterWert := aNeuerWert;
    _dirty := true;
    PropertyChanged(aPropertyName);
    result := true;
  end;

end;

function TEntity.updateV(var aAlterWert: real; aNeuerWert: real;
  aPropertyName: string): boolean;
begin
  result := false;
  if (aAlterWert <> aNeuerWert) then
  begin
    aAlterWert := aNeuerWert;
    _dirty := true;
    PropertyChanged(aPropertyName);
    result := true;
  end;

end;

function TEntity.updateV(var aAlterWert: integer; aNeuerWert: integer;
  aPropertyName: string): boolean;
begin
  result := false;
  if (aAlterWert <> aNeuerWert) then
  begin
    aAlterWert := aNeuerWert;
    _dirty := true;
    PropertyChanged(aPropertyName);
    result := true;
  end;
end;


procedure TEntity.delete;
begin
  TNfs.delete(self);
end;

procedure TEntity.save;
begin
  TNfs.save(self);
end;

function TEntity.updateV(var aAlterWert: TDateTime; aNeuerWert: TDateTime;
  aPropertyName: string): boolean;
begin
  result := false;
  if (aAlterWert <> aNeuerWert) then
  begin
    aAlterWert := aNeuerWert;
    _dirty := true;
    PropertyChanged(aPropertyName);
    result := true;
  end;

end;

function TEntity.updateV(var aAlterWert: boolean; aNeuerWert: boolean;
  aPropertyName: string): boolean;
begin
  result := false;
  if (aAlterWert <> aNeuerWert) then
  begin
    aAlterWert := aNeuerWert;
    _dirty := true;
    PropertyChanged(aPropertyName);
    result := true;
  end;

end;


end.
