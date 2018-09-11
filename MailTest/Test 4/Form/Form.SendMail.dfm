object frm_Sendmail: Tfrm_Sendmail
  Left = 0
  Top = 0
  Caption = 'Sendmail'
  ClientHeight = 502
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 635
    Height = 89
    Align = alTop
    Caption = 'Web.de'
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitWidth = 593
    object Label1: TLabel
      Left = 16
      Top = 32
      Width = 63
      Height = 13
      Caption = 'Meine E-Mail:'
    end
    object Label2: TLabel
      Left = 16
      Top = 56
      Width = 79
      Height = 13
      Caption = 'Meine Passwort:'
    end
    object edt_MeineWebEMail: TEdit
      Left = 109
      Top = 29
      Width = 372
      Height = 21
      TabOrder = 0
      Text = 'edt_MeineWebEMail'
    end
    object edt_MeinWebPasswort: TEdit
      Left = 109
      Top = 53
      Width = 372
      Height = 21
      TabOrder = 1
      Text = 'edt_MeineWebEMail'
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 89
    Width = 635
    Height = 413
    Align = alClient
    Caption = 'Nachricht'
    TabOrder = 1
    ExplicitLeft = 8
    ExplicitTop = 81
    ExplicitWidth = 593
    ExplicitHeight = 322
    object Label3: TLabel
      Left = 16
      Top = 61
      Width = 38
      Height = 13
      Caption = 'Betreff:'
    end
    object Label4: TLabel
      Left = 16
      Top = 85
      Width = 81
      Height = 13
      Caption = 'Nachrichtentext:'
    end
    object Label5: TLabel
      Left = 16
      Top = 32
      Width = 28
      Height = 13
      Caption = 'E-Mail'
    end
    object edt_Betreff: TEdit
      Left = 109
      Top = 58
      Width = 372
      Height = 21
      TabOrder = 1
      Text = 'edt_Betreff'
    end
    object mem_Nachricht: TMemo
      Left = 16
      Top = 104
      Width = 561
      Height = 215
      Lines.Strings = (
        'mem_Nachricht')
      TabOrder = 2
    end
    object edt_EMail: TEdit
      Left = 109
      Top = 29
      Width = 372
      Height = 21
      TabOrder = 0
      Text = 'edt_MeineWebEMail'
    end
    object btn_Senden: TButton
      Left = 502
      Top = 29
      Width = 75
      Height = 50
      Caption = 'Senden'
      TabOrder = 3
      OnClick = btn_SendenClick
    end
  end
end
