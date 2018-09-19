unit Objekt.Ini;

interface

uses
  SysUtils, Classes, variants, Objekt.Global;

type
  TIni = class(TComponent)
  private
    function getVerzeichnis: string;
    procedure setVerzeichnis(const Value: string);
    function getSuchtext: string;
    procedure setSuchtext(const Value: string);
    function getErsetzen: string;
    procedure setErsetzen(const Value: string);
    function getMask: string;
    procedure setMask(const Value: string);
    function getGenaueSuche: Boolean;
    procedure setGenaueSuche(const Value: Boolean);
  protected
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Verzeichnis: string read getVerzeichnis write setVerzeichnis;
    property Suchtext: string read getSuchtext write setSuchtext;
    property Ersetzen: string read getErsetzen write setErsetzen;
    property Mask: string read getMask write setMask;
    property GenaueSuche: Boolean read getGenaueSuche write setGenaueSuche;
  end;

implementation

{ TIni }

uses
  Allgemein.RegIni;

constructor TIni.Create(AOwner: TComponent);
begin
  inherited;

end;

destructor TIni.Destroy;
begin

  inherited;
end;

function TIni.getErsetzen: string;
begin
  Result :=  ReadIni(Global.IniFilename, 'Einstellung', 'Ersetzen', '');
end;

function TIni.getGenaueSuche: Boolean;
begin
  Result := ReadIni(Global.IniFilename, 'Einstellung', 'GenaueSuche', 'T') = 'T';
end;

function TIni.getMask: string;
begin
  Result :=  ReadIni(Global.IniFilename, 'Einstellung', 'Mask', '');
end;

function TIni.getSuchtext: string;
begin
  Result :=  ReadIni(Global.IniFilename, 'Einstellung', 'Suchtext', '');
end;

function TIni.getVerzeichnis: string;
begin
  Result :=  ReadIni(Global.IniFilename, 'Einstellung', 'Verzeichnis', '');
end;

procedure TIni.setErsetzen(const Value: string);
begin
  WriteIni(Global.IniFilename, 'Einstellung', 'Ersetzen', Value);
end;

procedure TIni.setGenaueSuche(const Value: Boolean);
begin
  if Value then
    WriteIni(Global.IniFilename, 'Einstellung', 'GenaueSuche', 'T')
  else
    WriteIni(Global.IniFilename, 'Einstellung', 'GenaueSuche', 'F');
end;

procedure TIni.setMask(const Value: string);
begin
  WriteIni(Global.IniFilename, 'Einstellung', 'Mask', Value);
end;

procedure TIni.setSuchtext(const Value: string);
begin
  WriteIni(Global.IniFilename, 'Einstellung', 'Suchtext', Value);
end;

procedure TIni.setVerzeichnis(const Value: string);
begin
  WriteIni(Global.IniFilename, 'Einstellung', 'Verzeichnis', Value);
end;

end.
