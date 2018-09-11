object Form1: TForm1
  Left = 270
  Top = 229
  Width = 700
  Height = 480
  Caption = 'Form1'
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
    Left = 376
    Top = 144
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object ComboBox1: TComboBox
    Left = 24
    Top = 24
    Width = 281
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    Text = 'ComboBox1'
    OnChange = ComboBox1Change
  end
  object Button1: TButton
    Left = 24
    Top = 56
    Width = 75
    Height = 25
    Caption = 'MakeCall'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 312
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Open'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 392
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 104
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Answer'
    TabOrder = 4
  end
  object CheckBox1: TCheckBox
    Left = 24
    Top = 144
    Width = 97
    Height = 17
    Caption = 'CheckBox1'
    TabOrder = 5
  end
  object hbTapiLine1: ThbTapiLine
    MediaModes = 4
    Privileges.Monitor = False
    Privileges.None = True
    Privileges.Owner = False
    Left = 24
    Top = 96
  end
end
