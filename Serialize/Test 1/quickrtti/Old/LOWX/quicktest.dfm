object Form1: TForm1
  Left = 248
  Top = 125
  Width = 280
  Height = 335
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
    Top = 208
    Width = 118
    Height = 13
    Caption = '10000 to XML and back:'
  end
  object lblTimeIn: TLabel
    Left = 13
    Top = 260
    Width = 252
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '0'
  end
  object lblTimeout: TLabel
    Left = 13
    Top = 276
    Width = 252
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '0'
  end
  object Memo1: TMemo
    Left = 7
    Top = 33
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
    Left = 111
    Top = 7
    Width = 91
    Height = 20
    Caption = '< XML to Obj'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 7
    Top = 221
    Width = 60
    Height = 20
    Caption = 'TimeTrial'
    TabOrder = 3
    OnClick = Button3Click
  end
end
