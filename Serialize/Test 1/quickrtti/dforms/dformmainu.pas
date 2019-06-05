unit dformmainu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,DFormsRTTI,typinfo,exposedfiler, jpeg, ExtCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses testformu;

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
var Q:TDeFormRTTI;
begin
Q:=TDeFormRTTI.create;
Q.binhexDefined:=true;
Q.FindTypes := [ tkInteger, tkChar, tkEnumeration, tkFloat,
      tkString, tkSet, tkClass, tkWChar, tkLString, tkWString,
      tkVariant, tkArray, tkRecord, tkInterface, tkInt64, tkDynArray];
Q.rttiobject:=Form2;
Q.tagname:='FORM2';
memo1.text:=Q.xml;

Q.free;
end;

procedure TForm1.Button2Click(Sender: TObject);
var f:TForm; Q:TDeFormRTTI;
begin
f:=TForm.create(nil);
f.width:=100;
f.height:=100;  
Q:=TDeFormRTTI.create;
Q.binhexDefined:=true;
Q.FindTypes := [ tkInteger, tkChar, tkEnumeration, tkFloat,
      tkString, tkSet, tkClass, tkWChar, tkLString, tkWString,
      tkVariant, tkArray, tkRecord, tkInterface, tkInt64, tkDynArray];
Q.rttiobject:=f;
Q.tagname:='FORM2';
q.RegisterClass (TLabel);
q.RegisterClass (TImage);
q.registerclass (TMonthCalendar);
q.xml:=memo1.text;
 f.show;
Q.free;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
memo1.lines.savetofile('sample.xml');
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
memo1.lines.loadfromfile('sample.xml');
end;

end.
