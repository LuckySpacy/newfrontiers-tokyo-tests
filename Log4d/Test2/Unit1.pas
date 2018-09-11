unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, log4d;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    flogger: log4d.TLogLogger;
    ffilename: string;
    fTest: TStringlist;
    procedure setFilename(const aWert: string);
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  //setFilename(ExtractFilePath(Application.ExeName) + 'logging.log');
  setFilename('d:\Delphi\Tokyo\Test\Log4d\Test2\logging.log');
  flogger.Info('ButtonClick');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if (not FileExists(ExtractFilePath(Application.ExeName) + 'log4d.props')) then
        raise Exception.Create('Log-Konfigurationsdatei (log4d.props) nicht gefunden');

  TLogPropertyConfigurator.Configure(ExtractFilePath(Application.ExeName) + 'log4d.props');
  flogger := TLogLogger.GetLogger('logging1');

end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  //FreeAndNil(fLogger);
end;


procedure TForm1.setFilename(const aWert: string);
var i: integer;
    curAppender : ILogAppender;
begin
  ffilename := aWert;

     for i := 0 to flogger.Appenders.Count-1 do
     begin
       curAppender := ILogAppender(flogger.Appenders[i]);
       if (curAppender.Name = 'Fil1') then
       begin
         (curAppender as ILogRollingFileAppender).renameLogfile(ffilename);
       end;
       if (curAppender.Name = 'log1') then
       begin
         (curAppender as ILogRollingFileAppender).renameLogfile(ffilename);
       end;
     end;

end;

end.
