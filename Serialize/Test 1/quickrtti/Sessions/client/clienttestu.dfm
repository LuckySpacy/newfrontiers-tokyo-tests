object Form1: TForm1
  Left = 192
  Top = 107
  Width = 494
  Height = 344
  Caption = 'Session Tester'
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
  object Label2: TLabel
    Left = 16
    Top = 42
    Width = 48
    Height = 13
    Caption = 'SessionID'
  end
  object Label1: TLabel
    Left = 264
    Top = 292
    Width = 25
    Height = 13
    Caption = 'Host:'
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 121
    Height = 25
    Caption = 'Create Session'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 136
    Top = 8
    Width = 113
    Height = 25
    Caption = 'Load Session'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 256
    Top = 8
    Width = 113
    Height = 25
    Caption = 'Store Session'
    TabOrder = 2
    OnClick = Button3Click
  end
  object btnAdd: TButton
    Left = 24
    Top = 288
    Width = 75
    Height = 25
    Caption = 'Add'
    Enabled = False
    TabOrder = 3
    OnClick = btnAddClick
  end
  object btnRemove: TButton
    Left = 160
    Top = 288
    Width = 75
    Height = 25
    Caption = 'Remove'
    Enabled = False
    TabOrder = 4
    OnClick = btnRemoveClick
  end
  object txtSession: TEdit
    Left = 80
    Top = 40
    Width = 393
    Height = 21
    TabOrder = 5
  end
  object GroupBox1: TGroupBox
    Left = 264
    Top = 72
    Width = 217
    Height = 209
    Caption = 'Selected Variable:'
    TabOrder = 6
    object Label3: TLabel
      Left = 8
      Top = 24
      Width = 28
      Height = 13
      Caption = 'Name'
    end
    object Label4: TLabel
      Left = 8
      Top = 64
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    object txtName: TEdit
      Left = 8
      Top = 40
      Width = 201
      Height = 21
      TabOrder = 0
    end
    object memoData: TMemo
      Left = 8
      Top = 80
      Width = 201
      Height = 89
      TabOrder = 1
    end
    object btnSave: TButton
      Left = 136
      Top = 176
      Width = 75
      Height = 25
      Caption = 'Save'
      Enabled = False
      TabOrder = 2
      OnClick = btnSaveClick
    end
  end
  object Button6: TButton
    Left = 376
    Top = 8
    Width = 97
    Height = 25
    Caption = 'Destroy Session'
    TabOrder = 7
    OnClick = Button6Click
  end
  object GroupBox2: TGroupBox
    Left = 16
    Top = 72
    Width = 225
    Height = 209
    Caption = 'Variables:'
    TabOrder = 8
    object ListBox1: TListBox
      Left = 2
      Top = 15
      Width = 221
      Height = 192
      Align = alClient
      ItemHeight = 13
      TabOrder = 0
      OnDblClick = ListBox1DblClick
    end
  end
  object txtHost: TEdit
    Left = 296
    Top = 288
    Width = 177
    Height = 21
    TabOrder = 9
    Text = 'http://127.0.0.1:8023/'
  end
end
