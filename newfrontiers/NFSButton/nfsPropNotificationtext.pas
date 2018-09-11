unit nfsPropNotificationtext;

interface

uses
  Classes, SysUtils, Contnrs, Controls, StdCtrls, ExtCtrls, Graphics;

type
  TnfsPropNotificationtext = class(TPersistent)
  private
    fOnChanged: TNotifyEvent;
  protected
  public
    constructor Create;
    destructor Destroy; override;
  published
    property OnChanged: TNotifyEvent read fOnChanged write fOnChanged;
  end;

implementation

{ TnfsPropNotificationtext }

constructor TnfsPropNotificationtext.Create;
begin

end;

destructor TnfsPropNotificationtext.Destroy;
begin

  inherited;
end;

end.
