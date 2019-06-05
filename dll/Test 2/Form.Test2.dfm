object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'DLL'
  ClientHeight = 532
  ClientWidth = 603
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 408
    Width = 603
    Height = 124
    Align = alBottom
    Caption = 'Panel1'
    TabOrder = 0
  end
  object Button1: TButton
    Left = 16
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Panel2: TPanel
    Left = 0
    Top = 284
    Width = 603
    Height = 124
    Align = alBottom
    Caption = 'Panel1'
    TabOrder = 2
  end
  object Button2: TButton
    Left = 128
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 3
    OnClick = Button2Click
  end
  object IBD: TIBDatabase
    DatabaseName = '172.16.10.17:e:/Datenbank/demo4.fdb'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    ServerType = 'IBServer'
    SQLDialect = 1
    TraceFlags = [tfQExecute, tfTransact]
    Left = 280
    Top = 80
  end
  object IBT: TIBTransaction
    DefaultDatabase = IBD
    Left = 392
    Top = 80
  end
end
