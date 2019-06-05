unit Frame.Test2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, AdvEdit,
  AdvEdBtn;

type
  TFrame1 = class(TFrame)
    Edit1: TEdit;
    edt_Bestand: TAdvEditBtn;
  private
    constructor Create(AOwner: TComponent); override;
  public
    { Public-Deklarationen }
  end;

implementation

{$R *.dfm}

{ TFrame1 }

constructor TFrame1.Create(AOwner: TComponent);
begin
  inherited;
  //edt_Bestand.Handle := Handle;
end;

end.
