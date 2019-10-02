unit Objekt.BaseList;

interface

uses
  SysUtils, Classes, Contnrs;

type
  TBaseList = class
  private
    function GetCount: Integer;
  protected
    fList: TObjectList;
    fId: Integer;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    property Count: Integer read GetCount;
    procedure Clear; virtual;
  end;


implementation

{ Tci_BaseList }

constructor TBaseList.Create;
begin
  fList := TObjectList.Create;
  fId := 0;
end;

destructor TBaseList.Destroy;
begin
  FreeAndNil(fList);
  inherited;
end;

procedure TBaseList.Clear;
begin
  fList.Clear;
  fId := 0;
end;


function TBaseList.GetCount: Integer;
begin
  Result := fList.Count;
end;

end.
