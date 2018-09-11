unit Objekt.Timer;

interface

uses
  Sysutils, Classes, Vcl.ExtCtrls;


type
  TFormTimer = class
  private
    fTimer: TTimer;
    procedure Timer(Sender: TObject);
  public
    Zahl: Integer;
    constructor Create;
    destructor Destroy; override;
  end;


implementation

{ FormTimer }

constructor TFormTimer.Create;
begin
  fTimer := TTimer.Create(nil);
  fTimer.OnTimer := Timer;
  fTimer.Interval := 5000;
  Zahl := 0;
end;

destructor TFormTimer.Destroy;
begin
  FreeAndNil(fTimer);
  inherited;
end;

procedure TFormTimer.Timer(Sender: TObject);
begin //
  inc(Zahl);
end;

end.
