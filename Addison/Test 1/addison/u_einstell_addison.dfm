object FrmAddisonEinstellungen: TFrmAddisonEinstellungen
  Left = 319
  Top = 475
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Addison - Einstellungen'
  ClientHeight = 310
  ClientWidth = 365
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 44
    Width = 86
    Height = 13
    Caption = 'Exportverzeichnis:'
  end
  object Label2: TLabel
    Left = 8
    Top = 118
    Width = 65
    Height = 13
    Caption = 'Mandant (ID):'
  end
  object Label3: TLabel
    Left = 8
    Top = 150
    Width = 87
    Height = 13
    Caption = 'aktives Zeitfenster'
  end
  object Label4: TLabel
    Left = 208
    Top = 151
    Width = 13
    Height = 13
    Caption = 'bis'
  end
  object Label5: TLabel
    Left = 8
    Top = 190
    Width = 42
    Height = 13
    Caption = 'Benutzer'
  end
  object Label6: TLabel
    Left = 8
    Top = 218
    Width = 43
    Height = 13
    Caption = 'Passwort'
  end
  object Label7: TLabel
    Left = 8
    Top = 68
    Width = 40
    Height = 13
    Caption = 'Backup:'
  end
  object Label8: TLabel
    Left = 8
    Top = 92
    Width = 21
    Height = 13
    Caption = 'Log:'
  end
  object Label9: TLabel
    Left = 8
    Top = 244
    Width = 94
    Height = 13
    Caption = 'Beginn Wirtschaftsj.'
  end
  object DTPStart: TDateTimePicker
    Left = 112
    Top = 147
    Width = 57
    Height = 21
    Date = 38275.662274826400000000
    Format = 'HH:mm'
    Time = 38275.662274826400000000
    Kind = dtkTime
    TabOrder = 3
  end
  object DTPEnde: TDateTimePicker
    Left = 240
    Top = 147
    Width = 57
    Height = 21
    Date = 38275.662274826400000000
    Format = 'HH:mm'
    Time = 38275.662274826400000000
    Kind = dtkTime
    TabOrder = 4
  end
  object Ueberschriftenpanel2: TUeberschriftenpanel
    Left = 0
    Top = 0
    Width = 365
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    Caption = ' '
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 5
    NF_Index = 14
    NF_Text = 'Addison - Einstellungen'
    NF_Height = 24
    object BtnApply: TSpeedButton
      Left = 291
      Top = 2
      Width = 71
      Height = 22
      Caption = 'OK'
      Flat = True
      OnClick = BtnApplyClick
    end
  end
  object EdtDir: TAdvDirectoryEdit
    Left = 112
    Top = 41
    Width = 248
    Height = 21
    DefaultHandling = True
    EmptyTextStyle = []
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -11
    LabelFont.Name = 'Tahoma'
    LabelFont.Style = []
    Lookup.Font.Charset = DEFAULT_CHARSET
    Lookup.Font.Color = clWindowText
    Lookup.Font.Height = -11
    Lookup.Font.Name = 'Arial'
    Lookup.Font.Style = []
    Lookup.Separator = ';'
    Color = clWindow
    TabOrder = 8
    Text = ''
    Visible = True
    Version = '1.5.0.1'
    ButtonStyle = bsButton
    ButtonWidth = 18
    Flat = False
    Etched = False
    Glyph.Data = {
      CE000000424DCE0000000000000076000000280000000C0000000B0000000100
      0400000000005800000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00F00000000FFF
      00000088888880FF00000B088888880F00000BB08888888000000BBB00000000
      00000BBBBBBB0B0F00000BBB00000B0F0000F000BBBBBB0F0000FF0BBBBBBB0F
      0000FF0BBB00000F0000FFF000FFFFFF0000}
    ReadOnly = False
    BrowseDialogText = 'Select Directory'
  end
  object edt_Backup: TAdvDirectoryEdit
    Left = 112
    Top = 65
    Width = 248
    Height = 21
    DefaultHandling = True
    EmptyTextStyle = []
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -11
    LabelFont.Name = 'Tahoma'
    LabelFont.Style = []
    Lookup.Font.Charset = DEFAULT_CHARSET
    Lookup.Font.Color = clWindowText
    Lookup.Font.Height = -11
    Lookup.Font.Name = 'Arial'
    Lookup.Font.Style = []
    Lookup.Separator = ';'
    Color = clWindow
    TabOrder = 1
    Text = ''
    Visible = True
    Version = '1.5.0.1'
    ButtonStyle = bsButton
    ButtonWidth = 18
    Flat = False
    Etched = False
    Glyph.Data = {
      CE000000424DCE0000000000000076000000280000000C0000000B0000000100
      0400000000005800000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00F00000000FFF
      00000088888880FF00000B088888880F00000BB08888888000000BBB00000000
      00000BBBBBBB0B0F00000BBB00000B0F0000F000BBBBBB0F0000FF0BBBBBBB0F
      0000FF0BBB00000F0000FFF000FFFFFF0000}
    ReadOnly = False
    BrowseDialogText = 'Select Directory'
  end
  object edt_Log: TAdvDirectoryEdit
    Left = 112
    Top = 89
    Width = 248
    Height = 21
    DefaultHandling = True
    EmptyTextStyle = []
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -11
    LabelFont.Name = 'Tahoma'
    LabelFont.Style = []
    Lookup.Font.Charset = DEFAULT_CHARSET
    Lookup.Font.Color = clWindowText
    Lookup.Font.Height = -11
    Lookup.Font.Name = 'Arial'
    Lookup.Font.Style = []
    Lookup.Separator = ';'
    Color = clWindow
    TabOrder = 2
    Text = ''
    Visible = True
    Version = '1.5.0.1'
    ButtonStyle = bsButton
    ButtonWidth = 18
    Flat = False
    Etched = False
    Glyph.Data = {
      CE000000424DCE0000000000000076000000280000000C0000000B0000000100
      0400000000005800000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00F00000000FFF
      00000088888880FF00000B088888880F00000BB08888888000000BBB00000000
      00000BBBBBBB0B0F00000BBB00000B0F0000F000BBBBBB0F0000FF0BBBBBBB0F
      0000FF0BBB00000F0000FFF000FFFFFF0000}
    ReadOnly = False
    BrowseDialogText = 'Select Directory'
  end
  object EdtID: TEdit
    Left = 112
    Top = 114
    Width = 105
    Height = 21
    Cursor = crIBeam
    AutoSelect = False
    AutoSize = False
    TabOrder = 0
  end
  object edtAddisonUser: TEdit
    Left = 112
    Top = 187
    Width = 105
    Height = 21
    Cursor = crIBeam
    AutoSelect = False
    AutoSize = False
    TabOrder = 6
  end
  object edtAddisonPass: TEdit
    Left = 112
    Top = 214
    Width = 105
    Height = 21
    Cursor = crIBeam
    AutoSelect = False
    AutoSize = False
    TabOrder = 7
  end
  object edt_Wirtschaftsjahr: TDateTimePicker
    Left = 112
    Top = 241
    Width = 105
    Height = 21
    Date = 43305.451912060190000000
    Time = 43305.451912060190000000
    TabOrder = 9
  end
end
