unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, IdHttp,
  idSSLOpenSSL, Restclient, Shopware5Client, httpConnection, o_onlineShopShopware5,
  Shopware5Objects, System.Generics.Collections, o_onlineshopware6;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    btn_Get: TButton;
    Memo1: TMemo;
    btn_Connect: TButton;
    btn_NewCustomer: TButton;
    btn_Categories: TButton;
    btn_Kunden: TButton;
    btn_Bestellung: TButton;
    btn_Artikel: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btn_GetClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_ConnectClick(Sender: TObject);
    procedure btn_NewCustomerClick(Sender: TObject);
    procedure btn_CategoriesClick(Sender: TObject);
    procedure btn_KundenClick(Sender: TObject);
    procedure btn_BestellungClick(Sender: TObject);
    procedure btn_ArtikelClick(Sender: TObject);
  private
    FIdHttp : TIdHTTP;
    fRest   : TRestClient;
    fClient : TShopware5Client;
    fBaseUrl: string;
    fUser: string;
    fAppKey: string;
    onlineShop : TOnlineShopShopware5;
    fOnlineShop6: TOnlineShopware6;
    function Connect: boolean;
 public
    property BaseUrl: string read fBaseUrl write fBaseUrl;
    property User: string read fUser write fUser;
    property AppKey: string read fAppKey write fAppKey;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  Shopware6.Objekt.Category, Shopware6.Objekt.Customer, Shopware6.Objekt.Order,
  Shopware6.Objekt.Artikel;


procedure TForm1.FormCreate(Sender: TObject);
begin
  {
  FIdHttp := TIdHTTP.Create(nil);
  FIdHttp.IOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(FIdHttp);
  FIdHttp.HandleRedirects := True;
  FIdHttp.Request.CustomHeaders.FoldLines := false;
  FIdHttp.HTTPOptions := [hoForceEncodeParams, hoInProcessAuth];
  FIdHttp.Request.Accept := 'application/json';
  FIdHttp.Request.ContentType := '';
  FIdHttp.Request.AcceptLanguage := '';
  FIdHttp.ConnectTimeout := 60000;
  FIdHttp.ReadTimeout := 30000;

  FIdHttp.Request.Authentication.Free;
  FIdHttp.Request.Authentication := nil;
  FIdHttp.Request.CustomHeaders.Clear;
  FIdHttp.Request.CustomHeaders.AddValue('Authorization', 'Basic b3B0aW1hOnhEblp5R1c5azk1NkRmUk03VXdNTFpsczg5OFRjd3FvOWRBUGdUbVA=');

  fRest := TRestClient.Create(nil);

  fRest.EnabledCompression := false;
  fRest.ConnectionType := hctIndy;
  //fRest.SetCredentials(User, AppKey);
  //fRest.BaseUrl := fBaseUrl + '/';

  fClient := TShopware5Client.Create(fRest);

  onlineShop := TOnlineShopShopware5.Create;
   }
  fOnlineShop6 := TOnlineShopware6.Create;
  fOnlineShop6.BaseUrl := 'http://vhs.ynot-gmbh.de/api';
  fOnlineShop6.User    := 'optima';
  fOnlineShop6.AppKey  := 'xDnZyGW9k956DfRM7UwMLZls898Tcwqo9dAPgTmP';
  fOnlineShop6.GBId    := 10;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  //FreeAndNil(fIdHttp);
  //FreeAndNil(onlineShop);
  FreeAndNil(fOnlineShop6);
end;
               // connected := shop.Connect;
procedure TForm1.FormShow(Sender: TObject);
begin
  {
  TOnlineShopShopware5(onlineShop).BaseUrl           := 'http://vhs.ynot-gmbh.de/api';
  TOnlineShopShopware5(onlineShop).User              := 'optima';
  TOnlineShopShopware5(onlineShop).AppKey            := 'xDnZyGW9k956DfRM7UwMLZls898Tcwqo9dAPgTmP';
  TOnlineShopShopware5(onlineShop).Geschaeftsbereich := 10;
  }
end;


procedure TForm1.btn_CategoriesClick(Sender: TObject);
var
  //catList: TList<TShopware6Category>;
  catList: TList<TShopware6Category>;
  cat: TShopware6Category;
  i1: Integer;
begin
//  Memo1.Lines.Text := fOnlineShop6.Categories;
  Memo1.Clear;
  //catList := fOnlineShop6.CategoriesList;
  catList := fOnlineShop6.Client.Category.List('');
  if catList = nil then
    exit;
  for Cat in CatList do
    Memo1.Lines.Add(IntToStr(Cat.id) + '=' + Cat.Name);

  for i1 := catList.Count -1 downto 0 do
  begin
    cat := catList.Items[i1];
    FreeAndNil(cat);
  end;

  FreeAndNil(catList);
end;

procedure TForm1.btn_ConnectClick(Sender: TObject);
begin
  onlineShop.Connect;
  Memo1.Clear;
  Memo1.Lines.Text := 'Connected';
end;

procedure TForm1.btn_GetClick(Sender: TObject);
var
  vResponse: TStringStream;
  Url: string;
begin       //http://vhs.ynot-gmbh.de/api/customers?filter[0][property]=number&filter[0][value]<1
  //Url := 'http://www.ynot-shop.de/api/customers?filter[0][property]=number&filter[0][value]<1';
  Url := 'https://vhs.ynot-gmbh.de/api/customers?filter[0][property]=number&filter[0][value]<1';
  vResponse := TStringStream.Create('');
  try
    FIdHttp.Get(Url, vResponse);
    vResponse.Position := 0;
    Memo1.Lines.LoadFromStream(vResponse);
  finally
    FreeAndNil(vResponse);
  end;
end;


procedure TForm1.btn_KundenClick(Sender: TObject);
var
  customer: TShopware6Customer;
  customer2: TShopware6Customer;
  newCustomers: TList<TShopware6Customer>;
  i1: Integer;
begin
  Memo1.Clear;
  newCustomers := fOnlineShop6.Client.Customer.List('?filter[0][property]=number&filter[0][value]<1');
  for customer in newCustomers do
  begin
    customer2 := fOnlineShop6.Client.Customer.Get(customer.id);
    if customer2.defaultBillingAddress <> nil then
      Memo1.Lines.Add(IntToStr(customer.id) + ' ' + Customer.number + ' ' + customer.Firstname + ' ' + customer.lastname + ' ' + customer2.defaultBillingAddress.City);

    if customer.defaultBillingAddress <> nil then
      Memo1.Lines.Add(IntToStr(customer.id) + ' ' + Customer.number + ' ' + customer.Firstname + ' ' + customer.lastname + ' ' + customer.defaultBillingAddress.City);
    if (customer.defaultBillingAddress = nil) and (customer2.defaultBillingAddress = nil) then
      Memo1.Lines.Add(IntToStr(customer.id) + ' ' + Customer.number + ' ' + customer.Firstname + ' ' + customer.lastname);
    FreeAndNil(customer2);
  end;

  for i1 := newCustomers.Count -1 downto 0 do
  begin
    Customer := newCustomers.Items[i1];
    FreeAndNil(Customer);
  end;

  FreeAndNil(newCustomers);

end;

procedure TForm1.btn_NewCustomerClick(Sender: TObject);
//var
//  newCustomers: TList<TShopware5Customer>;
begin
  Memo1.Clear;
  Memo1.Lines.Add('---------------- Lese Kunden (Start)');
  Memo1.Lines.Add('');
  onlineShop.ImportKunden2(Memo1.Lines);
  Memo1.Lines.Add('');
  Memo1.Lines.Add('---------------- Lese Kunden (Ende)');
end;

function TForm1.Connect: boolean;
begin
  fRest.EnabledCompression := false;
  fRest.ConnectionType := hctIndy;
  fRest.SetCredentials(User, AppKey);
  fRest.BaseUrl := fBaseUrl + '/';


  result := false;
  // Ist der Webshop erreichbar?
  // Nicht schön aber muss erstmal so.
    fClient.categories.List;
    result := true;

end;


procedure TForm1.btn_ArtikelClick(Sender: TObject);
var
  Article: TShopware6Article;
  Image: TShopware6Image;
  i1: Integer;
begin
  Memo1.Lines.Clear;
  Article := fOnlineShop6.Client.Articles.GetByNumber('19604');
  if Article = nil then
    exit;
  Caption := IntToStr(Article.id);
  {
  for i1 := 0 to Article.images.Count -1 do
  begin
    Memo1.Lines.Add(IntToStr(Article.Images[i1].mediaId) + ' / ' + Article.Images[i1].Link);
  end;
  }
  //fOnlineShop6.Client.Articles.DeleteArtikelImage(19826);

  article.Clear_Categories(article.categories);
  article.Clear_Images(article.images);

   article.categories.Add(TShopware6Category.Create);
   article.categories[0].id := 484;

  i1 :=  fOnlineShop6.Client.Articles.Update(Article);

  Memo1.Lines.Add('Update ' + IntToStr(i1));


  FreeAndNil(Article);
end;

procedure TForm1.btn_BestellungClick(Sender: TObject);
var
  orders: TList<TShopware6Order>;
  order: TShopware6Order;
  i1: Integer;
begin
  i1 := fOnlineShop6.ImportBestellungen;
  Caption := 'Es wurden ' + IntToStr(i1) + ' Bestellungen importiert';
  exit;
  Memo1.Clear;
  orders := fOnlineShop6.Client.order.List('?filter[0][property]=status&filter[0][value]=0');

  for order in orders do
  begin
    Memo1.Lines.Add(order.number);
  end;

  for i1 := orders.Count -1 downto 0 do
  begin
    order := orders.Items[i1];
    FreeAndNil(order);
  end;


  FreeAndNil(orders);
end;


end.
