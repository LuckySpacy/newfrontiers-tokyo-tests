unit Objekt.DHLShipmentorderResponseList;

interface

uses
  System.SysUtils, System.Classes, Objekt.DHLShipmentorderResponse, Objekt.DHLBaseList,
  System.Contnrs;

type
  TDHLShipmentorderResponseList = class(TDHLBaseList)
  private
    fShipmentorderResponse: TDHLShipmentorderResponse;
    fStatusText: string;
    fStatusCode: Integer;
    fStatusMessageText: string;
    function getShipmentorderResponse(Index: Integer): TDHLShipmentorderResponse;
  public
    constructor Create; override;
    destructor Destroy; override;
    property Item[Index: Integer]: TDHLShipmentorderResponse read getShipmentorderResponse;
    function Add: TDHLShipmentorderResponse;
    property StatusText: string read fStatusText write fStatusText;
    property StatusCode: Integer read fStatusCode write fStatusCode;
    property StatusMessage: string read fStatusMessageText write fStatusMessageText;
  end;


implementation

{ TDHLShipmentorderResponseList }


constructor TDHLShipmentorderResponseList.Create;
begin
  inherited;
end;

destructor TDHLShipmentorderResponseList.Destroy;
begin

  inherited;
end;

function TDHLShipmentorderResponseList.getShipmentorderResponse(Index: Integer): TDHLShipmentorderResponse;
begin
  Result := nil;
  if Index > fList.Count -1 then
    exit;
  Result := TDHLShipmentorderResponse(fList[Index]);
end;

function TDHLShipmentorderResponseList.Add: TDHLShipmentorderResponse;
begin
  fShipmentorderResponse := TDHLShipmentorderResponse.Create;
  fList.Add(fShipmentorderResponse);
  Result := fShipmentorderResponse;
end;


end.
