object Form1: TForm1
  Left = 192
  Top = 107
  BorderStyle = bsDialog
  Caption = 'WaveInfo - A hbTapi Sample'
  ClientHeight = 410
  ClientWidth = 432
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
  object Label1: TLabel
    Left = 16
    Top = 20
    Width = 60
    Height = 13
    Caption = 'Line Device:'
  end
  object Label2: TLabel
    Left = 16
    Top = 52
    Width = 74
    Height = 13
    Caption = 'Phone Number:'
  end
  object Label3: TLabel
    Left = 16
    Top = 84
    Width = 48
    Height = 13
    Caption = 'Privileges:'
  end
  object Label4: TLabel
    Left = 16
    Top = 116
    Width = 41
    Height = 13
    Caption = 'Address:'
  end
  object Label5: TLabel
    Left = 16
    Top = 148
    Width = 67
    Height = 13
    Caption = 'Media Modes:'
  end
  object Label6: TLabel
    Left = 16
    Top = 189
    Width = 69
    Height = 13
    Caption = 'WaveIn Class:'
  end
  object Label7: TLabel
    Left = 16
    Top = 221
    Width = 77
    Height = 13
    Caption = 'WaveOut Class:'
  end
  object Label8: TLabel
    Left = 16
    Top = 264
    Width = 50
    Height = 13
    Caption = 'CallStates:'
  end
  object Bevel1: TBevel
    Left = 7
    Top = 172
    Width = 417
    Height = 25
    Shape = bsTopLine
  end
  object Bevel2: TBevel
    Left = 7
    Top = 248
    Width = 417
    Height = 25
    Shape = bsTopLine
  end
  object ComboBox_Device: TComboBox
    Left = 152
    Top = 16
    Width = 273
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    OnChange = ComboBox_DeviceChange
  end
  object Edit_PhoneNo: TEdit
    Left = 152
    Top = 48
    Width = 145
    Height = 21
    TabOrder = 1
  end
  object ComboBox_Privileges: TComboBox
    Left = 152
    Top = 80
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 2
    Items.Strings = (
      'Owner+Monitor'
      'Monitor'
      'None')
  end
  object ComboBox_Address: TComboBox
    Left = 152
    Top = 112
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 3
  end
  object ComboBox_MediaMode: TComboBox
    Left = 152
    Top = 144
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 4
  end
  object ComboBox_WaveInClass: TComboBox
    Left = 152
    Top = 185
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 5
    Text = 'wave/in'
    Items.Strings = (
      'wave/in'
      'wave/out'
      'wave/in/out'
      'wave')
  end
  object ComboBox_WaveOutClass: TComboBox
    Left = 152
    Top = 217
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 6
    Text = 'wave/out'
    Items.Strings = (
      'wave/in'
      'wave/out'
      'wave/in/out'
      'wave')
  end
  object Button_MakeCall: TButton
    Left = 321
    Top = 46
    Width = 100
    Height = 25
    Caption = 'MakeCall'
    TabOrder = 7
    OnClick = DoMakeCall
  end
  object Button2: TButton
    Left = 321
    Top = 78
    Width = 100
    Height = 25
    Caption = 'AnswerCall'
    TabOrder = 8
    OnClick = DoAnswerCall
  end
  object Button3: TButton
    Left = 321
    Top = 110
    Width = 100
    Height = 25
    Caption = 'DropCall'
    TabOrder = 9
    OnClick = DoDropCall
  end
  object ListBox1: TListBox
    Left = 152
    Top = 264
    Width = 269
    Height = 137
    ItemHeight = 13
    TabOrder = 10
  end
  object Button4: TButton
    Left = 321
    Top = 183
    Width = 100
    Height = 25
    Caption = 'Show'
    TabOrder = 11
    OnClick = DoShowWaveIn
  end
  object Button5: TButton
    Left = 321
    Top = 215
    Width = 100
    Height = 25
    Caption = 'Show'
    TabOrder = 12
    OnClick = DoShowWaveOut
  end
  object hbTapiLine1: ThbTapiLine
    DeviceName = 'DSSP Line #1'
    CallOptions.GatherDigits.TerminationDigits = '*#'
    CallParams.Flags = 0
    OnCallState = hbTapiLine1CallState
    OnCallDeallocate = hbTapiLine1CallDeallocate
    Left = 64
    Top = 296
  end
end
