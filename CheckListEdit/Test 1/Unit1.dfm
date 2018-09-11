object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 557
  ClientWidth = 635
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
  object edt: TCheckListEdit
    Left = 24
    Top = 34
    Width = 385
    Height = 21
    TabOrder = 0
    OnClick = edtClick
    AutoDropWidthSize = False
    DropWidth = 121
    DropFont.Charset = DEFAULT_CHARSET
    DropFont.Color = clWindowText
    DropFont.Height = -11
    DropFont.Name = 'Tahoma'
    DropFont.Style = []
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -11
    LabelFont.Name = 'Tahoma'
    LabelFont.Style = []
    TextDelimiter = ','
    TextEndChar = ']'
    TextStartChar = '['
    OnClickBtn = edtClickBtn
    OnClickCheck = edtClickCheck
    OnTextToCheckListItem = edtTextToCheckListItem
    OnCheckListItemToText = edtCheckListItemToText
    Version = '1.4.0.3'
    OnShowCheckList = edtShowCheckList
  end
  object Button1: TButton
    Left = 456
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object mem: TMemo
    Left = 24
    Top = 280
    Width = 577
    Height = 217
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      'mem')
    ParentFont = False
    TabOrder = 2
  end
  object CheckListBox1: TCheckListBox
    Left = 24
    Top = 104
    Width = 121
    Height = 97
    ItemHeight = 13
    TabOrder = 3
  end
  object ComboBoxEx1: TComboBoxEx
    Left = 264
    Top = 120
    Width = 145
    Height = 22
    ItemsEx = <>
    TabOrder = 4
    Text = 'ComboBoxEx1'
  end
  object ComboBox1: TComboBox
    Left = 264
    Top = 148
    Width = 281
    Height = 22
    Style = csOwnerDrawFixed
    TabOrder = 5
    OnDrawItem = ComboBox1DrawItem
    OnSelect = ComboBox1Select
    Items.Strings = (
      'Test 1'
      'Test 2'
      'Test 3'
      'Test 4'
      'Test 5'
      'Test 6'
      'Test 7'
      'Test 8'
      'Test 9')
  end
end
