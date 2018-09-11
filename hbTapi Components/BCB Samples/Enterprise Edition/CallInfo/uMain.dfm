object Form1: TForm1
  Left = 195
  Top = 109
  Width = 598
  Height = 434
  Caption = 'CallInfo - A hbTapi Sample'
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
    Left = 8
    Top = 8
    Width = 297
    Height = 177
    Caption = 'Device'
    TabOrder = 0
    object Label1: TLabel
      Left = 13
      Top = 28
      Width = 60
      Height = 13
      Caption = 'Line Device:'
    end
    object Label2: TLabel
      Left = 13
      Top = 60
      Width = 48
      Height = 13
      Caption = 'Privileges:'
    end
    object Label3: TLabel
      Left = 13
      Top = 92
      Width = 41
      Height = 13
      Caption = 'Address:'
    end
    object Label4: TLabel
      Left = 13
      Top = 124
      Width = 62
      Height = 13
      Caption = 'Media Mode:'
    end
    object ComboBox_Device: TComboBox
      Left = 98
      Top = 24
      Width = 180
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = ComboBox_DeviceChange
    end
    object ComboBox_Privileges: TComboBox
      Left = 98
      Top = 56
      Width = 180
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      Items.Strings = (
        'Owner+Monitor'
        'Monitor'
        'None')
    end
    object ComboBox_Address: TComboBox
      Left = 98
      Top = 88
      Width = 180
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
    end
    object ComboBox_MediaMode: TComboBox
      Left = 98
      Top = 120
      Width = 180
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 192
    Width = 297
    Height = 113
    Caption = 'Methods'
    TabOrder = 1
    object Label5: TLabel
      Left = 16
      Top = 37
      Width = 74
      Height = 13
      Caption = 'Phone Number:'
    end
    object Edit_PhoneNumber: TEdit
      Left = 98
      Top = 33
      Width = 180
      Height = 21
      TabOrder = 0
    end
    object Button_MakeCall: TButton
      Left = 43
      Top = 70
      Width = 75
      Height = 25
      Caption = 'MakeCall'
      TabOrder = 1
      OnClick = DoMakeCall
    end
    object Button_AnswerCall: TButton
      Left = 123
      Top = 70
      Width = 75
      Height = 25
      Caption = 'AnswerCall'
      TabOrder = 2
      OnClick = DoAnswerCall
    end
    object Button_DropCall: TButton
      Left = 203
      Top = 70
      Width = 75
      Height = 25
      Caption = 'DropCall'
      TabOrder = 3
      OnClick = DoDropCall
    end
  end
  object GroupBox3: TGroupBox
    Left = 312
    Top = 8
    Width = 273
    Height = 297
    Anchors = [akLeft, akTop, akRight]
    Caption = 'CallInfo'
    TabOrder = 2
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
      Width = 113
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
    object Edit_CallerIDName: TEdit
      Left = 141
      Top = 43
      Width = 113
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
    object Edit_CalledID: TEdit
      Left = 141
      Top = 70
      Width = 113
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
    end
    object Edit_CalledIDName: TEdit
      Left = 141
      Top = 97
      Width = 113
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
    end
    object Edit_ConnectedID: TEdit
      Left = 141
      Top = 124
      Width = 113
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
    end
    object Edit_ConnectedIDName: TEdit
      Left = 141
      Top = 151
      Width = 113
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
    end
    object Edit_RedirectionID: TEdit
      Left = 141
      Top = 178
      Width = 113
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 6
    end
    object Edit_RedirectionIDName: TEdit
      Left = 141
      Top = 205
      Width = 113
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 7
    end
    object Edit_RedirectingID: TEdit
      Left = 141
      Top = 232
      Width = 113
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 8
    end
    object Edit_RedirectingIDName: TEdit
      Left = 141
      Top = 259
      Width = 113
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 9
    end
  end
  object ListBox1: TListBox
    Left = 6
    Top = 312
    Width = 580
    Height = 93
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 3
  end
  object hbTapiLine1: ThbTapiLine
    CallOptions.GatherDigits.TerminationDigits = '*#'
    CallParams.Flags = 0
    OnCallState = hbTapiLine1CallState
    OnCallInfo = hbTapiLine1CallInfo
    Left = 136
    Top = 352
  end
end
