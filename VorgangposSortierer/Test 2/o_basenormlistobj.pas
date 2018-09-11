unit o_basenormlistobj;

interface

uses
  SysUtils, Classes, Contnrs;

type
  TBasenormListObj = class
  private
    function GetCount: Integer;
  protected
    fList: TList;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    property Count: Integer read GetCount;
    procedure Delete(aIndex: Integer);
    procedure Clear;
  end;

implementation

{ TBasenormListObj }

constructor TBasenormListObj.Create;
begin
  fList := TList.Create;
end;

destructor TBasenormListObj.Destroy;
begin
  FreeAndNil(fList);
  inherited;
end;


procedure TBasenormListObj.Clear;
begin
  fList.Clear;
end;


procedure TBasenormListObj.Delete(aIndex: Integer);
begin
  if aIndex > fList.Count then
    exit;
  fList.Delete(aIndex);
end;


function TBasenormListObj.GetCount: Integer;
begin
  Result := fList.Count;
end;

end.
