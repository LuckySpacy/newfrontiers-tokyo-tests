object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 40
    Top = 24
    Width = 75
    Height = 25
    Caption = 'test'
    TabOrder = 0
    OnClick = Button1Click
  end
  object cbx_Passiv: TCheckBox
    Left = 152
    Top = 28
    Width = 97
    Height = 17
    Caption = 'Passiv'
    TabOrder = 1
  end
  object ftp: TIdFTP
    IPVersion = Id_IPv4
    Host = 'kundenserver.asis.net'
    Passive = True
    ConnectTimeout = 0
    Password = '#kNedp?=JMjqQqR6!s.&%r~3E6-m;@'
    Username = 'ynotgmbhftp'
    NATKeepAlive.UseKeepAlive = False
    NATKeepAlive.IdleTimeMS = 0
    NATKeepAlive.IntervalMS = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 168
    Top = 152
  end
end
