unit nfsPropPos;

interface

uses
  Classes, SysUtils, Contnrs, Controls, StdCtrls, ExtCtrls, Graphics;

type
  TnfsPropPos = class(TPersistent)
  private
    fRight: Integer;
    //FBottom: Integer;
    fTop: Integer;
    fLeft: Integer;
    fOnChanged: TNotifyEvent;
    //procedure SetBottom(const Value: Integer);
    procedure SetLeft(const Value: Integer);
    procedure SetRight(const Value: Integer);
    procedure setTop(const Value: Integer);
  protected
  public
    constructor Create;
    destructor Destroy; override;
  published
    property Left: Integer read fLeft write SetLeft;
    property Right: Integer read fRight write SetRight;
    property Top: Integer read fTop write setTop;
    //property Bottom: Integer read FBottom write SetBottom;
    property OnChanged: TNotifyEvent read fOnChanged write fOnChanged;
  end;

implementation

{ TnfPropPos }

constructor TnfsPropPos.Create;
begin

end;

destructor TnfsPropPos.Destroy;
begin

  inherited;
end;

{
procedure TnfPropPos.SetBottom(const Value: Integer);
begin
  FBottom := Value;
  if Assigned(fOnChanged) then
    fOnChanged(Self);
end;
}
procedure TnfsPropPos.SetLeft(const Value: Integer);
begin
  fLeft := Value;
  if Assigned(fOnChanged) then
    fOnChanged(Self);
end;


procedure TnfsPropPos.SetRight(const Value: Integer);
begin
  fRight := Value;
  if Assigned(fOnChanged) then
    fOnChanged(Self);
end;

procedure TnfsPropPos.setTop(const Value: Integer);
begin
  fTop := Value;
  if Assigned(fOnChanged) then
    fOnChanged(Self);
end;

end.
