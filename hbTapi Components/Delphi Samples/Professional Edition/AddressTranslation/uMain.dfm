object Form1: TForm1
  Left = 300
  Top = 200
  BorderStyle = bsDialog
  Caption = 'AddressTranslation - A hbTapi Sample'
  ClientHeight = 185
  ClientWidth = 300
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
  object ComboBoxDevice: TComboBox
    Left = 8
    Top = 24
    Width = 285
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnChange = ComboBoxDeviceChange
  end
  object ComboBoxPhoneNo: TComboBox
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
  object ButtonTranslateDlg: TButton
    Left = 48
    Top = 151
    Width = 120
    Height = 25
    Caption = 'TranslateDialog'
    TabOrder = 2
    OnClick = ButtonTranslateDlgClick
  end
  object ButtonTranslateAddress: TButton
    Left = 173
    Top = 151
    Width = 120
    Height = 25
    Caption = 'TranslateAddress'
    TabOrder = 3
    OnClick = ButtonTranslateAddressClick
  end
  object ComboBoxOptions: TComboBox
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
    CallParams.Flags = 0
    MediaModes = 4
    Options.ReplyTimeout = 10000
    Left = 136
    Top = 64
  end
end
