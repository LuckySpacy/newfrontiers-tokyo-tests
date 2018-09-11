unit nfsCheckListEdit;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls, clisted;

type
  TOnClickCheckObject = procedure(sender: TObject; aObject: TObject) of object;
  TOnStateChanged = procedure(Sender: TObject; var aText: string) of object;


type
  TNfsCheckListEdit = class(TCheckListEdit)
  private
    FOnStateChanged: TOnStateChanged;
    function getAnzeigeText(aValue: string): string;
  protected
    procedure DoClickCheck(Sender: TObject); override;
    procedure StringToCheck(s: string); override;
    procedure DoOnShowCheckList; override;
    function CheckToString: string; override;
  public
  published
    property OnStateChanged: TOnStateChanged read FOnStateChanged write FOnStateChanged;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Samples', [TNfsCheckListEdit]);
end;

{ TNfsCheckListEdit }

function TNfsCheckListEdit.CheckToString: string;
begin
  //inherited;
end;

procedure TNfsCheckListEdit.DoClickCheck(Sender: TObject);
var
  s: string;
begin
  s := '';
  inherited;
  if Assigned(FOnStateChanged) then
  begin
    FOnStateChanged(Self, s);
    Text := s;
  end;
end;

procedure TNfsCheckListEdit.DoOnShowCheckList;
begin
  inherited;
end;

procedure TNfsCheckListEdit.StringToCheck(s: string);
begin
  //inherited;

end;


end.
