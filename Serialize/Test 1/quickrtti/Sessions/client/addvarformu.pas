unit addvarformu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TAddVariableForm = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddVariableForm: TAddVariableForm;

implementation

{$R *.DFM}

procedure TAddVariableForm.FormShow(Sender: TObject);
begin
edit1.text:='';
memo1.text:='';
end;

end.
