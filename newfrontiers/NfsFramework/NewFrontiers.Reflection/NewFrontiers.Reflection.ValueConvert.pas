unit NewFrontiers.Reflection.ValueConvert;

interface

  uses System.TypInfo, System.Rtti;


  type

    TTypeKindSet = set of TTypeKind;

    TValueConverter = class

      public
        class function convertTo(aValue: TValue; aTarget: PTypeInfo): TValue;

    end;


implementation
  uses SysUtils;

{ TValueConverter }

class function TValueConverter.convertTo(aValue: TValue;
  aTarget: PTypeInfo): TValue;
var
  ordinalSet, stringSet, floatSet: TTypeKindSet;
begin

  if (aValue.Kind = aTarget.Kind) then
  begin
    result := aValue;
    exit;
  end;


  ordinalSet := [tkInteger, tkInt64, tkChar, tkEnumeration];
  stringSet := [tkString, tkUString];
  floatSet := [tkFloat];

  result := TValue.Empty;


  // Quelle: Ordinal
  if (aValue.Kind in ordinalSet) then
  begin

    // Ziel: Ordinal
    if (aTarget.Kind in ordinalSet) then
      result := TValue.FromOrdinal(aTarget, aValue.AsOrdinal)

    // Ziel String
    else if (aTarget.Kind in stringSet) then
      result := TValue.From<string>(IntToStr(aValue.asOrdinal))


  end

  // Quelle: String
  else if (aValue.Kind in stringSet) then
  begin

    // ZIel: Ordinal
    if (aTarget.Kind in ordinalSet) then
      result := TValue.From<integer>(StrToInt(aValue.AsString))

    else if (aTarget.Kind in floatSet) and (aTarget.Name = 'TDateTime') then
      result := TValue.From<Extended>(StrToDateTime(aValue.AsString))

    else if (aTarget.Kind in floatSet) then
      result := TValue.From<Extended>(StrToFloat(aValue.AsString));

  end

  // Quelle: DateTime
  else if (aValue.Kind in floatSet) and (aValue.TypeInfo.Name = 'TDateTime') then
  begin

    if (aTarget.Kind in stringSet) then
        result := TValue.From<string>(DateTimeToStr(aValue.AsExtended));

  end


  // Quelle: Float
  else if (aValue.Kind in floatSet) then
  begin

    if (aTarget.Kind in stringSet) then
        result := TValue.From<string>(FloatToStr(aValue.AsExtended));

  end;






end;

end.
