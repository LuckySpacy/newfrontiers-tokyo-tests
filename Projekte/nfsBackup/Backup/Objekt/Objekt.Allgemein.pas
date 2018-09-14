unit Objekt.Allgemein;

interface

uses
  SysUtils, Classes, Objekt.Logger, Winapi.Windows, Objekt.Ini;

type
  TAllgemeinObj = class
  private
    fLog: TLoggerObj;
    fIni: TIni;
  protected
  public
    constructor Create;
    destructor Destroy; override;
    procedure Init;
    property Log: TLoggerObj read fLog write fLog;
    property Ini: TIni read fIni write fIni;
  end;

var
  AllgemeinObj: TAllgemeinObj;


implementation

{ TAllgemein }

constructor TAllgemeinObj.Create;
begin
  Init;
  fLog := TLoggerObj.Create;
  fIni := TIni.Create;
end;

destructor TAllgemeinObj.Destroy;
begin
  FreeAndNil(fLog);
  FreeAndNil(fIni);
  inherited;
end;


procedure TAllgemeinObj.Init;
begin

end;


end.
