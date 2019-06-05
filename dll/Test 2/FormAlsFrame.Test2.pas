unit FormAlsFrame.Test2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvUtil, Vcl.Grids, AdvObj, BaseGrid,
  AdvGrid, Vcl.StdCtrls, AdvEdit, AdvEdBtn;

type
  TFormAlsFrame = class(TForm)
    AdvStringGrid1: TAdvStringGrid;
    edt_Bestand: TAdvEditBtn;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FormAlsFrame: TFormAlsFrame;

implementation

{$R *.dfm}

end.
