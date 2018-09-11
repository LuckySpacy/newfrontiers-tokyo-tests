object Form1: TForm1
  Left = 200
  Top = 115
  Width = 512
  Height = 607
  Caption = 'Transfer - A hbTapi sample'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 4
    Top = 6
    Width = 493
    Height = 60
    Caption = 'Telephony Line Device:'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 27
      Width = 37
      Height = 13
      Caption = 'Device:'
    end
    object ComboBoxDevice: TComboBox
      Left = 93
      Top = 23
      Width = 388
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = ComboBoxDeviceChange
    end
  end
  object GroupBox2: TGroupBox
    Left = 3
    Top = 74
    Width = 494
    Height = 335
    Caption = 'Calls'
    TabOrder = 1
    object LabelAddressPrimary: TLabel
      Left = 15
      Top = 188
      Width = 193
      Height = 13
      AutoSize = False
      Caption = 'AddressID (Originating Station/Channel):'
    end
    object Button_Drop: TButton
      Left = 94
      Top = 147
      Width = 75
      Height = 25
      Caption = 'Drop'
      TabOrder = 0
      OnClick = DoDrop
    end
    object Button_Hold: TButton
      Left = 175
      Top = 147
      Width = 75
      Height = 25
      Caption = 'Hold/UnHold'
      TabOrder = 1
      OnClick = DoHold
    end
    object ButtonSwapHold: TButton
      Left = 336
      Top = 147
      Width = 75
      Height = 25
      Caption = 'Swap Hold'
      TabOrder = 2
      OnClick = DoSwapHold
    end
    object Button_MakeCall: TButton
      Left = 13
      Top = 214
      Width = 179
      Height = 25
      Caption = 'MakeCall'
      TabOrder = 3
      OnClick = DoMakeCall
    end
    object Button_SetupTransfer: TButton
      Left = 13
      Top = 273
      Width = 179
      Height = 25
      Caption = 'SetupTransfer'
      TabOrder = 4
      OnClick = DoSetupTransfer
    end
    object Button_Dial: TButton
      Left = 13
      Top = 302
      Width = 179
      Height = 25
      Caption = 'Dial'
      TabOrder = 5
      OnClick = DoDial
    end
    object Button_DialConference: TButton
      Left = 213
      Top = 302
      Width = 268
      Height = 25
      Caption = 'SetupTransfer, Dial and Build a Conference'
      TabOrder = 6
      OnClick = DoDialConference
    end
    object Button_Owner: TButton
      Left = 255
      Top = 147
      Width = 75
      Height = 25
      Caption = 'ToggleOwner'
      TabOrder = 7
      OnClick = Button_OwnerClick
    end
    object Button_DialTransfer: TButton
      Left = 213
      Top = 273
      Width = 268
      Height = 25
      Caption = 'SetupTransfer, Dial and Transfer the Call'
      TabOrder = 8
      OnClick = DoDialTransfer
    end
    object ListView1: TListView
      Left = 12
      Top = 21
      Width = 469
      Height = 121
      Columns = <
        item
          Caption = 'Call'
          Width = 80
        end
        item
          Caption = 'Party'
          Width = 80
        end
        item
          Caption = 'State'
          Width = 80
        end
        item
          Caption = 'Address'
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
          Caption = 'ConferenceCall'
        end>
      HideSelection = False
      ReadOnly = True
      RowSelect = True
      TabOrder = 9
      ViewStyle = vsReport
    end
    object Button_Answer: TButton
      Left = 13
      Top = 147
      Width = 75
      Height = 25
      Caption = 'Answer'
      TabOrder = 10
      OnClick = DoAnswer
    end
    object Button_BlindTransfer: TButton
      Left = 13
      Top = 243
      Width = 179
      Height = 25
      Caption = 'BlindTransfer'
      TabOrder = 11
      OnClick = DoBlindTransfer
    end
    object Button_Transfer: TButton
      Left = 213
      Top = 214
      Width = 268
      Height = 25
      Caption = 'Transfer Call'
      TabOrder = 12
      OnClick = DoTransfer
    end
    object Button_Conference: TButton
      Left = 213
      Top = 243
      Width = 268
      Height = 25
      Caption = 'Build Conference'
      TabOrder = 13
      OnClick = DoConference
    end
    object ComboBox_Address: TComboBox
      Left = 213
      Top = 184
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 14
    end
  end
  object ListBox1: TListBox
    Left = 8
    Top = 416
    Width = 489
    Height = 153
    ItemHeight = 13
    TabOrder = 2
  end
  object hbTapiLine1: ThbTapiLine
    DeviceName = 'Hicom Systemtelefon'
    CallOptions.GatherDigits.TerminationDigits = '*#'
    CallParams.Flags = 0
    Options.ReplyTimeout = 10000
    OnCallState = hbTapiLine1CallState
    OnConnected = hbTapiLine1Connected
    OnCallInfo = hbTapiLine1CallInfo
    OnNewCall = hbTapiLine1NewCall
    OnCallDeallocate = hbTapiLine1CallDeallocate
    Left = 216
    Top = 136
  end
end
