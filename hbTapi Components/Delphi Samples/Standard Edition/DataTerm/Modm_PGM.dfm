object Modm: TModm
  Left = 211
  Top = 204
  Width = 630
  Height = 300
  Caption = 'Modem:  Offline'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -13
  Font.Name = 'Courier New'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object MemoMain: TMemo
    Left = 0
    Top = 0
    Width = 606
    Height = 257
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    HideSelection = False
    Lines.Strings = (
      '')
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
    OnKeyPress = MyKeyPress
  end
  object MainMenu: TMainMenu
    Left = 39
    Top = 106
    object menuLine: TMenuItem
      Caption = 'Line'
      object menuOnLine: TMenuItem
        Caption = 'OnLine'
        OnClick = menuOnLineClick
      end
      object menuOffline: TMenuItem
        Caption = 'OffLine'
        Checked = True
        OnClick = menuOfflineClick
      end
      object menuExit: TMenuItem
        Caption = 'Exit'
        OnClick = menuExitClick
      end
    end
    object menuChange: TMenuItem
      Caption = 'Change'
      object menuPort: TMenuItem
        Caption = 'Port'
        object menuCOM1: TMenuItem
          Caption = 'COM1'
          OnClick = menuCOM1Click
        end
        object menuCOM2: TMenuItem
          Caption = 'COM2'
          OnClick = menuCOM2Click
        end
        object menuCOM3: TMenuItem
          Caption = 'COM3'
          OnClick = menuCOM3Click
        end
        object menuCOM4: TMenuItem
          Caption = 'COM4'
          OnClick = menuCOM4Click
        end
      end
      object menuBaud: TMenuItem
        Caption = 'Baud'
        object menu300: TMenuItem
          Caption = '300'
          OnClick = menu300Click
        end
        object menu1200: TMenuItem
          Caption = '1200'
          OnClick = menu1200Click
        end
        object menu2400: TMenuItem
          Caption = '2400'
          OnClick = menu2400Click
        end
        object menu4800: TMenuItem
          Caption = '4800'
          OnClick = menu4800Click
        end
        object menu9600: TMenuItem
          Caption = '9600'
          OnClick = menu9600Click
        end
        object menu19200: TMenuItem
          Caption = '19200'
          OnClick = menu19200Click
        end
        object menu38400: TMenuItem
          Caption = '38400'
          OnClick = menu38400Click
        end
        object menu57600: TMenuItem
          Caption = '57600'
          OnClick = menu57600Click
        end
      end
      object menuDataBits: TMenuItem
        Caption = 'DataBits'
        object menuSeven: TMenuItem
          Caption = 'Seven'
          OnClick = menuSevenClick
        end
        object menuEight: TMenuItem
          Caption = 'Eight'
          OnClick = menuEightClick
        end
      end
      object menuParity: TMenuItem
        Caption = 'Parity'
        object menuNone: TMenuItem
          Caption = 'None'
          OnClick = menuNoneClick
        end
        object menuEven: TMenuItem
          Caption = 'Even'
          OnClick = menuEvenClick
        end
        object menuOdd: TMenuItem
          Caption = 'Odd'
          OnClick = menuOddClick
        end
      end
      object menuStopBits: TMenuItem
        Caption = 'StopBits'
        object menuOne: TMenuItem
          Caption = '1'
          OnClick = menuOneClick
        end
        object menuOne5: TMenuItem
          Caption = '1.5'
          OnClick = menuOne5Click
        end
        object menuTwo: TMenuItem
          Caption = '2'
          OnClick = menuTwoClick
        end
      end
    end
    object menuStatus: TMenuItem
      Caption = 'Status'
      Enabled = False
      OnClick = Status
    end
    object menuControl: TMenuItem
      Caption = 'Control'
      Enabled = False
      object menuDTR: TMenuItem
        Caption = 'DTR'
        object menuDTRset: TMenuItem
          Caption = 'Set'
          OnClick = menuDTRsetClick
        end
        object menuDTRclear: TMenuItem
          Caption = 'Clear'
          Checked = True
          OnClick = menuDTRclearClick
        end
      end
      object menuRTS: TMenuItem
        Caption = 'RTS'
        object menuRTSset: TMenuItem
          Caption = 'Set'
          OnClick = menuRTSsetClick
        end
        object menuRTSclear: TMenuItem
          Caption = 'Clear'
          Checked = True
          OnClick = menuRTSclearClick
        end
      end
    end
    object menuFlowControl: TMenuItem
      Caption = 'FlowControl'
      Enabled = False
      object menuHardware: TMenuItem
        Caption = 'Hardware'
        OnClick = menuHardwareClick
      end
      object menuSoftware: TMenuItem
        Caption = 'Software'
        OnClick = menuSoftwareClick
      end
      object menuNoFlow: TMenuItem
        Caption = 'None'
        Checked = True
        OnClick = menuNoFlowClick
      end
    end
  end
  object Timer: TTimer
    Interval = 50
    OnTimer = TimerTimer
    Left = 111
    Top = 105
  end
  object ComPort1: ThbComPort
    Active = False
    DTR = True
    FlowControl = []
    Handle = -1
    MonitorEvents = [evBreak, evCts, evDsr, evError, evRing, evRlsd, evRxChar, evRxFlag, evTxEmpty]
    Options = []
    PortName = 'COM1'
    ReadTimeout = 3000
    RTS = True
    WriteTimeout = 3000
    OnDSR = ComPort1DSR
    Left = 168
    Top = 104
  end
end
