unit o_lpUser;

interface

uses
  SysUtils, Classes, Contnrs;


type
  Tlp_User = class
  private
    fKey: Integer;
    fHint: string;
    fMachine: string;
    fId: Integer;
    fUser: string;
    fIncId: Integer;
    fLastUpdate: String;
    fSession: string;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Init;
    property Id         : Integer  read fId          write fId;
    property IncId      : Integer  read fIncId       write fIncId;
    property Machine    : string   read fMachine     write fMachine;
    property Key        : Integer  read fKey         write fKey;
    property User       : string   read fUser        write fUser;
    property Session    : string   read fSession     write fSession;
    property Hint       : string   read fHint        write fHint;
    property LastUpdate : String   read fLastUpdate  write fLastUpdate;
  end;


implementation

{ Tlp_User }

constructor Tlp_User.Create;
begin
  Init;
end;

destructor Tlp_User.Destroy;
begin

  inherited;
end;

procedure Tlp_User.Init;
begin
  fKey       := 0;
  fHint      := '';
  fMachine   := '';
  fId        := 0;
  fUser      := '';
  fIncId     := 0;
  fLastUpdate:= '';
  fSession   := '';
end;

end.
