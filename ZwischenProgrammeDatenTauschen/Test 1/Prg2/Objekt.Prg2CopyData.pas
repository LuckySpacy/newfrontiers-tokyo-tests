unit Objekt.Prg2CopyData;

interface

uses
  SysUtils, Classes, Vcl.Controls, Winapi.Messages;


type
  TNewMessage = procedure(Sender: TObject; aNewMessage: string) of object;

type
  TPrg2CopyData = class(TComponent)
  private
    fOnNewMessage: TNewMessage;
    procedure WMCopyData(var Msg: TWMCopyData); message WM_COPYDATA;
  public
    property OnNewMessage: TNewMessage read fOnNewMessage write fOnNewMessage;
  end;

implementation

{ TPrg2CopyData }

procedure TPrg2CopyData.WMCopyData(var Msg: TWMCopyData);
var
  s : UTF8String;
  NewMsg: string;
begin

  if (Msg.CopyDataStruct <> nil) and (Msg.CopyDataStruct.dwData = 1) then
  begin
    SetString(s, PAnsiChar(Msg.CopyDataStruct.lpData), Msg.CopyDataStruct.cbData);
    NewMsg := String(s);
    if Assigned(fOnNewMessage) then
      fOnNewMessage(Self, NewMsg);
  end
  else
  inherited;

end;

end.
