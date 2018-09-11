object Form1: TForm1
  Left = 190
  Top = 107
  Width = 415
  Height = 332
  Caption = 'MakeCall - A hbTapi Sample'
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
  object Label4: TLabel
    Left = 8
    Top = 72
    Width = 48
    Height = 13
    Caption = 'Privileges:'
  end
  object Label3: TLabel
    Left = 8
    Top = 98
    Width = 41
    Height = 13
    Caption = 'Address:'
  end
  object LabelCallerIDNumber: TLabel
    Left = 8
    Top = 125
    Width = 74
    Height = 13
    Caption = 'Phone Number:'
  end
  object Label2: TLabel
    Left = 8
    Top = 150
    Width = 53
    Height = 13
    Caption = 'Call Status:'
  end
  object ComboBox_Device: TComboBox
    Left = 96
    Top = 8
    Width = 305
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnChange = ComboBox_DeviceChange
  end
  object CheckBox_SyncMode: TCheckBox
    Left = 8
    Top = 176
    Width = 81
    Height = 17
    Caption = 'SyncMode'
    Checked = True
    State = cbChecked
    TabOrder = 1
    OnClick = CheckBox_SyncModeClick
  end
  object ComboBox_Privileges: TComboBox
    Left = 96
    Top = 65
    Width = 187
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 2
    OnChange = ComboBox_PrivilegesChange
    Items.Strings = (
      'Owner+Monitor'
      'Monitor'
      'None')
  end
  object ComboBox_MediaMode: TComboBox
    Left = 96
    Top = 36
    Width = 187
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 3
  end
  object ComboBox_Address: TComboBox
    Left = 96
    Top = 94
    Width = 187
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 4
  end
  object ListBox1: TListBox
    Left = 96
    Top = 152
    Width = 305
    Height = 145
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    Items.Strings = (
      '<DblClick to clear>')
    TabOrder = 5
    OnDblClick = ListBox1DblClick
  end
  object Button1: TButton
    Left = 300
    Top = 34
    Width = 100
    Height = 23
    Caption = 'MakeCall'
    TabOrder = 6
    OnClick = DoMakeCall
  end
  object EditPhoneNo: TEdit
    Left = 96
    Top = 123
    Width = 187
    Height = 21
    TabOrder = 7
  end
  object Button2: TButton
    Left = 300
    Top = 91
    Width = 100
    Height = 23
    Caption = 'Answer'
    TabOrder = 8
    OnClick = DoAnswerCall
  end
  object Button3: TButton
    Left = 300
    Top = 62
    Width = 100
    Height = 23
    Caption = 'MakeCall2'
    TabOrder = 9
    OnClick = DoMakeCall2
  end
  object CheckBox_BlockID: TCheckBox
    Left = 8
    Top = 200
    Width = 81
    Height = 17
    Caption = 'BlockID'
    TabOrder = 10
  end
  object Button5: TButton
    Left = 300
    Top = 120
    Width = 100
    Height = 23
    Caption = 'Drop'
    TabOrder = 11
    OnClick = Button5Click
  end
  object hbTapiLine1: ThbTapiLine
    CallOptions.GatherDigits.TerminationDigits = '*#'
    CallParams.Flags = 0
    OnCallState = hbTapiLine1CallState
    OnCallerID = hbTapiLine1CallerID
    OnCallDeallocate = hbTapiLine1CallDeallocate
    OnCallEnd = hbTapiLine1CallEnd
    Left = 224
    Top = 216
  end
end
