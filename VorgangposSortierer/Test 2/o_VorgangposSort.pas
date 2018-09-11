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
    fPrintIdx: string;
    fPrevListId: Integer;
    fListId: Integer;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Init;
    property Id: Integer read fId write fId;
    property Idx: string read fIdx write fIdx;
    property PrnNr: Integer read fPrnNr write fPrnNr;
    property Frm: string read fFrm write fFrm;
    property Nr: Integer read fNr write fNr;
    property PrintIdx: string read fPrintIdx write fPrintIdx;
    property ParentId: Integer read fParentId write fParentId;
    property HasChild: Boolean read fHasChild write fHasChild;
    property PrevListId: Integer read fPrevListId write fPrevListId;
    property ListId: Integer read fListId write fListId;
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
  fPrintIdx := '';
  fParentId := 0;
  fHasChild := false;
  fPrevListId := 0;
  fListId := 0;
end;


end.
