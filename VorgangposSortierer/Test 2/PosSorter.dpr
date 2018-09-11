program PosSorter;

uses
  Vcl.Forms,
  u_PosSorter in 'u_PosSorter.pas' {Form1},
  o_GridData in 'o_GridData.pas',
  o_GridDataList in 'o_GridDataList.pas',
  o_baselistobj in 'o_baselistobj.pas',
  o_VorgangposSort in 'o_VorgangposSort.pas',
  o_basenormlistobj in 'o_basenormlistobj.pas',
  o_VorgangposSortList in 'o_VorgangposSortList.pas',
  o_VorgangposSorter in 'o_VorgangposSorter.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
