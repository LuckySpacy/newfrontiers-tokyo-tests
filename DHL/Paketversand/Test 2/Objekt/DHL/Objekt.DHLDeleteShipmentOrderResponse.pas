unit Objekt.DHLDeleteShipmentOrderResponse;

interface

uses
  System.SysUtils, System.Classes, Objekt.DHLVersionResponse, Objekt.DHLStatusinformation,
  Objekt.DHLDeletionStateList;

type
  TDHLDeleteShipmentorderResponse = class
  private
    fVersion: TDHLVersionResponse;
    fStatus: TDHLStatusinformation;
    fDeletionState: TDHLDeletionStateList;
  public
    constructor Create;
    destructor Destroy; override;
    property Version: TDHLVersionResponse read fVersion write fVersion;
    property Status: TDHLStatusinformation read fStatus write fStatus;
    property DeletionState: TDHLDeletionStateList read fDeletionState write fDeletionState;
  end;

implementation

{ TDHLValidateShipmentorderResponse }

constructor TDHLDeleteShipmentorderResponse.Create;
begin
  fVersion := TDHLVersionResponse.Create;
  fStatus  := TDHLStatusinformation.Create;
  fDeletionState := TDHLDeletionStateList.Create;
end;

destructor TDHLDeleteShipmentorderResponse.Destroy;
begin
  FreeAndNil(fVersion);
  FreeAndNil(fStatus);
  FreeAndNil(fDeletionState);
  inherited;
end;

end.
