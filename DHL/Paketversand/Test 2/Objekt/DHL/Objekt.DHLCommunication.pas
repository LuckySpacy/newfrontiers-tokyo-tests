unit Objekt.DHLCommunication;

interface

uses
  SysUtils, Classes, geschaeftskundenversand_api_2;

type
  TDHLCommunication = class
  private
    fCommunicationTypeAPI: CommunicationType;
    fEMail: string;
    fPhone: string;
    fContactPerson: string;
    procedure setContactPerson(const Value: string);
    procedure setEMail(const Value: string);
    procedure setPhone(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
    function CommunicationTypeAPI: CommunicationType;
    property Phone: string read fPhone write setPhone;
    property EMail: string read fEMail write setEMail;
    property ContactPerson: string read fContactPerson write setContactPerson;
  end;

implementation

{ TDHLCommunication }


constructor TDHLCommunication.Create;
begin
  fCommunicationTypeAPI := CommunicationType.Create;
end;

destructor TDHLCommunication.Destroy;
begin
  //FreeAndNil(fCommunicationTypeAPI);
  inherited;
end;

procedure TDHLCommunication.setContactPerson(const Value: string);
begin
  fContactPerson := Value;
  fCommunicationTypeAPI.contactPerson := Value;
end;

procedure TDHLCommunication.setEMail(const Value: string);
begin
  fEMail := Value;
  fCommunicationTypeAPI.email := Value;
end;

procedure TDHLCommunication.setPhone(const Value: string);
begin
  fPhone := Value;
  fCommunicationTypeAPI.phone := Value;
end;

function TDHLCommunication.CommunicationTypeAPI: CommunicationType;
begin
  Result := fCommunicationTypeAPI;
end;


end.
