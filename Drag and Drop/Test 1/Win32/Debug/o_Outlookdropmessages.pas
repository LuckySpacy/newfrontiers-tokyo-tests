unit o_Outlookdropmessages;

interface

uses
  SysUtils, Classes, o_Outlookdropmessage, Contnrs;

type
  TOutlookDropMessages = class(TObject)
  private
    _List: TObjectList;
    function GetCount: Integer;
    function GetMessage(Index: Integer): TOutlookDropMessage;
  public
    constructor Create;
    destructor Destroy; override;
    property Count: Integer read GetCount;
    function Add: TOutlookDropMessage;
    procedure Clear;
    property Item[Index: Integer]: TOutlookDropMessage read GetMessage;
  end;


implementation

{ TOutlookDropMessages }



constructor TOutlookDropMessages.Create;
begin
  _List := TObjectList.Create;
end;

destructor TOutlookDropMessages.Destroy;
begin
  FreeAndNil(_List);
  inherited;
end;

function TOutlookDropMessages.GetCount: Integer;
begin
  Result := _List.Count;
end;


procedure TOutlookDropMessages.Clear;
begin
  _List.Clear;
end;


function TOutlookDropMessages.Add: TOutlookDropMessage;
begin
  Result := TOutlookDropMessage.Create;
  _List.Add(Result);
end;

function TOutlookDropMessages.GetMessage(Index: Integer): TOutlookDropMessage;
begin
  Result := nil;
  if Index > _List.Count -1 then
    exit;
  Result := TOutlookDropMessage(_List[Index]);
end;

end.
