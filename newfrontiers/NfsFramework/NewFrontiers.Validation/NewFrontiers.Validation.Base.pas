unit NewFrontiers.Validation.Base;

interface

uses NewFrontiers.Validation;

type
  ///	<summary>
  ///	  Nur Buchstaben
  ///	</summary>
  TValidatorLetter = class(TValidator)

  public
    function validate(aString: string): boolean; override;

  end;

  ///	<summary>
  ///	  Feld muss ausgefüllt werden
  ///	</summary>
  TValidatorRequired = class(TValidator)

  public
    function validate(aString: string): boolean; override;

  end;


  ///	<summary>
  ///	  Nur Zahlen
  ///	</summary>
  TValidatorDigit = class(TValidator)

  public
    function validate(aString: string): boolean; override;

  end;



  ///	<summary>
  ///	  Prüft auf eine gültige E-Mail-Adresse
  ///	</summary>
  TValidatorEmail = class(TValidator)

  public
    function validate(aString: string): boolean; override;

  end;




implementation

uses NewFrontiers.Utility.StringUtil, NewFrontiers.Utility.Exceptions,
  System.Character, RegularExpressions;

{ TValidatorLetter }

function TValidatorLetter.validate(aString: string): boolean;
var
  i: Integer;
begin

  result := true;

  for i := 1 to length(aString) do
    result := result and TCharacter.isLetter(aString[i]);

  if (not result) then
    _lastError := 'Bitte geben Sie in diesem Feld nur Buchstaben ein';

end;

{ TValidatorRequired }

function TValidatorRequired.validate(aString: string): boolean;
begin
  result := not TStringUtil.isEmpty(aString);

  if (not result) then
    _lastError := 'Dieses Feld muss ausgefüllt werden';
end;

{ TValidatorDigit }

function TValidatorDigit.validate(aString: string): boolean;
var
  i: Integer;
begin

  result := true;

  for i := 1 to length(aString) do
    result := result and TCharacter.IsDigit(aString[i]);

  if (not result) then
    _lastError := 'Bitte geben Sie in diesem Feld nur Zahlen ein';

end;

{ TValidatorEmail }

function TValidatorEmail.validate(aString: string): boolean;
var
  mailPattern: TRegEx;
begin

  if (TStringUtil.isEmpty(aString)) then
  begin
    result := true;
    exit;
  end;


  mailPattern := TRegEx.Create('[A-Za-z0-9._-]+@[A-Za-z0-9]+.[A-Za-z.]+');
  result := mailPattern.Match(aString).Success;

  if (not result) then
    _lastError := 'Bitte geben Sie eine gültige EMail-Adresse ein';

end;

end.
