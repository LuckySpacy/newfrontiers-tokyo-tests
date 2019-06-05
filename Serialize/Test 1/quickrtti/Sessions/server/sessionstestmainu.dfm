object Form1: TForm1
  Left = 192
  Top = 107
  Width = 231
  Height = 69
  Caption = 'Session Services - Stand Alone'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 72
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Server: TIdHTTPServer
    Bindings = <>
    DefaultPort = 8023
    ThreadMgr = IdThreadMgrPool1
    OnCommandGet = ServerCommandGet
    Left = 8
    Top = 8
  end
  object IdThreadMgrPool1: TIdThreadMgrPool
    PoolSize = 20
    Left = 40
    Top = 8
  end
end
