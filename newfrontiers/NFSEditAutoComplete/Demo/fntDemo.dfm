object Form15: TForm15
  Left = 0
  Top = 0
  Caption = 'Demo'
  ClientHeight = 225
  ClientWidth = 467
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
  object Label1: TLabel
    Left = 29
    Top = 19
    Width = 32
    Height = 13
    Caption = 'Stra'#223'e'
  end
  object Label2: TLabel
    Left = 8
    Top = 59
    Width = 59
    Height = 13
    Caption = 'Stra'#223'e mit A'
  end
  object nfsEditAutoComplete1: TnfsEditAutoComplete
    Left = 73
    Top = 16
    Width = 225
    Height = 21
    AutoSelect = False
    TabOrder = 0
    Text = 'nfsEditAutoComplete1'
    OnGetList = nfsEditAutoComplete1GetList
    SearchInterrupt = 500
    SearchByLetters = 1
    MaxItems = 0
    CaseSensitive = False
  end
  object nfsEditAutoComplete2: TnfsEditAutoComplete
    Left = 73
    Top = 56
    Width = 225
    Height = 21
    AutoSelect = False
    TabOrder = 1
    Text = 'nfsEditAutoComplete1'
    OnGetList = nfsEditAutoComplete1GetList
    SearchInterrupt = 500
    SearchByLetters = 1
    MaxItems = 0
    CaseSensitive = False
  end
  object IBD_Post: TIBDatabase
    DatabaseName = '172.16.10.17:e:\datenbank\post.fdb'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    ServerType = 'IBServer'
    Left = 136
    Top = 88
  end
  object Trans: TIBTransaction
    DefaultDatabase = IBD_Post
    Left = 128
    Top = 152
  end
  object qry: TIBQuery
    Database = IBD_Post
    Transaction = Trans
    Left = 176
    Top = 80
  end
end
