object frm_Paketversand: Tfrm_Paketversand
  Left = 0
  Top = 0
  Caption = 'Paketversand'
  ClientHeight = 590
  ClientWidth = 1402
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 65
    Width = 1402
    Height = 525
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
    ExplicitLeft = -8
    ExplicitTop = 63
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1402
    Height = 65
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 1
    ExplicitWidth = 888
    object Button1: TButton
      Left = 24
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 160
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Button2'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 328
      Top = 24
      Width = 75
      Height = 25
      Caption = 'getManifest'
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 440
      Top = 32
      Width = 75
      Height = 25
      Caption = 'getVersion'
      TabOrder = 3
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 568
      Top = 24
      Width = 75
      Height = 25
      Caption = 'DHLTest'
      TabOrder = 4
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 688
      Top = 24
      Width = 155
      Height = 25
      Caption = 'createShipmentOrderV01PAK'
      TabOrder = 5
      OnClick = Button6Click
    end
    object Button7: TButton
      Left = 864
      Top = 21
      Width = 155
      Height = 25
      Caption = 'createShipmentOrderV01PAK'
      TabOrder = 6
      OnClick = Button7Click
    end
    object Button8: TButton
      Left = 1048
      Top = 21
      Width = 155
      Height = 25
      Caption = 'createShipmentOrderV01PAK'
      TabOrder = 7
      OnClick = Button8Click
    end
    object Button9: TButton
      Left = 1209
      Top = 21
      Width = 96
      Height = 25
      Caption = 'dhltest1'
      TabOrder = 8
      OnClick = Button9Click
    end
  end
  object IdHTTP: TIdHTTP
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
    Left = 360
    Top = 72
  end
  object IdIOHandlerStream1: TIdIOHandlerStream
    MaxLineAction = maException
    Port = 0
    FreeStreams = False
    Left = 544
    Top = 160
  end
  object HTTPRIO1: THTTPRIO
    OnBeforeExecute = HTTPRIO1BeforeExecute
    HTTPWebNode.UseUTF8InHeader = True
    HTTPWebNode.InvokeOptions = [soIgnoreInvalidCerts, soAutoCheckAccessPointViaUDDI]
    HTTPWebNode.WebNodeOptions = []
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 984
    Top = 256
  end
end
