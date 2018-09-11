object Form1: TForm1
  Left = 192
  Top = 107
  Width = 387
  Height = 383
  Caption = 'WavePlayer - A hbTapi Sample'
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
  object SpeedButton_No1: TSpeedButton
    Tag = 1
    Left = 296
    Top = 39
    Width = 23
    Height = 22
    Caption = '1'
    OnClick = DoPlayNo
  end
  object SpeedButton_No2: TSpeedButton
    Tag = 2
    Left = 320
    Top = 39
    Width = 23
    Height = 22
    Caption = '2'
    OnClick = DoPlayNo
  end
  object SpeedButton_No3: TSpeedButton
    Tag = 3
    Left = 344
    Top = 39
    Width = 23
    Height = 22
    Caption = '3'
    OnClick = DoPlayNo
  end
  object SpeedButton_No4: TSpeedButton
    Tag = 4
    Left = 296
    Top = 63
    Width = 23
    Height = 22
    Caption = '4'
    OnClick = DoPlayNo
  end
  object SpeedButton_No5: TSpeedButton
    Tag = 5
    Left = 320
    Top = 63
    Width = 23
    Height = 22
    Caption = '5'
    OnClick = DoPlayNo
  end
  object SpeedButton_No6: TSpeedButton
    Tag = 6
    Left = 344
    Top = 63
    Width = 23
    Height = 22
    Caption = '6'
    OnClick = DoPlayNo
  end
  object SpeedButton_No7: TSpeedButton
    Tag = 7
    Left = 296
    Top = 87
    Width = 23
    Height = 22
    Caption = '7'
    OnClick = DoPlayNo
  end
  object SpeedButton_No8: TSpeedButton
    Tag = 8
    Left = 320
    Top = 87
    Width = 23
    Height = 22
    Caption = '8'
    OnClick = DoPlayNo
  end
  object SpeedButton_No9: TSpeedButton
    Tag = 9
    Left = 344
    Top = 87
    Width = 23
    Height = 22
    Caption = '9'
    OnClick = DoPlayNo
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 37
    Height = 13
    Caption = 'Device:'
  end
  object Button_Beep: TButton
    Left = 296
    Top = 151
    Width = 75
    Height = 25
    Caption = 'Beep'
    TabOrder = 0
    OnClick = Button_BeepClick
  end
  object Button_Play123: TButton
    Left = 296
    Top = 119
    Width = 75
    Height = 25
    Caption = '1,2,3'
    TabOrder = 1
    OnClick = Button_Play123Click
  end
  object Button_Stopm: TButton
    Left = 296
    Top = 319
    Width = 75
    Height = 25
    Caption = 'Stop'
    TabOrder = 2
    OnClick = Button_StopClick
  end
  object ListBox1: TListBox
    Left = 4
    Top = 32
    Width = 285
    Height = 317
    ItemHeight = 13
    TabOrder = 3
  end
  object Button_Empty: TButton
    Left = 296
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Empty Playlist'
    TabOrder = 4
    OnClick = Button_EmptyClick
  end
  object Button_Empty2: TButton
    Left = 296
    Top = 216
    Width = 75
    Height = 25
    Caption = 'Empty Entry'
    TabOrder = 5
    OnClick = Button_Empty2Click
  end
  object Button_Error: TButton
    Left = 296
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Error'
    TabOrder = 6
    OnClick = Button_ErrorClick
  end
  object ComboBox1: TComboBox
    Left = 64
    Top = 5
    Width = 224
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 7
    OnChange = ComboBox1Change
  end
  object Button_Info: TButton
    Left = 296
    Top = 4
    Width = 75
    Height = 25
    Caption = 'Info'
    TabOrder = 8
    OnClick = Button_InfoClick
  end
  object hbWaveOut1: ThbWaveOut
    Active = False
    BufferTime = 250
    DeviceName = 'VIA AC'#39'97 Audio (WAVE)'
    Loop = False
    OnDone = WaveOut1Done
    OnWaveError = WaveOut1WaveError
    Left = 136
    Top = 160
  end
end
