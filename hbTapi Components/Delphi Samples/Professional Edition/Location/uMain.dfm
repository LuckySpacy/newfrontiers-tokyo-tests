object Form1: TForm1
  Left = 301
  Top = 107
  Width = 448
  Height = 480
  Caption = 'Location - A hbTapi sample'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 5
    Width = 425
    Height = 225
    Caption = 'System location:'
    TabOrder = 0
    object Label_LocationName: TLabel
      Left = 158
      Top = 24
      Width = 101
      Height = 13
      Caption = 'Label_LocationName'
    end
    object Label3: TLabel
      Left = 16
      Top = 24
      Width = 72
      Height = 13
      Caption = 'LocationName:'
    end
    object Label5: TLabel
      Left = 16
      Top = 86
      Width = 64
      Height = 13
      Caption = 'CountryCode:'
    end
    object Label6: TLabel
      Left = 16
      Top = 106
      Width = 50
      Height = 13
      Caption = 'CountryID:'
    end
    object Label7: TLabel
      Left = 16
      Top = 127
      Width = 67
      Height = 13
      Caption = 'CountryName:'
    end
    object Label8: TLabel
      Left = 16
      Top = 147
      Width = 89
      Height = 13
      Caption = 'LocalAccessCode:'
    end
    object Label9: TLabel
      Left = 16
      Top = 168
      Width = 129
      Height = 13
      Caption = 'LongDistanceAccessCode:'
    end
    object Label10: TLabel
      Left = 16
      Top = 44
      Width = 106
      Height = 13
      Caption = 'PermanentLocationID:'
    end
    object Label_PermanentLocationID: TLabel
      Left = 158
      Top = 44
      Width = 135
      Height = 13
      Caption = 'Label_PermanentLocationID'
    end
    object Label_CountryID: TLabel
      Left = 158
      Top = 106
      Width = 79
      Height = 13
      Caption = 'Label_CountryID'
    end
    object Label_CountryCode: TLabel
      Left = 158
      Top = 86
      Width = 93
      Height = 13
      Caption = 'Label_CountryCode'
    end
    object Label_CountryName: TLabel
      Left = 158
      Top = 127
      Width = 96
      Height = 13
      Caption = 'Label_CountryName'
    end
    object Label_LocalAccessCode: TLabel
      Left = 158
      Top = 147
      Width = 118
      Height = 13
      Caption = 'Label_LocalAccessCode'
    end
    object Label_LongDistanceAccessCode: TLabel
      Left = 158
      Top = 168
      Width = 158
      Height = 13
      Caption = 'Label_LongDistanceAccessCode'
    end
    object Label2: TLabel
      Left = 16
      Top = 64
      Width = 45
      Height = 13
      Caption = 'CityCode:'
    end
    object Label_CityCode: TLabel
      Left = 158
      Top = 64
      Width = 74
      Height = 13
      Caption = 'Label_CityCode'
    end
    object Button1: TButton
      Left = 260
      Top = 191
      Width = 75
      Height = 25
      Caption = 'Change'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 340
      Top = 191
      Width = 75
      Height = 25
      Caption = 'Update'
      TabOrder = 1
      OnClick = DoUpdateSystemLocation
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 236
    Width = 425
    Height = 143
    Caption = 'Defined locations:'
    TabOrder = 1
    object Button3: TButton
      Left = 333
      Top = 108
      Width = 75
      Height = 25
      Caption = 'Update'
      TabOrder = 0
      OnClick = DoUpdateLocations
    end
    object ListBox1: TListBox
      Left = 16
      Top = 19
      Width = 393
      Height = 86
      ItemHeight = 13
      TabOrder = 1
    end
    object Button4: TButton
      Left = 200
      Top = 108
      Width = 123
      Height = 25
      Caption = 'Make Current Location'
      TabOrder = 2
      OnClick = Button4Click
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 385
    Width = 425
    Height = 60
    Caption = 'Translate'
    TabOrder = 2
    object Edit1: TEdit
      Left = 16
      Top = 24
      Width = 241
      Height = 21
      TabOrder = 0
      Text = '+49 (421) 12345678'
    end
    object Button5: TButton
      Left = 264
      Top = 22
      Width = 147
      Height = 25
      Caption = 'Translate Address'
      TabOrder = 1
      OnClick = Button5Click
    end
  end
  object hbTapiLine1: ThbTapiLine
    CallOptions.GatherDigits.TerminationDigits = '*#'
    CallParams.Flags = 0
    MediaModes = 4
    Options.ReplyTimeout = 10000
    OnTapiTranslateChange = hbTapiLine1TapiTranslateChange
    Left = 376
    Top = 64
  end
end
