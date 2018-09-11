object Form1: TForm1
  Left = 198
  Top = 111
  Width = 411
  Height = 460
  Caption = 'WaveInfo - A hbTapi Sample'
  Color = clBtnFace
  Constraints.MinHeight = 350
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    403
    433)
  PixelsPerInch = 96
  TextHeight = 13
  object LabelCallerIDNumber: TLabel
    Left = 8
    Top = 41
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
    Top = 125
    Width = 62
    Height = 13
    Caption = 'Media Mode:'
  end
  object Label2: TLabel
    Left = 8
    Top = 216
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
  object Label5: TLabel
    Left = 8
    Top = 159
    Width = 69
    Height = 13
    Caption = 'WaveIn Class:'
  end
  object Label6: TLabel
    Left = 8
    Top = 182
    Width = 77
    Height = 13
    Caption = 'WaveOut Class:'
  end
  object Bevel1: TBevel
    Left = 104
    Top = 147
    Width = 289
    Height = 12
    Shape = bsTopLine
  end
  object EditPhoneNo: TEdit
    Left = 104
    Top = 37
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
    Top = 121
    Width = 153
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 2
  end
  object Button_MakeCall: TButton
    Left = 267
    Top = 36
    Width = 126
    Height = 25
    Caption = 'MakeCall'
    TabOrder = 3
    OnClick = DoMakeCall
  end
  object Button_DropCall: TButton
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
    Top = 216
    Width = 292
    Height = 213
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
  object ComboBox_Privileges: TComboBox
    Left = 104
    Top = 66
    Width = 152
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 7
    OnChange = ComboBox_PrivilegesChange
    Items.Strings = (
      'Owner+Monitor'
      'Monitor'
      'None')
  end
  object Button_AnswerCall: TButton
    Left = 267
    Top = 64
    Width = 126
    Height = 25
    Caption = 'AnswerCall'
    TabOrder = 8
    OnClick = DoAnswerCall
  end
  object ComboBox_WaveInClass: TComboBox
    Left = 104
    Top = 155
    Width = 153
    Height = 21
    ItemHeight = 13
    TabOrder = 9
    Text = 'wave/in'
    Items.Strings = (
      'wave/in'
      'wave/out'
      'wave/in/out'
      'wave')
  end
  object ComboBox_WaveOutClass: TComboBox
    Left = 104
    Top = 184
    Width = 153
    Height = 21
    ItemHeight = 13
    TabOrder = 10
    Text = 'wave/out'
    Items.Strings = (
      'wave/in'
      'wave/out'
      'wave/in/out'
      'wave')
  end
  object Button_ShowWaveIn: TButton
    Left = 267
    Top = 153
    Width = 126
    Height = 25
    Caption = 'Show'
    TabOrder = 11
    OnClick = DoShowWaveIn
  end
  object Button_ShowWaveOut: TButton
    Left = 267
    Top = 182
    Width = 126
    Height = 25
    Caption = 'Show'
    TabOrder = 12
    OnClick = DoShowWaveOut
  end
  object hbTapiLine1: ThbTapiLine
    CallParams.Flags = 0
    Options.ReplyTimeout = 10000
    Privileges.Monitor = False
    OnCallState = hbTapiLine1CallState
    OnCallDeallocate = hbTapiLine1CallDeallocate
    OnCallEnd = hbTapiLine1CallEnd
    Left = 248
    Top = 311
  end
end
