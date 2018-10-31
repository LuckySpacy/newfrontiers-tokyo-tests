object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 492
  ClientWidth = 512
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pdf: TgtPDFViewer
    Left = 376
    Top = 360
    Width = 136
    Height = 132
    Cursor = 1
    Color = clGray
    DockOrientation = doNoOrient
    ParentColor = False
    TabOrder = 0
    TabStop = True
    About = 'Gnostice PDFtoolkit (www.gnostice.com)'
    Status = 'PDF Viewer loaded Successfully.'
    SearchHighlightColor = clGray
    Version = '5.0.0.710'
    ViewerMode = vmHand
    AllowImageCopy = False
    SelectedRegionColor = clSkyBlue
    HighlightRegionColor = clYellow
    HighlightRegionShape = stRectangle
    BackgroundRendering = False
    Caching.Enabled = True
    Caching.DocumentCount = 10
    HighlightFormFields = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 512
    Height = 41
    Align = alTop
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 1
    object Button1: TButton
      Left = 16
      Top = 10
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
    Width = 233
    Height = 437
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    TabOrder = 2
  end
  object PDFDoc: TgtPDFDocument
    About = 'Gnostice PDFtoolkit (www.gnostice.com)'
    Version = '5.0.0.710'
    OpenAfterSave = False
    MergeOptions = []
    EMailAfterSave = False
    ShowSetupDialog = False
    Left = 384
    Top = 160
  end
  object PDFPrinterx: TgtPDFPrinter
    Collate = True
    Options = [poPageNums]
    About = 'Gnostice PDFtoolkit (www.gnostice.com)'
    Version = '5.0.0.710'
    AutoRotate = False
    IgnoreHardMargin = True
    RenderingOptions = []
    Left = 376
    Top = 217
  end
end
