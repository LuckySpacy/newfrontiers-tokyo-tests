unit Objekt.DHLVersionResponse;

interface

uses
  SysUtils, Classes, geschaeftskundenversand_api_2, Objekt.DHLVersionBase;

type
  TDHLVersionResponse = class(TDHLVersionBase)
  private
  public
    constructor Create; override;
    destructor Destroy; override;
  end;

implementation

{ TDHLVersion }

constructor TDHLVersionResponse.Create;
begin
  inherited;
end;

destructor TDHLVersionResponse.Destroy;
begin
  inherited;
end;

end.
