object fra_DHLValidateShipmentOrder: Tfra_DHLValidateShipmentOrder
  Left = 0
  Top = 0
  Width = 320
  Height = 240
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 320
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 0
    ExplicitLeft = -131
    ExplicitWidth = 451
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
    Width = 320
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
    ExplicitLeft = -131
    ExplicitTop = -24
    ExplicitWidth = 451
    ExplicitHeight = 264
  end
end
