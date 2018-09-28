unit Objekt.DHLStatusinformationList;

interface

uses
  System.SysUtils, System.Classes, Objekt.DHLStatusinformation, Objekt.DHLBaseList,
  System.Contnrs;

type
  TDHLStatusinformationList = class(TDHLBaseList)
  private
    fStatusinformation : TDHLStatusinformation;
    function getDHLStatusinformation(Index: Integer): TDHLStatusinformation;
  public
    constructor Create; override;
    destructor Destroy; override;
    property Item[Index: Integer]: TDHLStatusinformation read getDHLStatusinformation;
    function Add: TDHLStatusinformation;
  end;

implementation

{ TDHLStatusinformationList }


constructor TDHLStatusinformationList.Create;
begin
  inherited;

end;

destructor TDHLStatusinformationList.Destroy;
begin

  inherited;
end;

function TDHLStatusinformationList.getDHLStatusinformation(Index: Integer): TDHLStatusinformation;
begin
  Result := nil;
  if Index > fList.Count -1 then
    exit;
  Result := TDHLStatusinformation(fList[Index]);
end;


function TDHLStatusinformationList.Add: TDHLStatusinformation;
begin
  fStatusinformation := TDHLStatusinformation.Create;
  fList.Add(fStatusinformation);
  Result := fStatusinformation;
end;


end.
