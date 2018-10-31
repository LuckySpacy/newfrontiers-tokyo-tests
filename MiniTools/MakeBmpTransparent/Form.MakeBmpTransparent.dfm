object fra_MakeBMPTransparent: Tfra_MakeBMPTransparent
  Left = 0
  Top = 0
  Caption = 'BMP Transparent machen'
  ClientHeight = 94
  ClientWidth = 643
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 19
    Top = 13
    Width = 26
    Height = 13
    Caption = 'Pfad:'
  end
  object PaintBox1: TPaintBox
    Left = 504
    Top = 41
    Width = 89
    Height = 73
  end
  object edt_Pfad: TAdvDirectoryEdit
    Left = 61
    Top = 10
    Width = 574
    Height = 22
    DefaultHandling = True
    EmptyTextStyle = []
    Flat = False
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
    ReadOnly = False
    TabOrder = 0
    Visible = True
    Version = '1.5.0.0'
    ButtonStyle = bsButton
    ButtonWidth = 18
    Etched = False
    Glyph.Data = {
      CE000000424DCE0000000000000076000000280000000C0000000B0000000100
      0400000000005800000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00F00000000FFF
      00000088888880FF00000B088888880F00000BB08888888000000BBB00000000
      00000BBBBBBB0B0F00000BBB00000B0F0000F000BBBBBB0F0000FF0BBBBBBB0F
      0000FF0BBB00000F0000FFF000FFFFFF0000}
    BrowseDialogText = 'Select Directory'
  end
  object btn_Konvertieren: TButton
    Left = 22
    Top = 56
    Width = 613
    Height = 25
    Caption = 'Konvertieren'
    TabOrder = 1
    OnClick = btn_KonvertierenClick
  end
end
