unit Objekt.DHLValidateState;

interface

uses
  System.SysUtils, System.Classes, Objekt.DHLStatusinformation;

type
  TDHLValidateState = class
  private
    fSequenceNumber: string;
    fStatus: TDHLStatusinformation;
  public
    constructor Create;
    destructor Destroy; override;
    property SequenceNumber: string read fSequenceNumber write fSequenceNumber;
    property Status: TDHLStatusinformation read fStatus write FStatus;
  end;

implementation

{ TDHLValidateState }

constructor TDHLValidateState.Create;
begin
  fStatus := TDHLStatusinformation.Create;
end;

destructor TDHLValidateState.Destroy;
begin
  FreeAndNil(fStatus);
  inherited;
end;

end.
