object Form1: TForm1
  Left = 237
  Top = 114
  Width = 422
  Height = 226
  Caption = 'CallerID - A hbTAPI Sample'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label_CallerID: TLabel
    Left = 8
    Top = 46
    Width = 81
    Height = 13
    Caption = 'CallerID Address:'
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
    Top = 109
    Width = 21
    Height = 13
    Caption = 'Info:'
  end
  object Label_CallerIDName: TLabel
    Left = 8
    Top = 77
    Width = 71
    Height = 13
    Caption = 'CallerID Name:'
  end
  object Label2: TLabel
    Left = 8
    Top = 140
    Width = 45
    Height = 13
    Caption = 'CallState:'
  end
  object Edit_CallerID: TEdit
    Left = 119
    Top = 42
    Width = 200
    Height = 21
    TabOrder = 0
  end
  object ComboBoxDevice: TComboBox
    Left = 119
    Top = 10
    Width = 290
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
    OnChange = ComboBoxDeviceChange
  end
  object EditInfo: TEdit
    Left = 119
    Top = 105
    Width = 200
    Height = 21
    TabOrder = 2
  end
  object Edit_CallerIDName: TEdit
    Left = 119
    Top = 73
    Width = 200
    Height = 21
    TabOrder = 3
  end
  object CheckBox_AcceptCalls: TCheckBox
    Left = 119
    Top = 168
    Width = 97
    Height = 17
    Caption = 'Accept Calls'
    TabOrder = 4
  end
  object Edit_CallState: TEdit
    Left = 119
    Top = 136
    Width = 200
    Height = 21
    TabOrder = 5
  end
  object hbTapiLine1: ThbTapiLine
    CallParams.Flags = 0
    MediaModes = 4
    Options.ReplyTimeout = 10000
    Privileges.Monitor = False
    Privileges.None = True
    Privileges.Owner = False
    OnCallState = hbTapiLine1CallState
    OnCallInfo = hbTapiLine1CallInfo
    OnCallerID = hbTapiLine1CallerID
    OnCallDeallocate = hbTapiLine1CallDeallocate
    OnCallEnd = hbTapiLine1CallEnd
    Left = 360
    Top = 39
  end
end
