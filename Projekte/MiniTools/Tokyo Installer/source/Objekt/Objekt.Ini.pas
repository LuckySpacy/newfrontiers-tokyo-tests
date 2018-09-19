unit Objekt.Ini;

interface

uses
  SysUtils, Classes, variants, Objekt.Global;

type
  TIni = class(TComponent)
  private
    function getTMSPfad: string;
    procedure setTMSPfad(const Value: string);
    function getAV_TMS: string;
    procedure setAV_TMS(const Value: string);
    function getBibliotheksPfad32: string;
    procedure setBibliotheksPfad32(const Value: string);
    function getSuchPfad32: string;
    procedure setSuchpfad32(const Value: string);
    function getOptimaPfad: string;
    procedure setOptimaPfad(const Value: string);
    function getAV_OPTIMA: string;
    procedure setAV_OPTIMA(const Value: string);
    function getBibliotheksPfad64: string;
    function getSuchPfad64: string;
    procedure setBibliotheksPfad64(const Value: string);
    procedure setSuchpfad64(const Value: string);
    function getGnosticePfad: string;
    procedure setGnosticePfad(const Value: string);
    function getMadCollectionPfad: string;
    procedure setMadCollectionPfad(const Value: string);
  protected
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property TMSPfad: string read getTMSPfad write setTMSPfad;
    property OptimaPfad: string read getOptimaPfad write setOptimaPfad;
    property GnosticePfad: string read getGnosticePfad write setGnosticePfad;
    property MadCollectionPfad: string read getMadCollectionPfad write setMadCollectionPfad;
    property AV_TMS: string read getAV_TMS write setAV_TMS;  // Anwendervariable TMS
    property AV_OPTIMA: string read getAV_OPTIMA write setAV_OPTIMA;  // Anwendervariable Optima-Komponenten
    property BibliotheksPfad32: string read getBibliotheksPfad32 write setBibliotheksPfad32;
    property Suchpfad32: string read getSuchPfad32 write setSuchpfad32;
    property BibliotheksPfad64: string read getBibliotheksPfad64 write setBibliotheksPfad64;
    property Suchpfad64: string read getSuchPfad64 write setSuchpfad64;
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

function TIni.getAV_OPTIMA: string;
begin
  Result := ReadRegistry(HKEY_CURRENT_USER_, 'Software\Embarcadero\BDS\19.0\Environment Variables', 'OPTIMA', '');
end;

function TIni.getAV_TMS: string;
begin
  Result := ReadRegistry(HKEY_CURRENT_USER_, 'Software\Embarcadero\BDS\19.0\Environment Variables', 'TMS', '');
end;

function TIni.getBibliotheksPfad32: string;
begin
  Result := ReadRegistry(HKEY_CURRENT_USER_, 'Software\Embarcadero\BDS\19.0\Library\Win32', 'Search Path', '');
end;

function TIni.getBibliotheksPfad64: string;
begin
  Result := ReadRegistry(HKEY_CURRENT_USER_, 'Software\Embarcadero\BDS\19.0\Library\Win64', 'Search Path', '');
end;

function TIni.getGnosticePfad: string;
begin
  Result := ReadIni(Global.IniFilename, 'Pfad', 'Gnostice', '');
end;

function TIni.getMadCollectionPfad: string;
begin
  Result := ReadIni(Global.IniFilename, 'Pfad', 'MadCollection', '');
end;

function TIni.getOptimaPfad: string;
begin
  Result := ReadIni(Global.IniFilename, 'Pfad', 'OPTIMA', '');
end;

function TIni.getSuchPfad32: string;
begin
  Result := ReadRegistry(HKEY_CURRENT_USER_, 'Software\Embarcadero\BDS\19.0\Library\Win32', 'Browsing Path', '');
end;

function TIni.getSuchPfad64: string;
begin
  Result := ReadRegistry(HKEY_CURRENT_USER_, 'Software\Embarcadero\BDS\19.0\Library\Win64', 'Browsing Path', '');
end;

function TIni.getTMSPfad: string;
begin
  Result := ReadIni(Global.IniFilename, 'Pfad', 'TMS', '');
end;

procedure TIni.setAV_TMS(const Value: string);
begin
  WriteRegistry(HKEY_CURRENT_USER_, 'Software\Embarcadero\BDS\19.0\Environment Variables', 'TMS', Value);
end;

procedure TIni.setBibliotheksPfad32(const Value: string);
begin
  WriteRegistry(HKEY_CURRENT_USER_, 'Software\Embarcadero\BDS\19.0\Library\Win32', 'Search Path', Value);
end;

procedure TIni.setBibliotheksPfad64(const Value: string);
begin
  WriteRegistry(HKEY_CURRENT_USER_, 'Software\Embarcadero\BDS\19.0\Library\Win64', 'Search Path', Value);
end;

procedure TIni.setGnosticePfad(const Value: string);
begin
  WriteIni(Global.IniFilename, 'Pfad', 'Gnostice', Value);
end;

procedure TIni.setMadCollectionPfad(const Value: string);
begin
  WriteIni(Global.IniFilename, 'Pfad', 'MadCollection', Value);
end;

procedure TIni.setAV_OPTIMA(const Value: string);
begin
  WriteRegistry(HKEY_CURRENT_USER_, 'Software\Embarcadero\BDS\19.0\Environment Variables', 'OPTIMA', Value);
end;

procedure TIni.setOptimaPfad(const Value: string);
begin
  WriteIni(Global.IniFilename, 'Pfad', 'OPTIMA', Value);
end;

procedure TIni.setSuchpfad32(const Value: string);
begin
  WriteRegistry(HKEY_CURRENT_USER_, 'Software\Embarcadero\BDS\19.0\Library\Win32', 'Browsing Path', Value);
end;

procedure TIni.setSuchpfad64(const Value: string);
begin
  WriteRegistry(HKEY_CURRENT_USER_, 'Software\Embarcadero\BDS\19.0\Library\Win64', 'Browsing Path', Value);
end;

procedure TIni.setTMSPfad(const Value: string);
begin
  WriteIni(Global.IniFilename, 'Pfad', 'TMS', Value);
end;

end.
