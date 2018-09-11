object Form1: TForm1
  Left = 190
  Top = 106
  Width = 453
  Height = 168
  Caption = 'TranslateAddress - A hbTapi Sample'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox3: TGroupBox
    Left = 8
    Top = 9
    Width = 425
    Height = 120
    Caption = 'Translate'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 22
      Width = 37
      Height = 13
      Caption = 'Device:'
    end
    object Label2: TLabel
      Left = 16
      Top = 69
      Width = 41
      Height = 13
      Caption = 'Address:'
    end
    object Edit1: TEdit
      Left = 16
      Top = 86
      Width = 241
      Height = 21
      TabOrder = 0
      Text = '+49 (421) 12345678'
    end
    object Button5: TButton
      Left = 264
      Top = 84
      Width = 147
      Height = 25
      Caption = 'Translate Address'
      TabOrder = 1
      OnClick = Button5Click
    end
    object ComboBox1: TComboBox
      Left = 16
      Top = 40
      Width = 241
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      OnChange = ComboBox1Change
    end
  end
  object hbTapiLine1: ThbTapiLine
    CallOptions.GatherDigits.TerminationDigits = '*#'
    CallParams.Flags = 0
    MediaModes = 4
    Options.ReplyTimeout = 10000
    Left = 344
    Top = 32
  end
end
