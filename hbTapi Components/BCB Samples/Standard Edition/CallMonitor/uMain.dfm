object Form1: TForm1
  Left = 192
  Top = 107
  Width = 618
  Height = 303
  Caption = 'CallMonitor - A hbTapi Sample'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel_Lines: TPanel
    Left = 0
    Top = 187
    Width = 610
    Height = 67
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 161
      Height = 13
      Caption = 'Lines supporting interactive voice:'
    end
    object ComboBox_Lines: TComboBox
      Left = 8
      Top = 36
      Width = 509
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
    end
    object Button1: TButton
      Left = 529
      Top = 9
      Width = 75
      Height = 49
      Anchors = [akTop, akRight]
      Caption = 'Activate'
      TabOrder = 1
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 254
    Width = 610
    Height = 22
    Panels = <
      item
        Alignment = taRightJustify
        Bevel = pbNone
        Text = 'Active:'
        Width = 60
      end
      item
        Alignment = taCenter
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Width = 60
      end
      item
        Alignment = taRightJustify
        Bevel = pbNone
        Text = 'Failed:'
        Width = 60
      end
      item
        Alignment = taCenter
        Width = 60
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object TPanel
    Left = 0
    Top = 149
    Width = 610
    Height = 38
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Button5: TButton
      Left = 12
      Top = 7
      Width = 100
      Height = 25
      Caption = 'Answer'
      TabOrder = 0
      OnClick = DoAnswer
    end
    object Button6: TButton
      Left = 118
      Top = 7
      Width = 100
      Height = 25
      Caption = 'Drop'
      TabOrder = 1
      OnClick = DoDrop
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 610
    Height = 149
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 4
    TabOrder = 3
    object ListView1: TListView
      Left = 4
      Top = 4
      Width = 602
      Height = 141
      Align = alClient
      Columns = <
        item
          Caption = 'Line'
          Width = 110
        end
        item
          Caption = 'Call'
          Width = 110
        end
        item
          Caption = 'CallState'
          Width = 110
        end
        item
          Caption = 'CallerID'
          Width = 110
        end
        item
          Caption = 'CallerIDName'
          Width = 100
        end>
      HideSelection = False
      ReadOnly = True
      RowSelect = True
      PopupMenu = PopupMenu1
      TabOrder = 0
      ViewStyle = vsReport
    end
  end
  object hbTapiLine1: ThbTapiLine
    CallParams.Flags = 0
    Options.ReplyTimeout = 10000
    Privileges.AutoSelect = False
    Privileges.Monitor = False
    OnCallState = hbTapiLine1CallState
    OnCallInfo = hbTapiLine1CallInfo
    OnNewCall = hbTapiLine1NewCall
    OnCallDeallocate = hbTapiLine1CallDeallocate
    Left = 136
    Top = 72
  end
  object PopupMenu1: TPopupMenu
    Left = 171
    Top = 72
    object Answer1: TMenuItem
      Caption = 'Answer'
      OnClick = DoAnswer
    end
    object Drop1: TMenuItem
      Caption = 'Drop'
      OnClick = DoDrop
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object UpdateCalls1: TMenuItem
      Caption = 'Update Calls'
    end
  end
end
