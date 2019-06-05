object Form1: TForm1
  Left = 192
  Top = 107
  Width = 258
  Height = 77
  Caption = 'News-Story Server'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 96
    Top = 16
    Width = 19
    Height = 13
    Caption = 'Port'
  end
  object Button1: TButton
    Left = 8
    Top = 10
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 0
    OnClick = Button1Click
  end
  object txtPort: TEdit
    Left = 128
    Top = 12
    Width = 73
    Height = 21
    TabOrder = 1
    Text = '80'
  end
  object Server: TIdHTTPServer
    Bindings = <>
    OnCommandGet = ServerCommandGet
    Left = 8
    Top = 8
  end
  object DB: TIBDatabase
    DatabaseName = 'News.gdb'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 168
    Top = 8
  end
end
