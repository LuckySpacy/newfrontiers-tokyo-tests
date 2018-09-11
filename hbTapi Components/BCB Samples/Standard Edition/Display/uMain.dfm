object Form1: TForm1
  Left = 194
  Top = 106
  Width = 412
  Height = 364
  Caption = 'Display - A hbTapi Sample'
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
      OnChange = ComboBox_LineChange
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
    end
  end
  object ListBox1: TListBox
    Left = 8
    Top = 232
    Width = 385
    Height = 97
    ItemHeight = 13
    TabOrder = 2
  end
  object hbTapiLine1: ThbTapiLine
    CallOptions.GatherDigits.TerminationDigits = '*#'
    CallParams.Flags = 0
    Left = 168
    Top = 160
  end
  object TapiPhone1: ThbTapiPhone
    Privileges.Monitor = True
    Privileges.Owner = False
    OnDisplay = TapiPhone1Display
    Left = 200
    Top = 160
  end
end
