object Form1: TForm1
  Left = 192
  Top = 107
  Width = 470
  Height = 391
  Caption = 'Answering Machine - A hbTapi Sample'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object ListView_Journal: TListView
    Left = 0
    Top = 75
    Width = 462
    Height = 270
    Align = alClient
    Columns = <
      item
        Caption = 'Date/Time'
        Width = 120
      end
      item
        Caption = 'Caller'
        Width = 100
      end
      item
        Caption = 'Duration'
        Width = 100
      end
      item
        AutoSize = True
        Caption = 'File'
      end>
    TabOrder = 0
    ViewStyle = vsReport
    OnDblClick = ListView_JournalDblClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 462
    Height = 75
    Align = alTop
    TabOrder = 1
    object lbDevice: TLabel
      Left = 8
      Top = 10
      Width = 37
      Height = 13
      Caption = 'Device:'
    end
    object lbCaller: TLabel
      Left = 8
      Top = 32
      Width = 29
      Height = 13
      Caption = 'Caller:'
    end
    object lbFile: TLabel
      Left = 8
      Top = 55
      Width = 19
      Height = 13
      Caption = 'File:'
    end
    object SpeedButtonStop: TSpeedButton
      Left = 339
      Top = 51
      Width = 23
      Height = 22
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
        00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
        70E337F33333333337F3E0F33333333370E337F333FFFFF337F3E0F330000033
        70E337F3377777F337F3E0F33000003370E337F3377777F337F3E0F330000033
        70E337F3377777F337F3E0F33000003370E337F3377777F337F3E0F330000033
        70E337F33777773337F3E0F33333333370E337F33333333337F3E0F333333333
        70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
        00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
      NumGlyphs = 2
      Visible = False
      OnClick = SpeedButtonStopClick
    end
    object SpeedButton1: TSpeedButton
      Left = 309
      Top = 51
      Width = 21
      Height = 20
      Caption = '...'
      OnClick = SpeedButton1Click
    end
    object SpeedButtonPlay: TSpeedButton
      Left = 339
      Top = 51
      Width = 23
      Height = 22
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
        00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
        70E337F3333F333337F3E0F33303333370E337F3337FF33337F3E0F333003333
        70E337F33377FF3337F3E0F33300033370E337F333777FF337F3E0F333000033
        70E337F33377773337F3E0F33300033370E337F33377733337F3E0F333003333
        70E337F33377333337F3E0F33303333370E337F33373333337F3E0F333333333
        70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
        00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
      NumGlyphs = 2
      OnClick = SpeedButtonPlayClick
    end
    object ComboDeviceList: TComboBox
      Left = 50
      Top = 5
      Width = 280
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      OnChange = ComboDeviceListChange
    end
    object btnAction: TButton
      Left = 339
      Top = 25
      Width = 81
      Height = 22
      Caption = 'Make Call'
      Enabled = False
      TabOrder = 4
      OnClick = btnActionClick
    end
    object cbAutoAnswer: TCheckBox
      Left = 339
      Top = 6
      Width = 97
      Height = 17
      Caption = 'Auto Answer'
      TabOrder = 3
    end
    object edCall: TEdit
      Left = 50
      Top = 27
      Width = 280
      Height = 21
      TabOrder = 1
    end
    object edFile: TEdit
      Left = 50
      Top = 50
      Width = 256
      Height = 21
      TabOrder = 2
      Text = 'answer.wav'
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 345
    Width = 462
    Height = 19
    Panels = <
      item
        Width = 100
      end
      item
        Width = 50
      end>
  end
  object TapiLine: ThbTapiLine
    CallParams.Flags = 0
    OnCallState = TapiLineCallState
    OnConnected = TapiLineConnected
    OnIdle = TapiLineIdle
    OnOffering = TapiLineOffering
    OnCallerID = TapiLineCallerID
    Left = 160
    Top = 176
  end
  object WaveOut: ThbWaveOut
    Active = False
    BufferTime = 250
    Loop = False
    OnDone = WaveOutDone
    Left = 192
    Top = 176
  end
  object WaveIn: ThbWaveIn
    Active = False
    BufferTime = 250
    Left = 256
    Top = 176
  end
  object TimerToAnswer: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = TimerToAnswerTimer
    Left = 160
    Top = 208
  end
  object WaveOutSpeaker: ThbWaveOut
    Active = False
    BufferTime = 250
    Loop = False
    Playlist.Strings = (
      'ANSAGE.WAV')
    OnDone = WaveOutSpeakerDone
    Left = 224
    Top = 176
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'wav'
    Filter = 'wave (*.wav)|*.wav'
    Left = 192
    Top = 208
  end
end
