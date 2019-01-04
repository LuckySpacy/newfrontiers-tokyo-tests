unit Datenmodul.dm;

interface

uses
  System.SysUtils, System.Classes, IBX.IBDatabase, Data.DB;

type
  Tdm = class(TDataModule)
    IBD: TIBDatabase;
    IBT: TIBTransaction;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
