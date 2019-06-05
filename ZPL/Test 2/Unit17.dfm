object Form17: TForm17
  Left = 0
  Top = 0
  Caption = 'Form17'
  ClientHeight = 449
  ClientWidth = 458
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 41
    Width = 458
    Height = 408
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 458
    Height = 41
    Align = alTop
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 1
    object Button1: TButton
      Left = 170
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Drucken'
      TabOrder = 0
      Visible = False
      OnClick = Button1Click
    end
    object btn_Drucken_Stream: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Drucken (S)'
      TabOrder = 1
      OnClick = btn_Drucken_StreamClick
    end
    object Button2: TButton
      Left = 241
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Drucken'
      TabOrder = 2
      Visible = False
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 318
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Drucken'
      TabOrder = 3
      Visible = False
      OnClick = Button3Click
    end
  end
  object IdFTP1: TIdFTP
    IPVersion = Id_IPv4
    NATKeepAlive.UseKeepAlive = False
    NATKeepAlive.IdleTimeMS = 0
    NATKeepAlive.IntervalMS = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 384
    Top = 176
  end
end
