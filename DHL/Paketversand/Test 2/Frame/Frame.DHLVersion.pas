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
  private
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

{$R *.dfm}

{ Tfra_DHLVersion }

uses
  Objekt.Allgemein;

constructor Tfra_DHLVersion.Create(AOwner: TComponent);
begin     //
  inherited;

end;

destructor Tfra_DHLVersion.Destroy;
begin //

  inherited;
end;

end.
