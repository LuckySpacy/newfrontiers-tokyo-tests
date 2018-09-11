unit o_VorgangposSortList;

interface

uses
  SysUtils, Classes, o_baselistobj, o_VorgangposSort;

type
  TVorgangposSortList = class(TBaseListObj)
  private
    fId: Integer;
    fHasChild: Boolean;
    function getVorgangposSort(Index: Integer): TVorgangposSort;
  public
    constructor Create; override;
    destructor Destroy; override;
    function Add: TVorgangposSort;
    property Item[Index: Integer]: TVorgangposSort read getVorgangposSort;
    property Id: Integer read fId write fId;
  end;

implementation

{ TVorgangposSortList }


constructor TVorgangposSortList.Create;
begin
  inherited;
  fId := 0;
end;

destructor TVorgangposSortList.Destroy;
begin

  inherited;
end;



function TVorgangposSortList.getVorgangposSort(Index: Integer): TVorgangposSort;
begin
  Result := nil;
  if Index > _List.Count then
    exit;
  Result := TVorgangposSort(_List.Items[Index]);
end;

function TVorgangposSortList.Add: TVorgangposSort;
begin
  Result := TVorgangposSort.Create;
  _List.Add(Result);
end;




end.
