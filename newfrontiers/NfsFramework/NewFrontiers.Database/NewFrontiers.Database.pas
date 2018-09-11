unit NewFrontiers.Database;

interface

  uses
    System.Rtti, Generics.Collections, System.Classes, IBC, Data.DB;

  type

    ///	<summary>
    ///	  Die Klasse NfsDatabase kapselt die verwendete Datenbank.
    ///	</summary>
    TNfsDatabase = class(TIBCConnection)

    end;

     ///	<summary>
     ///	  Die Klasse NfsTransaction kapselt die zu verwendende
     ///	  Transaction-Klasse (IBX oder IbDAC) und erweitert diese ggf. um neue
     ///	  Methoden
     ///	</summary>
     TNfsTransaction = class(TIBCTransaction)

     public
       function InTransaction: boolean;

     end;

     ///	<summary>
     ///	  Die Klasse NfsQuery kapselt die zu verwendende Query-Klasse
     ///	</summary>
     TNfsQuery = class(TIBCQuery)

        protected
          _wasOpen: boolean;


        public
          ///	<summary>
          ///	  Führt die Query aus und gibt das erste Feld der ersten Zeile
          ///	  als Integer zurück
          ///	</summary>
          function skalarAsInteger: integer;

          ///	<summary>
          ///	  Führt die Query aus und commitet die Transaction sofort.
          ///	</summary>
          procedure ExecuteAndCommit;

     end;


     ///	<summary>
     ///	  Mit dem DatabaseProvider kann man die aktuelle Datenbankverbindung
     ///	  oder die Default-Transaction abrufen. Ersetzt damit das in vielen
     ///	  Anwendungen gebräuchliche DataModule
     ///	</summary>
     TDatabaseProvider = class

        protected
          _database: TNfsDatabase;
          _defaultTransaction: TNfsTransaction;

        public
          constructor Create(aServer, aDatabase, aUser, aPass: string); overload;
          constructor Create(aDatabase: TNfsDatabase); overload;

          class function getInstance: TDatabaseProvider;

          ///	<summary>
          ///	  Gibt die Default-Transaction zurück
          ///	</summary>
          class function getDefaultTransaction: TNfsTransaction;

          ///	<summary>
          ///	  Erzeugt eine Query mit der Default-Transaction und gibt diese
          ///	  zurück
          ///	</summary>
          class function getQuery(aOwner: TComponent = nil): TNFsQuery;


     end;


     ///	<summary>
     ///	  Hilfsklasse für den QueryBuilder um Joins korrekt abbilden zu können
     ///	</summary>
     TJoinedTable = class

      private
        _tableName: string;
        _onCriteria: string;
        _prefix: string;

      public
        property TableName: string read _tableName write _tableName;
        property OnCriteria: string read _onCriteria write _onCriteria;
        property Prefix: string read _prefix write _prefix;

        function getSqlStatement: string;

    end;


    ///	<summary>
    ///	  Der Query-Builder stellt ein Fluent-Interface für das Schreiben von
    ///	  Queries zur Verfügung
    ///	</summary>
    TQueryBuilder = class

      protected
        _fields: TDictionary<string, TValue>;
        _parameter: TDictionary<string, TValue>;
        _table: string;
        _whereClauses: TStrings;
        _orderByClauses: TStrings;
        _joins: TObjectlist<TJoinedTable>;

        procedure setParameter(aQuery: TNfsQuery; aParameter: string; aValue: TValue);
        function getFieldsKeyString: string;

      public
        constructor Create;
        destructor Destroy; override;


        ///	<summary>
        ///	  Erzeugt einen Select-Query-Builder
        ///	</summary>
        class function select: TQueryBuilder;

        ///	<summary>
        ///	  Erzeugt einen Insert-Query-Builder
        ///	</summary>
        class function insert: TQueryBuilder;

        ///	<summary>
        ///	  Erzeugt einen Update-Query-Builder
        ///	</summary>
        class function update: TQueryBuilder;

        ///	<summary>
        ///	  Erzeugt einen Delete-Query-Builder
        ///	</summary>
        class function delete: TQueryBuilder;


        function field(aField: string): TQueryBuilder; overload;
        function field(aField: string; aValue: TValue): TQueryBuilder; overload;
        function field(aField: string; aValue: string): TQueryBuilder; overload;
        function field(aField: string; aValue: integer): TQueryBuilder; overload;
        function field(aField: string; aValue: boolean): TQueryBuilder; overload;
        function fieldDT(aField: string; aValue: TDateTime): TQueryBuilder; overload;
        function field(aField: string; aValue: real): TQueryBuilder; overload;

        function from(aTable: string): TQueryBuilder;
        function table(aTable: string): TQueryBuilder;
        function where(aWhereClause: string): TQueryBuilder;
        function orderBy(aOrderbyClause: string): TQueryBuilder;

        function join(aTable, aOnCriteria: string): TQueryBuilder;
        function leftJoin(aTable, aOnCriteria: string): TQueryBuilder;
        function rightJoin(aTable, aOnCriteria: string): TQueryBuilder;

        function param(aName: string; aValue: TValue): TQueryBuilder; overload;
        function param(aName, aValue: string): TQueryBuilder; overload;
        function param(aName: string; aValue: integer): TQueryBuilder; overload;
        function param(aName: string; aValue: real): TQueryBuilder; overload;
        function param(aName: string; aValue: boolean): TQueryBuilder; overload;

        ///	<summary>
        ///	  Befüllt die übergebene Query mit dem Statement und den
        ///	  Parametern, die über den Builder festgelegt wurden.
        ///	</summary>
        procedure fillQuery(aQuery: TNfsQuery);

        ///	<summary>
        ///	  Erzeugt eine neue Query und konfiguriert diese entsprechende den
        ///	  Einstellungen des Builders
        ///	</summary>
        function getQuery(aOwner: TComponent; aTransaction: TNfsTransaction): TNfsQuery;

        ///	<summary>
        ///	  Erzeugt das auszuführende SQL Statement und gibt dieses zurück
        ///	</summary>
        function generateStatment: string; virtual; abstract;

    end;


    TQueryBuilderSelect = class(TQueryBuilder)

      public
       function generateStatment: string; override;

    end;

    TQueryBuilderInsert = class(TQueryBuilder)

      public
       function generateStatment: string; override;

    end;

    TQueryBuilderUpdate = class(TQueryBuilder)

      public
       function generateStatment: string; override;

    end;

    TQueryBuilderDelete = class(TQueryBuilder)

      public
       function generateStatment: string; override;

    end;

implementation
  uses System.SysUtils, NewFrontiers.Utility.StringUtil;

  var _databaseProviderInstance: TDatabaseProvider;

{ TQueryBuilder }

constructor TQueryBuilder.Create;
begin
  _fields := TDictionary<string, TValue>.Create;
  _parameter := TDictionary<string, TValue>.Create;
  _joins := TObjectlist<TJoinedTable>.Create(true);
  _whereClauses := TStringlist.Create;
  _orderByClauses := TStringlist.Create;
end;

class function TQueryBuilder.delete: TQueryBuilder;
begin
  result := TQueryBuilderDelete.Create;
end;

function TQueryBuilder.field(aField: string; aValue: TValue): TQueryBuilder;
//var temp: TFieldValue;
begin

//  temp := TFieldValue.Create;
//  temp.Value := aValue;

  _fields.Add(aField, aValue);
  result := self;
end;

function TQueryBuilder.field(aField: string): TQueryBuilder;
begin
  result := field(aField, TValue.Empty);
end;

function TQueryBuilder.field(aField, aValue: string): TQueryBuilder;
begin
  result := field(aField, TValue.From<string>(aValue));
end;

destructor TQueryBuilder.Destroy;
begin
  _fields.Free;
  _parameter.Free;
  _joins.free;
  _whereClauses.Free;
  _orderByClauses.Free;
  inherited;
end;

function TQueryBuilder.field(aField: string; aValue: real): TQueryBuilder;
begin
  result := field(aField, TValue.From<real>(aValue));
end;

function TQueryBuilder.field(aField: string; aValue: boolean): TQueryBuilder;
begin
  result := field(aField, TValue.From<boolean>(aValue));
end;

function TQueryBuilder.field(aField: string; aValue: integer): TQueryBuilder;
begin
  result := field(aField, TValue.From<integer>(aValue));
end;

function TQueryBuilder.fieldDT(aField: string;
  aValue: TDateTime): TQueryBuilder;
begin
  result := field(aField, TValue.From<TDateTime>(aValue));
end;

procedure TQueryBuilder.fillQuery(aQuery: TNfsQuery);
var key: string;
begin

  aQuery.SQL.text := generateStatment;

  for key in _parameter.Keys do
  begin
    setParameter(aQuery, key, _parameter[key]);
  end;

  for key in _fields.Keys do
  begin
    setParameter(aQuery, key, _fields[key]);
  end;

end;

function TQueryBuilder.from(aTable: string): TQueryBuilder;
begin
  _table := aTable;
  result := self;
end;

function TQueryBuilder.getFieldsKeyString: string;
var temp: TStrings;
    key: string;
begin

  temp := TStringlist.Create;
  for key in _fields.Keys do
  begin
    temp.Add(key);
  end;

  result := TStringUtil.Implode(', ', temp);

  temp.Free;

end;

function TQueryBuilder.getQuery(aOwner: TComponent;
  aTransaction: TNfsTransaction): TNfsQuery;
begin
  result := TNfsQuery.Create(aOwner);
  result.transaction := aTransaction;

  fillQuery(result);
end;

class function TQueryBuilder.insert: TQueryBuilder;
begin
  result := TQueryBuilderInsert.Create;
end;

function TQueryBuilder.join(aTable, aOnCriteria: string): TQueryBuilder;
var temp: TJoinedTable;
begin

  temp := TJoinedTable.Create;
  temp.TableName := aTable;
  temp.OnCriteria := aOnCriteria;
  temp.Prefix := '';

  _joins.add(temp);

  result := self;
end;

function TQueryBuilder.leftJoin(aTable, aOnCriteria: string): TQueryBuilder;
var temp: TJoinedTable;
begin

  temp := TJoinedTable.Create;
  temp.TableName := aTable;
  temp.OnCriteria := aOnCriteria;
  temp.Prefix := 'left outer ';

  _joins.add(temp);

  result := self;
end;

function TQueryBuilder.orderBy(aOrderbyClause: string): TQueryBuilder;
begin
  _orderByClauses.Add(aOrderbyClause);
  result := self;
end;

function TQueryBuilder.param(aName, aValue: string): TQueryBuilder;
begin
  result := param(aName, TValue.From<string>(aValue));
end;

function TQueryBuilder.param(aName: string; aValue: TValue): TQueryBuilder;
//var temp: TFieldValue;
begin

//  temp := TFieldValue.Create;
//  temp.Value := aValue;

  _parameter.Add(aName, aValue);
  result := self;
end;

function TQueryBuilder.param(aName: string; aValue: integer): TQueryBuilder;
begin
  result := param(aName, TValue.From<integer>(aValue));
end;

function TQueryBuilder.param(aName: string; aValue: boolean): TQueryBuilder;
begin
  result := param(aName, TValue.From<boolean>(aValue));
end;

function TQueryBuilder.param(aName: string; aValue: real): TQueryBuilder;
begin
  result := param(aName, TValue.From<real>(aValue));
end;

function TQueryBuilder.rightJoin(aTable, aOnCriteria: string): TQueryBuilder;
var temp: TJoinedTable;
begin

  temp := TJoinedTable.Create;
  temp.TableName := aTable;
  temp.OnCriteria := aOnCriteria;
  temp.Prefix := 'right outer ';

  _joins.add(temp);

  result := self;
end;

class function TQueryBuilder.select: TQueryBuilder;
begin
  result := TQueryBuilderSelect.Create;
end;

procedure TQueryBuilder.setParameter(aQuery: TNfsQuery; aParameter: string;
  aValue: TValue);
begin

  if (aValue.IsEmpty) then exit;
  

  if (aValue.IsOrdinal) then aQuery.ParamByName(aParameter).AsInteger := aValue.AsInteger
  else if (aValue.IsType<string>) then aQuery.ParamByName(aParameter).asString := aValue.asString
  else if (aValue.IsType<TDateTime>) then aQuery.ParamByName(aParameter).AsDateTime := aValue.AsExtended
  else if (aValue.IsType<real>) then aQuery.ParamByName(aParameter).AsDateTime := aValue.AsExtended
  else if (aValue.IsType<boolean>) then
  begin
    if aValue.AsBoolean then aQuery.ParamByName(aParameter).AsString := 'T'
    else aQuery.ParamByName(aParameter).AsString := 'F';
  end;


end;

function TQueryBuilder.table(aTable: string): TQueryBuilder;
begin
  _table := aTable;
  result := self;
end;

class function TQueryBuilder.update: TQueryBuilder;
begin
  result := TQueryBuilderUpdate.Create;
end;

function TQueryBuilder.where(aWhereClause: string): TQueryBuilder;
begin
  _whereClauses.Add(aWhereClause);
  result := self;
end;

{ TNfsTransaction }

function TNfsTransaction.InTransaction: boolean;
begin
  result := Active;
end;

{ TNfsQuery }

procedure TNfsQuery.ExecuteAndCommit;
begin
  _wasOpen := Transaction.Active;
  if (not _wasOpen) then Transaction.StartTransaction;

  ExecSQL;

  if (not _wasOpen) then Transaction.Commit;
end;

function TNfsQuery.skalarAsInteger: integer;
begin
  _wasOpen := Transaction.Active;
  if (not _wasOpen) then Transaction.StartTransaction;

  Open;
  if (isEmpty) then result := 0
  else result := Fields[0].AsInteger;
  Close;

  if (not _wasOpen) then Transaction.Commit;
end;

{ TQueryBuilderSelect }

function TQueryBuilderSelect.generateStatment: string;
var joinString: string;
  i: Integer;
begin

  if (_table = '') then
    raise Exception.Create('Keine Tabelle angegeben');

  if _fields.Count = 0 then
    _fields.add('*', TValue.Empty);

  joinString := '';
  for i := 0 to _joins.Count - 1 do
    joinString := joinString + TJoinedTable(_joins[i]).getSqlStatement;

  result := Format('select %s from %s', [getFieldsKeyString, _table + joinString]);

  if _whereClauses.Count > 0 then
    result := result + ' where ' + TStringUtil.Implode(' and ', _whereClauses);

  if _orderByClauses.Count > 0 then
    result := result + ' order by ' + TStringUtil.Implode(', ', _orderByClauses);
end;

{ TQueryBuilderInsert }

function TQueryBuilderInsert.generateStatment: string;
var
  key: string;
  tempNames: TStringlist;
begin

  if (_table = '') then
    raise Exception.Create('Keine Tabelle angegeben');

  if _fields.Count = 0 then
    raise Exception.Create('Keine Felder angegeben');

  tempNames := TStringlist.Create;
  for key in _fields.Keys do
    tempNames.Add(':' + key);

  result := Format('insert into %s (%s) values (%s)', [_table, getFieldsKeyString, TStringUtil.Implode(', ', tempNames)]);

end;

{ TQueryBuilderUpdate }

function TQueryBuilderUpdate.generateStatment: string;
var tempNames: TStrings;
    key: string;
begin

  if (_table = '') then
    raise Exception.Create('Keine Tabelle angegeben');

  if _fields.Count = 0 then
    raise Exception.Create('Keine Felder angegeben');

  tempNames := TStringlist.Create;
  for key in _fields.Keys do
    tempNames.Add(key + ' = :' + key);

  result := Format('update %s set %s', [_table, TStringUtil.Implode(', ', tempNames)]);


  if _whereClauses.Count > 0 then
    result := result + ' where ' + TStringUtil.Implode(' and ', _whereClauses);
end;

{ TQueryBuilderDelete }

function TQueryBuilderDelete.generateStatment: string;
begin
  raise ENotImplemented.Create('');
end;

{ TJoinedTable }

function TJoinedTable.getSqlStatement: string;
begin
  result := ' ' + Prefix + ' join ' + TableName + ' on ' + OnCriteria + ' ';
end;

{ TDatabaseProvider }

constructor TDatabaseProvider.Create(aServer, aDatabase, aUser, aPass: string);
begin
  _database := TNfsDatabase.Create(nil);
  _database.Server := aServer;
  _database.Database := aDatabase;
  _database.Username := aUser;
  _database.Password := aPass;
  _database.Connect;

  _defaultTransaction := TNfsTransaction.Create(_database);
  _defaultTransaction.AddConnection(_database);

  _databaseProviderInstance := self;
end;

constructor TDatabaseProvider.Create(aDatabase: TNfsDatabase);
begin
  _database := aDatabase;

  _defaultTransaction := TNfsTransaction.Create(_database);
  _defaultTransaction.AddConnection(_database);

  _databaseProviderInstance := self;
end;

class function TDatabaseProvider.getDefaultTransaction: TNfsTransaction;
begin
  result := TDatabaseProvider.getInstance._defaultTransaction;
end;

class function TDatabaseProvider.getInstance: TDatabaseProvider;
begin
  if (_databaseProviderInstance = nil) then
    raise Exception.Create('Database Provider wurde noch nicht initialisiert');

  result := _databaseProviderInstance;
end;

class function TDatabaseProvider.getQuery(aOwner: TComponent = nil): TNfsQuery;
begin

  result := TNfsQuery.Create(aOwner);
  result.Transaction := TDatabaseProvider.getDefaultTransaction;

end;

end.
