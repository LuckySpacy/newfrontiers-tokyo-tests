object Form1: TForm1
  Left = 291
  Top = 157
  Caption = 'Bild zu PDF Konverter'
  ClientHeight = 437
  ClientWidth = 533
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 104
    Top = 408
    Width = 33
    Height = 25
    Visible = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 65
    Width = 533
    Height = 372
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 0
    ExplicitWidth = 504
    object ListBox1: TListBox
      Left = 1
      Top = 36
      Width = 531
      Height = 335
      Align = alBottom
      Anchors = [akLeft, akTop, akRight, akBottom]
      ItemHeight = 13
      MultiSelect = True
      TabOrder = 0
      ExplicitWidth = 502
    end
    object Button2: TButton
      Left = 4
      Top = 8
      Width = 105
      Height = 25
      Caption = 'Bild hinzuf'#252'gen'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 115
      Top = 8
      Width = 105
      Height = 25
      Caption = 'Bild entfernen'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = Button3Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 533
    Height = 65
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 504
    object RadioGroup1: TRadioGroup
      Left = 11
      Top = 10
      Width = 332
      Height = 49
      Caption = 'Dokumenterstellung'
      Columns = 2
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Einzelne PDF-Datei'
        'Mehrere PDF-Dateien')
      ParentFont = False
      TabOrder = 0
    end
    object Button1: TButton
      Left = 349
      Top = 34
      Width = 172
      Height = 25
      Caption = 'Konvertieren'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Button1Click
    end
    object CheckBox1: TCheckBox
      Left = 349
      Top = 11
      Width = 183
      Height = 17
      Caption = 'Metafiles als Rastergrafiken'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
  object ProgressBar1: TProgressBar
    Left = 226
    Top = 71
    Width = 295
    Height = 25
    Step = 1
    TabOrder = 2
    Visible = False
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Adobe PDF Files (*.pdf)|*.pdf'
    Left = 504
    Top = 96
  end
  object OpenDialog1: TOpenDialog
    Filter = 'ImageFiles(*.bmp;*.jpg;*.wmf;*.emf)|*.bmp;*.jpg;*.wmf;*.emf'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 536
    Top = 96
  end
  object gtPDFEngine1: TgtPDFEngine
    FileExtension = 'pdf'
    FileDescription = 'Adobe PDF Files'
    InputXRes = 96
    InputYRes = 96
    ReferencePoint = rpBand
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
    FontEncoding = feWinAnsiEncoding
    Left = 472
    Top = 96
  end
end
