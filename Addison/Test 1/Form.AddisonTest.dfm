object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 537
  ClientWidth = 430
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 430
    Height = 41
    Align = alTop
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 0
    object btn_Connect: TButton
      Left = 16
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Connect'
      TabOrder = 0
      OnClick = btn_ConnectClick
    end
    object btn_OpEinlesen: TButton
      Left = 97
      Top = 10
      Width = 75
      Height = 25
      Caption = 'OP-Einlesen'
      TabOrder = 1
      OnClick = btn_OpEinlesenClick
    end
  end
  object mem: TMemo
    Left = 0
    Top = 41
    Width = 430
    Height = 496
    Align = alClient
    Lines.Strings = (
      'mem')
    TabOrder = 1
    ExplicitTop = 47
  end
end
