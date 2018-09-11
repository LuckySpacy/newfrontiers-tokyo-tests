object Form17: TForm17
  Left = 0
  Top = 0
  Caption = 'Form17'
  ClientHeight = 406
  ClientWidth = 1059
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object grd: TStringGrid
    Left = 0
    Top = 0
    Width = 1059
    Height = 406
    Align = alClient
    ColCount = 3
    DefaultRowHeight = 21
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
    TabOrder = 0
    ExplicitWidth = 449
    ExplicitHeight = 481
  end
  object DataFormatAdapterTarget: TDataFormatAdapter
    DragDropComponent = DropFileTarget1
    DataFormatName = 'TVirtualFileStreamDataFormat'
    Enabled = False
    Left = 80
    Top = 280
  end
  object DropFileTarget1: TDropFileTarget
    DragTypes = [dtCopy, dtLink]
    OnDrop = DropFileTarget1Drop
    OptimizedMove = True
    Left = 224
    Top = 208
  end
end
