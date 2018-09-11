object Form1: TForm1
  Left = 191
  Top = 106
  Width = 383
  Height = 381
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
  object SpeedButton1: TSpeedButton
    Tag = 1
    Left = 296
    Top = 39
    Width = 23
    Height = 22
    Caption = '1'
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Tag = 2
    Left = 320
    Top = 39
    Width = 23
    Height = 22
    Caption = '2'
    OnClick = SpeedButton1Click
  end
  object SpeedButton3: TSpeedButton
    Tag = 3
    Left = 344
    Top = 39
    Width = 23
    Height = 22
    Caption = '3'
    OnClick = SpeedButton1Click
  end
  object SpeedButton4: TSpeedButton
    Tag = 4
    Left = 296
    Top = 63
    Width = 23
    Height = 22
    Caption = '4'
    OnClick = SpeedButton1Click
  end
  object SpeedButton5: TSpeedButton
    Tag = 5
    Left = 320
    Top = 63
    Width = 23
    Height = 22
    Caption = '5'
    OnClick = SpeedButton1Click
  end
  object SpeedButton6: TSpeedButton
    Tag = 6
    Left = 344
    Top = 63
    Width = 23
    Height = 22
    Caption = '6'
    OnClick = SpeedButton1Click
  end
  object SpeedButton7: TSpeedButton
    Tag = 7
    Left = 296
    Top = 87
    Width = 23
    Height = 22
    Caption = '7'
    OnClick = SpeedButton1Click
  end
  object SpeedButton8: TSpeedButton
    Tag = 8
    Left = 320
    Top = 87
    Width = 23
    Height = 22
    Caption = '8'
    OnClick = SpeedButton1Click
  end
  object SpeedButton9: TSpeedButton
    Tag = 9
    Left = 344
    Top = 87
    Width = 23
    Height = 22
    Caption = '9'
    OnClick = SpeedButton1Click
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 37
    Height = 13
    Caption = 'Device:'
  end
  object Button1: TButton
    Left = 296
    Top = 151
    Width = 75
    Height = 25
    Caption = 'Beep'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 296
    Top = 119
    Width = 75
    Height = 25
    Caption = '1,2,3'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 296
    Top = 319
    Width = 75
    Height = 25
    Caption = 'Stop'
    TabOrder = 2
    OnClick = Button3Click
  end
  object ListBox1: TListBox
    Left = 4
    Top = 32
    Width = 285
    Height = 317
    ItemHeight = 13
    TabOrder = 3
  end
  object Button4: TButton
    Left = 296
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Empty Playlist'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 296
    Top = 216
    Width = 75
    Height = 25
    Caption = 'Empty Entry'
    TabOrder = 5
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 296
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Error'
    TabOrder = 6
    OnClick = Button6Click
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
  object Button7: TButton
    Left = 296
    Top = 4
    Width = 75
    Height = 25
    Caption = 'Info'
    TabOrder = 8
    OnClick = Button7Click
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
