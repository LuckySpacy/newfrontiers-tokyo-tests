unit uNFSDatePickerTest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, NFSCustomEdit, NFSCustomMaskEdit,
  NFSMaskButtonedEdit, NFSDatePicker, Vcl.StdCtrls, NFSComboBox,
  nfsEditAutoComplete, AdvEdit;

type
  TForm16 = class(TForm)
    NFSDatePicker1: TNFSDatePicker;
    NFSDatePicker2: TNFSDatePicker;
    NFSMaskButtonedEdit1: TNFSMaskButtonedEdit;
    nfsEditAutoComplete1: TnfsEditAutoComplete;
    NFSComboBox1: TNFSComboBox;
    AdvEdit1: TAdvEdit;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form16: TForm16;

implementation

{$R *.dfm}

end.
