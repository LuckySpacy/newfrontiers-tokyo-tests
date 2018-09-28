unit Objekt.DHLBaselist;

interface


uses
  SysUtils, Classes, Contnrs;

type
  TDHLBaseList = class
  private
    function GetCount: Integer;
  protected
    fList: TObjectList;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    property Count: Integer read GetCount;
    procedure Clear; virtual;
  end;


implementation

{ TBaseList }


constructor TDHLBaseList.Create;
begin
  fList := TObjectList.Create;
end;

destructor TDHLBaseList.Destroy;
begin
  FreeAndNil(fList);
  inherited;
end;

function TDHLBaseList.GetCount: Integer;
begin
  Result := fList.Count;
end;

procedure TDHLBaseList.Clear;
begin
  fList.Clear;
end;


end.
