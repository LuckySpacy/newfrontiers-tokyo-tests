unit Objekt.DHLStatusinformation;

interface

uses
  System.SysUtils, System.Classes;

type
  TDHLStatusinformation = class
  private
    fStatusText: string;
    fStatusCode: Int64;
    fStatusMessage: string;
  public
    constructor Create;
    destructor Destroy; override;
    property StatusCode: Int64 read fStatusCode write fStatusCode;
    property StatusText: string read fStatusText write fStatusText;
    property StatusMessage: string read fStatusMessage write fStatusMessage;
  end;

implementation

{ TDHLStatusinformation }

constructor TDHLStatusinformation.Create;
begin

end;

destructor TDHLStatusinformation.Destroy;
begin

  inherited;
end;

end.
