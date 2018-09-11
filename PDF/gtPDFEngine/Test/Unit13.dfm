object Form13: TForm13
  Left = 0
  Top = 0
  Caption = 'Form13'
  ClientHeight = 178
  ClientWidth = 320
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btn_Print: TButton
    Left = 24
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Print'
    TabOrder = 0
    OnClick = btn_PrintClick
  end
  object btn_PDF: TButton
    Left = 24
    Top = 72
    Width = 75
    Height = 25
    Caption = 'PDF'
    TabOrder = 1
    OnClick = btn_PDFClick
  end
  object frxReport1: TfrxReport
    Version = '5.6.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41865.539958252320000000
    ReportOptions.LastChange = 41865.539958252320000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 248
    Top = 32
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxRichObject1: TfrxRichObject
    Left = 136
    Top = 128
  end
end
