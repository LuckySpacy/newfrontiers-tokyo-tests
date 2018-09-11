unit NotYetImplementedException;

interface

  uses SysUtils;

  type
    ENotYetImplementedException = class(Exception)

      public
        constructor Create; reintroduce;

    end;


implementation

{ ENotYetImplemented }

constructor ENotYetImplementedException.Create;
begin
  inherited Create('not yet implemented!');
end;

end.

