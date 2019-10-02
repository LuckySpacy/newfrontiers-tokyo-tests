object Form17: TForm17
  Left = 0
  Top = 0
  Caption = 'Form17'
  ClientHeight = 301
  ClientWidth = 665
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
    Left = 32
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 113
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 32
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 113
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 3
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 32
    Top = 111
    Width = 75
    Height = 25
    Caption = 'Test'
    TabOrder = 4
    OnClick = Button5Click
  end
  object Memo1: TMemo
    Left = 312
    Top = 34
    Width = 313
    Height = 215
    Lines.Strings = (
      #39'^XA'#39'#$D#$A'#39'^CI27'#39'#$D#$A'#39'^PQ1'#39'#$D#$A'#39'^FWR'#39'#$D#'
      '$A#$D#$A'#39'^FO70,150^GB300,640,2^FS'#39'#$D#'
      '$A'#39'^FO12,150^GB2,640,2^FS'#39'#$D#$A#$D#'
      '$A'#39'^FO24,150^A0,16^FB640,1,0,C,0^FDFon +49-(0)6162-'
      '809840 - Fax +49-(0)6162-8098420 - info@anamed-'
      'gele.com^FS'#39'#$D#'
      '$A'#39'^FO44,150^A0,16^FB640,1,0,C,0^FDanamed '
      'Elektrophorese GmbH - Ringstrasse 4 - 64401 Gross-'
      'Bieberau^FS'#39'#$D#$A#$D#$A'#39'^FO80,166^A0,16^FDCharge '
      '/ Lot: 0000000815^FS'#39'#$D#$A'#39'^FO80,358^A0,16^FDMHD / '
      'Exp. date: 14.08.2015^FS'#39'#$D#'
      '$A'#39'^FO80,580^A0,16^FDLagerung / Storage: ^FS'#39'#$D#'
      '$A#$D#$A#$D#'
      '$A'#39'^FO96,166^A0,28^FB608,3,0,C,0^FD^FS'#39'#$D#$A#'
      '$D#'
      '$A'#39'^FO184,166^A0,36^FB608,3,0,C,0^FDAmmoniumsulfat^'
      'FS'#39'#$D#$A'#39'^FO320,166^A0,24^FB608,1,0,C,0^FDArt-Nr: '
      'RO-A106^FS'#39'#$D#$A#$D#$A'#39'^FWN'#39'#$D#$A#$D#'
      '$A'#39'^BY2'#39'#$D#$A'#39'^FO52,62^B3,,60,N,N,N^FDRO-'
      'A106^FS'#39'#$D#$A'#39'^BY3'#39'#$D#'
      '$A'#39'^FO48,806^BE,60,N,N^FD0000000815^FS'#39'#$D#$A#'
      '$D#$A#$D#$A'#39'^XZ'#39)
    TabOrder = 5
  end
  object edt_IP: TEdit
    Left = 32
    Top = 228
    Width = 121
    Height = 21
    TabOrder = 6
    Text = '192.168.233.119'
  end
  object IdTCPClient1: TIdTCPClient
    ConnectTimeout = 0
    IPVersion = Id_IPv4
    Port = 0
    ReadTimeout = -1
    Left = 216
    Top = 176
  end
  object IdFTP1: TIdFTP
    IPVersion = Id_IPv4
    Host = '192.168.233.119'
    ConnectTimeout = 0
    DataPort = 9100
    NATKeepAlive.UseKeepAlive = False
    NATKeepAlive.IdleTimeMS = 0
    NATKeepAlive.IntervalMS = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 120
    Top = 152
  end
  object IdIOHandlerStream1: TIdIOHandlerStream
    MaxLineAction = maException
    Port = 0
    FreeStreams = False
    Left = 264
    Top = 128
  end
end
