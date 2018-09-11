unit NewFrontiers.Database.Utility;

interface

  uses NewFrontiers.Database;

  type
    ///	<summary>
    ///	  Diese Klasse fasst die Utility-Funktionen im DB-Umfeld zusammen
    ///	</summary>
    TDatabaseUtility = class

      public
        ///	<summary>
        ///	  Fragt den Wert eines Generators ab und gibt diesen als Int zurück
        ///	</summary>
        class function getGeneratorValue(aGenerator: string; aTransaction: TNfsTransaction): integer;

    end;

implementation

{ TDatabaseUtility }

class function TDatabaseUtility.getGeneratorValue(aGenerator: string;
  aTransaction: TNfsTransaction): integer;
var queryBuilder:  TQueryBuilder;
    query: TNfsQuery;
begin

  queryBuilder := TQueryBuilder
    .select
    .from('stammdaten')
    .field('GEN_ID(' + aGenerator + ',1)');

  query := queryBuilder.getQuery(nil, aTransaction);

  result := query.skalarAsInteger();

  query.Free;
  queryBuilder.Free;

end;

end.
