unit Objekt.SepaDatei;

interface

uses
  SysUtils, Classes, Objekt.SepaBSHeaderList;

type
  TSepaDatei = class
  private
    fFilename: string;
    fBSHeaderList: TSepaBSHeaderList;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Init;
    property Filename: string read fFilename write fFilename;
    property BSHeaderList: TSepaBSHeaderList read fBSHeaderList write fBSHeaderList;
  end;

implementation

{ TSepaDatei }

constructor TSepaDatei.Create;
begin
  Init;
  fBSHeaderList := TSepaBSHeaderList.Create;
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

end.
