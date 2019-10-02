object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 214
  ClientWidth = 429
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 429
    Height = 81
    Align = alTop
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 0
    object btn_Get: TButton
      Left = 14
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Dr'#252'ck mich'
      TabOrder = 0
      OnClick = btn_GetClick
    end
    object btn_Connect: TButton
      Left = 97
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Connect'
      TabOrder = 1
      OnClick = btn_ConnectClick
    end
    object btn_NewCustomer: TButton
      Left = 177
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Kunden'
      TabOrder = 2
      OnClick = btn_NewCustomerClick
    end
    object btn_Categories: TButton
      Left = 14
      Top = 40
      Width = 75
      Height = 25
      Caption = 'Kategorien'
      TabOrder = 3
      OnClick = btn_CategoriesClick
    end
    object btn_Kunden: TButton
      Left = 96
      Top = 40
      Width = 75
      Height = 25
      Caption = 'Kunden'
      TabOrder = 4
      OnClick = btn_KundenClick
    end
    object btn_Bestellung: TButton
      Left = 178
      Top = 40
      Width = 75
      Height = 25
      Caption = 'Bestellung'
      TabOrder = 5
      OnClick = btn_BestellungClick
    end
    object btn_Artikel: TButton
      Left = 258
      Top = 40
      Width = 75
      Height = 25
      Caption = 'Artikel'
      TabOrder = 6
      OnClick = btn_ArtikelClick
    end
  end
  object Memo1: TMemo
    Left = 0
    Top = 81
    Width = 429
    Height = 133
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    TabOrder = 1
  end
end
