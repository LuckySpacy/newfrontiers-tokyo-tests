unit Objekt.OptionList;

interface

uses
  SysUtils, Classes, Contnrs, Objekt.BaseList, Objekt.Option;

type
  TOptionList = class(TBaseList)
  private
    function getOption(Index: Integer): TOption;
  public
    constructor Create; override;
    destructor Destroy; override;
    function Add: TOption;
    property Item[Index: Integer]: TOption read getOption;
    procedure SaveToFile(aFullFilename: string);
    procedure LoadFromFile(aFullFilename: string);
    procedure LoadFromString(aValue: string);
    procedure Delete(aId: Integer);
  end;

implementation

{ TOptionList }

uses
  Objekt.Allgemein;


constructor TOptionList.Create;
begin
  inherited;
end;


destructor TOptionList.Destroy;
begin

  inherited;
end;


function TOptionList.Add: TOption;
begin
  Result := TOption.Create;
  inc(fId);
  Result.Id := fId;
  fList.Add(Result);
end;

function TOptionList.getOption(Index: Integer): TOption;
begin
  Result := nil;
  if Index > fList.Count -1 then
    exit;
  Result := TOption(fList[Index]);
end;


procedure TOptionList.LoadFromFile(aFullFilename: string);
var
  Liste : TStringList;
  Plain: string;
begin
  if not FileExists(aFullFilename) then
    exit;
  Liste := TStringList.Create;
  try
    Liste.LoadFromFile(aFullFilename);
    Plain := AllgemeinObj.Entschluesseln(Liste.Text);
    LoadFromString(Plain);
  finally
    FreeAndNil(Liste);
  end;

end;


                             {
procedure TOptionList.LoadFromFile(aFullFilename: string);
var
  Liste : TStringList;
  i1: Integer;
  Option: TOption;
begin
  fList.Clear;
  if not FileExists(aFullFilename) then
    exit;
  Liste := TStringList.Create;
  try
    Liste.LoadFromFile(aFullFilename);
    for i1 := 0 to Liste.Count -1 do
    begin
      Option := Add;
      Option.setCSVLine(Liste.Strings[i1]);
    end;
  finally
    FreeAndNil(Liste);
  end;
end;
}

procedure TOptionList.LoadFromString(aValue: string);
var
  Liste : TStringList;
  i1: Integer;
  Option: TOption;
begin
  fList.Clear;
  Liste := TStringList.Create;
  try
    Liste.Text := aValue;
    for i1 := 0 to Liste.Count -1 do
    begin
      Option := Add;
      Option.setCSVLine(Liste.Strings[i1]);
    end;
  finally
    FreeAndNil(Liste);
  end;
end;

procedure TOptionList.SaveToFile(aFullFilename: string);
var
  i1: Integer;
  Liste: TStringList;
  s: string;
begin
  if FileExists(aFullFilename) then
    DeleteFile(aFullFilename);
  Liste := TStringList.Create;
  try
    for i1 := 0 to fList.Count -1 do
    begin
      s := TOption(fList.Items[i1]).getCSVLine;
      Liste.Add(s);
    end;
    Liste.Text := AllgemeinObj.Verschluesseln(Liste.Text);
    Liste.SaveToFile(aFullFilename);
  finally
    FreeAndNil(Liste);
  end;
end;


procedure TOptionList.Delete(aId: Integer);
var
  i1: Integer;
begin
  for i1 := 0 to fList.Count -1 do
  begin
    if TOption(fList.Items[i1]).Id = aId then
    begin
      fList.Delete(i1);
      exit;
    end;
  end;
end;


end.
