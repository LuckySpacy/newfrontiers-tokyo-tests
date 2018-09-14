unit Datenmodul.DM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, IBX.IBDatabase, dblogdlg;

type
  TOnErrorMsg=procedure(Sender: TObject; aMsg: string) of object;

  RConnectType = record
    Servername: string;
    Datenbank: string;
    User: string;
    Passwort: string;
  end;


type
  Tdm = class(TDataModule)
    db: TIBDatabase;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure dbAfterConnect(Sender: TObject);
  private
    fOnConnectionError: TOnErrorMsg;
    fOnAfterConnect: TNotifyEvent;
  public
    procedure CheckConnect(aConnectType: RConnectType);
    property OnConnectionError: TOnErrorMsg read fOnConnectionError write fOnConnectionError;
    property OnAfterConnect: TNotifyEvent read fOnAfterConnect write fOnAfterConnect;
  end;

var
  dm: Tdm;


implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  Objekt.Allgemein;


procedure Tdm.DataModuleCreate(Sender: TObject);
begin  //
  AllgemeinObj.Log.DebugInfo('DataModuleCreate');
end;

procedure Tdm.DataModuleDestroy(Sender: TObject);
begin  //
end;



procedure Tdm.CheckConnect(aConnectType: RConnectType);
var
  s: string;
begin
  AllgemeinObj.Log.DebugInfo('Start - CheckConnect - ' + aConnectType.Datenbank);
  if db.Connected then
    db.Close;
  db.LoginPrompt := false;
   s := aConnectType.Servername + ':' + aConnectType.Datenbank;
  db.DatabaseName := s;
  db.Params.Add('password='+aConnectType.Passwort);
  db.Params.Add('user_name='+aConnectType.User);
  try
    db.Connected := true;
  except
    on E:Exception do
    begin
      AllgemeinObj.Log.DebugInfo(E.Message);
      if Assigned(fOnConnectionError) then
        fOnConnectionError(Self, e.Message);
    end;
  end;
  AllgemeinObj.Log.DebugInfo('Ende - CheckConnect - ' + aConnectType.Datenbank);
end;

procedure Tdm.dbAfterConnect(Sender: TObject);
begin
  AllgemeinObj.Log.DebugInfo('Connect erfolgreich - ' + db.DatabaseName);
  if Assigned(fOnAfterConnect) then
    fOnAfterConnect(Self);
  db.Connected := false;
end;



end.
