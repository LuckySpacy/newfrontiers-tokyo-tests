unit Objekt.DHLShipmentorderResponse;

interface

uses
  System.SysUtils, System.Classes;

type
  TDHLShipmentorderResponse = class
  private
    fLabelStatusCode: Integer;
    fLabelUrl: string;
    fLabelStatusMessage: string;
    fExportLabelUrl: string;
    fLabelStatusText: string;
    fShipmentNumber: string;
    fCodeLabelUrl: string;
    fReturnLabelUrl: string;
    fSequenceNumber: string;
  public
    constructor Create;
    destructor Destroy; override;
    property LabelStatusCode: Integer read fLabelStatusCode write fLabelStatusCode;
    property LabelStatusText: string read fLabelStatusText write fLabelStatusText;
    property LabelStatusMessage: string read fLabelStatusMessage write fLabelStatusMessage;
    property ShipmentNumber: string read fShipmentNumber write fShipmentNumber;
    property SequenceNumber: string read fSequenceNumber write fSequenceNumber;
    property LabelUrl: string read fLabelUrl write fLabelUrl;
    property ReturnLabelUrl: string read fReturnLabelUrl write fReturnLabelUrl;
    property ExportLabelUrl: string read fExportLabelUrl write fExportLabelUrl;
    property CodLabelUrl: string read fCodeLabelUrl write fCodeLabelUrl;
  end;

implementation

{ TDHLShipmentorderResponse }

constructor TDHLShipmentorderResponse.Create;
begin

end;

destructor TDHLShipmentorderResponse.Destroy;
begin

  inherited;
end;

end.
