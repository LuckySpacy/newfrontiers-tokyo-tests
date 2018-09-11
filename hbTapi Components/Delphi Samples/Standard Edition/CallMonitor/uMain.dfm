object Form1: TForm1
  Left = 262
  Top = 110
  Width = 550
  Height = 273
  Caption = 'CallMonitor - A hbTapi sample'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object ListView1: TListView
    Left = 0
    Top = 0
    Width = 542
    Height = 138
    Align = alClient
    Columns = <
      item
        Caption = 'Line'
        Width = 100
      end
      item
        Caption = 'Call'
        Width = 80
      end
      item
        Caption = 'State'
        Width = 100
      end
      item
        Caption = 'CallerID'
        Width = 100
      end
      item
        AutoSize = True
        Caption = 'CallerIDName'
      end
      item
        Caption = 'Owner'
      end>
    HideSelection = False
    MultiSelect = True
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
    OnKeyDown = ListView1KeyDown
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 227
    Width = 542
    Height = 19
    Panels = <
      item
        Alignment = taRightJustify
        Bevel = pbNone
        Text = 'Active:'
        Width = 50
      end
      item
        Alignment = taCenter
        Width = 50
      end
      item
        Alignment = taRightJustify
        Bevel = pbNone
        Text = 'Failed:'
        Width = 50
      end
      item
        Alignment = taCenter
        Width = 50
      end
      item
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 138
    Width = 542
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Button_Answer: TButton
      Left = 86
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Answer'
      TabOrder = 0
      OnClick = DoAnswer
    end
    object Button_Drop: TButton
      Left = 167
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Drop'
      TabOrder = 1
      OnClick = DoDrop
    end
    object Button_Owner: TButton
      Left = 5
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Accept'
      TabOrder = 2
      OnClick = DoAccept
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 179
    Width = 542
    Height = 48
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 3
    DesignSize = (
      542
      48)
    object Label1: TLabel
      Left = 5
      Top = 5
      Width = 161
      Height = 13
      Caption = 'Lines supporting interactive voice:'
    end
    object ComboBox_Lines: TComboBox
      Left = 5
      Top = 22
      Width = 447
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight, akBottom]
      ItemHeight = 13
      Sorted = True
      TabOrder = 0
    end
    object Button1: TButton
      Left = 459
      Top = 18
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Activate'
      TabOrder = 1
      OnClick = DoInit
    end
  end
  object hbTapiLine1: ThbTapiLine
    DeviceName = 'Hicom Systemtelefon'
    CallParams.Flags = 0
    MediaModes = 20
    Options.ReplyTimeout = 10000
    OnCallState = hbTapiLine1CallState
    OnCallInfo = hbTapiLine1CallInfo
    OnNewCall = hbTapiLine1NewCall
    OnCallDeallocate = hbTapiLine1CallDeallocate
    OnError = hbTapiLine1Error
    Left = 56
    Top = 64
  end
end
