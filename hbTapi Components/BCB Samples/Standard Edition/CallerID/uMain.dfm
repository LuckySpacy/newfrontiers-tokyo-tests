object Form1: TForm1
  Left = 193
  Top = 130
  BorderStyle = bsDialog
  Caption = 'CallerID - A hbTapi Sample'
  ClientHeight = 238
  ClientWidth = 419
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
  object LabelCallerIDName: TLabel
    Left = 8
    Top = 46
    Width = 31
    Height = 13
    Caption = 'Name:'
  end
  object Label_CallerID: TLabel
    Left = 8
    Top = 75
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
    Top = 136
    Width = 21
    Height = 13
    Caption = 'Info:'
  end
  object Label2: TLabel
    Left = 8
    Top = 167
    Width = 45
    Height = 13
    Caption = 'CallState:'
  end
  object Label_CallerIDName: TLabel
    Left = 8
    Top = 106
    Width = 71
    Height = 13
    Caption = 'CallerID Name:'
  end
  object EditCallerIDName: TEdit
    Left = 119
    Top = 41
    Width = 200
    Height = 21
    TabOrder = 0
  end
  object Edit_CallerID: TEdit
    Left = 119
    Top = 71
    Width = 200
    Height = 21
    TabOrder = 1
  end
  object ComboBoxDevice: TComboBox
    Left = 119
    Top = 10
    Width = 290
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 2
    OnChange = ComboBoxDeviceChange
  end
  object EditInfo: TEdit
    Left = 119
    Top = 132
    Width = 200
    Height = 21
    TabOrder = 3
  end
  object Edit_CallState: TEdit
    Left = 119
    Top = 163
    Width = 200
    Height = 21
    ReadOnly = True
    TabOrder = 4
  end
  object Edit_CallerIDName: TEdit
    Left = 119
    Top = 102
    Width = 200
    Height = 21
    TabOrder = 5
  end
  object CheckBox_Accept: TCheckBox
    Left = 120
    Top = 200
    Width = 97
    Height = 17
    Caption = 'Accept calls'
    TabOrder = 6
  end
  object hbTapiLine1: ThbTapiLine
    CallOptions.GatherDigits.TerminationDigits = '*#'
    CallParams.Flags = 0
    MediaModes = 4
    Options.ReplyTimeout = 10000
    OnCallState = hbTapiLine1CallState
    OnCallInfo = hbTapiLine1CallInfo
    OnCallerID = hbTapiLine1CallerID
    OnCallDeallocate = hbTapiLine1CallDeallocate
    OnCallEnd = hbTapiLine1CallEnd
    Left = 360
    Top = 55
  end
end
