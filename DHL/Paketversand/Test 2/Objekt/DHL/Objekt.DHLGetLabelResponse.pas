unit Objekt.DHLGetLabelResponse;

interface

uses
  System.SysUtils, System.Classes, Objekt.DHLVersionResponse, Objekt.DHLStatusinformation,
  Objekt.DHLLabelDataList;

type
  TDHLGetLabelResponse = class
  private
    fVersion: TDHLVersionResponse;
    fStatus: TDHLStatusinformation;
    fLabelData: TDHLLabelDataList;
  public
    constructor Create;
    destructor Destroy; override;
    property Version: TDHLVersionResponse read fVersion write fVersion;
    property Status: TDHLStatusinformation read fStatus write fStatus;
    property LabelData: TDHLLabelDataList read fLabelData write fLabelData;
  end;

implementation

{ TDHLGetLabelResponse }

constructor TDHLGetLabelResponse.Create;
begin
  fVersion := TDHLVersionResponse.Create;
  fStatus  := TDHLStatusinformation.Create;
  fLabelData := TDHLLabelDataList.Create;
end;

destructor TDHLGetLabelResponse.Destroy;
begin
  FreeAndNil(fVersion);
  FreeAndNil(fStatus);
  FreeAndNil(fLabelData);
  inherited;
end;

end.
