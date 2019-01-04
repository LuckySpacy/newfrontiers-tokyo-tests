object dm: Tdm
  OldCreateOrder = False
  Height = 209
  Width = 399
  object IBD: TIBDatabase
    DatabaseName = 'localhost:c:\Datenbank\Demo4.fdb'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    ServerType = 'IBServer'
    SQLDialect = 1
    AllowStreamedConnected = False
    Left = 32
    Top = 16
  end
  object IBT: TIBTransaction
    DefaultDatabase = IBD
    Params.Strings = (
      'nowait')
    Left = 144
    Top = 16
  end
end
