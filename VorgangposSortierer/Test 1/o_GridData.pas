unit o_GridData;

interface

uses
  SysUtils, Classes;

type
  TGridData = class
  private
    fId: Integer;
    fIdx: string;
    fFrm: string;
    fNr: Integer;
    fParentId: Integer;
    fBez: string;
    fPrnNr: Integer;
    fHasChild: Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Init;
    property Id: Integer read fId write fId;
    property Idx: string read fIdx write fIdx;
    property Frm: string read fFrm write fFrm;
    property PrnNr: Integer read fPrnNr write fPrnNr;
    property Nr: Integer read fNr write fNr;
    property Bez: string read fBez write fBez;
    property ParentId: Integer read fParentId write fParentId;
    property HasChild: Boolean read fHasChild write fHasChild;
  end;

implementation

{ TGridData }

constructor TGridData.Create;
begin
  Init;
end;

destructor TGridData.Destroy;
begin

  inherited;
end;

procedure TGridData.Init;
begin
  fId  := 0;
  fIdx := '';
  fFrm := '';
  fPrnNr := 0;
  fNr  := 0;
  fParentId := 0;
  fBez := '';
  fHasChild := false;
end;

end.
