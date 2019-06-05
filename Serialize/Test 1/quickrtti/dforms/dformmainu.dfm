object Form1: TForm1
  Left = 139
  Top = 130
  Width = 459
  Height = 310
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
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Form > XML'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 120
    Top = 8
    Width = 321
    Height = 265
    TabOrder = 1
    WordWrap = False
  end
  object Button2: TButton
    Left = 8
    Top = 40
    Width = 75
    Height = 25
    Caption = 'XML > Form'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 72
    Width = 81
    Height = 25
    Caption = 'Save to file'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 8
    Top = 104
    Width = 81
    Height = 25
    Caption = 'Load From file'
    TabOrder = 4
    OnClick = Button4Click
  end
end
