object Form1: TForm1
  Left = 299
  Top = 107
  Width = 369
  Height = 318
  Caption = 'FaxHandoff - A hbTapi Sample'
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
  object LabelApplication: TLabel
    Left = 8
    Top = 43
    Width = 52
    Height = 13
    Caption = 'Application'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object CheckBoxActive: TCheckBox
    Left = 8
    Top = 12
    Width = 57
    Height = 17
    Caption = 'Active'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = CheckBoxActiveClick
  end
  object ComboBoxDevice: TComboBox
    Left = 76
    Top = 10
    Width = 272
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    Text = 'ComboBoxDevice'
    OnChange = ComboBoxDeviceChange
  end
  object EditApplication: TEdit
    Left = 76
    Top = 41
    Width = 109
    Height = 21
    TabOrder = 2
    Text = 'awfxex32.exe'
  end
  object ButtonAnswer: TButton
    Left = 192
    Top = 41
    Width = 75
    Height = 21
    Caption = 'Answer'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = ButtonAnswerClick
  end
  object ButtonHangup: TButton
    Left = 272
    Top = 41
    Width = 75
    Height = 21
    Caption = 'Hang up'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = ButtonHangupClick
  end
  object ListBox1: TListBox
    Left = 8
    Top = 72
    Width = 345
    Height = 209
    ItemHeight = 13
    TabOrder = 5
  end
  object hbTapiLine1: ThbTapiLine
    CallOptions.GatherDigits.TerminationDigits = '*#'
    CallParams.Flags = 0
    MediaModes = 4
    Options.ReplyTimeout = 10000
    OnCallState = hbTapiLine1CallState
    OnConnected = hbTapiLine1Connected
    OnMediaMode = hbTapiLine1MediaMode
    Left = 192
    Top = 152
  end
end
