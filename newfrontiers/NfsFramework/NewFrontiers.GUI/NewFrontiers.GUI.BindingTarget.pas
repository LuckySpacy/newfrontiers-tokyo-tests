unit NewFrontiers.GUI.BindingTarget;

interface

  uses NewFrontiers.GUI.Binding, Vcl.Controls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, System.Rtti, System.Classes, SysUtils;

  type

    TBindingTargetProperty = class(TBindingTarget)

      protected
        procedure setTarget(const Value: TObject); override;

      public
        function getValue: TValue; override;
        procedure setValue(aValue: TValue); override;

    end;

    TBindingTargetField = class(TBindingTarget)

      protected
        procedure setTarget(const Value: TObject); override;

      public
        function getValue: TValue; override;
        procedure setValue(aValue: TValue); override;

    end;

    TBindingTargetControl = class(TBindingTargetProperty)

      protected
        _oldOnExit: TNotifyEvent;

        procedure setTarget(const Value: TObject); override;
        procedure targetExit(Sender: TObject);

    end;

    TBindingTargetEdit = class(TBindingTargetControl)

      protected
        procedure setTarget(const Value: TObject); override;

    end;

    TBindingTargetButton = class(TBindingTargetControl)

      protected
        procedure setTarget(const Value: TObject); override;

    end;


    TBindingTargetLabel = class(TBindingTargetProperty)

      protected
        procedure setTarget(const Value: TObject); override;

    end;


    TBindingTargetDateTimePicker = class(TBindingTargetControl)

      protected
        procedure setTarget(const Value: TObject); override;

    end;



implementation

  uses NewFrontiers.Reflection, NewFrontiers.Utility.StringUtil;


{ TBindingTargetProperty }

function TBindingTargetProperty.getValue: TValue;
begin
  if (_target = nil) then
    result := TValue.Empty
  else
    result := TReflectionManager.getPropertyValue(_target, _bindingPath);
end;

procedure TBindingTargetProperty.setTarget(const Value: TObject);
begin
  inherited;
  _target := Value;
end;

procedure TBindingTargetProperty.setValue(aValue: TValue);
begin
  inherited;

  if (_target <> nil) then
    TReflectionManager.setPropertyValue(_target, _bindingPath, aValue);
end;

{ TBindingTargetEdit }

procedure TBindingTargetEdit.setTarget(const Value: TObject);
begin
  inherited;
  _target := Value;
  _bindingPath := 'Text';
end;

{ TBindingTargetLabel }

procedure TBindingTargetLabel.setTarget(const Value: TObject);
begin
  inherited;
  _target := Value;
  _bindingPath := 'Caption';
end;

{ TBindingTargetDateTimePicker }

procedure TBindingTargetDateTimePicker.setTarget(const Value: TObject);
begin
  inherited;
  _target := Value;
  _bindingPath := 'DateTime';
end;

{ TBindingTargetControl }

procedure TBindingTargetControl.setTarget(const Value: TObject);
begin
  inherited;

  _oldOnExit := TEdit(Value).OnExit;
  TEdit(Value).OnExit := targetExit;

end;

procedure TBindingTargetControl.targetExit(Sender: TObject);
begin

  TBindingDictionary.getInstance.propertyChanged(_target, _bindingPath);
  if (assigned(_oldOnExit)) then
    _oldOnExit(_target);

end;

{ TBindingTargetField }

function TBindingTargetField.getValue: TValue;
begin
  if (_target = nil) then
    result := TValue.Empty
  else
    result := TReflectionManager.getFieldValue(_target, _bindingPath);
end;

procedure TBindingTargetField.setTarget(const Value: TObject);
begin
  inherited;
  _target := Value;
end;

procedure TBindingTargetField.setValue(aValue: TValue);
begin
  inherited;

  if (_target <> nil) then
    TReflectionManager.setFieldValue(_target, _bindingPath, aValue);
end;

{ TBindingTargetButton }

procedure TBindingTargetButton.setTarget(const Value: TObject);
begin
  inherited;
  _target := Value;
  _bindingPath := 'Enabled';
end;

initialization

  TBindingTargetFactory.registerTargetClass(TEdit, TBindingTargetEdit);
  TBindingTargetFactory.registerTargetClass(TLabeledEdit, TBindingTargetEdit);
  TBindingTargetFactory.registerTargetClass(TLabel, TBindingTargetLabel);
  TBindingTargetFactory.registerTargetClass(TDateTimePicker, TBindingTargetDateTimePicker);
  TBindingTargetFactory.registerTargetClass(TButton, TBindingTargetButton);

finalization
  if TBindingTargetFactory.getInstance <> nil then
    TBindingTargetFactory.getInstance.Free;

end.
