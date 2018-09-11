object Form1: TForm1
  Left = 195
  Top = 110
  Caption = 'DataComm - A hbTapi Sample'
  ClientHeight = 387
  ClientWidth = 694
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
  object Label10: TLabel
    Left = 536
    Top = 120
    Width = 38
    Height = 13
    Caption = 'Label10'
  end
  object GroupBox1: TGroupBox
    Left = 4
    Top = 3
    Width = 493
    Height = 60
    Caption = 'Telephony Line Device:'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 27
      Width = 65
      Height = 13
      Caption = 'DeviceName:'
    end
    object ComboBoxDevice: TComboBox
      Left = 93
      Top = 23
      Width = 312
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = ComboBoxDeviceChange
    end
    object CheckBoxActive: TCheckBox
      Left = 416
      Top = 25
      Width = 57
      Height = 17
      Caption = 'Active'
      TabOrder = 1
      OnClick = CheckBoxActiveClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 4
    Top = 68
    Width = 493
    Height = 113
    Caption = 'Call:'
    TabOrder = 1
    object Label2: TLabel
      Left = 16
      Top = 20
      Width = 33
      Height = 13
      Caption = 'Status:'
    end
    object Label_CallState: TLabel
      Left = 96
      Top = 20
      Width = 377
      Height = 13
      AutoSize = False
      Caption = 'NO CALL'
    end
    object Label9: TLabel
      Left = 16
      Top = 44
      Width = 21
      Height = 13
      Caption = 'Info:'
    end
    object Label_Info: TLabel
      Left = 96
      Top = 44
      Width = 377
      Height = 13
      AutoSize = False
      Caption = 'NO AVAILABLE'
    end
    object Label4: TLabel
      Left = 295
      Top = 80
      Width = 41
      Height = 13
      Caption = 'Timeout:'
    end
    object Label5: TLabel
      Left = 414
      Top = 80
      Width = 17
      Height = 13
      Caption = 'sec'
    end
    object Label8: TLabel
      Left = 288
      Top = 34
      Width = 48
      Height = 13
      Caption = 'PhoneNo:'
    end
    object ButtonDrop: TButton
      Left = 182
      Top = 76
      Width = 75
      Height = 25
      Caption = 'Drop'
      TabOrder = 0
      OnClick = DoDrop
    end
    object EditCallPhoneNumber: TEdit
      Left = 344
      Top = 30
      Width = 113
      Height = 21
      TabOrder = 1
      Text = '102'
    end
    object ButtonDial: TButton
      Left = 16
      Top = 76
      Width = 83
      Height = 25
      Caption = 'MakeCall'
      TabOrder = 2
      OnClick = DoMakeCall
    end
    object ButtonAnswer: TButton
      Left = 103
      Top = 76
      Width = 75
      Height = 25
      Caption = 'Answer'
      TabOrder = 3
      OnClick = DoAnswer
    end
    object CheckBox1: TCheckBox
      Left = 344
      Top = 56
      Width = 97
      Height = 17
      Caption = 'AutoAnswer'
      TabOrder = 4
    end
    object ComboBox_Timeout: TComboBox
      Left = 343
      Top = 76
      Width = 65
      Height = 21
      ItemHeight = 13
      TabOrder = 5
      Items.Strings = (
        '10'
        '30'
        '60'
        '120')
    end
  end
  object GroupBox3: TGroupBox
    Left = 4
    Top = 188
    Width = 493
    Height = 193
    Caption = 'Terminal:'
    TabOrder = 2
    object Label3: TLabel
      Left = 11
      Top = 24
      Width = 33
      Height = 13
      Caption = 'Status:'
    end
    object Label_Com: TLabel
      Left = 96
      Top = 24
      Width = 76
      Height = 13
      Caption = 'NO AVAILABLE'
    end
    object Label6: TLabel
      Left = 11
      Top = 72
      Width = 64
      Height = 13
      Caption = 'Sended data:'
    end
    object Label7: TLabel
      Left = 249
      Top = 72
      Width = 73
      Height = 13
      Caption = 'Received data:'
    end
    object Edit1: TEdit
      Left = 11
      Top = 44
      Width = 150
      Height = 21
      TabOrder = 0
      Text = 'Hello World'
    end
    object ButtonSend: TButton
      Left = 168
      Top = 42
      Width = 75
      Height = 25
      Caption = 'Send'
      TabOrder = 1
      OnClick = ButtonSendClick
    end
    object ListBox1: TListBox
      Left = 10
      Top = 88
      Width = 231
      Height = 97
      ItemHeight = 13
      Items.Strings = (
        '<DblClick to clear>')
      TabOrder = 2
      OnDblClick = DoClearList
    end
    object ListBox2: TListBox
      Left = 248
      Top = 88
      Width = 233
      Height = 97
      ItemHeight = 13
      Items.Strings = (
        '<DblClick to clear>')
      TabOrder = 3
      OnDblClick = DoClearList
    end
  end
  object GroupBox4: TGroupBox
    Left = 504
    Top = 3
    Width = 185
    Height = 379
    Caption = 'Log:'
    TabOrder = 3
    object ListBox_Log: TListBox
      Left = 8
      Top = 18
      Width = 169
      Height = 353
      ItemHeight = 13
      Items.Strings = (
        '<DblClick to clear>')
      TabOrder = 0
      OnDblClick = DoClearList
    end
  end
  object hbTapiLine1: ThbTapiLine
    CallOptions.GatherDigits.TerminationDigits = '*#'
    CallParams.Flags = 0
    OnCallState = hbTapiLine1CallState
    OnCallDeallocate = hbTapiLine1CallDeallocate
    Left = 520
    Top = 96
  end
  object ComPort1: ThbComPort
    Active = False
    DTR = True
    Parity = 0
    PortName = 'COM1'
    RTS = True
    Timeouts.Enabled = False
    Timeouts.ReadIntervalTimeout = -1
    Timeouts.ReadTotalTimeoutMultiplier = 0
    Timeouts.ReadTotalTimeoutConstant = 3000
    Timeouts.WriteTotalTimeoutMultiplier = 0
    Timeouts.WriteTotalTimeoutConstant = 3000
    OnReceive = ComPort1Receive
    Left = 552
    Top = 96
  end
end
