object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 454
  ClientWidth = 807
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    807
    454)
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 320
    Top = 64
    Width = 233
    Height = 257
  end
  object Edit1: TEdit
    Left = 8
    Top = 16
    Width = 791
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Text = 'Edit1'
    ExplicitWidth = 851
  end
  object Check: TButton
    Left = 8
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Check'
    TabOrder = 1
    OnClick = CheckClick
  end
  object Button1: TButton
    Left = 8
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Check FTP'
    TabOrder = 2
    OnClick = Button1Click
  end
  object http: TIdHTTP
    IOHandler = IdSSLIOHandlerSocketOpenSSL1
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 208
    Top = 80
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 80
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 456
    Top = 176
  end
  object ftp: TIdFTP
    IPVersion = Id_IPv4
    ConnectTimeout = 0
    NATKeepAlive.UseKeepAlive = False
    NATKeepAlive.IdleTimeMS = 0
    NATKeepAlive.IntervalMS = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 224
    Top = 160
  end
end
