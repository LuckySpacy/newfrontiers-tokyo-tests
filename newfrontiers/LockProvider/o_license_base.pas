unit o_license_base;

interface

uses Classes;

type FlagsArray = array[0..63] of boolean;

type TLicenseBase = class(TComponent)
  protected

    CustomerInfo : string;
    ClientLimit  : integer;
    Serial       : string;
    KeySerial    : string;
    MandantLimit : integer;

    FlagsInfo    : string;
    FlagsPattern : FlagsArray;

    KeyIsOpen : boolean;

  public

    constructor Create(aOwner : TComponent); override;
    destructor Destroy; override;

    function getCustomerInfo : string;
    function getClientLimit : integer;
    function getSerial : string;
    function getKeySerial : string;
    function getFlagsPattern : FlagsArray;
    function getModuleInfo : string;
    function getMandantLimit : integer;
    function isOpen : boolean;

    function verify : boolean; virtual; abstract;

end;

implementation

//uses c_invalidkeylist;

{ TLicenseBase }

constructor TLicenseBase.create(aOwner: TComponent);
begin
  inherited;

end;

destructor TLicenseBase.destroy;
begin

  inherited;
end;

function TLicenseBase.getClientLimit: integer;
begin

  Result := ClientLimit;

end;

function TLicenseBase.getCustomerInfo: string;
begin

  Result := CustomerInfo;

end;

function TLicenseBase.getFlagsPattern: FlagsArray;
begin

  Result := FlagsPattern;

end;

function TLicenseBase.getKeySerial: string;
begin

  Result := KeySerial;

end;

function TLicenseBase.getMandantLimit: integer;
begin

  Result := MandantLimit;

end;

function TLicenseBase.getModuleInfo: string;
begin

  Result := FlagsInfo;

end;

function TLicenseBase.getSerial: string;
begin

  Result := Serial;

end;

function TLicenseBase.isOpen: boolean;
begin

  Result := KeyIsOpen;

end;

end.
