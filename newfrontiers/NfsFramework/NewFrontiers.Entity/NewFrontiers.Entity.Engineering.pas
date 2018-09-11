unit NewFrontiers.Entity.Engineering;

interface

  uses NewFrontiers.Entity, NewFrontiers.Entity.Mapping;

  type

    ///	<summary>
    ///	  Die Klasse stellt Funktionen bereit, um ein Entity in der Datenbank
    ///	  anzulegen
    ///	</summary>
    TForwardEngineering = class

      public
        ///	<summary>
        ///	  Erzeugt die Tabelle, den Generator und die Felder in der
        ///	  Datenbank sofern diese nicht bereits angelegt sind. Kann beliebig
        ///	  oft aufgerufen werden
        ///	</summary>
        class procedure forwardEngineer<T: class, constructor>();

    end;

implementation
  uses NewFrontiers.Database, System.SysUtils;

{ TForwardEngineering }

class procedure TForwardEngineering.forwardEngineer<T>;
var
  mapping: TEntityMapping;
  sql: string;
  query: TNfsQuery;
  aktFeld: TEntityField;
begin

  // TODO: Queries kann man auch hübscher schreiben.

  mapping := TEntityMappingDictionary.getMappingFor(T);
  query := TDatabaseProvider.getQuery();
  query.Transaction.StartTransaction;

  // Tabelle anlegen
  sql := 'EXECUTE BLOCK AS BEGIN ' +
         'if (not exists(select 1 from rdb$relations where rdb$relation_name = "' + UpperCase(mapping.Tablename) + '")) then ' +
         'execute statement "create table ' + mapping.Tablename + ' ( ' + mapping.Primary + ' integer );"; '  +
         'END';
  query.SQL.Text := sql;
  query.execute();

  // Generator anlegen
  sql := 'EXECUTE BLOCK AS BEGIN ' +
         'if (not exists(select 1 from rdb$generators where rdb$generator_name = "' + UpperCase(mapping.Generator) + '")) then ' +
         'execute statement "create generator ' + mapping.Generator + ';"; '  +
         'END';
  query.SQL.Text := sql;
  query.execute();

  // Felder prüfen
  for aktFeld in mapping.Fields do
  begin
      sql := 'EXECUTE BLOCK AS BEGIN ' +
         'if (not exists(select 1 from rdb$RELATION_FIELDS where rdb$relation_name = "' + UpperCase(mapping.Tablename) + '" and rdb$field_name = "' + UpperCase(mapping.Prefix + '_' + aktFeld.Fieldname) + '")) then ' +
         'execute statement "alter table ' + mapping.Tablename + ' add ' + mapping.Prefix + '_' + aktFeld.Fieldname + ' ' + aktFeld.DBType + ';"; '  +
         'END';

      query.SQL.Text := sql;
      query.execute();
  end;

  query.transaction.Commit;
  query.Free;


end;

end.
