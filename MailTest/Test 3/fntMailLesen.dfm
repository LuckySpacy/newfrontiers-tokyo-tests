object frm_MailLesen: Tfrm_MailLesen
  Left = 0
  Top = 0
  Caption = 'Mail lesen'
  ClientHeight = 447
  ClientWidth = 804
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 63
    Height = 13
    Caption = 'Meine E-Mail:'
  end
  object Label2: TLabel
    Left = 336
    Top = 16
    Width = 79
    Height = 13
    Caption = 'Meine Passwort:'
  end
  object edt_EMail: TEdit
    Left = 85
    Top = 13
    Width = 228
    Height = 21
    TabOrder = 0
    Text = 'edt_EMail'
  end
  object edt_Passwort: TEdit
    Left = 421
    Top = 13
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
  end
  object StringGrid1: TStringGrid
    Left = 16
    Top = 40
    Width = 657
    Height = 161
    FixedCols = 0
    TabOrder = 2
  end
  object btn_Aktual: TButton
    Left = 560
    Top = 11
    Width = 113
    Height = 25
    Caption = 'Aktualisieren'
    TabOrder = 3
    OnClick = btn_AktualClick
  end
end
