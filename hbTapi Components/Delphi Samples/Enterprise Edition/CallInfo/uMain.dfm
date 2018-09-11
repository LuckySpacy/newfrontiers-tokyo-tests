object Form1: TForm1
  Left = 197
  Top = 115
  Width = 653
  Height = 441
  Caption = 'CallInfo - A hbTapi Sample'
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
  object ListBox1: TListBox
    Left = 8
    Top = 320
    Width = 633
    Height = 89
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ItemHeight = 14
    ParentFont = False
    TabOrder = 0
    OnDblClick = DoClear
  end
  object GroupBox_CallInfo: TGroupBox
    Left = 368
    Top = 8
    Width = 273
    Height = 305
    Anchors = [akLeft, akTop, akRight]
    Caption = 'CallInfo'
    TabOrder = 1
    object Label_CallerID: TLabel
      Left = 18
      Top = 20
      Width = 40
      Height = 13
      Caption = 'CallerID:'
    end
    object Label_CallerIDName: TLabel
      Left = 18
      Top = 47
      Width = 68
      Height = 13
      Caption = 'CallerIDName:'
    end
    object Label_CalledID: TLabel
      Left = 18
      Top = 74
      Width = 43
      Height = 13
      Caption = 'CalledID:'
    end
    object Label_CalledIDName: TLabel
      Left = 18
      Top = 101
      Width = 71
      Height = 13
      Caption = 'CalledIDName:'
    end
    object Label_ConnectedID: TLabel
      Left = 18
      Top = 128
      Width = 66
      Height = 13
      Caption = 'ConnectedID:'
    end
    object Label_ConnectedIDName: TLabel
      Left = 18
      Top = 155
      Width = 94
      Height = 13
      Caption = 'ConnectedIDName:'
    end
    object Label_RedirectionID: TLabel
      Left = 18
      Top = 182
      Width = 68
      Height = 13
      Caption = 'RedirectionID:'
    end
    object Label_RedirectionIDName: TLabel
      Left = 18
      Top = 209
      Width = 96
      Height = 13
      Caption = 'RedirectionIDName:'
    end
    object Label_RedirectingID: TLabel
      Left = 18
      Top = 236
      Width = 68
      Height = 13
      Caption = 'RedirectingID:'
    end
    object Label_RedirectingIDName: TLabel
      Left = 18
      Top = 263
      Width = 96
      Height = 13
      Caption = 'RedirectingIDName:'
    end
    object Edit_CallerID: TEdit
      Left = 141
      Top = 16
      Width = 121
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
    object Edit_CallerIDName: TEdit
      Left = 141
      Top = 43
      Width = 121
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
    object Edit_CalledID: TEdit
      Left = 141
      Top = 70
      Width = 121
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
    end
    object Edit_CalledIDName: TEdit
      Left = 141
      Top = 97
      Width = 121
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
    end
    object Edit_ConnectedID: TEdit
      Left = 141
      Top = 124
      Width = 121
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
    end
    object Edit_ConnectedIDName: TEdit
      Left = 141
      Top = 151
      Width = 121
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
    end
    object Edit_RedirectionID: TEdit
      Left = 141
      Top = 178
      Width = 121
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 6
    end
    object Edit_RedirectionIDName: TEdit
      Left = 141
      Top = 205
      Width = 121
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 7
    end
    object Edit_RedirectingID: TEdit
      Left = 141
      Top = 232
      Width = 121
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 8
    end
    object Edit_RedirectingIDName: TEdit
      Left = 141
      Top = 259
      Width = 121
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 9
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 353
    Height = 121
    Caption = 'Device'
    TabOrder = 2
    object LabelDevice: TLabel
      Left = 13
      Top = 22
      Width = 65
      Height = 13
      Caption = 'DeviceName:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 13
      Top = 43
      Width = 48
      Height = 13
      Caption = 'Privileges:'
    end
    object Label3: TLabel
      Left = 13
      Top = 68
      Width = 41
      Height = 13
      Caption = 'Address:'
    end
    object Label1: TLabel
      Left = 13
      Top = 92
      Width = 62
      Height = 13
      Caption = 'Media Mode:'
    end
    object ComboBox_Device: TComboBox
      Left = 114
      Top = 15
      Width = 230
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = ComboBox_DeviceChange
    end
    object ComboBox_Privileges: TComboBox
      Left = 114
      Top = 39
      Width = 230
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnChange = ComboBox_PrivilegesChange
      Items.Strings = (
        'Owner+Monitor'
        'Monitor'
        'None')
    end
    object ComboBox_Address: TComboBox
      Left = 114
      Top = 64
      Width = 230
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
    end
    object ComboBox_MediaMode: TComboBox
      Left = 114
      Top = 88
      Width = 230
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 136
    Width = 353
    Height = 177
    Caption = 'Methods'
    TabOrder = 3
    object Label_PhoneNo: TLabel
      Left = 13
      Top = 22
      Width = 48
      Height = 13
      Caption = 'PhoneNo:'
    end
    object Edit_PhoneNo: TEdit
      Left = 114
      Top = 18
      Width = 223
      Height = 21
      TabOrder = 0
      OnKeyPress = Edit_PhoneNoKeyPress
    end
    object Button1: TButton
      Left = 100
      Top = 47
      Width = 78
      Height = 25
      Caption = 'MakeCall'
      TabOrder = 1
      OnClick = DoMakeCall
    end
    object Button2: TButton
      Left = 260
      Top = 47
      Width = 78
      Height = 25
      Caption = 'DropCall'
      TabOrder = 2
      OnClick = DoDropCall
    end
    object Button3: TButton
      Left = 180
      Top = 47
      Width = 78
      Height = 25
      Caption = 'AnswerCall'
      TabOrder = 3
      OnClick = DoAnswerCall
    end
  end
  object hbTapiLine1: ThbTapiLine
    CallOptions.GatherDigits.TerminationDigits = '*#'
    CallParams.Flags = 0
    Options.ReplyTimeout = 10000
    Privileges.Monitor = False
    OnCallState = hbTapiLine1CallState
    OnCallInfo = hbTapiLine1CallInfo
    OnCallDeallocate = hbTapiLine1CallDeallocate
    OnTapiReply = hbTapiLine1TapiReply
    OnTapiTimeout = hbTapiLine1TapiTimeout
    Left = 64
    Top = 175
  end
end
