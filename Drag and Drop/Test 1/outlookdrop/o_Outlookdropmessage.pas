unit o_Outlookdropmessage;

interface

uses
  SysUtils, Classes, vcl.controls;

type
  TOutlookDropMessage = class(TObject)
  private
    _An: string;
    _Von: string;
    _Betreff: string;
    _Bodytext: string;
    _Von_eMail: string;
    _Data: TCustomData;
  public
    constructor Create;
    destructor Destroy; override;
    property Von: string read _Von write _Von;
    property Von_eMail: string read _Von_eMail write _Von_eMail;
    property An: string read _An write _An;
    property Betreff: string read _Betreff write _Betreff;
    property Bodytext: string read _Bodytext write _Bodytext;
    property Data: TCustomData read _Data write _Data;
  end;


implementation

{ TOutlookDropMessage }

constructor TOutlookDropMessage.Create;
begin
  _An := '';
  _Von := '';
  _Betreff := '';
  _Bodytext := '';
  _Von_eMail := '';
  _Data := nil;
end;

destructor TOutlookDropMessage.Destroy;
begin
  if Assigned(_Data) then
    FreeAndNil(_Data);
  inherited;
end;

end.
