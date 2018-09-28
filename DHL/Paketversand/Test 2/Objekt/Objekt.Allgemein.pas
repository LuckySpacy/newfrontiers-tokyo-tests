unit Objekt.Allgemein;

interface

uses
  SysUtils, Classes, Winapi.Windows, Objekt.Ini, Objekt.DHLSend;

type
  TAllgemeinObj = class
  private
    fIni: TIni;
    fDHLSend: TDHLSend;
    fDownloadPath: string;
  protected
  public
    constructor Create;
    destructor Destroy; override;
    procedure Init;
    property Ini: TIni read fIni write fIni;
    property DHLSend: TDHLSend read fDHLSend write fDHLSend;
    property DownloadPath: string read fDownloadPath;
  end;


var
  AllgemeinObj: TAllgemeinObj;


implementation

{ TAllgemeinObj }


constructor TAllgemeinObj.Create;
begin
  init;
  fIni := TIni.Create;
  fDHLSend := TDHLSend.Create;
  fDHLSend.Username := fIni.Authentication_User;
  fDHLSend.Password := fIni.Authentication_Password;
  fDHLSend.cisUser := fIni.cis_User;
  fDHLSend.cisSignature := fIni.cis_Password;
  fDHLSend.Url := fIni.Url;
  fDownloadPath := ExtractFilePath(ParamStr(0));
end;

destructor TAllgemeinObj.Destroy;
begin
  FreeAndNil(fIni);
  FreeAndNil(fDHLSend);
  inherited;
end;

procedure TAllgemeinObj.Init;
begin

end;

end.
