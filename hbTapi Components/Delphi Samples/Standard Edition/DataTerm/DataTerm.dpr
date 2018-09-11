program DataTerm;

uses
  Forms,
  uMain in 'uMain.PAS' {Form1},
  uSettings in 'uSettings.pas' {ComPortSettingsDlg};

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
