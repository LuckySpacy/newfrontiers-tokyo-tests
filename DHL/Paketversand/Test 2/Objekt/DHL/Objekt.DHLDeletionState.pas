unit Objekt.DHLDeletionState;

interface

uses
  SysUtils, Classes, geschaeftskundenversand_api_2, Objekt.DHLStatusInformation;

type
  TDHLDeletionState = class
  private
    fStatus: TDHLStatusinformation;
    fShipmentNumber: string;
  public
    constructor Create;
    destructor Destroy; override;
    property Status: TDHLStatusinformation read fStatus write fStatus;
    property ShipmentNumber: string read fShipmentNumber write fShipmentNumber;
  end;

implementation

{ TDHLDeletionState }

constructor TDHLDeletionState.Create;
begin
  fStatus := TDHLStatusinformation.Create;
end;

destructor TDHLDeletionState.Destroy;
begin
  FreeAndNil(fStatus);
  inherited;
end;

end.
