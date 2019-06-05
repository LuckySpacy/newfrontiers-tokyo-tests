object Form1: TForm1
  Left = 193
  Top = 108
  Width = 439
  Height = 200
  Caption = 'Object Awareness'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 152
    Top = 16
    Width = 11
    Height = 13
    Caption = 'ID'
  end
  object Label2: TLabel
    Left = 112
    Top = 72
    Width = 28
    Height = 13
    Caption = 'Name'
  end
  object Label3: TLabel
    Left = 112
    Top = 96
    Width = 41
    Height = 13
    Caption = 'Address:'
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 129
    Height = 25
    Caption = 'Create An Object'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Read'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Update'
    TabOrder = 2
    OnClick = Button3Click
  end
  object ComboBox1: TComboBox
    Left = 176
    Top = 16
    Width = 233
    Height = 21
    ItemHeight = 13
    TabOrder = 3
  end
  object Edit1: TEdit
    Left = 160
    Top = 72
    Width = 241
    Height = 21
    TabOrder = 4
  end
  object Edit2: TEdit
    Left = 160
    Top = 96
    Width = 241
    Height = 21
    TabOrder = 5
  end
  object Button4: TButton
    Left = 8
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Destroy'
    TabOrder = 6
    OnClick = Button4Click
  end
end
