object Form1: TForm1
  Left = 192
  Top = 107
  Width = 309
  Height = 210
  Caption = 'AddressTranslation - A hbTapi Sample'
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
  object Label1: TLabel
    Left = 8
    Top = 103
    Width = 39
    Height = 13
    Caption = 'Options:'
  end
  object Label2: TLabel
    Left = 8
    Top = 53
    Width = 74
    Height = 13
    Caption = 'Phone Number:'
  end
  object Label3: TLabel
    Left = 8
    Top = 8
    Width = 37
    Height = 13
    Caption = 'Device:'
  end
  object ComboBox_Device: TComboBox
    Left = 8
    Top = 24
    Width = 285
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnChange = ComboBox_DeviceChange
  end
  object ComboBox_PhoneNo: TComboBox
    Left = 8
    Top = 69
    Width = 285
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    Text = '1234'
    Items.Strings = (
      '1234'
      '+49 (421) 457 1234')
  end
  object Button_TranslateDialog: TButton
    Left = 48
    Top = 151
    Width = 120
    Height = 25
    Caption = 'TranslateDialog'
    TabOrder = 2
    OnClick = Button_TranslateDialogClick
  end
  object Button_TranslateAddress: TButton
    Left = 173
    Top = 151
    Width = 120
    Height = 25
    Caption = 'TranslateAddress'
    TabOrder = 3
    OnClick = Button_TranslateAddressClick
  end
  object ComboBox_Options: TComboBox
    Left = 8
    Top = 119
    Width = 285
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 4
    Items.Strings = (
      '- None -'
      'LINETRANSLATEOPTION_CARDOVERRIDE'
      'LINETRANSLATEOPTION_CANCELCALLWAITING'
      'LINETRANSLATEOPTION_FORCELOCAL'
      'LINETRANSLATEOPTION_FORCELD')
  end
  object hbTapiLine1: ThbTapiLine
    CallOptions.GatherDigits.TerminationDigits = '*#'
    CallParams.Flags = 0
    MediaModes = 4
    Options.ReplyTimeout = 10000
    Left = 128
    Top = 48
  end
end
