unit Form.CopyFile;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Objekt.Dateikopieren;

type
  Tfrm_CopyFile = class(TForm)
    Bevel1: TBevel;
    lbl_Von: TLabel;
    lbl_Nach: TLabel;
    pg: TProgressBar;
    Bevel2: TBevel;
    btn_Cancel: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
  private
    fDateiKopieren: TDateiKopieren;
    fOnAfterCopy: TNotifyEvent;
    procedure DoProgress(aFileSize, aBytesTransferred: Int64);
    procedure FileSize(aFileSize: Int64);
    procedure AfterCopy(Sender: TObject);
  public
    property OnAfterCopy: TNotifyEvent read fOnAfterCopy write fOnAfterCopy;
    procedure CopyFile(aSource, aDest: String);
  end;

var
  frm_CopyFile: Tfrm_CopyFile;

implementation

{$R *.dfm}




procedure Tfrm_CopyFile.FormCreate(Sender: TObject);
var
  HR: HRgn;
//  p:array[0..3] of TPoint;
begin
  fDateiKopieren := TDateiKopieren.Create;
  fDateiKopieren.OnFileSize := FileSize;
  fDateiKopieren.OnProgress := DoProgress;
  fDateiKopieren.OnAfterCopy := AfterCopy;
             {
  p[0]:=Point(Width div 2,1);
  p[1]:=Point(1, Height div 2);
  p[2]:=Point(Width div 2,Height);
  p[3]:=Point(Width, Height div 2);
  }
  {
  p[0]:=Point(10,1);
  p[1]:=Point(1, 10);
  p[2]:=Point(10,Height);
  p[3]:=Point(Width, 10);
  }
  //HR:= CreateEllipticRgn (0, 0, Width, Height);
  //HR:= CreateRoundRectRgn (0, 0, clientWidth, clientHeight, 30, 30);
  //SetWindowRgn(Handle, HR, True);

end;

procedure Tfrm_CopyFile.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fDateiKopieren);
end;


procedure Tfrm_CopyFile.AfterCopy(Sender: TObject);
begin
  if Assigned(fOnAfterCopy) then
    fOnAfterCopy(Self);
end;

procedure Tfrm_CopyFile.btn_CancelClick(Sender: TObject);
begin
  fDateiKopieren.Cancel := true;
end;

procedure Tfrm_CopyFile.CopyFile(aSource, aDest: String);
begin
  lbl_Von.Caption  := 'Von: ' + aSource;
  lbl_Nach.Caption := 'Nach: ' + aDest;
  fDateiKopieren.CopyFile(aSource, aDest);
end;

procedure Tfrm_CopyFile.DoProgress(aFileSize, aBytesTransferred: Int64);
begin
  pg.Position := aBytesTransferred;
  Application.ProcessMessages;
end;

procedure Tfrm_CopyFile.FileSize(aFileSize: Int64);
begin
  pg.Position := 0;
  pg.Max := aFileSize;
end;



end.
