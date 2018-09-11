unit nfsEditAutoComplete;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TNfsOnGetListEvent = procedure(Sender: TObject; aList: TStrings) of object;


type
  TnfsEditAutoComplete = class(TEdit)
  private
    _ListBox: TListBox;
    _Timer: TTimer;
    _SearchInterrupt: Integer;
    _OnGetList: TNfsOnGetListEvent;
    _SearchList: TStringList;
    _SearchByLetters: Integer;
    _MaxItems: Integer;
    _CaseSensitive: Boolean;
    procedure DoTimer(Sender: TObject);
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
    procedure ListBoxKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ListBoxKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ListBoxDblClick(Sender: TObject);
    procedure SetSearchInterrupt(const Value: Integer);
    function getSearchWindowWidth: Integer;
    procedure setSearchWindowWidth(const Value: Integer);
    function getSearchWindowHeight: Integer;
    procedure setSearchWindowHeight(const Value: Integer);
    procedure DoFilterList;
  protected
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyUp(var Key: Word; Shift: TShiftState); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Loaded; override;
    property SearchWindowWidth: Integer read getSearchWindowWidth write setSearchWindowWidth;
    property SearchWindowHeight: Integer read getSearchWindowHeight write setSearchWindowHeight;
    property SearchList: TStringList read _SearchList write _SearchList;
  published
    property OnGetList: TNfsOnGetListEvent read _OnGetList write _OnGetList;
    property SearchInterrupt: Integer read _SearchInterrupt write SetSearchInterrupt;
    property SearchByLetters: Integer read _SearchByLetters write _SearchByLetters;
    property MaxItems: Integer read _MaxItems write _MaxItems;
    property CaseSensitive: Boolean read _CaseSensitive write _CaseSensitive;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('New frontiers', [TnfsEditAutoComplete]);
end;

{ TnfsEditAutoComplete }


constructor TnfsEditAutoComplete.Create(AOwner: TComponent);
begin
  inherited;
  _ListBox := TListBox.Create(Self);
  _ListBox.Visible := false;
  _ListBox.OnKeyUp := ListBoxKeyUp;
  _ListBox.OnKeyDown  := ListBoxKeyDown;
  _listBox.OnDblClick := ListBoxDblClick;
  _ListBox.TabStop   := false;
  _Timer   := TTimer.Create(Self);
  _Timer.Enabled := false;
  _Timer.OnTimer := DoTimer;
  _SearchInterrupt := _Timer.Interval;
  _SearchList := TStringList.Create;
  _SearchList.Duplicates := dupIgnore;
  _SearchList.Sorted := true;
  _SearchByLetters := 1;
  _MaxItems := 0;
  AutoSelect := false;
  _CaseSensitive := false;
end;

destructor TnfsEditAutoComplete.Destroy;
begin
  FreeAndNil(_SearchList);
  inherited;
end;

procedure TnfsEditAutoComplete.CMExit(var Message: TCMExit);
begin
  if not _ListBox.Focused then
    _ListBox.Visible := false;
end;


procedure TnfsEditAutoComplete.DoFilterList;
var
  s: string;
  i1: Integer;
  Laenge: Integer;
begin
  s := Text;
  Laenge := Length(s);
  _ListBox.Clear;
  for i1 := 0 to _SearchList.Count -1 do
  begin
    if _CaseSensitive then
    begin
      if s = copy(_SearchList.Strings[i1], 1, Laenge) then
        _ListBox.Items.Add(_SearchList.Strings[i1]);
    end
    else
    begin
      if SameText(s, copy(_SearchList.Strings[i1], 1, Laenge)) then
        _ListBox.Items.Add(_SearchList.Strings[i1]);
    end;
    if (_MaxItems > 0) and (_ListBox.Items.Count >= _MaxItems) then
      break;
  end;
  if _ListBox.Count = 1 then
  begin
    if SameText(Trim(Text), Trim(_ListBox.Items[0])) then
      _ListBox.Clear; // Auswahlbox muss nicht angezeigt werden, wenn der einzige Eintrag mit dem im Editfeld gleich ist.
  end;
  _ListBox.Visible := _ListBox.Items.Count > 0;
end;

procedure TnfsEditAutoComplete.DoTimer(Sender: TObject);
var
  Cur: TCursor;
begin
  _Timer.Enabled   := false;
  _ListBox.Parent  := Parent;
  _ListBox.Left    := Left;
  _ListBox.Top     := Top + Height;
  Cur := Parent.Cursor;
  Cursor := crHourGlass;
  Parent.Cursor := crHourglass;
  try
    if _SearchList.Count > 0 then
    begin
      DoFilterList;
      exit;
    end;
    if Assigned(_OnGetList) then
    begin
      _Listbox.Items.Clear;
      _OnGetList(Self, _ListBox.Items);

      if _ListBox.Count = 1 then
      begin
        if SameText(Trim(Text), Trim(_ListBox.Items[0])) then
          _ListBox.Clear; // Auswahlbox muss nicht angezeigt werden, wenn der einzige Eintrag mit dem im Editfeld gleich ist.
      end;
      _ListBox.Visible := _ListBox.Items.Count > 0;

    end;
  finally
    Cursor := crDefault;
    Parent.Cursor := Cur;
  end;
end;


function TnfsEditAutoComplete.getSearchWindowHeight: Integer;
begin
  Result := _ListBox.Height;
end;

function TnfsEditAutoComplete.getSearchWindowWidth: Integer;
begin
  Result := _ListBox.Width;
end;

procedure TnfsEditAutoComplete.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  _Timer.Enabled := false;
end;

procedure TnfsEditAutoComplete.KeyUp(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = 40 then
  begin
    _ListBox.SetFocus;
    if _ListBox.Items.Count > 0 then
      _ListBox.ItemIndex := 0;
    exit;
  end;
  if (((Key >= 35) and (Key <=39)) or (Key = 9)) then
    exit;

  if Length(Text) < _SearchByLetters then
  begin
    _ListBox.Visible := false;
    exit;
  end;

  _Timer.Enabled := true;
end;

procedure TnfsEditAutoComplete.ListBoxDblClick(Sender: TObject);
begin
  Text := _ListBox.Items[_ListBox.ItemIndex];
  _ListBox.Visible := false;
  SetFocus;
end;

procedure TnfsEditAutoComplete.ListBoxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = 38) and (_ListBox.ItemIndex = 0) then
  begin
    SetFocus;
    _ListBox.ItemIndex := -1;
  end;
  SelStart := Length(Text);
end;

procedure TnfsEditAutoComplete.ListBoxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if _ListBox.ItemIndex < 0 then
    exit;
  if Key <> 13 then
    exit;
  Text := _ListBox.Items[_ListBox.ItemIndex];
  _ListBox.Visible := false;
  SetFocus;
  SelStart := Length(Text);
end;

procedure TnfsEditAutoComplete.Loaded;
begin
  inherited;
  _ListBox.Width := Width;
end;

procedure TnfsEditAutoComplete.SetSearchInterrupt(const Value: Integer);
begin
  _SearchInterrupt := Value;
  _Timer.Interval  := Value;
end;

procedure TnfsEditAutoComplete.setSearchWindowHeight(const Value: Integer);
begin
  _ListBox.Height := Value;
end;

procedure TnfsEditAutoComplete.setSearchWindowWidth(const Value: Integer);
begin
  _Listbox.Width := Value;
end;

end.
