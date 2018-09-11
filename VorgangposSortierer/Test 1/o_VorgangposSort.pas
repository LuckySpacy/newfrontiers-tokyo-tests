unit o_VorgangposSort;

interface

uses
  SysUtils, Classes;

type
  TVorgangposSort = class
  private
    fId: Integer;
    fIdx: string;
    fFrm: string;
    fNr: Integer;
    fParentId: Integer;
    fPrnNr: Integer;
    fHasChild: Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Init;
    property Id: Integer read fId write fId;
    property Idx: string read fIdx write fIdx;
    property PrnNr: Integer read fPrnNr write fPrnNr;
    property Frm: string read fFrm write fFrm;
    property Nr: Integer read fNr write fNr;
    property ParentId: Integer read fParentId write fParentId;
    property HasChild: Boolean read fHasChild write fHasChild;
  end;


implementation

{ TVorgangposSort }

constructor TVorgangposSort.Create;
begin
  Init;
end;

destructor TVorgangposSort.Destroy;
begin

  inherited;
end;

procedure TVorgangposSort.Init;
begin
  fId  := 0;
  fIdx := '';
  fFrm := '';
  fNr  := 0;
  fParentId := 0;
  fHasChild := false;
end;

end.
