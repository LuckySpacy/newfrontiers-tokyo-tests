object frmSepaModul: TfrmSepaModul
  Left = 0
  Top = 0
  Caption = 'Sepa Modul'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 16
    Top = 8
    Width = 177
    Height = 25
    Caption = 'Starte Sepa'#252'berweisungen'
    TabOrder = 0
    OnClick = Button1Click
  end
end
