unit Objekt.DHLDeletionStateList;

interface

uses
  System.SysUtils, System.Classes, Objekt.DHLDeletionState, Objekt.DHLBaseList,
  System.Contnrs;

type
  TDHLDeletionStateList = class(TDHLBaseList)
  private
    function getDHLDeletionState(Index: Integer): TDHLDeletionState;
  public
    constructor Create; override;
    destructor Destroy; override;
    property Item[Index: Integer]: TDHLDeletionState read getDHLDeletionState;
    function Add: TDHLDeletionState;
  end;
implementation

{ TDHLDeletionStateList }


constructor TDHLDeletionStateList.Create;
begin
  inherited;

end;

destructor TDHLDeletionStateList.Destroy;
begin

  inherited;
end;


function TDHLDeletionStateList.Add: TDHLDeletionState;
begin
  Result := TDHLDeletionState.Create;
  fList.Add(Result);
end;


function TDHLDeletionStateList.getDHLDeletionState(
  Index: Integer): TDHLDeletionState;
begin
  Result := nil;
  if Index > fList.Count -1 then
    exit;
  Result := TDHLDeletionState(fList[Index]);
end;

end.
