object Form1: TForm1
  Left = 236
  Top = 116
  Width = 512
  Height = 401
  Caption = 'Park - A hbTapi sample'
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
      Top = 19
      Width = 37
      Height = 13
      Caption = 'Device:'
    end
    object Label5: TLabel
      Left = 16
      Top = 40
      Width = 48
      Height = 13
      Caption = 'Privileges:'
      FocusControl = Button_Answer
    end
    object lbPrivileges: TLabel
      Left = 92
      Top = 40
      Width = 31
      Height = 13
      Caption = 'NONE'
    end
    object ComboBoxDevice: TComboBox
      Left = 92
      Top = 15
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
    Height = 293
    Caption = 'Calls'
    TabOrder = 1
    object Label2: TLabel
      Left = 232
      Top = 188
      Width = 57
      Height = 13
      Caption = 'To Address:'
    end
    object Label3: TLabel
      Left = 232
      Top = 260
      Width = 67
      Height = 13
      Caption = 'From Address:'
    end
    object Label4: TLabel
      Left = 232
      Top = 220
      Width = 90
      Height = 13
      Caption = 'Parked at Address:'
    end
    object Button_Drop: TButton
      Left = 166
      Top = 145
      Width = 75
      Height = 25
      Caption = 'Drop'
      TabOrder = 0
      OnClick = DoDrop
    end
    object Button_MakeCall: TButton
      Left = 13
      Top = 145
      Width = 68
      Height = 25
      Caption = 'MakeCall'
      TabOrder = 1
      OnClick = DoMakeCall
    end
    object ListView1: TListView
      Left = 12
      Top = 21
      Width = 469
      Height = 117
      Columns = <
        item
          Caption = 'Call'
          Width = 80
        end
        item
          Caption = 'State'
          Width = 100
        end
        item
          Caption = 'Address'
          Width = 80
        end
        item
          Caption = 'Privilege'
          Width = 80
        end
        item
          AutoSize = True
          Caption = 'MediaMode(s)'
        end>
      HideSelection = False
      ReadOnly = True
      RowSelect = True
      TabOrder = 2
      ViewStyle = vsReport
      OnSelectItem = ListView1SelectItem
    end
    object Button_Answer: TButton
      Left = 85
      Top = 145
      Width = 75
      Height = 25
      Caption = 'Answer'
      TabOrder = 3
      OnClick = DoAnswer
    end
    object Button_NonDirectPark: TButton
      Left = 13
      Top = 214
      Width = 179
      Height = 25
      Caption = 'Nondirect Call'
      TabOrder = 4
      OnClick = DoNonDirectPark
    end
    object Button_Unpark: TButton
      Left = 13
      Top = 254
      Width = 179
      Height = 25
      Caption = 'Unpark Call'
      TabOrder = 5
      OnClick = DoUnpark
    end
    object Button_DirectPark: TButton
      Left = 13
      Top = 182
      Width = 179
      Height = 25
      Caption = 'Direct Park'
      TabOrder = 6
      OnClick = DoDirectPark
    end
    object Edit_DirAddress: TEdit
      Left = 344
      Top = 184
      Width = 121
      Height = 21
      TabOrder = 7
      Text = '1'
    end
    object Edit_UnparkAddress: TEdit
      Left = 344
      Top = 256
      Width = 121
      Height = 21
      TabOrder = 8
      Text = '1'
    end
    object Edit_ParkedAtAddress: TEdit
      Left = 344
      Top = 216
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 9
    end
  end
  object hbTapiLine1: ThbTapiLine
    CallOptions.GatherDigits.TerminationDigits = '*#'
    CallParams.Flags = 0
    OnCallState = hbTapiLine1CallState
    OnNewCall = hbTapiLine1NewCall
    OnCallDeallocate = hbTapiLine1CallDeallocate
    OnTapiTranslateChange = hbTapiLine1TapiTranslateChange
    Left = 216
    Top = 136
  end
end
