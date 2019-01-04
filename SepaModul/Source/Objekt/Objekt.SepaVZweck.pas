unit Objekt.SepaVZweck;

interface

uses
  SysUtils, Classes;

type
  TSepaVZweck = class
  private
    fZweck2: string;
    fZweck3: string;
    fZweck1: string;
    fZweck4: string;
    procedure setZweck1(const Value: string);
    procedure setZweck2(const Value: string);
    procedure setZweck3(const Value: string);
    procedure setZweck4(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Init;
    property Zweck1: string read fZweck1 write setZweck1;
    property Zweck2: string read fZweck2 write setZweck2;
    property Zweck3: string read fZweck3 write setZweck3;
    property Zweck4: string read fZweck4 write setZweck4;
  end;

implementation

{ TSepaVZweck }

constructor TSepaVZweck.Create;
begin
  Init;
end;

destructor TSepaVZweck.Destroy;
begin

  inherited;
end;


procedure TSepaVZweck.Init;
begin
  fZweck1 := '';
  fZweck2 := '';
  fZweck3 := '';
  fZweck4 := '';
end;

procedure TSepaVZweck.setZweck1(const Value: string);
begin
  fZweck1 := copy(Value, 1, 27);
end;

procedure TSepaVZweck.setZweck2(const Value: string);
begin
  fZweck2 := copy(Value, 1, 27);
end;

procedure TSepaVZweck.setZweck3(const Value: string);
begin
  fZweck3 := copy(Value, 1, 27);
end;

procedure TSepaVZweck.setZweck4(const Value: string);
begin
  fZweck4 := copy(Value, 1, 27);
end;

end.
