program GetTest;

uses
  FastMM4 in '..\..\Log4d\Test3\FastMM\FastMM4.pas',
  FastMM4Messages in '..\..\Log4d\Test3\FastMM\Translations\German\by Thomas Speck\FastMM4Messages.pas',
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Vcl.Forms,
  Unit1 in 'Unit1.pas',
  WinHttp_TLB in '..\..\..\Projekte\Optima\Komponenten\delphi-rest-client-api-master\lib\WinHttp_TLB.pas',
  Wcrypt2 in '..\..\..\Projekte\Optima\Komponenten\delphi-rest-client-api-master\lib\Wcrypt2.pas',
  o_Onlineshopware6 in '..\..\..\Projekte\Optima\Server\source\onlineShop\Shopware6\o_Onlineshopware6.pas',
  Shopware6.Client in '..\..\..\Projekte\Optima\Server\source\onlineShop\Shopware6\Shopware6.Client.pas',
  Shopware6.Objekt.Base in '..\..\..\Projekte\Optima\Server\source\onlineShop\Shopware6\Shopware6.Objekt.Base.pas',
  Shopware6.Objekt.Category in '..\..\..\Projekte\Optima\Server\source\onlineShop\Shopware6\Shopware6.Objekt.Category.pas',
  Shopware6.Objekt.Response in '..\..\..\Projekte\Optima\Server\source\onlineShop\Shopware6\Shopware6.Objekt.Response.pas',
  Shopware6.Objekt.Resource in '..\..\..\Projekte\Optima\Server\source\onlineShop\Shopware6\Shopware6.Objekt.Resource.pas' {$R *.res},
  Shopware6.Objekt.Customer in '..\..\..\Projekte\Optima\Server\source\onlineShop\Shopware6\Shopware6.Objekt.Customer.pas',
  Shopware6.Objekt.Order in '..\..\..\Projekte\Optima\Server\source\onlineShop\Shopware6\Shopware6.Objekt.Order.pas',
  Shopware6.Objekt.Artikel in '..\..\..\Projekte\Optima\Server\source\onlineShop\Shopware6\Shopware6.Objekt.Artikel.pas',
  Shopware6.Objekt.UploadBilder in '..\..\..\Projekte\Optima\Server\source\onlineShop\Shopware6\Shopware6.Objekt.UploadBilder.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
