unit Objekt.DHLShipmentdetails;

interface

uses
  SysUtils, Classes, geschaeftskundenversand_api_2, Objekt.DHLShipmentItem,
  Objekt.DHLShipmentNotification;

type
  TDHLShipmentdetails = class
  private
    fShipmentDetailsTypeTypeAPI: ShipmentDetailsTypeType;
    fProduct: string;
    fAccountNumber: string;
    fCustomerReference: string;
    fShipmentDate: TDateTime;
    fShipmentItem: TDHLShipmentItem;
    fShipmentNotification: TDHLShipmentNotification;
    procedure setProduct(const Value: string);
    procedure setAccountNumber(const Value: string);
    procedure setCustomerReference(const Value: string);
    procedure setShipmentDate(const Value: TDateTime);
  public
    constructor Create;
    destructor Destroy; override;
    function ShipmentDetailsTypeTypeAPI: ShipmentDetailsTypeType;
    property Product: string read fProduct write setProduct;
    property AccountNumber: string read fAccountNumber write setAccountNumber;
    property CustomerReference: string read fCustomerReference write setCustomerReference;
    property ShipmentDate: TDateTime read fShipmentDate write setShipmentDate;
    property ShipmentItem: TDHLShipmentItem read fShipmentItem write fShipmentItem;
    property Notification: TDHLShipmentNotification read fShipmentNotification write fShipmentNotification;
  end;

implementation

{ TDHLShipmentdetails }

constructor TDHLShipmentdetails.Create;
begin
  fShipmentDetailsTypeTypeAPI := ShipmentDetailsTypeType.Create;
  fShipmentItem := TDHLShipmentItem.Create;
  fShipmentDetailsTypeTypeAPI.ShipmentItem := fShipmentItem.ShipmentItemTypeAPI;
  fShipmentNotification := TDHLShipmentNotification.Create;
  fShipmentDetailsTypeTypeAPI.Notification := fShipmentNotification.ShipmentNotificationTypeAPI;
end;

destructor TDHLShipmentdetails.Destroy;
begin
  FreeAndNil(fShipmentItem);
  FreeAndNil(fShipmentNotification);
  //FreeAndNil(fShipmentDetailsTypeTypeAPI);
  inherited;
end;


procedure TDHLShipmentdetails.setAccountNumber(const Value: string);
begin
  fAccountNumber := Value;
  fShipmentDetailsTypeTypeAPI.accountNumber := Value;
end;

procedure TDHLShipmentdetails.setCustomerReference(const Value: string);
begin
  fCustomerReference := Value;
  fShipmentDetailsTypeTypeAPI.customerReference := Value;
end;

procedure TDHLShipmentdetails.setProduct(const Value: string);
begin
  fProduct := Value;
  fShipmentDetailsTypeTypeAPI.product := Value;
end;

procedure TDHLShipmentdetails.setShipmentDate(const Value: TDateTime);
begin
  fShipmentDate := Value;
  fShipmentDetailsTypeTypeAPI.shipmentDate := FormatDateTime('yyyy-mm-dd', Value);
end;


function TDHLShipmentdetails.ShipmentDetailsTypeTypeAPI: ShipmentDetailsTypeType;
begin
  Result := fShipmentDetailsTypeTypeAPI;
end;

end.
