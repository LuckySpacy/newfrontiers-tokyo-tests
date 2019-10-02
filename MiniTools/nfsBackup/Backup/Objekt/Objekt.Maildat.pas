unit Objekt.Maildat;

interface

uses
  SysUtils, Classes, Vcl.ExtCtrls,
  Objekt.DateTime, Vcl.Controls, Vcl.Forms;

type
  TProvider=(pvExchange, pvGmail, pvWeb);

type
  TMailDat = class
  private
    fProgrammPfad: string;
    fDataFile: string;
    fProvider: TProvider;
    fMail: string;
    fHost: string;
    fUser: string;
    fPasswort: string;
    fBetreff: string;
    fMailAn: string;
  public
    property Provider: TProvider read fProvider write fProvider;
    property Host: string read fHost write fHost;
    property Mail: string read fMail write fMail;
    property User: string read fUser write fUser;
    property Passwort: string read fPasswort write fPasswort;
    property Betreff: string read fBetreff write fBetreff;
    property MailAn: string read fMailAn write fMailAn;
    constructor Create;
    destructor Destroy; override;
    procedure Init;
    procedure Load;
    procedure Save;
  end;



implementation

{ TMailDat }

uses
  Objekt.Allgemein;

constructor TMailDat.Create;
begin
  fProgrammpfad := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
  fDataFile := fProgrammpfad + 'Mail.dat';
  Init;
end;

destructor TMailDat.Destroy;
begin

  inherited;
end;

procedure TMailDat.Init;
begin
  fProvider := pvExchange;
  fHost := '';
  fUser := '';
  fMail := '';
  fPasswort := '';
  fBetreff := '';
  fMailAn := '';
end;

procedure TMailDat.Load;
var
  List: TStringList;
  List2: TStringList;
  iProvider: Integer;
begin
  init;
  if not FileExists(fDataFile) then
    exit;
  List2 := TStringList.Create;
  List := TStringList.Create;
  try
    List2.Delimiter := ';';
    List2.StrictDelimiter := true;
    List.LoadFromFile(fDataFile);
    List2.DelimitedText := AllgemeinObj.Entschluesseln(List.Text);
    if List2.Count < 7 then
      exit;
    if not TryStrToInt(List2.Strings[0], iProvider) then
      iProvider := 0;
    fProvider := TProvider(iProvider);
    fHost     := List2.Strings[1];
    fUser     := List2.Strings[2];
    fMail     := List2.Strings[3];
    fPasswort := List2.Strings[4];
    fBetreff  := List2.Strings[5];
    fMailAn   := List2.Strings[6];
  finally
    FreeAndNil(List);
    FreeAndNil(List2);
  end;

end;


procedure TMailDat.Save;
var
  List: TStringList;
  s: string;
begin
  List := TStringList.Create;
  try
    s := IntToStr(Ord(fProvider)) + ';' +
         fHost + ';' + fUser + ';' + fMail + ';' + fPasswort + ';' + fBetreff + ';' + fMailAn;
    List.Text := AllgemeinObj.Verschluesseln(s);
    List.SaveToFile(fDataFile);
  finally
    FreeAndNil(List);
  end;
end;




end.
