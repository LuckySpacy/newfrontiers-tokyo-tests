unit Objekt.Downloadfile;

interface

uses
  System.SysUtils, System.Classes,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TDownloadfile = class
  private
    fHTTP: TIdHTTP;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Download(aUrl, aFullFilename: string);
  end;

implementation

{ TDownloadfile }

constructor TDownloadfile.Create;
begin
  fHTTP := TidHTTP.Create(nil);
end;

destructor TDownloadfile.Destroy;
begin
  FreeAndNil(fHTTP);
  inherited;
end;

procedure TDownloadfile.Download(aUrl, aFullFilename: string);
var
  ms: TMemoryStream;
begin
  ms := TMemoryStream.Create;
  try
    fHTTP.Get(aUrl, ms);
    ms.SaveToFile(aFullFilename);
  finally
    FreeAndNil(ms);
  end;
end;

end.
