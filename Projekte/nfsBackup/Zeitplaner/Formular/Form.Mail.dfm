object frm_Mail: Tfrm_Mail
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Mail-Einstellung'
  ClientHeight = 338
  ClientWidth = 299
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 299
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 0
    ExplicitWidth = 291
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
  object Panel2: TPanel
    Left = 0
    Top = 297
    Width = 299
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 3
    ExplicitTop = 166
    ExplicitWidth = 291
    object btn_Ok: TButton
      AlignWithMargins = True
      Left = 214
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
      ExplicitLeft = 206
    end
    object btn_Cancel: TButton
      AlignWithMargins = True
      Left = 133
      Top = 5
      Width = 75
      Height = 31
      Margins.Top = 5
      Margins.Bottom = 5
      Align = alRight
      Caption = 'Abbrechen'
      TabOrder = 1
      OnClick = btn_CancelClick
      ExplicitLeft = 125
    end
    object btn_Mail: TButton
      AlignWithMargins = True
      Left = 52
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
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 51
    Width = 293
    Height = 142
    Margins.Top = 10
    Align = alTop
    Caption = 'SMTP'
    TabOrder = 1
    ExplicitLeft = 8
    ExplicitTop = 54
    ExplicitWidth = 794
    object Label2: TLabel
      Left = 9
      Top = 24
      Width = 22
      Height = 13
      Caption = 'Host'
    end
    object Label3: TLabel
      Left = 9
      Top = 51
      Width = 24
      Height = 13
      Caption = 'EMail'
    end
    object Label4: TLabel
      Left = 9
      Top = 78
      Width = 48
      Height = 13
      Caption = 'Username'
    end
    object lbl_Passwort: TLabel
      Left = 9
      Top = 104
      Width = 44
      Height = 13
      Caption = 'Passwort'
    end
    object edt_Host: TEdit
      Left = 69
      Top = 21
      Width = 209
      Height = 21
      PasswordChar = '*'
      TabOrder = 0
      Text = 'edt_Host'
    end
    object edt_EMail: TEdit
      Left = 69
      Top = 48
      Width = 209
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
      Text = 'Edit1'
    end
    object edt_User: TEdit
      Left = 69
      Top = 75
      Width = 209
      Height = 21
      PasswordChar = '*'
      TabOrder = 2
      Text = 'Edit1'
    end
    object edt_Passwort: TEdit
      Left = 69
      Top = 101
      Width = 209
      Height = 21
      PasswordChar = '*'
      TabOrder = 3
      Text = 'edt_Passwort'
    end
  end
  object GroupBox2: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 199
    Width = 293
    Height = 95
    Align = alClient
    Caption = 'Senden'
    TabOrder = 2
    ExplicitLeft = -2
    ExplicitWidth = 794
    ExplicitHeight = 184
    object Label5: TLabel
      Left = 19
      Top = 58
      Width = 34
      Height = 13
      Caption = 'Betreff'
    end
    object Label6: TLabel
      Left = 19
      Top = 31
      Width = 28
      Height = 13
      Caption = 'EMail:'
    end
    object edt_Betreff: TEdit
      Left = 69
      Top = 55
      Width = 209
      Height = 21
      TabOrder = 0
      Text = 'edt_Passwort'
    end
    object edt_EMailAn: TEdit
      Left = 69
      Top = 28
      Width = 209
      Height = 21
      TabOrder = 1
      Text = 'edt_Passwort'
    end
  end
end
