unit Unit17;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, nfsButton, Vcl.StdCtrls,
  LMDCustomButton, LMDButton, Vcl.ExtCtrls, Vcl.ImgList, nfsEditAutoComplete;

type
  TForm17 = class(TForm)
    Button1: TButton;
    LMDButton1: TLMDButton;
    Label1: TLabel;
    Panel1: TPanel;
    ImageList1: TImageList;
    Icons16px: TImageList;
    Button2: TButton;
    nfsButton1: TnfsButton;
    nfsButton2: TnfsButton;
    nfsButton3: TnfsButton;
    nfsButton4: TnfsButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure nfsButton1Click(Sender: TObject);
    procedure LMDButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure nfsButton2Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_SpeichernClick(Sender: TObject);
    procedure btn_LoschenClick(Sender: TObject);
    procedure btn_AbbrechenClick(Sender: TObject);
    procedure nfsButton1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    procedure WMHotKey(var Msg: TWMHotKey); message WM_HOTKEY;
  public
    { Public-Deklarationen }
  end;

var
  Form17: TForm17;

implementation

{$R *.dfm}


procedure TForm17.btn_AbbrechenClick(Sender: TObject);
begin
  Caption := 'Abbrechen';
end;

procedure TForm17.btn_LoschenClick(Sender: TObject);
begin
  caption := 'Löschen';
end;

procedure TForm17.btn_SpeichernClick(Sender: TObject);
begin
  Caption := 'Speichern';
end;

procedure TForm17.Button1Click(Sender: TObject);
begin
  ShowMessage('Button');
end;

procedure TForm17.Button2Click(Sender: TObject);
begin
//  nfsButton1.Visible := not nfsButton1.Visible;
//  Panel1.Visible := not Panel1.Visible ;
  Panel1.Font.Name := 'Arial';
end;

procedure TForm17.FormCreate(Sender: TObject);
begin
//  fHotKeyID := GlobalAddAtom(PChar(Self.Name + '_Hotkey1'));
//  RegisterHotKey(Handle, fHotKeyID, MOD_CONTROL + MOD_ALT, VK_P);
end;

procedure TForm17.FormDestroy(Sender: TObject);
begin
//  UnRegisterHotKey(Handle, fHotKeyID);
//  GlobalDeleteAtom(fHotKeyID);
end;

procedure TForm17.FormShow(Sender: TObject);
begin
  Button1.SetFocus;
end;

procedure TForm17.LMDButton1Click(Sender: TObject);
begin
  ShowMessage('LMDButton');
end;

procedure TForm17.nfsButton1Click(Sender: TObject);
begin
  ShowMessage('Hallo');
end;

procedure TForm17.nfsButton1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  Caption := 'MouseMove';
end;

procedure TForm17.nfsButton2Click(Sender: TObject);
begin
  ShowMessage('Click');
end;


{
procedure TForm17.LMDButton1Click(Sender: TObject);
begin
  ShowMessage('LMDButton');
end;
}

procedure TForm17.WMHotKey(var Msg: TWMHotKey);
begin
 // if Msg.HotKey = fHotKeyID then
 //   ShowMessage('Ctrl + Alt + P wurde gedrückt !');
end;

end.
