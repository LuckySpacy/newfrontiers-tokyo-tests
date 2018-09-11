object ComPortSettingsDlg: TComPortSettingsDlg
  Left = 464
  Top = 281
  BorderStyle = bsDialog
  Caption = 'Properties of ComPort'
  ClientHeight = 245
  ClientWidth = 256
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 256
    Height = 218
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvNone
    BorderWidth = 4
    TabOrder = 0
    object Label1: TLabel
      Left = 12
      Top = 76
      Width = 28
      Height = 13
      Caption = 'Baud:'
    end
    object Label2: TLabel
      Left = 12
      Top = 103
      Width = 48
      Height = 13
      Caption = 'Datenbits:'
    end
    object Label3: TLabel
      Left = 12
      Top = 130
      Width = 29
      Height = 13
      Caption = 'Parity:'
    end
    object Label4: TLabel
      Left = 12
      Top = 157
      Width = 41
      Height = 13
      Caption = 'Stopbits:'
    end
    object Label5: TLabel
      Left = 12
      Top = 184
      Width = 42
      Height = 13
      Caption = 'Protocol:'
    end
    object Bevel1: TBevel
      Left = 12
      Top = 56
      Width = 228
      Height = 10
      Shape = bsTopLine
    end
    object Label_Port: TLabel
      Left = 56
      Top = 12
      Width = 185
      Height = 17
      AutoSize = False
      Layout = tlCenter
      Visible = False
    end
    object Label6: TLabel
      Left = 12
      Top = 25
      Width = 22
      Height = 13
      Caption = 'Port:'
    end
    object cbBaud: TComboBox
      Left = 96
      Top = 72
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      Items.Strings = (
        '75'
        '110'
        '134'
        '150'
        '300'
        '600'
        '1200'
        '2400'
        '4800'
        '7200'
        '9600'
        '14400'
        '19200'
        '38400'
        '57600'
        '115200')
    end
    object cbDataBits: TComboBox
      Left = 96
      Top = 99
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      Items.Strings = (
        '4'
        '5'
        '6'
        '7'
        '8')
    end
    object cbParity: TComboBox
      Left = 96
      Top = 126
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
      Items.Strings = (
        'None'
        'Odd'
        'Even'
        'Mark'
        'Space')
    end
    object cbStopBits: TComboBox
      Left = 96
      Top = 153
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
      Items.Strings = (
        '1'
        '1.5'
        '2')
    end
    object cbHandshake: TComboBox
      Left = 96
      Top = 180
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 5
      Items.Strings = (
        'None'
        'Software (Xon / Xoff)'
        'Hardware (RTS / CTS)'
        'Hardware (DTR / DSR)')
    end
    object cbPort: TComboBox
      Left = 96
      Top = 21
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnClick = DoChangePort
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 218
    Width = 256
    Height = 27
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object ButtonCancel: TButton
      Left = 152
      Top = 1
      Width = 100
      Height = 23
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 0
    end
    object ButtonOk: TButton
      Left = 48
      Top = 1
      Width = 100
      Height = 23
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 1
    end
  end
end
