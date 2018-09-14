object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 150
  Width = 215
  object db: TIBDatabase
    ServerType = 'IBServer'
    AfterConnect = dbAfterConnect
    Left = 56
    Top = 48
  end
end
