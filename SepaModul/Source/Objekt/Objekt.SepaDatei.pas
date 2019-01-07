unit Objekt.SepaDatei;

interface

uses
  SysUtils, Classes, Objekt.SepaBSHeaderList;

type
  TSepaDatei = class
  private
    fFilename: string;
    fBSHeaderList: TSepaBSHeaderList;
    fDateiNummer: Integer;
    procedure setFilename(const Value: string);
    procedure setFilenummer(aFilename: string);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Init;
    property Filename: string read fFilename write setFilename;
    property BSHeaderList: TSepaBSHeaderList read fBSHeaderList write fBSHeaderList;
    property DateiNummer: Integer read fDateiNummer;
  end;

implementation

{ TSepaDatei }

constructor TSepaDatei.Create;
begin
  Init;
  fBSHeaderList := TSepaBSHeaderList.Create;
  fDateinummer := -1;
end;

destructor TSepaDatei.Destroy;
begin
  FreeAndNil(fBSHeaderList);
  inherited;
end;

procedure TSepaDatei.Init;
begin
  fFilename := '';
end;

procedure TSepaDatei.setFilename(const Value: string);
begin
  fFilename := Value;
  setFilenummer(fFilename);
end;

procedure TSepaDatei.setFilenummer(aFilename: string);
var
  i1: Integer;
  sNummer: string;
begin
  sNummer := '';
  for i1 := 1 to length(aFilename) do
  begin
    if (CharInSet(aFilename[i1], ['0'..'9'])) then
      sNummer := sNummer + aFilename[i1];
  end;
  if sNummer > '' then
    fDateinummer := StrToInt(sNummer);
end;

end.
