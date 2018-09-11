object Form1: TForm1
  Left = 318
  Top = 133
  Width = 509
  Height = 600
  Caption = 'Transfer - A hbTapi Sample'
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
    Left = 4
    Top = 6
    Width = 493
    Height = 67
    Caption = 'Telephony Line Device:'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 30
      Width = 37
      Height = 13
      Caption = 'Device:'
    end
    object Label_Active: TLabel
      Left = 408
      Top = 30
      Width = 37
      Height = 13
      Caption = 'Active'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object ComboBoxDevice: TComboBox
      Left = 93
      Top = 26
      Width = 300
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = ComboBoxDeviceChange
    end
  end
  object GroupBox2: TGroupBox
    Left = 3
    Top = 83
    Width = 494
    Height = 303
    Caption = 'Calls'
    TabOrder = 1
    object Label2: TLabel
      Left = 232
      Top = 194
      Width = 57
      Height = 13
      Caption = 'To Address:'
    end
    object Label3: TLabel
      Left = 232
      Top = 266
      Width = 67
      Height = 13
      Caption = 'From Address:'
    end
    object Label4: TLabel
      Left = 232
      Top = 226
      Width = 90
      Height = 13
      Caption = 'Parked at Address:'
    end
    object ButtonDrop: TButton
      Left = 230
      Top = 150
      Width = 100
      Height = 25
      Caption = 'Drop'
      TabOrder = 0
      OnClick = DoDrop
    end
    object ButtonDial: TButton
      Left = 13
      Top = 150
      Width = 100
      Height = 25
      Caption = 'MakeCall'
      TabOrder = 1
      OnClick = DoMakeCall
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
          Caption = 'State'
          Width = 80
        end
        item
          Caption = 'Privilege'
          Width = 80
        end
        item
          Caption = 'MediaMode(s)'
          Width = 200
        end>
      ReadOnly = True
      RowSelect = True
      TabOrder = 2
      ViewStyle = vsReport
    end
    object ButtonAnswer: TButton
      Left = 122
      Top = 150
      Width = 100
      Height = 25
      Caption = 'Answer'
      TabOrder = 3
      OnClick = DoAnswer
    end
    object Button_NonDirectPark: TButton
      Left = 13
      Top = 220
      Width = 179
      Height = 25
      Caption = 'Nondirect Call'
      TabOrder = 4
      OnClick = DoNonDirectPark
    end
    object Button_Unpark: TButton
      Left = 13
      Top = 260
      Width = 179
      Height = 25
      Caption = 'Unpark Call'
      TabOrder = 5
      OnClick = Button_UnparkClick
    end
    object Button_DirectPark: TButton
      Left = 13
      Top = 188
      Width = 179
      Height = 25
      Caption = 'Direct Park'
      TabOrder = 6
      OnClick = DoDirectPark
    end
    object Edit_DirAddress: TEdit
      Left = 344
      Top = 190
      Width = 121
      Height = 21
      TabOrder = 7
      Text = '1'
    end
    object Edit_UnparkAddress: TEdit
      Left = 344
      Top = 262
      Width = 121
      Height = 21
      TabOrder = 8
      Text = '1'
    end
    object Edit_ParkedAtAddress: TEdit
      Left = 344
      Top = 222
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 9
    end
  end
  object ListBox1: TListBox
    Left = 8
    Top = 416
    Width = 489
    Height = 153
    ItemHeight = 13
    Items.Strings = (
      '<DblClick to clear>')
    TabOrder = 2
    OnDblClick = ListBox1DblClick
  end
  object hbTapiLine1: ThbTapiLine
    DeviceName = 'Hicom Systemtelefon'
    CallOptions.GatherDigits.TerminationDigits = '*#'
    CallParams.Flags = 0
    MediaModes = 20
    Options.ReplyTimeout = 10000
    OnCallState = hbTapiLine1CallState
    OnCallDeallocate = hbTapiLine1CallDeallocate
    Left = 232
    Top = 176
  end
end
