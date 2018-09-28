unit Objekt.DHLValidateStateList;

interface

uses
  System.SysUtils, System.Classes, Objekt.DHLValidateState, Objekt.DHLBaseList,
  System.Contnrs;

type
  TDHLValidateStateList = class(TDHLBaseList)
  private
    fValidateState : TDHLValidateState;
    function getDHLValidateState(Index: Integer): TDHLValidateState;
  public
    constructor Create; override;
    destructor Destroy; override;
    property Item[Index: Integer]: TDHLValidateState read getDHLValidateState;
    function Add: TDHLValidateState;
  end;

implementation

{ TDHLValidateStateList }


constructor TDHLValidateStateList.Create;
begin
  inherited;

end;

destructor TDHLValidateStateList.Destroy;
begin

  inherited;
end;


function TDHLValidateStateList.Add: TDHLValidateState;
begin
  fValidateState := TDHLValidateState.Create;
  fList.Add(fValidateState);
  Result := fValidateState;
end;

function TDHLValidateStateList.getDHLValidateState(Index: Integer): TDHLValidateState;
begin
  Result := nil;
  if Index > fList.Count -1 then
    exit;
  Result := TDHLValidateState(fList[Index]);
end;

end.
