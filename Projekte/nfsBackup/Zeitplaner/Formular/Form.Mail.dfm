object frm_Mail: Tfrm_Mail
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Mail-Einstellung'
  ClientHeight = 253
  ClientWidth = 291
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 12
    Top = 64
    Width = 22
    Height = 13
    Caption = 'Host'
  end
  object Label3: TLabel
    Left = 12
    Top = 91
    Width = 24
    Height = 13
    Caption = 'EMail'
  end
  object Label4: TLabel
    Left = 12
    Top = 118
    Width = 48
    Height = 13
    Caption = 'Username'
  end
  object lbl_Passwort: TLabel
    Left = 12
    Top = 144
    Width = 44
    Height = 13
    Caption = 'Passwort'
  end
  object Label5: TLabel
    Left = 12
    Top = 172
    Width = 34
    Height = 13
    Caption = 'Betreff'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 291
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 0
    object Label1: TLabel
      Left = 12
      Top = 14
      Width = 40
      Height = 13
      Caption = 'Provider'
    end
    object cbo_Provider: TComboBox
      Left = 72
      Top = 11
      Width = 209
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      Items.Strings = (
        'Exchange'
        'GMail'
        'Web')
    end
  end
  object edt_Host: TEdit
    Left = 72
    Top = 61
    Width = 209
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
    Text = 'edt_Host'
  end
  object edt_EMail: TEdit
    Left = 72
    Top = 88
    Width = 209
    Height = 21
    PasswordChar = '*'
    TabOrder = 2
    Text = 'Edit1'
  end
  object edt_User: TEdit
    Left = 72
    Top = 115
    Width = 209
    Height = 21
    PasswordChar = '*'
    TabOrder = 3
    Text = 'Edit1'
  end
  object Panel2: TPanel
    Left = 0
    Top = 212
    Width = 291
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 4
    ExplicitTop = 166
    object btn_Ok: TButton
      AlignWithMargins = True
      Left = 206
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
      Left = 125
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
    object btn_Mail: TButton
      AlignWithMargins = True
      Left = 44
      Top = 5
      Width = 75
      Height = 31
      Margins.Top = 5
      Margins.Bottom = 5
      Align = alRight
      Caption = 'Testmail'
      TabOrder = 2
      OnClick = btn_MailClick
      ExplicitLeft = 125
    end
  end
  object edt_Passwort: TEdit
    Left = 72
    Top = 141
    Width = 209
    Height = 21
    PasswordChar = '*'
    TabOrder = 5
    Text = 'edt_Passwort'
  end
  object edt_Betreff: TEdit
    Left = 72
    Top = 169
    Width = 209
    Height = 21
    TabOrder = 6
    Text = 'edt_Passwort'
  end
end
