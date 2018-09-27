unit Objekt.DHLShipmentNotification;

interface

uses
  SysUtils, Classes, geschaeftskundenversand_api_2;

type
  TDHLShipmentNotification = class
  private
    fShipmentNotificationTypeAPI: ShipmentNotificationType;
    frecipientEmailAddress: string;
    procedure setrecipientEmailAddress(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
    function ShipmentNotificationTypeAPI: ShipmentNotificationType;
    property recipientEmailAddress: string read frecipientEmailAddress write setrecipientEmailAddress;
  end;

implementation

{ TDHLShipmentNotification }

constructor TDHLShipmentNotification.Create;
begin
  fShipmentNotificationTypeAPI := ShipmentNotificationType.Create;
end;

destructor TDHLShipmentNotification.Destroy;
begin
  //FreeAndNil(fShipmentNotificationTypeAPI);
  inherited;
end;

procedure TDHLShipmentNotification.setrecipientEmailAddress(const Value: string);
begin
  frecipientEmailAddress := Value;
  fShipmentNotificationTypeAPI.recipientEmailAddress := Value;
end;

function TDHLShipmentNotification.ShipmentNotificationTypeAPI: ShipmentNotificationType;
begin
  Result := fShipmentNotificationTypeAPI;
end;

end.
