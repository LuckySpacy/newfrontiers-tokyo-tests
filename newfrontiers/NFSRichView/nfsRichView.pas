unit nfsRichView;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, RVScroll, RichView, RVEdit;

type
  TnfsRichview = class(TRichViewEdit)
  private
  protected
  public
  published
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('new frontiers', [TnfsRichview]);
end;

end.
