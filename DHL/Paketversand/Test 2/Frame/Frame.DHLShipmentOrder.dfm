object fra_DHLShipmentOrder: Tfra_DHLShipmentOrder
  Left = 0
  Top = 0
  Width = 774
  Height = 305
  Align = alClient
  TabOrder = 0
  ExplicitWidth = 451
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 774
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 0
    ExplicitWidth = 451
    object btn_ErzeugeShipmentorder: TButton
      Left = 16
      Top = 10
      Width = 145
      Height = 25
      Caption = 'Erzeuge ShipmentOrder'
      TabOrder = 0
      OnClick = btn_ErzeugeShipmentorderClick
    end
    object btn_UpdateShipmentOrder: TButton
      Left = 167
      Top = 10
      Width = 145
      Height = 25
      Caption = 'Update ShipmentOrder'
      TabOrder = 1
      OnClick = btn_UpdateShipmentOrderClick
    end
    object btn_DeleteShipmentorder: TButton
      Left = 318
      Top = 10
      Width = 145
      Height = 25
      Caption = 'Delete ShipmentOrder'
      TabOrder = 2
      OnClick = btn_DeleteShipmentorderClick
    end
    object btn_GetLabel: TButton
      Left = 469
      Top = 10
      Width = 145
      Height = 25
      Caption = 'GetLabel'
      TabOrder = 3
      OnClick = btn_GetLabelClick
    end
  end
  object Memo1: TMemo
    Left = 0
    Top = 41
    Width = 774
    Height = 264
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
    ExplicitWidth = 451
  end
end
