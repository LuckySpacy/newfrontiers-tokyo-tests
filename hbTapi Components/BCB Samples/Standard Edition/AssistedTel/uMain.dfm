object Form1: TForm1
  Left = 192
  Top = 107
  Caption = 'AssistTel - A hbTapi Sample'
  ClientHeight = 193
  ClientWidth = 575
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
  object Button1: TButton
    Left = 408
    Top = 8
    Width = 161
    Height = 25
    Caption = 'Enable RequestMakeCall'
    TabOrder = 0
    OnClick = Button1Click
  end
  object ListBox1: TListBox
    Left = 8
    Top = 8
    Width = 393
    Height = 177
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ItemHeight = 14
    ParentFont = False
    TabOrder = 1
  end
  object Button2: TButton
    Left = 408
    Top = 40
    Width = 161
    Height = 25
    Caption = 'Disable RequestMakeCall'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 408
    Top = 72
    Width = 161
    Height = 25
    Caption = 'Register Application'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 408
    Top = 104
    Width = 161
    Height = 25
    Caption = 'Unregister Application'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 408
    Top = 160
    Width = 161
    Height = 25
    Caption = 'Clear'
    TabOrder = 5
    OnClick = Button5Click
  end
end
