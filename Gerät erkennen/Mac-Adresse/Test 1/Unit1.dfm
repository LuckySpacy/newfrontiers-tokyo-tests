object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 552
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 193
    Height = 97
    Caption = 'Bildschirmaufl'#246'sung'
    TabOrder = 1
    object lbl_Bildschirmhoehe: TLabel
      Left = 16
      Top = 32
      Width = 29
      Height = 13
      Caption = 'H'#246'he:'
    end
    object lbl_Bildschirmbreite: TLabel
      Left = 16
      Top = 51
      Width = 32
      Height = 13
      Caption = 'Breite:'
    end
  end
end
