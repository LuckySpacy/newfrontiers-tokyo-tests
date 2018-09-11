object Form1: TForm1
  Left = 293
  Top = 114
  Width = 413
  Height = 449
  Caption = 'Display - A hbTAPI Sample'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 385
    Height = 97
    Caption = 'Device'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 28
      Width = 60
      Height = 13
      Caption = 'Line Device:'
    end
    object Label2: TLabel
      Left = 16
      Top = 60
      Width = 71
      Height = 13
      Caption = 'Phone Device:'
    end
    object ComboBox_Line: TComboBox
      Left = 104
      Top = 24
      Width = 262
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = DoSelectLineDevice
    end
    object ComboBox_Phone: TComboBox
      Left = 104
      Top = 56
      Width = 262
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnChange = DoSelectPhoneDevice
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 112
    Width = 385
    Height = 105
    Caption = 'Display'
    TabOrder = 1
    object Display: TMemo
      Left = 10
      Top = 20
      Width = 359
      Height = 73
      TabOrder = 0
      OnDblClick = TapiPhone1Display
    end
  end
  object ListBox1: TListBox
    Left = 8
    Top = 315
    Width = 385
    Height = 97
    ItemHeight = 13
    TabOrder = 2
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 225
    Width = 385
    Height = 81
    Caption = 'Set Display'
    TabOrder = 3
    object Label3: TLabel
      Left = 16
      Top = 24
      Width = 25
      Height = 13
      Caption = 'Row:'
    end
    object Label4: TLabel
      Left = 16
      Top = 52
      Width = 24
      Height = 13
      Caption = 'Text:'
    end
    object Label_Column: TLabel
      Left = 107
      Top = 24
      Width = 38
      Height = 13
      Caption = 'Column:'
    end
    object Edit_Row: TEdit
      Left = 56
      Top = 20
      Width = 41
      Height = 21
      TabOrder = 0
      Text = '0'
    end
    object Edit_Column: TEdit
      Left = 157
      Top = 20
      Width = 41
      Height = 21
      TabOrder = 1
      Text = '0'
    end
    object Edit_Text: TEdit
      Left = 56
      Top = 48
      Width = 321
      Height = 21
      TabOrder = 2
      Text = 'Hello World'
    end
    object Button1: TButton
      Left = 301
      Top = 18
      Width = 75
      Height = 25
      Caption = 'SetDisplay'
      TabOrder = 3
      OnClick = Button1Click
    end
  end
  object hbTapiLine1: ThbTapiLine
    CallParams.Flags = 0
    Left = 168
    Top = 160
  end
  object TapiPhone1: ThbTapiPhone
    Options.ReplyTimeout = 3000
    Privileges.Monitor = True
    Privileges.Owner = False
    OnDisplay = TapiPhone1Display
    Left = 200
    Top = 160
  end
end
