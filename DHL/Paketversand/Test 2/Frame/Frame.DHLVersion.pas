unit Frame.DHLVersion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  Tfra_DHLVersion = class(TFrame)
    Button1: TButton;
    edt_majorRelease: TLabeledEdit;
    edt_minorRelease: TLabeledEdit;
    edt_Build: TLabeledEdit;
    procedure Button1Click(Sender: TObject);
  private
    procedure getVersion;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

{$R *.dfm}

{ Tfra_DHLVersion }

uses
  Objekt.Allgemein, Objekt.DHLVersionResponse;


constructor Tfra_DHLVersion.Create(AOwner: TComponent);
begin     //
  inherited;

end;

destructor Tfra_DHLVersion.Destroy;
begin //

  inherited;
end;

procedure Tfra_DHLVersion.Button1Click(Sender: TObject);
begin
  getVersion;
end;


procedure Tfra_DHLVersion.getVersion;
var
  V : TDHLVersionResponse;
begin

  V := AllgemeinObj.DHLSend.getVersion;

  edt_majorRelease.Text := v.majorRelease;
  edt_minorRelease.Text := v.minorRelease;
  edt_Build.Text := v.Build;

end;

end.
