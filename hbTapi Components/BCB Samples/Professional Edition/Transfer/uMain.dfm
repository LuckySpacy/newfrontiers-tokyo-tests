object Form1: TForm1
  Left = 192
  Top = 107
  Width = 509
  Height = 600
  Caption = 'Transfer - A hbTapi Sample'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 4
    Top = 6
    Width = 493
    Height = 92
    Caption = 'Telephony Line Device:'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 27
      Width = 37
      Height = 13
      Caption = 'Device:'
    end
    object LabelAddressPrimary: TLabel
      Left = 15
      Top = 55
      Width = 193
      Height = 13
      AutoSize = False
      Caption = 'AddressID (Originating Station/Channel):'
    end
    object ComboBoxDevice: TComboBox
      Left = 93
      Top = 23
      Width = 312
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = ComboBoxDeviceChange
    end
    object ComboBox_Address: TComboBox
      Left = 232
      Top = 51
      Width = 173
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 3
    Top = 107
    Width = 494
    Height = 303
    Caption = 'Calls'
    TabOrder = 1
    object ButtonDrop: TButton
      Left = 94
      Top = 144
      Width = 75
      Height = 25
      Caption = 'Drop'
      TabOrder = 0
      OnClick = DoDrop
    end
    object ButtonHoldUnhold: TButton
      Left = 175
      Top = 144
      Width = 75
      Height = 25
      Caption = 'Hold/UnHold'
      TabOrder = 1
      OnClick = DoHold
    end
    object ButtonTransferSwapHold: TButton
      Left = 336
      Top = 144
      Width = 75
      Height = 25
      Caption = 'Swap Hold'
      TabOrder = 2
      OnClick = DoSwapHold
    end
    object ButtonDial: TButton
      Left = 13
      Top = 182
      Width = 179
      Height = 25
      Caption = 'MakeCall'
      TabOrder = 3
      OnClick = DoMakeCall
    end
    object Button_SetupTransfer: TButton
      Left = 13
      Top = 241
      Width = 179
      Height = 25
      Caption = 'SetupTransfer'
      TabOrder = 4
      OnClick = Button_SetupTransferClick
    end
    object Button_Dial: TButton
      Left = 13
      Top = 270
      Width = 179
      Height = 25
      Caption = 'Dial'
      TabOrder = 5
      OnClick = DoDial
    end
    object ButtonTransferDial: TButton
      Left = 213
      Top = 270
      Width = 268
      Height = 25
      Caption = 'SetupTransfer, Dial and Build a Conference'
      TabOrder = 6
      OnClick = ButtonTransferDialClick
    end
    object Button2: TButton
      Left = 255
      Top = 144
      Width = 75
      Height = 25
      Caption = 'ToggleOwner'
      TabOrder = 7
      OnClick = DoToggleOwner
    end
    object ButtonTransferDialTransfer: TButton
      Left = 213
      Top = 241
      Width = 268
      Height = 25
      Caption = 'SetupTransfer, Dial and Transfer the Call'
      TabOrder = 8
      OnClick = ButtonTransferDialTransferClick
    end
    object ListView1: TListView
      Left = 12
      Top = 21
      Width = 469
      Height = 121
      Columns = <
        item
          Caption = 'Call'
        end
        item
          Caption = 'Party'
          Width = 80
        end
        item
          Caption = 'State'
          Width = 100
        end
        item
          Caption = 'Privilege'
          Width = 80
        end
        item
          Caption = 'MediaMode(s)'
          Width = 200
        end
        item
          AutoSize = True
          Caption = 'ConferenceCall'
          WidthType = (
            -45)
        end>
      HideSelection = False
      ReadOnly = True
      RowSelect = True
      TabOrder = 9
      ViewStyle = vsReport
    end
    object ButtonAnswer: TButton
      Left = 13
      Top = 144
      Width = 75
      Height = 25
      Caption = 'Answer'
      TabOrder = 10
      OnClick = DoAnswer
    end
    object Button_BlindTransfer: TButton
      Left = 13
      Top = 211
      Width = 179
      Height = 25
      Caption = 'BlindTransfer'
      TabOrder = 11
      OnClick = DoBlindTransfer
    end
    object Button3: TButton
      Left = 213
      Top = 182
      Width = 179
      Height = 25
      Caption = 'Transfer Call'
      TabOrder = 12
      OnClick = DoTransfer
    end
    object Button5: TButton
      Left = 213
      Top = 211
      Width = 179
      Height = 25
      Caption = 'Build Conference'
      TabOrder = 13
      OnClick = DoConference
    end
  end
  object ListBox1: TListBox
    Left = 8
    Top = 416
    Width = 489
    Height = 153
    ItemHeight = 13
    Items.Strings = (
      '<DblClick to clear>')
    TabOrder = 2
    OnDblClick = ListBox1DblClick
  end
  object hbTapiLine1: ThbTapiLine
    DeviceName = 'Hicom Systemtelefon'
    CallOptions.GatherDigits.TerminationDigits = '*#'
    CallParams.Flags = 0
    MediaModes = 20
    Options.ReplyTimeout = 10000
    OnCallState = hbTapiLine1CallState
    OnConnected = hbTapiLine1Connected
    OnCallDeallocate = hbTapiLine1CallDeallocate
    Left = 232
    Top = 176
  end
end
