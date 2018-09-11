unit o_GridData;

interface

uses
  SysUtils, Classes, o_VorgangposSort;

type
  TGridData = class
  private
    fBez: string;
    fSortPos: TVorgangposSort;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Init;
    property Bez: string read fBez write fBez;
    property SortPos: TVorgangposSort read fSortPos write fSortPos;
  end;

implementation

{ TGridData }

constructor TGridData.Create;
begin
  Init;
  fSortPos := TVorgangposSort.Create;
end;

destructor TGridData.Destroy;
begin
  FreeAndNil(fSortPos);
  inherited;
end;

procedure TGridData.Init;
begin
  fBez := '';
end;

end.
