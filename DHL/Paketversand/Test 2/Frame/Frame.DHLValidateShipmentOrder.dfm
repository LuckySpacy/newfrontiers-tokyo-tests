object fra_DHLValidateShipmentOrder: Tfra_DHLValidateShipmentOrder
  Left = 0
  Top = 0
  Width = 771
  Height = 240
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 771
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 0
    ExplicitWidth = 320
    object btn_ErzeugeShipmentorder: TButton
      Left = 32
      Top = 9
      Width = 145
      Height = 25
      Caption = 'Erzeuge ShipmentOrder'
      TabOrder = 0
      OnClick = btn_ErzeugeShipmentorderClick
    end
    object btn_Tagesabschluss: TButton
      Left = 183
      Top = 9
      Width = 145
      Height = 25
      Caption = 'Tagesabschluss'
      TabOrder = 1
      OnClick = btn_TagesabschlussClick
    end
    object edt_Tagesabschluss: TDateTimePicker
      Left = 334
      Top = 11
      Width = 115
      Height = 21
      Date = 43402.665692453700000000
      Time = 43402.665692453700000000
      TabOrder = 2
    end
  end
  object Memo1: TMemo
    Left = 0
    Top = 41
    Width = 771
    Height = 199
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 1
    ExplicitTop = 38
  end
end
