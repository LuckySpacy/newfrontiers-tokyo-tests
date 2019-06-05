object Form1: TForm1
  Left = 51
  Top = 104
  Width = 699
  Height = 426
  Caption = 'Remote RTTI News'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 399
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 185
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Button2: TButton
        Left = 136
        Top = 8
        Width = 43
        Height = 25
        Caption = 'Fetch'
        TabOrder = 0
        OnClick = Button2Click
      end
      object txtURL: TEdit
        Left = 8
        Top = 8
        Width = 121
        Height = 21
        TabOrder = 1
        Text = 'http://127.0.0.1/'
      end
    end
    object Panel6: TPanel
      Left = 0
      Top = 358
      Width = 185
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object Button1: TButton
        Left = 8
        Top = 8
        Width = 75
        Height = 25
        Caption = 'New Story'
        TabOrder = 0
        OnClick = Button1Click
      end
    end
    object ListBox1: TListBox
      Left = 0
      Top = 41
      Width = 185
      Height = 317
      Align = alClient
      ItemHeight = 13
      TabOrder = 2
      OnDblClick = ListBox1DblClick
    end
  end
  object Panel3: TPanel
    Left = 185
    Top = 0
    Width = 506
    Height = 399
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 506
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
      Top = 358
      Width = 506
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object Save: TButton
        Left = 424
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Save'
        TabOrder = 0
        OnClick = SaveClick
      end
    end
    object MemoStory: TMemo
      Left = 0
      Top = 81
      Width = 506
      Height = 277
      Align = alClient
      TabOrder = 2
    end
  end
end
