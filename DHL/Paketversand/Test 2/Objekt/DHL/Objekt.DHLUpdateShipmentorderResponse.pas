unit Objekt.DHLUpdateShipmentorderResponse;

interface

uses
  System.SysUtils, System.Classes, Objekt.DHLVersionResponse, Objekt.DHLStatusinformation,
  Objekt.DHLLabelData;

type
  TDHLUpdateShipmentorderResponse = class
  private
    fVersion: TDHLVersionResponse;
    fStatus: TDHLStatusinformation;
    fLabelData: TDHLLabelData;
  public
    constructor Create;
    destructor Destroy; override;
    property Version: TDHLVersionResponse read fVersion write fVersion;
    property Status: TDHLStatusinformation read fStatus write fStatus;
    property LabelData: TDHLLabelData read fLabelData write fLabelData;
  end;

implementation

{ TDHLUpdateShipmentorderResponse }

constructor TDHLUpdateShipmentorderResponse.Create;
begin
  fVersion := TDHLVersionResponse.Create;
  fStatus  := TDHLStatusinformation.Create;
  fLabelData := TDHLLabelData.Create;
end;

destructor TDHLUpdateShipmentorderResponse.Destroy;
begin
  FreeAndNil(fVersion);
  FreeAndNil(fStatus);
  FreeAndNil(fLabelData);
  inherited;
end;

end.
