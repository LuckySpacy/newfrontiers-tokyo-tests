unit NewFrontiers.GUI.PropertyChanged;

interface

  type TPropertyChangedObject = class

    protected
      procedure propertyChanged(aPropertyname: string);


  end;


implementation
  uses NewFrontiers.GUI.Binding;


{ TPropertyChangedObject }


procedure TPropertyChangedObject.propertyChanged(aPropertyname: string);
begin

  TBindingDictionary.getInstance.propertyChanged(self, aPropertyname);

end;

end.
