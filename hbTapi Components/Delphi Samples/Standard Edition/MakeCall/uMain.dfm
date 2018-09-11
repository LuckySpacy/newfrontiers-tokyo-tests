object Form1: TForm1
  Left = 471
  Top = 251
  Width = 408
  Height = 334
  Caption = 'MakeCall - A hbTapi Sample'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    400
    307)
  PixelsPerInch = 96
  TextHeight = 13
  object LabelCallerIDNumber: TLabel
    Left = 8
    Top = 125
    Width = 74
    Height = 13
    Caption = 'Phone Number:'
  end
  object LabelDevice: TLabel
    Left = 8
    Top = 14
    Width = 60
    Height = 13
    Caption = 'Line Device:'
  end
  object Label1: TLabel
    Left = 8
    Top = 41
    Width = 62
    Height = 13
    Caption = 'Media Mode:'
  end
  object Label2: TLabel
    Left = 8
    Top = 150
    Width = 53
    Height = 13
    Caption = 'Call Status:'
  end
  object Label3: TLabel
    Left = 8
    Top = 98
    Width = 41
    Height = 13
    Caption = 'Address:'
  end
  object Label4: TLabel
    Left = 8
    Top = 72
    Width = 48
    Height = 13
    Caption = 'Privileges:'
  end
  object EditPhoneNo: TEdit
    Left = 104
    Top = 121
    Width = 153
    Height = 21
    TabOrder = 0
  end
  object ComboBox_Device: TComboBox
    Left = 104
    Top = 10
    Width = 290
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
    OnChange = ComboBox_DeviceChange
  end
  object ComboBox_MediaMode: TComboBox
    Left = 104
    Top = 38
    Width = 153
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 2
  end
  object Button1: TButton
    Left = 267
    Top = 36
    Width = 126
    Height = 25
    Caption = 'MakeCall'
    TabOrder = 3
    OnClick = DoMakeCall
  end
  object Button2: TButton
    Left = 267
    Top = 91
    Width = 126
    Height = 25
    Caption = 'DropCall'
    TabOrder = 4
    OnClick = DoDropCall
  end
  object ListBox1: TListBox
    Left = 104
    Top = 152
    Width = 289
    Height = 135
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    Items.Strings = (
      '<DblClick to clear>')
    TabOrder = 5
    OnDblClick = ListBox1DblClick
  end
  object ComboBox_Address: TComboBox
    Left = 104
    Top = 94
    Width = 153
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 6
  end
  object CheckBox_SyncMode: TCheckBox
    Left = 8
    Top = 179
    Width = 86
    Height = 17
    Caption = 'SyncMode'
    Checked = True
    State = cbChecked
    TabOrder = 7
    OnClick = CheckBox_SyncModeClick
  end
  object ComboBox_Privileges: TComboBox
    Left = 104
    Top = 66
    Width = 152
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 8
    OnChange = ComboBox_PrivilegesChange
    Items.Strings = (
      'Owner+Monitor'
      'Monitor'
      'None')
  end
  object Button3: TButton
    Left = 267
    Top = 118
    Width = 126
    Height = 25
    Caption = 'AnswerCall'
    TabOrder = 9
    OnClick = DoAnswerCall
  end
  object Button4: TButton
    Left = 267
    Top = 63
    Width = 126
    Height = 25
    Caption = 'MakeCall (2)'
    TabOrder = 10
    OnClick = Button4Click
  end
  object CheckBox_BlockID: TCheckBox
    Left = 8
    Top = 200
    Width = 73
    Height = 17
    Caption = 'BlockID'
    TabOrder = 11
  end
  object hbTapiLine1: ThbTapiLine
    CallParams.Flags = 0
    Options.ReplyTimeout = 10000
    Privileges.Monitor = False
    OnCallState = hbTapiLine1CallState
    OnCallInfo = hbTapiLine1CallInfo
    OnCallerID = hbTapiLine1CallerID
    OnCallDeallocate = hbTapiLine1CallDeallocate
    OnCallBegin = hbTapiLine1CallBegin
    OnCallEnd = hbTapiLine1CallEnd
    OnTapiReply = hbTapiLine1TapiReply
    OnTapiTimeout = hbTapiLine1TapiTimeout
    Left = 248
    Top = 207
  end
end
