unit Form.BackupTest1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IBX.IBServices,
  Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    Backup: TIBBackupService;
    Memo1: TMemo;
    Panel1: TPanel;
    Button1: TButton;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure BackupLogin(Database: TIBCustomService; LoginParams: TStrings);
    procedure BackupAttach(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.BackupAttach(Sender: TObject);
begin
 Showmessage('Fertig');
end;

procedure TForm2.BackupLogin(Database: TIBCustomService; LoginParams: TStrings);
begin
  ShowMessage('Login');
end;

procedure TForm2.Button1Click(Sender: TObject);
var
  Backup: TIBBackupService;
  s: string;
begin

  Memo1.Clear;
  Backup := TIBBackupService.Create(nil);
  try

    //s := 'e:\datenbank\abc.fdb';
    //s := edit1.Text;
    //Backup.BackupFile.Text := getBackupFilename(aOption.Backupdatei);
    Backup.ServerName := '172.16.10.17';
    Backup.DatabaseName := 'e:\datenbank\abc.fdb';
    //Backup.DatabaseName := s;
    Backup.Options := [];

    Backup.BackupFile.Text := 'e:\datenbank\abc_test1.bak';
    Backup.LoginPrompt := false;
    Backup.Params.Clear;
    Backup.Params.Add('password=masterkey');
    Backup.Params.Add('user_name=SYSDBA');

    try
      Backup.Verbose := true;
      Backup.Active := true;
      Backup.ServiceStart;
      while not Backup.Eof do
        Memo1.Lines.Add(Backup.GetNextLine);


    except
      on E:Exception do
      begin
        ShowMessage(E.Message);
        //Result :=  'Fehler beim Durchführen der Sicherung: ' + E.Message;
      end;
    end;

    Backup.Active := false;

  finally
    FreeAndNil(Backup);
  end;
end;

end.
