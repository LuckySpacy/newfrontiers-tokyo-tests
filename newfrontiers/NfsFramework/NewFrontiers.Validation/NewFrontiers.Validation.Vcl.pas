unit NewFrontiers.Validation.Vcl;

interface

  uses NewFrontiers.Validation, Vcl.StdCtrls, Generics.Collections, Vcl.Controls,
  NewFrontiers.GUI.PropertyChanged;

  type

    ///	<summary>
    ///	  Der ValidationManager kann verwendet werden, um mehrere Validator
    ///	  gleichzeitig zu testen und ein Gesamtergebnis zu erhalten. Für jedes
    ///	  Control können beliebig viele Validator registriert werden
    ///	</summary>
    TValidationManager = class(TPropertyChangedObject)

      private
        procedure setIsValid(const Value: boolean);

      protected
        _validators: TObjectDictionary<TWinControl, TObjectlist<TValidator>>;
        _isValid: boolean;

      public
        property IsValid: boolean read _isValid write setIsValid;

        constructor Create;
        destructor Destroy; override;

        ///	<summary>
        ///	  Fügt einen Validator für ein Control hinzu
        ///	</summary>
        procedure add(aControl: TWinControl; aValidator: TValidator);

        ///	<summary>
        ///	  Validiert alle registrierten Validator und gibt das
        ///	  Gesamtergebnis zurück.
        ///	</summary>
        function validate: boolean;

    end;


implementation
  uses Vcl.Graphics, Vcl.ExtCtrls, NewFrontiers.Validation.VclHelper, Vcl.Dialogs;

{ TValidationManager }

procedure TValidationManager.add(aControl: TWinControl; aValidator: TValidator);
begin

  if (not _validators.ContainsKey(aControl)) then
    _validators.Add(aControl, TObjectlist<TValidator>.Create(true));

  _validators.Items[aControl].Add(aValidator);

end;

constructor TValidationManager.Create;
begin
  _validators := TObjectDictionary<TWinControl, TObjectlist<TValidator>>.Create([doOwnsValues]);
end;

destructor TValidationManager.Destroy;
begin
  _validators.Free;
  inherited;
end;

procedure TValidationManager.setIsValid(const Value: boolean);
begin
  _isValid := Value;
  propertyChanged('IsValid');
end;

function TValidationManager.validate: boolean;
var
  control: TWinControl;
  validator: TValidator;
  controlIsValid: boolean;
begin

  result := true;

  for control in _validators.Keys do
  begin

    controlIsValid := true;

    for validator in _validators.Items[control] do
    begin

      // Das hier kann man sicher noch überarbeiten
      // Aktuell verwenden wir hier einen Hack. Durch das casten nach TEdit
      // stehen dessen Class Helper zur Verfügung. TLabeldEdit verwendet
      // die gleiochen Felder, so dass man an dieser Stelle den Helper
      // mitbenutzen kann.

      // Ggf. hier keine Class Helper sondern das Adapter Pattern nutzen

      if ((control is TEdit) or (control is TLabeledEdit)) then
      begin
        controlIsValid := controlIsValid and validator.validate(TEdit(control).getValidationText);
      end;

    end;

    if (controlIsValid) then TEdit(control).valid
    else begin
      TEdit(control).invalid;
      result := false;
    end;

  end;

  // Noch was tun? Vielleicht ein Event?
  IsValid := result;


end;

end.
