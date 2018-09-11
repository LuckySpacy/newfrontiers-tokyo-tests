unit Objekt.TapiData;

interface

uses
  SysUtils, Classes, Vcl.Controls;

type
  TTapiData = class
  private
    fList: TStringList;
    fBefehl: string;
    fKu_Id: Integer;
    fLt_Id: Integer;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Init;
    property Befehl: string read fBefehl write fBefehl;
    property KU_ID: Integer read fKu_Id write fKu_Id;
    property LT_ID: Integer read fLt_Id write fLt_Id;
    procedure setValue(aValue: string);
    function getValue: string;
  end;

implementation

{ TTapiData }

constructor TTapiData.Create;
begin
  fList := TStringList.Create;
  Init;
end;

destructor TTapiData.Destroy;
begin
  FreeAndNil(fList);
  inherited;
end;


procedure TTapiData.Init;
begin
  fBefehl := '';
  fKu_Id  := 0;
  fLt_Id  := 0;
end;

procedure TTapiData.setValue(aValue: string);
var
  i1: Integer;
begin
  Init;
  fList.Text := aValue;
  for i1 := 0 to fList.Count -1 do
  begin
    if SameText(fList.Names[i1], 'Befehl') then
      fBefehl := fList.ValueFromIndex[i1];
    if SameText(fList.Names[i1], 'KU_ID') then
    begin
      if not TryStrToInt(fList.ValueFromIndex[i1], fKu_Id) then
        fKu_Id := 0;
    end;
    if SameText(fList.Names[i1], 'LT_ID') then
    begin
      if not TryStrToInt(fList.ValueFromIndex[i1], fLt_Id) then
        fLt_Id := 0;
    end;
  end;
end;

function TTapiData.getValue: string;
begin
  fList.Clear;
  fList.Add('Befehl=' + fBefehl);
  fList.Add('KU_ID='+IntToStr(fKu_Id));
  fList.Add('LT_ID='+IntToStr(fLt_Id));
  Result := fList.Text;
end;


end.
