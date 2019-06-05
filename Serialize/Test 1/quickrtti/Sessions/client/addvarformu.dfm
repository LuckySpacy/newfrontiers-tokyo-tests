object AddVariableForm: TAddVariableForm
  Left = 236
  Top = 193
  Width = 264
  Height = 203
  Caption = 'Add Variable'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 31
    Height = 13
    Caption = 'Name:'
  end
  object Label2: TLabel
    Left = 8
    Top = 40
    Width = 26
    Height = 13
    Caption = 'Data:'
  end
  object Edit1: TEdit
    Left = 48
    Top = 8
    Width = 185
    Height = 21
    TabOrder = 0
  end
  object Memo1: TMemo
    Left = 48
    Top = 40
    Width = 185
    Height = 89
    TabOrder = 1
  end
  object Button1: TButton
    Left = 8
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Save'
    ModalResult = 1
    TabOrder = 2
  end
  object Button2: TButton
    Left = 176
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
end
