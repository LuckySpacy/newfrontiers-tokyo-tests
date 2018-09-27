object fra_DHLShipmentOrder: Tfra_DHLShipmentOrder
  Left = 0
  Top = 0
  Width = 709
  Height = 341
  Align = alClient
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 709
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 0
    object btn_ErzeugeShipmentorder: TButton
      Left = 32
      Top = 9
      Width = 145
      Height = 25
      Caption = 'Erzeuge ShipmentOrder'
      TabOrder = 0
      OnClick = btn_ErzeugeShipmentorderClick
    end
  end
  object Memo1: TMemo
    Left = 0
    Top = 41
    Width = 709
    Height = 300
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
    ExplicitTop = 280
    ExplicitHeight = 61
  end
end
