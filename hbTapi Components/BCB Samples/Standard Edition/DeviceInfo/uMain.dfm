object Form1: TForm1
  Left = 190
  Top = 106
  Width = 451
  Height = 381
  Caption = 'DeviceInfo - A hbTapi Sample'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 48
    Width = 443
    Height = 306
    Align = alBottom
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
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 425
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Detect Device Capablillities'
    TabOrder = 1
    OnClick = Button1Click
  end
  object hbTapiLine1: ThbTapiLine
    CallOptions.GatherDigits.TerminationDigits = '*#'
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
