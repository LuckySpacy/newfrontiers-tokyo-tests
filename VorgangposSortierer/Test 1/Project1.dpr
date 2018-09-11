program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  o_VorgangposSort in 'o_VorgangposSort.pas',
  o_baselistobj in 'o_baselistobj.pas',
  o_VorgangposSortList in 'o_VorgangposSortList.pas',
  o_VorgangposSorter in 'o_VorgangposSorter.pas',
  o_GridData in 'o_GridData.pas',
  o_GridDataList in 'o_GridDataList.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
