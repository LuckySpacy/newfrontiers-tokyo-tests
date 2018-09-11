object Form1: TForm1
  Left = 441
  Top = 311
  Width = 681
  Height = 403
  Caption = 'Digits - A hbTAPI sample'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    673
    376)
  PixelsPerInch = 96
  TextHeight = 13
  object ListBox1: TListBox
    Left = 8
    Top = 272
    Width = 657
    Height = 97
    Anchors = [akLeft, akTop, akBottom]
    ItemHeight = 13
    Items.Strings = (
      '<DblClick to clear list>')
    TabOrder = 0
    OnDblClick = ListBox1DblClick
  end
  object GroupBox_MonitorDigits: TGroupBox
    Left = 440
    Top = 6
    Width = 225
    Height = 83
    Caption = 'Monitor Digits'
    TabOrder = 1
    object Label11: TLabel
      Left = 16
      Top = 55
      Width = 59
      Height = 13
      Caption = 'Digit Modes:'
    end
    object CheckBox_MonitorDigits: TCheckBox
      Left = 18
      Top = 24
      Width = 86
      Height = 17
      Caption = 'Active'
      TabOrder = 0
      OnClick = DoMonitorDigits
    end
    object CheckBox_DTMF1: TCheckBox
      Left = 96
      Top = 53
      Width = 57
      Height = 17
      Caption = 'DTMF'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object CheckBox_Pulse1: TCheckBox
      Left = 160
      Top = 53
      Width = 57
      Height = 17
      Caption = 'Pulse'
      TabOrder = 2
    end
    object CheckBox3: TCheckBox
      Left = 88
      Top = 24
      Width = 97
      Height = 17
      Caption = 'AutoSelect'
      TabOrder = 3
      OnClick = CheckBox3Click
    end
  end
  object GroupBox_GatherDigits: TGroupBox
    Left = 440
    Top = 94
    Width = 225
    Height = 171
    Caption = 'Gather Digits'
    TabOrder = 2
    object Label4: TLabel
      Left = 16
      Top = 72
      Width = 51
      Height = 13
      Caption = 'NumDigits:'
    end
    object Label5: TLabel
      Left = 16
      Top = 96
      Width = 88
      Height = 13
      Caption = 'First Digit Dimeout:'
    end
    object Label6: TLabel
      Left = 16
      Top = 120
      Width = 89
      Height = 13
      Caption = 'Inter Digit Timeout:'
    end
    object Label7: TLabel
      Left = 16
      Top = 144
      Width = 87
      Height = 13
      Caption = 'Termination Digits:'
    end
    object Label8: TLabel
      Left = 192
      Top = 96
      Width = 13
      Height = 13
      Caption = 'ms'
    end
    object Label9: TLabel
      Left = 192
      Top = 120
      Width = 13
      Height = 13
      Caption = 'ms'
    end
    object Label10: TLabel
      Left = 16
      Top = 47
      Width = 59
      Height = 13
      Caption = 'Digit Modes:'
    end
    object CheckBox2: TCheckBox
      Left = 16
      Top = 23
      Width = 97
      Height = 17
      Caption = 'Active'
      TabOrder = 0
      OnClick = DoGatherDigits
    end
    object Edit3: TEdit
      Left = 120
      Top = 92
      Width = 65
      Height = 21
      TabOrder = 1
      Text = '5000'
    end
    object Edit4: TEdit
      Left = 120
      Top = 116
      Width = 65
      Height = 21
      TabOrder = 2
      Text = '5000'
    end
    object Edit2: TEdit
      Left = 120
      Top = 68
      Width = 65
      Height = 21
      TabOrder = 3
      Text = '3'
    end
    object Edit_Termdigits: TEdit
      Left = 120
      Top = 140
      Width = 65
      Height = 21
      TabOrder = 4
      Text = '*#'
    end
    object CheckBox_DTMF2: TCheckBox
      Left = 96
      Top = 45
      Width = 57
      Height = 17
      Caption = 'DTMF'
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
    object CheckBox_Pulse2: TCheckBox
      Left = 160
      Top = 45
      Width = 57
      Height = 17
      Caption = 'Pulse'
      TabOrder = 6
    end
  end
  object GroupBox_GenerateDigits: TGroupBox
    Left = 8
    Top = 144
    Width = 225
    Height = 121
    Caption = 'Generate Digits'
    TabOrder = 3
    object SpeedButton1: TSpeedButton
      Left = 16
      Top = 24
      Width = 23
      Height = 22
      Caption = '1'
      OnClick = DoGenearteDigit
    end
    object SpeedButton2: TSpeedButton
      Left = 40
      Top = 24
      Width = 23
      Height = 22
      Caption = '2'
      OnClick = DoGenearteDigit
    end
    object SpeedButton3: TSpeedButton
      Left = 64
      Top = 24
      Width = 23
      Height = 22
      Caption = '3'
      OnClick = DoGenearteDigit
    end
    object SpeedButton4: TSpeedButton
      Left = 16
      Top = 46
      Width = 23
      Height = 22
      Caption = '4'
      OnClick = DoGenearteDigit
    end
    object SpeedButton5: TSpeedButton
      Left = 40
      Top = 46
      Width = 23
      Height = 22
      Caption = '5'
      OnClick = DoGenearteDigit
    end
    object SpeedButton6: TSpeedButton
      Left = 64
      Top = 46
      Width = 23
      Height = 22
      Caption = '6'
      OnClick = DoGenearteDigit
    end
    object SpeedButton7: TSpeedButton
      Left = 16
      Top = 68
      Width = 23
      Height = 22
      Caption = '7'
      OnClick = DoGenearteDigit
    end
    object SpeedButton8: TSpeedButton
      Left = 40
      Top = 68
      Width = 23
      Height = 22
      Caption = '8'
      OnClick = DoGenearteDigit
    end
    object SpeedButton9: TSpeedButton
      Left = 64
      Top = 68
      Width = 23
      Height = 22
      Caption = '9'
      OnClick = DoGenearteDigit
    end
    object SpeedButton10: TSpeedButton
      Left = 96
      Top = 24
      Width = 23
      Height = 22
      Caption = 'A'
      OnClick = DoGenearteDigit
    end
    object SpeedButton11: TSpeedButton
      Left = 96
      Top = 68
      Width = 23
      Height = 22
      Caption = 'C'
      OnClick = DoGenearteDigit
    end
    object SpeedButton12: TSpeedButton
      Left = 96
      Top = 46
      Width = 23
      Height = 22
      Caption = 'B'
      OnClick = DoGenearteDigit
    end
    object SpeedButton16: TSpeedButton
      Left = 16
      Top = 90
      Width = 23
      Height = 22
      Caption = '*'
      OnClick = DoGenearteDigit
    end
    object SpeedButton17: TSpeedButton
      Left = 40
      Top = 90
      Width = 23
      Height = 22
      Caption = '0'
      OnClick = DoGenearteDigit
    end
    object SpeedButton18: TSpeedButton
      Left = 64
      Top = 90
      Width = 23
      Height = 22
      Caption = '#'
      OnClick = DoGenearteDigit
    end
    object SpeedButton19: TSpeedButton
      Left = 96
      Top = 90
      Width = 23
      Height = 22
      Caption = 'D'
      OnClick = DoGenearteDigit
    end
    object RadioButton_DTMF: TRadioButton
      Left = 128
      Top = 24
      Width = 67
      Height = 17
      Caption = 'DTMF'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object RadioButton_Pulse: TRadioButton
      Left = 128
      Top = 48
      Width = 67
      Height = 17
      Caption = 'Pulse'
      TabOrder = 1
    end
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 7
    Width = 425
    Height = 66
    Caption = '1. Select a Line Device'
    TabOrder = 4
    object LabelDevice: TLabel
      Left = 8
      Top = 21
      Width = 37
      Height = 13
      Caption = 'Device:'
    end
    object Label1: TLabel
      Left = 88
      Top = 45
      Width = 3
      Height = 13
    end
    object Label3: TLabel
      Left = 8
      Top = 45
      Width = 33
      Height = 13
      Caption = 'Status:'
    end
    object ComboBoxDevice: TComboBox
      Left = 88
      Top = 17
      Width = 322
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = ComboBoxDeviceChange
    end
  end
  object GroupBox_GenerateTone: TGroupBox
    Left = 240
    Top = 191
    Width = 193
    Height = 74
    Caption = 'Generate Tone'
    TabOrder = 5
    object Button_Beep: TButton
      Left = 11
      Top = 21
      Width = 75
      Height = 22
      Caption = 'Beep'
      TabOrder = 0
      OnClick = Button_BeepClick
    end
    object Button3: TButton
      Tag = 2
      Left = 11
      Top = 44
      Width = 75
      Height = 22
      Caption = 'Billing'
      TabOrder = 1
      OnClick = Button_BeepClick
    end
    object Button2: TButton
      Tag = 1
      Left = 91
      Top = 21
      Width = 75
      Height = 22
      Caption = 'Busy'
      TabOrder = 2
      OnClick = Button_BeepClick
    end
    object Button_Ringback: TButton
      Tag = 3
      Left = 91
      Top = 44
      Width = 75
      Height = 22
      Caption = 'Ringback'
      TabOrder = 3
      OnClick = Button_BeepClick
    end
  end
  object GroupBox5: TGroupBox
    Left = 7
    Top = 80
    Width = 226
    Height = 51
    Caption = '2. Make a Call'
    TabOrder = 6
    object Label2: TLabel
      Left = 8
      Top = 24
      Width = 48
      Height = 13
      Caption = 'PhoneNo:'
    end
    object Edit1: TEdit
      Left = 66
      Top = 20
      Width = 73
      Height = 21
      TabOrder = 0
      Text = '1234'
    end
    object Button1: TButton
      Left = 143
      Top = 18
      Width = 75
      Height = 25
      Caption = 'MakeCall'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object GroupBox_MonitorSilence: TGroupBox
    Left = 240
    Top = 80
    Width = 193
    Height = 97
    Caption = 'Monitor Silence'
    TabOrder = 7
    object Label12: TLabel
      Left = 8
      Top = 44
      Width = 81
      Height = 13
      Caption = 'Silence Duration:'
    end
    object Label13: TLabel
      Left = 172
      Top = 45
      Width = 13
      Height = 13
      Caption = 'ms'
    end
    object CheckBox_MonitorSilence: TCheckBox
      Left = 14
      Top = 20
      Width = 86
      Height = 17
      Caption = 'Active'
      TabOrder = 0
      OnClick = DoMonitorSilence
    end
    object Edit_SilenceDuration: TEdit
      Left = 101
      Top = 40
      Width = 65
      Height = 21
      TabOrder = 1
      Text = '5000'
    end
  end
  object hbTapiLine1: ThbTapiLine
    CallOptions.GatherDigits.TerminationDigits = '*#'
    CallParams.Flags = 0
    Options.ReplyTimeout = 10000
    OnConnected = hbTapiLine1Connected
    OnOffering = hbTapiLine1Offering
    OnDigit = hbTapiLine1Digit
    OnDigits = hbTapiLine1GatherDigits
    Left = 304
    Top = 312
  end
end
