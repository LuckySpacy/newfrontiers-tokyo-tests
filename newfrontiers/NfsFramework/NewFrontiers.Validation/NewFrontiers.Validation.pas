unit NewFrontiers.Validation;

interface

uses
  Classes;

type

  IValidator = interface(IInterface)

    ///	<summary>
    ///	  Basisinterface für alle Validator
    ///	</summary>
    function validate(aString: string): boolean;

  end;

  ///	<summary>
  ///	  Basisklasse für alle Validator
  ///	</summary>
  TValidator = class(TInterfacedObject, IValidator)

  protected
    _lastError: string;

  public
    function validate(aString: string): boolean; virtual; abstract;
    function getLastError: string;

  end;


implementation

{ TValidator }

function TValidator.getLastError: string;
begin
  result := _lastError;
end;

end.
