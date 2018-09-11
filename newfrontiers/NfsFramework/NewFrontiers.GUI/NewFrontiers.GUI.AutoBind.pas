unit NewFrontiers.GUI.AutoBind;

interface
  uses Classes, System.Rtti, NewFrontiers.GUI.Binding;

  type
    ///	<summary>
    ///	  Diese Klasse kann verwendet werden um die Binding-Group automatisch
    ///	  einrichten zu lassen. Es wird nach Controls gesucht, deren Name einer
    ///	  Eigenschaft (Property) des Context-Objekts entspricht. Es wird das
    ///	  Standard-Binding für dieses Control verwendet.
    ///	</summary>
    TAutoBind = class

    protected
      _context: TObject;
      _bindingGroup: TBindingGroup;
      _typeInfo: TRttiInstanceType;

      procedure addToBindingGroup(aParentControl: TComponent);

    public

      ///	<summary>
      ///	  Das Context-Objekt gegen das die Eingabefelder gebunden werden soll
      ///	</summary>
      property Context: TObject read _context write _context;

      ///	<summary>
      ///	  Durchsucht das Parent-Control und stellt die Bindings her
      ///	</summary>
      procedure setup(aParentControl: TComponent);

  end;

implementation
  uses NewFrontiers.Reflection, Vcl.Controls;

{ TAutoBind }

procedure TAutoBind.addToBindingGroup(aParentControl: TComponent);
var i: integer;
    curComponent: TComponent;
    curProperty: TRttiProperty;
begin

  for i := 0 to aParentControl.ComponentCount-1 do
  begin

    curComponent := aParentControl.Components[i];

    // Falls es kein Control ist können wir es überspringen
    if (not (curComponent is TControl)) then continue;

    // Passende Property suchen
    for curProperty in _typeInfo.GetProperties do
    begin

      if (curComponent.Name = curProperty.Name) then
      begin
        _bindingGroup.addBinding(curComponent as TControl, curProperty.Name);
        break;
      end;

    end;

    // Rekursion
    addToBindingGroup(curComponent);

  end;

end;

procedure TAutoBind.setup(aParentControl: TComponent);
begin

  _bindingGroup := TBindingGroup.Create;
  _typeInfo := TReflectionManager.getInfoForClass(Context.ClassType);

  addToBindingGroup(aParentControl);

  _bindingGroup.Context := Context;

end;

end.
