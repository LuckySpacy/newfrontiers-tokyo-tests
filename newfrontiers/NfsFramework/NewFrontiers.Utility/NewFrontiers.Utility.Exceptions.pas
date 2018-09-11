unit NewFrontiers.Utility.Exceptions;

interface

  uses SysUtils;

  type
    ENotYetImplementedException = class(ENotImplemented)

      public
        constructor Create; reintroduce;

    end;

implementation

{ ENotYetImplementedException }

constructor ENotYetImplementedException.Create;
begin
  inherited Create('not yet implemented!');
end;

end.
