object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 352
  ClientWidth = 519
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
    Width = 519
    Height = 41
    Align = alTop
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 0
    object Label1: TLabel
      Left = 120
      Top = 14
      Width = 28
      Height = 13
      Caption = 'Pr'#228'fix'
    end
    object btn_Erzeugen: TButton
      Left = 17
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Erzeugen'
      TabOrder = 0
      OnClick = btn_ErzeugenClick
    end
    object edt_Praefix: TEdit
      Left = 154
      Top = 12
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'edt_Praefix'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 519
    Height = 311
    Align = alClient
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 1
    object mem_DDL: TMemo
      Left = 1
      Top = 1
      Width = 517
      Height = 309
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      Lines.Strings = (
        'Memo1')
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
end
