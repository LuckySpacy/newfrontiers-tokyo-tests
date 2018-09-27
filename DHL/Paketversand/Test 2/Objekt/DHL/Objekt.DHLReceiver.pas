unit Objekt.DHLReceiver;

interface

uses
  SysUtils, Classes, geschaeftskundenversand_api_2, Objekt.DHLReceiverNativeAddress,
  Objekt.DHLCommunication;

type
  TDHLReceiver = class
  private
    fReceiverTypeAPI: ReceiverType;
    fName1: string;
    fAddress: TDHLReceiverNativeAddress;
    fCommunication: TDHLCommunication;
    procedure setName1(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
    function ReceiverTypeAPI: ReceiverType;
    property Name1: string read fName1 write setName1;
    property Address: TDHLReceiverNativeAddress read fAddress write fAddress;
    property Communication: TDHLCommunication read fCommunication write fCommunication;
  end;

implementation

{ TDHLReceiver }

constructor TDHLReceiver.Create;
begin
  fAddress := TDHLReceiverNativeAddress.Create;
  fCommunication := TDHLCommunication.Create;
  fReceiverTypeAPI := ReceiverType.Create;
  fReceiverTypeAPI.Address := fAddress.ReceiverNativeAddressTypeAPI;
  fReceiverTypeAPI.Communication := fCommunication.CommunicationTypeAPI;
end;

destructor TDHLReceiver.Destroy;
begin
  FreeAndNil(fAddress);
  FreeAndNil(fCommunication);
  //FreeAndNil(fReceiverTypeAPI);
  inherited;
end;

function TDHLReceiver.ReceiverTypeAPI: ReceiverType;
begin
  Result := fReceiverTypeAPI;
end;

procedure TDHLReceiver.setName1(const Value: string);
begin
  fName1 := Value;
  fReceiverTypeAPI.name1 := Value;
end;

end.
