unit NewFrontiers.Reflection.Helper;

interface

  uses System.Rtti;

  type TRttiTypeHelper = class helper for TRttiType

    public
      function isDateTime: boolean;

  end;

implementation
  uses System.TypInfo;

{ TRttiTypeHelper }

function TRttiTypeHelper.isDateTime: boolean;
begin

  result := (self.TypeKind = tkFloat) and (self.Handle.Name = 'TDateTime');

end;

end.
