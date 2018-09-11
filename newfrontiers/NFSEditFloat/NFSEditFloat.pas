unit NFSEditFloat;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls, AdvEdit,
  Winapi.Messages;

type
  TNfsEditFloat = class(TAdvEdit)
  private
    _MinPrecision: smallint;
    _Nullen: string;
    procedure SetMinPrecision(const Value: smallint);
    procedure setFloatFormat;
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
    procedure WMKillFocus(var Msg: TWMKillFocus); message WM_KILLFOCUS;
  protected
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;
  published
    property MinPrecision: smallint read _MinPrecision write SetMinPrecision;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('new frontiers', [TNfsEditFloat]);
end;

{ TNfsEditFloat }


constructor TNfsEditFloat.Create(aOwner: TComponent);
begin
  inherited;
  Precision := -1;
  EditType  := etFloat;
  EditAlign := eaRight;
  SetMinPrecision(2);
  ReturnIsTab := true;
end;

destructor TNfsEditFloat.Destroy;
begin

  inherited;
end;

procedure TNfsEditFloat.CMTextChanged(var Message: TMessage);
begin
  inherited;
  setFloatFormat;
end;


procedure TNfsEditFloat.setFloatFormat;
var
  s : string;
  s1: string;
  iPos : Integer;
  NewValue: string;
  d: double;
begin
  s := StringReplace(Text, '.', '', [rfReplaceAll]);
  d := StrToFloat(s);
  NewValue := FloatToStr(d);

  if _MinPrecision <= 0 then
    exit;

  iPos := Pos(',', NewValue);
  if iPos <= 0 then
  begin
    NewValue := NewValue + ',' + _Nullen;
    if not SameText(NewValue, Text) then
      Text := NewValue;
    exit;
  end;
  s := copy(NewValue, iPos + 1, Length(NewValue));
  s1 := '';
  while Length(s) < _MinPrecision do
  begin
    s1 := s1 + '0';
    s := s + '0';
  end;
  NewValue := NewValue + s1;
  if SameText(Text, NewValue) then
    exit;
  Text := NewValue;
end;

procedure TNfsEditFloat.SetMinPrecision(const Value: smallint);
begin
  _MinPrecision := Value;
  _Nullen := '';
  while Length(_Nullen) < _MinPrecision do
    _Nullen := _Nullen + '0';
  setFloatFormat;
end;

procedure TNfsEditFloat.WMKillFocus(var Msg: TWMKillFocus);
begin
  inherited;
  setFloatFormat;
end;

end.
