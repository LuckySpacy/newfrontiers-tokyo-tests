object frm_Option: Tfrm_Option
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Sicherungsoptionen'
  ClientHeight = 518
  ClientWidth = 368
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
  object Label1: TLabel
    Left = 8
    Top = 49
    Width = 89
    Height = 13
    Caption = 'zu sichernde DB'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 76
    Width = 70
    Height = 13
    Caption = 'Backupdatei'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 103
    Width = 83
    Height = 13
    Caption = 'Benutzername'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 130
    Width = 52
    Height = 13
    Caption = 'Passwort'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 158
    Width = 41
    Height = 13
    Caption = 'Uhrzeit'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 8
    Top = 182
    Width = 51
    Height = 13
    Caption = 'Optionen'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 8
    Top = 23
    Width = 70
    Height = 13
    Caption = 'Servername'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_Anzahl: TLabel
    Left = 139
    Top = 388
    Width = 32
    Height = 13
    Caption = 'Anzahl'
  end
  object Shape1: TShape
    Left = 8
    Top = 422
    Width = 344
    Height = 44
    Brush.Color = clInfoBk
    Shape = stRoundRect
  end
  object lbl_Hinweis: TLabel
    Left = 45
    Top = 429
    Width = 292
    Height = 31
    AutoSize = False
    Caption = 
      'Sollte ein Dienst verwendet werden, dann ist dieser nach dem '#196'nd' +
      'ern der Sicherungsoptionen neu zu starten. '
    WordWrap = True
  end
  object Label8: TLabel
    Left = 221
    Top = 130
    Width = 25
    Height = 13
    Caption = 'Wdh'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edt_Datenbank: TEdit
    Left = 112
    Top = 46
    Width = 240
    Height = 21
    MaxLength = 255
    TabOrder = 1
    Text = 'edt_Datenbank'
  end
  object edt_Backupdatei: TEdit
    Left = 112
    Top = 73
    Width = 239
    Height = 21
    MaxLength = 255
    TabOrder = 2
    Text = 'Edit1'
  end
  object edt_User: TEdit
    Left = 112
    Top = 100
    Width = 240
    Height = 21
    MaxLength = 255
    TabOrder = 3
    Text = 'Edit1'
  end
  object edt_Passwort: TEdit
    Left = 112
    Top = 127
    Width = 100
    Height = 21
    MaxLength = 255
    PasswordChar = '*'
    TabOrder = 4
    Text = 'Edit1'
  end
  object edt_Uhrzeit: TDateTimePicker
    Left = 112
    Top = 154
    Width = 240
    Height = 21
    Date = 38959.470059490740000000
    Time = 38959.470059490740000000
    Kind = dtkTime
    TabOrder = 5
  end
  object cbx_Checksum: TCheckBox
    Left = 112
    Top = 181
    Width = 247
    Height = 17
    Caption = 'Checksummen ignorieren'
    TabOrder = 6
  end
  object cbx_Limbo: TCheckBox
    Left = 112
    Top = 204
    Width = 247
    Height = 17
    Caption = 'Limbo-Transactions ignorieren'
    TabOrder = 7
  end
  object cbx_MetaOnly: TCheckBox
    Left = 112
    Top = 227
    Width = 247
    Height = 17
    Caption = 'nur Metadaten'
    TabOrder = 8
  end
  object cbx_NoGarbage: TCheckBox
    Left = 112
    Top = 250
    Width = 247
    Height = 17
    Caption = 'Keine Garbage-Collection'
    TabOrder = 9
  end
  object cbx_OldMetadata: TCheckBox
    Left = 112
    Top = 273
    Width = 247
    Height = 17
    Caption = 'OldMetadataDesc'
    TabOrder = 10
  end
  object cbx_NonTransportable: TCheckBox
    Left = 113
    Top = 294
    Width = 247
    Height = 17
    Caption = 'Non-Transportable Format'
    TabOrder = 11
  end
  object cbx_Convert: TCheckBox
    Left = 112
    Top = 316
    Width = 247
    Height = 17
    Caption = 'ConvertExtTables'
    TabOrder = 12
  end
  object cbx_Zeitstempel: TCheckBox
    Left = 112
    Top = 338
    Width = 247
    Height = 17
    Caption = 'Backupdatei um Datum/Zeitstempel erweitern'
    TabOrder = 13
  end
  object Panel1: TPanel
    Left = 0
    Top = 477
    Width = 368
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 14
    object btn_Ok: TButton
      AlignWithMargins = True
      Left = 283
      Top = 5
      Width = 75
      Height = 31
      Margins.Top = 5
      Margins.Right = 10
      Margins.Bottom = 5
      Align = alRight
      Caption = 'Speichern'
      TabOrder = 0
      OnClick = btn_OkClick
    end
    object btn_Cancel: TButton
      AlignWithMargins = True
      Left = 202
      Top = 5
      Width = 75
      Height = 31
      Margins.Top = 5
      Margins.Bottom = 5
      Align = alRight
      Caption = 'Abbrechen'
      TabOrder = 1
      OnClick = btn_CancelClick
    end
  end
  object edt_Servername: TEdit
    Left = 112
    Top = 20
    Width = 240
    Height = 21
    MaxLength = 255
    TabOrder = 0
    Text = 'edt_Datenbank'
  end
  object cbx_MaxAnzahl: TCheckBox
    Left = 113
    Top = 360
    Width = 247
    Height = 17
    Caption = 'Max. Anzahl an Backupdateien'
    TabOrder = 15
    OnClick = cbx_MaxAnzahlClick
  end
  object edt_Anzahl: TSpinEdit
    Left = 176
    Top = 385
    Width = 41
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 16
    Value = 0
  end
  object edt_Passwort2: TEdit
    Left = 251
    Top = 127
    Width = 100
    Height = 21
    MaxLength = 255
    PasswordChar = '*'
    TabOrder = 17
    Text = 'edt_Passwort2'
  end
end
