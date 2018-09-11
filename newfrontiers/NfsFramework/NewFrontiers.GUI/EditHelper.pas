unit EditHelper;

interface

  uses
    Vcl.StdCtrls, Generics.Collections, NewFrontiers.Validation.Validator;

  type
    TEditHelper = class helper for TEdit

        _validators: TObjectList<IValidator>;

        procedure validationFailed;
        procedure validationPassed;

      public
        function validate: boolean;
        procedure addValidator(aValidator: IValidator);

    end;

implementation
  uses Vcl.Graphics;

{ TEditHelper }

procedure TEditHelper.addValidator(aValidator: IValidator);
begin

  if (_validators = nil) then
    _validators := TObjectList<IValidator>.Create;

  _validators.add(aValidator);

end;

function TEditHelper.validate: boolean;
var
  aktValidator: IValidator;
begin

  result := true;

  if (_validators <> nil) then
  begin

    for aktValidator in _validators do
    begin

      result := result and aktValidator.validate(self.Text);

      if (not result) then
      begin
        validationFailed;
        break;
      end;

    end;

  end;


end;

procedure TEditHelper.validationFailed;
begin

  self.Font.Color := clWhite;
  self.Color := clRed;

end;

procedure TEditHelper.validationPassed;
begin

  // TODO: Hier die richtigen Windows-Konstanten benutzen

  self.Font.Color := clBlack;
  self.Color := clWhite;

end;

end.
