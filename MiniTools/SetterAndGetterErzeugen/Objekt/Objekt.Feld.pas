unit Objekt.Feld;

interface

uses
  SysUtils, Classes, db;

type
  TFeld = class
  private
    fName: string;
    fTyp: TFieldType;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Init;
    property Name: string read fName write fName;
    property Typ: TFieldType read fTyp write fTyp;
    function TypAsString: string;
    function TypIsString: Boolean;
    function TypIsZahl: Boolean;
  end;

implementation

{ TFeld }

constructor TFeld.Create;
begin
  Init;
end;

destructor TFeld.Destroy;
begin

  inherited;
end;

procedure TFeld.Init;
begin
  fName := '';
  fTyp  := ftUnknown;
end;

function TFeld.TypAsString: string;
begin
  Result := 'FEHLER!!!!';
  if (fTyp = ftString) or (fTyp = ftBlob) then
    Result := 'String';
  if (fTyp = ftInteger) then
    Result := 'Integer';
  if (fTyp = ftFloat) then
    Result := 'Real';
  if (fTyp = ftBoolean) then
    Result := 'Boolean';
  if (fTyp = ftDateTime) then
    Result := 'TDateTime';
end;

function TFeld.TypIsString: Boolean;
begin
  Result := false;
  if (fTyp = ftString) or (fTyp = ftBlob) then
    Result := true;
end;

function TFeld.TypIsZahl: Boolean;
begin
  Result := false;
  if (fTyp = ftInteger) or (fTyp = ftFloat) then
    Result := true;
end;

end.
