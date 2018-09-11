{-------------------------------------------------------------------------
   Copyright by Haeger + Busch, Germany                / >>>>>>>>> /-----
   Ingenieurbuero fuer Kommunikationslösungen         / <<<<<<<<< /
 ----------------------------------------------------/ >>>>>>>>> /
   Homepage  : http://www.hbTapi.com
   EMail     : info@hbTapi.com
   Package   : hbTapi Components
 -------------------------------------------------------------------------}
 
unit uMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, hbTapi, hbTapiApi;

type
  TForm1 = class(TForm)
    Button1: TButton;
    ListBox1: TListBox;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    procedure RequestMakeCall(Sender: TObject; DestAddress, AppName,
      CalledParty, Comment: String);
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin
  hbTapiApplication.AssistMakeCall := TRUE;
end;

procedure TForm1.RequestMakeCall(Sender: TObject; DestAddress, AppName, CalledParty, Comment: String);
begin
  ListBox1.Items.Add('DestAddress = ' + DestAddress);
  ListBox1.Items.Add('AppName     = ' + AppName);
  ListBox1.Items.Add('CalledParty = ' + CalledParty);
  ListBox1.Items.Add('Comment     = ' + Comment);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  hbTapiApplication.OnRequestMakeCall := RequestMakeCall;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  hbTapiApplication.AssistMakeCall := FALSE;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  LineSetAppPriority(PChar(ParamStr(0)), 0, nil, LINEREQUESTMODE_MAKECALL, '', 1);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  LineSetAppPriority(PChar(ParamStr(0)), 0, nil, LINEREQUESTMODE_MAKECALL, '', 0);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  ListBox1.Clear;
end;

end.
