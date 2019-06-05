object Form1: TForm1
  Left = 248
  Top = 125
  Width = 239
  Height = 368
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 91
    Top = 256
    Width = 118
    Height = 13
    Caption = '10000 to XML and back:'
  end
  object lblTimeIn: TLabel
    Left = 8
    Top = 300
    Width = 217
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '0'
  end
  object lblTimeout: TLabel
    Left = 8
    Top = 316
    Width = 217
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '0'
  end
  object Label2: TLabel
    Left = 8
    Top = 32
    Width = 64
    Height = 13
    Caption = 'RTTI Enabler'
  end
  object lblCOunt: TLabel
    Left = 176
    Top = 280
    Width = 6
    Height = 13
    Caption = '0'
  end
  object Memo1: TMemo
    Left = 7
    Top = 81
    Width = 202
    Height = 169
    TabOrder = 0
  end
  object Button1: TButton
    Left = 7
    Top = 7
    Width = 65
    Height = 20
    Caption = 'Obj to XML>'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 80
    Top = 7
    Width = 66
    Height = 20
    Caption = '< XML to Obj'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 7
    Top = 269
    Width = 60
    Height = 20
    Caption = 'TimeTrial'
    TabOrder = 3
    OnClick = Button3Click
  end
  object cboRTTI: TComboBox
    Left = 8
    Top = 48
    Width = 201
    Height = 21
    ItemHeight = 13
    TabOrder = 4
    Text = 'LowX'
    Items.Strings = (
      'LowX'
      'MSDOM'
      'MiddleX'
      'OpenXML'
      '')
  end
  object Button4: TButton
    Left = 152
    Top = 7
    Width = 66
    Height = 20
    Caption = 'Schema'
    TabOrder = 5
    OnClick = Button4Click
  end
end
