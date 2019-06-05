unit Form.Test2;

interface

uses
  sharemem,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, AdvEdit, Frame.Test2,
  Vcl.ExtCtrls, Form2.Test2, AdvEdBtn, Frame2.Test2, FormAlsFrame.Test2,
  Data.DB, IBX.IBDatabase, IBX.IBSqlMonitor;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Panel2: TPanel;
    IBD: TIBDatabase;
    IBT: TIBTransaction;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    fFrame1: TFrame;
    fFrame2: TFrame;
    fFrameForm: TForm;
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.Button2Click(Sender: TObject);
begin
  IBT.StartTransaction;
  IBT.Commit;
  IBT.CleanupInstance;
  IBD.CloseDataSets;
  IBD.Close;
  IBD.Connected := false;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    {
  fFrame1 := TFrame1.Create(self);
  fFrame1.Parent := Panel1;
  fFrame1.Align  := alClient;
     }
       {
  fFrame2 := TFrame2.Create(self);
  fFrame2.Parent := Panel2;
  fFrame2.Align  := alClient;
        }

 monitorhook.Enabled := false;
 DisableMonitoring;
 fFrameForm := TFormAlsFrame.Create(Self);
 fFrameForm.Parent := Panel2;
 fFrameForm.Align  := alClient;
 fFrameForm.Show;
 IBD.Connected := true;


end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
//  FreeAndNil(fFrame1);
end;


procedure TForm1.Button1Click(Sender: TObject);
var
  Form: TForm2;
begin
  Form := TForm2.Create(nil);
  Form.ShowModal;
  FreeAndNil(Form);
end;


end.
