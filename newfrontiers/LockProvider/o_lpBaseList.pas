unit o_lpBaseList;

interface

uses
  SysUtils, Classes, Contnrs;

type
  Tlp_BaseList = class
  private
    function GetCount: Integer;
  protected
    fList: TObjectList;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    property Count: Integer read GetCount;
    procedure Clear;
  end;


implementation

{ Tci_BaseList }

constructor Tlp_BaseList.Create;
begin
  fList := TObjectList.Create;
end;

destructor Tlp_BaseList.Destroy;
begin
  FreeAndNil(fList);
  inherited;
end;

procedure Tlp_BaseList.Clear;
begin
  fList.Clear;
end;


function Tlp_BaseList.GetCount: Integer;
begin
  Result := fList.Count;
end;


end.
