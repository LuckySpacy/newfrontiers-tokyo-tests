unit o_VorgangposSortList;

interface

uses
  SysUtils, Classes, o_basenormlistobj, o_VorgangposSort;

type
  TVorgangposSortList = class(TBasenormListObj)
  private
    fId: Integer;
    fHasChild: Boolean;
    function getVorgangposSort(Index: Integer): TVorgangposSort;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure Add(aPosSort: TVorgangposSort);
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


procedure TVorgangposSortList.Add(aPosSort: TVorgangposSort);
begin
  fList.Add(aPosSort);
end;


function TVorgangposSortList.getVorgangposSort(Index: Integer): TVorgangposSort;
begin
  Result := nil;
  if Index > fList.Count then
    exit;
  Result := TVorgangposSort(fList.Items[Index]);
end;

end.
