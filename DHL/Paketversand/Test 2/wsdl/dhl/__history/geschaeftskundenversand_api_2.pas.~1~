// ************************************************************************ //
// Die in dieser Datei deklarierten Typen wurden aus Daten der unten
// beschriebenen WSDL-Datei generiert:

// WSDL     : D:\Delphi\Tokyo\Test\DHL\Paketversand\Test 1\wsdl\geschaeftskundenversand-api-2.2.wsdl
//  >Import : D:\Delphi\Tokyo\Test\DHL\Paketversand\Test 1\wsdl\geschaeftskundenversand-api-2.2.wsdl>0
//  >Import : D:\Delphi\Tokyo\Test\DHL\Paketversand\Test 1\wsdl\geschaeftskundenversand-api-2.2-schema-cis_base.xsd
//  >Import : D:\Delphi\Tokyo\Test\DHL\Paketversand\Test 1\wsdl\geschaeftskundenversand-api-2.2-schema-bcs_base.xsd
// Codierung : UTF-8
// Version: 1.0
// (21.09.2018 15:44:46 - - $Rev: 90173 $)
// ************************************************************************ //

unit geschaeftskundenversand_api_2;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

const
  IS_OPTN = $0001;
  IS_UNBD = $0002;
  IS_UNQL = $0008;
  IS_ATTR = $0010;
  IS_REF  = $0080;


type

  // ************************************************************************ //
  // Die folgenden Typen, auf die im WSDL-Dokument Bezug genommen wird, sind in dieser Datei
  // nicht repräsentiert. Sie sind entweder Aliase[@] anderer repräsentierter Typen oder auf sie wurde Bezug genommen,
  // aber sie sind in diesem Dokument nicht[!] deklariert. Die Typen aus letzterer Kategorie
  // sind in der Regel vordefinierten/bekannten XML- oder Embarcadero-Typen zugeordnet; sie könnten aber auf 
  // ein inkorrektes WSDL-Dokument hinweisen, das einen Schematyp nicht deklariert oder importiert hat.
  // ************************************************************************ //
  // !:base64Binary    - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:integer         - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:decimal         - "http://www.w3.org/2001/XMLSchema"[Gbl]

  GetLabelResponse     = class;                 { "http://dhl.de/webservices/businesscustomershipping"[Lit][GblElm] }
  DoManifestResponse   = class;                 { "http://dhl.de/webservices/businesscustomershipping"[Lit][GblElm] }
  DeleteShipmentOrderResponse = class;          { "http://dhl.de/webservices/businesscustomershipping"[Lit][GblElm] }
  GetVersionResponse   = class;                 { "http://dhl.de/webservices/businesscustomershipping"[Lit][GblElm] }
  ValidateShipmentResponse = class;             { "http://dhl.de/webservices/businesscustomershipping"[Lit][GblElm] }
  CreateShipmentOrderResponse = class;          { "http://dhl.de/webservices/businesscustomershipping"[Lit][GblElm] }
  ValidateShipmentOrderRequest = class;         { "http://dhl.de/webservices/businesscustomershipping"[Lit][GblElm] }
  CreateShipmentOrderRequest = class;           { "http://dhl.de/webservices/businesscustomershipping"[Lit][GblElm] }
  GetManifestResponse  = class;                 { "http://dhl.de/webservices/businesscustomershipping"[Lit][GblElm] }
  GetExportDocResponse = class;                 { "http://dhl.de/webservices/businesscustomershipping"[Lit][GblElm] }
  UpdateShipmentOrderResponse = class;          { "http://dhl.de/webservices/businesscustomershipping"[Lit][GblElm] }
  CountryType          = class;                 { "http://dhl.de/webservice/cisbase"[GblCplx] }
  Origin               = class;                 { "http://dhl.de/webservice/cisbase"[GblElm] }
  CommunicationType    = class;                 { "http://dhl.de/webservice/cisbase"[GblCplx] }
  GetManifestRequest   = class;                 { "http://dhl.de/webservices/businesscustomershipping"[Lit][GblElm] }
  Version              = class;                 { "http://dhl.de/webservices/businesscustomershipping"[Lit][GblElm] }
  AuthentificationType = class;                 { "http://dhl.de/webservice/cisbase"[Hdr][GblCplx] }
  BankType             = class;                 { "http://dhl.de/webservice/cisbase"[GblCplx] }
  ShipmentNotificationType = class;             { "http://dhl.de/webservices/businesscustomershipping"[GblCplx] }
  ShipmentService      = class;                 { "http://dhl.de/webservices/businesscustomershipping"[GblCplx] }
  ExportDocPosition    = class;                 { "http://dhl.de/webservices/businesscustomershipping"[Cplx] }
  ShipmentItemType     = class;                 { "http://dhl.de/webservices/businesscustomershipping"[GblCplx] }
  ServiceconfigurationCashOnDelivery = class;   { "http://dhl.de/webservices/businesscustomershipping"[GblCplx] }
  ServiceconfigurationDetails = class;          { "http://dhl.de/webservices/businesscustomershipping"[GblCplx] }
  ServiceconfigurationVisualAgeCheck = class;   { "http://dhl.de/webservices/businesscustomershipping"[GblCplx] }
  Ident                = class;                 { "http://dhl.de/webservices/businesscustomershipping"[Cplx] }
  ServiceconfigurationIC = class;               { "http://dhl.de/webservices/businesscustomershipping"[GblCplx] }
  ServiceconfigurationAdditionalInsurance = class;   { "http://dhl.de/webservices/businesscustomershipping"[GblCplx] }
  ServiceconfigurationDeliveryTimeframe = class;   { "http://dhl.de/webservices/businesscustomershipping"[GblCplx] }
  ServiceconfigurationDateOfDelivery = class;   { "http://dhl.de/webservices/businesscustomershipping"[GblCplx] }
  ShipmentItemTypeType = class;                 { "http://dhl.de/webservices/businesscustomershipping"[GblCplx] }
  ServiceconfigurationEndorsement = class;      { "http://dhl.de/webservices/businesscustomershipping"[GblCplx] }
  ServiceconfigurationShipmentHandling = class;   { "http://dhl.de/webservices/businesscustomershipping"[GblCplx] }
  ServiceconfigurationISR = class;              { "http://dhl.de/webservices/businesscustomershipping"[GblCplx] }
  DoManifestRequest    = class;                 { "http://dhl.de/webservices/businesscustomershipping"[Lit][GblElm] }
  GetExportDocRequest  = class;                 { "http://dhl.de/webservices/businesscustomershipping"[Lit][GblElm] }
  DeleteShipmentOrderRequest = class;           { "http://dhl.de/webservices/businesscustomershipping"[Lit][GblElm] }
  GetLabelRequest      = class;                 { "http://dhl.de/webservices/businesscustomershipping"[Lit][GblElm] }
  UpdateShipmentOrderRequest = class;           { "http://dhl.de/webservices/businesscustomershipping"[Lit][GblElm] }
  ExportDocData        = class;                 { "http://dhl.de/webservices/businesscustomershipping"[GblCplx] }
  DeletionState        = class;                 { "http://dhl.de/webservices/businesscustomershipping"[GblCplx] }
  ManifestState        = class;                 { "http://dhl.de/webservices/businesscustomershipping"[GblCplx] }
  LabelData            = class;                 { "http://dhl.de/webservices/businesscustomershipping"[GblCplx] }
  ValidationState      = class;                 { "http://dhl.de/webservices/businesscustomershipping"[GblCplx] }
  CreationState        = class;                 { "http://dhl.de/webservices/businesscustomershipping"[GblCplx] }
  PackStationType      = class;                 { "http://dhl.de/webservice/cisbase"[GblCplx] }
  PostfilialeType      = class;                 { "http://dhl.de/webservice/cisbase"[GblCplx] }
  NativeAddressType    = class;                 { "http://dhl.de/webservice/cisbase"[GblCplx] }
  ParcelShopType       = class;                 { "http://dhl.de/webservice/cisbase"[GblCplx] }
  ShipmentDetailsType  = class;                 { "http://dhl.de/webservices/businesscustomershipping"[GblCplx] }
  ReceiverNativeAddressType = class;            { "http://dhl.de/webservice/cisbase"[GblCplx] }
  NameType             = class;                 { "http://dhl.de/webservice/cisbase"[GblCplx] }
  Authentification     = class;                 { "http://dhl.de/webservice/cisbase"[Hdr][GblElm] }
  Statusinformation    = class;                 { "http://dhl.de/webservices/businesscustomershipping"[GblCplx] }
  ValidateShipmentOrderType = class;            { "http://dhl.de/webservices/businesscustomershipping"[GblCplx] }
  Serviceconfiguration = class;                 { "http://dhl.de/webservices/businesscustomershipping"[GblCplx] }
  ReceiverTypeType     = class;                 { "http://dhl.de/webservices/businesscustomershipping"[GblCplx] }
  ShipperTypeType      = class;                 { "http://dhl.de/webservices/businesscustomershipping"[GblCplx] }
  Shipment             = class;                 { "http://dhl.de/webservices/businesscustomershipping"[Cplx] }
  ShipmentDetailsTypeType = class;              { "http://dhl.de/webservices/businesscustomershipping"[GblCplx] }
  Shipment2            = class;                 { "http://dhl.de/webservices/businesscustomershipping"[Cplx] }
  ShipmentOrderType    = class;                 { "http://dhl.de/webservices/businesscustomershipping"[GblCplx] }
  ExportDocumentType   = class;                 { "http://dhl.de/webservices/businesscustomershipping"[GblCplx] }
  ReceiverType         = class;                 { "http://dhl.de/webservices/businesscustomershipping"[GblCplx] }
  ShipperType          = class;                 { "http://dhl.de/webservices/businesscustomershipping"[GblCplx] }

  {$SCOPEDENUMS ON}
  { "http://dhl.de/webservices/businesscustomershipping"[Smpl] }
  exportType = (OTHER, PRESENT, COMMERCIAL_SAMPLE, DOCUMENT, RETURN_OF_GOODS);

  { "http://dhl.de/webservices/businesscustomershipping"[Smpl] }
  termsOfTrade = (DDP, DXV, DDU, DDX);

  { "http://dhl.de/webservices/businesscustomershipping"[Smpl] }
  labelResponseType = (B64, URL);

  { "http://dhl.de/webservices/businesscustomershipping"[Smpl] }
  exportDocResponseType = (URL, B64);


  {$SCOPEDENUMS OFF}

  { "http://dhl.de/webservices/businesscustomershipping"[Smpl] }
  labelResponseType2 = (URL, B64);

  Array_Of_ValidationState = array of ValidationState;   { "http://dhl.de/webservices/businesscustomershipping"[GblUbnd] }
  Array_Of_LabelData = array of LabelData;      { "http://dhl.de/webservices/businesscustomershipping"[GblUbnd] }
  Array_Of_ExportDocData = array of ExportDocData;   { "http://dhl.de/webservices/businesscustomershipping"[GblUbnd] }
  Array_Of_ManifestState = array of ManifestState;   { "http://dhl.de/webservices/businesscustomershipping"[GblUbnd] }
  Array_Of_DeletionState = array of DeletionState;   { "http://dhl.de/webservices/businesscustomershipping"[GblUbnd] }
  Array_Of_CreationState = array of CreationState;   { "http://dhl.de/webservices/businesscustomershipping"[GblUbnd] }


  // ************************************************************************ //
  // XML       : GetLabelResponse, global, <element>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  GetLabelResponse = class(TRemotable)
  private
    FVersion: Version;
    FStatus: Statusinformation;
    FLabelData: Array_Of_LabelData;
    FLabelData_Specified: boolean;
    procedure SetLabelData(Index: Integer; const AArray_Of_LabelData: Array_Of_LabelData);
    function  LabelData_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property Version:   Version             Index (IS_REF) read FVersion write FVersion;
    property Status:    Statusinformation   Index (IS_UNQL) read FStatus write FStatus;
    property LabelData: Array_Of_LabelData  Index (IS_OPTN or IS_UNBD or IS_UNQL) read FLabelData write SetLabelData stored LabelData_Specified;
  end;



  // ************************************************************************ //
  // XML       : DoManifestResponse, global, <element>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  DoManifestResponse = class(TRemotable)
  private
    FVersion: Version;
    FStatus: Statusinformation;
    FManifestState: Array_Of_ManifestState;
    FManifestState_Specified: boolean;
    procedure SetManifestState(Index: Integer; const AArray_Of_ManifestState: Array_Of_ManifestState);
    function  ManifestState_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property Version:       Version                 Index (IS_REF) read FVersion write FVersion;
    property Status:        Statusinformation       Index (IS_UNQL) read FStatus write FStatus;
    property ManifestState: Array_Of_ManifestState  Index (IS_OPTN or IS_UNBD or IS_UNQL) read FManifestState write SetManifestState stored ManifestState_Specified;
  end;



  // ************************************************************************ //
  // XML       : DeleteShipmentOrderResponse, global, <element>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  DeleteShipmentOrderResponse = class(TRemotable)
  private
    FVersion: Version;
    FStatus: Statusinformation;
    FDeletionState: Array_Of_DeletionState;
    FDeletionState_Specified: boolean;
    procedure SetDeletionState(Index: Integer; const AArray_Of_DeletionState: Array_Of_DeletionState);
    function  DeletionState_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property Version:       Version                 Index (IS_REF) read FVersion write FVersion;
    property Status:        Statusinformation       Index (IS_UNQL) read FStatus write FStatus;
    property DeletionState: Array_Of_DeletionState  Index (IS_OPTN or IS_UNBD or IS_UNQL) read FDeletionState write SetDeletionState stored DeletionState_Specified;
  end;



  // ************************************************************************ //
  // XML       : GetVersionResponse, global, <element>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  GetVersionResponse = class(TRemotable)
  private
    FVersion: Version;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property Version: Version  Index (IS_REF) read FVersion write FVersion;
  end;



  // ************************************************************************ //
  // XML       : ValidateShipmentResponse, global, <element>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  ValidateShipmentResponse = class(TRemotable)
  private
    FVersion: Version;
    FStatus: Statusinformation;
    FValidationState: Array_Of_ValidationState;
    FValidationState_Specified: boolean;
    procedure SetValidationState(Index: Integer; const AArray_Of_ValidationState: Array_Of_ValidationState);
    function  ValidationState_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property Version:         Version                   Index (IS_REF) read FVersion write FVersion;
    property Status:          Statusinformation         Index (IS_UNQL) read FStatus write FStatus;
    property ValidationState: Array_Of_ValidationState  Index (IS_OPTN or IS_UNBD or IS_UNQL) read FValidationState write SetValidationState stored ValidationState_Specified;
  end;



  // ************************************************************************ //
  // XML       : CreateShipmentOrderResponse, global, <element>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  CreateShipmentOrderResponse = class(TRemotable)
  private
    FVersion: Version;
    FStatus: Statusinformation;
    FCreationState: Array_Of_CreationState;
    FCreationState_Specified: boolean;
    procedure SetCreationState(Index: Integer; const AArray_Of_CreationState: Array_Of_CreationState);
    function  CreationState_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property Version:       Version                 Index (IS_REF) read FVersion write FVersion;
    property Status:        Statusinformation       Index (IS_UNQL) read FStatus write FStatus;
    property CreationState: Array_Of_CreationState  Index (IS_OPTN or IS_UNBD or IS_UNQL) read FCreationState write SetCreationState stored CreationState_Specified;
  end;

  Array_Of_ValidateShipmentOrderType = array of ValidateShipmentOrderType;   { "http://dhl.de/webservices/businesscustomershipping"[GblUbnd] }


  // ************************************************************************ //
  // XML       : ValidateShipmentOrderRequest, global, <element>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  ValidateShipmentOrderRequest = class(TRemotable)
  private
    FVersion: Version;
    FShipmentOrder: Array_Of_ValidateShipmentOrderType;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property Version:       Version                             Index (IS_REF) read FVersion write FVersion;
    property ShipmentOrder: Array_Of_ValidateShipmentOrderType  Index (IS_UNBD or IS_UNQL) read FShipmentOrder write FShipmentOrder;
  end;

  Array_Of_ShipmentOrderType = array of ShipmentOrderType;   { "http://dhl.de/webservices/businesscustomershipping"[GblUbnd] }


  // ************************************************************************ //
  // XML       : CreateShipmentOrderRequest, global, <element>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  CreateShipmentOrderRequest = class(TRemotable)
  private
    FVersion: Version;
    FShipmentOrder: Array_Of_ShipmentOrderType;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property Version:       Version                     Index (IS_REF) read FVersion write FVersion;
    property ShipmentOrder: Array_Of_ShipmentOrderType  Index (IS_UNBD or IS_UNQL) read FShipmentOrder write FShipmentOrder;
  end;

  Array_Of_ExportDocPosition = array of ExportDocPosition;   { "http://dhl.de/webservices/businesscustomershipping"[Ubnd] }


  // ************************************************************************ //
  // XML       : GetManifestResponse, global, <element>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  GetManifestResponse = class(TRemotable)
  private
    FVersion: Version;
    FStatus: Statusinformation;
    FmanifestData: TByteDynArray;
    FmanifestData_Specified: boolean;
    procedure SetmanifestData(Index: Integer; const ATByteDynArray: TByteDynArray);
    function  manifestData_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property Version:      Version            Index (IS_REF) read FVersion write FVersion;
    property Status:       Statusinformation  Index (IS_UNQL) read FStatus write FStatus;
    property manifestData: TByteDynArray      Index (IS_OPTN or IS_UNQL) read FmanifestData write SetmanifestData stored manifestData_Specified;
  end;



  // ************************************************************************ //
  // XML       : GetExportDocResponse, global, <element>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  GetExportDocResponse = class(TRemotable)
  private
    FVersion: Version;
    FStatus: Statusinformation;
    FExportDocData: Array_Of_ExportDocData;
    FExportDocData_Specified: boolean;
    procedure SetExportDocData(Index: Integer; const AArray_Of_ExportDocData: Array_Of_ExportDocData);
    function  ExportDocData_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property Version:       Version                 Index (IS_REF) read FVersion write FVersion;
    property Status:        Statusinformation       Index (IS_UNQL) read FStatus write FStatus;
    property ExportDocData: Array_Of_ExportDocData  Index (IS_OPTN or IS_UNBD or IS_UNQL) read FExportDocData write SetExportDocData stored ExportDocData_Specified;
  end;



  // ************************************************************************ //
  // XML       : UpdateShipmentOrderResponse, global, <element>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  UpdateShipmentOrderResponse = class(TRemotable)
  private
    FVersion: Version;
    FStatus: Statusinformation;
    FLabelData: LabelData;
    FLabelData_Specified: boolean;
    procedure SetLabelData(Index: Integer; const ALabelData: LabelData);
    function  LabelData_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property Version:   Version            Index (IS_REF) read FVersion write FVersion;
    property Status:    Statusinformation  Index (IS_UNQL) read FStatus write FStatus;
    property LabelData: LabelData          Index (IS_OPTN or IS_UNQL) read FLabelData write SetLabelData stored LabelData_Specified;
  end;

  amount          =  type Int64;      { "http://dhl.de/webservices/businesscustomershipping"[Smpl] }
  streetNumber    =  type string;      { "http://dhl.de/webservice/cisbase"[Smpl] }
  addressAddition =  type string;      { "http://dhl.de/webservice/cisbase"[Smpl] }
  Array_Of_addressAddition = array of addressAddition;   { "http://dhl.de/webservice/cisbase"[Ubnd] }
  dispatchingInformation =  type string;      { "http://dhl.de/webservice/cisbase"[Smpl] }
  streetName      =  type string;      { "http://dhl.de/webservice/cisbase"[Smpl] }
  streetNumber2   =  type string;      { "http://dhl.de/webservice/cisbase"[Smpl] }
  postNumber      =  type string;      { "http://dhl.de/webservice/cisbase"[Smpl] }
  parcelShopNumber =  type string;      { "http://dhl.de/webservice/cisbase"[Smpl] }
  state           =  type string;      { "http://dhl.de/webservice/cisbase"[Smpl] }
  ZipType         =  type string;      { "http://dhl.de/webservice/cisbase"[GblSmpl] }
  zip             =  type ZipType;      { "http://dhl.de/webservice/cisbase"[GblElm] }
  country         =  type string;      { "http://dhl.de/webservice/cisbase"[Smpl] }
  countryISOType  =  type string;      { "http://dhl.de/webservice/cisbase"[GblSmpl] }


  // ************************************************************************ //
  // XML       : CountryType, global, <complexType>
  // Namespace : http://dhl.de/webservice/cisbase
  // ************************************************************************ //
  CountryType = class(TRemotable)
  private
    Fcountry: country;
    Fcountry_Specified: boolean;
    FcountryISOCode: countryISOType;
    Fstate: state;
    Fstate_Specified: boolean;
    procedure Setcountry(Index: Integer; const Acountry: country);
    function  country_Specified(Index: Integer): boolean;
    procedure Setstate(Index: Integer; const Astate: state);
    function  state_Specified(Index: Integer): boolean;
  published
    property country:        country         Index (IS_OPTN) read Fcountry write Setcountry stored country_Specified;
    property countryISOCode: countryISOType  read FcountryISOCode write FcountryISOCode;
    property state:          state           Index (IS_OPTN) read Fstate write Setstate stored state_Specified;
  end;



  // ************************************************************************ //
  // XML       : Origin, global, <element>
  // Namespace : http://dhl.de/webservice/cisbase
  // ************************************************************************ //
  Origin = class(CountryType)
  private
  published
  end;

  postfilialNumber =  type string;      { "http://dhl.de/webservice/cisbase"[Smpl] }
  accountreference =  type string;      { "http://dhl.de/webservice/cisbase"[Smpl] }
  note1           =  type string;      { "http://dhl.de/webservice/cisbase"[Smpl] }
  note2           =  type string;      { "http://dhl.de/webservice/cisbase"[Smpl] }
  bic             =  type string;      { "http://dhl.de/webservice/cisbase"[Smpl] }
  contactPerson   =  type string;      { "http://dhl.de/webservice/cisbase"[Smpl] }
  postNumber2     =  type string;      { "http://dhl.de/webservice/cisbase"[Smpl] }
  packstationNumber =  type string;      { "http://dhl.de/webservice/cisbase"[Smpl] }
  phone           =  type string;      { "http://dhl.de/webservice/cisbase"[Smpl] }
  email           =  type string;      { "http://dhl.de/webservice/cisbase"[Smpl] }


  // ************************************************************************ //
  // XML       : CommunicationType, global, <complexType>
  // Namespace : http://dhl.de/webservice/cisbase
  // ************************************************************************ //
  CommunicationType = class(TRemotable)
  private
    Fphone: phone;
    Fphone_Specified: boolean;
    Femail: email;
    Femail_Specified: boolean;
    FcontactPerson: contactPerson;
    FcontactPerson_Specified: boolean;
    procedure Setphone(Index: Integer; const Aphone: phone);
    function  phone_Specified(Index: Integer): boolean;
    procedure Setemail(Index: Integer; const Aemail: email);
    function  email_Specified(Index: Integer): boolean;
    procedure SetcontactPerson(Index: Integer; const AcontactPerson: contactPerson);
    function  contactPerson_Specified(Index: Integer): boolean;
  published
    property phone:         phone          Index (IS_OPTN) read Fphone write Setphone stored phone_Specified;
    property email:         email          Index (IS_OPTN) read Femail write Setemail stored email_Specified;
    property contactPerson: contactPerson  Index (IS_OPTN) read FcontactPerson write SetcontactPerson stored contactPerson_Specified;
  end;

  surname         =  type string;      { "http://dhl.de/webservices/businesscustomershipping"[Smpl] }
  majorRelease    =  type string;      { "http://dhl.de/webservices/businesscustomershipping"[Smpl] }
  minorRelease    =  type string;      { "http://dhl.de/webservices/businesscustomershipping"[Smpl] }


  // ************************************************************************ //
  // XML       : GetManifestRequest, global, <element>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  GetManifestRequest = class(TRemotable)
  private
    FVersion: Version;
    FmanifestDate: string;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property Version:      Version  Index (IS_REF) read FVersion write FVersion;
    property manifestDate: string   Index (IS_UNQL) read FmanifestDate write FmanifestDate;
  end;

  Array_Of_string = array of string;            { "http://www.w3.org/2001/XMLSchema"[GblUbnd] }
  build           =  type string;      { "http://dhl.de/webservices/businesscustomershipping"[Smpl] }


  // ************************************************************************ //
  // XML       : Version, global, <element>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  Version = class(TRemotable)
  private
    FmajorRelease: majorRelease;
    FminorRelease: minorRelease;
    Fbuild: build;
    Fbuild_Specified: boolean;
    procedure Setbuild(Index: Integer; const Abuild: build);
    function  build_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
  published
    property majorRelease: majorRelease  Index (IS_UNQL) read FmajorRelease write FmajorRelease;
    property minorRelease: minorRelease  Index (IS_UNQL) read FminorRelease write FminorRelease;
    property build:        build         Index (IS_OPTN or IS_UNQL) read Fbuild write Setbuild stored build_Specified;
  end;

  permitNumber    =  type string;      { "http://dhl.de/webservices/businesscustomershipping"[Smpl] }
  placeOfCommital =  type string;      { "http://dhl.de/webservices/businesscustomershipping"[Smpl] }
  attestationNumber =  type string;      { "http://dhl.de/webservices/businesscustomershipping"[Smpl] }
  countryCodeOrigin =  type string;      { "http://dhl.de/webservices/businesscustomershipping"[Smpl] }
  customsTariffNumber =  type string;      { "http://dhl.de/webservices/businesscustomershipping"[Smpl] }
  description     =  type string;      { "http://dhl.de/webservices/businesscustomershipping"[Smpl] }
  exportTypeDescription =  type string;      { "http://dhl.de/webservices/businesscustomershipping"[Smpl] }
  givenName       =  type string;      { "http://dhl.de/webservices/businesscustomershipping"[Smpl] }
  dateOfBirth     =  type string;      { "http://dhl.de/webservices/businesscustomershipping"[Smpl] }
  invoiceNumber   =  type string;      { "http://dhl.de/webservices/businesscustomershipping"[Smpl] }
  minimumAge      =  type string;      { "http://dhl.de/webservices/businesscustomershipping"[Smpl] }
  recipientEmailAddress =  type string;      { "http://dhl.de/webservices/businesscustomershipping"[Smpl] }
  user            =  type string;      { "http://dhl.de/webservice/cisbase"[Smpl] }
  streetName2     =  type string;      { "http://dhl.de/webservice/cisbase"[Smpl] }
  signature       =  type string;      { "http://dhl.de/webservice/cisbase"[Smpl] }


  // ************************************************************************ //
  // XML       : AuthentificationType, global, <complexType>
  // Namespace : http://dhl.de/webservice/cisbase
  // Info      : Header
  // ************************************************************************ //
  AuthentificationType = class(TSOAPHeader)
  private
    Fuser: user;
    Fsignature: signature;
  published
    property user:      user       read Fuser write Fuser;
    property signature: signature  read Fsignature write Fsignature;
  end;

  iban            =  type string;      { "http://dhl.de/webservice/cisbase"[Smpl] }
  bankName        =  type string;      { "http://dhl.de/webservice/cisbase"[Smpl] }
  accountOwner    =  type string;      { "http://dhl.de/webservice/cisbase"[Smpl] }


  // ************************************************************************ //
  // XML       : BankType, global, <complexType>
  // Namespace : http://dhl.de/webservice/cisbase
  // ************************************************************************ //
  BankType = class(TRemotable)
  private
    FaccountOwner: accountOwner;
    FbankName: bankName;
    Fiban: iban;
    Fnote1: note1;
    Fnote1_Specified: boolean;
    Fnote2: note2;
    Fnote2_Specified: boolean;
    Fbic: bic;
    Fbic_Specified: boolean;
    Faccountreference: accountreference;
    Faccountreference_Specified: boolean;
    procedure Setnote1(Index: Integer; const Anote1: note1);
    function  note1_Specified(Index: Integer): boolean;
    procedure Setnote2(Index: Integer; const Anote2: note2);
    function  note2_Specified(Index: Integer): boolean;
    procedure Setbic(Index: Integer; const Abic: bic);
    function  bic_Specified(Index: Integer): boolean;
    procedure Setaccountreference(Index: Integer; const Aaccountreference: accountreference);
    function  accountreference_Specified(Index: Integer): boolean;
  published
    property accountOwner:     accountOwner      read FaccountOwner write FaccountOwner;
    property bankName:         bankName          read FbankName write FbankName;
    property iban:             iban              read Fiban write Fiban;
    property note1:            note1             Index (IS_OPTN) read Fnote1 write Setnote1 stored note1_Specified;
    property note2:            note2             Index (IS_OPTN) read Fnote2 write Setnote2 stored note2_Specified;
    property bic:              bic               Index (IS_OPTN) read Fbic write Setbic stored bic_Specified;
    property accountreference: accountreference  Index (IS_OPTN) read Faccountreference write Setaccountreference stored accountreference_Specified;
  end;

  streetName3     =  type string;      { "http://dhl.de/webservice/cisbase"[Smpl] }
  dispatchingInformation2 =  type string;      { "http://dhl.de/webservice/cisbase"[Smpl] }
  addressAddition2 =  type string;      { "http://dhl.de/webservice/cisbase"[Smpl] }
  Array_Of_addressAddition2 = array of addressAddition2;   { "http://dhl.de/webservice/cisbase"[Ubnd] }
  streetNumber3   =  type string;      { "http://dhl.de/webservice/cisbase"[Smpl] }


  // ************************************************************************ //
  // XML       : ShipmentNotificationType, global, <complexType>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // ************************************************************************ //
  ShipmentNotificationType = class(TRemotable)
  private
    FrecipientEmailAddress: recipientEmailAddress;
  published
    property recipientEmailAddress: recipientEmailAddress  Index (IS_UNQL) read FrecipientEmailAddress write FrecipientEmailAddress;
  end;



  // ************************************************************************ //
  // XML       : ShipmentService, global, <complexType>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // ************************************************************************ //
  ShipmentService = class(TRemotable)
  private
    FDayOfDelivery: ServiceconfigurationDateOfDelivery;
    FDayOfDelivery_Specified: boolean;
    FDeliveryTimeframe: ServiceconfigurationDeliveryTimeframe;
    FDeliveryTimeframe_Specified: boolean;
    FPreferredTime: ServiceconfigurationDeliveryTimeframe;
    FPreferredTime_Specified: boolean;
    FIndividualSenderRequirement: ServiceconfigurationISR;
    FIndividualSenderRequirement_Specified: boolean;
    FPackagingReturn: Serviceconfiguration;
    FPackagingReturn_Specified: boolean;
    FReturnImmediately: Serviceconfiguration;
    FReturnImmediately_Specified: boolean;
    FNoticeOfNonDeliverability: Serviceconfiguration;
    FNoticeOfNonDeliverability_Specified: boolean;
    FShipmentHandling: ServiceconfigurationShipmentHandling;
    FShipmentHandling_Specified: boolean;
    FEndorsement: ServiceconfigurationEndorsement;
    FEndorsement_Specified: boolean;
    FVisualCheckOfAge: ServiceconfigurationVisualAgeCheck;
    FVisualCheckOfAge_Specified: boolean;
    FPreferredLocation: ServiceconfigurationDetails;
    FPreferredLocation_Specified: boolean;
    FPreferredNeighbour: ServiceconfigurationDetails;
    FPreferredNeighbour_Specified: boolean;
    FPreferredDay: ServiceconfigurationDetails;
    FPreferredDay_Specified: boolean;
    FGoGreen: Serviceconfiguration;
    FGoGreen_Specified: boolean;
    FPerishables: Serviceconfiguration;
    FPerishables_Specified: boolean;
    FPersonally: Serviceconfiguration;
    FPersonally_Specified: boolean;
    FNoNeighbourDelivery: Serviceconfiguration;
    FNoNeighbourDelivery_Specified: boolean;
    FNamedPersonOnly: Serviceconfiguration;
    FNamedPersonOnly_Specified: boolean;
    FReturnReceipt: Serviceconfiguration;
    FReturnReceipt_Specified: boolean;
    FPremium: Serviceconfiguration;
    FPremium_Specified: boolean;
    FCashOnDelivery: ServiceconfigurationCashOnDelivery;
    FCashOnDelivery_Specified: boolean;
    FAdditionalInsurance: ServiceconfigurationAdditionalInsurance;
    FAdditionalInsurance_Specified: boolean;
    FBulkyGoods: Serviceconfiguration;
    FBulkyGoods_Specified: boolean;
    FIdentCheck: ServiceconfigurationIC;
    FIdentCheck_Specified: boolean;
    procedure SetDayOfDelivery(Index: Integer; const AServiceconfigurationDateOfDelivery: ServiceconfigurationDateOfDelivery);
    function  DayOfDelivery_Specified(Index: Integer): boolean;
    procedure SetDeliveryTimeframe(Index: Integer; const AServiceconfigurationDeliveryTimeframe: ServiceconfigurationDeliveryTimeframe);
    function  DeliveryTimeframe_Specified(Index: Integer): boolean;
    procedure SetPreferredTime(Index: Integer; const AServiceconfigurationDeliveryTimeframe: ServiceconfigurationDeliveryTimeframe);
    function  PreferredTime_Specified(Index: Integer): boolean;
    procedure SetIndividualSenderRequirement(Index: Integer; const AServiceconfigurationISR: ServiceconfigurationISR);
    function  IndividualSenderRequirement_Specified(Index: Integer): boolean;
    procedure SetPackagingReturn(Index: Integer; const AServiceconfiguration: Serviceconfiguration);
    function  PackagingReturn_Specified(Index: Integer): boolean;
    procedure SetReturnImmediately(Index: Integer; const AServiceconfiguration: Serviceconfiguration);
    function  ReturnImmediately_Specified(Index: Integer): boolean;
    procedure SetNoticeOfNonDeliverability(Index: Integer; const AServiceconfiguration: Serviceconfiguration);
    function  NoticeOfNonDeliverability_Specified(Index: Integer): boolean;
    procedure SetShipmentHandling(Index: Integer; const AServiceconfigurationShipmentHandling: ServiceconfigurationShipmentHandling);
    function  ShipmentHandling_Specified(Index: Integer): boolean;
    procedure SetEndorsement(Index: Integer; const AServiceconfigurationEndorsement: ServiceconfigurationEndorsement);
    function  Endorsement_Specified(Index: Integer): boolean;
    procedure SetVisualCheckOfAge(Index: Integer; const AServiceconfigurationVisualAgeCheck: ServiceconfigurationVisualAgeCheck);
    function  VisualCheckOfAge_Specified(Index: Integer): boolean;
    procedure SetPreferredLocation(Index: Integer; const AServiceconfigurationDetails: ServiceconfigurationDetails);
    function  PreferredLocation_Specified(Index: Integer): boolean;
    procedure SetPreferredNeighbour(Index: Integer; const AServiceconfigurationDetails: ServiceconfigurationDetails);
    function  PreferredNeighbour_Specified(Index: Integer): boolean;
    procedure SetPreferredDay(Index: Integer; const AServiceconfigurationDetails: ServiceconfigurationDetails);
    function  PreferredDay_Specified(Index: Integer): boolean;
    procedure SetGoGreen(Index: Integer; const AServiceconfiguration: Serviceconfiguration);
    function  GoGreen_Specified(Index: Integer): boolean;
    procedure SetPerishables(Index: Integer; const AServiceconfiguration: Serviceconfiguration);
    function  Perishables_Specified(Index: Integer): boolean;
    procedure SetPersonally(Index: Integer; const AServiceconfiguration: Serviceconfiguration);
    function  Personally_Specified(Index: Integer): boolean;
    procedure SetNoNeighbourDelivery(Index: Integer; const AServiceconfiguration: Serviceconfiguration);
    function  NoNeighbourDelivery_Specified(Index: Integer): boolean;
    procedure SetNamedPersonOnly(Index: Integer; const AServiceconfiguration: Serviceconfiguration);
    function  NamedPersonOnly_Specified(Index: Integer): boolean;
    procedure SetReturnReceipt(Index: Integer; const AServiceconfiguration: Serviceconfiguration);
    function  ReturnReceipt_Specified(Index: Integer): boolean;
    procedure SetPremium(Index: Integer; const AServiceconfiguration: Serviceconfiguration);
    function  Premium_Specified(Index: Integer): boolean;
    procedure SetCashOnDelivery(Index: Integer; const AServiceconfigurationCashOnDelivery: ServiceconfigurationCashOnDelivery);
    function  CashOnDelivery_Specified(Index: Integer): boolean;
    procedure SetAdditionalInsurance(Index: Integer; const AServiceconfigurationAdditionalInsurance: ServiceconfigurationAdditionalInsurance);
    function  AdditionalInsurance_Specified(Index: Integer): boolean;
    procedure SetBulkyGoods(Index: Integer; const AServiceconfiguration: Serviceconfiguration);
    function  BulkyGoods_Specified(Index: Integer): boolean;
    procedure SetIdentCheck(Index: Integer; const AServiceconfigurationIC: ServiceconfigurationIC);
    function  IdentCheck_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property DayOfDelivery:               ServiceconfigurationDateOfDelivery       Index (IS_OPTN or IS_UNQL) read FDayOfDelivery write SetDayOfDelivery stored DayOfDelivery_Specified;
    property DeliveryTimeframe:           ServiceconfigurationDeliveryTimeframe    Index (IS_OPTN or IS_UNQL) read FDeliveryTimeframe write SetDeliveryTimeframe stored DeliveryTimeframe_Specified;
    property PreferredTime:               ServiceconfigurationDeliveryTimeframe    Index (IS_OPTN or IS_UNQL) read FPreferredTime write SetPreferredTime stored PreferredTime_Specified;
    property IndividualSenderRequirement: ServiceconfigurationISR                  Index (IS_OPTN or IS_UNQL) read FIndividualSenderRequirement write SetIndividualSenderRequirement stored IndividualSenderRequirement_Specified;
    property PackagingReturn:             Serviceconfiguration                     Index (IS_OPTN or IS_UNQL) read FPackagingReturn write SetPackagingReturn stored PackagingReturn_Specified;
    property ReturnImmediately:           Serviceconfiguration                     Index (IS_OPTN or IS_UNQL) read FReturnImmediately write SetReturnImmediately stored ReturnImmediately_Specified;
    property NoticeOfNonDeliverability:   Serviceconfiguration                     Index (IS_OPTN or IS_UNQL) read FNoticeOfNonDeliverability write SetNoticeOfNonDeliverability stored NoticeOfNonDeliverability_Specified;
    property ShipmentHandling:            ServiceconfigurationShipmentHandling     Index (IS_OPTN or IS_UNQL) read FShipmentHandling write SetShipmentHandling stored ShipmentHandling_Specified;
    property Endorsement:                 ServiceconfigurationEndorsement          Index (IS_OPTN or IS_UNQL) read FEndorsement write SetEndorsement stored Endorsement_Specified;
    property VisualCheckOfAge:            ServiceconfigurationVisualAgeCheck       Index (IS_OPTN or IS_UNQL) read FVisualCheckOfAge write SetVisualCheckOfAge stored VisualCheckOfAge_Specified;
    property PreferredLocation:           ServiceconfigurationDetails              Index (IS_OPTN or IS_UNQL) read FPreferredLocation write SetPreferredLocation stored PreferredLocation_Specified;
    property PreferredNeighbour:          ServiceconfigurationDetails              Index (IS_OPTN or IS_UNQL) read FPreferredNeighbour write SetPreferredNeighbour stored PreferredNeighbour_Specified;
    property PreferredDay:                ServiceconfigurationDetails              Index (IS_OPTN or IS_UNQL) read FPreferredDay write SetPreferredDay stored PreferredDay_Specified;
    property GoGreen:                     Serviceconfiguration                     Index (IS_OPTN or IS_UNQL) read FGoGreen write SetGoGreen stored GoGreen_Specified;
    property Perishables:                 Serviceconfiguration                     Index (IS_OPTN or IS_UNQL) read FPerishables write SetPerishables stored Perishables_Specified;
    property Personally:                  Serviceconfiguration                     Index (IS_OPTN or IS_UNQL) read FPersonally write SetPersonally stored Personally_Specified;
    property NoNeighbourDelivery:         Serviceconfiguration                     Index (IS_OPTN or IS_UNQL) read FNoNeighbourDelivery write SetNoNeighbourDelivery stored NoNeighbourDelivery_Specified;
    property NamedPersonOnly:             Serviceconfiguration                     Index (IS_OPTN or IS_UNQL) read FNamedPersonOnly write SetNamedPersonOnly stored NamedPersonOnly_Specified;
    property ReturnReceipt:               Serviceconfiguration                     Index (IS_OPTN or IS_UNQL) read FReturnReceipt write SetReturnReceipt stored ReturnReceipt_Specified;
    property Premium:                     Serviceconfiguration                     Index (IS_OPTN or IS_UNQL) read FPremium write SetPremium stored Premium_Specified;
    property CashOnDelivery:              ServiceconfigurationCashOnDelivery       Index (IS_OPTN or IS_UNQL) read FCashOnDelivery write SetCashOnDelivery stored CashOnDelivery_Specified;
    property AdditionalInsurance:         ServiceconfigurationAdditionalInsurance  Index (IS_OPTN or IS_UNQL) read FAdditionalInsurance write SetAdditionalInsurance stored AdditionalInsurance_Specified;
    property BulkyGoods:                  Serviceconfiguration                     Index (IS_OPTN or IS_UNQL) read FBulkyGoods write SetBulkyGoods stored BulkyGoods_Specified;
    property IdentCheck:                  ServiceconfigurationIC                   Index (IS_OPTN or IS_UNQL) read FIdentCheck write SetIdentCheck stored IdentCheck_Specified;
  end;

  widthInCM       =  type Int64;      { "http://dhl.de/webservices/businesscustomershipping"[Smpl] }
  lengthInCM      =  type Int64;      { "http://dhl.de/webservices/businesscustomershipping"[Smpl] }
  weightInKG      = class(TXSDecimal) end;      { "http://dhl.de/webservices/businesscustomershipping"[Smpl] }
  additionalFee   = class(TXSDecimal) end;      { "http://dhl.de/webservices/businesscustomershipping"[Smpl] }
  netWeightInKG   = class(TXSDecimal) end;      { "http://dhl.de/webservices/businesscustomershipping"[Smpl] }
  customsValue    = class(TXSDecimal) end;      { "http://dhl.de/webservices/businesscustomershipping"[Smpl] }


  // ************************************************************************ //
  // XML       : ExportDocPosition, <complexType>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // ************************************************************************ //
  ExportDocPosition = class(TRemotable)
  private
    Fdescription: description;
    FcountryCodeOrigin: countryCodeOrigin;
    FcustomsTariffNumber: customsTariffNumber;
    Famount: amount;
    FnetWeightInKG: netWeightInKG;
    FcustomsValue: customsValue;
  public
    destructor Destroy; override;
  published
    property description:         description          Index (IS_UNQL) read Fdescription write Fdescription;
    property countryCodeOrigin:   countryCodeOrigin    Index (IS_UNQL) read FcountryCodeOrigin write FcountryCodeOrigin;
    property customsTariffNumber: customsTariffNumber  Index (IS_UNQL) read FcustomsTariffNumber write FcustomsTariffNumber;
    property amount:              amount               Index (IS_UNQL) read Famount write Famount;
    property netWeightInKG:       netWeightInKG        Index (IS_UNQL) read FnetWeightInKG write FnetWeightInKG;
    property customsValue:        customsValue         Index (IS_UNQL) read FcustomsValue write FcustomsValue;
  end;

  shipmentDate    =  type string;      { "http://dhl.de/webservices/businesscustomershipping"[Smpl] }
  customerReference =  type string;      { "http://dhl.de/webservices/businesscustomershipping"[Smpl] }
  returnShipmentReference =  type string;      { "http://dhl.de/webservices/businesscustomershipping"[Smpl] }
  returnShipmentAccountNumber =  type string;      { "http://dhl.de/webservices/businesscustomershipping"[Smpl] }
  heightInCM      =  type Int64;      { "http://dhl.de/webservices/businesscustomershipping"[Smpl] }


  // ************************************************************************ //
  // XML       : ShipmentItemType, global, <complexType>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // ************************************************************************ //
  ShipmentItemType = class(TRemotable)
  private
    FweightInKG: weightInKG;
    FlengthInCM: lengthInCM;
    FlengthInCM_Specified: boolean;
    FwidthInCM: widthInCM;
    FwidthInCM_Specified: boolean;
    FheightInCM: heightInCM;
    FheightInCM_Specified: boolean;
    procedure SetlengthInCM(Index: Integer; const AlengthInCM: lengthInCM);
    function  lengthInCM_Specified(Index: Integer): boolean;
    procedure SetwidthInCM(Index: Integer; const AwidthInCM: widthInCM);
    function  widthInCM_Specified(Index: Integer): boolean;
    procedure SetheightInCM(Index: Integer; const AheightInCM: heightInCM);
    function  heightInCM_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property weightInKG: weightInKG  Index (IS_UNQL) read FweightInKG write FweightInKG;
    property lengthInCM: lengthInCM  Index (IS_OPTN or IS_UNQL) read FlengthInCM write SetlengthInCM stored lengthInCM_Specified;
    property widthInCM:  widthInCM   Index (IS_OPTN or IS_UNQL) read FwidthInCM write SetwidthInCM stored widthInCM_Specified;
    property heightInCM: heightInCM  Index (IS_OPTN or IS_UNQL) read FheightInCM write SetheightInCM stored heightInCM_Specified;
  end;



  // ************************************************************************ //
  // XML       : ServiceconfigurationCashOnDelivery, global, <complexType>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // ************************************************************************ //
  ServiceconfigurationCashOnDelivery = class(TRemotable)
  private
    Factive: string;
    FaddFee: string;
    FaddFee_Specified: boolean;
    FcodAmount: string;
    procedure SetaddFee(Index: Integer; const Astring: string);
    function  addFee_Specified(Index: Integer): boolean;
  published
    property active:    string  Index (IS_ATTR) read Factive write Factive;
    property addFee:    string  Index (IS_ATTR or IS_OPTN) read FaddFee write SetaddFee stored addFee_Specified;
    property codAmount: string  Index (IS_ATTR) read FcodAmount write FcodAmount;
  end;



  // ************************************************************************ //
  // XML       : ServiceconfigurationDetails, global, <complexType>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // ************************************************************************ //
  ServiceconfigurationDetails = class(TRemotable)
  private
    Factive: string;
    Fdetails: string;
  published
    property active:  string  Index (IS_ATTR) read Factive write Factive;
    property details: string  Index (IS_ATTR) read Fdetails write Fdetails;
  end;



  // ************************************************************************ //
  // XML       : ServiceconfigurationVisualAgeCheck, global, <complexType>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // ************************************************************************ //
  ServiceconfigurationVisualAgeCheck = class(TRemotable)
  private
    Factive: string;
    Ftype_: string;
  published
    property active: string  Index (IS_ATTR) read Factive write Factive;
    property type_:  string  Index (IS_ATTR) read Ftype_ write Ftype_;
  end;



  // ************************************************************************ //
  // XML       : Ident, <complexType>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // ************************************************************************ //
  Ident = class(TRemotable)
  private
    Fsurname: surname;
    FgivenName: givenName;
    FdateOfBirth: dateOfBirth;
    FminimumAge: minimumAge;
  published
    property surname:     surname      Index (IS_UNQL) read Fsurname write Fsurname;
    property givenName:   givenName    Index (IS_UNQL) read FgivenName write FgivenName;
    property dateOfBirth: dateOfBirth  Index (IS_UNQL) read FdateOfBirth write FdateOfBirth;
    property minimumAge:  minimumAge   Index (IS_UNQL) read FminimumAge write FminimumAge;
  end;



  // ************************************************************************ //
  // XML       : ServiceconfigurationIC, global, <complexType>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // ************************************************************************ //
  ServiceconfigurationIC = class(TRemotable)
  private
    Factive: string;
    FIdent: Ident;
  public
    destructor Destroy; override;
  published
    property active: string  Index (IS_ATTR) read Factive write Factive;
    property Ident:  Ident   Index (IS_UNQL) read FIdent write FIdent;
  end;



  // ************************************************************************ //
  // XML       : ServiceconfigurationAdditionalInsurance, global, <complexType>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // ************************************************************************ //
  ServiceconfigurationAdditionalInsurance = class(TRemotable)
  private
    Factive: string;
    FinsuranceAmount: string;
  published
    property active:          string  Index (IS_ATTR) read Factive write Factive;
    property insuranceAmount: string  Index (IS_ATTR) read FinsuranceAmount write FinsuranceAmount;
  end;



  // ************************************************************************ //
  // XML       : ServiceconfigurationDeliveryTimeframe, global, <complexType>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // ************************************************************************ //
  ServiceconfigurationDeliveryTimeframe = class(TRemotable)
  private
    Factive: string;
    Ftype_: string;
  published
    property active: string  Index (IS_ATTR) read Factive write Factive;
    property type_:  string  Index (IS_ATTR) read Ftype_ write Ftype_;
  end;



  // ************************************************************************ //
  // XML       : ServiceconfigurationDateOfDelivery, global, <complexType>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // ************************************************************************ //
  ServiceconfigurationDateOfDelivery = class(TRemotable)
  private
    Factive: string;
    Fdetails: string;
  published
    property active:  string  Index (IS_ATTR) read Factive write Factive;
    property details: string  Index (IS_ATTR) read Fdetails write Fdetails;
  end;



  // ************************************************************************ //
  // XML       : ShipmentItemTypeType, global, <complexType>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // ************************************************************************ //
  ShipmentItemTypeType = class(ShipmentItemType)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : ServiceconfigurationEndorsement, global, <complexType>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // ************************************************************************ //
  ServiceconfigurationEndorsement = class(TRemotable)
  private
    Factive: string;
    Ftype_: string;
  published
    property active: string  Index (IS_ATTR) read Factive write Factive;
    property type_:  string  Index (IS_ATTR) read Ftype_ write Ftype_;
  end;



  // ************************************************************************ //
  // XML       : ServiceconfigurationShipmentHandling, global, <complexType>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // ************************************************************************ //
  ServiceconfigurationShipmentHandling = class(TRemotable)
  private
    Factive: string;
    Ftype_: string;
  published
    property active: string  Index (IS_ATTR) read Factive write Factive;
    property type_:  string  Index (IS_ATTR) read Ftype_ write Ftype_;
  end;



  // ************************************************************************ //
  // XML       : ServiceconfigurationISR, global, <complexType>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // ************************************************************************ //
  ServiceconfigurationISR = class(TRemotable)
  private
    Factive: string;
    Fdetails: string;
  published
    property active:  string  Index (IS_ATTR) read Factive write Factive;
    property details: string  Index (IS_ATTR) read Fdetails write Fdetails;
  end;

  shipmentNumber2 =  type string;      { "http://dhl.de/webservice/cisbase"[Smpl] }
  shipmentNumber  =  type shipmentNumber2;      { "http://dhl.de/webservice/cisbase"[GblElm] }
  Array_Of_shipmentNumber = array of shipmentNumber;   { "http://dhl.de/webservice/cisbase"[GblUbnd] }


  // ************************************************************************ //
  // XML       : DoManifestRequest, global, <element>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  DoManifestRequest = class(TRemotable)
  private
    FVersion: Version;
    FshipmentNumber: Array_Of_shipmentNumber;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property Version:        Version                  Index (IS_REF) read FVersion write FVersion;
    property shipmentNumber: Array_Of_shipmentNumber  Index (IS_UNBD or IS_REF) read FshipmentNumber write FshipmentNumber;
  end;



  // ************************************************************************ //
  // XML       : GetExportDocRequest, global, <element>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  GetExportDocRequest = class(TRemotable)
  private
    FVersion: Version;
    FshipmentNumber: Array_Of_shipmentNumber;
    FexportDocResponseType: exportDocResponseType;
    FexportDocResponseType_Specified: boolean;
    procedure SetexportDocResponseType(Index: Integer; const AexportDocResponseType: exportDocResponseType);
    function  exportDocResponseType_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property Version:               Version                  Index (IS_REF) read FVersion write FVersion;
    property shipmentNumber:        Array_Of_shipmentNumber  Index (IS_UNBD or IS_REF) read FshipmentNumber write FshipmentNumber;
    property exportDocResponseType: exportDocResponseType    Index (IS_OPTN or IS_UNQL) read FexportDocResponseType write SetexportDocResponseType stored exportDocResponseType_Specified;
  end;



  // ************************************************************************ //
  // XML       : DeleteShipmentOrderRequest, global, <element>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  DeleteShipmentOrderRequest = class(TRemotable)
  private
    FVersion: Version;
    FshipmentNumber: Array_Of_shipmentNumber;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property Version:        Version                  Index (IS_REF) read FVersion write FVersion;
    property shipmentNumber: Array_Of_shipmentNumber  Index (IS_UNBD or IS_REF) read FshipmentNumber write FshipmentNumber;
  end;



  // ************************************************************************ //
  // XML       : GetLabelRequest, global, <element>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  GetLabelRequest = class(TRemotable)
  private
    FVersion: Version;
    FshipmentNumber: Array_Of_shipmentNumber;
    FlabelResponseType: labelResponseType;
    FlabelResponseType_Specified: boolean;
    procedure SetlabelResponseType(Index: Integer; const AlabelResponseType: labelResponseType);
    function  labelResponseType_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property Version:           Version                  Index (IS_REF) read FVersion write FVersion;
    property shipmentNumber:    Array_Of_shipmentNumber  Index (IS_UNBD or IS_REF) read FshipmentNumber write FshipmentNumber;
    property labelResponseType: labelResponseType        Index (IS_OPTN or IS_UNQL) read FlabelResponseType write SetlabelResponseType stored labelResponseType_Specified;
  end;



  // ************************************************************************ //
  // XML       : UpdateShipmentOrderRequest, global, <element>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  UpdateShipmentOrderRequest = class(TRemotable)
  private
    FVersion: Version;
    FshipmentNumber: shipmentNumber;
    FShipmentOrder: ShipmentOrderType;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property Version:        Version            Index (IS_REF) read FVersion write FVersion;
    property shipmentNumber: shipmentNumber     Index (IS_REF) read FshipmentNumber write FshipmentNumber;
    property ShipmentOrder:  ShipmentOrderType  Index (IS_UNQL) read FShipmentOrder write FShipmentOrder;
  end;



  // ************************************************************************ //
  // XML       : ExportDocData, global, <complexType>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // ************************************************************************ //
  ExportDocData = class(TRemotable)
  private
    FshipmentNumber: shipmentNumber;
    FStatus: Statusinformation;
    FexportDocData: TByteDynArray;
    FexportDocData_Specified: boolean;
    FexportDocURL: string;
    FexportDocURL_Specified: boolean;
    procedure SetexportDocData(Index: Integer; const ATByteDynArray: TByteDynArray);
    function  exportDocData_Specified(Index: Integer): boolean;
    procedure SetexportDocURL(Index: Integer; const Astring: string);
    function  exportDocURL_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property shipmentNumber: shipmentNumber     Index (IS_REF) read FshipmentNumber write FshipmentNumber;
    property Status:         Statusinformation  Index (IS_UNQL) read FStatus write FStatus;
    property exportDocData:  TByteDynArray      Index (IS_OPTN or IS_UNQL) read FexportDocData write SetexportDocData stored exportDocData_Specified;
    property exportDocURL:   string             Index (IS_OPTN or IS_UNQL) read FexportDocURL write SetexportDocURL stored exportDocURL_Specified;
  end;



  // ************************************************************************ //
  // XML       : DeletionState, global, <complexType>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // ************************************************************************ //
  DeletionState = class(TRemotable)
  private
    FshipmentNumber: shipmentNumber;
    FStatus: Statusinformation;
  public
    destructor Destroy; override;
  published
    property shipmentNumber: shipmentNumber     Index (IS_REF) read FshipmentNumber write FshipmentNumber;
    property Status:         Statusinformation  Index (IS_UNQL) read FStatus write FStatus;
  end;



  // ************************************************************************ //
  // XML       : ManifestState, global, <complexType>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // ************************************************************************ //
  ManifestState = class(TRemotable)
  private
    FshipmentNumber: shipmentNumber;
    FStatus: Statusinformation;
  public
    destructor Destroy; override;
  published
    property shipmentNumber: shipmentNumber     Index (IS_REF) read FshipmentNumber write FshipmentNumber;
    property Status:         Statusinformation  Index (IS_UNQL) read FStatus write FStatus;
  end;

  name32          =  type string;      { "http://dhl.de/webservice/cisbase"[Smpl] }
  name3           =  type name32;      { "http://dhl.de/webservice/cisbase"[GblElm] }


  // ************************************************************************ //
  // XML       : LabelData, global, <complexType>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // ************************************************************************ //
  LabelData = class(TRemotable)
  private
    FStatus: Statusinformation;
    FshipmentNumber: shipmentNumber;
    FshipmentNumber_Specified: boolean;
    FlabelUrl: string;
    FlabelUrl_Specified: boolean;
    FlabelData: TByteDynArray;
    FlabelData_Specified: boolean;
    FreturnLabelUrl: string;
    FreturnLabelUrl_Specified: boolean;
    FreturnLabelData: TByteDynArray;
    FreturnLabelData_Specified: boolean;
    FexportLabelUrl: string;
    FexportLabelUrl_Specified: boolean;
    FexportLabelData: TByteDynArray;
    FexportLabelData_Specified: boolean;
    FcodLabelUrl: string;
    FcodLabelUrl_Specified: boolean;
    FcodLabelData: TByteDynArray;
    FcodLabelData_Specified: boolean;
    procedure SetshipmentNumber(Index: Integer; const AshipmentNumber: shipmentNumber);
    function  shipmentNumber_Specified(Index: Integer): boolean;
    procedure SetlabelUrl(Index: Integer; const Astring: string);
    function  labelUrl_Specified(Index: Integer): boolean;
    procedure SetlabelData(Index: Integer; const ATByteDynArray: TByteDynArray);
    function  labelData_Specified(Index: Integer): boolean;
    procedure SetreturnLabelUrl(Index: Integer; const Astring: string);
    function  returnLabelUrl_Specified(Index: Integer): boolean;
    procedure SetreturnLabelData(Index: Integer; const ATByteDynArray: TByteDynArray);
    function  returnLabelData_Specified(Index: Integer): boolean;
    procedure SetexportLabelUrl(Index: Integer; const Astring: string);
    function  exportLabelUrl_Specified(Index: Integer): boolean;
    procedure SetexportLabelData(Index: Integer; const ATByteDynArray: TByteDynArray);
    function  exportLabelData_Specified(Index: Integer): boolean;
    procedure SetcodLabelUrl(Index: Integer; const Astring: string);
    function  codLabelUrl_Specified(Index: Integer): boolean;
    procedure SetcodLabelData(Index: Integer; const ATByteDynArray: TByteDynArray);
    function  codLabelData_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property Status:          Statusinformation  Index (IS_UNQL) read FStatus write FStatus;
    property shipmentNumber:  shipmentNumber     Index (IS_OPTN or IS_REF) read FshipmentNumber write SetshipmentNumber stored shipmentNumber_Specified;
    property labelUrl:        string             Index (IS_OPTN or IS_UNQL) read FlabelUrl write SetlabelUrl stored labelUrl_Specified;
    property labelData:       TByteDynArray      Index (IS_OPTN or IS_UNQL) read FlabelData write SetlabelData stored labelData_Specified;
    property returnLabelUrl:  string             Index (IS_OPTN or IS_UNQL) read FreturnLabelUrl write SetreturnLabelUrl stored returnLabelUrl_Specified;
    property returnLabelData: TByteDynArray      Index (IS_OPTN or IS_UNQL) read FreturnLabelData write SetreturnLabelData stored returnLabelData_Specified;
    property exportLabelUrl:  string             Index (IS_OPTN or IS_UNQL) read FexportLabelUrl write SetexportLabelUrl stored exportLabelUrl_Specified;
    property exportLabelData: TByteDynArray      Index (IS_OPTN or IS_UNQL) read FexportLabelData write SetexportLabelData stored exportLabelData_Specified;
    property codLabelUrl:     string             Index (IS_OPTN or IS_UNQL) read FcodLabelUrl write SetcodLabelUrl stored codLabelUrl_Specified;
    property codLabelData:    TByteDynArray      Index (IS_OPTN or IS_UNQL) read FcodLabelData write SetcodLabelData stored codLabelData_Specified;
  end;

  SequenceNumber  =  type string;      { "http://dhl.de/webservices/businesscustomershipping"[GblSmpl] }


  // ************************************************************************ //
  // XML       : ValidationState, global, <complexType>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // ************************************************************************ //
  ValidationState = class(TRemotable)
  private
    FsequenceNumber: SequenceNumber;
    FStatus: Statusinformation;
  public
    destructor Destroy; override;
  published
    property sequenceNumber: SequenceNumber     Index (IS_UNQL) read FsequenceNumber write FsequenceNumber;
    property Status:         Statusinformation  Index (IS_UNQL) read FStatus write FStatus;
  end;



  // ************************************************************************ //
  // XML       : CreationState, global, <complexType>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // ************************************************************************ //
  CreationState = class(TRemotable)
  private
    FsequenceNumber: SequenceNumber;
    FLabelData: LabelData;
  public
    destructor Destroy; override;
  published
    property sequenceNumber: SequenceNumber  Index (IS_UNQL) read FsequenceNumber write FsequenceNumber;
    property LabelData:      LabelData       Index (IS_UNQL) read FLabelData write FLabelData;
  end;

  city2           =  type string;      { "http://dhl.de/webservice/cisbase"[Smpl] }
  city            =  type city2;      { "http://dhl.de/webservice/cisbase"[GblElm] }


  // ************************************************************************ //
  // XML       : PackStationType, global, <complexType>
  // Namespace : http://dhl.de/webservice/cisbase
  // ************************************************************************ //
  PackStationType = class(TRemotable)
  private
    FpostNumber: postNumber2;
    FpostNumber_Specified: boolean;
    FpackstationNumber: packstationNumber;
    Fzip: zip;
    Fcity: city;
    FOrigin: Origin;
    FOrigin_Specified: boolean;
    procedure SetpostNumber(Index: Integer; const ApostNumber2: postNumber2);
    function  postNumber_Specified(Index: Integer): boolean;
    procedure SetOrigin(Index: Integer; const AOrigin: Origin);
    function  Origin_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property postNumber:        postNumber2        Index (IS_OPTN) read FpostNumber write SetpostNumber stored postNumber_Specified;
    property packstationNumber: packstationNumber  read FpackstationNumber write FpackstationNumber;
    property zip:               zip                Index (IS_REF) read Fzip write Fzip;
    property city:              city               Index (IS_REF) read Fcity write Fcity;
    property Origin:            Origin             Index (IS_OPTN or IS_REF) read FOrigin write SetOrigin stored Origin_Specified;
  end;



  // ************************************************************************ //
  // XML       : PostfilialeType, global, <complexType>
  // Namespace : http://dhl.de/webservice/cisbase
  // ************************************************************************ //
  PostfilialeType = class(TRemotable)
  private
    FpostfilialNumber: postfilialNumber;
    FpostNumber: postNumber;
    Fzip: zip;
    Fcity: city;
    FOrigin: Origin;
    FOrigin_Specified: boolean;
    procedure SetOrigin(Index: Integer; const AOrigin: Origin);
    function  Origin_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property postfilialNumber: postfilialNumber  read FpostfilialNumber write FpostfilialNumber;
    property postNumber:       postNumber        read FpostNumber write FpostNumber;
    property zip:              zip               Index (IS_REF) read Fzip write Fzip;
    property city:             city              Index (IS_REF) read Fcity write Fcity;
    property Origin:           Origin            Index (IS_OPTN or IS_REF) read FOrigin write SetOrigin stored Origin_Specified;
  end;



  // ************************************************************************ //
  // XML       : NativeAddressType, global, <complexType>
  // Namespace : http://dhl.de/webservice/cisbase
  // ************************************************************************ //
  NativeAddressType = class(TRemotable)
  private
    FstreetName: streetName2;
    FstreetNumber: streetNumber;
    FaddressAddition: Array_Of_addressAddition;
    FaddressAddition_Specified: boolean;
    FdispatchingInformation: dispatchingInformation;
    FdispatchingInformation_Specified: boolean;
    Fzip: zip;
    Fcity: city;
    FOrigin: Origin;
    FOrigin_Specified: boolean;
    procedure SetaddressAddition(Index: Integer; const AArray_Of_addressAddition: Array_Of_addressAddition);
    function  addressAddition_Specified(Index: Integer): boolean;
    procedure SetdispatchingInformation(Index: Integer; const AdispatchingInformation: dispatchingInformation);
    function  dispatchingInformation_Specified(Index: Integer): boolean;
    procedure SetOrigin(Index: Integer; const AOrigin: Origin);
    function  Origin_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property streetName:             streetName2               read FstreetName write FstreetName;
    property streetNumber:           streetNumber              read FstreetNumber write FstreetNumber;
    property addressAddition:        Array_Of_addressAddition  Index (IS_OPTN or IS_UNBD) read FaddressAddition write SetaddressAddition stored addressAddition_Specified;
    property dispatchingInformation: dispatchingInformation    Index (IS_OPTN) read FdispatchingInformation write SetdispatchingInformation stored dispatchingInformation_Specified;
    property zip:                    zip                       Index (IS_REF) read Fzip write Fzip;
    property city:                   city                      Index (IS_REF) read Fcity write Fcity;
    property Origin:                 Origin                    Index (IS_OPTN or IS_REF) read FOrigin write SetOrigin stored Origin_Specified;
  end;



  // ************************************************************************ //
  // XML       : ParcelShopType, global, <complexType>
  // Namespace : http://dhl.de/webservice/cisbase
  // ************************************************************************ //
  ParcelShopType = class(TRemotable)
  private
    FparcelShopNumber: parcelShopNumber;
    FstreetName: streetName;
    FstreetName_Specified: boolean;
    FstreetNumber: streetNumber2;
    FstreetNumber_Specified: boolean;
    Fzip: zip;
    Fcity: city;
    FOrigin: Origin;
    FOrigin_Specified: boolean;
    procedure SetstreetName(Index: Integer; const AstreetName: streetName);
    function  streetName_Specified(Index: Integer): boolean;
    procedure SetstreetNumber(Index: Integer; const AstreetNumber2: streetNumber2);
    function  streetNumber_Specified(Index: Integer): boolean;
    procedure SetOrigin(Index: Integer; const AOrigin: Origin);
    function  Origin_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property parcelShopNumber: parcelShopNumber  read FparcelShopNumber write FparcelShopNumber;
    property streetName:       streetName        Index (IS_OPTN) read FstreetName write SetstreetName stored streetName_Specified;
    property streetNumber:     streetNumber2     Index (IS_OPTN) read FstreetNumber write SetstreetNumber stored streetNumber_Specified;
    property zip:              zip               Index (IS_REF) read Fzip write Fzip;
    property city:             city              Index (IS_REF) read Fcity write Fcity;
    property Origin:           Origin            Index (IS_OPTN or IS_REF) read FOrigin write SetOrigin stored Origin_Specified;
  end;

  accountNumber2  =  type string;      { "http://dhl.de/webservice/cisbase"[Smpl] }
  accountNumber   =  type accountNumber2;      { "http://dhl.de/webservice/cisbase"[GblElm] }


  // ************************************************************************ //
  // XML       : ShipmentDetailsType, global, <complexType>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // ************************************************************************ //
  ShipmentDetailsType = class(TRemotable)
  private
    Fproduct: string;
    FaccountNumber: accountNumber;
    FcustomerReference: customerReference;
    FcustomerReference_Specified: boolean;
    FshipmentDate: shipmentDate;
    FreturnShipmentAccountNumber: returnShipmentAccountNumber;
    FreturnShipmentAccountNumber_Specified: boolean;
    FreturnShipmentReference: returnShipmentReference;
    FreturnShipmentReference_Specified: boolean;
    procedure SetcustomerReference(Index: Integer; const AcustomerReference: customerReference);
    function  customerReference_Specified(Index: Integer): boolean;
    procedure SetreturnShipmentAccountNumber(Index: Integer; const AreturnShipmentAccountNumber: returnShipmentAccountNumber);
    function  returnShipmentAccountNumber_Specified(Index: Integer): boolean;
    procedure SetreturnShipmentReference(Index: Integer; const AreturnShipmentReference: returnShipmentReference);
    function  returnShipmentReference_Specified(Index: Integer): boolean;
  published
    property product:                     string                       Index (IS_UNQL) read Fproduct write Fproduct;
    property accountNumber:               accountNumber                Index (IS_REF) read FaccountNumber write FaccountNumber;
    property customerReference:           customerReference            Index (IS_OPTN or IS_UNQL) read FcustomerReference write SetcustomerReference stored customerReference_Specified;
    property shipmentDate:                shipmentDate                 Index (IS_UNQL) read FshipmentDate write FshipmentDate;
    property returnShipmentAccountNumber: returnShipmentAccountNumber  Index (IS_OPTN or IS_UNQL) read FreturnShipmentAccountNumber write SetreturnShipmentAccountNumber stored returnShipmentAccountNumber_Specified;
    property returnShipmentReference:     returnShipmentReference      Index (IS_OPTN or IS_UNQL) read FreturnShipmentReference write SetreturnShipmentReference stored returnShipmentReference_Specified;
  end;

  name22          =  type string;      { "http://dhl.de/webservice/cisbase"[Smpl] }
  name2           =  type name22;      { "http://dhl.de/webservice/cisbase"[GblElm] }


  // ************************************************************************ //
  // XML       : ReceiverNativeAddressType, global, <complexType>
  // Namespace : http://dhl.de/webservice/cisbase
  // ************************************************************************ //
  ReceiverNativeAddressType = class(TRemotable)
  private
    Fname2: name2;
    Fname2_Specified: boolean;
    Fname3: name3;
    Fname3_Specified: boolean;
    FstreetName: streetName3;
    FstreetNumber: streetNumber3;
    FaddressAddition: Array_Of_addressAddition2;
    FaddressAddition_Specified: boolean;
    FdispatchingInformation: dispatchingInformation2;
    FdispatchingInformation_Specified: boolean;
    Fzip: zip;
    Fcity: city;
    FOrigin: Origin;
    FOrigin_Specified: boolean;
    procedure Setname2(Index: Integer; const Aname2: name2);
    function  name2_Specified(Index: Integer): boolean;
    procedure Setname3(Index: Integer; const Aname3: name3);
    function  name3_Specified(Index: Integer): boolean;
    procedure SetaddressAddition(Index: Integer; const AArray_Of_addressAddition2: Array_Of_addressAddition2);
    function  addressAddition_Specified(Index: Integer): boolean;
    procedure SetdispatchingInformation(Index: Integer; const AdispatchingInformation2: dispatchingInformation2);
    function  dispatchingInformation_Specified(Index: Integer): boolean;
    procedure SetOrigin(Index: Integer; const AOrigin: Origin);
    function  Origin_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property name2:                  name2                      Index (IS_OPTN or IS_REF) read Fname2 write Setname2 stored name2_Specified;
    property name3:                  name3                      Index (IS_OPTN or IS_REF) read Fname3 write Setname3 stored name3_Specified;
    property streetName:             streetName3                read FstreetName write FstreetName;
    property streetNumber:           streetNumber3              read FstreetNumber write FstreetNumber;
    property addressAddition:        Array_Of_addressAddition2  Index (IS_OPTN or IS_UNBD) read FaddressAddition write SetaddressAddition stored addressAddition_Specified;
    property dispatchingInformation: dispatchingInformation2    Index (IS_OPTN) read FdispatchingInformation write SetdispatchingInformation stored dispatchingInformation_Specified;
    property zip:                    zip                        Index (IS_REF) read Fzip write Fzip;
    property city:                   city                       Index (IS_REF) read Fcity write Fcity;
    property Origin:                 Origin                     Index (IS_OPTN or IS_REF) read FOrigin write SetOrigin stored Origin_Specified;
  end;

  name12          =  type string;      { "http://dhl.de/webservice/cisbase"[Smpl] }
  name1           =  type name12;      { "http://dhl.de/webservice/cisbase"[GblElm] }


  // ************************************************************************ //
  // XML       : NameType, global, <complexType>
  // Namespace : http://dhl.de/webservice/cisbase
  // ************************************************************************ //
  NameType = class(TRemotable)
  private
    Fname1: name1;
    Fname2: name2;
    Fname2_Specified: boolean;
    Fname3: name3;
    Fname3_Specified: boolean;
    procedure Setname2(Index: Integer; const Aname2: name2);
    function  name2_Specified(Index: Integer): boolean;
    procedure Setname3(Index: Integer; const Aname3: name3);
    function  name3_Specified(Index: Integer): boolean;
  published
    property name1: name1  Index (IS_REF) read Fname1 write Fname1;
    property name2: name2  Index (IS_OPTN or IS_REF) read Fname2 write Setname2 stored name2_Specified;
    property name3: name3  Index (IS_OPTN or IS_REF) read Fname3 write Setname3 stored name3_Specified;
  end;



  // ************************************************************************ //
  // XML       : Authentification, global, <element>
  // Namespace : http://dhl.de/webservice/cisbase
  // Info      : Header
  // ************************************************************************ //
  Authentification = class(AuthentificationType)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : Statusinformation, global, <complexType>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // ************************************************************************ //
  Statusinformation = class(TRemotable)
  private
    FstatusCode: Int64;
    FstatusText: string;
    FstatusMessage: Array_Of_string;
  published
    property statusCode:    Int64            Index (IS_UNQL) read FstatusCode write FstatusCode;
    property statusText:    string           Index (IS_UNQL) read FstatusText write FstatusText;
    property statusMessage: Array_Of_string  Index (IS_UNBD or IS_UNQL) read FstatusMessage write FstatusMessage;
  end;



  // ************************************************************************ //
  // XML       : ValidateShipmentOrderType, global, <complexType>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // ************************************************************************ //
  ValidateShipmentOrderType = class(TRemotable)
  private
    FsequenceNumber: SequenceNumber;
    FShipment: Shipment;
    FPrintOnlyIfCodeable: Serviceconfiguration;
    FPrintOnlyIfCodeable_Specified: boolean;
    procedure SetPrintOnlyIfCodeable(Index: Integer; const AServiceconfiguration: Serviceconfiguration);
    function  PrintOnlyIfCodeable_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property sequenceNumber:      SequenceNumber        Index (IS_UNQL) read FsequenceNumber write FsequenceNumber;
    property Shipment:            Shipment              Index (IS_UNQL) read FShipment write FShipment;
    property PrintOnlyIfCodeable: Serviceconfiguration  Index (IS_OPTN or IS_UNQL) read FPrintOnlyIfCodeable write SetPrintOnlyIfCodeable stored PrintOnlyIfCodeable_Specified;
  end;



  // ************************************************************************ //
  // XML       : Serviceconfiguration, global, <complexType>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // ************************************************************************ //
  Serviceconfiguration = class(TRemotable)
  private
    Factive: string;
  published
    property active: string  Index (IS_ATTR) read Factive write Factive;
  end;



  // ************************************************************************ //
  // XML       : ReceiverTypeType, global, <complexType>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // ************************************************************************ //
  ReceiverTypeType = class(TRemotable)
  private
    Fname1: name1;
    FAddress: ReceiverNativeAddressType;
    FAddress_Specified: boolean;
    FPackstation: PackStationType;
    FPackstation_Specified: boolean;
    FPostfiliale: PostfilialeType;
    FPostfiliale_Specified: boolean;
    FParcelShop: ParcelShopType;
    FParcelShop_Specified: boolean;
    FCommunication: CommunicationType;
    procedure SetAddress(Index: Integer; const AReceiverNativeAddressType: ReceiverNativeAddressType);
    function  Address_Specified(Index: Integer): boolean;
    procedure SetPackstation(Index: Integer; const APackStationType: PackStationType);
    function  Packstation_Specified(Index: Integer): boolean;
    procedure SetPostfiliale(Index: Integer; const APostfilialeType: PostfilialeType);
    function  Postfiliale_Specified(Index: Integer): boolean;
    procedure SetParcelShop(Index: Integer; const AParcelShopType: ParcelShopType);
    function  ParcelShop_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property name1:         name1                      Index (IS_REF) read Fname1 write Fname1;
    property Address:       ReceiverNativeAddressType  Index (IS_OPTN or IS_UNQL) read FAddress write SetAddress stored Address_Specified;
    property Packstation:   PackStationType            Index (IS_OPTN or IS_UNQL) read FPackstation write SetPackstation stored Packstation_Specified;
    property Postfiliale:   PostfilialeType            Index (IS_OPTN or IS_UNQL) read FPostfiliale write SetPostfiliale stored Postfiliale_Specified;
    property ParcelShop:    ParcelShopType             Index (IS_OPTN or IS_UNQL) read FParcelShop write SetParcelShop stored ParcelShop_Specified;
    property Communication: CommunicationType          Index (IS_UNQL) read FCommunication write FCommunication;
  end;



  // ************************************************************************ //
  // XML       : ShipperTypeType, global, <complexType>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // ************************************************************************ //
  ShipperTypeType = class(TRemotable)
  private
    FName_: NameType;
    FAddress: NativeAddressType;
    FCommunication: CommunicationType;
  public
    destructor Destroy; override;
  published
    property Name_:         NameType           Index (IS_UNQL) read FName_ write FName_;
    property Address:       NativeAddressType  Index (IS_UNQL) read FAddress write FAddress;
    property Communication: CommunicationType  Index (IS_UNQL) read FCommunication write FCommunication;
  end;



  // ************************************************************************ //
  // XML       : Shipment, <complexType>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // ************************************************************************ //
  Shipment = class(TRemotable)
  private
    FShipmentDetails: ShipmentDetailsTypeType;
    FShipper: ShipperType;
    FReceiver: ReceiverType;
    FReturnReceiver: ShipperType;
    FReturnReceiver_Specified: boolean;
    FExportDocument: ExportDocumentType;
    FExportDocument_Specified: boolean;
    procedure SetReturnReceiver(Index: Integer; const AShipperType: ShipperType);
    function  ReturnReceiver_Specified(Index: Integer): boolean;
    procedure SetExportDocument(Index: Integer; const AExportDocumentType: ExportDocumentType);
    function  ExportDocument_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property ShipmentDetails: ShipmentDetailsTypeType  Index (IS_UNQL) read FShipmentDetails write FShipmentDetails;
    property Shipper:         ShipperType              Index (IS_UNQL) read FShipper write FShipper;
    property Receiver:        ReceiverType             Index (IS_UNQL) read FReceiver write FReceiver;
    property ReturnReceiver:  ShipperType              Index (IS_OPTN or IS_UNQL) read FReturnReceiver write SetReturnReceiver stored ReturnReceiver_Specified;
    property ExportDocument:  ExportDocumentType       Index (IS_OPTN or IS_UNQL) read FExportDocument write SetExportDocument stored ExportDocument_Specified;
  end;



  // ************************************************************************ //
  // XML       : ShipmentDetailsTypeType, global, <complexType>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // ************************************************************************ //
  ShipmentDetailsTypeType = class(ShipmentDetailsType)
  private
    FShipmentItem: ShipmentItemType;
    FService: ShipmentService;
    FService_Specified: boolean;
    FNotification: ShipmentNotificationType;
    FNotification_Specified: boolean;
    FBankData: BankType;
    FBankData_Specified: boolean;
    procedure SetService(Index: Integer; const AShipmentService: ShipmentService);
    function  Service_Specified(Index: Integer): boolean;
    procedure SetNotification(Index: Integer; const AShipmentNotificationType: ShipmentNotificationType);
    function  Notification_Specified(Index: Integer): boolean;
    procedure SetBankData(Index: Integer; const ABankType: BankType);
    function  BankData_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property ShipmentItem: ShipmentItemType          Index (IS_UNQL) read FShipmentItem write FShipmentItem;
    property Service:      ShipmentService           Index (IS_OPTN or IS_UNQL) read FService write SetService stored Service_Specified;
    property Notification: ShipmentNotificationType  Index (IS_OPTN or IS_UNQL) read FNotification write SetNotification stored Notification_Specified;
    property BankData:     BankType                  Index (IS_OPTN or IS_UNQL) read FBankData write SetBankData stored BankData_Specified;
  end;



  // ************************************************************************ //
  // XML       : Shipment, <complexType>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // ************************************************************************ //
  Shipment2 = class(TRemotable)
  private
    FShipmentDetails: ShipmentDetailsTypeType;
    FShipper: ShipperType;
    FReceiver: ReceiverType;
    FReturnReceiver: ShipperType;
    FReturnReceiver_Specified: boolean;
    FExportDocument: ExportDocumentType;
    FExportDocument_Specified: boolean;
    procedure SetReturnReceiver(Index: Integer; const AShipperType: ShipperType);
    function  ReturnReceiver_Specified(Index: Integer): boolean;
    procedure SetExportDocument(Index: Integer; const AExportDocumentType: ExportDocumentType);
    function  ExportDocument_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property ShipmentDetails: ShipmentDetailsTypeType  Index (IS_UNQL) read FShipmentDetails write FShipmentDetails;
    property Shipper:         ShipperType              Index (IS_UNQL) read FShipper write FShipper;
    property Receiver:        ReceiverType             Index (IS_UNQL) read FReceiver write FReceiver;
    property ReturnReceiver:  ShipperType              Index (IS_OPTN or IS_UNQL) read FReturnReceiver write SetReturnReceiver stored ReturnReceiver_Specified;
    property ExportDocument:  ExportDocumentType       Index (IS_OPTN or IS_UNQL) read FExportDocument write SetExportDocument stored ExportDocument_Specified;
  end;



  // ************************************************************************ //
  // XML       : ShipmentOrderType, global, <complexType>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // ************************************************************************ //
  ShipmentOrderType = class(TRemotable)
  private
    FsequenceNumber: SequenceNumber;
    FShipment: Shipment2;
    FPrintOnlyIfCodeable: Serviceconfiguration;
    FPrintOnlyIfCodeable_Specified: boolean;
    FlabelResponseType: labelResponseType2;
    FlabelResponseType_Specified: boolean;
    procedure SetPrintOnlyIfCodeable(Index: Integer; const AServiceconfiguration: Serviceconfiguration);
    function  PrintOnlyIfCodeable_Specified(Index: Integer): boolean;
    procedure SetlabelResponseType(Index: Integer; const AlabelResponseType2: labelResponseType2);
    function  labelResponseType_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property sequenceNumber:      SequenceNumber        Index (IS_UNQL) read FsequenceNumber write FsequenceNumber;
    property Shipment:            Shipment2             Index (IS_UNQL) read FShipment write FShipment;
    property PrintOnlyIfCodeable: Serviceconfiguration  Index (IS_OPTN or IS_UNQL) read FPrintOnlyIfCodeable write SetPrintOnlyIfCodeable stored PrintOnlyIfCodeable_Specified;
    property labelResponseType:   labelResponseType2    Index (IS_OPTN or IS_UNQL) read FlabelResponseType write SetlabelResponseType stored labelResponseType_Specified;
  end;



  // ************************************************************************ //
  // XML       : ExportDocumentType, global, <complexType>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // ************************************************************************ //
  ExportDocumentType = class(TRemotable)
  private
    FinvoiceNumber: invoiceNumber;
    FinvoiceNumber_Specified: boolean;
    FexportType: exportType;
    FexportTypeDescription: exportTypeDescription;
    FexportTypeDescription_Specified: boolean;
    FtermsOfTrade: termsOfTrade;
    FtermsOfTrade_Specified: boolean;
    FplaceOfCommital: placeOfCommital;
    FadditionalFee: additionalFee;
    FpermitNumber: permitNumber;
    FpermitNumber_Specified: boolean;
    FattestationNumber: attestationNumber;
    FattestationNumber_Specified: boolean;
    FWithElectronicExportNtfctn: Serviceconfiguration;
    FWithElectronicExportNtfctn_Specified: boolean;
    FExportDocPosition: Array_Of_ExportDocPosition;
    FExportDocPosition_Specified: boolean;
    procedure SetinvoiceNumber(Index: Integer; const AinvoiceNumber: invoiceNumber);
    function  invoiceNumber_Specified(Index: Integer): boolean;
    procedure SetexportTypeDescription(Index: Integer; const AexportTypeDescription: exportTypeDescription);
    function  exportTypeDescription_Specified(Index: Integer): boolean;
    procedure SettermsOfTrade(Index: Integer; const AtermsOfTrade: termsOfTrade);
    function  termsOfTrade_Specified(Index: Integer): boolean;
    procedure SetpermitNumber(Index: Integer; const ApermitNumber: permitNumber);
    function  permitNumber_Specified(Index: Integer): boolean;
    procedure SetattestationNumber(Index: Integer; const AattestationNumber: attestationNumber);
    function  attestationNumber_Specified(Index: Integer): boolean;
    procedure SetWithElectronicExportNtfctn(Index: Integer; const AServiceconfiguration: Serviceconfiguration);
    function  WithElectronicExportNtfctn_Specified(Index: Integer): boolean;
    procedure SetExportDocPosition(Index: Integer; const AArray_Of_ExportDocPosition: Array_Of_ExportDocPosition);
    function  ExportDocPosition_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property invoiceNumber:              invoiceNumber               Index (IS_OPTN or IS_UNQL) read FinvoiceNumber write SetinvoiceNumber stored invoiceNumber_Specified;
    property exportType:                 exportType                  Index (IS_UNQL) read FexportType write FexportType;
    property exportTypeDescription:      exportTypeDescription       Index (IS_OPTN or IS_UNQL) read FexportTypeDescription write SetexportTypeDescription stored exportTypeDescription_Specified;
    property termsOfTrade:               termsOfTrade                Index (IS_OPTN or IS_UNQL) read FtermsOfTrade write SettermsOfTrade stored termsOfTrade_Specified;
    property placeOfCommital:            placeOfCommital             Index (IS_UNQL) read FplaceOfCommital write FplaceOfCommital;
    property additionalFee:              additionalFee               Index (IS_UNQL) read FadditionalFee write FadditionalFee;
    property permitNumber:               permitNumber                Index (IS_OPTN or IS_UNQL) read FpermitNumber write SetpermitNumber stored permitNumber_Specified;
    property attestationNumber:          attestationNumber           Index (IS_OPTN or IS_UNQL) read FattestationNumber write SetattestationNumber stored attestationNumber_Specified;
    property WithElectronicExportNtfctn: Serviceconfiguration        Index (IS_OPTN or IS_UNQL) read FWithElectronicExportNtfctn write SetWithElectronicExportNtfctn stored WithElectronicExportNtfctn_Specified;
    property ExportDocPosition:          Array_Of_ExportDocPosition  Index (IS_OPTN or IS_UNBD or IS_UNQL) read FExportDocPosition write SetExportDocPosition stored ExportDocPosition_Specified;
  end;



  // ************************************************************************ //
  // XML       : ReceiverType, global, <complexType>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // ************************************************************************ //
  ReceiverType = class(ReceiverTypeType)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : ShipperType, global, <complexType>
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // ************************************************************************ //
  ShipperType = class(ShipperTypeType)
  private
  published
  end;


  // ************************************************************************ //
  // Namespace : http://dhl.de/webservices/businesscustomershipping
  // soapAction: urn:%operationName%
  // Transport : http://schemas.xmlsoap.org/soap/http
  // Stil     : document
  // Verwenden von       : literal
  // Bindung   : GKVAPISOAP11Binding
  // Service   : GVAPI_2_0_de
  // Port      : GKVAPISOAP11port0
  // URL       : https://cig.dhl.de/services/production/soap
  // ************************************************************************ //
  GKVAPIServicePortType = interface(IInvokable)
  ['{E30BB355-2B3F-DF51-A98D-3301AFAE4B09}']

    // Entpacken nicht möglich: 
    //     - Name des Eingabeelement-Wrappers entspricht nicht dem Operationsnamen
    //     - Mehrere strenge out-Elemente gefunden
    // Header: header:pIn
    function  createShipmentOrder(const part1: CreateShipmentOrderRequest): CreateShipmentOrderResponse; stdcall;

    // Entpacken nicht möglich: 
    //     - Name des Eingabeelement-Wrappers entspricht nicht dem Operationsnamen
    //     - Mehrere strenge out-Elemente gefunden
    // Header: header:pIn
    function  validateShipment(const part1: ValidateShipmentOrderRequest): ValidateShipmentResponse; stdcall;

    // Entpacken nicht möglich: 
    //     - Name des Eingabeelement-Wrappers entspricht nicht dem Operationsnamen
    //     - Mehrere strenge out-Elemente gefunden
    // Header: header:pIn
    function  deleteShipmentOrder(const part1: DeleteShipmentOrderRequest): DeleteShipmentOrderResponse; stdcall;

    // Entpacken nicht möglich: 
    //     - Name des Eingabeelement-Wrappers entspricht nicht dem Operationsnamen
    //     - Mehrere strenge out-Elemente gefunden
    // Header: header:pIn
    function  doManifest(const part1: DoManifestRequest): DoManifestResponse; stdcall;

    // Entpacken nicht möglich: 
    //     - Name des Eingabeelement-Wrappers entspricht nicht dem Operationsnamen
    //     - Mehrere strenge out-Elemente gefunden
    // Header: header:pIn
    function  getLabel(const part1: GetLabelRequest): GetLabelResponse; stdcall;

    // Entpacken nicht möglich: 
    //     - Name des Eingabeelement-Wrappers entspricht nicht dem Operationsnamen
    function  getVersion(const part1: Version): GetVersionResponse; stdcall;

    // Entpacken nicht möglich: 
    //     - Name des Eingabeelement-Wrappers entspricht nicht dem Operationsnamen
    //     - Mehrere strenge out-Elemente gefunden
    // Header: header:pIn
    function  getExportDoc(const part1: GetExportDocRequest): GetExportDocResponse; stdcall;

    // Entpacken nicht möglich:
    //     - Name des Eingabeelement-Wrappers entspricht nicht dem Operationsnamen
    //     - Mehrere strenge out-Elemente gefunden
    // Header: header:pIn
    function  getManifest(const part1: GetManifestRequest): GetManifestResponse; stdcall;

    // Entpacken nicht möglich: 
    //     - Name des Eingabeelement-Wrappers entspricht nicht dem Operationsnamen
    //     - Mehrere strenge out-Elemente gefunden
    // Header: header:pIn
    function  updateShipmentOrder(const part1: UpdateShipmentOrderRequest): UpdateShipmentOrderResponse; stdcall;
  end;

function GetGKVAPIServicePortType(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): GKVAPIServicePortType;


implementation
  uses System.SysUtils;

function GetGKVAPIServicePortType(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): GKVAPIServicePortType;
const
  defWSDL = 'D:\Delphi\Tokyo\Test\DHL\Paketversand\Test 1\wsdl\geschaeftskundenversand-api-2.2.wsdl';
  defURL  = 'https://cig.dhl.de/services/production/soap';
  defSvc  = 'GVAPI_2_0_de';
  defPrt  = 'GKVAPISOAP11port0';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as GKVAPIServicePortType);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
      //rio.httpwebnode.Username := 'nfs';
      //rio.httpwebnode.password := 'Jf0JQH7gmHpISf!';
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


constructor GetLabelResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor GetLabelResponse.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FLabelData)-1 do
    System.SysUtils.FreeAndNil(FLabelData[I]);
  System.SetLength(FLabelData, 0);
  System.SysUtils.FreeAndNil(FVersion);
  System.SysUtils.FreeAndNil(FStatus);
  inherited Destroy;
end;

procedure GetLabelResponse.SetLabelData(Index: Integer; const AArray_Of_LabelData: Array_Of_LabelData);
begin
  FLabelData := AArray_Of_LabelData;
  FLabelData_Specified := True;
end;

function GetLabelResponse.LabelData_Specified(Index: Integer): boolean;
begin
  Result := FLabelData_Specified;
end;

constructor DoManifestResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor DoManifestResponse.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FManifestState)-1 do
    System.SysUtils.FreeAndNil(FManifestState[I]);
  System.SetLength(FManifestState, 0);
  System.SysUtils.FreeAndNil(FVersion);
  System.SysUtils.FreeAndNil(FStatus);
  inherited Destroy;
end;

procedure DoManifestResponse.SetManifestState(Index: Integer; const AArray_Of_ManifestState: Array_Of_ManifestState);
begin
  FManifestState := AArray_Of_ManifestState;
  FManifestState_Specified := True;
end;

function DoManifestResponse.ManifestState_Specified(Index: Integer): boolean;
begin
  Result := FManifestState_Specified;
end;

constructor DeleteShipmentOrderResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor DeleteShipmentOrderResponse.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FDeletionState)-1 do
    System.SysUtils.FreeAndNil(FDeletionState[I]);
  System.SetLength(FDeletionState, 0);
  System.SysUtils.FreeAndNil(FVersion);
  System.SysUtils.FreeAndNil(FStatus);
  inherited Destroy;
end;

procedure DeleteShipmentOrderResponse.SetDeletionState(Index: Integer; const AArray_Of_DeletionState: Array_Of_DeletionState);
begin
  FDeletionState := AArray_Of_DeletionState;
  FDeletionState_Specified := True;
end;

function DeleteShipmentOrderResponse.DeletionState_Specified(Index: Integer): boolean;
begin
  Result := FDeletionState_Specified;
end;

constructor GetVersionResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor GetVersionResponse.Destroy;
begin
  System.SysUtils.FreeAndNil(FVersion);
  inherited Destroy;
end;

constructor ValidateShipmentResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor ValidateShipmentResponse.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FValidationState)-1 do
    System.SysUtils.FreeAndNil(FValidationState[I]);
  System.SetLength(FValidationState, 0);
  System.SysUtils.FreeAndNil(FVersion);
  System.SysUtils.FreeAndNil(FStatus);
  inherited Destroy;
end;

procedure ValidateShipmentResponse.SetValidationState(Index: Integer; const AArray_Of_ValidationState: Array_Of_ValidationState);
begin
  FValidationState := AArray_Of_ValidationState;
  FValidationState_Specified := True;
end;

function ValidateShipmentResponse.ValidationState_Specified(Index: Integer): boolean;
begin
  Result := FValidationState_Specified;
end;

constructor CreateShipmentOrderResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor CreateShipmentOrderResponse.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FCreationState)-1 do
    System.SysUtils.FreeAndNil(FCreationState[I]);
  System.SetLength(FCreationState, 0);
  System.SysUtils.FreeAndNil(FVersion);
  System.SysUtils.FreeAndNil(FStatus);
  inherited Destroy;
end;

procedure CreateShipmentOrderResponse.SetCreationState(Index: Integer; const AArray_Of_CreationState: Array_Of_CreationState);
begin
  FCreationState := AArray_Of_CreationState;
  FCreationState_Specified := True;
end;

function CreateShipmentOrderResponse.CreationState_Specified(Index: Integer): boolean;
begin
  Result := FCreationState_Specified;
end;

constructor ValidateShipmentOrderRequest.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor ValidateShipmentOrderRequest.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FShipmentOrder)-1 do
    System.SysUtils.FreeAndNil(FShipmentOrder[I]);
  System.SetLength(FShipmentOrder, 0);
  System.SysUtils.FreeAndNil(FVersion);
  inherited Destroy;
end;

constructor CreateShipmentOrderRequest.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor CreateShipmentOrderRequest.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FShipmentOrder)-1 do
    System.SysUtils.FreeAndNil(FShipmentOrder[I]);
  System.SetLength(FShipmentOrder, 0);
  System.SysUtils.FreeAndNil(FVersion);
  inherited Destroy;
end;

constructor GetManifestResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor GetManifestResponse.Destroy;
begin
  System.SysUtils.FreeAndNil(FVersion);
  System.SysUtils.FreeAndNil(FStatus);
  inherited Destroy;
end;

procedure GetManifestResponse.SetmanifestData(Index: Integer; const ATByteDynArray: TByteDynArray);
begin
  FmanifestData := ATByteDynArray;
  FmanifestData_Specified := True;
end;

function GetManifestResponse.manifestData_Specified(Index: Integer): boolean;
begin
  Result := FmanifestData_Specified;
end;

constructor GetExportDocResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor GetExportDocResponse.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FExportDocData)-1 do
    System.SysUtils.FreeAndNil(FExportDocData[I]);
  System.SetLength(FExportDocData, 0);
  System.SysUtils.FreeAndNil(FVersion);
  System.SysUtils.FreeAndNil(FStatus);
  inherited Destroy;
end;

procedure GetExportDocResponse.SetExportDocData(Index: Integer; const AArray_Of_ExportDocData: Array_Of_ExportDocData);
begin
  FExportDocData := AArray_Of_ExportDocData;
  FExportDocData_Specified := True;
end;

function GetExportDocResponse.ExportDocData_Specified(Index: Integer): boolean;
begin
  Result := FExportDocData_Specified;
end;

constructor UpdateShipmentOrderResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor UpdateShipmentOrderResponse.Destroy;
begin
  System.SysUtils.FreeAndNil(FVersion);
  System.SysUtils.FreeAndNil(FStatus);
  System.SysUtils.FreeAndNil(FLabelData);
  inherited Destroy;
end;

procedure UpdateShipmentOrderResponse.SetLabelData(Index: Integer; const ALabelData: LabelData);
begin
  FLabelData := ALabelData;
  FLabelData_Specified := True;
end;

function UpdateShipmentOrderResponse.LabelData_Specified(Index: Integer): boolean;
begin
  Result := FLabelData_Specified;
end;

procedure CountryType.Setcountry(Index: Integer; const Acountry: country);
begin
  Fcountry := Acountry;
  Fcountry_Specified := True;
end;

function CountryType.country_Specified(Index: Integer): boolean;
begin
  Result := Fcountry_Specified;
end;

procedure CountryType.Setstate(Index: Integer; const Astate: state);
begin
  Fstate := Astate;
  Fstate_Specified := True;
end;

function CountryType.state_Specified(Index: Integer): boolean;
begin
  Result := Fstate_Specified;
end;

procedure CommunicationType.Setphone(Index: Integer; const Aphone: phone);
begin
  Fphone := Aphone;
  Fphone_Specified := True;
end;

function CommunicationType.phone_Specified(Index: Integer): boolean;
begin
  Result := Fphone_Specified;
end;

procedure CommunicationType.Setemail(Index: Integer; const Aemail: email);
begin
  Femail := Aemail;
  Femail_Specified := True;
end;

function CommunicationType.email_Specified(Index: Integer): boolean;
begin
  Result := Femail_Specified;
end;

procedure CommunicationType.SetcontactPerson(Index: Integer; const AcontactPerson: contactPerson);
begin
  FcontactPerson := AcontactPerson;
  FcontactPerson_Specified := True;
end;

function CommunicationType.contactPerson_Specified(Index: Integer): boolean;
begin
  Result := FcontactPerson_Specified;
end;

constructor GetManifestRequest.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor GetManifestRequest.Destroy;
begin
  System.SysUtils.FreeAndNil(FVersion);
  inherited Destroy;
end;

constructor Version.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

procedure Version.Setbuild(Index: Integer; const Abuild: build);
begin
  Fbuild := Abuild;
  Fbuild_Specified := True;
end;

function Version.build_Specified(Index: Integer): boolean;
begin
  Result := Fbuild_Specified;
end;

procedure BankType.Setnote1(Index: Integer; const Anote1: note1);
begin
  Fnote1 := Anote1;
  Fnote1_Specified := True;
end;

function BankType.note1_Specified(Index: Integer): boolean;
begin
  Result := Fnote1_Specified;
end;

procedure BankType.Setnote2(Index: Integer; const Anote2: note2);
begin
  Fnote2 := Anote2;
  Fnote2_Specified := True;
end;

function BankType.note2_Specified(Index: Integer): boolean;
begin
  Result := Fnote2_Specified;
end;

procedure BankType.Setbic(Index: Integer; const Abic: bic);
begin
  Fbic := Abic;
  Fbic_Specified := True;
end;

function BankType.bic_Specified(Index: Integer): boolean;
begin
  Result := Fbic_Specified;
end;

procedure BankType.Setaccountreference(Index: Integer; const Aaccountreference: accountreference);
begin
  Faccountreference := Aaccountreference;
  Faccountreference_Specified := True;
end;

function BankType.accountreference_Specified(Index: Integer): boolean;
begin
  Result := Faccountreference_Specified;
end;

destructor ShipmentService.Destroy;
begin
  System.SysUtils.FreeAndNil(FDayOfDelivery);
  System.SysUtils.FreeAndNil(FDeliveryTimeframe);
  System.SysUtils.FreeAndNil(FPreferredTime);
  System.SysUtils.FreeAndNil(FIndividualSenderRequirement);
  System.SysUtils.FreeAndNil(FPackagingReturn);
  System.SysUtils.FreeAndNil(FReturnImmediately);
  System.SysUtils.FreeAndNil(FNoticeOfNonDeliverability);
  System.SysUtils.FreeAndNil(FShipmentHandling);
  System.SysUtils.FreeAndNil(FEndorsement);
  System.SysUtils.FreeAndNil(FVisualCheckOfAge);
  System.SysUtils.FreeAndNil(FPreferredLocation);
  System.SysUtils.FreeAndNil(FPreferredNeighbour);
  System.SysUtils.FreeAndNil(FPreferredDay);
  System.SysUtils.FreeAndNil(FGoGreen);
  System.SysUtils.FreeAndNil(FPerishables);
  System.SysUtils.FreeAndNil(FPersonally);
  System.SysUtils.FreeAndNil(FNoNeighbourDelivery);
  System.SysUtils.FreeAndNil(FNamedPersonOnly);
  System.SysUtils.FreeAndNil(FReturnReceipt);
  System.SysUtils.FreeAndNil(FPremium);
  System.SysUtils.FreeAndNil(FCashOnDelivery);
  System.SysUtils.FreeAndNil(FAdditionalInsurance);
  System.SysUtils.FreeAndNil(FBulkyGoods);
  System.SysUtils.FreeAndNil(FIdentCheck);
  inherited Destroy;
end;

procedure ShipmentService.SetDayOfDelivery(Index: Integer; const AServiceconfigurationDateOfDelivery: ServiceconfigurationDateOfDelivery);
begin
  FDayOfDelivery := AServiceconfigurationDateOfDelivery;
  FDayOfDelivery_Specified := True;
end;

function ShipmentService.DayOfDelivery_Specified(Index: Integer): boolean;
begin
  Result := FDayOfDelivery_Specified;
end;

procedure ShipmentService.SetDeliveryTimeframe(Index: Integer; const AServiceconfigurationDeliveryTimeframe: ServiceconfigurationDeliveryTimeframe);
begin
  FDeliveryTimeframe := AServiceconfigurationDeliveryTimeframe;
  FDeliveryTimeframe_Specified := True;
end;

function ShipmentService.DeliveryTimeframe_Specified(Index: Integer): boolean;
begin
  Result := FDeliveryTimeframe_Specified;
end;

procedure ShipmentService.SetPreferredTime(Index: Integer; const AServiceconfigurationDeliveryTimeframe: ServiceconfigurationDeliveryTimeframe);
begin
  FPreferredTime := AServiceconfigurationDeliveryTimeframe;
  FPreferredTime_Specified := True;
end;

function ShipmentService.PreferredTime_Specified(Index: Integer): boolean;
begin
  Result := FPreferredTime_Specified;
end;

procedure ShipmentService.SetIndividualSenderRequirement(Index: Integer; const AServiceconfigurationISR: ServiceconfigurationISR);
begin
  FIndividualSenderRequirement := AServiceconfigurationISR;
  FIndividualSenderRequirement_Specified := True;
end;

function ShipmentService.IndividualSenderRequirement_Specified(Index: Integer): boolean;
begin
  Result := FIndividualSenderRequirement_Specified;
end;

procedure ShipmentService.SetPackagingReturn(Index: Integer; const AServiceconfiguration: Serviceconfiguration);
begin
  FPackagingReturn := AServiceconfiguration;
  FPackagingReturn_Specified := True;
end;

function ShipmentService.PackagingReturn_Specified(Index: Integer): boolean;
begin
  Result := FPackagingReturn_Specified;
end;

procedure ShipmentService.SetReturnImmediately(Index: Integer; const AServiceconfiguration: Serviceconfiguration);
begin
  FReturnImmediately := AServiceconfiguration;
  FReturnImmediately_Specified := True;
end;

function ShipmentService.ReturnImmediately_Specified(Index: Integer): boolean;
begin
  Result := FReturnImmediately_Specified;
end;

procedure ShipmentService.SetNoticeOfNonDeliverability(Index: Integer; const AServiceconfiguration: Serviceconfiguration);
begin
  FNoticeOfNonDeliverability := AServiceconfiguration;
  FNoticeOfNonDeliverability_Specified := True;
end;

function ShipmentService.NoticeOfNonDeliverability_Specified(Index: Integer): boolean;
begin
  Result := FNoticeOfNonDeliverability_Specified;
end;

procedure ShipmentService.SetShipmentHandling(Index: Integer; const AServiceconfigurationShipmentHandling: ServiceconfigurationShipmentHandling);
begin
  FShipmentHandling := AServiceconfigurationShipmentHandling;
  FShipmentHandling_Specified := True;
end;

function ShipmentService.ShipmentHandling_Specified(Index: Integer): boolean;
begin
  Result := FShipmentHandling_Specified;
end;

procedure ShipmentService.SetEndorsement(Index: Integer; const AServiceconfigurationEndorsement: ServiceconfigurationEndorsement);
begin
  FEndorsement := AServiceconfigurationEndorsement;
  FEndorsement_Specified := True;
end;

function ShipmentService.Endorsement_Specified(Index: Integer): boolean;
begin
  Result := FEndorsement_Specified;
end;

procedure ShipmentService.SetVisualCheckOfAge(Index: Integer; const AServiceconfigurationVisualAgeCheck: ServiceconfigurationVisualAgeCheck);
begin
  FVisualCheckOfAge := AServiceconfigurationVisualAgeCheck;
  FVisualCheckOfAge_Specified := True;
end;

function ShipmentService.VisualCheckOfAge_Specified(Index: Integer): boolean;
begin
  Result := FVisualCheckOfAge_Specified;
end;

procedure ShipmentService.SetPreferredLocation(Index: Integer; const AServiceconfigurationDetails: ServiceconfigurationDetails);
begin
  FPreferredLocation := AServiceconfigurationDetails;
  FPreferredLocation_Specified := True;
end;

function ShipmentService.PreferredLocation_Specified(Index: Integer): boolean;
begin
  Result := FPreferredLocation_Specified;
end;

procedure ShipmentService.SetPreferredNeighbour(Index: Integer; const AServiceconfigurationDetails: ServiceconfigurationDetails);
begin
  FPreferredNeighbour := AServiceconfigurationDetails;
  FPreferredNeighbour_Specified := True;
end;

function ShipmentService.PreferredNeighbour_Specified(Index: Integer): boolean;
begin
  Result := FPreferredNeighbour_Specified;
end;

procedure ShipmentService.SetPreferredDay(Index: Integer; const AServiceconfigurationDetails: ServiceconfigurationDetails);
begin
  FPreferredDay := AServiceconfigurationDetails;
  FPreferredDay_Specified := True;
end;

function ShipmentService.PreferredDay_Specified(Index: Integer): boolean;
begin
  Result := FPreferredDay_Specified;
end;

procedure ShipmentService.SetGoGreen(Index: Integer; const AServiceconfiguration: Serviceconfiguration);
begin
  FGoGreen := AServiceconfiguration;
  FGoGreen_Specified := True;
end;

function ShipmentService.GoGreen_Specified(Index: Integer): boolean;
begin
  Result := FGoGreen_Specified;
end;

procedure ShipmentService.SetPerishables(Index: Integer; const AServiceconfiguration: Serviceconfiguration);
begin
  FPerishables := AServiceconfiguration;
  FPerishables_Specified := True;
end;

function ShipmentService.Perishables_Specified(Index: Integer): boolean;
begin
  Result := FPerishables_Specified;
end;

procedure ShipmentService.SetPersonally(Index: Integer; const AServiceconfiguration: Serviceconfiguration);
begin
  FPersonally := AServiceconfiguration;
  FPersonally_Specified := True;
end;

function ShipmentService.Personally_Specified(Index: Integer): boolean;
begin
  Result := FPersonally_Specified;
end;

procedure ShipmentService.SetNoNeighbourDelivery(Index: Integer; const AServiceconfiguration: Serviceconfiguration);
begin
  FNoNeighbourDelivery := AServiceconfiguration;
  FNoNeighbourDelivery_Specified := True;
end;

function ShipmentService.NoNeighbourDelivery_Specified(Index: Integer): boolean;
begin
  Result := FNoNeighbourDelivery_Specified;
end;

procedure ShipmentService.SetNamedPersonOnly(Index: Integer; const AServiceconfiguration: Serviceconfiguration);
begin
  FNamedPersonOnly := AServiceconfiguration;
  FNamedPersonOnly_Specified := True;
end;

function ShipmentService.NamedPersonOnly_Specified(Index: Integer): boolean;
begin
  Result := FNamedPersonOnly_Specified;
end;

procedure ShipmentService.SetReturnReceipt(Index: Integer; const AServiceconfiguration: Serviceconfiguration);
begin
  FReturnReceipt := AServiceconfiguration;
  FReturnReceipt_Specified := True;
end;

function ShipmentService.ReturnReceipt_Specified(Index: Integer): boolean;
begin
  Result := FReturnReceipt_Specified;
end;

procedure ShipmentService.SetPremium(Index: Integer; const AServiceconfiguration: Serviceconfiguration);
begin
  FPremium := AServiceconfiguration;
  FPremium_Specified := True;
end;

function ShipmentService.Premium_Specified(Index: Integer): boolean;
begin
  Result := FPremium_Specified;
end;

procedure ShipmentService.SetCashOnDelivery(Index: Integer; const AServiceconfigurationCashOnDelivery: ServiceconfigurationCashOnDelivery);
begin
  FCashOnDelivery := AServiceconfigurationCashOnDelivery;
  FCashOnDelivery_Specified := True;
end;

function ShipmentService.CashOnDelivery_Specified(Index: Integer): boolean;
begin
  Result := FCashOnDelivery_Specified;
end;

procedure ShipmentService.SetAdditionalInsurance(Index: Integer; const AServiceconfigurationAdditionalInsurance: ServiceconfigurationAdditionalInsurance);
begin
  FAdditionalInsurance := AServiceconfigurationAdditionalInsurance;
  FAdditionalInsurance_Specified := True;
end;

function ShipmentService.AdditionalInsurance_Specified(Index: Integer): boolean;
begin
  Result := FAdditionalInsurance_Specified;
end;

procedure ShipmentService.SetBulkyGoods(Index: Integer; const AServiceconfiguration: Serviceconfiguration);
begin
  FBulkyGoods := AServiceconfiguration;
  FBulkyGoods_Specified := True;
end;

function ShipmentService.BulkyGoods_Specified(Index: Integer): boolean;
begin
  Result := FBulkyGoods_Specified;
end;

procedure ShipmentService.SetIdentCheck(Index: Integer; const AServiceconfigurationIC: ServiceconfigurationIC);
begin
  FIdentCheck := AServiceconfigurationIC;
  FIdentCheck_Specified := True;
end;

function ShipmentService.IdentCheck_Specified(Index: Integer): boolean;
begin
  Result := FIdentCheck_Specified;
end;

destructor ExportDocPosition.Destroy;
begin
  System.SysUtils.FreeAndNil(FnetWeightInKG);
  System.SysUtils.FreeAndNil(FcustomsValue);
  inherited Destroy;
end;

destructor ShipmentItemType.Destroy;
begin
  System.SysUtils.FreeAndNil(FweightInKG);
  inherited Destroy;
end;

procedure ShipmentItemType.SetlengthInCM(Index: Integer; const AlengthInCM: lengthInCM);
begin
  FlengthInCM := AlengthInCM;
  FlengthInCM_Specified := True;
end;

function ShipmentItemType.lengthInCM_Specified(Index: Integer): boolean;
begin
  Result := FlengthInCM_Specified;
end;

procedure ShipmentItemType.SetwidthInCM(Index: Integer; const AwidthInCM: widthInCM);
begin
  FwidthInCM := AwidthInCM;
  FwidthInCM_Specified := True;
end;

function ShipmentItemType.widthInCM_Specified(Index: Integer): boolean;
begin
  Result := FwidthInCM_Specified;
end;

procedure ShipmentItemType.SetheightInCM(Index: Integer; const AheightInCM: heightInCM);
begin
  FheightInCM := AheightInCM;
  FheightInCM_Specified := True;
end;

function ShipmentItemType.heightInCM_Specified(Index: Integer): boolean;
begin
  Result := FheightInCM_Specified;
end;

procedure ServiceconfigurationCashOnDelivery.SetaddFee(Index: Integer; const Astring: string);
begin
  FaddFee := Astring;
  FaddFee_Specified := True;
end;

function ServiceconfigurationCashOnDelivery.addFee_Specified(Index: Integer): boolean;
begin
  Result := FaddFee_Specified;
end;

destructor ServiceconfigurationIC.Destroy;
begin
  System.SysUtils.FreeAndNil(FIdent);
  inherited Destroy;
end;

constructor DoManifestRequest.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor DoManifestRequest.Destroy;
begin
  System.SysUtils.FreeAndNil(FVersion);
  inherited Destroy;
end;

constructor GetExportDocRequest.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor GetExportDocRequest.Destroy;
begin
  System.SysUtils.FreeAndNil(FVersion);
  inherited Destroy;
end;

procedure GetExportDocRequest.SetexportDocResponseType(Index: Integer; const AexportDocResponseType: exportDocResponseType);
begin
  FexportDocResponseType := AexportDocResponseType;
  FexportDocResponseType_Specified := True;
end;

function GetExportDocRequest.exportDocResponseType_Specified(Index: Integer): boolean;
begin
  Result := FexportDocResponseType_Specified;
end;

constructor DeleteShipmentOrderRequest.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor DeleteShipmentOrderRequest.Destroy;
begin
  System.SysUtils.FreeAndNil(FVersion);
  inherited Destroy;
end;

constructor GetLabelRequest.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor GetLabelRequest.Destroy;
begin
  System.SysUtils.FreeAndNil(FVersion);
  inherited Destroy;
end;

procedure GetLabelRequest.SetlabelResponseType(Index: Integer; const AlabelResponseType: labelResponseType);
begin
  FlabelResponseType := AlabelResponseType;
  FlabelResponseType_Specified := True;
end;

function GetLabelRequest.labelResponseType_Specified(Index: Integer): boolean;
begin
  Result := FlabelResponseType_Specified;
end;

constructor UpdateShipmentOrderRequest.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor UpdateShipmentOrderRequest.Destroy;
begin
  System.SysUtils.FreeAndNil(FVersion);
  System.SysUtils.FreeAndNil(FShipmentOrder);
  inherited Destroy;
end;

destructor ExportDocData.Destroy;
begin
  System.SysUtils.FreeAndNil(FStatus);
  inherited Destroy;
end;

procedure ExportDocData.SetexportDocData(Index: Integer; const ATByteDynArray: TByteDynArray);
begin
  FexportDocData := ATByteDynArray;
  FexportDocData_Specified := True;
end;

function ExportDocData.exportDocData_Specified(Index: Integer): boolean;
begin
  Result := FexportDocData_Specified;
end;

procedure ExportDocData.SetexportDocURL(Index: Integer; const Astring: string);
begin
  FexportDocURL := Astring;
  FexportDocURL_Specified := True;
end;

function ExportDocData.exportDocURL_Specified(Index: Integer): boolean;
begin
  Result := FexportDocURL_Specified;
end;

destructor DeletionState.Destroy;
begin
  System.SysUtils.FreeAndNil(FStatus);
  inherited Destroy;
end;

destructor ManifestState.Destroy;
begin
  System.SysUtils.FreeAndNil(FStatus);
  inherited Destroy;
end;

destructor LabelData.Destroy;
begin
  System.SysUtils.FreeAndNil(FStatus);
  inherited Destroy;
end;

procedure LabelData.SetshipmentNumber(Index: Integer; const AshipmentNumber: shipmentNumber);
begin
  FshipmentNumber := AshipmentNumber;
  FshipmentNumber_Specified := True;
end;

function LabelData.shipmentNumber_Specified(Index: Integer): boolean;
begin
  Result := FshipmentNumber_Specified;
end;

procedure LabelData.SetlabelUrl(Index: Integer; const Astring: string);
begin
  FlabelUrl := Astring;
  FlabelUrl_Specified := True;
end;

function LabelData.labelUrl_Specified(Index: Integer): boolean;
begin
  Result := FlabelUrl_Specified;
end;

procedure LabelData.SetlabelData(Index: Integer; const ATByteDynArray: TByteDynArray);
begin
  FlabelData := ATByteDynArray;
  FlabelData_Specified := True;
end;

function LabelData.labelData_Specified(Index: Integer): boolean;
begin
  Result := FlabelData_Specified;
end;

procedure LabelData.SetreturnLabelUrl(Index: Integer; const Astring: string);
begin
  FreturnLabelUrl := Astring;
  FreturnLabelUrl_Specified := True;
end;

function LabelData.returnLabelUrl_Specified(Index: Integer): boolean;
begin
  Result := FreturnLabelUrl_Specified;
end;

procedure LabelData.SetreturnLabelData(Index: Integer; const ATByteDynArray: TByteDynArray);
begin
  FreturnLabelData := ATByteDynArray;
  FreturnLabelData_Specified := True;
end;

function LabelData.returnLabelData_Specified(Index: Integer): boolean;
begin
  Result := FreturnLabelData_Specified;
end;

procedure LabelData.SetexportLabelUrl(Index: Integer; const Astring: string);
begin
  FexportLabelUrl := Astring;
  FexportLabelUrl_Specified := True;
end;

function LabelData.exportLabelUrl_Specified(Index: Integer): boolean;
begin
  Result := FexportLabelUrl_Specified;
end;

procedure LabelData.SetexportLabelData(Index: Integer; const ATByteDynArray: TByteDynArray);
begin
  FexportLabelData := ATByteDynArray;
  FexportLabelData_Specified := True;
end;

function LabelData.exportLabelData_Specified(Index: Integer): boolean;
begin
  Result := FexportLabelData_Specified;
end;

procedure LabelData.SetcodLabelUrl(Index: Integer; const Astring: string);
begin
  FcodLabelUrl := Astring;
  FcodLabelUrl_Specified := True;
end;

function LabelData.codLabelUrl_Specified(Index: Integer): boolean;
begin
  Result := FcodLabelUrl_Specified;
end;

procedure LabelData.SetcodLabelData(Index: Integer; const ATByteDynArray: TByteDynArray);
begin
  FcodLabelData := ATByteDynArray;
  FcodLabelData_Specified := True;
end;

function LabelData.codLabelData_Specified(Index: Integer): boolean;
begin
  Result := FcodLabelData_Specified;
end;

destructor ValidationState.Destroy;
begin
  System.SysUtils.FreeAndNil(FStatus);
  inherited Destroy;
end;

destructor CreationState.Destroy;
begin
  System.SysUtils.FreeAndNil(FLabelData);
  inherited Destroy;
end;

destructor PackStationType.Destroy;
begin
  System.SysUtils.FreeAndNil(FOrigin);
  inherited Destroy;
end;

procedure PackStationType.SetpostNumber(Index: Integer; const ApostNumber2: postNumber2);
begin
  FpostNumber := ApostNumber2;
  FpostNumber_Specified := True;
end;

function PackStationType.postNumber_Specified(Index: Integer): boolean;
begin
  Result := FpostNumber_Specified;
end;

procedure PackStationType.SetOrigin(Index: Integer; const AOrigin: Origin);
begin
  FOrigin := AOrigin;
  FOrigin_Specified := True;
end;

function PackStationType.Origin_Specified(Index: Integer): boolean;
begin
  Result := FOrigin_Specified;
end;

destructor PostfilialeType.Destroy;
begin
  System.SysUtils.FreeAndNil(FOrigin);
  inherited Destroy;
end;

procedure PostfilialeType.SetOrigin(Index: Integer; const AOrigin: Origin);
begin
  FOrigin := AOrigin;
  FOrigin_Specified := True;
end;

function PostfilialeType.Origin_Specified(Index: Integer): boolean;
begin
  Result := FOrigin_Specified;
end;

destructor NativeAddressType.Destroy;
begin
  System.SysUtils.FreeAndNil(FOrigin);
  inherited Destroy;
end;

procedure NativeAddressType.SetaddressAddition(Index: Integer; const AArray_Of_addressAddition: Array_Of_addressAddition);
begin
  FaddressAddition := AArray_Of_addressAddition;
  FaddressAddition_Specified := True;
end;

function NativeAddressType.addressAddition_Specified(Index: Integer): boolean;
begin
  Result := FaddressAddition_Specified;
end;

procedure NativeAddressType.SetdispatchingInformation(Index: Integer; const AdispatchingInformation: dispatchingInformation);
begin
  FdispatchingInformation := AdispatchingInformation;
  FdispatchingInformation_Specified := True;
end;

function NativeAddressType.dispatchingInformation_Specified(Index: Integer): boolean;
begin
  Result := FdispatchingInformation_Specified;
end;

procedure NativeAddressType.SetOrigin(Index: Integer; const AOrigin: Origin);
begin
  FOrigin := AOrigin;
  FOrigin_Specified := True;
end;

function NativeAddressType.Origin_Specified(Index: Integer): boolean;
begin
  Result := FOrigin_Specified;
end;

destructor ParcelShopType.Destroy;
begin
  System.SysUtils.FreeAndNil(FOrigin);
  inherited Destroy;
end;

procedure ParcelShopType.SetstreetName(Index: Integer; const AstreetName: streetName);
begin
  FstreetName := AstreetName;
  FstreetName_Specified := True;
end;

function ParcelShopType.streetName_Specified(Index: Integer): boolean;
begin
  Result := FstreetName_Specified;
end;

procedure ParcelShopType.SetstreetNumber(Index: Integer; const AstreetNumber2: streetNumber2);
begin
  FstreetNumber := AstreetNumber2;
  FstreetNumber_Specified := True;
end;

function ParcelShopType.streetNumber_Specified(Index: Integer): boolean;
begin
  Result := FstreetNumber_Specified;
end;

procedure ParcelShopType.SetOrigin(Index: Integer; const AOrigin: Origin);
begin
  FOrigin := AOrigin;
  FOrigin_Specified := True;
end;

function ParcelShopType.Origin_Specified(Index: Integer): boolean;
begin
  Result := FOrigin_Specified;
end;

procedure ShipmentDetailsType.SetcustomerReference(Index: Integer; const AcustomerReference: customerReference);
begin
  FcustomerReference := AcustomerReference;
  FcustomerReference_Specified := True;
end;

function ShipmentDetailsType.customerReference_Specified(Index: Integer): boolean;
begin
  Result := FcustomerReference_Specified;
end;

procedure ShipmentDetailsType.SetreturnShipmentAccountNumber(Index: Integer; const AreturnShipmentAccountNumber: returnShipmentAccountNumber);
begin
  FreturnShipmentAccountNumber := AreturnShipmentAccountNumber;
  FreturnShipmentAccountNumber_Specified := True;
end;

function ShipmentDetailsType.returnShipmentAccountNumber_Specified(Index: Integer): boolean;
begin
  Result := FreturnShipmentAccountNumber_Specified;
end;

procedure ShipmentDetailsType.SetreturnShipmentReference(Index: Integer; const AreturnShipmentReference: returnShipmentReference);
begin
  FreturnShipmentReference := AreturnShipmentReference;
  FreturnShipmentReference_Specified := True;
end;

function ShipmentDetailsType.returnShipmentReference_Specified(Index: Integer): boolean;
begin
  Result := FreturnShipmentReference_Specified;
end;

destructor ReceiverNativeAddressType.Destroy;
begin
  System.SysUtils.FreeAndNil(FOrigin);
  inherited Destroy;
end;

procedure ReceiverNativeAddressType.Setname2(Index: Integer; const Aname2: name2);
begin
  Fname2 := Aname2;
  Fname2_Specified := True;
end;

function ReceiverNativeAddressType.name2_Specified(Index: Integer): boolean;
begin
  Result := Fname2_Specified;
end;

procedure ReceiverNativeAddressType.Setname3(Index: Integer; const Aname3: name3);
begin
  Fname3 := Aname3;
  Fname3_Specified := True;
end;

function ReceiverNativeAddressType.name3_Specified(Index: Integer): boolean;
begin
  Result := Fname3_Specified;
end;

procedure ReceiverNativeAddressType.SetaddressAddition(Index: Integer; const AArray_Of_addressAddition2: Array_Of_addressAddition2);
begin
  FaddressAddition := AArray_Of_addressAddition2;
  FaddressAddition_Specified := True;
end;

function ReceiverNativeAddressType.addressAddition_Specified(Index: Integer): boolean;
begin
  Result := FaddressAddition_Specified;
end;

procedure ReceiverNativeAddressType.SetdispatchingInformation(Index: Integer; const AdispatchingInformation2: dispatchingInformation2);
begin
  FdispatchingInformation := AdispatchingInformation2;
  FdispatchingInformation_Specified := True;
end;

function ReceiverNativeAddressType.dispatchingInformation_Specified(Index: Integer): boolean;
begin
  Result := FdispatchingInformation_Specified;
end;

procedure ReceiverNativeAddressType.SetOrigin(Index: Integer; const AOrigin: Origin);
begin
  FOrigin := AOrigin;
  FOrigin_Specified := True;
end;

function ReceiverNativeAddressType.Origin_Specified(Index: Integer): boolean;
begin
  Result := FOrigin_Specified;
end;

procedure NameType.Setname2(Index: Integer; const Aname2: name2);
begin
  Fname2 := Aname2;
  Fname2_Specified := True;
end;

function NameType.name2_Specified(Index: Integer): boolean;
begin
  Result := Fname2_Specified;
end;

procedure NameType.Setname3(Index: Integer; const Aname3: name3);
begin
  Fname3 := Aname3;
  Fname3_Specified := True;
end;

function NameType.name3_Specified(Index: Integer): boolean;
begin
  Result := Fname3_Specified;
end;

destructor ValidateShipmentOrderType.Destroy;
begin
  System.SysUtils.FreeAndNil(FShipment);
  System.SysUtils.FreeAndNil(FPrintOnlyIfCodeable);
  inherited Destroy;
end;

procedure ValidateShipmentOrderType.SetPrintOnlyIfCodeable(Index: Integer; const AServiceconfiguration: Serviceconfiguration);
begin
  FPrintOnlyIfCodeable := AServiceconfiguration;
  FPrintOnlyIfCodeable_Specified := True;
end;

function ValidateShipmentOrderType.PrintOnlyIfCodeable_Specified(Index: Integer): boolean;
begin
  Result := FPrintOnlyIfCodeable_Specified;
end;

destructor ReceiverTypeType.Destroy;
begin
  System.SysUtils.FreeAndNil(FAddress);
  System.SysUtils.FreeAndNil(FPackstation);
  System.SysUtils.FreeAndNil(FPostfiliale);
  System.SysUtils.FreeAndNil(FParcelShop);
  System.SysUtils.FreeAndNil(FCommunication);
  inherited Destroy;
end;

procedure ReceiverTypeType.SetAddress(Index: Integer; const AReceiverNativeAddressType: ReceiverNativeAddressType);
begin
  FAddress := AReceiverNativeAddressType;
  FAddress_Specified := True;
end;

function ReceiverTypeType.Address_Specified(Index: Integer): boolean;
begin
  Result := FAddress_Specified;
end;

procedure ReceiverTypeType.SetPackstation(Index: Integer; const APackStationType: PackStationType);
begin
  FPackstation := APackStationType;
  FPackstation_Specified := True;
end;

function ReceiverTypeType.Packstation_Specified(Index: Integer): boolean;
begin
  Result := FPackstation_Specified;
end;

procedure ReceiverTypeType.SetPostfiliale(Index: Integer; const APostfilialeType: PostfilialeType);
begin
  FPostfiliale := APostfilialeType;
  FPostfiliale_Specified := True;
end;

function ReceiverTypeType.Postfiliale_Specified(Index: Integer): boolean;
begin
  Result := FPostfiliale_Specified;
end;

procedure ReceiverTypeType.SetParcelShop(Index: Integer; const AParcelShopType: ParcelShopType);
begin
  FParcelShop := AParcelShopType;
  FParcelShop_Specified := True;
end;

function ReceiverTypeType.ParcelShop_Specified(Index: Integer): boolean;
begin
  Result := FParcelShop_Specified;
end;

destructor ShipperTypeType.Destroy;
begin
  System.SysUtils.FreeAndNil(FName_);
  System.SysUtils.FreeAndNil(FAddress);
  System.SysUtils.FreeAndNil(FCommunication);
  inherited Destroy;
end;

destructor Shipment.Destroy;
begin
  System.SysUtils.FreeAndNil(FShipmentDetails);
  System.SysUtils.FreeAndNil(FShipper);
  System.SysUtils.FreeAndNil(FReceiver);
  System.SysUtils.FreeAndNil(FReturnReceiver);
  System.SysUtils.FreeAndNil(FExportDocument);
  inherited Destroy;
end;

procedure Shipment.SetReturnReceiver(Index: Integer; const AShipperType: ShipperType);
begin
  FReturnReceiver := AShipperType;
  FReturnReceiver_Specified := True;
end;

function Shipment.ReturnReceiver_Specified(Index: Integer): boolean;
begin
  Result := FReturnReceiver_Specified;
end;

procedure Shipment.SetExportDocument(Index: Integer; const AExportDocumentType: ExportDocumentType);
begin
  FExportDocument := AExportDocumentType;
  FExportDocument_Specified := True;
end;

function Shipment.ExportDocument_Specified(Index: Integer): boolean;
begin
  Result := FExportDocument_Specified;
end;

destructor ShipmentDetailsTypeType.Destroy;
begin
  System.SysUtils.FreeAndNil(FShipmentItem);
  System.SysUtils.FreeAndNil(FService);
  System.SysUtils.FreeAndNil(FNotification);
  System.SysUtils.FreeAndNil(FBankData);
  inherited Destroy;
end;

procedure ShipmentDetailsTypeType.SetService(Index: Integer; const AShipmentService: ShipmentService);
begin
  FService := AShipmentService;
  FService_Specified := True;
end;

function ShipmentDetailsTypeType.Service_Specified(Index: Integer): boolean;
begin
  Result := FService_Specified;
end;

procedure ShipmentDetailsTypeType.SetNotification(Index: Integer; const AShipmentNotificationType: ShipmentNotificationType);
begin
  FNotification := AShipmentNotificationType;
  FNotification_Specified := True;
end;

function ShipmentDetailsTypeType.Notification_Specified(Index: Integer): boolean;
begin
  Result := FNotification_Specified;
end;

procedure ShipmentDetailsTypeType.SetBankData(Index: Integer; const ABankType: BankType);
begin
  FBankData := ABankType;
  FBankData_Specified := True;
end;

function ShipmentDetailsTypeType.BankData_Specified(Index: Integer): boolean;
begin
  Result := FBankData_Specified;
end;

destructor Shipment2.Destroy;
begin
  System.SysUtils.FreeAndNil(FShipmentDetails);
  System.SysUtils.FreeAndNil(FShipper);
  System.SysUtils.FreeAndNil(FReceiver);
  System.SysUtils.FreeAndNil(FReturnReceiver);
  System.SysUtils.FreeAndNil(FExportDocument);
  inherited Destroy;
end;

procedure Shipment2.SetReturnReceiver(Index: Integer; const AShipperType: ShipperType);
begin
  FReturnReceiver := AShipperType;
  FReturnReceiver_Specified := True;
end;

function Shipment2.ReturnReceiver_Specified(Index: Integer): boolean;
begin
  Result := FReturnReceiver_Specified;
end;

procedure Shipment2.SetExportDocument(Index: Integer; const AExportDocumentType: ExportDocumentType);
begin
  FExportDocument := AExportDocumentType;
  FExportDocument_Specified := True;
end;

function Shipment2.ExportDocument_Specified(Index: Integer): boolean;
begin
  Result := FExportDocument_Specified;
end;

destructor ShipmentOrderType.Destroy;
begin
  System.SysUtils.FreeAndNil(FShipment);
  System.SysUtils.FreeAndNil(FPrintOnlyIfCodeable);
  inherited Destroy;
end;

procedure ShipmentOrderType.SetPrintOnlyIfCodeable(Index: Integer; const AServiceconfiguration: Serviceconfiguration);
begin
  FPrintOnlyIfCodeable := AServiceconfiguration;
  FPrintOnlyIfCodeable_Specified := True;
end;

function ShipmentOrderType.PrintOnlyIfCodeable_Specified(Index: Integer): boolean;
begin
  Result := FPrintOnlyIfCodeable_Specified;
end;

procedure ShipmentOrderType.SetlabelResponseType(Index: Integer; const AlabelResponseType2: labelResponseType2);
begin
  FlabelResponseType := AlabelResponseType2;
  FlabelResponseType_Specified := True;
end;

function ShipmentOrderType.labelResponseType_Specified(Index: Integer): boolean;
begin
  Result := FlabelResponseType_Specified;
end;

destructor ExportDocumentType.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FExportDocPosition)-1 do
    System.SysUtils.FreeAndNil(FExportDocPosition[I]);
  System.SetLength(FExportDocPosition, 0);
  System.SysUtils.FreeAndNil(FadditionalFee);
  System.SysUtils.FreeAndNil(FWithElectronicExportNtfctn);
  inherited Destroy;
end;

procedure ExportDocumentType.SetinvoiceNumber(Index: Integer; const AinvoiceNumber: invoiceNumber);
begin
  FinvoiceNumber := AinvoiceNumber;
  FinvoiceNumber_Specified := True;
end;

function ExportDocumentType.invoiceNumber_Specified(Index: Integer): boolean;
begin
  Result := FinvoiceNumber_Specified;
end;

procedure ExportDocumentType.SetexportTypeDescription(Index: Integer; const AexportTypeDescription: exportTypeDescription);
begin
  FexportTypeDescription := AexportTypeDescription;
  FexportTypeDescription_Specified := True;
end;

function ExportDocumentType.exportTypeDescription_Specified(Index: Integer): boolean;
begin
  Result := FexportTypeDescription_Specified;
end;

procedure ExportDocumentType.SettermsOfTrade(Index: Integer; const AtermsOfTrade: termsOfTrade);
begin
  FtermsOfTrade := AtermsOfTrade;
  FtermsOfTrade_Specified := True;
end;

function ExportDocumentType.termsOfTrade_Specified(Index: Integer): boolean;
begin
  Result := FtermsOfTrade_Specified;
end;

procedure ExportDocumentType.SetpermitNumber(Index: Integer; const ApermitNumber: permitNumber);
begin
  FpermitNumber := ApermitNumber;
  FpermitNumber_Specified := True;
end;

function ExportDocumentType.permitNumber_Specified(Index: Integer): boolean;
begin
  Result := FpermitNumber_Specified;
end;

procedure ExportDocumentType.SetattestationNumber(Index: Integer; const AattestationNumber: attestationNumber);
begin
  FattestationNumber := AattestationNumber;
  FattestationNumber_Specified := True;
end;

function ExportDocumentType.attestationNumber_Specified(Index: Integer): boolean;
begin
  Result := FattestationNumber_Specified;
end;

procedure ExportDocumentType.SetWithElectronicExportNtfctn(Index: Integer; const AServiceconfiguration: Serviceconfiguration);
begin
  FWithElectronicExportNtfctn := AServiceconfiguration;
  FWithElectronicExportNtfctn_Specified := True;
end;

function ExportDocumentType.WithElectronicExportNtfctn_Specified(Index: Integer): boolean;
begin
  Result := FWithElectronicExportNtfctn_Specified;
end;

procedure ExportDocumentType.SetExportDocPosition(Index: Integer; const AArray_Of_ExportDocPosition: Array_Of_ExportDocPosition);
begin
  FExportDocPosition := AArray_Of_ExportDocPosition;
  FExportDocPosition_Specified := True;
end;

function ExportDocumentType.ExportDocPosition_Specified(Index: Integer): boolean;
begin
  Result := FExportDocPosition_Specified;
end;

initialization
  { GKVAPIServicePortType }
  InvRegistry.RegisterInterface(TypeInfo(GKVAPIServicePortType), 'http://dhl.de/webservices/businesscustomershipping', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(GKVAPIServicePortType), 'urn:%operationName%');
  InvRegistry.RegisterInvokeOptions(TypeInfo(GKVAPIServicePortType), ioDocument);
  InvRegistry.RegisterInvokeOptions(TypeInfo(GKVAPIServicePortType), ioLiteral);
  InvRegistry.RegisterHeaderClass(TypeInfo(GKVAPIServicePortType), Authentification, 'header', 'http://dhl.de/webservice/cisbase');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_ValidationState), 'http://dhl.de/webservices/businesscustomershipping', 'Array_Of_ValidationState');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_LabelData), 'http://dhl.de/webservices/businesscustomershipping', 'Array_Of_LabelData');
  RemClassRegistry.RegisterXSInfo(TypeInfo(exportType), 'http://dhl.de/webservices/businesscustomershipping', 'exportType');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_ExportDocData), 'http://dhl.de/webservices/businesscustomershipping', 'Array_Of_ExportDocData');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_ManifestState), 'http://dhl.de/webservices/businesscustomershipping', 'Array_Of_ManifestState');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_DeletionState), 'http://dhl.de/webservices/businesscustomershipping', 'Array_Of_DeletionState');
  RemClassRegistry.RegisterXSInfo(TypeInfo(termsOfTrade), 'http://dhl.de/webservices/businesscustomershipping', 'termsOfTrade');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_CreationState), 'http://dhl.de/webservices/businesscustomershipping', 'Array_Of_CreationState');
  RemClassRegistry.RegisterXSClass(GetLabelResponse, 'http://dhl.de/webservices/businesscustomershipping', 'GetLabelResponse');
  RemClassRegistry.RegisterSerializeOptions(GetLabelResponse, [xoLiteralParam]);
  RemClassRegistry.RegisterXSInfo(TypeInfo(labelResponseType), 'http://dhl.de/webservices/businesscustomershipping', 'labelResponseType');
  RemClassRegistry.RegisterXSClass(DoManifestResponse, 'http://dhl.de/webservices/businesscustomershipping', 'DoManifestResponse');
  RemClassRegistry.RegisterSerializeOptions(DoManifestResponse, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(DeleteShipmentOrderResponse, 'http://dhl.de/webservices/businesscustomershipping', 'DeleteShipmentOrderResponse');
  RemClassRegistry.RegisterSerializeOptions(DeleteShipmentOrderResponse, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(GetVersionResponse, 'http://dhl.de/webservices/businesscustomershipping', 'GetVersionResponse');
  RemClassRegistry.RegisterSerializeOptions(GetVersionResponse, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(ValidateShipmentResponse, 'http://dhl.de/webservices/businesscustomershipping', 'ValidateShipmentResponse');
  RemClassRegistry.RegisterSerializeOptions(ValidateShipmentResponse, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(CreateShipmentOrderResponse, 'http://dhl.de/webservices/businesscustomershipping', 'CreateShipmentOrderResponse');
  RemClassRegistry.RegisterSerializeOptions(CreateShipmentOrderResponse, [xoLiteralParam]);
  RemClassRegistry.RegisterXSInfo(TypeInfo(exportDocResponseType), 'http://dhl.de/webservices/businesscustomershipping', 'exportDocResponseType');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_ValidateShipmentOrderType), 'http://dhl.de/webservices/businesscustomershipping', 'Array_Of_ValidateShipmentOrderType');
  RemClassRegistry.RegisterXSClass(ValidateShipmentOrderRequest, 'http://dhl.de/webservices/businesscustomershipping', 'ValidateShipmentOrderRequest');
  RemClassRegistry.RegisterSerializeOptions(ValidateShipmentOrderRequest, [xoLiteralParam]);
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_ShipmentOrderType), 'http://dhl.de/webservices/businesscustomershipping', 'Array_Of_ShipmentOrderType');
  RemClassRegistry.RegisterXSClass(CreateShipmentOrderRequest, 'http://dhl.de/webservices/businesscustomershipping', 'CreateShipmentOrderRequest');
  RemClassRegistry.RegisterSerializeOptions(CreateShipmentOrderRequest, [xoLiteralParam]);
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_ExportDocPosition), 'http://dhl.de/webservices/businesscustomershipping', 'Array_Of_ExportDocPosition');
  RemClassRegistry.RegisterXSClass(GetManifestResponse, 'http://dhl.de/webservices/businesscustomershipping', 'GetManifestResponse');
  RemClassRegistry.RegisterSerializeOptions(GetManifestResponse, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(GetExportDocResponse, 'http://dhl.de/webservices/businesscustomershipping', 'GetExportDocResponse');
  RemClassRegistry.RegisterSerializeOptions(GetExportDocResponse, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(UpdateShipmentOrderResponse, 'http://dhl.de/webservices/businesscustomershipping', 'UpdateShipmentOrderResponse');
  RemClassRegistry.RegisterSerializeOptions(UpdateShipmentOrderResponse, [xoLiteralParam]);
  RemClassRegistry.RegisterXSInfo(TypeInfo(amount), 'http://dhl.de/webservices/businesscustomershipping', 'amount');
  RemClassRegistry.RegisterXSInfo(TypeInfo(streetNumber), 'http://dhl.de/webservice/cisbase', 'streetNumber');
  RemClassRegistry.RegisterXSInfo(TypeInfo(addressAddition), 'http://dhl.de/webservice/cisbase', 'addressAddition');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_addressAddition), 'http://dhl.de/webservice/cisbase', 'Array_Of_addressAddition');
  RemClassRegistry.RegisterXSInfo(TypeInfo(dispatchingInformation), 'http://dhl.de/webservice/cisbase', 'dispatchingInformation');
  RemClassRegistry.RegisterXSInfo(TypeInfo(streetName), 'http://dhl.de/webservice/cisbase', 'streetName');
  RemClassRegistry.RegisterXSInfo(TypeInfo(streetNumber2), 'http://dhl.de/webservice/cisbase', 'streetNumber2', 'streetNumber');
  RemClassRegistry.RegisterXSInfo(TypeInfo(postNumber), 'http://dhl.de/webservice/cisbase', 'postNumber');
  RemClassRegistry.RegisterXSInfo(TypeInfo(parcelShopNumber), 'http://dhl.de/webservice/cisbase', 'parcelShopNumber');
  RemClassRegistry.RegisterXSInfo(TypeInfo(state), 'http://dhl.de/webservice/cisbase', 'state');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ZipType), 'http://dhl.de/webservice/cisbase', 'ZipType');
  RemClassRegistry.RegisterXSInfo(TypeInfo(zip), 'http://dhl.de/webservice/cisbase', 'zip');
  RemClassRegistry.RegisterXSInfo(TypeInfo(country), 'http://dhl.de/webservice/cisbase', 'country');
  RemClassRegistry.RegisterXSInfo(TypeInfo(countryISOType), 'http://dhl.de/webservice/cisbase', 'countryISOType');
  RemClassRegistry.RegisterXSClass(CountryType, 'http://dhl.de/webservice/cisbase', 'CountryType');
  RemClassRegistry.RegisterXSClass(Origin, 'http://dhl.de/webservice/cisbase', 'Origin');
  RemClassRegistry.RegisterXSInfo(TypeInfo(postfilialNumber), 'http://dhl.de/webservice/cisbase', 'postfilialNumber');
  RemClassRegistry.RegisterXSInfo(TypeInfo(accountreference), 'http://dhl.de/webservice/cisbase', 'accountreference');
  RemClassRegistry.RegisterXSInfo(TypeInfo(note1), 'http://dhl.de/webservice/cisbase', 'note1');
  RemClassRegistry.RegisterXSInfo(TypeInfo(note2), 'http://dhl.de/webservice/cisbase', 'note2');
  RemClassRegistry.RegisterXSInfo(TypeInfo(bic), 'http://dhl.de/webservice/cisbase', 'bic');
  RemClassRegistry.RegisterXSInfo(TypeInfo(contactPerson), 'http://dhl.de/webservice/cisbase', 'contactPerson');
  RemClassRegistry.RegisterXSInfo(TypeInfo(postNumber2), 'http://dhl.de/webservice/cisbase', 'postNumber2', 'postNumber');
  RemClassRegistry.RegisterXSInfo(TypeInfo(packstationNumber), 'http://dhl.de/webservice/cisbase', 'packstationNumber');
  RemClassRegistry.RegisterXSInfo(TypeInfo(phone), 'http://dhl.de/webservice/cisbase', 'phone');
  RemClassRegistry.RegisterXSInfo(TypeInfo(email), 'http://dhl.de/webservice/cisbase', 'email');
  RemClassRegistry.RegisterXSClass(CommunicationType, 'http://dhl.de/webservice/cisbase', 'CommunicationType');
  RemClassRegistry.RegisterXSInfo(TypeInfo(surname), 'http://dhl.de/webservices/businesscustomershipping', 'surname');
  RemClassRegistry.RegisterXSInfo(TypeInfo(majorRelease), 'http://dhl.de/webservices/businesscustomershipping', 'majorRelease');
  RemClassRegistry.RegisterXSInfo(TypeInfo(minorRelease), 'http://dhl.de/webservices/businesscustomershipping', 'minorRelease');
  RemClassRegistry.RegisterXSClass(GetManifestRequest, 'http://dhl.de/webservices/businesscustomershipping', 'GetManifestRequest');
  RemClassRegistry.RegisterSerializeOptions(GetManifestRequest, [xoLiteralParam]);
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_string), 'http://www.w3.org/2001/XMLSchema', 'Array_Of_string');
  RemClassRegistry.RegisterXSInfo(TypeInfo(build), 'http://dhl.de/webservices/businesscustomershipping', 'build');
  RemClassRegistry.RegisterXSClass(Version, 'http://dhl.de/webservices/businesscustomershipping', 'Version');
  RemClassRegistry.RegisterSerializeOptions(Version, [xoLiteralParam]);
  RemClassRegistry.RegisterXSInfo(TypeInfo(permitNumber), 'http://dhl.de/webservices/businesscustomershipping', 'permitNumber');
  RemClassRegistry.RegisterXSInfo(TypeInfo(placeOfCommital), 'http://dhl.de/webservices/businesscustomershipping', 'placeOfCommital');
  RemClassRegistry.RegisterXSInfo(TypeInfo(attestationNumber), 'http://dhl.de/webservices/businesscustomershipping', 'attestationNumber');
  RemClassRegistry.RegisterXSInfo(TypeInfo(countryCodeOrigin), 'http://dhl.de/webservices/businesscustomershipping', 'countryCodeOrigin');
  RemClassRegistry.RegisterXSInfo(TypeInfo(customsTariffNumber), 'http://dhl.de/webservices/businesscustomershipping', 'customsTariffNumber');
  RemClassRegistry.RegisterXSInfo(TypeInfo(description), 'http://dhl.de/webservices/businesscustomershipping', 'description');
  RemClassRegistry.RegisterXSInfo(TypeInfo(exportTypeDescription), 'http://dhl.de/webservices/businesscustomershipping', 'exportTypeDescription');
  RemClassRegistry.RegisterXSInfo(TypeInfo(givenName), 'http://dhl.de/webservices/businesscustomershipping', 'givenName');
  RemClassRegistry.RegisterXSInfo(TypeInfo(dateOfBirth), 'http://dhl.de/webservices/businesscustomershipping', 'dateOfBirth');
  RemClassRegistry.RegisterXSInfo(TypeInfo(invoiceNumber), 'http://dhl.de/webservices/businesscustomershipping', 'invoiceNumber');
  RemClassRegistry.RegisterXSInfo(TypeInfo(minimumAge), 'http://dhl.de/webservices/businesscustomershipping', 'minimumAge');
  RemClassRegistry.RegisterXSInfo(TypeInfo(recipientEmailAddress), 'http://dhl.de/webservices/businesscustomershipping', 'recipientEmailAddress');
  RemClassRegistry.RegisterXSInfo(TypeInfo(user), 'http://dhl.de/webservice/cisbase', 'user');
  RemClassRegistry.RegisterXSInfo(TypeInfo(streetName2), 'http://dhl.de/webservice/cisbase', 'streetName2', 'streetName');
  RemClassRegistry.RegisterXSInfo(TypeInfo(signature), 'http://dhl.de/webservice/cisbase', 'signature');
  RemClassRegistry.RegisterXSClass(AuthentificationType, 'http://dhl.de/webservice/cisbase', 'AuthentificationType');
  RemClassRegistry.RegisterXSInfo(TypeInfo(iban), 'http://dhl.de/webservice/cisbase', 'iban');
  RemClassRegistry.RegisterXSInfo(TypeInfo(bankName), 'http://dhl.de/webservice/cisbase', 'bankName');
  RemClassRegistry.RegisterXSInfo(TypeInfo(accountOwner), 'http://dhl.de/webservice/cisbase', 'accountOwner');
  RemClassRegistry.RegisterXSClass(BankType, 'http://dhl.de/webservice/cisbase', 'BankType');
  RemClassRegistry.RegisterXSInfo(TypeInfo(streetName3), 'http://dhl.de/webservice/cisbase', 'streetName3', 'streetName');
  RemClassRegistry.RegisterXSInfo(TypeInfo(dispatchingInformation2), 'http://dhl.de/webservice/cisbase', 'dispatchingInformation2', 'dispatchingInformation');
  RemClassRegistry.RegisterXSInfo(TypeInfo(addressAddition2), 'http://dhl.de/webservice/cisbase', 'addressAddition2', 'addressAddition');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_addressAddition2), 'http://dhl.de/webservice/cisbase', 'Array_Of_addressAddition2', 'Array_Of_addressAddition');
  RemClassRegistry.RegisterXSInfo(TypeInfo(streetNumber3), 'http://dhl.de/webservice/cisbase', 'streetNumber3', 'streetNumber');
  RemClassRegistry.RegisterXSClass(ShipmentNotificationType, 'http://dhl.de/webservices/businesscustomershipping', 'ShipmentNotificationType');
  RemClassRegistry.RegisterXSClass(ShipmentService, 'http://dhl.de/webservices/businesscustomershipping', 'ShipmentService');
  RemClassRegistry.RegisterXSInfo(TypeInfo(widthInCM), 'http://dhl.de/webservices/businesscustomershipping', 'widthInCM');
  RemClassRegistry.RegisterXSInfo(TypeInfo(lengthInCM), 'http://dhl.de/webservices/businesscustomershipping', 'lengthInCM');
  RemClassRegistry.RegisterXSInfo(TypeInfo(weightInKG), 'http://dhl.de/webservices/businesscustomershipping', 'weightInKG');
  RemClassRegistry.RegisterXSInfo(TypeInfo(additionalFee), 'http://dhl.de/webservices/businesscustomershipping', 'additionalFee');
  RemClassRegistry.RegisterXSInfo(TypeInfo(netWeightInKG), 'http://dhl.de/webservices/businesscustomershipping', 'netWeightInKG');
  RemClassRegistry.RegisterXSInfo(TypeInfo(customsValue), 'http://dhl.de/webservices/businesscustomershipping', 'customsValue');
  RemClassRegistry.RegisterXSClass(ExportDocPosition, 'http://dhl.de/webservices/businesscustomershipping', 'ExportDocPosition');
  RemClassRegistry.RegisterXSInfo(TypeInfo(shipmentDate), 'http://dhl.de/webservices/businesscustomershipping', 'shipmentDate');
  RemClassRegistry.RegisterXSInfo(TypeInfo(customerReference), 'http://dhl.de/webservices/businesscustomershipping', 'customerReference');
  RemClassRegistry.RegisterXSInfo(TypeInfo(returnShipmentReference), 'http://dhl.de/webservices/businesscustomershipping', 'returnShipmentReference');
  RemClassRegistry.RegisterXSInfo(TypeInfo(returnShipmentAccountNumber), 'http://dhl.de/webservices/businesscustomershipping', 'returnShipmentAccountNumber');
  RemClassRegistry.RegisterXSInfo(TypeInfo(heightInCM), 'http://dhl.de/webservices/businesscustomershipping', 'heightInCM');
  RemClassRegistry.RegisterXSClass(ShipmentItemType, 'http://dhl.de/webservices/businesscustomershipping', 'ShipmentItemType');
  RemClassRegistry.RegisterXSClass(ServiceconfigurationCashOnDelivery, 'http://dhl.de/webservices/businesscustomershipping', 'ServiceconfigurationCashOnDelivery');
  RemClassRegistry.RegisterXSClass(ServiceconfigurationDetails, 'http://dhl.de/webservices/businesscustomershipping', 'ServiceconfigurationDetails');
  RemClassRegistry.RegisterXSClass(ServiceconfigurationVisualAgeCheck, 'http://dhl.de/webservices/businesscustomershipping', 'ServiceconfigurationVisualAgeCheck');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(ServiceconfigurationVisualAgeCheck), 'type_', '[ExtName="type"]');
  RemClassRegistry.RegisterXSClass(Ident, 'http://dhl.de/webservices/businesscustomershipping', 'Ident');
  RemClassRegistry.RegisterXSClass(ServiceconfigurationIC, 'http://dhl.de/webservices/businesscustomershipping', 'ServiceconfigurationIC');
  RemClassRegistry.RegisterXSClass(ServiceconfigurationAdditionalInsurance, 'http://dhl.de/webservices/businesscustomershipping', 'ServiceconfigurationAdditionalInsurance');
  RemClassRegistry.RegisterXSClass(ServiceconfigurationDeliveryTimeframe, 'http://dhl.de/webservices/businesscustomershipping', 'ServiceconfigurationDeliveryTimeframe');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(ServiceconfigurationDeliveryTimeframe), 'type_', '[ExtName="type"]');
  RemClassRegistry.RegisterXSClass(ServiceconfigurationDateOfDelivery, 'http://dhl.de/webservices/businesscustomershipping', 'ServiceconfigurationDateOfDelivery');
  RemClassRegistry.RegisterXSClass(ShipmentItemTypeType, 'http://dhl.de/webservices/businesscustomershipping', 'ShipmentItemTypeType');
  RemClassRegistry.RegisterXSClass(ServiceconfigurationEndorsement, 'http://dhl.de/webservices/businesscustomershipping', 'ServiceconfigurationEndorsement');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(ServiceconfigurationEndorsement), 'type_', '[ExtName="type"]');
  RemClassRegistry.RegisterXSClass(ServiceconfigurationShipmentHandling, 'http://dhl.de/webservices/businesscustomershipping', 'ServiceconfigurationShipmentHandling');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(ServiceconfigurationShipmentHandling), 'type_', '[ExtName="type"]');
  RemClassRegistry.RegisterXSClass(ServiceconfigurationISR, 'http://dhl.de/webservices/businesscustomershipping', 'ServiceconfigurationISR');
  RemClassRegistry.RegisterXSInfo(TypeInfo(shipmentNumber2), 'http://dhl.de/webservice/cisbase', 'shipmentNumber2', 'shipmentNumber');
  RemClassRegistry.RegisterXSInfo(TypeInfo(shipmentNumber), 'http://dhl.de/webservice/cisbase', 'shipmentNumber');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_shipmentNumber), 'http://dhl.de/webservice/cisbase', 'Array_Of_shipmentNumber');
  RemClassRegistry.RegisterXSClass(DoManifestRequest, 'http://dhl.de/webservices/businesscustomershipping', 'DoManifestRequest');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(DoManifestRequest), 'shipmentNumber', '[Namespace="http://dhl.de/webservice/cisbase"]');
  RemClassRegistry.RegisterSerializeOptions(DoManifestRequest, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(GetExportDocRequest, 'http://dhl.de/webservices/businesscustomershipping', 'GetExportDocRequest');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(GetExportDocRequest), 'shipmentNumber', '[Namespace="http://dhl.de/webservice/cisbase"]');
  RemClassRegistry.RegisterSerializeOptions(GetExportDocRequest, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(DeleteShipmentOrderRequest, 'http://dhl.de/webservices/businesscustomershipping', 'DeleteShipmentOrderRequest');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(DeleteShipmentOrderRequest), 'shipmentNumber', '[Namespace="http://dhl.de/webservice/cisbase"]');
  RemClassRegistry.RegisterSerializeOptions(DeleteShipmentOrderRequest, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(GetLabelRequest, 'http://dhl.de/webservices/businesscustomershipping', 'GetLabelRequest');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(GetLabelRequest), 'shipmentNumber', '[Namespace="http://dhl.de/webservice/cisbase"]');
  RemClassRegistry.RegisterSerializeOptions(GetLabelRequest, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(UpdateShipmentOrderRequest, 'http://dhl.de/webservices/businesscustomershipping', 'UpdateShipmentOrderRequest');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(UpdateShipmentOrderRequest), 'shipmentNumber', '[Namespace="http://dhl.de/webservice/cisbase"]');
  RemClassRegistry.RegisterSerializeOptions(UpdateShipmentOrderRequest, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(ExportDocData, 'http://dhl.de/webservices/businesscustomershipping', 'ExportDocData');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(ExportDocData), 'shipmentNumber', '[Namespace="http://dhl.de/webservice/cisbase"]');
  RemClassRegistry.RegisterXSClass(DeletionState, 'http://dhl.de/webservices/businesscustomershipping', 'DeletionState');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(DeletionState), 'shipmentNumber', '[Namespace="http://dhl.de/webservice/cisbase"]');
  RemClassRegistry.RegisterXSClass(ManifestState, 'http://dhl.de/webservices/businesscustomershipping', 'ManifestState');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(ManifestState), 'shipmentNumber', '[Namespace="http://dhl.de/webservice/cisbase"]');
  RemClassRegistry.RegisterXSInfo(TypeInfo(name32), 'http://dhl.de/webservice/cisbase', 'name32', 'name3');
  RemClassRegistry.RegisterXSInfo(TypeInfo(name3), 'http://dhl.de/webservice/cisbase', 'name3');
  RemClassRegistry.RegisterXSClass(LabelData, 'http://dhl.de/webservices/businesscustomershipping', 'LabelData');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(LabelData), 'shipmentNumber', '[Namespace="http://dhl.de/webservice/cisbase"]');
  RemClassRegistry.RegisterXSInfo(TypeInfo(SequenceNumber), 'http://dhl.de/webservices/businesscustomershipping', 'SequenceNumber');
  RemClassRegistry.RegisterXSClass(ValidationState, 'http://dhl.de/webservices/businesscustomershipping', 'ValidationState');
  RemClassRegistry.RegisterXSClass(CreationState, 'http://dhl.de/webservices/businesscustomershipping', 'CreationState');
  RemClassRegistry.RegisterXSInfo(TypeInfo(city2), 'http://dhl.de/webservice/cisbase', 'city2', 'city');
  RemClassRegistry.RegisterXSInfo(TypeInfo(city), 'http://dhl.de/webservice/cisbase', 'city');
  RemClassRegistry.RegisterXSClass(PackStationType, 'http://dhl.de/webservice/cisbase', 'PackStationType');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(PackStationType), 'zip', '[Namespace="http://dhl.de/webservice/cisbase"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(PackStationType), 'city', '[Namespace="http://dhl.de/webservice/cisbase"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(PackStationType), 'Origin', '[Namespace="http://dhl.de/webservice/cisbase"]');
  RemClassRegistry.RegisterXSClass(PostfilialeType, 'http://dhl.de/webservice/cisbase', 'PostfilialeType');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(PostfilialeType), 'zip', '[Namespace="http://dhl.de/webservice/cisbase"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(PostfilialeType), 'city', '[Namespace="http://dhl.de/webservice/cisbase"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(PostfilialeType), 'Origin', '[Namespace="http://dhl.de/webservice/cisbase"]');
  RemClassRegistry.RegisterXSClass(NativeAddressType, 'http://dhl.de/webservice/cisbase', 'NativeAddressType');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(NativeAddressType), 'zip', '[Namespace="http://dhl.de/webservice/cisbase"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(NativeAddressType), 'city', '[Namespace="http://dhl.de/webservice/cisbase"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(NativeAddressType), 'Origin', '[Namespace="http://dhl.de/webservice/cisbase"]');
  RemClassRegistry.RegisterXSClass(ParcelShopType, 'http://dhl.de/webservice/cisbase', 'ParcelShopType');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(ParcelShopType), 'zip', '[Namespace="http://dhl.de/webservice/cisbase"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(ParcelShopType), 'city', '[Namespace="http://dhl.de/webservice/cisbase"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(ParcelShopType), 'Origin', '[Namespace="http://dhl.de/webservice/cisbase"]');
  RemClassRegistry.RegisterXSInfo(TypeInfo(accountNumber2), 'http://dhl.de/webservice/cisbase', 'accountNumber2', 'accountNumber');
  RemClassRegistry.RegisterXSInfo(TypeInfo(accountNumber), 'http://dhl.de/webservice/cisbase', 'accountNumber');
  RemClassRegistry.RegisterXSClass(ShipmentDetailsType, 'http://dhl.de/webservices/businesscustomershipping', 'ShipmentDetailsType');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(ShipmentDetailsType), 'accountNumber', '[Namespace="http://dhl.de/webservice/cisbase"]');
  RemClassRegistry.RegisterXSInfo(TypeInfo(name22), 'http://dhl.de/webservice/cisbase', 'name22', 'name2');
  RemClassRegistry.RegisterXSInfo(TypeInfo(name2), 'http://dhl.de/webservice/cisbase', 'name2');
  RemClassRegistry.RegisterXSClass(ReceiverNativeAddressType, 'http://dhl.de/webservice/cisbase', 'ReceiverNativeAddressType');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(ReceiverNativeAddressType), 'name2', '[Namespace="http://dhl.de/webservice/cisbase"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(ReceiverNativeAddressType), 'name3', '[Namespace="http://dhl.de/webservice/cisbase"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(ReceiverNativeAddressType), 'zip', '[Namespace="http://dhl.de/webservice/cisbase"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(ReceiverNativeAddressType), 'city', '[Namespace="http://dhl.de/webservice/cisbase"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(ReceiverNativeAddressType), 'Origin', '[Namespace="http://dhl.de/webservice/cisbase"]');
  RemClassRegistry.RegisterXSInfo(TypeInfo(name12), 'http://dhl.de/webservice/cisbase', 'name12', 'name1');
  RemClassRegistry.RegisterXSInfo(TypeInfo(name1), 'http://dhl.de/webservice/cisbase', 'name1');
  RemClassRegistry.RegisterXSClass(NameType, 'http://dhl.de/webservice/cisbase', 'NameType');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(NameType), 'name1', '[Namespace="http://dhl.de/webservice/cisbase"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(NameType), 'name2', '[Namespace="http://dhl.de/webservice/cisbase"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(NameType), 'name3', '[Namespace="http://dhl.de/webservice/cisbase"]');
  RemClassRegistry.RegisterXSClass(Authentification, 'http://dhl.de/webservice/cisbase', 'Authentification');
  RemClassRegistry.RegisterXSClass(Statusinformation, 'http://dhl.de/webservices/businesscustomershipping', 'Statusinformation');
  RemClassRegistry.RegisterXSClass(ValidateShipmentOrderType, 'http://dhl.de/webservices/businesscustomershipping', 'ValidateShipmentOrderType');
  RemClassRegistry.RegisterXSInfo(TypeInfo(labelResponseType2), 'http://dhl.de/webservices/businesscustomershipping', 'labelResponseType2', 'labelResponseType');
  RemClassRegistry.RegisterXSClass(Serviceconfiguration, 'http://dhl.de/webservices/businesscustomershipping', 'Serviceconfiguration');
  RemClassRegistry.RegisterXSClass(ReceiverTypeType, 'http://dhl.de/webservices/businesscustomershipping', 'ReceiverTypeType');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(ReceiverTypeType), 'name1', '[Namespace="http://dhl.de/webservice/cisbase"]');
  RemClassRegistry.RegisterXSClass(ShipperTypeType, 'http://dhl.de/webservices/businesscustomershipping', 'ShipperTypeType');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(ShipperTypeType), 'Name_', '[ExtName="Name"]');
  RemClassRegistry.RegisterXSClass(Shipment, 'http://dhl.de/webservices/businesscustomershipping', 'Shipment');
  RemClassRegistry.RegisterXSClass(ShipmentDetailsTypeType, 'http://dhl.de/webservices/businesscustomershipping', 'ShipmentDetailsTypeType');
  RemClassRegistry.RegisterXSClass(Shipment2, 'http://dhl.de/webservices/businesscustomershipping', 'Shipment2', 'Shipment');
  RemClassRegistry.RegisterXSClass(ShipmentOrderType, 'http://dhl.de/webservices/businesscustomershipping', 'ShipmentOrderType');
  RemClassRegistry.RegisterXSClass(ExportDocumentType, 'http://dhl.de/webservices/businesscustomershipping', 'ExportDocumentType');
  RemClassRegistry.RegisterXSClass(ReceiverType, 'http://dhl.de/webservices/businesscustomershipping', 'ReceiverType');
  RemClassRegistry.RegisterXSClass(ShipperType, 'http://dhl.de/webservices/businesscustomershipping', 'ShipperType');

end.