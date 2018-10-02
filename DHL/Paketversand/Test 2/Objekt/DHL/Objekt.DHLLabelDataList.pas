unit Objekt.DHLLabelDataList;

interface

uses
  System.SysUtils, System.Classes, Objekt.DHLLabelData, Objekt.DHLBaseList,
  System.Contnrs;

type
  TDHLLabelDataList = class(TDHLBaseList)
  private
    function getDHLLabelData(Index: Integer): TDHLLabelData;
  public
    constructor Create; override;
    destructor Destroy; override;
    property Item[Index: Integer]: TDHLLabelData read getDHLLabelData;
    function Add: TDHLLabelData;
  end;

implementation

{ TDHLLabelDataList }


constructor TDHLLabelDataList.Create;
begin
  inherited;

end;

destructor TDHLLabelDataList.Destroy;
begin

  inherited;
end;

function TDHLLabelDataList.getDHLLabelData(Index: Integer): TDHLLabelData;
begin
  Result := nil;
  if Index > fList.Count -1 then
    exit;
  Result := TDHLLabelData(fList[Index]);
end;


function TDHLLabelDataList.Add: TDHLLabelData;
begin
  Result := TDHLLabelData.Create;
  fList.Add(Result);
end;


end.
