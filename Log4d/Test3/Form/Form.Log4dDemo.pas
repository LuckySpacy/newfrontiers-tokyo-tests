unit Form.Log4dDemo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Log4d, Vcl.StdCtrls;

type
  Tfrm_Log4dDemo = class(TForm)
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    fLogPath: string;
    fDemoLog: log4d.TLogLogger;
    fStringList: TStringList;
  public
  end;

var
  frm_Log4dDemo: Tfrm_Log4dDemo;

implementation

{$R *.dfm}


procedure Tfrm_Log4dDemo.FormCreate(Sender: TObject);
begin
  if (not FileExists(ExtractFilePath(Application.ExeName) + 'log4d.props')) then
        raise Exception.Create('Log-Konfigurationsdatei (log4d.props) nicht gefunden');

  TLogPropertyConfigurator.Configure(ExtractFilePath(Application.ExeName) + 'log4d.props');

  fLogPath := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + '\LogFiles\';

  if not DirectoryExists(fLogPath) then
    ForceDirectories(fLogPath);

  fDemoLog := TLogLogger.GetLogger('Demo');


  if fDemoLog.Appenders.Count = 1 then
    (fDemoLog.Appenders[0] as ILogRollingFileAppender).renameLogfile(fLogPath + 'Demo.log');  //<-- Pfad zuweisen

  fStringList := TStringList.Create;



end;

procedure Tfrm_Log4dDemo.FormDestroy(Sender: TObject);
begin  //

end;


procedure Tfrm_Log4dDemo.Button1Click(Sender: TObject);
begin
  fDemoLog.Info('Info : ButtonClick');
  fDemoLog.Warn('Warn : ButtonClick');
  fDemoLog.Error('Error: ButtonClick');
end;


end.
