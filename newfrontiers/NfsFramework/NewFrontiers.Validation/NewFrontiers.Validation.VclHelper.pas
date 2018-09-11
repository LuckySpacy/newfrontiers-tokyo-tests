unit NewFrontiers.Validation.VclHelper;

interface

  uses
    Vcl.Forms, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Controls;

  type

    TEditHelper = class helper for TEdit

      function getValidationText: string;
      procedure valid;
      procedure invalid;

    end;



implementation

  uses Vcl.Graphics;

{ TEditHelper }

function TEditHelper.getValidationText: string;
begin
  result := self.Text;
end;

procedure TEditHelper.invalid;
begin
  Font.Color := clWhite;
  color := clRed;
end;

procedure TEditHelper.valid;
begin
  Font.Color := clWindowText;
  Color := clWhite;
end;



end.
