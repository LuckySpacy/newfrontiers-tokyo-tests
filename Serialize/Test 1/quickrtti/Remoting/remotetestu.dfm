object Form1: TForm1
  Left = 192
  Top = 107
  Width = 303
  Height = 116
  Caption = 'Test QuickRTTI over HTTP'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 262
    Height = 13
    Caption = 'This is NOT SOAP, this is a homebrew service protocol.'
  end
  object lblTime: TLabel
    Left = 40
    Top = 56
    Width = 201
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Time Goes Here'
  end
  object lblCount: TLabel
    Left = 88
    Top = 32
    Width = 6
    Height = 13
    Caption = '0'
  end
  object Button1: TButton
    Left = 8
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 208
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Test Client'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Server: TIdHTTPServer
    Bindings = <>
    ThreadMgr = IdThreadMgrPool1
    OnCommandGet = ServerCommandGet
    Left = 24
    Top = 48
  end
  object IdThreadMgrPool1: TIdThreadMgrPool
    PoolSize = 20
    Left = 64
    Top = 48
  end
end
