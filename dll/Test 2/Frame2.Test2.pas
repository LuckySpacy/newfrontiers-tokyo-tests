unit Frame2.Test2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, AdvEdit,
  AdvUtil, Vcl.Grids, AdvObj, BaseGrid, AdvGrid;

type
  TFrame2 = class(TFrame)
    AdvStringGrid1: TAdvStringGrid;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

implementation

{$R *.dfm}

end.
