object frmFR: TfrmFR
  Left = 171
  Top = 193
  Caption = 'Gnostice XtremeDocumentStudio FastReport Export'
  ClientHeight = 74
  ClientWidth = 524
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 24
    Width = 233
    Height = 33
    Caption = 'Export From Preview'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 272
    Top = 24
    Width = 233
    Height = 33
    Caption = 'Export  Programmatically'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button2Click
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Prepared Report(*.fp3)|*.fp3|Report(*.fr3)|*.fr3'
    Title = 'Select FastReport File Name'
    Left = 152
    Top = 240
  end
  object SaveDialog1: TSaveDialog
    InitialDir = 's'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Title = 'Select Output File Name'
    Left = 184
    Top = 240
  end
  object frxReport1: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42130.691582465300000000
    ReportOptions.LastChange = 42136.636149687500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 48
    Top = 232
    Datasets = <>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object Memo1: TfrxMemoView
        Left = 294.803340000000000000
        Top = 22.677180000000000000
        Width = 136.063080000000000000
        Height = 41.574830000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -27
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Memo.UTF8W = (
          'Customers')
        ParentFont = False
      end
      object Memo2: TfrxMemoView
        Left = 18.897637800000000000
        Top = 94.488188980000000000
        Width = 71.811070000000000000
        Height = 30.236220472440900000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Memo.UTF8W = (
          'Name')
        ParentFont = False
      end
      object Memo3: TfrxMemoView
        Left = 207.874015750000000000
        Top = 94.488188980000000000
        Width = 94.488250000000000000
        Height = 30.236227800000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Memo.UTF8W = (
          'City')
        ParentFont = False
      end
      object Memo4: TfrxMemoView
        Left = 396.850393700000000000
        Top = 94.488188980000000000
        Width = 94.488250000000000000
        Height = 30.236220472440900000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Memo.UTF8W = (
          'State')
        ParentFont = False
      end
      object Memo5: TfrxMemoView
        Left = 585.826771650000000000
        Top = 94.488188980000000000
        Width = 143.622140000000000000
        Height = 30.236220472440900000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Memo.UTF8W = (
          'Phone Number')
        ParentFont = False
      end
      object Memo6: TfrxMemoView
        Left = 18.897637800000000000
        Top = 151.181102362205000000
        Width = 64.252010000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.UTF8W = (
          'Jennifer')
        ParentFont = False
      end
      object Memo7: TfrxMemoView
        Left = 18.897637800000000000
        Top = 226.771653543307000000
        Width = 64.252010000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.UTF8W = (
          'Arthur')
        ParentFont = False
      end
      object Memo8: TfrxMemoView
        Left = 18.897637800000000000
        Top = 302.362204724409000000
        Width = 64.252010000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.UTF8W = (
          'Debra')
        ParentFont = False
      end
      object Memo9: TfrxMemoView
        Left = 18.897637800000000000
        Top = 377.952755905512000000
        Width = 75.590600000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.UTF8W = (
          'Dave')
        ParentFont = False
      end
      object Memo10: TfrxMemoView
        Left = 18.897637800000000000
        Top = 453.543307086614000000
        Width = 94.488250000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.UTF8W = (
          'Cindy')
        ParentFont = False
      end
      object Memo11: TfrxMemoView
        Left = 207.874015750000000000
        Top = 151.181102362205000000
        Width = 86.929190000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.UTF8W = (
          'Wellesley')
        ParentFont = False
      end
      object Memo12: TfrxMemoView
        Left = 207.874015750000000000
        Top = 226.771653543307000000
        Width = 86.929190000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.UTF8W = (
          'Los Altos')
        ParentFont = False
      end
      object Memo13: TfrxMemoView
        Left = 207.874015750000000000
        Top = 377.952755905512000000
        Width = 86.929190000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.UTF8W = (
          'Los Altos')
        ParentFont = False
      end
      object Memo14: TfrxMemoView
        Left = 207.874015750000000000
        Top = 453.543307086614000000
        Width = 86.929190000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.UTF8W = (
          'Los Altos')
        ParentFont = False
      end
      object Memo15: TfrxMemoView
        Left = 207.874015750000000000
        Top = 302.362204724409000000
        Width = 86.929190000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.UTF8W = (
          'Atherton')
        ParentFont = False
      end
      object Memo16: TfrxMemoView
        Left = 396.850393700000000000
        Top = 151.181102362205000000
        Width = 86.929190000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.UTF8W = (
          'MA')
        ParentFont = False
      end
      object Memo17: TfrxMemoView
        Left = 396.850393700000000000
        Top = 226.771653543307000000
        Width = 86.929190000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.UTF8W = (
          'CA')
        ParentFont = False
      end
      object Memo18: TfrxMemoView
        Left = 396.850393700000000000
        Top = 302.362204724409000000
        Width = 86.929190000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.UTF8W = (
          'CA')
        ParentFont = False
      end
      object Memo19: TfrxMemoView
        Left = 396.850393700000000000
        Top = 377.952755905512000000
        Width = 86.929190000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.UTF8W = (
          'CA')
        ParentFont = False
      end
      object Memo20: TfrxMemoView
        Left = 396.850393700000000000
        Top = 453.543307086614000000
        Width = 86.929190000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.UTF8W = (
          'CA')
        ParentFont = False
      end
      object Memo21: TfrxMemoView
        Left = 585.826771650000000000
        Top = 151.181102362205000000
        Width = 113.385900000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.UTF8W = (
          '516-292-3945')
        ParentFont = False
      end
      object Memo22: TfrxMemoView
        Left = 585.826771650000000000
        Top = 226.771653543307000000
        Width = 113.385900000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.UTF8W = (
          '415-941-4321')
        ParentFont = False
      end
      object Memo23: TfrxMemoView
        Left = 585.826771650000000000
        Top = 302.362204724409000000
        Width = 113.385900000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.UTF8W = (
          '916-213-2234')
        ParentFont = False
      end
      object Memo24: TfrxMemoView
        Left = 585.826771650000000000
        Top = 377.952755905512000000
        Width = 113.385900000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.UTF8W = (
          '415-948-9998')
        ParentFont = False
      end
      object Memo25: TfrxMemoView
        Left = 585.826771650000000000
        Top = 453.543307086614000000
        Width = 113.385900000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.UTF8W = (
          '415-948-6547')
        ParentFont = False
      end
    end
  end
  object gtFRExportInterface1: TgtFRExportInterface
    DoBeginDoc = True
    DoEndDoc = True
    Left = 8
    Top = 264
  end
  object gtPDFEngine1: TgtPDFEngine
    FileExtension = 'pdf'
    FileDescription = 'Adobe PDF Files'
    InputXRes = 96
    InputYRes = 96
    ReferencePoint = rpBand
    EMailSettings.AuthenticationRequired = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ImageSettings.SourceDPI = 96
    ImageSettings.OutputImageFormat = ifJPEG
    Page.Width = 8.267700000000000000
    Page.Height = 11.692900000000000000
    Page.BinNumber = 0
    FontEncoding = feWinAnsiEncoding
    DigitalSignature.FieldProperties.Visible = True
    DigitalSignature.FieldProperties.PageNumber = 1
    DigitalSignature.FieldProperties.FieldAppearenceOptions = [sfaoShowName, sfaoShowReason, sfaoShowLocation, sfaoShowDate, sfaoShowLabels]
    DigitalSignature.SignatureProperties.DateTime = 42535.718048078710000000
    PDFVersion = PDF_VER14
    Left = 328
    Top = 264
  end
  object gtRTFEngine1: TgtRTFEngine
    FileExtension = 'rtf'
    FileDescription = 'Rich Text Format'
    InputXRes = 96
    InputYRes = 96
    ReferencePoint = rpBand
    EMailSettings.AuthenticationRequired = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ImageSettings.SourceDPI = 96
    ImageSettings.OutputImageFormat = ifJPEG
    Page.Width = 8.267700000000000000
    Page.Height = 11.692900000000000000
    Page.BinNumber = 0
    Preferences.GraphicDataInBinary = False
    DocumentEncodingType = etPositionalAccuracy
    Left = 368
    Top = 264
  end
  object gtRTFEngine2: TgtRTFEngine
    FileExtension = 'rtf'
    FileDescription = 'Rich Text Format'
    InputXRes = 96
    InputYRes = 96
    ReferencePoint = rpBand
    EMailSettings.AuthenticationRequired = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ImageSettings.SourceDPI = 96
    ImageSettings.OutputImageFormat = ifJPEG
    Page.Width = 8.267700000000000000
    Page.Height = 11.692900000000000000
    Page.BinNumber = 0
    Preferences.GraphicDataInBinary = False
    DocumentEncodingType = etPositionalAccuracy
    Left = 62
    Top = 268
  end
  object gtHTMLEngine1: TgtHTMLEngine
    FileExtension = 'htm'
    FileDescription = 'HyperText Markup Language'
    InputXRes = 96
    InputYRes = 96
    ReferencePoint = rpBand
    EMailSettings.AuthenticationRequired = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ImageSettings.SourceDPI = 96
    ImageSettings.OutputImageFormat = ifBMP
    Page.Width = 8.267700000000000000
    Page.Height = 11.692900000000000000
    Page.BinNumber = 0
    Preferences.AutoScroll = False
    Preferences.OptimizeForIE = False
    Navigator.LinkFont.Charset = DEFAULT_CHARSET
    Navigator.LinkFont.Color = clBlue
    Navigator.LinkFont.Height = -27
    Navigator.LinkFont.Name = 'Wingdings'
    Navigator.LinkFont.Style = []
    TransparentBackground = True
    TOCPageSettings.ItemFont.Charset = DEFAULT_CHARSET
    TOCPageSettings.ItemFont.Color = clWindowText
    TOCPageSettings.ItemFont.Height = -11
    TOCPageSettings.ItemFont.Name = 'MS Sans Serif'
    TOCPageSettings.ItemFont.Style = []
    TOCPageSettings.TitleFont.Charset = DEFAULT_CHARSET
    TOCPageSettings.TitleFont.Color = clWindowText
    TOCPageSettings.TitleFont.Height = -11
    TOCPageSettings.TitleFont.Name = 'MS Sans Serif'
    TOCPageSettings.TitleFont.Style = []
    TOCPageSettings.Title = 'Table Of Contents'
    Left = 91
    Top = 268
  end
  object gtXHTMLEngine1: TgtXHTMLEngine
    FileExtension = 'htm'
    FileDescription = 'Extended HyperText Markup Language'
    InputXRes = 96
    InputYRes = 96
    ReferencePoint = rpBand
    EMailSettings.AuthenticationRequired = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ImageSettings.SourceDPI = 96
    ImageSettings.OutputImageFormat = ifBMP
    Page.Width = 8.267700000000000000
    Page.Height = 11.692900000000000000
    Page.BinNumber = 0
    Preferences.AutoScroll = False
    Preferences.OptimizeForIE = False
    Navigator.LinkFont.Charset = DEFAULT_CHARSET
    Navigator.LinkFont.Color = clBlue
    Navigator.LinkFont.Height = -27
    Navigator.LinkFont.Name = 'Wingdings'
    Navigator.LinkFont.Style = []
    TransparentBackground = True
    TOCPageSettings.ItemFont.Charset = DEFAULT_CHARSET
    TOCPageSettings.ItemFont.Color = clWindowText
    TOCPageSettings.ItemFont.Height = -11
    TOCPageSettings.ItemFont.Name = 'MS Sans Serif'
    TOCPageSettings.ItemFont.Style = []
    TOCPageSettings.TitleFont.Charset = DEFAULT_CHARSET
    TOCPageSettings.TitleFont.Color = clWindowText
    TOCPageSettings.TitleFont.Height = -11
    TOCPageSettings.TitleFont.Name = 'MS Sans Serif'
    TOCPageSettings.TitleFont.Style = []
    TOCPageSettings.Title = 'Table Of Contents'
    Left = 120
    Top = 268
  end
  object gtExcelEngine1: TgtExcelEngine
    FileExtension = 'xlsx'
    FileDescription = 'Microsoft Excel Workbook'
    InputXRes = 96
    InputYRes = 96
    ItemsToRender = [irText, irImage]
    ReferencePoint = rpBand
    EMailSettings.AuthenticationRequired = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Page.Width = 8.267700000000000000
    Page.Height = 11.692900000000000000
    Page.BinNumber = 0
    Preferences.AutoFormatCells = False
    Preferences.NumberFormatDecimalPlaces = 0
    Preferences.AutoSizeCells = False
    Preferences.ViewGridLines = False
    Formatting.IsFixedCell = False
    Formatting.FixedCellWidth = 56.000000000000000000
    Formatting.FixedCellHeight = 16.000000000000000000
    Formatting.ColumnSpacing = -1
    Formatting.RowSpacing = -1
    Formatting.ScaleX = 1.000000000000000000
    Formatting.ScaleY = 1.000000000000000000
    ImageSettings.SourceDPI = 96
    ImageSettings.OutputImageFormat = ifMetafile
    Left = 149
    Top = 268
  end
  object gtTextEngine1: TgtTextEngine
    FileExtension = 'txt'
    FileDescription = 'Text Document'
    InputXRes = 96
    InputYRes = 96
    ReferencePoint = rpBand
    EMailSettings.AuthenticationRequired = False
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = -11
    DefaultFont.Name = 'MS Sans Serif'
    DefaultFont.Style = []
    Page.Width = 8.267700000000000000
    Page.Height = 11.692900000000000000
    Page.BinNumber = 0
    PageEndLines = True
    ColumnSpacing = 1
    Left = 178
    Top = 268
  end
  object gtQuattroProEngine1: TgtQuattroProEngine
    FileExtension = 'wb1'
    FileDescription = 'Quattro Pro for Windows'
    InputXRes = 96
    InputYRes = 96
    ItemsToRender = [irText]
    ReferencePoint = rpBand
    EMailSettings.AuthenticationRequired = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Page.Width = 8.267700000000000000
    Page.Height = 11.692900000000000000
    Page.BinNumber = 0
    Preferences.AutoFormatCells = False
    Preferences.NumberFormatDecimalPlaces = 0
    Preferences.AutoSizeCells = False
    Preferences.ViewGridLines = False
    Formatting.IsFixedCell = False
    Formatting.FixedCellWidth = 56.000000000000000000
    Formatting.FixedCellHeight = 16.000000000000000000
    Formatting.ColumnSpacing = -1
    Formatting.RowSpacing = -1
    Formatting.ScaleX = 1.000000000000000000
    Formatting.ScaleY = 1.000000000000000000
    Left = 207
    Top = 268
  end
  object gtLotusEngine1: TgtLotusEngine
    FileExtension = 'WK1'
    FileDescription = 'Lotus 1-2-3'
    InputXRes = 96
    InputYRes = 96
    ItemsToRender = [irText]
    ReferencePoint = rpBand
    EMailSettings.AuthenticationRequired = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Page.Width = 8.267700000000000000
    Page.Height = 11.692900000000000000
    Page.BinNumber = 0
    Preferences.AutoFormatCells = False
    Preferences.NumberFormatDecimalPlaces = 0
    Preferences.AutoSizeCells = False
    Preferences.ViewGridLines = False
    Formatting.IsFixedCell = False
    Formatting.FixedCellWidth = 56.000000000000000000
    Formatting.FixedCellHeight = 16.000000000000000000
    Formatting.ColumnSpacing = -1
    Formatting.RowSpacing = -1
    Formatting.ScaleX = 1.000000000000000000
    Formatting.ScaleY = 1.000000000000000000
    Left = 236
    Top = 268
  end
  object gtDIFEngine1: TgtDIFEngine
    FileExtension = 'DIF'
    FileDescription = 'Data Interchange Format'
    InputXRes = 96
    InputYRes = 96
    ItemsToRender = [irText]
    ReferencePoint = rpBand
    EMailSettings.AuthenticationRequired = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Page.Width = 8.267700000000000000
    Page.Height = 11.692900000000000000
    Page.BinNumber = 0
    Preferences.AutoFormatCells = False
    Preferences.NumberFormatDecimalPlaces = 0
    Preferences.AutoSizeCells = False
    Preferences.ViewGridLines = False
    Formatting.IsFixedCell = False
    Formatting.FixedCellWidth = 56.000000000000000000
    Formatting.FixedCellHeight = 16.000000000000000000
    Formatting.ColumnSpacing = -1
    Formatting.RowSpacing = -1
    Formatting.ScaleX = 1.000000000000000000
    Formatting.ScaleY = 1.000000000000000000
    Left = 265
    Top = 268
  end
  object gtSYLKEngine1: TgtSYLKEngine
    FileExtension = 'slk'
    FileDescription = 'Symbolic Link'
    InputXRes = 96
    InputYRes = 96
    ItemsToRender = [irText]
    ReferencePoint = rpBand
    EMailSettings.AuthenticationRequired = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Page.Width = 8.267700000000000000
    Page.Height = 11.692900000000000000
    Page.BinNumber = 0
    Preferences.AutoFormatCells = False
    Preferences.NumberFormatDecimalPlaces = 0
    Preferences.AutoSizeCells = False
    Preferences.ViewGridLines = False
    Formatting.IsFixedCell = False
    Formatting.FixedCellWidth = 56.000000000000000000
    Formatting.FixedCellHeight = 16.000000000000000000
    Formatting.ColumnSpacing = -1
    Formatting.RowSpacing = -1
    Formatting.ScaleX = 1.000000000000000000
    Formatting.ScaleY = 1.000000000000000000
    Left = 294
    Top = 268
  end
  object gtJPEGEngine1: TgtJPEGEngine
    FileExtension = 'jpg'
    FileDescription = 'JPEG File Interchange Format'
    InputXRes = 96
    InputYRes = 96
    ReferencePoint = rpBand
    EMailSettings.AuthenticationRequired = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ImageSettings.SourceDPI = 96
    ImageSettings.OutputImageFormat = ifBMP
    Page.Width = 8.267700000000000000
    Page.Height = 11.692900000000000000
    Page.BinNumber = 0
    ScaleX = 1.000000000000000000
    ScaleY = 1.000000000000000000
    Left = 431
    Top = 268
  end
  object gtGIFEngine1: TgtGIFEngine
    InputXRes = 96
    InputYRes = 96
    ReferencePoint = rpBand
    EMailSettings.AuthenticationRequired = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ImageSettings.SourceDPI = 96
    ImageSettings.OutputImageFormat = ifBMP
    Page.Width = 8.267700000000000000
    Page.Height = 11.692900000000000000
    Page.BinNumber = 0
    ScaleX = 1.000000000000000000
    ScaleY = 1.000000000000000000
    Left = 468
    Top = 268
  end
  object gtBMPEngine1: TgtBMPEngine
    FileExtension = 'bmp'
    FileDescription = 'Windows Bitmap'
    InputXRes = 96
    InputYRes = 96
    ReferencePoint = rpBand
    EMailSettings.AuthenticationRequired = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ImageSettings.SourceDPI = 96
    ImageSettings.OutputImageFormat = ifBMP
    Page.Width = 8.267700000000000000
    Page.Height = 11.692900000000000000
    Page.BinNumber = 0
    ScaleX = 1.000000000000000000
    ScaleY = 1.000000000000000000
    Left = 496
    Top = 268
  end
  object gtEMFEngine1: TgtEMFEngine
    FileExtension = 'emf'
    FileDescription = 'Enhanced Metafiles'
    InputXRes = 96
    InputYRes = 96
    ReferencePoint = rpBand
    EMailSettings.AuthenticationRequired = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ImageSettings.SourceDPI = 96
    ImageSettings.OutputImageFormat = ifBMP
    Page.Width = 8.267700000000000000
    Page.Height = 11.692900000000000000
    Page.BinNumber = 0
    ScaleX = 1.000000000000000000
    ScaleY = 1.000000000000000000
    Left = 496
    Top = 268
  end
  object gtDocSettings1: TgtDocSettings
    BackgroundImageDisplayType = dtCenter
    MeasurementUnit = muPixels
    Page.Width = 793.699200000000000000
    Page.Height = 1122.518400000000000000
    Page.BinNumber = 0
    Left = 496
    Top = 268
  end
  object gtWMFEngine1: TgtWMFEngine
    FileExtension = 'wmf'
    FileDescription = 'Windows Metafiles'
    InputXRes = 96
    InputYRes = 96
    ReferencePoint = rpBand
    EMailSettings.AuthenticationRequired = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ImageSettings.SourceDPI = 96
    ImageSettings.OutputImageFormat = ifBMP
    Page.Width = 8.267700000000000000
    Page.Height = 11.692900000000000000
    Page.BinNumber = 0
    ScaleX = 1.000000000000000000
    ScaleY = 1.000000000000000000
    Left = 496
    Top = 268
  end
  object gtSVGEngine1: TgtSVGEngine
    FileExtension = 'svg'
    FileDescription = 'Scalable Vector Graphics'
    InputXRes = 96
    InputYRes = 96
    ReferencePoint = rpBand
    EMailSettings.AuthenticationRequired = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ImageSettings.SourceDPI = 96
    ImageSettings.OutputImageFormat = ifJPEG
    Page.Width = 8.267700000000000000
    Page.Height = 11.692900000000000000
    Page.BinNumber = 0
    Left = 416
    Top = 280
  end
  object gtPNGEngine1: TgtPNGEngine
    FileExtension = 'png'
    FileDescription = 'Portable Network Graphics'
    InputXRes = 96
    InputYRes = 96
    ReferencePoint = rpBand
    EMailSettings.AuthenticationRequired = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ImageSettings.SourceDPI = 96
    ImageSettings.OutputImageFormat = ifJPEG
    Page.Width = 8.267700000000000000
    Page.Height = 11.692900000000000000
    Page.BinNumber = 0
    ScaleX = 1.000000000000000000
    ScaleY = 1.000000000000000000
    Left = 400
    Top = 272
  end
  object gtTIFFEngine1: TgtTIFFEngine
    FileExtension = 'tif'
    FileDescription = 'Tagged Image File Format'
    InputXRes = 96
    InputYRes = 96
    ReferencePoint = rpBand
    EMailSettings.AuthenticationRequired = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ImageSettings.SourceDPI = 96
    ImageSettings.OutputImageFormat = ifJPEG
    Page.Width = 8.267700000000000000
    Page.Height = 11.692900000000000000
    Page.BinNumber = 0
    ScaleX = 1.000000000000000000
    ScaleY = 1.000000000000000000
    Left = 408
    Top = 248
  end
end
