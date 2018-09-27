unit Objekt.DHLNameType;

interface

uses
  SysUtils, Classes, geschaeftskundenversand_api_2;

type
  TDHLNameType = class
  private
    fNameTypeAPI: NameType;
    fName2: string;
    fName3: string;
    fName1: string;
    procedure setName1(const Value: string);
    procedure setName2(const Value: string);
    procedure setName3(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
    function NameTypeAPI: NameType;
    property Name1: string read fName1 write setName1;
    property Name2: string read fName2 write setName2;
    property Name3: string read fName3 write setName3;
  end;

implementation

{ TDHLNameType }

constructor TDHLNameType.Create;
begin
  fNameTypeAPI := NameType.Create;
end;

destructor TDHLNameType.Destroy;
begin
  //FreeAndNil(fNameTypeAPI);
  inherited;
end;

function TDHLNameType.NameTypeAPI: NameType;
begin
  Result := fNameTypeAPI;
end;

procedure TDHLNameType.setName1(const Value: string);
begin
  fName1 := Value;
  fNameTypeAPI.name1 := Value;
end;

procedure TDHLNameType.setName2(const Value: string);
begin
  fName2 := Value;
  fNameTypeAPI.name2 := Value;
end;

procedure TDHLNameType.setName3(const Value: string);
begin
  fName3 := Value;
  fNameTypeAPI.name3 := Value;
end;

end.
