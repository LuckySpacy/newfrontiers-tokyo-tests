unit NewFrontiers.GUI.StringGridAdapter;

interface

uses AdvGrid, BaseGrid, AdvObj, Generics.Collections, NewFrontiers.GUI.Binding, NewFrontiers.Reflection, System.TypInfo;

type

  TBoundColumn = class

  protected
    _propertyName: string;
    _header: string;

  public
    property PropertyName: string read _propertyName write _propertyName;
    property Header: string read _header write _header;

  end;


  ///	<summary>
  ///	  Für jede Zelle eines Grids wird ein BoundCell-Objekt angelegt und im
  ///	  Grid verankert. Es stellt die Beziehung zwischen dem reinen String-Grid
  ///	  und den jeweiligen Enitäten dar.
  ///	</summary>
  TBoundCell = class

    protected
      _value: string;
      _grid: TAdvStringGrid;
      _x, _y: integer;
      _kind: TTypeKind;
      _source: TObject;
      _binding: TBinding;

      procedure setValue(const Value: string);

    public
      property Value: string read _value write setValue;
      property Grid: TAdvStringGrid read _grid write _grid;
      property X: integer read _x write _x;
      property Y: integer read _y write _y;
      property Kind: TTypeKind read _kind write _kind;
      property Source: TObject read _source write _source;
      property Binding: TBinding read _binding write _binding;

      destructor Destroy; override;

      procedure updateGrid;
      procedure cellUpdated(aNewValue: string);


  end;

  ///	<summary>
  ///	  Der String-Grid Adapter verwaltet die Bindungen einer Liste
  ///	  (DataSource) zu einem AdvStringGrid. Zu diesem Zweck hängt er sich an
  ///	  die jeewiligen Events.
  ///	</summary>
  TStringGridAdapter<T: class> = class
  private
    procedure HeaderSetzen;
    procedure datensatzEintragen(aktObject: T; y: Integer);
    procedure setSelected(const Value: T);

  protected
    _grid: TAdvStringGrid;
    _dataSource: TList<T>;
    _columns: TObjectList<TBoundColumn>;
    _selected: T;
    _UseFieldBinding: boolean;  // TODO: Orderntlich machen
    _settingUp: boolean;

    procedure gridEditCellDone(Sender: TObject; ACol, ARow: Integer);
    procedure gridGetEditorType(Sender: TObject; ACol, ARow: Integer; var AEditor: TEditorType);
    procedure gridRowChanging(Sender: TObject; OldRow, NewRow: Integer; var Allow: Boolean);

    procedure listNotify(Sender: TObject; const Item: T; Action: TCollectionNotification);


    procedure setupGrid;
    procedure setupDataSource;

  public
    constructor Create;
    destructor Destroy; override;

    property Grid: TAdvStringGrid read _grid write _grid;
    property DataSource: TList<T> read _dataSource write _dataSource;
    property Selected: T read _selected write setSelected;
    property UseFieldBinding: boolean read _UseFieldBinding write _UseFieldBinding;

    ///	<summary>
    ///	  Bereitet den Adapter und die beteiligten Klassen auf die Verwendung
    ///	  vor. Kann erst aufgerufen werden wenn Grid und Datasource gesetzt
    ///	  wurden.
    ///	</summary>
    procedure setup;

    ///	<summary>
    ///	  Fügt dem Grid eine Spalte hinzu
    ///	</summary>
    ///	<param name="aProperty">
    ///	  Name der Property, die in der Spalte angezeigt werden soll
    ///	</param>
    ///	<param name="aHeader">
    ///	  Überschrift der Spalte. Wird keine Überschrift angegeben wird der
    ///	  Name der Property angezeigt.
    ///	</param>
    procedure addColumn(aProperty: string; aHeader: string = '');

  end;

implementation

uses NewFrontiers.Reflection.ValueConvert,
  System.Rtti, SysUtils, NewFrontiers.GUI.BindingTarget, Math;

{ TStringGridAdapter }

procedure TStringGridAdapter<T>.addColumn(aProperty, aHeader: string);
var
  columnToAdd: TBoundColumn;
begin

  if (aHeader = '') then
    aHeader := aProperty;

  columnToAdd := TBoundColumn.Create;
  columnToAdd.PropertyName := aProperty;
  columnToAdd.Header := aHeader;

  _columns.add(columnToAdd);
end;

procedure TStringGridAdapter<T>.datensatzEintragen(aktObject: T; y: Integer);
var
  aktColumn: TBoundColumn;
  bound: TBoundCell;
  binding: TBinding;
  x: integer;
begin

  // TODO: Hier könnte es von Vorteil sein statt der Einzelbindungen
  // eine BindingGroup zu verwenden je Datensatz

  x := 0;

  for aktColumn in _columns do
  begin
    bound := TBoundCell.Create;
    bound.Source := aktObject;
    bound.Grid := _grid;
    bound.X := x;
    bound.Y := y;

    binding := TBinding.Create;
    binding.Target := TBindingTargetFactory.createTarget(bound, 'Value');
    // TODO: Anders machen
    if (self.UseFieldBinding) then
      binding.Source := TBindingTargetFactory.createFieldTarget(aktObject, aktColumn.PropertyName)
    else
      binding.Source := TBindingTargetFactory.createTarget(aktObject, aktColumn.PropertyName);
    binding.registerWithDictionary;

    bound.Binding := binding;
    grid.Objects[x, y] := bound;

    inc(x);
  end;

end;

procedure TStringGridAdapter<T>.HeaderSetzen;
var
  aktColumn: TBoundColumn;
  i: Integer;
begin
  // Header
  i := 0;
  for aktColumn in _columns do
  begin
    Grid.Cells[i, 0] := aktColumn.Header;
    inc(i);
  end;
end;

constructor TStringGridAdapter<T>.Create;
begin
  _columns := TObjectList<TBoundColumn>.Create(true);
end;

destructor TStringGridAdapter<T>.Destroy;
var i,j: integer;
begin

  Grid.OnEditCellDone := nil;
  Grid.OnGetEditorType := nil;
  Grid.OnRowChanging := nil;
  _dataSource.OnNotify := nil;

  if (_grid <> nil) then
  begin

    // BoundCells freigeben
    for i := 0 to _grid.ColCount-1 do
    begin
      for j := 0 to _grid.RowCount-1 do
      begin
        if (Grid.Objects[i, j] <> nil) then
        begin
          Grid.Objects[i, j].Free;
          Grid.Objects[i, j] := nil;
        end;
      end;
    end;

    _grid.ClearNormalCells;
  end;

  _columns.Free;

  inherited;
end;

procedure TStringGridAdapter<T>.gridEditCellDone(Sender: TObject; ACol,
  ARow: Integer);
begin

  if (grid.Objects[aCol, aRow] = nil) then exit;

  TBoundCell(grid.Objects[aCol, aRow]).cellUpdated(grid.Cells[aCol, aRow]);
end;

procedure TStringGridAdapter<T>.gridGetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);
begin

  if (grid.Objects[aCol, aRow] <> nil) then
  begin

    // TODO: Richtigen Editor auswählen

  end;

end;

procedure TStringGridAdapter<T>.gridRowChanging(Sender: TObject; OldRow,
  NewRow: Integer; var Allow: Boolean);
begin

  if (grid.Objects[0, NewRow] <> nil) then
    Selected := TBoundCell(grid.Objects[0, NewRow]).Source as T;

end;

procedure TStringGridAdapter<T>.listNotify(Sender: TObject; const Item: T;
  Action: TCollectionNotification);
var index: integer;
    i: Integer;

begin

  if _settingUp then exit;
  

  if Action = cnAdded then
  begin
    // TODO: Was ist mit Einfügen in der Mitte?

    Grid.BeginUpdate;
    Grid.AddRow;
    datensatzEintragen(Item, Grid.RowCount-1);
    Grid.AutoSizeColumns(true);
    Grid.SelectRows(Grid.RowCount-1, 1);
    Grid.EndUpdate;

    Grid.ScrollInView(0, Grid.RowCount-1);
    Selected := Item;
  end
  else if Action = cnRemoved then
  begin
    Grid.BeginUpdate;

    // Zeile suchen
    // Scheinbar wird das Item erst entfernt und dann das Notify-Ereignis aufgerufen
    // Für unseren Zweck natütlich denkbar ungeeignet. Als Work-Around erst mal
    // die Zeile über das Grid ermitteln
//    index := _dataSource.IndexOf(Item);

    index := -1;
    for i := 0 to _grid.RowCount-1 do
    begin
      if (Grid.Objects[0, i] <> nil) and (TBoundCell(Grid.Objects[0, i]).Source.GetHashCode = Item.GetHashCode) then
      begin
        index := i;
        break;
      end;
    end;

    for i := 0 to _grid.ColCount-1 do
    begin
      if (Grid.Objects[i, index] <> nil) then
        Grid.Objects[i, index].Free;
    end;

    Grid.RemoveRows(index, 1); // +1 da ja noch der Header dazu kommt
    Grid.EndUpdate;
  end
  else if Action = cnExtracted then
    // TODO

end;

procedure TStringGridAdapter<T>.setSelected(const Value: T);
var gridIndex: integer;
begin
  _selected := Value;

  TBindingDictionary.getInstance.propertyChanged(self, 'Selected');
end;

procedure TStringGridAdapter<T>.setup;
begin


  if (Grid = nil) then
    raise EArgumentException.Create('Es wurde noch kein Grid gesetzt');

  if (DataSource = nil) then
    raise EArgumentException.Create('Es wurde noch keine DataSource gesetzt');

  _settingUp := true;

  setupDataSource;
  setupGrid;

  _settingUp := false;

end;

procedure TStringGridAdapter<T>.setupDataSource;
begin

  // Bindet an das OnNotify der Liste
  _dataSource.OnNotify := listNotify;

end;

procedure TStringGridAdapter<T>.setupGrid;
var
  aktObject: T;
  x, y: integer;
  converter: TValueConverter;
  temp: TValue;
begin


  Grid.BeginUpdate;
  Grid.ColCount := _columns.Count;
  Grid.RowCount := max(_dataSource.Count + 1, 2);
  Grid.FixedRows := 1;

  Grid.OnEditCellDone := gridEditCellDone;
  Grid.OnGetEditorType := gridGetEditorType;
  Grid.OnRowChanging := gridRowChanging;

  HeaderSetzen;

  // Daten
  y := 1;
  for aktObject in _dataSource do
  begin
    datensatzEintragen(aktObject, y);
    inc(y);
  end;

  Grid.AutoSizeColumns(true);
  Grid.EndUpdate;

  if (_dataSource.Count > 0) then
    Selected := _dataSource[0];


end;

{ TBoundCell }

procedure TBoundCell.cellUpdated(aNewValue: string);
begin
  _value := aNewValue;
  TBindingDictionary.getInstance.propertyChanged(self, 'Value');
end;

destructor TBoundCell.Destroy;
begin

  // Wenn eine gebundene Zelle zerstört wird, dann muss auch das Binding
  // entfernt werden.
  binding.Destroy;
  binding := nil;

  inherited;

end;

procedure TBoundCell.setValue(const Value: string);
begin
  _value := Value;
  updateGrid;
end;

procedure TBoundCell.updateGrid;
begin
  grid.Cells[x,y] := _value;
end;

end.
