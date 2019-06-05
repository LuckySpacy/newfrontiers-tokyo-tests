object Form1: TForm1
  Left = 171
  Top = 81
  Width = 304
  Height = 480
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
    Left = 16
    Top = 8
    Width = 265
    Height = 305
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 16
    Top = 328
    Width = 113
    Height = 49
    Caption = 'Cat'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 168
    Top = 328
    Width = 113
    Height = 49
    Caption = 'Lion'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 64
    Top = 384
    Width = 169
    Height = 33
    Caption = 'Lionard'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 16
    Top = 424
    Width = 121
    Height = 25
    Caption = 'TComponent > XML'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 160
    Top = 424
    Width = 129
    Height = 25
    Caption = 'XML > TComponent'
    TabOrder = 5
    OnClick = Button5Click
  end
end
