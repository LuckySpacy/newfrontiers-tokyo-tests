unit base_driver;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  LowxRTTI, lowX,   StdCtrls,typinfo;

  {
  Thank you Mason Louie for you (very nice) example. The problem (commented line below) is now resolved.
  This test case also demonstrates tcomponent > XML and back, pay attention to Font.Style .. before it would bomb
  if the Style=[] (empty set).. now it is ok.

  Also tagnames automatically build themselves if you do not specify them.
  }

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    _out: TLowXQuickRTTI;
  end;

type
  TCat = class(TPersistent)
  public
    procedure foo(); virtual; abstract;
  private
    _name: String;
    _size: Integer;
  published
    property name: String read _name write _name;
    property size: Integer read _size write _size;
  end;

type
  TLion = class(TCat)
  public
    procedure foo(); virtual;
  private
    _courage: Integer;
  published
    property courage: Integer read _courage write _courage;
  end;

type
  TLionard = class(TLion)
  private
    _temper: Integer;
    _pal: TCat;
  published
    property temper: Integer read _temper write _temper;
    property pal: TCat read _pal write _pal;
  end;

var
  Form1: TForm1;

implementation


{$R *.DFM}

procedure TForm1.Button2Click(Sender: TObject);
var
  roar: TLion;
begin
  { this example doesn't work, ie won't display the object contents }

  { yeah there are better ways, but this is a quickie and it isolates the problem better }
  _out := TLowXQuickRTTI.Create;
  roar := TLion.Create;
  { parent class properties }
  roar.name := 'Leon';
  roar.size := 30;
  { native class property }
  roar.courage := 100;

  _out.RTTIObject := roar;
  _out.TagName := 'Lion_Test';
  { RTTIObject is set by now }

  Memo1.lines.text := _out.XML;

  _out.free;
  roar.free;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  meow: TCat;
begin
  { this example should work, ie display the object contents }

  { yeah there are better ways, but this is a quickie and it isolates the problem better }
  _out := TLowXQuickRTTI.Create;
  meow := TCat.Create;
  meow.name := 'Morris';
  meow.size := 5;

  _out.RTTIObject := meow;
  _out.TagName := 'Cat_Test';
  { RTTIObject is set by now }

  Memo1.lines.text := _out.XML;

  _out.free;
  meow.free;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  roar: TLionard;
begin
  { this example doesn't work, ie won't display the object contents }

  { yeah there are better ways, but this is a quickie and it isolates the problem better }
  _out := TLowXQuickRTTI.Create;
  roar := TLionard.Create;
  { parent class properties }
  roar.name := 'Leonard';
  roar.size := 40;
  roar.courage := 200;
  { native class property }
  roar.temper := 30;

  { this will of course stick in a tag structure in the XML for the new object }
  roar.pal := TLion.Create;
  roar.pal.name := 'Scaredy';
  roar.pal.size := 3;

 {!!!!!!!!!!!!!!!!!!}
 {UNCOMMENT THIS LINE To VIEW BEHAVIOR WHEN A PROPERTY IS NIL}
//   roar.pal.free; roar.pal := nil;

  _out.RTTIObject := roar;
  _out.TagName := 'Lionard_Test';
  { RTTIObject is set by now }

  Memo1.lines.text := _out.XML;

  _out.free;
  roar.free;

end;

{ TLion }

procedure TLion.foo;
begin
 
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  _out := TLowXQuickRTTI.Create;
   _out.findtypes:=[tkInteger, tkChar, tkEnumeration, tkFloat,
      tkString, tkSet, tkClass, tkWChar, tkLString, tkWString,
      tkVariant, tkArray, tkRecord,tkInt64, tkDynArray];
  _out.rttiobject:=button4 ;
   Memo1.lines.text := _out.XML;
  _out.free;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  _out := TLowXQuickRTTI.Create;
   _out.findtypes:=[tkInteger, tkChar, tkEnumeration, tkFloat,
      tkString, tkSet, tkClass, tkWChar, tkLString, tkWString,
      tkVariant, tkArray, tkRecord,tkInt64, tkDynArray];
  _out.rttiobject:=button4 ;
  _out.XML:=  Memo1.lines.text;
  _out.free;
end;

end.
