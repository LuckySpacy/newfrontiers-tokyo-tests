unit Objekt.DHLValidateShipmentorderResponse;

interface

uses
  System.SysUtils, System.Classes, Objekt.DHLVersionResponse, Objekt.DHLStatusinformation,
  Objekt.DHLValidateStateList;

type
  TDHLValidateShipmentorderResponse = class
  private
    fVersion: TDHLVersionResponse;
    fStatus: TDHLStatusinformation;
    fValidationState: TDHLValidateStateList;
  public
    constructor Create;
    destructor Destroy; override;
    property Version: TDHLVersionResponse read fVersion write fVersion;
    property Status: TDHLStatusinformation read fStatus write fStatus;
    property ValidationState: TDHLValidateStateList read fValidationState write fValidationState;
  end;

implementation

{ TDHLValidateShipmentorderResponse }

constructor TDHLValidateShipmentorderResponse.Create;
begin
  fVersion := TDHLVersionResponse.Create;
  fStatus  := TDHLStatusinformation.Create;
  fValidationState := TDHLValidateStateList.Create;
end;

destructor TDHLValidateShipmentorderResponse.Destroy;
begin
  FreeAndNil(fVersion);
  FreeAndNil(fStatus);
  FreeAndNil(fValidationState);
  inherited;
end;

end.
