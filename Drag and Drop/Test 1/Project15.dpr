program Project15;

uses
  Vcl.Forms,
  Unit17 in 'Unit17.pas' {Form17},
  o_DragAndDropDataAdapter in 'o_DragAndDropDataAdapter.pas',
  c_OutlookDropTypes in 'outlookdrop\c_OutlookDropTypes.pas',
  o_ObjOutlookDrop in 'outlookdrop\o_ObjOutlookDrop.pas',
  o_ObjOutlookmsg in 'outlookdrop\o_ObjOutlookmsg.pas',
  o_Outlookdropmessage in 'outlookdrop\o_Outlookdropmessage.pas',
  o_Outlookdropmessages in 'outlookdrop\o_Outlookdropmessages.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm17, Form17);
  Application.Run;
end.
