unit Objekt.DHLGeschaeftskundenversandAPI;

interface

uses
  SysUtils, Classes, geschaeftskundenversand_api_2;

  T = class(TForm)
    IdHTTP: TIdHTTP;
    Memo1: TMemo;
    IdIOHandlerStream1: TIdIOHandlerStream;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    fProgrammPath: string;
    procedure HttpRioHttpWebNodeBeforePost(const HTTPReqResp: THTTPReqResp; Data: Pointer);
  public
  end;

implementation

end.
