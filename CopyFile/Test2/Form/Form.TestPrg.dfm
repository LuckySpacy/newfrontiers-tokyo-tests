object frm_TestCopyFile: Tfrm_TestCopyFile
  Left = 0
  Top = 0
  Caption = 'Datei kopieren'
  ClientHeight = 147
  ClientWidth = 593
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
    Left = 24
    Top = 24
    Width = 29
    Height = 13
    Caption = 'Datei:'
  end
  object Label2: TLabel
    Left = 24
    Top = 51
    Width = 20
    Height = 13
    Caption = 'Ziel:'
  end
  object edt_Datei: TEdit
    Left = 59
    Top = 21
    Width = 518
    Height = 21
    TabOrder = 0
    Text = 'edt_Datei'
  end
  object edt_Ziel: TEdit
    Left = 59
    Top = 48
    Width = 518
    Height = 21
    TabOrder = 1
    Text = 'edt_Datei'
  end
  object btn_Copy: TButton
    Left = 24
    Top = 96
    Width = 201
    Height = 25
    Caption = 'Start'
    TabOrder = 2
    OnClick = btn_CopyClick
  end
end
