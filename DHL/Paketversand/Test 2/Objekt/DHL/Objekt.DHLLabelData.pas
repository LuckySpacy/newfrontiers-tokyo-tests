unit Objekt.DHLLabelData;

interface

uses
  SysUtils, Classes, geschaeftskundenversand_api_2, Objekt.DHLStatusinformation,
  System.Types;

type
  TDHLLabelData = class
  private
    fCodLabelData: string;
    fReturnLabelData: string;
    fLabelUrl: string;
    fLabelData: string;
    fStatus: TDHLStatusinformation;
    fExportLabelUrl: string;
    fExportLabelData: string;
    fShipmentNumber: string;
    fCodLabelUrl: string;
    fReturnLabelUrl: string;
  public
    constructor Create;
    destructor Destroy; override;
    property Status: TDHLStatusinformation read fStatus write fStatus;
    property ShipmentNumber: string read fShipmentNumber write fShipmentNumber;
    property LabelUrl: string read fLabelUrl write fLabelUrl;
    property LabelData: string read fLabelData write fLabelData;
    property ReturnLabelUrl: string read fReturnLabelUrl write fReturnlabelUrl;
    property ReturnLabelData: string read fReturnLabelData write fReturnLabelData;
    property ExportLabelUrl: string read fExportLabelUrl write fExportLabelUrl;
    property ExportLabelData: string read fExportLabelData write fExportLabelData;
    property CodLabelUrl: string read fCodLabelUrl write fCodLabelUrl;
    property CodLabelData: string read fCodLabelData write fCodLabelData;
  end;

implementation

{ TDHLLabelData }

constructor TDHLLabelData.Create;
begin
  fStatus := TDHLStatusinformation.Create;
end;

destructor TDHLLabelData.Destroy;
begin
  FreeAndNil(fStatus);
  inherited;
end;



end.
