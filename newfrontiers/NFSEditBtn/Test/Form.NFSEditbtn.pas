unit Form.NFSEditbtn;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, NFSEditBtn,
  Vcl.ExtCtrls, nfsButton, Vcl.ImgList;

type
  TForm17 = class(TForm)
    Edit2: TEdit;
    Panel1: TPanel;
    nfsButton1: TnfsButton;
    ImageList1: TImageList;
    ToolbarIcons16px: TImageList;
    ToolbarIcons16px_Num2: TImageList;
    nfsButton2: TnfsButton;
    NFSEditBtn1: TNFSEditBtn;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    NFSEditBtn2: TNFSEditBtn;
    MaskEdit1: TMaskEdit;
    procedure Panel1Click(Sender: TObject);
    procedure NFSEditBtn1EditChanged(Sender: TObject);
    procedure NFSEditBtn1Button1Click(Sender: TObject);
    procedure NFSEditBtn1Button2Click(Sender: TObject);
    procedure NFSEditBtn1EditEnter(Sender: TObject);
    procedure NFSEditBtn1EditExit(Sender: TObject);
    procedure NFSEditBtn1Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure NFSEditBtn1EditMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure NFSEditBtn1EditMouseEnter(Sender: TObject);
    procedure NFSEditBtn1EditMouseLeave(Sender: TObject);
    procedure NFSEditBtn1EditMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure NFSEditBtn1EditMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form17: TForm17;

implementation

{$R *.dfm}

procedure TForm17.Button1Click(Sender: TObject);
begin
  NFSEditBtn1.Button1.Visible := not NFSEditBtn1.Button1.Visible;
end;

procedure TForm17.Button2Click(Sender: TObject);
begin
  NFSEditBtn1.Button2.Visible := not NFSEditBtn1.Button2.Visible;

end;

procedure TForm17.Button3Click(Sender: TObject);
begin
  NFSEditBtn1.Button3.Visible := not NFSEditBtn1.Button3.Visible;
end;

procedure TForm17.NFSEditBtn1Button1Click(Sender: TObject);
begin
  ShowMessage('Button1Click');
end;

procedure TForm17.NFSEditBtn1Button2Click(Sender: TObject);
begin
  ShowMessage('Button2Click');
end;

procedure TForm17.NFSEditBtn1Button3Click(Sender: TObject);
begin
  ShowMessage('Button3 Klick');
end;

procedure TForm17.NFSEditBtn1EditChanged(Sender: TObject);
begin
  //Caption := NFSEditBtn1.Edit.Text;
end;

procedure TForm17.NFSEditBtn1EditEnter(Sender: TObject);
begin
  Caption := 'OnEnter';
end;

procedure TForm17.NFSEditBtn1EditExit(Sender: TObject);
begin
  Caption := 'OnExit';
end;

procedure TForm17.NFSEditBtn1EditMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Caption := 'Mouse Down';
end;

procedure TForm17.NFSEditBtn1EditMouseEnter(Sender: TObject);
begin
  Caption := 'Mouse Enter';
end;

procedure TForm17.NFSEditBtn1EditMouseLeave(Sender: TObject);
begin
  Caption := 'Mouse Leave';
end;

procedure TForm17.NFSEditBtn1EditMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
//  Caption := 'Mouse Move';
 // NFSEditBtn1.Hint := 'Das ist ein Hint';
  //NfsEditBtn1.ShowHint := true;
end;

procedure TForm17.NFSEditBtn1EditMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Caption := 'Mouse Up';
end;

procedure TForm17.Panel1Click(Sender: TObject);
begin
  nfsEditBtn1.Edit.Color := clRed;
//  NFSEditBtn1.Text := 'Thomas';
//  NFSEditBtn1.Button2.Visible := not NFSEditBtn1.Button2.Visible;
//  NFSEditBtn1.Enabled := not NFSEditBtn1.Enabled;
//  NFSEditBtn1.Button1.Enabled := false;
//  NFSEditBtn1.Button1.Visible := not NFSEditBtn1.Button1.Visible;
  //nfseditbtn1.Edit.Text := 'Thomas';
  //NFSEditBtn1.Edit.Font.Color := clRed;
end;

end.
