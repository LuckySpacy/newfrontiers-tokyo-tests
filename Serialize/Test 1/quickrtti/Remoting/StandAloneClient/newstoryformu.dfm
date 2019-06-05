object NewStory: TNewStory
  Left = 192
  Top = 108
  Width = 512
  Height = 482
  Caption = 'NewStory'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 504
    Height = 455
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 504
      Height = 81
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 26
        Height = 13
        Caption = 'Date:'
      end
      object Label2: TLabel
        Left = 8
        Top = 30
        Width = 23
        Height = 13
        Caption = 'Title:'
      end
      object Label3: TLabel
        Left = 8
        Top = 52
        Width = 15
        Height = 13
        Caption = 'By:'
      end
      object lblDate: TLabel
        Left = 40
        Top = 8
        Width = 177
        Height = 13
        AutoSize = False
      end
      object txtTitle: TEdit
        Left = 40
        Top = 24
        Width = 409
        Height = 21
        TabOrder = 0
      end
      object txtByLine: TEdit
        Left = 40
        Top = 48
        Width = 193
        Height = 21
        TabOrder = 1
      end
    end
    object Panel5: TPanel
      Left = 0
      Top = 424
      Width = 504
      Height = 31
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object Save: TButton
        Left = 8
        Top = 3
        Width = 75
        Height = 25
        Caption = 'Save'
        ModalResult = 1
        TabOrder = 0
      end
      object Cancel: TButton
        Left = 424
        Top = 3
        Width = 75
        Height = 25
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 1
      end
    end
    object MemoStory: TMemo
      Left = 0
      Top = 81
      Width = 504
      Height = 343
      Align = alClient
      TabOrder = 1
    end
  end
end
