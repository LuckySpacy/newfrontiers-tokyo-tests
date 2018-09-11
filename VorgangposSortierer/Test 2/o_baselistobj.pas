unit o_baselistobj;

interface

uses
  SysUtils, Classes, Contnrs;

type
  TBaseListObj = class
  private
    function GetCount: Integer;
  protected
    _List: TObjectList;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    property Count: Integer read GetCount;
    procedure Delete(aIndex: Integer);
    procedure Clear; virtual;
  end;


implementation

{ TBaseListObj }

procedure TBaseListObj.Clear;
begin
  _List.Clear;
end;

constructor TBaseListObj.Create;
begin
  _List := TObjectList.Create;
end;

procedure TBaseListObj.Delete(aIndex: Integer);
begin
  if aIndex > _List.Count then
    exit;
  _List.Delete(aIndex);
end;

destructor TBaseListObj.Destroy;
begin
  FreeAndNil(_List);
  inherited;
end;

function TBaseListObj.GetCount: Integer;
begin
  Result := _List.Count;
end;


end.
