object fra_Sendungsverfolgung: Tfra_Sendungsverfolgung
  Left = 0
  Top = 0
  Width = 476
  Height = 337
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 476
    Height = 41
    Align = alTop
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 0
    ExplicitLeft = 24
    ExplicitTop = 16
    ExplicitWidth = 185
    object Button1: TButton
      Left = 24
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object Memo1: TMemo
    Left = 0
    Top = 41
    Width = 476
    Height = 296
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    TabOrder = 1
    ExplicitLeft = 40
    ExplicitTop = 112
    ExplicitWidth = 185
    ExplicitHeight = 89
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
    Request.BasicAuthentication = True
    Request.Password = 'pass'
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Username = '2222222222_01'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 224
    Top = 24
  end
end
