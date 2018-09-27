unit Objekt.DHLShipmentorderResponse;

interface

uses
  System.SysUtils, System.Classes;

type
  TDHLShipmentorderResponse = class
  private
    fMessageText: string;
    fLabelStatusCode: Integer;
    fLabelUrl: string;
    fLabelStatusMessage: string;
    fStatusText: string;
    fExportLabelUrl: string;
    fLabelStatusText: string;
    fStatusCode: Integer;
    fShipmentNumber: string;
    fCodeLabelUrl: string;
    fReturnLabelUrl: string;
  public
    constructor Create;
    destructor Destroy; override;
    property StatusText: string read fStatusText write fStatusText;
    property StatusCode: Integer read fStatusCode write fStatusCode;
    property MessageText: string read fMessageText write fMessageText;
    property LabelStatusCode: Integer read fLabelStatusCode write fLabelStatusCode;
    property LabelStatusText: string read fLabelStatusText write fLabelStatusText;
    property LabelStatusMessage: string read fLabelStatusMessage write fLabelStatusMessage;
    property ShipmentNumber: string read fShipmentNumber write fShipmentNumber;
    property LabelUrl: string read fLabelUrl write fLabelUrl;
    property ReturnLabelUrl: string read fReturnLabelUrl write fReturnLabelUrl;
    property ExportLabelUrl: string read fExportLabelUrl write fExportLabelUrl;
    property CodLabelUrl: string read fCodeLabelUrl write fCodeLabelUrl;
  end;

implementation

{ TDHLShipmentorderResponse }

constructor TDHLShipmentorderResponse.Create;
begin
  hier benötige ich eine Liste
end;

destructor TDHLShipmentorderResponse.Destroy;
begin

  inherited;
end;

end.
