object Form1: TForm1
  Left = 285
  Top = 107
  Width = 523
  Height = 512
  Caption = 'DeviceInfo - A hbTapi Sample'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  DesignSize = (
    515
    485)
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 9
    Top = 71
    Width = 497
    Height = 404
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object RadioGroupType: TRadioGroup
    Left = 9
    Top = 8
    Width = 497
    Height = 49
    Caption = ' Device Type '
    Columns = 4
    Items.Strings = (
      'All'
      'Data'
      'Fax'
      'Voice')
    TabOrder = 1
    OnClick = RadioGroupTypeClick
  end
  object hbTapiLine1: ThbTapiLine
    CallParams.Flags = 0
    MediaModes = 4
    Options.ReplyTimeout = 10000
    Privileges.Monitor = False
    Privileges.None = True
    Privileges.Owner = False
    Left = 200
    Top = 128
  end
  object TapiPhone1: ThbTapiPhone
    Options.ReplyTimeout = 10000
    Privileges.Monitor = True
    Privileges.Owner = False
    Left = 232
    Top = 128
  end
end
