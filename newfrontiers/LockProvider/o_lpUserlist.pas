unit o_lpUserlist;

interface

uses
  SysUtils, Classes, Contnrs, o_lpBaseList, o_lpUser;

type
  Tlp_UserList = class(Tlp_BaseList)
  private
    function getUser(Index: Integer): Tlp_User;
  public
    constructor Create; override;
    destructor Destroy; override;
    function Add: Tlp_User;
    property Item[Index: Integer]: Tlp_User read getUser;
  end;

implementation

{ Tlp_UserList }


constructor Tlp_UserList.Create;
begin
  inherited;

end;

destructor Tlp_UserList.Destroy;
begin

  inherited;
end;

function Tlp_UserList.getUser(Index: Integer): Tlp_User;
begin
  Result := nil;
  if Index > fList.Count -1 then
    exit;
  Result := Tlp_User(fList[Index]);
end;


function Tlp_UserList.Add: Tlp_User;
begin
  Result := Tlp_User.Create;
  fList.Add(Result);
end;


end.
