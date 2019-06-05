object Form1: TForm1
  Left = 90
  Top = 40
  Width = 541
  Height = 318
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 8
    Top = 0
    Width = 505
    Height = 105
    Lines.Strings = (
      '<Item PROP1="test" PROP2="test2">'
      '  <Sub>'
      '     <item>This is a sub object with the same name as an '
      'item up the tree</item>'
      '<selfterm />'
      '  </Sub>'
      '</item>')
    TabOrder = 0
  end
  object Button2: TButton
    Left = 128
    Top = 120
    Width = 281
    Height = 25
    Caption = 'Convert to MiddleXNodes and rebuild'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Memo3: TMemo
    Left = 8
    Top = 152
    Width = 513
    Height = 129
    TabOrder = 2
    WordWrap = False
  end
end
